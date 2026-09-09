Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C30C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vq7c/Hvo/1Zm+J68rStWCQQNc5Z7oKaUjk4qiUyJp1Y=; b=nOJ5JcO8Zg7Opcf7tBGeQUM4yY
	3mO17BwAPZvGECJGDt+gWfsfedKvZxdNToFJPAzCN+NlZlEgECB+a15/xSLaHc5sIEWToeGpyMqiP
	n4b4d+pTdH9znRwaAxKAo94KNdJvrJHohRGDwB/S7GmwCsXDQiVnw120ZfPBhoNcqdmpQ7ROs6kGC
	1Ee/WcSMrwJ0aWhSbUoE0idAvYJSSnfmS+X7XTM8fDmAit1XjlSgQj+1lX+/tXzAkVHi6CCVmj/Om
	7Eleh+14rsqzz1zwPOQxm5XjcOxjaaq38j7W/Z1OKfZhZtWSKmZ3kHCqpQcdozGRD++rm4HlQ7mMw
	50xX8kCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebo-0000000BIHv-2iiH;
	Wed, 09 Sep 2026 09:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebk-0000000BIDa-2fHp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vq7c/Hvo/1Zm+J68rStWCQQNc5Z7oKaUjk4qiUyJp1Y=; b=Gi1q24T8ZfOTFcvEoHDJII4SKc
	WXTWTJgKjQeylFBt0yavYaTwOsNBOPu5GOyt36sHqPlhlhuXDNCav4T7hSCHHyaUEirvAWGIYI1RF
	JNF97jtUW202vDMSolOhkeTwMpPne/88nVNYfV85c5+RJ7s0JGPdLPRHfviDCEEpuEIQ7nbNCt+2o
	pQmlaOdrWvXJjgWBqrL/wTaNMqhCapg7OEaHGFnQnt9FFlDrowp0mpFWOLtXBvvTOSYsuNK54i83K
	CJS51K4tSk0t1Fd2VMs2U1f+7ufgiHtqsS9aBN+jIXOXgiAzLgsCub6lQUX5Z+KUuGqxgUj6oseMW
	dBxtZRYw==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Ebg-00000000zoM-0iPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Vq7c/Hvo/1Zm+J68rStWCQQNc5Z7oKaUjk4qiUyJp1Y=;
	b=6gk98iMQGo1gYBiiYU1dJBNw/Pj4RPpuBoLrnCud96ixy2LzEuPNHyX5ExdD+1MWqOMQazx+a
	wDmZqNjofk4sDgLF9E/t0cZgC4EpqbL0RHb85jIguPzGJC3wRlxmRRDyGKrMY8+jtkO/fDhJ8QQ
	skPTxlhKqpoKzNZKWSU3VQk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfwF536cLz1cyTS;
	Wed,  9 Sep 2026 17:17:29 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CE5D4048B;
	Wed,  9 Sep 2026 17:28:23 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 17:28:22 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 1/3] mm: define generic pudp_invalidate() implementation
Date: Wed, 9 Sep 2026 17:00:16 +0800
Message-ID: <20260909090018.1991485-2-tujinjiang@huawei.com>
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
X-CRM114-CacheID: sfid-20260909_102840_822334_A608D0AF 
X-CRM114-Status: GOOD (  10.58  )
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

x86 and riscv have identical pudp_invalidate() implementations. Move it to
mm/pgtable-generic.c with the __HAVE_ARCH_PUDP_INVALIDATE override guard.
PowerPC keeps its own implementation. In the later patch, arm64 will use
the generic implementation too.

No functional change intended.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
 arch/riscv/include/asm/pgtable.h             |  3 ---
 arch/riscv/mm/pgtable.c                      |  9 ---------
 arch/x86/include/asm/pgtable.h               |  3 ---
 arch/x86/mm/pgtable.c                        | 12 ------------
 include/linux/pgtable.h                      |  7 +++++++
 mm/pgtable-generic.c                         | 14 ++++++++++++++
 7 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index f4db7d7fbd5c..55d33c5537f1 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1419,6 +1419,7 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
 #define __HAVE_ARCH_PMDP_INVALIDATE
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pmd_t *pmdp);
+#define __HAVE_ARCH_PUDP_INVALIDATE
 extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pud_t *pudp);
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..327fa378032b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1159,9 +1159,6 @@ static inline pud_t pud_mkinvalid(pud_t pud)
 	return __pud(pud_val(pud) & ~(_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
 
-extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-			     pud_t *pudp);
-
 static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 {
 	return pte_pud(pte_modify(pud_pte(pud), newprot));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 9c4427d0b187..156e385e7db4 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -154,15 +154,6 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		      pud_t *pudp)
-{
-	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
-
-	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
-	return old;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d5f4917c1edc..97051c02385e 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1387,9 +1387,6 @@ static inline pud_t pudp_establish(struct vm_area_struct *vma,
 extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp);
 
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		      pud_t *pudp);
-
 /*
  * Page table pages are page-aligned.  The lower half of the top
  * level is used for userspace and the top half for the kernel.
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index cb03f5a2b243..0945908631dc 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -519,18 +519,6 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
-	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		     pud_t *pudp)
-{
-	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
-	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
-	return old;
-}
-#endif
-
 /**
  * reserve_top_address - Reserve a hole in the top of the kernel address space
  * @reserve: Size of hole to reserve
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a..32173005b087 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1318,6 +1318,13 @@ extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp);
 #endif
 
+#ifndef __HAVE_ARCH_PUDP_INVALIDATE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+			     pud_t *pudp);
+#endif
+#endif
+
 #ifndef __HAVE_ARCH_PTE_SAME
 static inline int pte_same(pte_t pte_a, pte_t pte_b)
 {
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..ac1175d9a59a 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -217,6 +217,20 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
+#ifndef __HAVE_ARCH_PUDP_INVALIDATE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp)
+{
+	VM_WARN_ON_ONCE(!pud_present(*pudp));
+	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
+
+	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+	return old;
+}
+#endif
+#endif
+
 #ifndef pmdp_collapse_flush
 pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 			  pmd_t *pmdp)
-- 
2.43.0


