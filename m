Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA0AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jDFIid67yzzvPWcmSSSD9BLqii8ObCJJpw0M/vz4B0=; b=TeX9K23bR5lg2ZI7EU7SGzkK4R
	SF0eaR0Ti7RBPh6SAbDHdhUAuWEtWZcbe9P9Y88p7FI98zmDWr3uUEI5goxtqtmcyEfeloEZyVGec
	5yQG3G0NB2Ffes6DF9vuTSZBB2NXVL8k3bsU7TqOoHM90vXf1hQ8EWDXHEqvtDp7C1Ve7Z2WtUegO
	fad8Cf4S9yfJ4c2MMxPbPZsmZ7c7KiQyG76hmbIYyzSuuVnFqckI6d7cvCEP9hIlq5ql5N2RX9SU3
	UdYuTpDCsvgLp6D3XS1ecbiEsSMKFubkRUzHu5Eg4qyl1XtE4fgHyvTfzr2blIsL33+gfF2g+HKx0
	MS5tbyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjl-00000000Oo8-24fa;
	Sat, 25 Jul 2026 13:48:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncje-00000000Ok5-0VI8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:48:15 +0000
Received: by chaosmail.tech (Postfix) id A6CF41C89C8;
	Sat, 25 Jul 2026 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jDFIid67yzzvPWcmSSSD9BLqii8ObCJJpw0M/vz4B0=;
	b=Y0BVR1UysfKjLyKie6beUaEQtSdRa4oyQiGvgT++TZNHM8ac+v73AUk4f7eI6lEwn2zSzr
	84S2kUcOzNSADLnKG4sD2wxCDIWH3vyMcycCKbe5T/98k5h5l2vWDfwQmJRpSIl28aEA2Q
	D2DfeG3b9/3woSVL0mFUUjif5MTXj9o=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:01 +0200
Subject: [PATCH 4/7] spmi: apple: Implement remaining commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-4-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=6160;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=VMq2pUicNc1fnvkSoF1FpPu31/ImM/9fZ1kYCmV8kjI=;
 b=+F+kbkO4/A1LwXsmM4MAJfDmGcdUWXVG5rpoPNTJ2KZwjhH4IifTPsJtIi7j29z16b4quAy+C
 h4E33oRWAfrCZMIoDTMQBWqajDOlragYYx33vvCBIRe6UQMAE6+2cLT
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_064814_325431_93611CE6 
X-CRM114-Status: GOOD (  15.03  )
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

Add support for zero write and power management commands

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 4678a9e5270a..d69d16665ce8 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -41,9 +41,9 @@ struct apple_spmi {
 	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
 			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
 
-static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
+static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
 {
-	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
+	return opc | sid << 8 | param << 16 | (1 << 15);
 }
 
 /* Wait for Rx FIFO to have something */
@@ -63,18 +63,27 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	return 0;
 }
 
-static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			 u16 saddr, u8 *buf, size_t len)
+static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, param);
 	u32 reply, rsp;
 	size_t len_read = 0;
-	u8 i;
+	size_t i = 0, j;
 	int ret;
 
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
+	while (i < len) {
+		j = 0;
+		spmi_cmd = 0;
+		while ((j < 4) & (i < len))
+			spmi_cmd |= buf[i++] << (j++ * 8);
+
+		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+	}
+
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
 		return ret;
@@ -82,15 +91,15 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
-	while (len_read < len) {
+	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
 			return -EIO;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
-		while ((len_read < len) && (i < 4)) {
-			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
+		while ((len_read < ilen) && (i < 4)) {
+			ibuf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
 			i += 1;
 		}
 	}
@@ -98,47 +107,67 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
-	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
+	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
+	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << ilen) - 1)) {
 		dev_err(&ctrl->dev, "some frames failed parity check\n");
 		return -EIO;
 	}
 	return 0;
 }
 
-static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			  u16 saddr, const u8 *buf, size_t len)
+/* Send a raw command with 1..16 input data frames */
+static int spmi_raw_cmd_input(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 param, u8 *buf, size_t len)
 {
-	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 reply;
-	size_t i = 0, j;
-	int ret;
-
-	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+	return spmi_raw_cmd(ctrl, opc, sid, param, NULL, 0, buf, len);
+}
 
-	while (i < len) {
-		j = 0;
-		spmi_cmd = 0;
-		while ((j < 4) & (i < len))
-			spmi_cmd |= buf[i++] << (j++ * 8);
+/* Send a raw command with (optional) body and an input ACK */
+static int spmi_raw_cmd_ack(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 param, const u8 *buf, size_t len)
+{
+	return spmi_raw_cmd(ctrl, opc, sid, param, buf, len, NULL, 0);
+}
 
-		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 saddr, u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_EXT_READ:
+	case SPMI_CMD_EXT_READL:
+		return spmi_raw_cmd_input(ctrl, opc | (len - 1), sid, saddr, buf, len);
+	case SPMI_CMD_READ:
+		return spmi_raw_cmd_input(ctrl, opc | saddr, sid, saddr, buf, len);
 	}
+	return -EINVAL;
+}
 
-	ret = apple_spmi_wait_rx_not_empty(ctrl);
-	if (ret)
-		return ret;
-
-	reply = readl(spmi->regs + SPMI_RSP_REG);
-
-	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
-		dev_warn(&ctrl->dev, "FIFO has extra data\n");
-
-	if (!(reply & SPMI_REPLY_ACK)) {
-		dev_err(&ctrl->dev, "command not acknowledged\n");
-		return -EIO;
+static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 saddr, const u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_ZERO_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_EXT_WRITE:
+	case SPMI_CMD_EXT_WRITEL:
+		return spmi_raw_cmd_ack(ctrl, opc | (len - 1), sid, saddr, buf, len);
 	}
-	return 0;
+	return -EINVAL;
+}
+
+static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+{
+	if (
+		opc == SPMI_CMD_RESET || opc == SPMI_CMD_SLEEP ||
+		opc == SPMI_CMD_SHUTDOWN || opc == SPMI_CMD_WAKEUP
+	)
+		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
+	return -EINVAL;
 }
 
 static int apple_spmi_probe(struct platform_device *pdev)
@@ -161,6 +190,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
+	ctrl->cmd = spmi_cmd;
 
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)

-- 
2.55.0


