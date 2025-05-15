Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B20AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pISWhi3hrukVEdbObtbAFb1W6uhcMj8hKT8ds5Yzhp0=; b=DAxevVkJ70XWCDFDes+1CIqCB4
	rnSA/30Tvq1x4DqTbUckkKVM9ypgP1k8ZUhzZV1myLSbUVnJrNbpJ1loR3sMYqxo2/gu5zWExN/1Z
	F2gDZvAErSeipRGNLsIwPoZi5JOJ2i8rnOJyVq1gpZ7WBKe6D1mSuXoxlvjHuhkQNU6ro3TFcdNZq
	L588KSKUAgKpMwlO3AQ/NpK2Y7DV+a1qqxNGWf5bGwLG4rGcSvi+LnnrRMd+LTm1th7JrR9WqqD8h
	JtgnH0GiKBOtkAJuGsPvO3IJ1ohK449nLVjV3TJ/NwVDq0uRduWDMFzZfBJDJa58pNrDFZrWX0n+T
	o9q/V7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFS0y-0000000H8nf-117j;
	Thu, 15 May 2025 06:24:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRyy-0000000H8Q2-2xyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D48EE629CC;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42165C4CEE9;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747290134;
	bh=L6jU3HkPzKiDD4GWaH3v8fxk1+c8tmtCkEiqjegdW4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=otz16wV5TeiPdznWoarn0mILd4xc4YfpVO4bnNtgqmEwfIsDuPeC+ZFYldfrwx6eI
	 FEJGwXLpZeKOPBGuWxn4RDgOONMOQPyTgDALcwEqLX7LOllopsN6fh6SccwDXpJyY1
	 QhoJFmVeupEnInBqluEf2ELtSJmdcBHCSxOqwoojdZn+1httuXT/fqgquX4SY+NBLE
	 rPOeCgo6i6JYlPD4VuV6an+bRimv73JEVMnVTAJh4pYSyp5/SmrOPPaVNm32UzZM4a
	 3NgzhJ2Ax8cLqEbv0darKnwLzoLTRHfCyp7Ew8Ypbn55A9eSFj9U4WF0DqA0tTLflJ
	 JhmNUztB+bDhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371D7C3DA6D;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Thu, 15 May 2025 06:21:14 +0000
Subject: [PATCH v6 02/10] dt-bindings: power: reboot: Add Apple Mac SMC
 Reboot Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-smc-6-15-v6-2-c47b1ef4b0ae@svenpeter.dev>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
In-Reply-To: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=EZJ1MbR9nhGPRqj24o+bpu4vy+PDYAUMdMkr9TwOKZU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZqB+fMf047oq43XepX5+vU07hgELOdfe+dFbaKWcXdx
 nan5O51lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACYiqs/IcE6j4qNU4JYVU+29
 PGqj9y+4f3vhQrGPDSuurfxhoPvvlC/D//SAnK+rm7w7onN7Kqa+WWSokbaHL+TilBWm8381vX9
 6kgUA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

On Apple Silicon machines a clean shutdown or reboot requires
talking to SMC and writing to NVMEM cells. Add a binding for
this MFD sub-device.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 .../bindings/power/reset/apple,smc-reboot.yaml     | 40 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38d1b6ac9b813f278e1d6c25667cc7b4b0a56c57
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/apple,smc-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Reboot Controller
+
+description:
+  The Apple System Management Controller (SMC) provides reboot functionality
+  on Apple Silicon SoCs. It uses NVMEM cells to store and track various
+  system state information related to boot, shutdown, and panic events.
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+properties:
+  compatible:
+    const: apple,smc-reboot
+
+  nvmem-cells:
+    items:
+      - description: Flag indicating shutdown (as opposed to reboot)
+      - description: Stage at which the boot process stopped (0x30 for normal boot)
+      - description: Counter for boot errors
+      - description: Counter for system panics
+
+  nvmem-cell-names:
+    items:
+      - const: shutdown_flag
+      - const: boot_stage
+      - const: boot_error_count
+      - const: panic_count
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b53f3929b06006f9f38f5cda048516891c18c7ab..3f32d028ab49994a0da9f3882f37b9c3b183f5b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2281,6 +2281,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.34.1



