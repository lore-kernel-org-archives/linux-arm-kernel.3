Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D98CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=; b=qDINWRigA3SDp0pfQ4PaO0rbeS
	fq+vZAXYMz+4gDo0yYmjfGeY+KFGbpqZlhr79GEf9xlGS8XN76J7Jimc0SbeNuCjF7b/8669YwHet
	AwmcASZSNC0jZGNlbT8aR8WQmC95SHBqPuF3urnZa5lVvuhfhjmJmCm36svdDT6GhRpyaWaYsZDEW
	DardWqqI3GHtWFToOCmv2pGqpqWhVO1oEYbkqBjMfWvo7ABgPoq78PHLWF4qoxGeGHPVYHNQ8Ehkv
	hK/yOoHLPshnYjVZAsnuyD/cjBCkE6thaSUE/7R+pwkX2uW9o78DfUyoUJFtAGIM+S2QUdJRWcz3b
	cKATGK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyd-00000005jls-2io8;
	Sun, 18 Oct 2026 10:18:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyT-00000005jeO-0rcA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so4701715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318719; x=1792923519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=I6Wgy6dyZy7e1c9Fm177pTwsZnEffa3eFH8TnpYS7SziCL/o7GieHzZcJqArFbRo6y
         Ho1/s8K5CkNDB8E6HcNgkn6hwvolFzhfvKaiGG2RYQNTw77Ie/kAPv/6DfRVL5BciGMe
         clXMf87JU7QCWqYA/sRTA66vdWYcaoottEU0LpQ+IcFDS48h4929lcVF+nD+UqTD2uAo
         IaEpvV9OG+ndPaav3SZkXMr9llLX1t2uUg8r3MaCf2RvMjBwenR0Tir/oOJS1yiwzs/l
         +UxHtO5zGR29CZQHJAtZCIH63Pf3KHRTYi/bXh6gO0VyrrJwQR1yV9uODJRR81Sob6+z
         lz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318719; x=1792923519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXUbYakFpTeYzMKXIFxmT3MjUgNH4qUmML0VWV6BI+U=;
        b=nyXYsn7ylog5pvlhSps7QfXYQimaVltrMfolazFfdj3umfsGi5AkKHN2jl9oR/kj6n
         bNuTRdQL7/zuFG0j30Y8DO4kJrMt9guh7CZM2aKQhdLgJIvcnLNN7I7d6Br93XtnView
         k3vGTGKvQDiVkQbp8yxKG+etMXNR2c/bEXPC0XG7HjG3XRpnqL/mCAXdlACSuEDv8jJ1
         PduFbtuG2xx7lEFCj3nVm78zbP6+kz0jk5UM7YyuMzCAbQWTVstCULr/+llU/DA23xab
         If1NzKgfYv7l/NE082hMBFpcDMF71t+fqOAcdWIk0E/P+g1RSKjazYiWGG8sDzL6iHyT
         JDfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQVfNQBXWS2KxWaqrlFTTZy+lm7WD0oqB2nh62mPrf8Mue0kfKUpOk7vpvwVZVxsHpZfWRC1YAVGuwZ63CgZmd@lists.infradead.org
X-Gm-Message-State: AFq9FYL0vZntq0uC8zRqzXRpZP2oPKPAr95/9IOhyjBf3y7Gg3cV1XbN
	P3ujpdfowneQaqiBcaToKPtPZpcMOS5xwKMk2KjIkrxFrppaX0nvI6Tm7+HKb3llmxc=
X-Gm-Gg: AYBFou1mybaIGXOpbR/v311sreEn56bNTwhmthRIE4/QWFJEQENFuICBqw8/ZV4+KQ5
	ZlJlS8f4LD0xVqfF7B1l0WDdD7Fw3ACpqnvLkSBmFYlNpUuuTk80BI7lpBwknOmkc1KX3FWZ4Vf
	We6Y8LsA6jzzvPcMb+jaDa8IYyyax8BqplfbcJrJi5fnuVLtk8QzhlrYhP2leEI+z+WtmU/Y30J
	IW7DdjHEIrKf9/kplKAFLnSgJN+PnEKmw5F64TbZHggbAdb2hJSrC0dIZyv+S+H2ocdLDOz9WIv
	lPa1zC6gDQ6ShnNF5nnPjxHrplvfQsXs0A4fDo6ZM2KSPw057sONaBobvEtM/A4P3o53VYyD+qN
	xnJkG62GoIchKnlP65Osev215nV1UcbwrkTrgvW691nluhpAsSjzO44VWYVWZ9JqKG1Boj4UMUn
	pF1zfeB/Z4xIQch7MpubRxqB7B5XXdcx0jqRSf6QCJh53pa9pwloehVA6o+GdoCkk37VoF
X-Received: by 2002:a05:600d:848e:20b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a1e00ba2cfmr31307475e9.1.1792318719335;
        Sun, 18 Oct 2026 03:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:17:58 +0200
Subject: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=I0qFUjuYkK/Jb+743ojJali2uxhCIRzSMoeKWGXcjcQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vzeZOqjHL1cNE+007OJeYXVo+vrj3hZMBj8s0qwM
 qhi/x7RUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIkU9TL8lTBYekKvh//v5yMa
 eirsB7YxJz/eMyle6uSMFqPzIgGLgxkZ3q6189Y6burd1ncrbaWc0uRl/MKfn9lejFB68Y1zmno
 lNwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031841_355849_2A01A12D 
X-CRM114-Status: GOOD (  13.55  )
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

AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.

The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
added so that differences can be handled later if any are found.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
new file mode 100644
index 000000000000..4df4796623ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXBB AUDIN audio input controller
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
+    oneOf:
+      - const: amlogic,gxbb-audin
+      - items:
+          - const: amlogic,gxl-audin
+          - const: amlogic,gxbb-audin
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
+  "#sound-dai-cells":
+    const: 1
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
+      compatible = "amlogic,gxbb-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3


