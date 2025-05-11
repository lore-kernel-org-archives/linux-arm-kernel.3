Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB4C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=775zCTKs4kgy/GA0aT0GfMY4E+vvOj7ixGNt1pqBZjE=; b=KxPsUzetebj3pp2DnoyzfdN2C0
	CkF3flPzzeLneMjJF7IUmrYTKU9iApWP2ZQsM5Qu4fii0e40cRbLXFMGsrvrq4dqJfadPUbQrrJTa
	Zmly4yZCio50l6WZYjaSGx/eAIEiSmYRhTWyEeERr3D0tCBw2Jy0kq59/Ggzl7obToeE9c8WEroPl
	t1uzppmATSdTE9FedhJTV1uJ3DiXrBbiqaU0KgznNAIp0mypLY0nYv2J9TYUG89/+yOPqlo5HcOzR
	fQWqhkdm/Bm83wAXCVpDdCz3V/UvL/La5+PDML/tg//Tek8Z6rJNvD/wmt3j8q+dC+IoJuLCVH9ch
	3t38cQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE21o-00000006wdH-3BLf;
	Sun, 11 May 2025 08:27:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1tv-00000006vjR-1tFM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4451A4A500;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AAF1C4CEEF;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746951549;
	bh=EFwuzycZZAj55AsZrQ8FwNZUMC6vffFkyYtonYf6oHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FgNgAkZyMYdX5YEtef4zs4QdmY39Q0p0mMOcdgtAyUZHjGx1v5A2+1xsQ/Vkt3DdH
	 Tv+qvNjASe+g43Y0McEv0N8YxXVSEywojUmdZ1DmxCHf4UTWSlwg/eLfrPD/vaXLrI
	 UkuLhgMIaTZ//nseLX6kRaf72c2y08qaNtWEJ5zPH2uVnosdzPCf8FSk1mxtJL0/J6
	 skvO/SVRRu9LGHggS0qM/UJfkqIzhPDYCG4+/P7Kq6nKKwqIIQK1M5c5bkX/XQwSQn
	 Qccctn9OWrWMYEaE6g7oHU1824XCaRKtmYBqQqLttSQp689rVaCY32qZOEG74mBYu+
	 W2d1+RagIwLUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC9DC3ABC5;
	Sun, 11 May 2025 08:19:08 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 11 May 2025 08:18:36 +0000
Subject: [PATCH v5 01/10] dt-bindings: gpio: Add Apple Mac SMC GPIO block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-smc-6-15-v5-1-f5980bdb18bd@svenpeter.dev>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
In-Reply-To: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=2bi5nXYBfkQV2rFFcMqCxUW1BDnhZVe5IxR79APQdc4=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZCbNG0UK7VlpdPXG97Y5WkwFcQMM+69gPT4xnqHXue/
 jC8cn91RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi8fsY/tkwhJ7iltAUsJol
 sDL07W7f36XnX69R3pdd9H6Oqc47ZhOG36y1aXbfFiVabVIU5/q8aOGMJZnrlp4UjDnEOs3YvHq
 LJTsA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_011911_633219_A0F9E466 
X-CRM114-Status: GOOD (  12.34  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add the DT binding for the Apple Mac System Management Controller GPIOs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   | 37 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..07305eeb2595f59d5c28f6e507295b828dafd4a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/apple,smc-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller GPIO
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+description:
+  Apple Mac System Management Controller GPIO block.
+
+properties:
+  compatible:
+    const: apple,smc-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "apple,smc-gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..b53f3929b06006f9f38f5cda048516891c18c7ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2267,6 +2267,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.34.1



