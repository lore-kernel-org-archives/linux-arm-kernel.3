Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ECBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSnuV7NFKqLfEdicMGhW/Yk9YcsG6/hOszPvPqq1AeU=; b=MWQ5M1Q3q4TOTLn4BaCDRIdzRr
	qkNddRIbRAejab8uObTnXxDoUVmtMcWY1S060HVhgcUqZKnHR88ihmBpcbWytoe7lNDQix7eI1dZX
	VINcc492bRb13/OQ5TZI71E3oLly4hjKVKaE+saVPMF7Ok7VfQS3RVj2fk6StwBBy0QsgYhog62zy
	TwFrAgcqa4JSoycX0M+B2TS1/+u9rP8SsC1lWSxwlj17KwNvAJsAuW9mVvo+R0UUs5EoNjpr1zO2Q
	pZMVvqGSY1GW2x6kYdT3dYziqJbQU1xVQpRaOK5fctdWDckHrPqHfucVxfYHLO6J9Ol0CmmJgrxU2
	vheax+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6oV-00000004T8k-30VD;
	Mon, 30 Dec 2024 03:51:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6jr-00000004SVP-204m;
	Mon, 30 Dec 2024 03:46:44 +0000
X-UUID: ac32b468c66011ef9048ed6ed365623b-20241229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bSnuV7NFKqLfEdicMGhW/Yk9YcsG6/hOszPvPqq1AeU=;
	b=VJ20Zezsh+c70wgLBdiy9eMD3GDMO8O9D+SwDIJNXCPkEhzIeFgVLfoJ/GTFqJJXX4EQ/vhTSTQ3tg4ShTUTgIw3XFlhA9LHFWw6SRiSKWSuo/VOyuVWaLj9tSMY4HKoO7SVjUBW1FbyaEyooNhLbF55E9cz37EhGoSvoSgedEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ace82984-a39e-4865-93cb-14d60b8e24e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:6ef26125-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ac32b468c66011ef9048ed6ed365623b-20241229
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 948885134; Sun, 29 Dec 2024 20:46:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 11:46:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 11:46:35 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng
	<Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
Date: Mon, 30 Dec 2024 11:43:37 +0800
Message-ID: <20241230034446.1195728-4-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230034446.1195728-1-karl.li@mediatek.com>
References: <20241230034446.1195728-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_194643_521329_55ECDDA3 
X-CRM114-Status: GOOD (  24.83  )
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

From: Karl Li <karl.li@mediatek.com>

Add mtk-apu-mailbox driver to support the communication with
APU remote microprocessor.

Also, the mailbox hardware contains extra spare (scratch) registers
that other hardware blocks use to communicate through.
Use regmap to provide the such operations.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 drivers/mailbox/Kconfig                 |   9 ++
 drivers/mailbox/Makefile                |   2 +
 drivers/mailbox/mtk-apu-mailbox.c       | 202 ++++++++++++++++++++++++
 include/linux/mailbox/mtk-apu-mailbox.h |  15 ++
 4 files changed, 228 insertions(+)
 create mode 100644 drivers/mailbox/mtk-apu-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-apu-mailbox.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 8ecba7fb999e..7cea37e7b9df 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -241,6 +241,15 @@ config MTK_ADSP_MBOX
           between processors with ADSP. It will place the message to share
 	  buffer and will access the ipc control.
 
+config MTK_APU_MBOX
+	tristate "MediaTek APU Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for the MediaTek APU Mailbox
+	  driver. The mailbox implementation provides access from the
+	  application processor to the MediaTek AI Processing Unit.
+	  If unsure say N.
+
 config MTK_CMDQ_MBOX
 	tristate "MediaTek CMDQ Mailbox Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 5f4f5b0ce2cc..0b992be69f6f 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -53,6 +53,8 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
 
+obj-$(CONFIG_MTK_APU_MBOX)	+= mtk-apu-mailbox.o
+
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
diff --git a/drivers/mailbox/mtk-apu-mailbox.c b/drivers/mailbox/mtk-apu-mailbox.c
new file mode 100644
index 000000000000..44f84cdc9ff4
--- /dev/null
+++ b/drivers/mailbox/mtk-apu-mailbox.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#include <asm/io.h>
+#include <linux/bits.h>
+#include <linux/bitops.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-apu-mailbox.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MTK_APU_MBOX_INBOX		(0x0)
+#define MTK_APU_MBOX_OUTBOX		(0x20)
+#define MTK_APU_MBOX_INBOX_IRQ		(0xc0)
+#define MTK_APU_MBOX_OUTBOX_IRQ		(0xc4)
+#define MTK_APU_MBOX_INBOX_IRQ_MASK	(0xd0)
+
+#define MTK_APU_MBOX_SPARE_OFF_START	(0x40)
+#define MTK_APU_MBOX_SPARE_OFF_END	(0xB0)
+
+struct mtk_apu_mailbox_platdata {
+	u8 msg_mbox_slots;
+};
+
+struct mtk_apu_mailbox {
+	u8 msg_mbox_slots;
+	struct device *dev;
+	void __iomem *regs;
+	struct mbox_controller mbox;
+	struct mtk_apu_mailbox_msg msgs;
+};
+
+static inline struct mtk_apu_mailbox *get_mtk_apu_mailbox(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct mtk_apu_mailbox, mbox);
+}
+
+static irqreturn_t mtk_apu_mailbox_irq(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mtk_apu_mailbox *apu_mbox = get_mtk_apu_mailbox(chan->mbox);
+	struct mbox_chan *link = &apu_mbox->mbox.chans[0];
+	u8 data_cnt = fls(readl(apu_mbox->regs + MTK_APU_MBOX_OUTBOX_IRQ));
+
+	memcpy_fromio(apu_mbox->msgs.data, apu_mbox->regs + MTK_APU_MBOX_OUTBOX,
+		      sizeof(*apu_mbox->msgs.data) * data_cnt);
+
+	mbox_chan_received_data(link, apu_mbox->msgs.data);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_apu_mailbox_irq_thread(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mtk_apu_mailbox *apu_mbox = get_mtk_apu_mailbox(chan->mbox);
+	struct mbox_chan *link = &apu_mbox->mbox.chans[0];
+
+	mbox_chan_received_data_bh(link, apu_mbox->msgs.data);
+	writel(readl(apu_mbox->regs + MTK_APU_MBOX_OUTBOX_IRQ),
+	       apu_mbox->regs + MTK_APU_MBOX_OUTBOX_IRQ);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_apu_mailbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_apu_mailbox *apu_mbox = get_mtk_apu_mailbox(chan->mbox);
+	struct mtk_apu_mailbox_msg *msg = data;
+
+	if (msg->data_cnt <= 0 || msg->data_cnt > apu_mbox->msg_mbox_slots) {
+		dev_err(apu_mbox->dev, "%s: invalid data_cnt %d\n", __func__, msg->data_cnt);
+		return -EINVAL;
+	}
+
+	/*
+	 *	Mask lowest "data_cnt-1" interrupts bits, so the interrupt on the other side
+	 *	triggers only after the last data slot is written (sent).
+	 */
+	writel(GENMASK(msg->data_cnt - 2, 0), apu_mbox->regs + MTK_APU_MBOX_INBOX_IRQ_MASK);
+	memcpy_toio(apu_mbox->regs + MTK_APU_MBOX_INBOX,
+		    msg->data, sizeof(*msg->data) * msg->data_cnt);
+
+	return 0;
+}
+
+static bool mtk_apu_mailbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_apu_mailbox *apu_mbox = get_mtk_apu_mailbox(chan->mbox);
+
+	return readl(apu_mbox->regs + MTK_APU_MBOX_INBOX_IRQ) == 0;
+}
+
+static const struct mbox_chan_ops mtk_apu_mailbox_ops = {
+	.send_data = mtk_apu_mailbox_send_data,
+	.last_tx_done = mtk_apu_mailbox_last_tx_done,
+};
+
+static bool mtk_apu_mailbox_regmap_accessible_reg(struct device *dev,
+						  unsigned int reg)
+{
+	if (reg >= MTK_APU_MBOX_SPARE_OFF_START && reg < MTK_APU_MBOX_SPARE_OFF_END)
+		return true;
+	return false;
+}
+
+static const struct regmap_config mtk_apu_mailbox_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x100,
+	.readable_reg	= mtk_apu_mailbox_regmap_accessible_reg,
+	.writeable_reg	= mtk_apu_mailbox_regmap_accessible_reg,
+};
+
+static int mtk_apu_mailbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mtk_apu_mailbox_platdata *data;
+	struct mtk_apu_mailbox *apu_mbox;
+	struct regmap *regmap;
+	int irq = -1, ret = 0;
+
+	data = of_device_get_match_data(dev);
+
+	apu_mbox = devm_kzalloc(dev, sizeof(*apu_mbox), GFP_KERNEL);
+	if (!apu_mbox)
+		return -ENOMEM;
+
+	apu_mbox->dev = dev;
+	platform_set_drvdata(pdev, apu_mbox);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	apu_mbox->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(apu_mbox->regs))
+		return PTR_ERR(apu_mbox->regs);
+
+	apu_mbox->msg_mbox_slots = data->msg_mbox_slots;
+	apu_mbox->msgs.data = devm_kcalloc(dev, apu_mbox->msg_mbox_slots,
+					   sizeof(*apu_mbox->msgs.data), GFP_KERNEL);
+	if (!apu_mbox->msgs.data)
+		return -ENOMEM;
+
+	apu_mbox->mbox.txdone_irq = false;
+	apu_mbox->mbox.txdone_poll = true;
+	apu_mbox->mbox.txpoll_period = 1;
+	apu_mbox->mbox.ops = &mtk_apu_mailbox_ops;
+	apu_mbox->mbox.dev = dev;
+	apu_mbox->mbox.num_chans = 1;
+	apu_mbox->mbox.chans = devm_kcalloc(dev, apu_mbox->mbox.num_chans,
+					    sizeof(*apu_mbox->mbox.chans),
+					    GFP_KERNEL);
+	if (!apu_mbox->mbox.chans)
+		return -ENOMEM;
+
+	ret = devm_mbox_controller_register(dev, &apu_mbox->mbox);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, irq, mtk_apu_mailbox_irq,
+					mtk_apu_mailbox_irq_thread, IRQF_ONESHOT,
+					dev_name(dev), apu_mbox->mbox.chans);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	regmap = devm_regmap_init_mmio(dev, apu_mbox->regs, &mtk_apu_mailbox_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return 0;
+}
+
+static const struct mtk_apu_mailbox_platdata mt8196_platdata = {
+	.msg_mbox_slots = 8,
+};
+
+static const struct of_device_id mtk_apu_mailbox_of_match[] = {
+	{ .compatible = "mediatek,mt8196-apu-mailbox", .data = &mt8196_platdata },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_apu_mailbox_of_match);
+
+static struct platform_driver mtk_apu_mailbox_driver = {
+	.probe = mtk_apu_mailbox_probe,
+	.driver = {
+		.name = "mtk-apu-mailbox",
+		.of_match_table = mtk_apu_mailbox_of_match,
+	},
+};
+module_platform_driver(mtk_apu_mailbox_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek APU Mailbox Driver");
diff --git a/include/linux/mailbox/mtk-apu-mailbox.h b/include/linux/mailbox/mtk-apu-mailbox.h
new file mode 100644
index 000000000000..0afce8848205
--- /dev/null
+++ b/include/linux/mailbox/mtk-apu-mailbox.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ *
+ */
+
+#ifndef __MTK_APU_MAILBOX_H__
+#define __MTK_APU_MAILBOX_H__
+
+struct mtk_apu_mailbox_msg {
+	u8 data_cnt;
+	u32 *data;
+};
+
+#endif /* __MTK_APU_MAILBOX_H__ */
-- 
2.18.0


