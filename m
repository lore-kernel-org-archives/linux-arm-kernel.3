Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B41088E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ0qad0Pm6XxHYmd2R3Uz8rTNICSFBFKR16MZOCoaNo=; b=Re8rAZA+bzr6KevSoHRUfC2CHP
	aBBA8bEh4qOPtQgixM2nXy+pGkD8V+9jgbQ7N98VADA7gYT4mMlzBeYgjvmsfNFH54eH3Pc+4nT5/
	FXlhDdn0i3N6R+P8JwwkxNjhrZFNb6NRz8wktnLNI9SDMAf1fFsGUj1DBXNcf9YJ3se82YUO/fTWs
	2BCTC0BZ47/kYXmmiYllf8DMSFWGr5Bwhg55qBSupYwaFRI0pVlV/aaMSE1amSpG4YTiFpGvHAukp
	44DbtGmIq25Uer7eCahQ9pdw+2AhrHGGK2uD8YB+F37t0VF9NJZYBlDgR+j1hn3niEfVxiLCJXnlu
	cbhWbEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3406-00000009oZm-2tjU;
	Thu, 19 Mar 2026 03:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3402-00000009oVA-0Zci;
	Thu, 19 Mar 2026 03:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wZ0qad0Pm6XxHYmd2R3Uz8rTNICSFBFKR16MZOCoaNo=; b=oksSPBciG5R/MTy3kQtxAE/G0M
	tWwj1CCQN8qhnjdOavTH5mi0llek3UG2053Kqe3ekYcArmCIU/JV8qRDMKn36h6z/1MYNpk7WRuBi
	wkW1kZ6Tnkdexuiq+xBQKNP4bpTl0s1zOoGt0O2A9aOE7b8QrcgBpOcrRgykby638NKcVl2PbqMB1
	GnPylHh6u02JmVp1BCoT/guh8BbviwTJDIZjDMXnc2Wt+VQfrVyjzSfOKk5m8m4DMAPoYDD0f/eOR
	KHbCFLzOyYw/s9ylssxbUqz+i6Cx/aYMzzw5NJjp2J95s4OG1/68CuLiu01gm10ggBmTEj2QhqA2n
	ZuumlcEw==;
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33zx-0000000CdkC-0I90;
	Thu, 19 Mar 2026 03:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773890663; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wZ0qad0Pm6XxHYmd2R3Uz8rTNICSFBFKR16MZOCoaNo=;
	b=RReSa4/D4qAiZLUALt4pgzPc1AW+fu/yDbF6zaeoD5dxv8YfbWgLj76TLNnIFgRIXXMM1hohNRMQjh5J+KRIlntl3pRHnNvcHSgoqdI72yn+At3wRnrw/ApxnFO+5q66kf0DXEvI748nAg5C4gkT0Ro8twSQBTA//CElk7ACFao=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.Gt-CL_1773890660;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.Gt-CL_1773890660 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Mar 2026 11:24:21 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org (open),
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mm: change to return bool for pmdp_test_and_clear_young()
Date: Thu, 19 Mar 2026 11:24:02 +0800
Message-ID: <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_032437_896182_D3AAB364 
X-CRM114-Status: GOOD (  14.26  )
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

Callers use pmdp_test_and_clear_young() to clear the young flag and check
whether it was set for this PMD entry. Change the return type to bool to
make the intention clearer.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/pgtable.h             |  6 +++---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
 arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
 arch/riscv/include/asm/pgtable.h             |  2 +-
 arch/s390/include/asm/pgtable.h              |  4 ++--
 arch/x86/include/asm/pgtable.h               |  4 ++--
 arch/x86/mm/pgtable.c                        |  6 +++---
 include/linux/pgtable.h                      | 19 +++++++++----------
 8 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 393a9d1873f6..7ea16f6ad564 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1321,9 +1321,9 @@ static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+					     unsigned long address,
+					     pmd_t *pmdp)
 {
 	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
 	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 25e3a86943e2..0f34011665a6 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1161,13 +1161,13 @@ pud_hugepage_update(struct mm_struct *mm, unsigned long addr, pud_t *pudp,
  * For radix we should always find H_PAGE_HASHPTE zero. Hence
  * the below will work for radix too
  */
-static inline int __pmdp_test_and_clear_young(struct mm_struct *mm,
-					      unsigned long addr, pmd_t *pmdp)
+static inline bool __pmdp_test_and_clear_young(struct mm_struct *mm,
+					       unsigned long addr, pmd_t *pmdp)
 {
 	unsigned long old;
 
 	if ((pmd_raw(*pmdp) & cpu_to_be64(_PAGE_ACCESSED | H_PAGE_HASHPTE)) == 0)
-		return 0;
+		return false;
 	old = pmd_hugepage_update(mm, addr, pmdp, _PAGE_ACCESSED, 0);
 	return ((old & _PAGE_ACCESSED) != 0);
 }
@@ -1300,8 +1300,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
 				 pud_t entry, int dirty);
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-				     unsigned long address, pmd_t *pmdp);
+extern bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long address, pmd_t *pmdp);
 #define __HAVE_ARCH_PUDP_TEST_AND_CLEAR_YOUNG
 extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long address, pud_t *pudp);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4b09c04654a8..aed39bba891e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -98,8 +98,8 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 }
 
 
-int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-			      unsigned long address, pmd_t *pmdp)
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+			       unsigned long address, pmd_t *pmdp)
 {
 	return __pmdp_test_and_clear_young(vma->vm_mm, address, pmdp);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 11f57ccf6dc9..bac559d29036 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1015,7 +1015,7 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
 	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index c9ab81caaf75..1f5efb7be71d 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1683,8 +1683,8 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long addr, pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+					     unsigned long addr, pmd_t *pmdp)
 {
 	pmd_t pmd = *pmdp;
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 554dea93eb99..bd02ee730a23 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1295,8 +1295,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
 				 pud_t entry, int dirty);
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-				     unsigned long addr, pmd_t *pmdp);
+extern bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long addr, pmd_t *pmdp);
 extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long addr, pud_t *pudp);
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 0007dc3d739e..10a5e0b2be36 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -456,10 +456,10 @@ bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
-int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-			      unsigned long addr, pmd_t *pmdp)
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+			       unsigned long addr, pmd_t *pmdp)
 {
-	int ret = 0;
+	bool ret = false;
 
 	if (pmd_young(*pmdp))
 		ret = test_and_clear_bit(_PAGE_BIT_ACCESSED,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1198e216fde3..e53220b0a9a3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -507,25 +507,24 @@ static inline bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 
 #ifndef __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	pmd_t pmd = *pmdp;
-	int r = 1;
+	bool young = true;
+
 	if (!pmd_young(pmd))
-		r = 0;
+		young = false;
 	else
 		set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
-	return r;
+	return young;
 }
 #else
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	BUILD_BUG();
-	return 0;
+	return false;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 #endif
-- 
2.47.3


