Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0484BD0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRvB6v+MXrdzNewovZSAJ0NRrR/TWvRUYxO9+Eb0rO0=; b=DG9YWkHABWPDs5GqVFYyTHl43E
	2NrcMA+L4kqQNMV3ZF78ESR+RAGqqh0xs4OFpqmTUPk0a5n7DEZZjI/wyiQQtbjIg8qDFTO/MG9//
	9Oann5htjwBV/C8ceiCNCgFG67troR+wfox5aZlBUA34GHpfupCWp9QUbgJnrta/dFJC/Srgm8Xeu
	3b94j9nYSOgM3vTvTg3jVmpK3v8kmxvPzh/saw6qnwZsBgeoXpRG/tFd9QU3yw8GsTZAt0I7lwsuc
	9e5DHz8HWpR2utrDv8Bp1vaYME+dMHaM3etV929oeqCzFeubqi1qu/2aKecwJdOWfmjJ76ZHi6Hd1
	PN5LoUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwRP-0000000Dddi-0g1a;
	Tue, 25 Nov 2025 17:02:59 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwRM-0000000Ddcu-3tPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764090134; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AAgZQGjboB16/tlOlTY++OsytzK0X+Ld1GUEPDOnKljwFneW3tGDGHX+NmslxWM0iVWTUexbbOXQi8bmNJCeKSHJYTo3FlAUYuWa4YMUvOF2Y4ODJN2trfaY2BS9UxCnSzjynH5M9SyR/SsJUTVXWWLDwbXMybfdqFobNBL0s5M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764090134; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=zRvB6v+MXrdzNewovZSAJ0NRrR/TWvRUYxO9+Eb0rO0=; 
	b=EatH8Y2VNVpiO6Sukb6TcHrapbAfmmgTJNM7PBKnzJb+viT3ixnlA35HBUE7FB3D1q2rPLZ18crKEo6xNAC57bc1h4fq4LiBqoCFjNS3WIOLkV0lErvMhb2a6m6QJ3iix+k4/q+LoleT15Gk9fFPrJz8b3zBcagtL9Sod+z0Swk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764090134;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To:Cc;
	bh=zRvB6v+MXrdzNewovZSAJ0NRrR/TWvRUYxO9+Eb0rO0=;
	b=pQBOaXdm0J2xMnLUZUh1Pu5yg4jimJ5y7CcGcBrb4KKstUg4i5s16WEO5lphZGPB
	hTImG560e+CR94vezuUABcsZOYSXxHabjTIBpt8h1Skb0hF6YynEtRFYwUnRPvL/nxN
	S3Z9oQ5bHf8h4xxy3WXdgU3rhv11jj+0uQOzP1jk=
Received: by mx.zohomail.com with SMTPS id 1764090131749161.7619654954118;
	Tue, 25 Nov 2025 09:02:11 -0800 (PST)
From: Anirudh Raybharam <anirudh@anirudhrb.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org,
	anirudh@anirudhrb.com,
	agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com,
	osandov@fb.com,
	bsz@amazon.de,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
Date: Tue, 25 Nov 2025 17:01:23 +0000
Message-Id: <20251125170124.2443340-3-anirudh@anirudhrb.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125170124.2443340-1-anirudh@anirudhrb.com>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090257_053730_FD60B2DE 
X-CRM114-Status: GOOD (  17.99  )
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

From: Anirudh Rayabharam <anirudh@anirudhrb.com>

From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>

Currently SGIs are allocated only for the smp subsystem. The MSHV
(Microsoft Hypervisor aka Hyper-V) code also needs an SGI that can be
programmed into the SYNIC to receive intercepts from the hypervisor. The
hypervisor would then assert this SGI whenever there is a guest
VMEXIT.

Allocate one SGI for MSHV use in addition to the SGIs allocated for
IPIs. When running under MSHV, the full SGI range can be used i.e. no
need to reserve SGIs 8-15 for the secure firmware.

Since this SGI is needed only when running as a parent partition (i.e.
we can create guest partitions), check for it before allocating an SGI.

Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
---
 arch/arm64/hyperv/mshyperv.c      | 13 +++++++++++++
 arch/arm64/include/asm/mshyperv.h |  8 ++++++++
 drivers/irqchip/irq-gic-v3.c      | 29 ++++++++++++++++++++++++++---
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index cc443a5d6c71..99690ae9b53f 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -20,6 +20,8 @@
 static bool hyperv_detected;
 static bool hyperv_initialized;
 
+static int mshv_intercept_irq;
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
@@ -137,6 +139,17 @@ static int __init hyperv_init(void)
 	return 0;
 }
 
+void __init mshv_set_intercept_irq(int irq)
+{
+	mshv_intercept_irq = irq;
+}
+
+int mshv_get_intercept_irq(void)
+{
+	return mshv_intercept_irq;
+}
+EXPORT_SYMBOL_GPL(mshv_get_intercept_irq);
+
 early_initcall(hyperv_init);
 
 bool hv_is_hyperv_initialized(void)
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index 58fde70c2e39..f3f6e82a9cb6 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -55,6 +55,14 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 
 void hyperv_early_init(void);
 
+#if IS_ENABLED(CONFIG_MSHV_ROOT)
+void mshv_set_intercept_irq(int irq);
+#else
+static inline void mshv_set_intercept_irq(int irq) {}
+#endif
+
+int mshv_get_intercept_irq(void);
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 3de351e66ee8..56013dd0564c 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -35,6 +35,7 @@
 #include <asm/exception.h>
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
+#include <asm/mshyperv.h>
 
 #include "irq-gic-common.h"
 
@@ -1456,8 +1457,24 @@ static void __init gic_smp_init(void)
 		.fwnode		= gic_data.fwnode,
 		.param_count	= 1,
 	};
+	/* Register all 8 non-secure SGIs */
+	const int NR_SMP_SGIS = 8;
+	int nr_sgis = NR_SMP_SGIS;
 	int base_sgi;
 
+	/*
+	 * Allocate one more SGI for use by Hyper-V. This is only needed when
+	 * Linux is running in a parent partition. Hyper-V will use this interrupt
+	 * to notify the parent partition of intercepts.
+	 *
+	 * When running on Hyper-V, it is okay to use SGIs 8-15. They're not reserved
+	 * for secure firmware.
+	 */
+#if IS_ENABLED(CONFIG_HYPERV)
+	if (hv_parent_partition())
+		nr_sgis += 1;
+#endif
+
 	cpuhp_setup_state_nocalls(CPUHP_BP_PREPARE_DYN,
 				  "irqchip/arm/gicv3:checkrdist",
 				  gic_check_rdist, NULL);
@@ -1466,12 +1483,18 @@ static void __init gic_smp_init(void)
 				  "irqchip/arm/gicv3:starting",
 				  gic_starting_cpu, NULL);
 
-	/* Register all 8 non-secure SGIs */
-	base_sgi = irq_domain_alloc_irqs(gic_data.domain, 8, NUMA_NO_NODE, &sgi_fwspec);
+	base_sgi = irq_domain_alloc_irqs(gic_data.domain, nr_sgis, NUMA_NO_NODE, &sgi_fwspec);
 	if (WARN_ON(base_sgi <= 0))
 		return;
 
-	set_smp_ipi_range(base_sgi, 8);
+	set_smp_ipi_range(base_sgi, NR_SMP_SGIS);
+
+#if IS_ENABLED(CONFIG_HYPERV)
+	if (hv_parent_partition()) {
+		base_sgi += NR_SMP_SGIS;
+		mshv_set_intercept_irq(base_sgi);
+	}
+#endif
 }
 
 static int gic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
-- 
2.34.1


