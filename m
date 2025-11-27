Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14895CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B7aWgkMd1s3k3QG7Ff/3VcVkI1wHMDyzAgylqZcvSFA=; b=JWv19FgeISwSQL9zQaIOFeswdK
	3oENDdME2RGjZAqNT894weD1vl6fbH7007qPE7NBS5RhzJ0TQwBNdFHH8XTX1RQRA6dPlkv4i5Kxm
	2SEw2DYWRzGRh6+4hXFy8xe1UMB8kAKWs2MjKbws6WZJKSIBFw3ncMC5TV4czpjouEVGFJ9A/POn7
	qCQxuhihbyQXv3lBw5NA4+jjEa0QpQLEam0v0mBMaWpmnFwTQmH53nTCgrZ5R/CROIGSnlKZAePAr
	yg5d12fWUrIAibbH/lnbJC2jqyVX4tLXbI7yX0NMrKiTetyFpzNHzroynvFrIVhDgkA3rZx9Sn7+7
	BDKc9xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYYc-0000000GJsR-3sCU;
	Thu, 27 Nov 2025 09:44:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYYb-0000000GJsK-0PLK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3958860017;
	Thu, 27 Nov 2025 09:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7CA2C4CEF8;
	Thu, 27 Nov 2025 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764236695;
	bh=wDdtL7Ds9riVbV6ICXm79kvDBRYPemWXZfNDHX2irog=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=U0WmI92gGBB9JMQhD9F2KjevMPDcnLEq76dYwYYvD0zUwOAZejibICAiMVofNbMaE
	 2ph8cSjaZy19bvNlEw5RXLOFHRMWnNK1qnHGmUM/StHniZMaW445Sr5fX2WV+w/ZGA
	 dO4zILc6K3uUUTm6sXebvZ212A84oQIIHvvjL+adgUXrZLiRmT7LuH38Co4u0Y51Dh
	 5LTEvZqMKSL4A3o6yM98KLFbtY90x0JUsPAAywIYKqkp/nmKtb1tB8cvJ5skxNohqN
	 VJLTRm51opPilBcWoQZH5q5OAc7q0iGLD+DhwPpDphlAzblpmqTSmumj/K9ksIaxl6
	 TV2tsZfbw7Chw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E1BD116E2;
	Thu, 27 Nov 2025 09:44:55 +0000 (UTC)
From: Alex Wang via B4 Relay <devnull+alex.ts.wang.fii-foxconn.com@kernel.org>
Date: Thu, 27 Nov 2025 17:44:51 +0800
Subject: [PATCH v2] dt: aspeed: clemente: move hdd_led to its own gpio-leds
 group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-leo-dts-add-shunt-resistor-v2-1-c77dfbfb826c@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAJIdKGkC/42NQQrCMBBFr1Jm7UiSEmldeQ/pIiZTO6CJZGqol
 N7d2BO4fJ/H+ysIZSaBc7NCpsLCKVYwhwb85OKdkENlMMpYrUyLD0oYZkEXAsr0jjNmEpY5ZTR
 dNdTJ2eAIauCVaeRlj1+HytOuffavon/rX9miUaMNfd8pd3Ot6i4jM45p8SnGo09PGLZt+wI3H
 A6KygAAAA==
X-Change-ID: 20251023-leo-dts-add-shunt-resistor-2810206a5dae
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, Alex Wang <alex.ts.wang@fii-foxconn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764236694; l=2118;
 i=alex.ts.wang@fii-foxconn.com; s=20251023; h=from:subject:message-id;
 bh=XvfoAuDaFi0LEYIxrGZlYJX6g2aVVWHGpukneXb5b2k=;
 b=SXG/ZRsEzAm0y+7zt1tH9Ydnb+YuQ8Z7nkeAo5L/ekXuavdkD1Ale8faYlW8bQmxmf8E7FYoW
 4p9x7BbeD/6BzqaKejgS49RqwnHxC/r9cz33N53NCEPzRlctPJ3nLVM
X-Developer-Key: i=alex.ts.wang@fii-foxconn.com; a=ed25519;
 pk=m/IrKXb14uSdDm4KGXemjNIxgL6TrqXCc9NX09SUJp0=
X-Endpoint-Received: by B4 Relay for alex.ts.wang@fii-foxconn.com/20251023
 with auth_id=551
X-Original-From: Alex Wang <alex.ts.wang@fii-foxconn.com>
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
Reply-To: alex.ts.wang@fii-foxconn.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alex Wang <alex.ts.wang@fii-foxconn.com>

The gpio-leds driver requires all GPIOs in a group to be available;
if any GPIO in the group is not available the whole group will not be
created. The hdd_led GPIO is only present after standby power is
enabled, which can prevent other LEDs in the same group from being
created and blocks properly setting 'bmc_ready_noled'.

Move the 'hdd_led' node into a separate gpio-leds group so that other
LEDs are not blocked and the 'bmc_ready_noled' flag can be set
correctly.

Signed-off-by: Alex Wang <alex.ts.wang@fii-foxconn.com>
---
Changes in v2:
- I changed “missing” to “not available”. The hdd_led and bmc_ready_noled 
do not disappear; it's just that hdd_led only becomes available after 
standby power is enabled, and this process takes some time. The hdd_led 
becomes available only after bmc_ready_noled is supposed to be set, 
which causes bmc_ready_noled to fail to be generated and set in time.

- Standby power is enabled during the BMC boot process.

- The hdd_led will only be configured after the BMC boots, when a 
dedicated service starts and applies the settings.

- Link to v1: https://lore.kernel.org/r/20251023-leo-dts-add-shunt-resistor-v1-1-5d9980aba308@fii-foxconn.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index dfe8f6d0eeef..ea1bf6f402bd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -96,7 +96,12 @@ led-3 {
 			gpios = <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
 		};
 
-		led-hdd {
+	};
+
+	hdd-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
 			label = "hdd_led";
 			gpios = <&io_expander13 1 GPIO_ACTIVE_LOW>;
 		};

---
base-commit: c6fea62a8379f9e24b243ea4ba1fd482f8cd0d83
change-id: 20251023-leo-dts-add-shunt-resistor-2810206a5dae

Best regards,
-- 
Alex Wang <alex.ts.wang@fii-foxconn.com>



