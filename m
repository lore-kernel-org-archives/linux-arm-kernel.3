Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24500CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7yaa4X5hOY7Nyo41YzhNCOU/LM7bHHdZoOzTCzZHF3I=; b=1VcjThBn/4F9I1jxYSR0tAzpXw
	COUwwIbsWvaKUGaIfmeUhd2hSeqkSj9IBUfkMbCDOwt/GFykBfE+HG6n+bnZ3vlfwg63UhEINEGI7
	/snsd10n1TVkgRjNBde0XNxaDbvWWiomP0kWpVbGlGtsNzeOFE05mGGhXpr+GFCYQ0C38pFLjatVY
	yfItx+o34O34H6xP+RhfuYeydtmq/OVpU9eW/8mlmwTks+m3V2StngjzLIQ2nHONUztWGAI0+X0En
	kaDPhhs+Bf/w5SF7XzmrNZN8w+mhBQoU5ciAyog8P4XajDUdVZGXrcCKktxod94JQFHw8WfvAsoi+
	pldtIZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOCD-00000000AvY-3gHY;
	Fri, 05 Jun 2026 06:38:21 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOCA-00000000Auv-3cOi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:38:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 5 Jun
 2026 14:38:14 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 5 Jun 2026 14:38:14 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 5 Jun 2026 14:38:09 +0800
Subject: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIANBuImoC/x2MQQqAMAzAviI9W+hEO/Ar4kG0akGmbCLC2N8tH
 hNIMiSJKgn6KkOUR5OewcDVFcz7FDZBXYyhoYaJqcNLw3zHA1d90TO3rXhamRxYcUUx/d+GsZQ
 P58mYBl0AAAA=
X-Change-ID: 20260605-pinctrl-fix-76644e70f601
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780641494; l=1866;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=xAY5hWssBNCtFpjMIDeqYTF6QWlBQlC7/Ebm8kSZ1yc=;
 b=mxo5eczYf2oAK1TjLECaN853onZlWHApLvxA+tAckQEh7Sqd68Q2RI0IgpUItFJDSeZ/1tVPB
 d8SQ5ruU3AJD7i8VCiIgymYG9bjKmhGFfVmrQnZfiLchmDzw7IPzX0S
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_233818_930286_7CA14361 
X-CRM114-Status: GOOD (  10.56  )
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

aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
function 0 to route the requested pin to GPIO. This is wrong for the
ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
selects the ADC input and function 1 selects GPIO. Requesting one of
those GPIOs therefore muxed the ball to ADC instead.

Write mux value 1 for balls W17 through AB19 so the GPIO function is
actually selected.

Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
index a1ef52ad5c75..50027d69c342 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -691,12 +691,21 @@ static int aspeed_g7_soc1_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_g7_soc1_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct aspeed_g7_field field;
+	unsigned int val = 0;
 	int ret = -ENOTSUPP;
 
 	if (pin <= AC24) {
+		/*
+		 * Balls W17 through AB19 are the ADC-capable pins: mux
+		 * function 0 selects the ADC input and function 1 selects
+		 * GPIO, unlike all other pins where function 0 is GPIO.
+		 */
+		if (pin >= W17 && pin <= AB19)
+			val = 1;
 		field = aspeed_g7_soc1_pinmux_field_from_pin(pin);
 		ret = regmap_update_bits(pctl->regmap, field.reg,
-					 field.mask << field.shift, 0);
+					 field.mask << field.shift,
+					 val << field.shift);
 	}
 
 	return ret;

---
base-commit: 57ae58c5506ade17df728d676a0c73c705f21f57
change-id: 20260605-pinctrl-fix-76644e70f601

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


