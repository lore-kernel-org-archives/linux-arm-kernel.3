Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AA0D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAHPnk8MbbfP00jNZgXo2iNzz+bzCjCX9+H/CncDCa0=; b=tgjdKx6UzuwQn1JnliYYKJbVh7
	KzW130Yi7pVtshR9Vz3j4AhMGaFdau3WNi4o0UddHzny90xnSU8ZbLFlhs2Tf7zXCTyCBekug16R6
	DAeYlBVWEfbrZIBpaG/nqRfUcj5EtpZqyCU0QPreNNHOgkqsNKZN/h+bxBZtz6e2pmx3V/6JcHLyZ
	ElGCVqwB5qMQ0TlBSfiiTuT7Uf1FOJ1/UAUw2jt3uqSGsAf6oNdW22nGu7pN8rYIVrohlG3LbubnE
	o9Ti1jSrphuvWEC/AC7gc7yQzu10GIitLcmE0MwirS2vHNCWEhOdkmSY9KIPRR92htjztJIuFMH3g
	h1RB/Cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG5E-00000004Hmz-0HDm;
	Mon, 15 Dec 2025 21:26:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG5D-00000004Hmb-23sE;
	Mon, 15 Dec 2025 21:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9402060189;
	Mon, 15 Dec 2025 21:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28408C4CEF5;
	Mon, 15 Dec 2025 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833978;
	bh=qW+J0TQSffz7lEd1Su404eSJR1qGFWahPOvcVuD8H0g=;
	h=From:To:Cc:Subject:Date:From;
	b=LUaXO1Mmogzvsgnl8TOoxhHfgiXR9IKuU1jZuSCZ4+Yw1lSF9rCkRGvcl3PhUCLcG
	 tnaMHo+OdldBGEuhqpHm5oGAB+K1qRRznj7b5udex5AIuy7VUH5rqPvwTJ7IegTFBo
	 SYW/RhUiLVmw4Ksis0FAIS1s6hvIxcHp7km64Xo+sksr4lCV3dGKaKBCFLhWF1MV68
	 oSh1o5aBPf/zhaGN0ZtwMD3FcrUQdtjmv6097JVnAZsxtZVKHguQz7mQbEGsyf0lF3
	 MVrmC/nPeSlmdY9lW6WvI7hbppoXP06p3chGE2aEKU5qKDxr9PDUS5FjdFu67fZODl
	 KbKEj0KglfOug==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: raspberrypi,bcm2835-firmware: Add 'power' and gpio-hog nodes
Date: Mon, 15 Dec 2025 15:25:54 -0600
Message-ID: <20251215212554.3319105-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add missing child nodes for the RaspberryPi firmware. The firmware
implements a power domain provider in a 'power' node. GPIO hog nodes are
also supported, but the node name pattern was wrong and failed to match
them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 266ed6e61cee..983ea80eaec9 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -66,7 +66,7 @@ properties:
         minItems: 8
 
     patternProperties:
-      '^-hog$':
+      '-hog$':
         required:
           - gpio-hog
 
@@ -92,6 +92,9 @@ properties:
       - compatible
       - "#reset-cells"
 
+  power:
+    $ref: /schemas/power/raspberrypi,bcm2835-power.yaml#
+
   pwm:
     type: object
     additionalProperties: false
-- 
2.51.0


