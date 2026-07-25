Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA69C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOEGBPj9wdiW2j/Jxo2hUYrDiU/CZnzQIqSAqmVHv+E=; b=xUE5dbhfkv+RPOJbL+dE6Hjh7o
	ujMJjxfEKT7KVreD5/SZphQbjWxKzkmhtACN/a3X5Ye0AgqPDoljYJ5Of7d8Kk91qx+YfLndvzvlg
	z3/zlLjksy4Jzd3ehrxISM6Pliv7myBz5w0Fj8JnYf/+aPMKzKlMD2bNW25j1kdwwscOroG2rCD2m
	mxgFYeIdnBrCQROkMYJ/gzZEPR5LMTLPP2+FCOwYj/57lngU/Ky5i+iZvTZuH5jXG4gkl0ob9CEQl
	JPfnQ/rpWm5PFSQ1io4feagKni4uF0qm0IowqCEi1vPkkuQR/8i5H4aSNXzOrUZn5DnaEdDL3GFtn
	PjRcGOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjl-00000000OpC-3TdO;
	Sat, 25 Jul 2026 13:48:21 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncjg-00000000OlS-1AsK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:48:17 +0000
Received: by chaosmail.tech (Postfix) id 699491C89CE;
	Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOEGBPj9wdiW2j/Jxo2hUYrDiU/CZnzQIqSAqmVHv+E=;
	b=Mga+HXgZx+8JJveqlZZrpB1KkuiOKAm2X8Y7E9xZAAKzVmN1oF00enZEhEGF6dwmi7dif/
	eHWOUsD/2VdJOkt5fuIbGE3p+wMYaXsh/HUN95cpNS3IY94197bU22o1JhrOigG4sJEE2Y
	kt0lzrZHpjJDXnvF7nlPDo52V5zPzNw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:02 +0200
Subject: [PATCH 5/7] spmi: apple: lock around FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-5-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=2615;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=2qgrnGCpOEesoQxzumLBAIJ6PZsro+tCragOJF7RrLM=;
 b=yjKT/ZwlZdbSTSzYb0LgSssHIETLtaCHX3M+W0nzBUVmztu+Dwd1eGAYdhabQkDvyUAJMXDAw
 GelAE7K1FzND4wMhTa7Z86b/UoXRcJdfYmjAHZNqiZLS89KjqOwPAMS
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_064816_495937_C3B6A983 
X-CRM114-Status: GOOD (  13.42  )
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

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index d69d16665ce8..d8509f027df6 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -35,6 +36,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -73,6 +75,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	ret = mutex_lock_interruptible(&spmi->fifo_lock);
+	if (ret)
+		return ret;
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -86,7 +92,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
-		return ret;
+		goto out;
 
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
@@ -94,7 +100,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
-			return -EIO;
+			ret = -EIO;
+			goto out;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
@@ -107,6 +114,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	mutex_unlock(&spmi->fifo_lock);
+
 	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
 		dev_err(&ctrl->dev, "command not acknowledged\n");
 		return -EIO;
@@ -116,6 +125,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		return -EIO;
 	}
 	return 0;
+
+out:
+	mutex_unlock(&spmi->fifo_lock);
+	return ret;
 }
 
 /* Send a raw command with 1..16 input data frames */
@@ -181,6 +194,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0


