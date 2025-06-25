Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E25C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocDdj0hVIvfAypJKeWaD2HLoBygIkSc5blNo/Oq+QyM=; b=PJIAodEXJ4iDjqO+GCfR31thWq
	RnEDT1NDbphwlKuWaBLl+z0WSZFwfmC/QVSJ8HXfSuhu/7h1xb936PwAimQtfv9oFqh6zVkKc0hoK
	+QxEBxk+Ul14oOsGXIO0xLMKa46b8J792sYZDyF0h8WGsWJ7gcrq81hY23JyowHYyBtULMTO5dCD/
	FqHFelu39voRac9zxnWFdWLFYHOHm3RJKO7Di/kRG4AAHOgyS8Wrgk/oBuW1J8FDHYlH+OqBAXtAJ
	D+wL8NQF7hjg1z3IEXEor+DJmZFxRJ8AW5XV+TZ5bdP7olWxh5HAMhvfUKv1Nb+nMHoilmWml7Zwk
	1IRiElVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULT8-00000007x6A-3umN;
	Wed, 25 Jun 2025 08:26:58 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKeO-00000007pYZ-2f7m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:34:33 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 15:34:18 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 25 Jun 2025 15:34:18 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v5 2/2] mailbox: aspeed: add mailbox driver for AST27XX series SoC
Date: Wed, 25 Jun 2025 15:34:17 +0800
Message-ID: <20250625073417.2395037-3-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
References: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003432_675941_31EA48E0 
X-CRM114-Status: GOOD (  24.98  )
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

Add mailbox controller driver for AST27XX SoCs, which provides
independent tx/rx mailbox between different processors. There are 4
channels for each tx/rx mailbox and each channel has an 32-byte FIFO.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/mailbox/Kconfig           |   8 +
 drivers/mailbox/Makefile          |   2 +
 drivers/mailbox/ast2700-mailbox.c | 240 ++++++++++++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/mailbox/ast2700-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 68eeed660a4a..1c38cd570091 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -340,4 +340,12 @@ config THEAD_TH1520_MBOX
 	  kernel is running, and E902 core used for power management among other
 	  things.
 
+config AST2700_MBOX
+	tristate "ASPEED AST2700 IPC driver"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	help
+	  Mailbox driver implementation for ASPEED AST27XX SoCs. This driver
+	  can be used to send message between different processors in SoC.
+	  The driver provides mailbox support for sending interrupts to the
+	  clients. Say Y here if you want to build this driver.
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 13a3448b3271..9a9add9a7548 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -72,3 +72,5 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
 obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
 
 obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mailbox-th1520.o
+
+obj-$(CONFIG_AST2700_MBOX)	+= ast2700-mailbox.o
diff --git a/drivers/mailbox/ast2700-mailbox.c b/drivers/mailbox/ast2700-mailbox.c
new file mode 100644
index 000000000000..5470053f8139
--- /dev/null
+++ b/drivers/mailbox/ast2700-mailbox.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright Aspeed Technology Inc. (C) 2025. All rights reserved
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* Each bit in the register represents an IPC ID */
+#define IPCR_TX_TRIG		0x00
+#define IPCR_ENABLE		0x04
+#define IPCR_STATUS		0x08
+#define  RX_IRQ(n)		BIT(n)
+#define  RX_IRQ_MASK		0xf
+#define IPCR_DATA		0x10
+
+struct ast2700_mbox_data {
+	u8 num_chans;
+	u8 msg_size;
+};
+
+struct ast2700_mbox {
+	struct mbox_controller mbox;
+	u8 msg_size;
+	void __iomem *tx_regs;
+	void __iomem *rx_regs;
+	spinlock_t lock;
+};
+
+static inline int ch_num(struct mbox_chan *chan)
+{
+	return chan - chan->mbox->chans;
+}
+
+static inline bool ast2700_mbox_tx_done(struct ast2700_mbox *mb, int idx)
+{
+	return !(readl(mb->tx_regs + IPCR_STATUS) & BIT(idx));
+}
+
+static irqreturn_t ast2700_mbox_irq(int irq, void *p)
+{
+	struct ast2700_mbox *mb = p;
+	void __iomem *data_reg;
+	int num_words;
+	u32 *word_data;
+	u32 status;
+	int n;
+
+	/* Only examine channels that are currently enabled. */
+	status = readl(mb->rx_regs + IPCR_ENABLE) &
+		 readl(mb->rx_regs + IPCR_STATUS);
+
+	if (!(status & RX_IRQ_MASK))
+		return IRQ_NONE;
+
+	for (n = 0; n < mb->mbox.num_chans; ++n) {
+		struct mbox_chan *chan = &mb->mbox.chans[n];
+
+		if (!(status & RX_IRQ(n)))
+			continue;
+
+		/* Read the message data */
+		for (data_reg = mb->rx_regs + IPCR_DATA + mb->msg_size * n,
+		     word_data = chan->con_priv,
+		     num_words = (mb->msg_size / sizeof(u32));
+		     num_words;
+		     num_words--, data_reg += sizeof(u32), word_data++)
+			*word_data = readl(data_reg);
+
+		mbox_chan_received_data(chan, chan->con_priv);
+
+		/* The IRQ can be cleared only once the FIFO is empty. */
+		writel(RX_IRQ(n), mb->rx_regs + IPCR_STATUS);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int ast2700_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct ast2700_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	void __iomem *data_reg;
+	u32 *word_data;
+	int num_words;
+	int idx = ch_num(chan);
+
+	if (!(readl(mb->tx_regs + IPCR_ENABLE) & BIT(idx))) {
+		dev_warn(mb->mbox.dev, "%s: Ch-%d not enabled yet\n", __func__, idx);
+		return -EBUSY;
+	}
+
+	if (!(ast2700_mbox_tx_done(mb, idx))) {
+		dev_warn(mb->mbox.dev, "%s: Ch-%d last data has not finished\n", __func__, idx);
+		return -EBUSY;
+	}
+
+	/* Write the message data */
+	for (data_reg = mb->tx_regs + IPCR_DATA + mb->msg_size * idx,
+	     word_data = (u32 *)data,
+	     num_words = (mb->msg_size / sizeof(u32));
+	     num_words;
+	     num_words--, data_reg += sizeof(u32), word_data++)
+		writel(*word_data, data_reg);
+
+	writel(BIT(idx), mb->tx_regs + IPCR_TX_TRIG);
+	dev_dbg(mb->mbox.dev, "%s: Ch-%d sent\n", __func__, idx);
+
+	return 0;
+}
+
+static int ast2700_mbox_startup(struct mbox_chan *chan)
+{
+	struct ast2700_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	int idx = ch_num(chan);
+	void __iomem *reg = mb->rx_regs + IPCR_ENABLE;
+	unsigned long flags;
+
+	spin_lock_irqsave(&mb->lock, flags);
+	writel(readl(reg) | BIT(idx), reg);
+	spin_unlock_irqrestore(&mb->lock, flags);
+
+	return 0;
+}
+
+static void ast2700_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct ast2700_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	int idx = ch_num(chan);
+	void __iomem *reg = mb->rx_regs + IPCR_ENABLE;
+	unsigned long flags;
+
+	spin_lock_irqsave(&mb->lock, flags);
+	writel(readl(reg) & ~BIT(idx), reg);
+	spin_unlock_irqrestore(&mb->lock, flags);
+}
+
+static bool ast2700_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct ast2700_mbox *mb = dev_get_drvdata(chan->mbox->dev);
+	int idx = ch_num(chan);
+
+	return ast2700_mbox_tx_done(mb, idx);
+}
+
+static const struct mbox_chan_ops ast2700_mbox_chan_ops = {
+	.send_data	= ast2700_mbox_send_data,
+	.startup	= ast2700_mbox_startup,
+	.shutdown	= ast2700_mbox_shutdown,
+	.last_tx_done	= ast2700_mbox_last_tx_done,
+};
+
+static int ast2700_mbox_probe(struct platform_device *pdev)
+{
+	struct ast2700_mbox *mb;
+	const struct ast2700_mbox_data *dev_data;
+	struct device *dev = &pdev->dev;
+	int irq, ret;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	dev_data = device_get_match_data(&pdev->dev);
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return -ENOMEM;
+
+	mb->mbox.chans = devm_kcalloc(&pdev->dev, dev_data->num_chans,
+				      sizeof(*mb->mbox.chans), GFP_KERNEL);
+	if (!mb->mbox.chans)
+		return -ENOMEM;
+
+	/* con_priv of each channel is used to store the message received */
+	for (int i = 0; i < dev_data->num_chans; i++) {
+		mb->mbox.chans[i].con_priv = devm_kcalloc(dev, dev_data->msg_size,
+							  sizeof(u8), GFP_KERNEL);
+		if (!mb->mbox.chans[i].con_priv)
+			return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, mb);
+
+	mb->tx_regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mb->tx_regs))
+		return PTR_ERR(mb->tx_regs);
+
+	mb->rx_regs = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(mb->rx_regs))
+		return PTR_ERR(mb->rx_regs);
+
+	mb->msg_size = dev_data->msg_size;
+	mb->mbox.dev = dev;
+	mb->mbox.num_chans = dev_data->num_chans;
+	mb->mbox.ops = &ast2700_mbox_chan_ops;
+	mb->mbox.txdone_irq = false;
+	mb->mbox.txdone_poll = true;
+	mb->mbox.txpoll_period = 5;
+	spin_lock_init(&mb->lock);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, ast2700_mbox_irq, 0, dev_name(dev), mb);
+	if (ret)
+		return ret;
+
+	return devm_mbox_controller_register(dev, &mb->mbox);
+}
+
+static const struct ast2700_mbox_data ast2700_dev_data = {
+	.num_chans = 4,
+	.msg_size = 0x20,
+};
+
+static const struct of_device_id ast2700_mbox_of_match[] = {
+	{ .compatible = "aspeed,ast2700-mailbox", .data = &ast2700_dev_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ast2700_mbox_of_match);
+
+static struct platform_driver ast2700_mbox_driver = {
+	.driver = {
+		.name = "ast2700-mailbox",
+		.of_match_table = ast2700_mbox_of_match,
+	},
+	.probe = ast2700_mbox_probe,
+};
+module_platform_driver(ast2700_mbox_driver);
+
+MODULE_AUTHOR("Jammy Huang <jammy_huang@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED AST2700 IPC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


