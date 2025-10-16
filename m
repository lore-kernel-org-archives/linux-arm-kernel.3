Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34014CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 03:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bB5iNPyPZitg1poKx15liVLx26fStnGhpS8xVUowUJc=; b=OVQoAGvS0dKCI/
	ELIE1rYz6M6GbeyP3/voWV6201NCB5tYaMxU4k60c20LQfaObv+AbKXe4ZUGK3TOISMmRc2OftpMY
	Gx74Ag2agWwDqp8RM9wGWOEDdLnmGU0kagK/nBtGqGkm/+N5qbZhKoBn4Hau1HoiAm70n9000JprA
	nPc9zlpCBIrOl6YSAdr++hAacmaYyMbaQb9a30qObo9QYI5toCfM1hzuvGS+un3DS0w71VXKYLN/h
	2xYlmWfmLf9qF3fU5iUBq/2pHwNMMcAy3SR+tInoiYxnNYtR/o9WaOhde9fVSmpDB0ggmcLFTNnV2
	cs35QTcUO3yMMmxoUqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ey0-00000003NrA-06bE;
	Thu, 16 Oct 2025 03:47:52 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Exw-00000003Npd-2RRQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 03:47:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bB5iNPyPZitg1poKx15liVLx26fStnGhpS8xVUowUJc=;
	b=3Bc/0XHmu3hWxZgyDOelbS3NyMKG4rAz91xxcHWJ72LpO0jLl3pprNnMBZXThjun+5UkSOaoX
	KN9yepnVWDPIx7ZAzFDPq4mj4HRMGWvJJEEjLFZ4Zh4kcizGAhEvAGaT4sDpTZIou3GJfPxglc1
	ZBbfQCJANPtkeJRGg/PDlP4=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4cnDQk4ZLmzpStq;
	Thu, 16 Oct 2025 11:46:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8245D180B67;
	Thu, 16 Oct 2025 11:47:34 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 16 Oct
 2025 11:47:33 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>, <yangyicong@huawei.com>,
	<wangyushan12@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>
Subject: [PATCH] gic: increase the arch_timer priority to avoid hardlockup
Date: Thu, 16 Oct 2025 11:47:33 +0800
Message-ID: <20251016034733.3092375-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_204749_279787_DCEB163E 
X-CRM114-Status: GOOD (  19.02  )
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

From: Qinxin Xia <xiaqinxin@huawei.com>

----------------------------------------------------------------------

On HIP12, when GIC receives multiple interrupts of the same priority and
different types, the interrupts are selected in the following sequence:
SPI > LPI > SGI > PPI. This scheduling rule may cause PPI starvation.
To prevent starvation from triggering system watchdog hardlockup, the
interrupt priority is explicitly increased in the arch_timer driver.

Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
Signed-off-by: Hongye Lin <linhongye@h-partners.com>
Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 11 ++++++
 drivers/clocksource/arm_arch_timer.c        | 44 +++++++++++++++++++++
 drivers/irqchip/irq-gic-v3.c                |  7 +++-
 include/linux/irqchip/arm-gic-v3.h          |  3 ++
 5 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index a7ec57060f64..6e6d5c953c99 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -266,6 +266,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip12           | #165010801      | HISILICON_ERRATUM_165010801 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..ec75dc0cf14d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1273,6 +1273,17 @@ config HISILICON_ERRATUM_162100801
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_165010801
+	bool "Hisilicon erratum 165010801"
+	depends on ARCH_HISI
+	default y
+	help
+	  On HIP12, when GIC receives multiple interrupts of the same priority and
+	  different types, the interrupts are selected in the following sequence:
+	  SPI > LPI > SGI > PPI. This scheduling rule may cause PPI starvation.
+	  To prevent starvation from triggering system watchdog hardlockup, the
+	  interrupt priority is explicitly increased in the arch_timer driver.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 90aeff44a276..834b904b460c 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -29,6 +29,11 @@
 #include <linux/arm-smccc.h>
 #include <linux/ptp_kvm.h>
 
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+#include <linux/irqchip/arm-gic-common.h>
+#include <linux/irqchip/arm-gic-v3.h>
+#endif
+
 #include <asm/arch_timer.h>
 #include <asm/virt.h>
 
@@ -61,6 +66,9 @@ static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_ARCHTIMER;
 #else
 static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_NONE;
 #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+static bool prio_setup;
+#endif
 
 static cpumask_t evtstrm_available = CPU_MASK_NONE;
 static bool evtstrm_enable __ro_after_init = IS_ENABLED(CONFIG_ARM_ARCH_TIMER_EVTSTREAM);
@@ -254,6 +262,17 @@ static const struct ate_acpi_oem_info hisi_161010101_oem_info[] = {
 };
 #endif
 
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+static struct ate_acpi_oem_info hisi_165010801_oem_info[] = {
+	{
+		.oem_id		= "HISI  ",
+		.oem_table_id	= "HIP12   ",
+		.oem_revision	= 0,
+	},
+	{ /* Sentinel indicating the end of the OEM array */ },
+};
+#endif
+
 #ifdef CONFIG_ARM64_ERRATUM_858921
 static u64 notrace arm64_858921_read_cntpct_el0(void)
 {
@@ -384,6 +403,13 @@ static const struct arch_timer_erratum_workaround ool_workarounds[] = {
 		.set_next_event_virt = erratum_set_next_event_virt,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+	{
+		.match_type = ate_match_acpi_oem_info,
+		.id = hisi_165010801_oem_info,
+		.desc = "HiSilicon erratum 165010801",
+	},
+#endif
 #ifdef CONFIG_ARM64_ERRATUM_858921
 	{
 		.match_type = ate_match_local_cap_id,
@@ -491,6 +517,12 @@ void arch_timer_enable_workaround(const struct arch_timer_erratum_workaround *wa
 	if (wa->read_cntvct_el0 || wa->read_cntpct_el0)
 		atomic_set(&timer_unstable_counter_workaround_in_use, 1);
 
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+	if (!strncmp(wa->desc, "HiSilicon erratum 165010801",
+		     strlen("HiSilicon erratum 165010801")))
+		prio_setup = true;
+#endif
+
 	/*
 	 * Don't use the vdso fastpath if errata require using the
 	 * out-of-line counter accessor. We may change our mind pretty
@@ -830,6 +862,18 @@ static int arch_timer_starting_cpu(unsigned int cpu)
 
 	__arch_timer_setup(clk);
 
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+	if (prio_setup && is_kernel_in_hyp_mode()) {
+		struct irq_data *d = irq_get_irq_data(arch_timer_ppi[arch_timer_uses_ppi]);
+
+		if (!d)
+			pr_warn("WARNING: Invalid arch_timer ppi irq: %d!\n",
+				arch_timer_ppi[arch_timer_uses_ppi]);
+		else
+			gic_irq_set_prio(d, GICD_INT_DEF_PRI & (GICD_INT_DEF_PRI - 1));
+	}
+#endif
+
 	flags = check_ppi_trigger(arch_timer_ppi[arch_timer_uses_ppi]);
 	enable_percpu_irq(arch_timer_ppi[arch_timer_uses_ppi], flags);
 
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 3de351e66ee8..11f737328857 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -584,7 +584,12 @@ static int gic_irq_get_irqchip_state(struct irq_data *d,
 	return 0;
 }
 
-static void gic_irq_set_prio(struct irq_data *d, u8 prio)
+#ifndef CONFIG_HISILICON_ERRATUM_165010801
+static void
+#else
+void
+#endif
+gic_irq_set_prio(struct irq_data *d, u8 prio)
 {
 	void __iomem *base = gic_dist_base(d);
 	u32 offset, index;
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 70c0948f978e..1c5ed36fcaf7 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -656,6 +656,9 @@ static inline bool gic_enable_sre(void)
 	return !!(val & ICC_SRE_EL1_SRE);
 }
 
+#ifdef CONFIG_HISILICON_ERRATUM_165010801
+void gic_irq_set_prio(struct irq_data *d, u8 prio);
+#endif
 #endif
 
 #endif
-- 
2.33.0


