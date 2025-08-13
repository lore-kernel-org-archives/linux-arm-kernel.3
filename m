Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0F2CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH2Ag1dIEuC8Jxe54WHLC6K1HWMsOn8nAJRMDT/vzz4=; b=Inn3y6+2WCwgZ+k4erlgdgcjLr
	eS/G2UnzU73iq/TYO2Xf8c1ux6xA2W4tceXWg3rZDw/LeDAFRbMF3DGjMpDX4OOGisjfIA4pNf4S/
	VLNQlpfRHi+W/dqs8i/LtyX+n/77uDAMzho+xw2Jwq4FHGdrTnIl8UetbO1v7bdodauoVqUVwbCiP
	aD9jfhGSC+hSDqIoSdsCCKvTglnqgCcf52p6/mq0YRdUIg/MWOCgZW/YMfNrjSRpUsiILxiD3qWKV
	udA7Oz2OhhNouub+idsrerUYeWPqa//g24DzOHWNDXC/UAXxLn4Ozyb/+BynKWztAz261md6AFF7T
	lxTGO6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDWD-0000000ECvS-2gtN;
	Wed, 13 Aug 2025 15:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtu-0000000E5RZ-2nnL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:56:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8B112FC;
	Wed, 13 Aug 2025 07:56:17 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D9823F738;
	Wed, 13 Aug 2025 07:56:22 -0700 (PDT)
From: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH 2/2] arm64/mm: Update create_kpti_ng_temp_pgd() to handle pgtable_alloc failure
Date: Wed, 13 Aug 2025 20:26:07 +0530
Message-Id: <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_075626_782171_B47752B5 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

create_kpti_ng_temp_pgd() was created as an alias for void returning
__create_pgd_mapping_locked() and relied on pgtable_alloc() to BUG_ON()
if an allocation failure occurred. But as __create_pgd_mapping_locked()
has been updated as a part of the error propagation patch to return a
non-void value, update create_kpti_ng_temp_pgd() to act as a wrapper
around __create_pgd_mapping_locked() and BUG_ON() on ret being a non
zero value.

Signed-off-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
---
 arch/arm64/mm/mmu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index db7f45ef16574..19cbabceb38bd 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -76,6 +76,14 @@ EXPORT_SYMBOL(empty_zero_page);
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
+			     unsigned long virt, phys_addr_t size,
+			     pgprot_t prot,
+			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
+			     int flags);
+#endif
+
 void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	pgd_t *fixmap_pgdp;
@@ -541,11 +549,17 @@ static void ___create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 }
 
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-extern __alias(__create_pgd_mapping_locked)
 void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 			     phys_addr_t size, pgprot_t prot,
 			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
-			     int flags);
+			     int flags)
+{
+	int ret = 0;
+
+	ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
+					  pgtable_alloc, flags);
+	BUG_ON(ret);
+}
 #endif
 
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,
-- 
2.34.1


