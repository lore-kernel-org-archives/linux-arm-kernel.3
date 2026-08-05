Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1944C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joMRTEFMyu43u8WzmY0xYe3iWb4z0rzfE2Q1XzOQSv0=; b=Rw1EjsttybkLZcVotO3ZU6vNWN
	H7Z3rbA72uvfwOzEizjlEatPe7bxMs1tOKoZy8y9q4ogkYpSQASpzMrV321cWKONc+LOHhu6Ef+NQ
	0ym+EwaG6LgxhZiDK3dNiaDMPI99OpCf+YKJa6bhWHCkc2Hfa4INx+JUBl0oWKSBBZhsGs5j/8PlD
	YCSeAgR7q7g+Y1wyr8/dQV6ZHxlF/5oi2BG7j91KL+xmSnxnyQJiW+uHJHoVyrlrnFT6u3BJmCyoO
	J/VwIaJ0n2jnEtVBDuTkoAIH99O2PvLt+hM3F1kVN1Uljo0hjEcN9sLap6MyuksXUUYpeJ3UAcwmq
	J1ZhRmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYau-00000003hXd-0kl2;
	Wed, 05 Aug 2026 10:11:28 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYan-00000003hS5-2Knj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:11:24 +0000
Received: by chaosmail.tech (Postfix) id 81BDE1C87FF;
	Wed, 05 Aug 2026 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785924678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joMRTEFMyu43u8WzmY0xYe3iWb4z0rzfE2Q1XzOQSv0=;
	b=G9sMYRvc0XRwFi7vh0kZm7dBfaGjnFO5433WTG+vLxswsiJAzmd7ixfltNBTVtenJ6yUJN
	hue5+R1o1hASC18tc/jNW1eHGqsZ78Zw1lAVB53TOLBcUy0Qv+c94w2F3wiO3DymiZmJOY
	pRszCGFsM0qyNOBslB6S8wcQwWjLxrw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 05 Aug 2026 12:11:14 +0200
Subject: [PATCH v4 4/6] spmi: apple: Implement remaining commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
In-Reply-To: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785924674; l=6569;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=X8XkU0u/Zly9LkV1CBL7op4iKilfsa4gT4J9RPLwQJE=;
 b=HN76gvDW/0e2Z5RHicsoCn7jAhW+2ETi+r8cXTdSrnE3KWNQU1hzm5zJv6hFLW3i4cJERSh3A
 ECys58YXGwhAIOCJvVx7FOu0VDDCOApr+CyLzNPBDTveNX0a+TxtMlv
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_031121_798398_2AC416C0 
X-CRM114-Status: GOOD (  15.41  )
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
 drivers/spmi/spmi-apple-controller.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------
 1 file changed, 68 insertions(+), 46 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 7ebf899edf17..49827e51e93e 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -46,9 +46,9 @@ struct apple_spmi {
 	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
 			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
 
-static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
+static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
 {
-	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
+	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
 }
 
 /* Wait for Rx FIFO to have something */
@@ -69,14 +69,14 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
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
 
 	if (spmi->prev_fail) {
@@ -86,6 +86,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
+	while (i < len) {
+		j = min_t(size_t, sizeof(spmi_cmd), len - i);
+		spmi_cmd = 0;
+		memcpy(&spmi_cmd, buf + i, j);
+		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+		i += j;
+	}
+
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
 		return ret;
@@ -93,7 +101,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
-	while (len_read < len) {
+	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			spmi->prev_fail = true;
 			dev_err_ratelimited(&ctrl->dev,
@@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 			return -EIO;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
-		i = 0;
-		while ((len_read < len) && (i < 4)) {
-			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
-			i += 1;
-		}
+		i = min_t(size_t, sizeof(spmi_cmd), ilen - len_read);
+		memcpy(ibuf + len_read, &rsp, i);
+		len_read += i;
 	}
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
@@ -113,54 +119,69 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		spmi->prev_fail = true;
 	}
 
-	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
+	if (!ilen && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
+	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << ilen) - 1)) {
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
-	if (spmi->prev_fail) {
-		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);
-		spmi->prev_fail = false;
-	}
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
-	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
-		dev_warn(&ctrl->dev, "FIFO has extra data\n");
-		spmi->prev_fail = true;
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
+	return -EINVAL;
+}
 
-	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
-		dev_err(&ctrl->dev, "command not acknowledged\n");
-		return -EIO;
+static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+{
+	switch (opc) {
+	case SPMI_CMD_RESET:
+	case SPMI_CMD_SLEEP:
+	case SPMI_CMD_SHUTDOWN:
+	case SPMI_CMD_WAKEUP:
+		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
 	}
-	return 0;
+	return -EINVAL;
 }
 
 static int apple_spmi_probe(struct platform_device *pdev)
@@ -183,6 +204,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
+	ctrl->cmd = spmi_cmd;
 
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)

-- 
2.55.0


