Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5DCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDaarJu+1lMV7xrBDAmTOi1odQwoiS3QEl1ot3QDFr8=; b=TzAnu9yVZBj0fcYWBpZcdMMD4t
	+UKNrFwXJA6E70gHZ+JKO7x9MN2xQ+yeKCv+nCwp/i0PfrtF1oJZMbhM6K7dAfsO63sq4vhHHavsX
	X8jcmtSaJzJ2VKm7qgZj8OP5Oh+ptNGqyMTX3bxfE6oHoprdU1Nu/ebUYOH9I8UE3uHD3iq9pDkE6
	tmjU2wRN07ZBNaTq3KJOr1BYznXt129K6ZU5zh/5g9JmAXP0LoENjPj4iNg67gO2IK2Sppak45e4b
	eI5G7qHvPkyH4jep3zXXznAtRKb3B1ENuhJiemHY+s9HmTB6m2Xcer/eooY1SJs8v3UsPWcHaC55S
	8ym205qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsXc-00000005sJq-38xj;
	Thu, 23 Oct 2025 10:27:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsXZ-00000005sJQ-3C08
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2C10440B8;
	Thu, 23 Oct 2025 10:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5F0BC4CEFB;
	Thu, 23 Oct 2025 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761215248;
	bh=9moM1zvWggM59ECkKTAgJYY6tGFpdNeypAAeKDaTrsc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KtZzY7+KK5fh0BsjWRQXOLlZcL8+4/Wrjg8izY1b9HxLlZtAtlFMrx2GPoFESdEgh
	 ETw77KIaAUcLP1EqRIK5RGJuBUxJOwoHFTEhlzFj+E4UJYILRJiGsQsqh5Grt24xH+
	 L8Qzrjx1SDCoHVqUWTc8WMU+dCPdS7nULcZoIHPbpYI6U1vJaw2Tw4V1mEqoUaKt42
	 tXGDcoDYlBF3HriqpoZEpQbqP97SNUYpHUv1YUn6tzH3Jexv4G9rTOCz8MUbplUqY9
	 kXSujti/0bFNyxLk3m5QlGnLr4W7mVB+a2Zze+Qx1guUCQE1srfgcIUdAK/Ebg1M4F
	 GGhnds9rbNdrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BF8CCD1BE;
	Thu, 23 Oct 2025 10:27:28 +0000 (UTC)
From: Alex Wang via B4 Relay <devnull+alex.ts.wang.fii-foxconn.com@kernel.org>
Date: Thu, 23 Oct 2025 18:26:56 +0800
Subject: [PATCH] dt: aspeed: clemente: move hdd_led to its own gpio-leds
 group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-leo-dts-add-shunt-resistor-v1-1-5d9980aba308@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAO8C+mgC/x3MQQqEMAxA0atI1gZqpYN4FXFRTEYDQytJFUG8u
 2WWDz7/BmMVNhibG5RPMcmpomsbWLaYVkahavDOh875Hn+ckYphJELbjlRQ2cRKVvRDLdwnBoo
 MdbArf+X6z6f5eV6VPZlpbAAAAA==
X-Change-ID: 20251023-leo-dts-add-shunt-resistor-2810206a5dae
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, Alex Wang <alex.ts.wang@fii-foxconn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215247; l=1426;
 i=alex.ts.wang@fii-foxconn.com; s=20251023; h=from:subject:message-id;
 bh=nhjdaQhGONa6qRe6C17O9kT3BPIniN47qBnafl7NHt8=;
 b=un87bQXpomsn/0FLsOCFLiEpZ+BJAggKp/q9MiS5J3KjRJmifLf7SQcSV3kCAhfv3Qyd3/5/9
 gX5dDcKJ9s/AEHQk5fY+7RY7xwxkO6/DDYnjudaSMejQr96SpfDXuRx
X-Developer-Key: i=alex.ts.wang@fii-foxconn.com; a=ed25519;
 pk=m/IrKXb14uSdDm4KGXemjNIxgL6TrqXCc9NX09SUJp0=
X-Endpoint-Received: by B4 Relay for alex.ts.wang@fii-foxconn.com/20251023
 with auth_id=551
X-Original-From: Alex Wang <alex.ts.wang@fii-foxconn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_032729_863161_4FFB0BD9 
X-CRM114-Status: GOOD (  10.87  )
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
if any GPIO in the group is missing the whole group will not be
created. The hdd_led GPIO is only present after standby power is
enabled, which can prevent other LEDs in the same group from being
created and blocks properly setting 'bmc_ready_noled'.

Move the 'hdd_led' node into a separate gpio-leds group so that other
LEDs are not blocked and the 'bmc_ready_noled' flag can be set
correctly.

Signed-off-by: Alex Wang <alex.ts.wang@fii-foxconn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 450446913e36..c58922695f46 100644
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
base-commit: b5dd162282164dc202541ce6551cf705d345820e
change-id: 20251023-leo-dts-add-shunt-resistor-2810206a5dae

Best regards,
-- 
Alex Wang <alex.ts.wang@fii-foxconn.com>



