Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C9FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoxLjw+FaEv6UBa2auRBgAVGOoEFVhZL0a0SozhjcLw=; b=k176OUcrFUjDrheaif9mhy+nic
	Uq7aiDBpme4D386Ha1NBxAyqZMGhlmJpO1QIYKwIGwa1nChgchtnjYQ0l+fRPXTKGsXsy04ZREpwU
	+T/KwzOf9VSKhAcqr+XAkzvA4115mB/V223rV2veXDEBHmKi3uDygGG1c2+CooKkG+7npjoab6ur0
	YRt9oAaplFs6ZrmCgrHQ2tnPRePDziFzz7O849x9H65n+auYpA59sm9gofceleb2EeKGAvDA5pUur
	F9bDJkcSDyoG51BQ7D1UQnNOAT+l5F7X4lf6Xq64IIu4G2oWy/NEKLVxgFFzIDOCXDS+QrVqrYOKn
	+VHTCojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOdC-00000008W7b-3KVW;
	Tue, 18 Aug 2026 18:33:50 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOd5-00000008W3u-1RZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:33:46 +0000
Received: by chaosmail.tech (Postfix) id 67B2F1C889D;
	Tue, 18 Aug 2026 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoxLjw+FaEv6UBa2auRBgAVGOoEFVhZL0a0SozhjcLw=;
	b=WTx8unpAvBBTxAAdbkktoPEcRwsjzh5Tt/18nERFncPKA/xdHqlZZvVxinXtjaOMBUmaIZ
	VNFZleUN/0Y7HXRW7w3KJMBUKF39y4sRtVVAxSQP0pRFZAoSTmgr2FH83XXJa//wVp9wQV
	xzfoq71PG69lg8TRaCu1uFdLYVmqHwg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 18 Aug 2026 20:32:41 +0200
Subject: [PATCH v7 2/6] spmi: apple: Validate FIFO state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-t603x-spmi-v7-2-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
In-Reply-To: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=3000;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=D9GL2Z01e0tzF0XHDaJ4oJIv+24UCKbgdDmyLz2zBJU=;
 b=2LyWUC3Rwp8d+kgm2SQ7tt6DXr/wm5DZg88QhV7PE/OqSYTP2zpL8FgiqsAr1N3lFDLcYCh3k
 dE5jRv4OAcBB7wheQdus932GrNCBhcNr882WCqjQNXM+XPhYiXP9o+j
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_113343_859752_55231F11 
X-CRM114-Status: GOOD (  12.19  )
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


