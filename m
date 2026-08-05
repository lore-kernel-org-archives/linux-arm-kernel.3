Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C66C56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVI76y/kmEWLkXTt+2xI8u8rqOWmneKjz9si4V0g36k=; b=cotpywe+xNMGn1T3wPjyQ/DogL
	2fF1ikMFO6oKEM2rNcWeHoggvzPXkuJI4rcB060Fm/A3tDvkAQozn7FA8dBXiLhP5QW9/KmcII0EE
	fAyzhkwOhGUYMBA1vNyemwN03Tpyx38mlU34CwfxjrI9Wp/o/0LmZYp73FgDotEkJpdueEtiUMFZ4
	oB+Qm4lJ+yH4UM7ag+j4Ribk6Ey4lCHzBeeFrDPERWMk7Fy9K5aGZZykKodyBDF0IC4gGWL4yCxiu
	/WQHp59trwa257z7Tfq3vdsl56D1tItQgRNOVb8iJHh7br0+xKYK6rjxv/vif7EG6nWDReyZJCIDR
	/GQtpKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYat-00000003hXJ-3pFz;
	Wed, 05 Aug 2026 10:11:27 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYan-00000003hRz-0iTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:11:23 +0000
Received: by chaosmail.tech (Postfix) id BF2271C87FD;
	Wed, 05 Aug 2026 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785924677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVI76y/kmEWLkXTt+2xI8u8rqOWmneKjz9si4V0g36k=;
	b=CXLH+0xHQ6hKzscrBPoq9eIQyBKt5i+7yOwM4piOIXLt1csY7DQNVJSbeqR/vtznrgFzA+
	fPYyyZDl33vy8ioZkMKBfmkoQhiCPdUpQjcpuPlnNLW7JaDPZIiTAVPUSAgOZTEOQE/78Z
	Zsk6b8+Q5t6nADzLMZgFNdtQDd62yd8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 05 Aug 2026 12:11:13 +0200
Subject: [PATCH v4 3/6] spmi: apple: check transaction status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-t603x-spmi-v4-3-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
In-Reply-To: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785924674; l=3016;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=9XTAYVcaB1AO8VLXsd74SgL+1OMOm6gdvcFnlxzblE8=;
 b=6+1jatgUAByPzClHjlQebLJmTbD+0rF/JkBg9HospQZHak9z7q5JMLwZfnqr086JJDG7vKMXs
 5proZchjHNbDbQ6e27tUzQUixiE4OM2hX2yPjJmaAHuDcmpJvam4rbG
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_031121_705257_95D9472F 
X-CRM114-Status: GOOD (  12.46  )
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

Check for parity errors and missing command ACKs

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 4d5356bf9bbf..7ebf899edf17 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,6 +11,8 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,6 +25,12 @@
 #define SPMI_RSP_REG 0x8
 #define SPMI_ACT_REG 0xa4
 
+/* SPMI_RSP_REG reply word */
+#define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
+#define SPMI_REPLY_ACK BIT(15)
+#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
+#define SPMI_REPLY_CMD GENMASK(7, 0)
+
 #define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
@@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 rsp;
+	u32 reply, rsp;
 	size_t len_read = 0;
 	u8 i;
 	int ret;
@@ -82,12 +90,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard SPMI reply status */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			spmi->prev_fail = true;
 			dev_err_ratelimited(&ctrl->dev,
 					    "FIFO lacks reply data, controller stuck?\n");
 			return -EIO;
@@ -105,6 +113,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		spmi->prev_fail = true;
 	}
 
+	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
+		dev_err(&ctrl->dev, "some frames failed parity check\n");
+		return -EIO;
+	}
 	return 0;
 }
 
@@ -113,6 +125,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 reply;
 	size_t i = 0, j;
 	int ret;
 
@@ -136,14 +149,17 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 		spmi->prev_fail = true;
 	}
 
+	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
 	return 0;
 }
 

-- 
2.55.0


