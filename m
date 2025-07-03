Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DECC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtRyD5KikdeypI6oCxDk/+LkZhjYjjLnMvlR7eMC6kA=; b=P8+1uWUHswl+08YJ6oec9JId2z
	sILmLCerC+kTrYfryspmC0zxHkBuj45Rk+hiOY7dSCV3BpPLDIVAqrcSrkjHYuXDqgHfvyhmKaEtH
	1YVYxBsBaLrDezc6slfAFdoWc++zIojQOc5DKQA2fM1VTFux+y+q+iNK0W87cfOF3wBUSF5v+18yF
	Q086u8VcmX00SoOl2qDRfnNZPj0ISLizwKgh3O3oBn2JJk1No0hecuDg68F48T4K3iwsoHGhoLw+/
	fFKoEjpowdJdsYuukm1l7E1aRET63l5qSuhsCVlAg6uITWPQ80HvV8MrZMZ8UQB1X1b5DNjHRmSUI
	dXqVs2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJRL-0000000BOmr-1KWf;
	Thu, 03 Jul 2025 12:53:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIO4-0000000BCec-30XK;
	Thu, 03 Jul 2025 11:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543155;
	bh=zt20Qy3CieaOIiZUFtQZw2VGeHUHAWGAW6laSa6fU50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1c+SvzR54Bzsh1h84VC66FmcJf98YwR5iGj4jD6Twzfz4PR2KAt+V4VgAWnxlOPz
	 6Pe3lnMZCgkGW61bwX5tBrGcvOTaju/HtVgg4ALkeS+xsK8bMuFirbShIykAIhE1Lp
	 u6UaP6jnU/g3TTQa/CSPnMLaIjc68UDX2qepsTdx8UT6gb/5opXmDDeMbWmbOS8fC5
	 r3t7C0j9cy75SLydNV1R7tJaA8s3zmiMD30pUqVKPDtdDlF972H+E2tglg/fcK0y37
	 DT/GM1wX8oIp+tzVhmjZaEiYNBwFKapAad3NU//do98JM7uuxBm+l5+KVjBbjr9Ahv
	 obvdiZItDqc9g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57AEB17E09C6;
	Thu,  3 Jul 2025 13:45:54 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] mailbox: Add MediaTek TinySYS MHU-like Mailbox
Date: Thu,  3 Jul 2025 13:45:49 +0200
Message-ID: <20250703114549.114313-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
References: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_044556_933936_EB75CB42 
X-CRM114-Status: GOOD (  22.04  )
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

Add the MediaTek TinySYS mailbox, used for IPC with the TinySYS
MCU that is integrated in variousSoCs, enabling communication
with remote processors that use the MediaTek IPIC framework
through the TinySYS SCMI protocol.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/Kconfig               |   9 ++
 drivers/mailbox/Makefile              |   2 +
 drivers/mailbox/mtk-tinysys-mailbox.c | 195 ++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/mailbox/mtk-tinysys-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 68eeed660a4a..35149110cb3a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -285,6 +285,15 @@ config MTK_CMDQ_MBOX
 	  critical time limitation, such as updating display configuration
 	  during the vblank.
 
+config MTK_TINYSYS_MBOX
+	tristate "MediaTek TINYSYS Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  The MediaTek TinySYS mailbox is used to communicate with remote
+	  processors based on the MediaTek IPIC framework.
+	  Say yes here to add support for the MediaTek TinySYS mailbox
+	  driver.
+
 config ZYNQMP_IPI_MBOX
 	tristate "Xilinx ZynqMP IPI Mailbox"
 	depends on ARCH_ZYNQMP && OF
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 13a3448b3271..415eb1d9ed47 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -61,6 +61,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
 
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
+obj-$(CONFIG_MTK_TINYSYS_MBOX)	+= mtk-tinysys-mailbox.o
+
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
diff --git a/drivers/mailbox/mtk-tinysys-mailbox.c b/drivers/mailbox/mtk-tinysys-mailbox.c
new file mode 100644
index 000000000000..0c33505dfd04
--- /dev/null
+++ b/drivers/mailbox/mtk-tinysys-mailbox.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
+#define MTK_SIP_TINYSYS_SSPM_CONTROL	MTK_SIP_SMC_CMD(0x53c)
+#define MTK_TINYSYS_SSPM_OP_MBOX_CLR	0
+#define MTK_TINYSYS_SSPM_OP_MD2SPM_CLR	1
+
+#define INTR_SET_OFS	0x0
+#define INTR_CLR_OFS	0x4
+
+struct mtk_tinysys_mhu_mbox_pdata {
+	bool is_secure_mbox;
+	bool notify_spm;
+};
+
+struct mtk_tinysys_mhu_mbox {
+	void __iomem *base;
+	int irq;
+	const struct mtk_tinysys_mhu_mbox_pdata *pdata;
+	struct mbox_controller mbox;
+};
+
+static inline struct mtk_tinysys_mhu_mbox *to_mtk_tinysys_mhu_mbox(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct mtk_tinysys_mhu_mbox, mbox);
+}
+
+static irqreturn_t mtk_tinysys_mhu_mbox_irq(int irq, void *data)
+{
+	u32 val;
+	struct arm_smccc_res res;
+	struct mbox_chan *chan = data;
+	struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
+
+	val = readl_relaxed(priv->base + INTR_CLR_OFS);
+	if (!val)
+		return IRQ_NONE;
+
+	if (priv->pdata->is_secure_mbox) {
+		/* Can't fail: ignore res.a0 checks */
+		arm_smccc_smc(MTK_SIP_TINYSYS_SSPM_CONTROL,
+			      MTK_TINYSYS_SSPM_OP_MBOX_CLR,
+			      priv->irq, 0, 0, 0, 0, 0, &res);
+	} else {
+		writel(1, priv->base + INTR_CLR_OFS);
+	}
+
+	mbox_chan_received_data(chan, (void *)&val);
+
+	if (priv->pdata->notify_spm)
+		arm_smccc_smc(MTK_SIP_TINYSYS_SSPM_CONTROL,
+			      MTK_TINYSYS_SSPM_OP_MD2SPM_CLR,
+			      priv->irq, 0, 0, 0, 0, 0, &res);
+	return IRQ_HANDLED;
+}
+
+static bool mtk_tinysys_mhu_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
+	u32 val = readl_relaxed(priv->base + INTR_SET_OFS);
+
+	return val == 0;
+}
+
+static int mtk_tinysys_mhu_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
+	u32 *arg = data;
+
+	writel_relaxed(*arg, priv->base + INTR_SET_OFS);
+
+	return 0;
+}
+
+static int mtk_tinysys_mhu_mbox_startup(struct mbox_chan *chan)
+{
+	struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
+
+	irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
+	enable_irq(priv->irq);
+
+	return 0;
+}
+
+static void mtk_tinysys_mhu_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mtk_tinysys_mhu_mbox *priv = to_mtk_tinysys_mhu_mbox(chan->mbox);
+
+	disable_irq(priv->irq);
+}
+
+static const struct mbox_chan_ops tinysys_mbox_chan_ops = {
+	.send_data = mtk_tinysys_mhu_mbox_send_data,
+	.startup = mtk_tinysys_mhu_mbox_startup,
+	.shutdown = mtk_tinysys_mhu_mbox_shutdown,
+	.last_tx_done = mtk_tinysys_mhu_mbox_last_tx_done,
+};
+
+static int mtk_tinysys_mhu_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_tinysys_mhu_mbox *priv;
+	struct mbox_controller *mbox;
+	int ret;
+
+	/* Allocate memory for device */
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	priv->pdata = device_get_match_data(dev);
+	if (!priv->pdata)
+		return -EINVAL;
+
+	mbox = &priv->mbox;
+	mbox->dev = dev;
+	mbox->ops = &tinysys_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = true;
+	mbox->txpoll_period = 1;
+	mbox->num_chans = 1;
+	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_request_irq(dev, priv->irq, mtk_tinysys_mhu_mbox_irq,
+			       IRQF_NO_AUTOEN, dev_name(dev), mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_mbox_controller_register(dev, &priv->mbox);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register mailbox\n");
+
+	return 0;
+}
+
+static const struct mtk_tinysys_mhu_mbox_pdata mt6985_tsmhu_mbox_cfg = {
+	/* Unsecured mailbox, no SPM notification */
+};
+
+static const struct mtk_tinysys_mhu_mbox_pdata mt6989_tsmhu_mbox_cfg = {
+	.is_secure_mbox = true,
+};
+
+static const struct mtk_tinysys_mhu_mbox_pdata mt8196_tsmhu_mbox_cfg = {
+	.notify_spm = true,
+};
+
+static const struct of_device_id mtk_tinysys_mhu_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt6985-tinysys-mhu-mbox", .data = &mt6985_tsmhu_mbox_cfg },
+	{ .compatible = "mediatek,mt6989-tinysys-mhu-mbox", .data = &mt6989_tsmhu_mbox_cfg },
+	{ .compatible = "mediatek,mt8196-tinysys-mhu-mbox", .data = &mt8196_tsmhu_mbox_cfg },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_tinysys_mhu_mbox_of_match);
+
+static struct platform_driver mtk_tinysys_mhu_mbox_drv = {
+	.probe = mtk_tinysys_mhu_mbox_probe,
+	.driver = {
+		.name = "mtk-tinysys-mhu-mbox",
+		.of_match_table = mtk_tinysys_mhu_mbox_of_match,
+	}
+};
+module_platform_driver(mtk_tinysys_mhu_mbox_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek TinySYS Mailbox Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.49.0


