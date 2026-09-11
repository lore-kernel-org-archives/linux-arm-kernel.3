Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jhj+D3u1Hdp6k7FiJv/1raAGblq3kkIePMv8OFR20rM=; b=nA0WsF/+riO53XyzKoibNYegXr
	fGevuW782L5oZFUFNrl4oXrF1PHC7LBK659deSCWTJFyFNLQCnq9y1ZwFwKa8JThhvRmaOf5DskWr
	xMsLXPrNHgZGMhYYu8cb1dCBQRxz/+uGdtAG/GOJHHNrSOh2ltn3HrtddvBIw19POMgELMAMMX4TV
	8/7Jn0RNETnXXkWyV20XS56XMTP2Yh5nuD+TveQ3Xg3LuzVOYE342nMMuRf5oIad6iR0M5HW6Dmux
	hnssemi4/NRqW33DzaiHUoHF2n3Uz2+U+olQLzCpe0inZKCeQIMlQBNOwHZwIrP2s1c0bxk3meNpJ
	uGVE4Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wm-00000000FJV-3DJS;
	Fri, 11 Sep 2026 22:15:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wb-00000000FC3-4BiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49e6b280cadso4218205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164912; x=1789769712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jhj+D3u1Hdp6k7FiJv/1raAGblq3kkIePMv8OFR20rM=;
        b=R0dkAuPEcuyg3TQlIPQWsA2cI5dIIndkrMc9ZAbugzu+/qaN7381eeIzhYJ5FniC6n
         wJgM5Eq1OeZofSEZVzjIwF6cR1w0G+owNsTzubTM1MG/soswBejnPsOzSGWGYxztA3IX
         lZhL5y1Zj+CePVP6oYS8jIjy+KZgtquy7k1Y5GzBNw9Ruk1Y2h8SckscrUxxNzG4gEM7
         /6Ard2RrhvW03BIEpr5PZuaXQoifKfQxkP65ffrJG4RSP6fRQ6C+KBYPKurjw2CjQ2yw
         ZnOzw6m/4UUcPW01fCoiL4zT5N9Wj3m9l2LCV1rzdN3fxHr5NaekAniJDNy3NxgpJxc0
         7bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164912; x=1789769712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jhj+D3u1Hdp6k7FiJv/1raAGblq3kkIePMv8OFR20rM=;
        b=mGiXp681NrTURoQV81zlGMXneVLfiw7fRoyLcP4gOmrdNBs55uI725plZHI2ez6+km
         epJfseJ0oMogOfVf/zRSU66eUEoSegxBwebH+Jgatbt4T7C6Gal3Y0sK5VXqsNYbH99i
         MN/ts+xAvEC/c3yZXzdJdgO0OTL9VO1XxEuzsp3orLbUBr4gUPbsvatykWGqvOsGVZi8
         fioGM2lGgSJUGKjxur5YcB16jaq+YmI+dOtfxiCPIctZWTUM0wgrOsIdS4a0p4LkUwfG
         C0X6lMT1k5hhIWx5mThONNnA0fj3QQMA+mhtAzZpugmI+p1g48czioiORAl4qYAkMVT/
         Ek6A==
X-Forwarded-Encrypted: i=1; AKwUvByT+9/QtNjGzwxbUnJvahgc7yMCwwfFN7zoAEIJ+14LBOEw94sEFijRlNXNvp9+7BrCqhlPoBCUNXq+VIKSgho6@lists.infradead.org
X-Gm-Message-State: AFuF++nHzcFa4KzCk3Pp+kJg0M8khFAuren9L/mWs/WVq5LNyaD6UHLq
	8uNhH2/sv40YmsCJkwonMCP5b/lAyJbHuV6L2sjfBEiIxJqlhcN9Zx8C3B4xwMrMR8I=
X-Gm-Gg: AYBFou2SHOgka9Y2Dm1CYIP37ss1NJrPasU+o7At+NYQ7vcSKB8HMtI54jGPohrvMVw
	BcR+QiHhox8fN2M9SSw7dp0aF+iOXv2UnuFIuwOHRgL17gWdyBVBKwwQcM/sqEvA/0crTUkFREo
	s60v2lYhXUydhi4zYtFyFGVAfnmkJJ6Uc6DgWAWJwIJlcZn+qEVc3KyjClAwVSkIlcRCOaQ8UHw
	1xWJ7EYBQvW8sd55lqoxUcocaYRMAFbjZkyIy0ZoEsUqlfnL7i7hVvm6z4W3eU09LLyAxKuyVq5
	08JG+EpBZggoSU5ypJPynbyNJvsKP5NRk0jdTV1NxnWiEDjZKhytK09AaaousFPU1efIyWf2FXQ
	NiNBnKexfgrdXKqmfpKMYKGgKsqKKS0FPfFUkf3Qju4lwtKYxplxfd0ZOvDocxGUohLfDR+MCgp
	mOLfbjhLTZwLZ5ur3NB7JVphSWnaM/azTHSOC0UL2O1CsDX3+3sE+HzJPjAIDPWMre9Z8=
X-Received: by 2002:a05:600c:3b90:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49e619805f1mr71228535e9.4.1789164912040;
        Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:11 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:31 +0200
Subject: [PATCH 1/6] dt-bindings: sound: amlogic: add schemas for audin
 components
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-1-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4740; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=i49CtTXNdvPDqvnQKB6P/xRaXz9o1Ta+9uCeSBaVc0w=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanP2vC7jUtmx8nOMoSnL/n7eYv7T77p3MbO/WOa1R
 I4zY41CRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACaS4cjI8O2H11KTH4lLvz75
 d6vg/NE7jSITaxbxdc8+yuUbvl2vLZThf13JYasN5lfkroRGnjyXdSuEN6S8xlJh3qkENf4/OmW
 fOQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151514_058246_9D45C43C 
X-CRM114-Status: GOOD (  14.71  )
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

Add schemas for "amlogic,meson-gx-audin" and "amlogic,meson-gx-audin-fifo".
They provide I2S audio input support to the Meson GX platforms (GXBB/GXL).

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 52 ++++++++++++
 .../bindings/sound/amlogic,meson-gx-audin.yaml     | 96 ++++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 000000000000..a01fe22b9786
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN FIFO controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description: |-
+  AUDIN FIFO receives audio data from backend interfaces (ex: I2S, SPDIF),
+  stores them into a FIFO in a configurable way and then bulk copies all the
+  data in RAM when the FIFO is full.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+          - amlogic,meson-gxl-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-controller@80 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      reg = <0x80 0x1c>;
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN FIFO0";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml
new file mode 100644
index 000000000000..d8dceaf28957
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description: |-
+  AUDIN provides audio input support for the Amlogic GX based platforms
+  (GXBB/GXL). DT-wise it acts as parent node for FIFO child nodes, whereas
+  from sound subsystem point of view it is a component providing data
+  formatting widgets.
+  Supported audio formats are: I2S, SPDIF and PCM.
+
+allOf:
+  - $ref: component-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin
+          - amlogic,meson-gxl-audin
+      - const: amlogic,meson-gx-audin
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+patternProperties:
+  "^audio-controller@[0-9a-f]+$":
+    type: object
+    $ref: amlogic,meson-gx-audin-fifo.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - resets
+  - interrupts
+  - ranges
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,meson-gxbb-audin", "amlogic,meson-gx-audin";
+      reg = <0xa000 0x308>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0xa000 0x308>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+
+      audio-controller@80 {
+        compatible = "amlogic,meson-gxbb-audin-fifo",
+                     "amlogic,meson-gx-audin-fifo";
+        reg = <0x80 0x1c>;
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "AUDIN FIFO0";
+      };
+    };

-- 
2.47.3


