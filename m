Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D55FE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnhguXoH5f/gzWJpTgSeKyxUKNVSbH3M4baDMDbBb1o=; b=vDl4LAj3+Bul46JxDx6fnA1D45
	SiLZBOa8IbLVcfOlBHCb58Wnh8KoY/HuxDebuAJxGgHhsgMuqqE+v555+Z7LcTO20FAfPgqT013mg
	ajNVXe/4y3YnJBQz5ad1R6EFhyWm6Bn6ap50aI4LCM2iTH42657zK2/NNe/QtrDyop43kmLf869eA
	VzC7aH6tjjYize0PHuwFEefUg7TdzDrWVo9IQgAs2foFbgkMnybznBR1z8aaUtBv1mmNkdfrZlb3Z
	d7VWl7CRGNSHRDAJt4ey6ObuprRcXNTO9hse6baBhUbPMatrhcB4Oe0Q4Z/P5yP2tF3OsKVq8eT3+
	0olYgzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVY4-00000001HWs-0kKq;
	Fri, 06 Dec 2024 10:27:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVLL-00000001DPD-3f54
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58708169E;
	Fri,  6 Dec 2024 02:14:19 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED083F7D8;
	Fri,  6 Dec 2024 02:13:48 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 12/16] arm64: mm: Map p4d/pgd with privileged pkey
Date: Fri,  6 Dec 2024 10:11:06 +0000
Message-ID: <20241206101110.1646108-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021352_004776_0A865429 
X-CRM114-Status: GOOD (  11.55  )
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

If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map p4d/pgd pages
using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that they can
only be written under guard(kpkeys_hardened_pgtables).

The case where pgd is not page-sized is not currently handled -
this is pending support for pkeys in kmem_cache.

This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
(default).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgalloc.h | 21 ++++++++++++++++++---
 arch/arm64/mm/pgd.c              | 30 ++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index e75422864d1b..c006aecd6ba5 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -88,18 +88,33 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
+	int ret;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	return (p4d_t *)get_zeroed_page(gfp);
+
+	addr = get_zeroed_page(gfp);
+	if (!addr)
+		return NULL;
+
+	ret = kpkeys_protect_pgtable_memory(addr, 1);
+	if (ret) {
+		free_page(addr);
+		return NULL;
+	}
+
+	return (p4d_t *)addr;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
+	unsigned long addr = (unsigned long)p4d;
+
 	if (!pgtable_l5_enabled())
 		return;
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	free_page((unsigned long)p4d);
+	BUG_ON(addr & (PAGE_SIZE-1));
+	kpkeys_unprotect_pgtable_memory(addr, 1);
+	free_page(addr);
 }
 
 #define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index 0c501cabc238..3577cc1821af 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -28,12 +28,38 @@ static bool pgdir_is_page_size(void)
 	return false;
 }
 
+static pgd_t *pgd_page_alloc(gfp_t gfp)
+{
+	unsigned long addr;
+	int ret;
+
+	addr = __get_free_page(gfp);
+	if (!addr)
+		return NULL;
+
+	ret = kpkeys_protect_pgtable_memory(addr, 1);
+	if (ret) {
+		free_page(addr);
+		return NULL;
+	}
+
+	return (pgd_t *)addr;
+}
+
+static void pgd_page_free(pgd_t *pgd)
+{
+	unsigned long addr = (unsigned long)pgd;
+
+	kpkeys_unprotect_pgtable_memory(addr, 1);
+	free_page(addr);
+}
+
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
 
 	if (pgdir_is_page_size())
-		return (pgd_t *)__get_free_page(gfp);
+		return pgd_page_alloc(gfp);
 	else
 		return kmem_cache_alloc(pgd_cache, gfp);
 }
@@ -41,7 +67,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
 	if (pgdir_is_page_size())
-		free_page((unsigned long)pgd);
+		pgd_page_free(pgd);
 	else
 		kmem_cache_free(pgd_cache, pgd);
 }
-- 
2.47.0


