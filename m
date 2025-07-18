Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49202C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTswRIxHmGHQeVnB/f9odmxm7RsTWTBKCzGSB4iSFqo=; b=3V8HC1P290Sm2SNBf2b7JCETHl
	Y6S7v1RVL8KhUkToMrQqnb+DU61COcZqOKtmNHzV0lEaN7DgaeJh+u2e4LdFsXrzPLg9Eb/qVy0Lz
	pLFZE8JK0jRn2YZD/pXasH18rBMnkQYizrvY43F4osSIPFuP9WC8iW4KCaE/xIQXcWWOCbrTNm3FQ
	B+tP2r3ivYfCTgyc/Uu7JWVqpVWF6aiNH0gqCew+rX4qNdw3/54+8fQC45icaDKIAkWesdULJix5Y
	12cYdLHarka2nQn3DAmPmYjPfU8Y3JuE8W/DDipkF4e5uAXGBoXeZtoN4y97DyIfWKyuGTz/Qym3j
	xBHCHtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchEF-0000000C9dR-0FnM;
	Fri, 18 Jul 2025 09:18:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch0J-0000000C7RS-3LLT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:03:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09EBF1A32;
	Fri, 18 Jul 2025 02:03:36 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53D8E3F66E;
	Fri, 18 Jul 2025 02:03:35 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v5 5/7] mm: Split can_change_pte_writable() into private and shared parts
Date: Fri, 18 Jul 2025 14:32:42 +0530
Message-Id: <20250718090244.21092-6-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250718090244.21092-1-dev.jain@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_020343_909188_20CC593F 
X-CRM114-Status: GOOD (  11.01  )
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

In preparation for patch 6 and modularizing the code in general, split
can_change_pte_writable() into private and shared VMA parts. No functional
change intended.

Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 50 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 4977f198168e..a1c7d8a4648d 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,11 +40,8 @@
 
 #include "internal.h"
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
+static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_t pte)
 {
-	struct page *page;
-
 	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
 		return false;
 
@@ -60,16 +57,32 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	if (userfaultfd_pte_wp(vma, pte))
 		return false;
 
-	if (!(vma->vm_flags & VM_SHARED)) {
-		/*
-		 * Writable MAP_PRIVATE mapping: We can only special-case on
-		 * exclusive anonymous pages, because we know that our
-		 * write-fault handler similarly would map them writable without
-		 * any additional checks while holding the PT lock.
-		 */
-		page = vm_normal_page(vma, addr, pte);
-		return page && PageAnon(page) && PageAnonExclusive(page);
-	}
+	return true;
+}
+
+static bool can_change_private_pte_writable(struct vm_area_struct *vma,
+					    unsigned long addr, pte_t pte)
+{
+	struct page *page;
+
+	if (!maybe_change_pte_writable(vma, pte))
+		return false;
+
+	/*
+	 * Writable MAP_PRIVATE mapping: We can only special-case on
+	 * exclusive anonymous pages, because we know that our
+	 * write-fault handler similarly would map them writable without
+	 * any additional checks while holding the PT lock.
+	 */
+	page = vm_normal_page(vma, addr, pte);
+	return page && PageAnon(page) && PageAnonExclusive(page);
+}
+
+static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
+					   pte_t pte)
+{
+	if (!maybe_change_pte_writable(vma, pte))
+		return false;
 
 	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
 
@@ -83,6 +96,15 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }
 
+bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte)
+{
+	if (!(vma->vm_flags & VM_SHARED))
+		return can_change_private_pte_writable(vma, addr, pte);
+
+	return can_change_shared_pte_writable(vma, pte);
+}
+
 static int mprotect_folio_pte_batch(struct folio *folio, pte_t *ptep,
 				    pte_t pte, int max_nr_ptes)
 {
-- 
2.30.2


