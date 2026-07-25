Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D19C53219
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmxgB9Q/QCSRbkqaoW/xWFkDxYK8WDYVKqE67rtcpb0=; b=EISzv/HUUnkU9fhUX4kq0HioN1
	qtnat1fiOOHvtQ4VAQqBk/ZuASYdthiAIFzl/2PwynSbCbxFidSrblybERFi9JazYYwye9IIhxoVx
	f9+QSaxZL7B/pnf6da+q5OfsomfINHuo1QEP+wMVG/awNE8TP1mJTO5vUMgtPPU/9nZjrIAXp37i6
	pfkYOpqRkCyZZun8fO1ZLgznzo1nKMsbX8w9+TlqbjEJJvEDvj9gO8NzpPEE8YKZLwgdyKM53M8dO
	ssaITY+o0EP5b11PrkT4c7OZd15ZvCJT7ZTLlIYE7Bb+S9B376YZ0orLxK6RpyGt+ZZ3lxM8+cHAd
	jcQlzriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjl-00000000Ooq-31is;
	Sat, 25 Jul 2026 13:48:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjg-00000000OlR-18RL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:48:17 +0000
Received: by chaosmail.tech (Postfix) id 2D5EF1C89D4;
	Sat, 25 Jul 2026 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmxgB9Q/QCSRbkqaoW/xWFkDxYK8WDYVKqE67rtcpb0=;
	b=kRcCX23CcNHCGMTNWAKSYTINyL9VkF0PwiOufxVb6sLHx/mugR/59j5Z7bT+u/LNREIGro
	fmrsTcoIq8QSeX5TvR3ncsfAd8qmjM9MNqgAl1TXaMUGQAoXebWpTghUQaV+dqsm2jLwCr
	xlKLm7Vlxm60KY0HhqvBuZCf81sgyZI=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:03 +0200
Subject: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=5251;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=JnmCHnBhW5BlsU2wwWdZK09PPe67Yin8icBs95OobHE=;
 b=qfIfEQD99oqQVXH8OONB/l4uCm9SeZnvhWSnaZnsypAPb2Y9udYR4m8+n/O+0xCGb98ZrYO3Z
 JIsz0tJc9ooBK6EhB+I5694yK+tjscNK0bJOzAEBS86alaK53rQuxYc
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_064816_482664_F64699C7 
X-CRM114-Status: GOOD (  19.24  )
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

From: Alba Mendez <me@alba.sh>

The IRQ fires as soon as the reply is available, which is usually takes
a few us instead of the 10ms sleep interval for polling

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index d8509f027df6..d627187b3ac0 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,6 +11,8 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/completion.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,6 +25,12 @@
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
 
+#define SPMI_IRQ_MASK_BASE 0x20
+#define SPMI_IRQ_ACK_BASE 0x60
+#define SPMI_IRQ_USER_SIZE 0x20
+
+#define SPMI_IRQ_FIFO_RX 0
+
 /* SPMI_RSP_REG reply word */
 #define SPMI_REPLY_FRAME_PARITY_OFFSET 16
 #define SPMI_REPLY_ACK BIT(15)
@@ -37,6 +45,8 @@
 struct apple_spmi {
 	void __iomem *regs;
 	struct mutex fifo_lock;
+	bool fifo_rx_irq;
+	struct completion fifo_rx;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -55,7 +65,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	int ret;
 	u32 status;
 
-	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	if (spmi->fifo_rx_irq) {
+		ret = wait_for_completion_timeout(&spmi->fifo_rx,
+			usecs_to_jiffies(REG_POLL_TIMEOUT_US));
+		if (!ret)
+			ret = -ETIMEDOUT;
+		else if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)
+			ret = -EIO;
+		else
+			ret = 0;
+	} else {
+		ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	}
+
 	if (ret) {
 		dev_err(&ctrl->dev,
 			"failed to wait for RX FIFO not empty\n");
@@ -79,6 +101,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
+	reinit_completion(&spmi->fifo_rx);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -183,10 +207,68 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 	return -EINVAL;
 }
 
+static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
+
+	writel(BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) & ~BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) | BIT(irq % 32), reg);
+}
+
+static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
+{
+	struct apple_spmi *spmi = dev_id;
+	bool handled = false;
+	u32 val, offset, bit;
+
+	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
+	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
+		complete(&spmi->fifo_rx);
+		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
+		handled = true;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int apple_spmi_init_irq(struct platform_device *pdev,
+			  struct apple_spmi *spmi, int irq)
+{
+	int ret;
+
+	for (size_t offset = 0; offset < SPMI_IRQ_USER_SIZE + 4; offset += 4) {
+		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
+		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+	}
+
+	spmi->fifo_rx_irq = true;
+	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
+
+	ret = devm_request_any_context_irq(&pdev->dev, irq, apple_spmi_irq_handler, 0, NULL, spmi);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ\n");
+
+	return 0;
+}
+
 static int apple_spmi_probe(struct platform_device *pdev)
 {
 	struct apple_spmi *spmi;
 	struct spmi_controller *ctrl;
+	int irq;
 	int ret;
 
 	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi));
@@ -195,6 +277,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	spmi = spmi_controller_get_drvdata(ctrl);
 	mutex_init(&spmi->fifo_lock);
+	init_completion(&spmi->fifo_rx);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))
@@ -206,11 +289,23 @@ static int apple_spmi_probe(struct platform_device *pdev)
 	ctrl->write_cmd = spmi_write_cmd;
 	ctrl->cmd = spmi_cmd;
 
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq >= 0) {
+		ret = apple_spmi_init_irq(pdev, spmi, irq);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "spmi_controller_add failed\n");
 
+	dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
+			"Initialized without IRQ, falling back to polling");
+
 	return 0;
 }
 

-- 
2.55.0


