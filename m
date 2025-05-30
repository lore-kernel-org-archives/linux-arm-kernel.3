Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB96C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEMUQQZUL2fjTR0/QHgYz5UYqcVXbfNX4AYnY/4uPmQ=; b=xUiePW1c5iO0/g0TNog2XEn6eo
	1Pr7m1MCAn9CjQoF+StcyO5JBDJWj5kW7Ujeeqw/gVOt7oEFgXi7stVFc6FIggTNKwkdjzTb+coA1
	M9VFdKoAuwvAyhJewRrti/hfzdPz0twtAy+m0aInUx6BkmWKvFcoIP2pJGmmwBRqT8s9rylkr195P
	9EsIPFbl3kZrofsM6uNzQt5mUCH+liMJxmjSszTkZ6mnp0HrbAgi83knAOIxeNZdLYxhnf0jRUTUI
	hvQ0MCWRpWmZwjWoZfL9s9bVIr5oXsp2Tfo9fSHCZ2v71ROBj0rQXnX4ogBziK5svPtwR3WuHppul
	nzaTMZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvlc-000000005Fh-08Jc;
	Fri, 30 May 2025 09:11:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvfP-000000004NT-0uUV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:04:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CDAC16F2;
	Fri, 30 May 2025 02:04:26 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9ED583F5A1;
	Fri, 30 May 2025 02:04:37 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/3] arm64: pageattr: Use walk_page_range_novma() to change memory permissions
Date: Fri, 30 May 2025 14:34:06 +0530
Message-Id: <20250530090407.19237-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020443_344870_7E852DBB 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move away from apply_to_page_range(), which does not honour leaf mappings,
to walk_page_range_novma(). The callbacks emit a warning and return EINVAL
if a partial range is detected.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 69 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..a5c829c64969 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -8,6 +8,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
+#include <linux/pagewalk.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -20,6 +21,67 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
+static pteval_t set_pageattr_masks(unsigned long val, struct mm_walk *walk)
+{
+	struct page_change_data *masks = walk->private;
+	unsigned long new_val = val;
+
+	new_val &= ~(pgprot_val(masks->clear_mask));
+	new_val |= (pgprot_val(masks->set_mask));
+
+	return new_val;
+}
+
+static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pud_t val = pudp_get(pud);
+
+	if (pud_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
+			return -EINVAL;
+		val = __pud(set_pageattr_masks(pud_val(val), walk));
+		set_pud(pud, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pmd_t val = pmdp_get(pmd);
+
+	if (pmd_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
+			return -EINVAL;
+		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
+		set_pmd(pmd, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pte_t val = ptep_get(pte);
+
+	val = __pte(set_pageattr_masks(pte_val(val), walk));
+	set_pte(pte, val);
+
+	return 0;
+}
+
+static const struct mm_walk_ops pageattr_ops = {
+	.pud_entry	= pageattr_pud_entry,
+	.pmd_entry	= pageattr_pmd_entry,
+	.pte_entry	= pageattr_pte_entry,
+	.walk_lock	= PGWALK_NOLOCK,
+};
+
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
 
 bool can_set_direct_map(void)
@@ -49,9 +111,6 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 	return 0;
 }
 
-/*
- * This function assumes that the range is mapped with PAGE_SIZE pages.
- */
 static int __change_memory_common(unsigned long start, unsigned long size,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
@@ -61,8 +120,8 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
-					&data);
+	ret = walk_page_range_novma(&init_mm, start, start + size,
+				    &pageattr_ops, NULL, &data);
 
 	/*
 	 * If the memory is being made valid without changing any other bits
-- 
2.30.2


