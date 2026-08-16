Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF2CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoxLjw+FaEv6UBa2auRBgAVGOoEFVhZL0a0SozhjcLw=; b=joQRqc5JwCwfunE22NHqJ2/xvn
	IN+3YO6KhoJEUuypbE6YfINvQHG/xKE7z8o8Jz+fhK9bv0d0mPt7j4x9HXVk3bc6B1LFvCccvAAEI
	jYV9ecuxr1YdKMDxCQVV+CFfrKb7w8n1WgwU8vFYe1Tjb9UPKTIrlStpbV8B8DrMEqLKtGxnwBeaJ
	J0/nl3Pd/U9O8wWbBBCalAlpnJoE6aqbnsDRlvzxB40hAqTyT514KlusWjkFrdgxlGFbo385oZqZO
	UV0sNrQWSI+aBKaFTFMW8nf4IPVZnMWBVJnD4aD+ahM0j0tKK+wc8K/wFHOY6gU3wiNfMjSLMSGOP
	tjS7t91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJm-00000004eaj-2NWp;
	Sun, 16 Aug 2026 10:42:18 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYJc-00000004eWy-13Ka
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 10:42:10 +0000
Received: by chaosmail.tech (Postfix) id 8FB891C97BC;
	Sun, 16 Aug 2026 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786875995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoxLjw+FaEv6UBa2auRBgAVGOoEFVhZL0a0SozhjcLw=;
	b=Pm5JRA5cw2B+IM0wgI2pvrE0Qa33znQPefbO/e1fJ3BPURMj9+4eUWfzQemNeVO2VtMrmB
	0R7Jxi5fpznOkcXjbKwu0Ter9siAnLvv0zqcQerl9JV89A+k4ba4mODk3cwd+djyysso5y
	nnShEZ8Efks2QXvzeQ3vRsmTknOHXwA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 16 Aug 2026 12:26:22 +0200
Subject: [PATCH v6 2/6] spmi: apple: Validate FIFO state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-t603x-spmi-v6-2-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
In-Reply-To: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786875992; l=3000;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=D9GL2Z01e0tzF0XHDaJ4oJIv+24UCKbgdDmyLz2zBJU=;
 b=TTzvM8ZHmx13EXRswo6FZdYVEJjccNoS7xP4xpTWYdR2DYe06SrVLMm5YIZO7DSc+LX8EcpEO
 oZyN7Wy9B7/Cv7DJ8trjaf+UTEOwAJOzCTQy7nGp2YrQcIcQok2oyLx
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_034208_463464_6D688381 
X-CRM114-Status: GOOD (  12.02  )
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

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..15721cb41d5c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -21,7 +21,9 @@
 #define SPMI_STATUS_REG 0
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
+#define SPMI_ACT_REG 0xa4
 
+#define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
 #define REG_POLL_INTERVAL_US 10000
@@ -29,6 +31,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	bool prev_fail;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -49,6 +52,7 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 
 	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
 	if (ret) {
+		spmi->prev_fail = true;
 		dev_err(&ctrl->dev,
 			"failed to wait for RX FIFO not empty\n");
 		return ret;
@@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	u8 i;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
@@ -78,6 +87,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			spmi->prev_fail = true;
+			dev_err_ratelimited(&ctrl->dev,
+					    "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +101,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 
@@ -97,6 +117,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -115,6 +140,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 

-- 
2.55.0


