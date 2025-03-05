Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InaeS8/UkU8eLyrlVZZUnJa6Ghra5rWqfYuQwgP38JU=; b=Ick6GA4XD/cySnhlCHDDFc2dDa
	N6b6ZBVBzdrS6cqo+5tcIZkwwkmFGSssJkNQ2HZQNXEK9VcuLvlaNgkAEYBNvspkTW5OoVj4wmSJL
	ki4MwIaWQMPqpbdrwd1cW3ajLGhI6TQQnpfvyGzcBrWOKFlhDeYRFdytsNLSlwfZX4G2UVLFAq1Ku
	3a3PMQ6FmD12gdLMZkPdNyVIyczLyu9mPyuU1lKtehWWyEnQbohAH/mccQxMRBIUDxWlTWNCzIV3w
	zme2Sj6Ina4Jk5gl42QHtQ1zqU/+voqplUHXhGhJZCZTn40pZWglnmBDJbB9DkOT6/IBtQSpieITc
	drvNyeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk47-00000007MdS-0UN0;
	Wed, 05 Mar 2025 08:25:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjzw-00000007Lxg-3IlX;
	Wed, 05 Mar 2025 08:21:01 +0000
X-UUID: c2372e48f99a11ef83f2a1c9db70dae0-20250305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=InaeS8/UkU8eLyrlVZZUnJa6Ghra5rWqfYuQwgP38JU=;
	b=uqbtiRlha3/mspW7E3V4bmvKL7LxQ8mQlrESBKYu9kwxiKWZ/PKyEbDtbwYSwASCr8RFXvK7KdApGC/eW4vO3Z4nSYWAuAr0dP1v+/mOwjJJB3Y5PGbz9s+GkAeHXHSsSTGmAnvXyzylthRb0I1+qBPoyMsyHID4Q4NgNRNgQVs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9547ff49-2b2e-40c5-9845-432a036b9ef2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6c0cb649-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c2372e48f99a11ef83f2a1c9db70dae0-20250305
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1164494331; Wed, 05 Mar 2025 01:20:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 5 Mar 2025 16:20:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 5 Mar 2025 16:20:51 +0800
From: Jjian Zhou <jjian.zhou@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Jjian Zhou <jjian.zhou@mediatek.com>
Subject: [PATCH RFC 1/3] mailbox: mediatek: Add mtk-vcp-mailbox driver
Date: Wed, 5 Mar 2025 16:20:38 +0800
Message-ID: <20250305082047.15746-2-jjian.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250305082047.15746-1-jjian.zhou@mediatek.com>
References: <20250305082047.15746-1-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_002100_836516_880A3AD2 
X-CRM114-Status: GOOD (  25.04  )
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

Add mtk-vcp-mailbox driver to support the communication with
VCP remote microprocessor.

Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
---
 drivers/mailbox/Kconfig                 |   9 ++
 drivers/mailbox/Makefile                |   2 +
 drivers/mailbox/mtk-vcp-mailbox.c       | 179 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-vcp-mailbox.h |  34 +++++
 4 files changed, 224 insertions(+)
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ed52db272f4d..ffc4a5491462 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -275,6 +275,15 @@ config MTK_CMDQ_MBOX
 	  critical time limitation, such as updating display configuration
 	  during the vblank.

+config MTK_VCP_MBOX
+	tristate "MediaTek VCP Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for the MediaTek VCP mailbox driver.
+	  The mailbox implementation provides access from the application
+	  processor to the MediaTek Video Processing Unit.
+	  If unsure say N.
+
 config ZYNQMP_IPI_MBOX
 	tristate "Xilinx ZynqMP IPI Mailbox"
 	depends on ARCH_ZYNQMP && OF
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 9a1542b55539..75a200a9d2d2 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -59,6 +59,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o

 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o

+obj-$(CONFIG_MTK_VCP_MBOX)	+= mtk-vcp-mailbox.o
+
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o

 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-mailbox.c
new file mode 100644
index 000000000000..fd7a123c71c8
--- /dev/null
+++ b/drivers/mailbox/mtk-vcp-mailbox.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
+ * Author: Jjian Zhou <jjian.zhou.@mediatek.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-vcp-mailbox.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct mtk_vcp_mbox_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct mbox_controller mbox;
+	const struct mtk_vcp_mbox_cfg *cfg;
+	struct mtk_ipi_info ipi_recv;
+};
+
+struct mtk_vcp_mbox_cfg {
+	u32 set_in;
+	u32 clr_out;
+};
+
+static inline struct mtk_vcp_mbox_priv *get_mtk_vcp_mbox_priv(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct mtk_vcp_mbox_priv, mbox);
+}
+
+static irqreturn_t mtk_vcp_mbox_irq_thread(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mtk_vcp_mbox_priv *priv = get_mtk_vcp_mbox_priv(chan->mbox);
+
+	/* get irq status */
+	priv->ipi_recv.irq_status = readl(priv->base + priv->cfg->clr_out);
+
+	__ioread32_copy(priv->ipi_recv.msg, priv->base, MAX_SLOT_NUM);
+
+	mbox_chan_received_data(chan, &priv->ipi_recv);
+
+	/* clear irq status */
+	writel(priv->ipi_recv.irq_status, priv->base + priv->cfg->clr_out);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox,
+					    const struct of_phandle_args *sp)
+{
+	if (sp->args_count)
+		return NULL;
+
+	return mbox->chans;
+}
+
+static int mtk_vcp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_vcp_mbox_priv *priv = get_mtk_vcp_mbox_priv(chan->mbox);
+	struct mtk_ipi_info *ipi_info = data;
+	u32 status;
+
+	if (!ipi_info->msg) {
+		dev_err(priv->dev, "msg buffer is NULL.\n");
+		return -ENOMEM;
+	}
+
+	status = readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->index);
+	if (status) {
+		dev_err(priv->dev, "mailbox IPI %d is busy.\n", ipi_info->id);
+		return -EBUSY;
+	}
+
+	if (ipi_info->slot_ofs + ipi_info->len > MBOX_SLOT_MAX_SIZE)
+		return -EINVAL;
+	__iowrite32_copy(priv->base + ipi_info->slot_ofs, ipi_info->msg,
+			 ipi_info->len);
+
+	writel(BIT(ipi_info->index), priv->base + priv->cfg->set_in);
+
+	return 0;
+}
+
+static bool mtk_vcp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_ipi_info *ipi_info = chan->active_req;
+	struct mtk_vcp_mbox_priv *priv = get_mtk_vcp_mbox_priv(chan->mbox);
+	u32 op;
+
+	op = readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->index);
+	return !op;
+}
+
+static const struct mbox_chan_ops mtk_vcp_mbox_chan_ops = {
+	.send_data	= mtk_vcp_mbox_send_data,
+	.last_tx_done	= mtk_vcp_mbox_last_tx_done,
+};
+
+static int mtk_vcp_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_vcp_mbox_priv *priv;
+	struct mbox_controller *mbox;
+	int ret, irq;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	mbox = &priv->mbox;
+	mbox->dev = dev;
+	mbox->ops = &mtk_vcp_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = true;
+	mbox->of_xlate = mtk_vcp_mbox_xlate;
+	mbox->num_chans = 1;
+	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	priv->ipi_recv.msg = devm_kzalloc(dev, sizeof(u8) * MBOX_SLOT_MAX_SIZE,
+					  GFP_KERNEL);
+	if (!priv->ipi_recv.msg)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->cfg = of_device_get_match_data(dev);
+	if (!priv->cfg)
+		return -EINVAL;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					mtk_vcp_mbox_irq_thread, IRQF_ONESHOT,
+					dev_name(dev), mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	dev_dbg(dev, "MTK VCP mailbox initialized\n");
+
+	return devm_mbox_controller_register(dev, &priv->mbox);
+}
+
+static const struct mtk_vcp_mbox_cfg mt8196_cfg = {
+	.set_in		= 0x100,
+	.clr_out	= 0x10C,
+};
+
+static const struct of_device_id mtk_vcp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8196-vcp-mbox", .data = &mt8196_cfg },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_vcp_mbox_of_match);
+
+static struct platform_driver mtk_vcp_mbox_driver = {
+	.probe		= mtk_vcp_mbox_probe,
+	.driver = {
+		.name	= "mtk_vcp_mbox",
+		.of_match_table = mtk_vcp_mbox_of_match,
+	},
+};
+module_platform_driver(mtk_vcp_mbox_driver);
+
+MODULE_AUTHOR("Jjian Zhou <jjian.zhou@mediatek.com>");
+MODULE_DESCRIPTION("MTK VCP Mailbox Controller");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/mtk-vcp-mailbox.h b/include/linux/mailbox/mtk-vcp-mailbox.h
new file mode 100644
index 000000000000..953499b7cfeb
--- /dev/null
+++ b/include/linux/mailbox/mtk-vcp-mailbox.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef __MTK_VCP_MAILBOX_H__
+#define __MTK_VCP_MAILBOX_H__
+
+#define MBOX_SLOT_MAX_SIZE	0x100 /* mbox max slot size */
+#define MAX_SLOT_NUM	64
+
+/**
+ * struct mtk_ipi_info - channel table that belong to mtk_ipi_device
+ * @msg: The share buffer between IPC and mailbox driver
+ * @len: Message length
+ * @id: IPI number
+ * @recv_opt: Recv option,  0:receive ,1: response
+ * @index: The pin groups number of the mailbox channel
+ * @slot_ofs: Slot offset of the mailbox channel
+ * @irq_status: Indicate which pin groups triggered the interrupt
+ *
+ * It is used between IPC with mailbox driver.
+ */
+struct mtk_ipi_info {
+	void *msg;
+	u32 len;
+	u32 id;
+	u32 recv_opt;
+	u32 index;
+	u32 slot_ofs;
+	u32 irq_status;
+};
+
+#endif
--
2.45.2


