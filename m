Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA7FD5F8E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9F28QPoElHFXjSecKpbA7nEHozVWxdHvwW0NuOzOy0=; b=gIrYWg0gTEaN7OHSldstMGCc2J
	JoplXJ6QIzD0N49RjBAX1srO4k7jqw17UGTuCZwyNl5IiK5waGKIP8g/s89uBjNC291UUEYmWZrYo
	n2qdbIG3ia99CKDHxuVVRye1xyDOTjwYh6AVj870XPQjc1jj1AoF59u4oacPrlPPNi1/OEY2bOhp4
	ivR4e9KLFDiMLu3gkwvvhMza7GUhOdbUsI7ZfiHBsms43OiKWGPpmhvpSZ7PJa3Mpz+7mSwKwnB3g
	nlte0X4U1M2EvRKdO+0x1xbXBFssWSvP9I8tV3QBDlKS+d9muR/88jXq0ZhZQExNYssgO5GzuPHQU
	gv98k+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANpx-00000008U2U-0PyN;
	Wed, 08 Apr 2026 08:00:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANps-00000008U03-1KPF;
	Wed, 08 Apr 2026 08:00:31 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9F28QPoElHFXjSecKpbA7nEHozVWxdHvwW0NuOzOy0=;
	b=B4OegvsIn9uOpZWI2iZsbq++71UYPOhxkm1VqvN5Z1Kr9HVf9MK5rweAB6QQwt5yqPl3RK
	dtv5m3pIl+pp6Z82XzXbwcoY7jcObmJG+HpVlCLF9SAXd5YyaoscLcgWsOdss67bkRNO+Q
	Kyc7GeVN2KfJT9yd7MW7+nVBt+aGtGFQT6aPIskM92+vc3xuZUS3DXQ2LzP5OpAym5w1iQ
	SF2dcpf2Dvfw2XEtJPsLI+9yKu4el809nV+1ECsx6a+Kmx6xzVnsJYG3GPe3ZxcjymIdO4
	Fosuuy9IzQ0yLufobCK1L2g6ln/hTyiqA4g61xmWP0OfOyXeVHpuNGxLpw9zmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9F28QPoElHFXjSecKpbA7nEHozVWxdHvwW0NuOzOy0=;
	b=VPL9iZr6OSfiSBq1WUYd7QNmX8q6lrj8nbsbTvi+nxAFXcHTfK9jZo/4snnI5BA5u/iSrQ
	pLgVuLO9M1cmSSAw==
Date: Wed, 08 Apr 2026 10:00:15 +0200
Subject: [PATCH 1/3] dt-bindings: nvmem: Add a binding for the RPi Firmware
 OTP register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-rpi-otp-driver-v1-1-e02d1dbe6008@linutronix.de>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
In-Reply-To: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775635221; l=1463;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=/3j3lZdv+iRGHGGZlhKUgCrFKI+nuGpuzrD3xSLmtOY=;
 b=JDccdOhsks2lYIuuKHjN7S+63sLl0WfsaVwTYbaeowBEVFTMfxKs1Ej/O6+30XkrntO+qeMCy
 Pa8Gj1m4xYmAY0G28P9SZHGe/aalyhZT+xn91KXMfW2rtSEdpIb8wk8
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010028_509353_158C681E 
X-CRM114-Status: UNSURE (   9.05  )
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

The firmware running on the Raspberry Pi VideoCore can be used to access
OTP registers. There are two OTP regions (private and customer). Add a
binding for these.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..975c8927d75b 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -137,6 +137,20 @@ required:
   - compatible
   - mboxes
 
+patternProperties:
+  "^otp-(customer|private)$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - raspberrypi,firmware-otp-customer
+          - raspberrypi,firmware-otp-private
+
+    required:
+      - compatible
+
 additionalProperties: false
 
 examples:
@@ -156,6 +170,10 @@ examples:
             #gpio-cells = <2>;
         };
 
+        otp: otp-private {
+            compatible = "raspberrypi,firmware-otp-private";
+        };
+
         reset: reset {
             compatible = "raspberrypi,firmware-reset";
             #reset-cells = <1>;

-- 
2.47.3


