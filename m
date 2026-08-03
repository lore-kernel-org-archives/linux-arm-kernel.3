Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B98DC55843
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dp0o1m5yR2f4Z+ciPm4AbRNRENMEbbSgtEL3uzjlmxQ=; b=PvWgWf/4+jpkzpnNJ3mqqiq9mv
	6NS7eCWfwYwi18ZiDjtEKPS6o3gpqCmEwwQBZfhgwx9eFuh8qzUzJslhOE0x3SMEt0MM8amF8jyyz
	HrNtmfem26sAmuuW8dfHDD44jrZBppdOWs4rp2m+/n9QZ8uudapcdXGZG2SZNIo1g9Z7KkKYeUp2f
	f1lJX4T74wnZt7XhyGJQo1a/AW0leZH3Fs6fpq2vDlcS2bDcAW7s9PIGOTWTmbLZerC7uBlROHDFq
	Ntz2JHwYStAEu+8sAy9tbtFS/5oisnvNxdplq79I4QN55qGFEiyVTvN76D58FieGcFsF//MtqitKz
	Pnz1U6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJm-0000000H6fN-21gG;
	Mon, 03 Aug 2026 13:02:58 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJi-0000000H6bB-0p0d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:02:57 +0000
Received: by chaosmail.tech (Postfix) id B1DED1C878A;
	Mon, 03 Aug 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp0o1m5yR2f4Z+ciPm4AbRNRENMEbbSgtEL3uzjlmxQ=;
	b=qW9UtaB03q2/iFqAGH2zC3o7QCw5a8JJLJXwBubWfxvhUfoAkt5rzMHZhnk5tqrZAs8Z+2
	71cPPhBV2hWTTWiHihcHkRAXwROLtV5S9VC7p8DZsPa4lVze5oziBY8rTJcIHMQA9+e5+k
	37g2RoCMXNHpmtmPO39ezYoq+O/iDvo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 03 Aug 2026 15:02:44 +0200
Subject: [PATCH v3 2/6] spmi: apple: Validate FIFO state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-t603x-spmi-v3-2-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
In-Reply-To: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1923;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=PkmvT+O1yoJbmERoyOrzU/RzWX78PMERIonM3LtJq8g=;
 b=K1gkvvUPbxJZxhkWs1UjBnx7EK9MM6PUBsqSP5hIupZQ8BM9IMWmZsNpOrcRJPsxj74o3/Vj9
 /TzUJllIznOAO7wF1bVS0fEpcmaMoBTcfz56M28Jz9yKpoHpiyAIx/1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060254_723642_4B6A964C 
X-CRM114-Status: GOOD (  11.65  )
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
 drivers/spmi/spmi-apple-controller.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..e037ef914b6c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -57,6 +57,20 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	return 0;
 }
 
+static void flush_extra_data(struct spmi_controller *ctrl)
+{
+	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
+	bool warned = false;
+
+	while (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		if (!warned) {
+			dev_warn(&ctrl->dev, "FIFO has extra data\n");
+			warned = true;
+		}
+		readl(spmi->regs + SPMI_RSP_REG);
+	}
+}
+
 static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 			 u16 saddr, u8 *buf, size_t len)
 {
@@ -78,6 +92,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			dev_err_ratelimited(&ctrl->dev,
+					    "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +105,8 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	flush_extra_data(ctrl);
+
 	return 0;
 }
 
@@ -115,6 +136,8 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	flush_extra_data(ctrl);
+
 	return 0;
 }
 

-- 
2.55.0


