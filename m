Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDBC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icTggAy3gbl2+A7cAXhm51k/YneL2/ZKYWfIfpCPKGQ=; b=ZunPv0fQsYXFOBjdXjGAHml3GU
	XGaP95vPBnbDS+ir9l9EsD/6i2wxRE6H6ueChffBHM9yyEGeG0leSSH+CqqZ7VSU7Zy4uBq/nLdr4
	IRSEEdFEi759zOBJwGuDPFwQVyJCSLzOz+WYfYyY8NFOhJzNjEotoJ2j78pP8pGrg2fo5L1qiBnVx
	caMYHde95ywUsflS5xItIQ3uN4p6XImmFt0LlyQgHk9CL0iyecYxS1o8vfDCydai2r/QtQGMD723F
	KJWPpGV8uJjQjPkiZd3CrO0hNa43trNe0wJudAZsD11YxFCA67lf1hDcP2xST5HvT9w8VqWsoOsab
	pqlwgwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6p-00000004olI-3jGK;
	Tue, 28 Jul 2026 09:28:23 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6m-00000004ojO-3J3M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:28:22 +0000
Received: by chaosmail.tech (Postfix) id C28631C97BC;
	Tue, 28 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icTggAy3gbl2+A7cAXhm51k/YneL2/ZKYWfIfpCPKGQ=;
	b=Vt+CH3LcMECPEIqXXHOIbHdkotZRRMc63pzNPd/2DUmBH2dI3DqoZEo8wr9h+HtNxRxLV7
	p3z3tvAcOegKq3omCiiJQSmyMRaT++cg4JAlZmxgijz4+YYhZPEU37isa1dK7geUglOZfz
	q8peczVnmNrNkukR+1I+v1/wtN8FWnQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:08 +0200
Subject: [PATCH v2 2/7] spmi: apple: Validate FIFO state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1469;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s+zw2P+Wx9EvyJyi9jeYYrUjVBBFmgRieWNPRCaUoyU=;
 b=pbQvEq/RK9U1Pz8LKtkCquVTrltHOLnKjP+XGzoZ6xY8IsIxQZl5MmTbZcng1WfayixOMlDZl
 RJqaeZH5b6cDN2SnRcY6NpOoHeCqLyh06TSqqxcsdnyl2PSAzy1ytFK
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_022821_314426_C0A7DCF7 
X-CRM114-Status: GOOD (  10.90  )
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
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..b4f442d0b4ad 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 
@@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 

-- 
2.55.0


