Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D29CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpd8dlNH87xa6bpqFXkqwDZ6FUbZKS1hPxE6Xy/cfSA=; b=PtE9GbzP/uI5BqRR6ts2UlRUDB
	Dyu90TDiXu/MCkPVsZuDejHiJ+iaqDZB6i7dhpXS7JKCd8iyVptFJiP2QhFPOBCTT+6Bl4AeaT/p7
	AVsq53jQo+ycw44uY38+fOA/tjyNYPWf+/LBR6krIJlCb5iQ4Iguki1CqGoompjVelALZ3srb2MD7
	M+mYDGDywjZ7abpyUok0UgMHToz1EoiIcQ5NDWGQLVLFoY8ZaawtbfWlUe4eClECZ43CdoE/kxqL1
	gi3BjrwQ4f6Wp8Cbx4BG46eswo1AfWMfp+mvzUSrt2zW61WusOGT7VLtTF0pnbkdf5RRoI85l/ln1
	9ceCBMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQf-000000061XI-2JIO;
	Sun, 18 Oct 2026 16:08:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQZ-000000061UT-3YxK;
	Sun, 18 Oct 2026 16:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gpd8dlNH87xa6bpqFXkqwDZ6FUbZKS1hPxE6Xy/cfSA=; b=fmF+fae5eX/MVyTTeu1pYiyt6d
	QrMt411wYAyabS+R+Tr5lhEsSF9ayen1gwYr0GP6B8z1FNAdhUOC0lLY3wump+yQ2qxFMvtvZOcb1
	YVWhS1Kh4zNomh5aff9HvM0650dnrbZgBCGGB+pOkZMJ9BbqG7gDu78YI1ajJgolSytB5EPuS/Pzz
	Ns7vQ+UDoUdSVxaYyowvGRl0qjH3q/2efl/hH2g3kDNv7acCCwRR5DxVHPcuqdi0KZLAqdLaVQ2/a
	CVCx8Fnae9uE6lFC+zsI1umNUXA7eUWLR0EsQeK2CS39dGYYvp8sxmSrjzFOGBvto0ElbzdtAv23m
	wV82R8IA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xITQS-000000031Bd-25zc;
	Sun, 18 Oct 2026 16:08:02 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6swZ61115131, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339614; bh=gpd8dlNH87xa6bpqFXkqwDZ6FUbZKS1hPxE6Xy/cfSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Y6KYyZqWnjJ87IHDbq0YrHCwmf+5NCqHt423IMvlIo/QNAY/mdhQSIa7Y3VXCbd+H
	 zE0X2tFxieq58EGU4sU0BWtR7f/a7YeXM9e3o3ocxVDRpBcJ1sHhi3wqByRNWjZaxw
	 f7GklADs7NyjHyZplIKwoQoXFsj6TEX1+yqm0+0Ci/VOMpz1flWxmiN5pTMB9UfxaQ
	 BihGpDwZcGYjHpHJ/iz+1Uiy58jY462G/RBsH8ZgJF+ug4/YJdENeSpGJSIExN/vZk
	 PeigjuVsBmtVHJDyK0Y6uYaAk6D11fkDyKX3AJ58tdUsBybIajoWfhZU1gMbcKe3wZ
	 6iyHCLWrC988Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6swZ61115131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 7/8] irqchip/realtek-rtd1619b: Add driver for Realtek DHC RTD1619B SoC
Date: Mon, 19 Oct 2026 00:06:52 +0800
Message-ID: <20261018160653.3940371-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_170801_180160_23FAC0C4 
X-CRM114-Status: GOOD (  18.81  )
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

From: James Tai <james.tai@realtek.com>

Add support for interrupt controller driver found on Realtek DHC RTD1619B
SoCs.

Signed-off-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/irqchip/Kconfig                |  11 ++
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-realtek-rtd1619b.c | 187 +++++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 drivers/irqchip/irq-realtek-rtd1619b.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8f4bfd3d5ec1..2598f6a82cc2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -309,6 +309,17 @@ config REALTEK_RTD1319D_INTC
 
 	  If unsure, say N.
 
+config REALTEK_RTD1619B_INTC
+	tristate "Realtek RTD1619B interrupt controller"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	select REALTEK_DHC_INTC
+	help
+	  Enable support for the Realtek RTD1619B SoC Interrupt Controller.
+	  Each Realtek DHC SoC has two sets of interrupt controllers, each
+	  capable of handling up to 32 interrupts.
+
+	  If unsure, say N.
+
 config RENESAS_INTC_IRQPIN
 	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 32a2e2d8a79c..acc515fc6f9a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_REALTEK_DHC_INTC)		+= irq-realtek-intc-common.o
 obj-$(CONFIG_REALTEK_RTD1319_INTC)	+= irq-realtek-rtd1319.o
 obj-$(CONFIG_REALTEK_RTD1319D_INTC)	+= irq-realtek-rtd1319d.o
+obj-$(CONFIG_REALTEK_RTD1619B_INTC)	+= irq-realtek-rtd1619b.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
diff --git a/drivers/irqchip/irq-realtek-rtd1619b.c b/drivers/irqchip/irq-realtek-rtd1619b.c
new file mode 100644
index 000000000000..689e7f517a76
--- /dev/null
+++ b/drivers/irqchip/irq-realtek-rtd1619b.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTD1619B interrupt controller driver
+ *
+ * Copyright (c) 2023-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include "irq-realtek-intc-common.h"
+
+#define ISO_NMI_WDT_MASK     0x08008090
+#define ISO_NORMAL_MASK      0xf7ff7f6e
+#define MISC_NORMAL_MASK     0xffffded6
+#define MISC_UART1_MASK      0x00000028
+#define MISC_UART2_MASK      0x00002100
+
+#define ISO_ISR_EN_OFFSET    0x40
+#define ISO_ISR_OFFSET       0
+#define MISC_ISR_EN_OFFSET   0x80
+#define MISC_ISR_OFFSET      0xc
+
+enum rtd1619b_iso_isr_bits {
+	RTD1619B_ISO_ISR_TC3_SHIFT		= 1,
+	RTD1619B_ISO_ISR_UR0_SHIFT		= 2,
+	RTD1619B_ISO_ISR_LSADC0_SHIFT		= 3,
+	RTD1619B_ISO_ISR_WDOG1_NMI_SHIFT	= 4,
+	RTD1619B_ISO_ISR_IRDA_SHIFT		= 5,
+	RTD1619B_ISO_ISR_SPI1_SHIFT		= 6,
+	RTD1619B_ISO_ISR_WDOG2_NMI_SHIFT	= 7,
+	RTD1619B_ISO_ISR_I2C0_SHIFT		= 8,
+	RTD1619B_ISO_ISR_TC4_SHIFT		= 9,
+	RTD1619B_ISO_ISR_TC7_SHIFT		= 10,
+	RTD1619B_ISO_ISR_I2C1_SHIFT		= 11,
+	RTD1619B_ISO_ISR_HIFI_WAKEUP_SHIFT	= 14,
+	RTD1619B_ISO_ISR_WDOG4_NMI_SHIFT	= 15,
+	RTD1619B_ISO_ISR_TC8_SHIFT		= 16,
+	RTD1619B_ISO_ISR_VFD_SHIFT		= 17,
+	RTD1619B_ISO_ISR_VTC_SHIFT		= 18,
+	RTD1619B_ISO_ISR_GPIOA_SHIFT		= 19,
+	RTD1619B_ISO_ISR_GPIODA_SHIFT		= 20,
+	RTD1619B_ISO_ISR_ISO_MISC_SHIFT		= 21,
+	RTD1619B_ISO_ISR_CBUS_SHIFT		= 22,
+	RTD1619B_ISO_ISR_ETN_SHIFT		= 23,
+	RTD1619B_ISO_ISR_USB_HOST_SHIFT		= 24,
+	RTD1619B_ISO_ISR_USB_U3_DRD_SHIFT	= 25,
+	RTD1619B_ISO_ISR_USB_U2_DRD_SHIFT	= 26,
+	RTD1619B_ISO_ISR_WDOG3_NMI_SHIFT	= 27,
+	RTD1619B_ISO_ISR_PORB_HV_CEN_SHIFT	= 28,
+	RTD1619B_ISO_ISR_PORB_DV_CEN_SHIFT	= 29,
+	RTD1619B_ISO_ISR_PORB_AV_CEN_SHIFT	= 30,
+	RTD1619B_ISO_ISR_I2C1_REQ_SHIFT		= 31,
+};
+
+static const u32 rtd1619b_iso_isr_to_scpu_int_en_mask[32] = {
+	[RTD1619B_ISO_ISR_SPI1_SHIFT]		= BIT(1),
+	[RTD1619B_ISO_ISR_UR0_SHIFT]		= BIT(2),
+	[RTD1619B_ISO_ISR_LSADC0_SHIFT]		= BIT(3),
+	[RTD1619B_ISO_ISR_IRDA_SHIFT]		= BIT(5),
+	[RTD1619B_ISO_ISR_I2C0_SHIFT]		= BIT(8),
+	[RTD1619B_ISO_ISR_I2C1_SHIFT]		= BIT(11),
+	[RTD1619B_ISO_ISR_VFD_SHIFT]		= BIT(17),
+	[RTD1619B_ISO_ISR_GPIOA_SHIFT]		= BIT(19),
+	[RTD1619B_ISO_ISR_GPIODA_SHIFT]		= BIT(20),
+	[RTD1619B_ISO_ISR_PORB_HV_CEN_SHIFT]	= BIT(28),
+	[RTD1619B_ISO_ISR_PORB_DV_CEN_SHIFT]	= BIT(29),
+	[RTD1619B_ISO_ISR_PORB_AV_CEN_SHIFT]	= BIT(30),
+	[RTD1619B_ISO_ISR_I2C1_REQ_SHIFT]	= BIT(31),
+	[RTD1619B_ISO_ISR_WDOG1_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG2_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG3_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+	[RTD1619B_ISO_ISR_WDOG4_NMI_SHIFT]	= IRQ_ALWAYS_ENABLED,
+};
+
+enum rtd1619b_misc_isr_bits {
+	RTD1619B_MISC_ISR_UR1_SHIFT	= 3,
+	RTD1619B_MISC_ISR_TC5_SHIFT	= 4,
+	RTD1619B_MISC_ISR_UR1_TO_SHIFT	= 5,
+	RTD1619B_MISC_ISR_TC0_SHIFT	= 6,
+	RTD1619B_MISC_ISR_TC1_SHIFT	= 7,
+	RTD1619B_MISC_ISR_UR2_SHIFT	= 8,
+	RTD1619B_MISC_ISR_UR2_TO_SHIFT	= 13,
+	RTD1619B_MISC_ISR_I2C5_SHIFT	= 14,
+	RTD1619B_MISC_ISR_I2C4_SHIFT	= 15,
+	RTD1619B_MISC_ISR_I2C3_SHIFT	= 23,
+	RTD1619B_MISC_ISR_SC0_SHIFT	= 24,
+	RTD1619B_MISC_ISR_SC1_SHIFT	= 25,
+	RTD1619B_MISC_ISR_SPI_SHIFT	= 27,
+	RTD1619B_MISC_ISR_FAN_SHIFT	= 29,
+};
+
+static const u32 rtd1619b_misc_isr_to_scpu_int_en_mask[32] = {
+	[RTD1619B_MISC_ISR_UR1_SHIFT]		= BIT(3),
+	[RTD1619B_MISC_ISR_UR1_TO_SHIFT]	= BIT(5),
+	[RTD1619B_MISC_ISR_UR2_TO_SHIFT]	= BIT(6),
+	[RTD1619B_MISC_ISR_UR2_SHIFT]		= BIT(7),
+	[RTD1619B_MISC_ISR_I2C5_SHIFT]		= BIT(14),
+	[RTD1619B_MISC_ISR_I2C4_SHIFT]		= BIT(15),
+	[RTD1619B_MISC_ISR_SC0_SHIFT]		= BIT(24),
+	[RTD1619B_MISC_ISR_SC1_SHIFT]		= BIT(25),
+	[RTD1619B_MISC_ISR_SPI_SHIFT]		= BIT(27),
+	[RTD1619B_MISC_ISR_I2C3_SHIFT]		= BIT(28),
+	[RTD1619B_MISC_ISR_FAN_SHIFT]		= BIT(29),
+};
+
+static const struct realtek_intc_mask rtd1619b_intc_iso_cfgs[] = {
+	{ ISO_NORMAL_MASK, },
+	{ ISO_NMI_WDT_MASK, },
+};
+
+static const struct realtek_intc_info rtd1619b_intc_iso_info[] = {
+	{
+		.isr_offset		 = ISO_ISR_OFFSET,
+		.scpu_int_en_offset	 = ISO_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1619b_iso_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1619b_intc_iso_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1619b_intc_iso_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1619b_intc_iso_desc = {
+	.banks    = rtd1619b_intc_iso_info,
+	.bank_num = ARRAY_SIZE(rtd1619b_intc_iso_info),
+};
+
+static const struct realtek_intc_mask rtd1619b_intc_misc_cfgs[] = {
+	{ MISC_NORMAL_MASK, },
+	{ MISC_UART1_MASK, },
+	{ MISC_UART2_MASK, },
+};
+
+static const struct realtek_intc_info rtd1619b_intc_misc_info[] = {
+	{
+		.isr_offset		 = MISC_ISR_OFFSET,
+		.scpu_int_en_offset	 = MISC_ISR_EN_OFFSET,
+		.isr_to_scpu_int_en_mask = rtd1619b_misc_isr_to_scpu_int_en_mask,
+		.subset_mask		 = rtd1619b_intc_misc_cfgs,
+		.subset_num		 = ARRAY_SIZE(rtd1619b_intc_misc_cfgs),
+	}
+};
+
+static const struct realtek_intc_desc rtd1619b_intc_misc_desc = {
+	.banks    = rtd1619b_intc_misc_info,
+	.bank_num = ARRAY_SIZE(rtd1619b_intc_misc_info),
+};
+
+static const struct of_device_id realtek_intc_rtd1619b_dt_matches[] = {
+	{
+		.compatible = "realtek,rtd1619b-intc-iso",
+		.data = &rtd1619b_intc_iso_desc,
+	}, {
+		.compatible = "realtek,rtd1619b-intc-misc",
+		.data = &rtd1619b_intc_misc_desc,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, realtek_intc_rtd1619b_dt_matches);
+
+static DEFINE_NOIRQ_DEV_PM_OPS(realtek_intc_rtd1619b_pm_ops, realtek_intc_suspend,
+			       realtek_intc_resume);
+
+static int rtd1619b_intc_probe(struct platform_device *pdev)
+{
+	const struct realtek_intc_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	return realtek_intc_probe(pdev, desc);
+}
+
+static struct platform_driver realtek_intc_rtd1619b_driver = {
+	.probe = rtd1619b_intc_probe,
+	.remove = realtek_intc_remove,
+	.driver = {
+		.name = "realtek_intc_rtd1619b",
+		.of_match_table = realtek_intc_rtd1619b_dt_matches,
+		.pm = pm_sleep_ptr(&realtek_intc_rtd1619b_pm_ops),
+	},
+};
+module_platform_driver(realtek_intc_rtd1619b_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Realtek RTD1619B Interrupt Controller Driver");
-- 
2.43.0


