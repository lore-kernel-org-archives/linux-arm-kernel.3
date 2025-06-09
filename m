Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165D4C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=47TFo7IpbVAx04igIuRTtk49M4nFiyROCVNhC4tKtD8=; b=VkzrkCim4v5+etL/LpBUWMm8we
	9emL8Si7+J2tqZL+10hNqap9qcrfkfn4/Ohu8rorNykOAothupTu9kLOpD8kBUtAXkHOaLifvdC0m
	iNVmNZQ9QhjtIfPNDoYU7s64P7X9gEOD/1uRBGen0TZAqnltSNBXTMyiSAPZWu3YtYx1ctTYzuDHJ
	VoK7elamsQ83bTz989jHAmA+kuDG3xhh5maj3s7lL9asIxEeKKnXfPsZ5lFIx9EblzRltQKyrGPGb
	oKwZw+S5QBJqwMQbvAmZiGJ5GOXmtBaRk3zQU+rLp6HqktM4tk8G+LH8G8mzO6Zy2kv1lSdBAwEHb
	b0TLrpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQFj-00000003BEv-2Tja;
	Mon, 09 Jun 2025 00:20:39 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ3p-00000003Abh-221b;
	Mon, 09 Jun 2025 00:08:22 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bFshH5Lgbz9vHy;
	Mon,  9 Jun 2025 02:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47TFo7IpbVAx04igIuRTtk49M4nFiyROCVNhC4tKtD8=;
	b=R2EcutiekaaS7uiENVeyKDkfyTPuUD2xLV59tNLz4eM5+sxmkADuGEkCPanrjKqmWm0yZT
	WG7aqNIooGnj1T8JfRf0qS4FVz+0oLaxEbZ2oK4vsmcxCMrgDMRQ6q/KLTLo9U17x80Dvf
	6+qAXTOyI3XTb9bHHqMoHdpdZfSYV6n14TZbWsdwXm7GX1IKe+GAWf5NAWXJ6E5/PZYVxW
	idWWvtygZTvUUCeyCWlUVIkT3lA/YI21x4QG3t3uVlXZ2P1AakdyhDPFimIwI3Csn2GTCc
	CdlJrK/bc17E+q0IlMbv64M4ZNwEzGafj2Xa5O3JozKYSTRdbV0ojn/4GyF1qA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47TFo7IpbVAx04igIuRTtk49M4nFiyROCVNhC4tKtD8=;
	b=gSyynzV1Qmufr9AwZ0RApkSA+3IYGMe4m4rwXQh+MgZYfqOMh5Mib0O2ZKJVOeKSHrujj8
	Y1sSp0gQtf+ZXKNsYT8LsoyjNOCvIa8osqEMjfPBFCpaWtn1nLA0lgTVV4LOEujeQQv/oC
	biFXdJ8rz4u91+ehqdl41KQTt0ncOqGH/2gfjPHvGCB+KPU37mkY7LGIScllcEwxS7gHRC
	vMENBzdTV33vV7fXnkrNgv6RyxqDNE2N9g4hcljKxWd7TKrpZPT6S68UYntLV/cbN9yv2Y
	YtBWLhNawxCJUD4dmaSijNft1k4Gv0CJdODyqQVrAJPsUH7dWSinhLTz/Zj1Xw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH 1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
Date: Mon,  9 Jun 2025 02:06:41 +0200
Message-ID: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ocs6tgytgjjnxp7wr41s4qu4wjhpe1as
X-MBO-RS-ID: 8ac122bcd89682afde3
X-Rspamd-Queue-Id: 4bFshH5Lgbz9vHy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_170821_703042_743BEE91 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Document regulator compatible string for the 7" Raspberry Pi 720x1280 DSI
panel based on ili9881. This is the Raspberry Pi DSI Panel V2. The newer
Raspberry Pi 5" and 7" panels have a slightly different register map to
the original one and offers PWM backlight control.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 .../raspberrypi,7inch-touchscreen-panel-regulator.yaml     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
index 41678400e63f..18944d39d08f 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
@@ -12,14 +12,17 @@ maintainers:
 description: |
   The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
   controller on the PCB, which is used to turn the display unit on/off
-  and control the backlight.
+  and control the backlight. The V2 supports 5" and 7" panels and also
+  offers PWM backlight control.
 
 allOf:
   - $ref: regulator.yaml#
 
 properties:
   compatible:
-    const: raspberrypi,7inch-touchscreen-panel-regulator
+    enum:
+      - raspberrypi,7inch-touchscreen-panel-regulator
+      - raspberrypi,touchscreen-panel-regulator-v2
 
   reg:
     maxItems: 1
-- 
2.47.2


