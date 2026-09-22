Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A7C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2uziLQOk+bji3p29enFotWbAp/mDZsSoT5HVW4iEys=; b=a9Enzt2n3CoZPilnkNIJPU6yKt
	GAUsRzv335kNqJcRC/tlkdeXQ7yPiLRIdqYT9wZwzOTOUoR56eI1GsAoGW3dikHld0yQODvGsMkVG
	xGuQUsGZ0UdAQAOJuqdkyYmBn5hmDO17J+zt5HgfnDBdxFpNLrYsM4bhaqjIBbiTVGVFAX/jMrRJz
	WEszT9Y7V4j8TE9Td3rj30AYyQ+NvojRU41Lg64DTkZeTmfUASHvDJ9SOU8O7C29KYRCP9tbeQu/O
	b3pmaRrZGTief3UZ2WXwdlc/K4KLVRHk2+/3J7FRFYCMsd93t+88lEcymiNMfVz+KEp7zMPsS/Yir
	r4gvUUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTw-000000046hL-0I7Y;
	Tue, 22 Sep 2026 03:47:49 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTk-000000046eD-3RYR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:47:40 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d440939f0so28618517b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048855; x=1790653655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uziLQOk+bji3p29enFotWbAp/mDZsSoT5HVW4iEys=;
        b=oZEBybvQRkxfZPhD5iDLWegn9/jzm1feLdxVH4nGYdoQbXLsog4pfksnruKU2UXwwk
         ZjuUSvliyFj63UhgCO8+kCvNlCOJCb8LyVHbzlm1o860NN7RepJ8qrY+yjLPYJuMDl2E
         +fdiyobYBe5ShsNSHphxW32xVyuy+I7QwXAPZ0BBK0SKC8nk6ZI5XcSOszVM8QgGa07s
         tjJp5l6fqJrVjVntgPaRr0d6XABhFAJzsTQ/4IUGXWOtBLOixDuZITaWrLdePMq1wZOZ
         Sg58io9J8g52uh3kUSLaOy3cOk6m3P0n6zc6eE2TElXxzN5CWCUBZs6KLXPiWJIx2gee
         RrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048855; x=1790653655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2uziLQOk+bji3p29enFotWbAp/mDZsSoT5HVW4iEys=;
        b=sPuXZttsR8XpER8pNEnq8YRmqVggpVL26k1y3wv1pejKefrqooZk5dHrFJjA1Ts2mK
         1bTrc/5hOg7SdMaX0JBLVlbxmn5d8GH0ev9t4n4wu00DbJWMcCz51WDi85XcPwUDk5rI
         Ko6hAqhPZk4GAq06Bb8/Z9huBhKEbH4rSABGkHSdX7x4r5PV6RdV/imVx0uv+X2gPlmi
         UbzutMyTyn/0yjiLYpQcrnK8yep3px7DjkW7RVq8HVzsSqsLYnMy6phzNNfSH6cDI5M/
         6J5t/Yujp6XNBiF7kNuO2aBQ9x+weePHXO/3PokzoG/QmqTxJmjMnH9RmP3ZEFuzgnAg
         MC8A==
X-Forwarded-Encrypted: i=1; AKwUvBx7EtxtslqO8Ndwy9XUma0mXlNczkfMqmmJjB/sky4OCBrYe3V4YW2wRzrzJXM78KWf+gG5l+Tycy1yaAhkspkA@lists.infradead.org
X-Gm-Message-State: AFuF++kJSwQxmtdBvHCXrDJwOU5Vew+EmaWKoL4pODa8bMl5HgHsTsmF
	uB1DTZjq3dqtioFgldbOh4+hnRBwO9PGqk5a9qMXvrbPic4PW/qccfhf
X-Gm-Gg: AYBFou1MaNElW1LMohxPdt142Pik7t8A4twgyTMcnRhTQnZwb+2g2y1GeunkVqWOhom
	x2xCrmfxOUq5SR1krpB+fXLo7Sxd1ldZQ+ivRmDZIH/G5CaU+MWT6tVN90Jpwr6J1tVJJPIBAoq
	jOMrGn300SJgBKpz/tVun0xr082OaAWhSKOeqEUwswSLQQqG15OMzUGQLu9erhqr9ESDaNxW9wJ
	cxDFYXYlGq8p6KzfiWFWeIbs5uyXFzzQNAlMeCdnTWyogDzJngXvH6p3Qs/4I1AByfo+9Xvh/Yu
	nV+ZJmrPmzhgELAnjumoN9Zh6qV9jKYOPTHBmnhJoCHbjqmQEapobzxPEzYWNcncd4igv618epc
	iOa5n1GeqpAao0R3Qeym6n5EVELjIMgwLfLaaE8Oj80CT4gGSvo5BAtYzHZVD9+ruGuXs/cTQL6
	n7we+jM71Y6SyVY7RJsCNucvJNoDC8f8DZO11OkXzy28MHTKih08Vk9fYkan1OsVpE12J9Gv8qx
	4qO
X-Received: by 2002:a05:690c:4990:b0:88e:edf8:e375 with SMTP id 00721157ae682-897308fbc4emr47523377b3.5.1790048855356;
        Mon, 21 Sep 2026 20:47:35 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:35 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/7] mailbox: sun55i: add Allwinner sun55i/sun60i 4-port Message Box driver
Date: Mon, 21 Sep 2026 22:47:06 -0500
Message-ID: <20260922034711.190253-3-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_204736_891616_89D63E1A 
X-CRM114-Status: GOOD (  26.39  )
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

Add support for the 4-port hardware Message Box present on Allwinner
A523/A527/T527 (sun55i) and A733 (sun60i) SoCs. This hardware block
provides 12 hardware FIFO channels connecting the Cortex-A55 host,
HiFi4 DSP, CPUS, and XuanTie E907 RISC-V coprocessors.

Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-sunxi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 drivers/mailbox/Kconfig         |  10 +
 drivers/mailbox/Makefile        |   2 +
 drivers/mailbox/sun55i-msgbox.c | 337 ++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/mailbox/sun55i-msgbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..9067f5161276 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -332,6 +332,16 @@ config SUN6I_MSGBOX
 	  various Allwinner SoCs. This mailbox is used for communication
 	  between the application CPUs and the power management coprocessor.
 
+config SUN55I_MSGBOX
+	tristate "Allwinner sun55i/sun60i 4-port Message Box"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	default ARCH_SUNXI
+	help
+	  Mailbox implementation for the 4-port hardware message box present in
+	  Allwinner A523/A527/T527 (sun55i) and A733 (sun60i) SoCs. This mailbox
+	  provides 12 hardware FIFO channels for communication between the
+	  Cortex-A55 host, CPUS, HiFi4 DSP, and XuanTie E907 RISC-V coprocessors.
+
 config SPRD_MBOX
 	tristate "Spreadtrum Mailbox"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..40024aa906a6 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -71,6 +71,8 @@ obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
 
+obj-$(CONFIG_SUN55I_MSGBOX)	+= sun55i-msgbox.o
+
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
 obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
diff --git a/drivers/mailbox/sun55i-msgbox.c b/drivers/mailbox/sun55i-msgbox.c
new file mode 100644
index 000000000000..b36f26670a46
--- /dev/null
+++ b/drivers/mailbox/sun55i-msgbox.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner sun55i/sun60i 4-Port Hardware Message Box Driver
+ *
+ * Copyright (C) 2026 Tim Michals <tcmichals@gmail.com>
+ * Based on vendor sunxi-msgbox driver by Allwinner Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define SUN55I_MAX_PROCESSORS		4
+#define SUN55I_CHANS_PER_PROC		4
+#define SUN55I_NUM_CHANS		((SUN55I_MAX_PROCESSORS - 1) * SUN55I_CHANS_PER_PROC)
+#define SUN55I_FIFO_MAX			8
+
+#define SUNXI_MSGBOX_OFFSET(n)			(0x100 * (n))
+#define SUNXI_MSGBOX_READ_IRQ_ENABLE(n)		(0x020 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_READ_IRQ_STATUS(n)		(0x024 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_ENABLE(n)	(0x030 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_STATUS(n)	(0x034 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_FIFO_STATUS(n, p)		(0x050 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_STATUS(n, p)		(0x060 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_FIFO(n, p)		(0x070 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+
+#define RD_IRQ_EN_BIT(p)			BIT((p) * 2)
+#define RD_IRQ_PEND_BIT(p)			BIT((p) * 2)
+#define MSG_NUM_MASK				GENMASK(3, 0)
+
+struct sun55i_route {
+	u8 remote_id;
+	u8 remote_n;
+};
+
+/*
+ * Hardware routing table for Cortex-A55 host (local_id = 0):
+ *   local_n = 0 -> CPUS (remote_id = 2, remote_n = 0) -> Channels 0..3
+ *   local_n = 1 -> DSP  (remote_id = 1, remote_n = 0) -> Channels 4..7
+ *   local_n = 2 -> RV   (remote_id = 3, remote_n = 2) -> Channels 8..11
+ */
+static const struct sun55i_route arm_routes[3] = {
+	[0] = { .remote_id = 2, .remote_n = 0 },
+	[1] = { .remote_id = 1, .remote_n = 0 },
+	[2] = { .remote_id = 3, .remote_n = 2 },
+};
+
+struct sun55i_msgbox {
+	struct mbox_controller controller;
+	void __iomem *regs[SUN55I_MAX_PROCESSORS];
+	struct clk *clk;
+	struct reset_control *reset;
+	/* Protects concurrent MMIO register access */
+	spinlock_t lock;
+};
+
+static inline struct sun55i_msgbox *to_sun55i_msgbox(struct mbox_chan *chan)
+{
+	return chan->con_priv;
+}
+
+static inline void sun55i_chan_to_route(int chan_idx, int *local_n, int *p,
+					int *remote_id, int *remote_n)
+{
+	*local_n = chan_idx / SUN55I_CHANS_PER_PROC;
+	*p = chan_idx % SUN55I_CHANS_PER_PROC;
+	*remote_id = arm_routes[*local_n].remote_id;
+	*remote_n = arm_routes[*local_n].remote_n;
+}
+
+static irqreturn_t sun55i_msgbox_irq(int irq, void *dev_id)
+{
+	struct sun55i_msgbox *mbox = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	int local_n, p, chan_idx;
+
+	for (local_n = 0; local_n < 3; local_n++) {
+		void __iomem *local_base = mbox->regs[0];
+		u32 en, stat, pending;
+
+		en = readl(local_base + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		stat = readl(local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+		pending = en & stat;
+
+		if (!pending)
+			continue;
+
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			if (!(pending & RD_IRQ_PEND_BIT(p)))
+				continue;
+
+			chan_idx = local_n * SUN55I_CHANS_PER_PROC + p;
+			while (readl(local_base +
+				     SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK) {
+				u32 msg = readl(local_base + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+
+				mbox_chan_received_data(&mbox->controller.chans[chan_idx], &msg);
+			}
+
+			writel(RD_IRQ_PEND_BIT(p),
+			       local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static int sun55i_msgbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 msg = data ? *(u32 *)data : 0;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	writel(msg, mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_FIFO(remote_n, p));
+	return 0;
+}
+
+static int sun55i_msgbox_startup(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Flush any stale receive data */
+	while (readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK)
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+
+	/* Clear pending status */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+
+	/* Enable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val |= RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	return 0;
+}
+
+static void sun55i_msgbox_shutdown(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Disable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val &= ~RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	/* Clear pending status and flush */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	while (readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK)
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+}
+
+static bool sun55i_msgbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_STATUS(remote_n, p)) & MSG_NUM_MASK;
+	return count < SUN55I_FIFO_MAX;
+}
+
+static bool sun55i_msgbox_peek_data(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK;
+	return count > 0;
+}
+
+static const struct mbox_chan_ops sun55i_msgbox_chan_ops = {
+	.send_data    = sun55i_msgbox_send_data,
+	.startup      = sun55i_msgbox_startup,
+	.shutdown     = sun55i_msgbox_shutdown,
+	.last_tx_done = sun55i_msgbox_last_tx_done,
+	.peek_data    = sun55i_msgbox_peek_data,
+};
+
+static int sun55i_msgbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_chan *chans;
+	struct sun55i_msgbox *mbox;
+	int i, ret, irq_cnt, local_n;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	spin_lock_init(&mbox->lock);
+
+	for (i = 0; i < SUN55I_MAX_PROCESSORS; i++) {
+		mbox->regs[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(mbox->regs[i]))
+			return dev_err_probe(dev, PTR_ERR(mbox->regs[i]),
+					     "failed to map resource %d\n", i);
+	}
+
+	mbox->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mbox->clk))
+		return dev_err_probe(dev, PTR_ERR(mbox->clk), "failed to get clock\n");
+
+	ret = clk_prepare_enable(mbox->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	mbox->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(mbox->reset)) {
+		ret = PTR_ERR(mbox->reset);
+		goto err_disable_clk;
+	}
+
+	ret = reset_control_deassert(mbox->reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/* Disable all read IRQs and clear status */
+	for (local_n = 0; local_n < 3; local_n++) {
+		writel(0, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		writel(0xffffffff, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	}
+
+	irq_cnt = platform_irq_count(pdev);
+	if (irq_cnt < 0) {
+		ret = irq_cnt;
+		goto err_disable_clk;
+	}
+
+	for (i = 0; i < irq_cnt; i++) {
+		int irq = platform_get_irq(pdev, i);
+
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, sun55i_msgbox_irq,
+					       IRQF_SHARED, dev_name(dev), mbox);
+			if (ret)
+				dev_warn(dev, "failed to request irq %d: %d\n", irq, ret);
+		}
+	}
+
+	chans = devm_kcalloc(dev, SUN55I_NUM_CHANS, sizeof(*chans), GFP_KERNEL);
+	if (!chans) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
+
+	for (i = 0; i < SUN55I_NUM_CHANS; i++)
+		chans[i].con_priv = mbox;
+
+	mbox->controller.dev           = dev;
+	mbox->controller.ops           = &sun55i_msgbox_chan_ops;
+	mbox->controller.chans         = chans;
+	mbox->controller.num_chans     = SUN55I_NUM_CHANS;
+	mbox->controller.txdone_irq    = false;
+	mbox->controller.txdone_poll   = true;
+	mbox->controller.txpoll_period = 1;
+
+	platform_set_drvdata(pdev, mbox);
+
+	ret = mbox_controller_register(&mbox->controller);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register controller\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(mbox->clk);
+	return ret;
+}
+
+static void sun55i_msgbox_remove(struct platform_device *pdev)
+{
+	struct sun55i_msgbox *mbox = platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(&mbox->controller);
+	clk_disable_unprepare(mbox->clk);
+}
+
+static const struct of_device_id sun55i_msgbox_of_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-msgbox" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun55i_msgbox_of_match);
+
+static struct platform_driver sun55i_msgbox_driver = {
+	.driver = {
+		.name = "sun55i-msgbox",
+		.of_match_table = sun55i_msgbox_of_match,
+	},
+	.probe = sun55i_msgbox_probe,
+	.remove = sun55i_msgbox_remove,
+};
+module_platform_driver(sun55i_msgbox_driver);
+
+MODULE_AUTHOR("Tim Michals <tcmichals@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun55i/sun60i 4-Port Message Box Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


