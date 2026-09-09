Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3884BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLP+Qen/7FlMgfeGn+GCMV7hbDA0yzybp+V1qh81JEw=; b=eW5F4X2g2/2IPutwQ7no1eqdi3
	PELfTcbIINVxrxiC5NMEYtMs+QiHJgAKQ1HaTUdbFBScNRNZxcuzx6ymPgrBMP9wmBt78NqP5THtJ
	OGgFflJoX6Tlk3EHUE42aeZIrG5pAXmfHYqHVJ12bFlCQNmJ6STpOFKWuaPBA410OI+FA0vFsdxAi
	4tz/F5YZPxwvc6I52CohfjbjLb0/KBdLiJe89PCdokWxAuZWXnEiWLc9gZWfbFB8ZHU2TtxWGFOVJ
	xD/o4LPrrMrfDVB3F40FqIi9jmi813Hk+eyxH7/R1fK6bUKuy7OxcjPqTgZNDcGPJu33Xwu+qx+Af
	AAgjNjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebo-0000000BIHa-1KWB;
	Wed, 09 Sep 2026 09:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebk-0000000BIDZ-2cP4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mLP+Qen/7FlMgfeGn+GCMV7hbDA0yzybp+V1qh81JEw=; b=eG7ThVhzpVl1zEcrJhXYzJjybg
	Lx2rysqz4oLGaVkzwcTbAyTLbHQwG+0HpIxc+0R2O5Lbz8q2a3kEeW2R+uH3wNRQ/44O2sXFq6JAl
	5Vwcz6yvdjxjsV+mCIgiKsC/XcTxRAWiDjnNq1Xy7ay+YsWv3MLNRS9IPZIdop6Rf3272bWXQ4hW5
	Wnw0AQBQ43CHiEZjGHQwIQYtiAxbkTud54p/AskFy2UkmTnB6jPQMqkSkhp1tAbYFB9ornXU/oNEt
	1dxXEmD0cCLzMhzm4rpw5gYJ5gz4tm/7GtumSvQcWbPLfKm0PRueRykbwlO2zYPO+taXTXkGEUpqP
	mnys8SKw==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Ebg-00000000zoN-1U5w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mLP+Qen/7FlMgfeGn+GCMV7hbDA0yzybp+V1qh81JEw=;
	b=KVQRbP2aFPXjxwfsj9GMdflbK+s019Q2giB4YC/g5p0t9AZhWxNAjrZnqrQrp3K3c/wXj1OGC
	yMHnrpul7XhXqWhalRxkOp5OrdAq5gYfqyw7mry8+asaIHbm1XhMih/s8hXTWoiicVokE5/Le8N
	Ui/pncGx645fpiK+JicPQw8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfwF63RkPz1cyTS;
	Wed,  9 Sep 2026 17:17:30 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BE7F40573;
	Wed,  9 Sep 2026 17:28:24 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 17:28:23 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 3/3] arm64: Add support for PUD THP
Date: Wed, 9 Sep 2026 17:00:18 +0800
Message-ID: <20260909090018.1991485-4-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909090018.1991485-1-tujinjiang@huawei.com>
References: <20260909090018.1991485-1-tujinjiang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.135]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102840_993931_19C177B4 
X-CRM114-Status: GOOD (  11.81  )
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

Add the necessary page table functions to deal with PUD THP, this enables
PUD THP for DAX and pfnmap.

I tested with CONFIG_DEBUG_VM_PGTABLE and CONFIG_PAGE_TABLE_CHECK
enabled.  I wrote a test driver that invokes vmf_insert_pfn_pud() in
the huge_fault callback.  Page table setup works as expected with no
errors, and userspace read/write access to the PUD-sized mapping is
verified correct.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/pgtable.h | 52 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..8a7ca1863595 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -173,6 +173,7 @@ config ARM64
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if PAGE_SIZE_4KB
 	select HAVE_ARCH_VMAP_STACK
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 427ea3d2bac7..fdc338970934 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -611,6 +611,11 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 #define pmd_mkspecial(pmd)	pte_pmd(pte_mkspecial(pmd_pte(pmd)))
 #endif
 
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+#define pud_special(pud)	pte_special(pud_pte(pud))
+#define pud_mkspecial(pud)	pte_pud(pte_mkspecial(pud_pte(pud)))
+#endif
+
 #define __pmd_to_phys(pmd)	__pte_to_phys(pmd_pte(pmd))
 #define __phys_to_pmd_val(phys)	__phys_to_pte_val(phys)
 #define pmd_pfn(pmd)		((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT)
@@ -619,8 +624,15 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 #define pud_young(pud)		pte_young(pud_pte(pud))
 #define pud_mkyoung(pud)	pte_pud(pte_mkyoung(pud_pte(pud)))
 #define pud_mkwrite_novma(pud)	pte_pud(pte_mkwrite_novma(pud_pte(pud)))
+#define pud_mkwrite(pud)	pud_mkwrite_novma(pud)
 #define pud_mkvalid_k(pud)	pte_pud(pte_mkvalid_k(pud_pte(pud)))
 #define pud_write(pud)		pte_write(pud_pte(pud))
+#define pud_dirty(pud)		pte_dirty(pud_pte(pud))
+#define pud_wrprotect(pud)	pte_pud(pte_wrprotect(pud_pte(pud)))
+#define pud_mkdirty(pud)	pte_pud(pte_mkdirty(pud_pte(pud)))
+#define pud_mkold(pud)		pte_pud(pte_mkold(pud_pte(pud)))
+#define pud_mkinvalid(pud)	pte_pud(pte_mkinvalid(pud_pte(pud)))
+#define pud_mkclean(pud)	pte_pud(pte_mkclean(pud_pte(pud)))
 
 static inline pud_t pud_mkhuge(pud_t pud)
 {
@@ -871,6 +883,13 @@ static inline bool pud_leaf(pud_t pud)
 #define pud_user(pud)		pte_user(pud_pte(pud))
 #define pud_user_exec(pud)	pte_user_exec(pud_pte(pud))
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static inline int pud_trans_huge(pud_t pud)
+{
+	return pud_present(pud) && !pud_table(__pud(pud_val(pud) | PTE_VALID));
+}
+#endif
+
 static inline bool pgtable_l4_enabled(void);
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
@@ -1237,6 +1256,11 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
 }
 
+static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	return pte_pud(pte_modify(pud_pte(pud), newprot));
+}
+
 extern int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 					 unsigned long address, pte_t *ptep,
 					 pte_t entry, int dirty,
@@ -1261,6 +1285,16 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 }
 #endif
 
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+static inline int pudp_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pud_t *pudp,
+					pud_t entry, int dirty)
+{
+	return __ptep_set_access_flags_anysz(vma, address, (pte_t *)pudp,
+					     pud_pte(entry), dirty, PUD_SIZE);
+}
+#endif
+
 #ifdef CONFIG_PAGE_TABLE_CHECK
 static inline bool pte_user_accessible_page(struct mm_struct *mm, unsigned long addr, pte_t pte)
 {
@@ -1335,6 +1369,14 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+static inline bool pudp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp)
+{
+	return __ptep_test_and_clear_young(vma, address, (pte_t *)pudp);
+}
+#endif
+
 static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       unsigned long address,
 					       pte_t *ptep,
@@ -1497,6 +1539,15 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static inline pud_t pudp_establish(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp, pud_t pud)
+{
+	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
+	return __pud(xchg_relaxed(&pud_val(*pudp), pud_val(pud)));
+}
+#endif
+
 /*
  * Encode and decode a swap entry:
  *	bits 0-1:	present (must be zero)
@@ -1571,6 +1622,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
+#define update_mmu_cache_pud(vma, address, pud) do { } while (0)
 
 #ifdef CONFIG_ARM64_PA_BITS_52
 #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
-- 
2.43.0


