Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689AC982DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=; b=kwLihb36bKRAYHJ1AdGXChywNd
	ckdUdXSPSxNrezLrMRJ7BlD18nK9rzei3OvXNGBka4zOdUp2hVzNQW2AAPmS85uzP8YmOUC7XbHMI
	GHPGx5yY2c9F72dIohUT1RJTwY+RN9YIOLgKXbBDAy+5KbpGmbLs0lSs+uEEdOAQ8HfY36JedqSky
	EXLp2yHC7oD7IUg5GFWabISxLjagCVM/4g0GmyjIe/5g1yiIvaij0AqAMlp8xWPsX0NjWCZ36zqLw
	iLDZfYP7WgZMDg274SIftirpzo4HD4eWhlyNjRQCUKSpF0oxepO2pRwioFLGYal4+TqeDgDvQSKT7
	7u37aZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFr-0000000CW86-2WVg;
	Thu, 17 Sep 2026 21:02:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFi-0000000CW3j-0cZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:02:45 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so969265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678960; x=1790283760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=EPk8Uw6ueJJcxL5T+/0tyYY3mONvkvGm+LtgEwLi+X+MUlujpyoYij8TwTaUe8TlhP
         9zUYc/Nk6pZd4eEtThSZn3/i+ON5y50JmXMHDLQE4KIPaR/axChThs+we8V1XEIryU7N
         OCz7aFtBVaBu0U52ATakrhOotwfj2pWlmlWMtPEC/3cdxyx/uD/rQxlZ4uSafVp6il6s
         a8Q7jgGeL97K2jYGM7Kz+cVQ1Di3Jc1KqK6h5dLwBZw5tAIilN6jal1Ar8T2rt84b3pT
         ly72hn397nNmHOvNXh6G/6y1frkb41vxZh+C6tC0u1XTnrlme2oVAWun2Z6Y3cfEJX0j
         36Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678960; x=1790283760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AZ0+eI++/PlX83+JWP2Cs841uENpnsQxPBRefFFlIk=;
        b=RikXnzWlR+E5DqcrSvO6rdTy/msJXHrP6MDzbZF0PSCe9VHnKcxGzvZ2xWuBAyLllK
         89IamiOHKxqM1juFwJtkl43RFiXsiO7Dr//8gJ+qh4oQzn5ov8fl7weYptNpcDyrbyIZ
         oWMNhWd1Fa9VY1BZkNPfE8CJKJPILkvZBC5L++198O53V5XHvS00JMg8cdTEl82z9L/p
         J66LZs6lUkkw3r7bQHqm/kDsY78jXYQDxb1UE3g3j1zrdFq37DJti0z3gHGXimhgGIpu
         7ETbvW/Yh7/Us8bN/7BrLXHg/weU4JJ5TzwSQoSDuHfzh6o6sYgiMN3k1QRa7qh1Nmhp
         eKew==
X-Forwarded-Encrypted: i=1; AKwUvBzJ6c3Vz3fDv8F7bLj8jFw3uwNNn3r0YwUmiEnGJLD6ZleEbVeQMsR1b4jPeVkCQULPrKObYd284/hXak692+OQ@lists.infradead.org
X-Gm-Message-State: AFuF++m3UAOJkDmnWQTCrRmDqlkrrY9U+wJHce5InaAncMC2spYBR62C
	fERL2bbcENDvGjsONW1PKHEPMHKIA9hecBZ7abCcxb2H7z6GJwqksh5JIMxshrJ0iIU=
X-Gm-Gg: AYBFou1QKqBnLFnUvy+TyS3XXBcSxP5CCuc8SM1upC8ixUC3Ze3VWpyr87H3Pc9o3Vy
	iU+1jgtKahIogXrNJOY/vX3DAqha/v9l2FsfH3Zng9H0vfZ35ZplLAHWB76ZBPdSGyowreaW2mb
	8r25mLxT7pfdTV+229Cp0xWCw9AkUOoEURL3SxvbTClL3vhQsICPeo1UKYzOkn7gPoD5g3rX+ri
	BlMA8kI4z1oAcETFLCxSIsBPYbaZlphSGNz8dJfklZhEk/PVPMrUZIFjE0B3kHzBGNy0ToZtFMa
	wNMefBu7Fs2ArxCfK8V6iOhaBB7oYkzwhKL3Sn++z3oBgm4N34vRFlhny8FeZl1ozN1Xh3WoHIt
	iJ7zALQG+3X5Igk1zDcObD+PXwWwgKE20j4+Di9UgT1v7+54mA0vQd+mdAYt8o1Q0s4KywKtpRd
	tVdsudOJL0MXgb/w+/nn3p1etXL1JjBDSZPoBxMxFiFtN9GuE4RUqmQI6Q5BTCfe1Bvw==
X-Received: by 2002:a05:600c:354e:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fc56ef4fcmr2059135e9.15.1789678960500;
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:31 +0200
Subject: [PATCH v2 1/6] ASoC: dt-bindings: amlogic,gx-audin: add schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-1-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8xj7kUdGgsVPCmxBLgs3dFbkoQPLuPzp6csuOKCL82I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnP/iLUayjLtvv3w1WaL+o6/q3gtS730b2x5bv4nd
 NEio0nXOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1lBGhhv/lF3Dql31FD5P
 951y7UhLXb9bXqdBKoNG8RaevrMxhQx/5e75/EuWX26jUxHwt4L/5y1eLaYPe2wDn4ooN2QzxW/
 hAgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140242_206121_E8221305 
X-CRM114-Status: GOOD (  13.09  )
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

AUDIN provides I2S audio input support to the Meson GX platforms
(GXBB/GXL).

Note: GXBB and GXL are not known to differ so the driver binds on the
'amlogic,gx-audin' fallback.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gx-audin.yaml           | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..76e6a6ddef36
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gx-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,gxbb-audin
+          - amlogic,gxl-audin
+      - const: amlogic,gx-audin
+
+  reg:
+    maxItems: 1
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
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
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
+      compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3


