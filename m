Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE685C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWifvzTfv6a4hKExU1M83989tAxm7mukSFUOelJvbE4=; b=ItFvxWvVf7pFO2NnpgkD+FFoY1
	ETB/+KR7UDgDq4PEj4uaVBjWlS3BkIPcL5Zdyz4kuc2QFu5U8TdgkDAz1ZTG9r6lbGdRAUmN0Xr2k
	2ghxNpXbpD4IYXYAiTO7eyt+kwW0u0iyCIG1avZZluABn8zCh2U2HvnL5Qxv63aerzc6COEia17Zi
	MnQ4D7IQ2U5iopU8qo84t2T2K408lJ+qbqOuUNMRnP41dr8Qbg6Hp7RCs2YMQSpQkNipwy+1xQJ3U
	mguxi67SvsO+Nn0LoNt6+eCZ4izEmmnnQc63NXaLluAaPwGwEXvgx76aSuMmLKClz+dE3v0RmWz/Q
	hV6rLtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9qo-00000003jfc-2h20;
	Sat, 03 May 2025 10:12:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9m9-00000003iwW-0A8u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B81D74A7B3;
	Sat,  3 May 2025 10:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8F93C4CEEB;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746266835;
	bh=bxleu5u97OIiv0Xv9kfYVfxcAPSFPeqSvomHkN8FMOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hWf2E/kHGdRQEj9+Taj8WsRIvcNxwSu1lPELYJ742ucFbBk7K+u2KKHeoeQMwuTSa
	 lstMEAUvJW79DJCGqQy+8N06P2wlJur3+5Y4WC+t39T5WlJ5X1NES+UnxeC+s00GK3
	 IGMKTxwTDAWQA31sdIelsojSNkl0sJCDNnpa0SEfSfTpbTrS0tbgsSGt9jvXbyrELq
	 cgXo0yIIERRWELkKluUVxFmD8HUavqWNoE8SJaL0brQhsgVgEQ2tSp2p3jp1pOkv8+
	 FIhQsRZKvUFY9n1GrPKW9Rj/dn/MAlAkpBqP30l9i7BGb12F07Jdg5t3fcKaFo9O5r
	 NmAVRD8+0ou1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AE8C3ABB0;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 03 May 2025 10:06:48 +0000
Subject: [PATCH v4 1/9] dt-bindings: gpio: Add Apple Mac SMC GPIO block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=7EVhNhPla32kZTqn+E4bqYHzUCjdjU3KtFUCmUQI7UM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4boqyPVVjZlh0udX7netF2fc79rZdm5M/5tNhc4u+ZmB
 zSZ78vsKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzk5VSGX0xtEn/bj3YcOSdd
 s9NTLtet7q9g9Y6w19zSV3Mf27lcnMbIMKn+x0XnqqLANRdOsCY+FuZSFSqX/Hv7eueL7roP6pJ
 anAA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_030717_130111_7E01D25D 
X-CRM114-Status: GOOD (  12.41  )
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
index a70d79a5f6ae98fc0055f1da20dbecc095ea5c65..7f91f0225133490607ba0d79ad4225892ef31a66 100644
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



