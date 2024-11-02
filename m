Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A06E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJqivOAtsdQwv/WGlNqAzH6m10C++S3c64Y8s5Wfy5I=; b=TXdppRzWq5qhiu+gfU2xbiCJIR
	UNOL2T4b+T4zJlun3Q6+HMm1if8Yf1zalaxneMsGFZGAQXs8nwaoWsMQsC0ZhFakwl+k0hIdT3pZQ
	8bxY0GiyBwQOjil59CVngtWHUd/rQtI8JZXkvYgcoO/fcn8OGZ5V2bG+eAKXlw8EJ4AlNlfg5ndOY
	5SBWeGJT877CGDLZIWcPucXPU0L4c3ruLAv0+MyWP0s5bz6AlXFHUwjHlMtIMCGw+MCK4vx85XuXC
	ScyqGlpVqeu7fZg4sg7/IW9nNP69y8AXTXlyYXlqVTHMdGUMmnkhVIElcOHpaLhGzRKq7Wlk/hP2V
	xVZiYAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bhi-00000009WpX-3Oxa;
	Sat, 02 Nov 2024 10:50:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb9-00000009W3q-2omg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:18 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XgZ5K1hxNz10PHf;
	Sat,  2 Nov 2024 18:40:53 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 42BA7180105;
	Sat,  2 Nov 2024 18:43:08 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:07 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 4/5] arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG
Date: Sat, 2 Nov 2024 18:42:34 +0800
Message-ID: <20241102104235.62560-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241102104235.62560-1-yangyicong@huawei.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034316_126637_59CA55C8 
X-CRM114-Status: GOOD (  12.57  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

With the support of FEAT_HAFT, the NONLEAF_PMD_YOUNG can be enabled
on arm64 since the hardware is capable of updating the AF flag for
PMD table descriptor. Since the AF bit of the table descriptor
shares the same bit position in block descriptors, we only need
to implement arch_has_hw_nonleaf_pmd_young() and select related
configs. The related pmd_young test/update operations keeps the
same with and already implemented for transparent page support.

Currently ARCH_HAS_NONLEAF_PMD_YOUNG is used to improve the
efficiency of lru-gen aging.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/Kconfig               | 1 +
 arch/arm64/include/asm/pgtable.h | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7c023f3f55d6..0b6c66ec35e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -38,6 +38,7 @@ config ARM64
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
+	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
 	select ARCH_HAS_PTE_DEVMAP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_HW_PTE_YOUNG
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c329ea061dc9..5182feabd943 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1259,7 +1259,7 @@ static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
 	return young;
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
@@ -1267,7 +1267,7 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 {
 	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
 static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
@@ -1502,6 +1502,10 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
  */
 #define arch_has_hw_pte_young		cpu_has_hw_af
 
+#ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
+#define arch_has_hw_nonleaf_pmd_young	system_supports_haft
+#endif
+
 /*
  * Experimentally, it's cheap to set the access flag in hardware and we
  * benefit from prefaulting mappings as 'old' to start with.
-- 
2.24.0


