Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CF6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FweYFWQvoZssJ6fM//sCdfeUPF500+UD5gOd7nynddo=; b=0xWC5FGn6br9w7K6NYlaqxQon/
	n/5NZHfJP8YCVlap5+Vtbzmz0QoKHkVQagwefp8YCgwhS17iudKMlNhsfyjm4VlVAyU9bErAoBn8r
	NAuvbrPyr4TX/Ek/aBO9Zdn/tzbUhJeBB8h47Aw9hBJDP+dWRH3bujmDM9D2TFre1woMpOCJWv9Jk
	SpLqDc0yidX7pLhJ1v0+0sjPXceUvtd/ph25VxFYc38KGMhfLtyWuzFJjJmuUvqNutraODnm9WMFa
	BzCq/GG4+CFtgK/FYBYr5vO2OYHqngzrmZm5EghdSWkJcXJlRQXwacyNHSh2/wm2YnwXbkeDd5QrY
	Tb4Av2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wM-00000005ydu-3mmT;
	Tue, 22 Sep 2026 16:01:54 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w3-00000005yUf-0Fp0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:38 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so25886285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092893; x=1790697693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FweYFWQvoZssJ6fM//sCdfeUPF500+UD5gOd7nynddo=;
        b=GZkdEwlR/XLs8P7TcIV92BdQ6p74wvvrVuIqVjMR2vAcJn5FKTM6TzNpTd52LtVATh
         hMB17T51Dx3+o6O+6Tb5Nxmr/jucV9Xg1Ae5WvqZ/at3dIg3wKfR+cZm03nHYS39K9bc
         sVaYY9mPs5dsBZAlwBUPuSvJJoScZI7Zalp4t03/pZy5LxgXy700aIzWBmYy4dtC0vUr
         MZyk3UsZzLufEFFyr6bPnxcrUT/dtlQ6sCKjtX7PSTxDHfE8cx5EL4bhE4YhuEkiT7xU
         OjGjkhVNUPM62kxWV0Uyzdrq1BeKdIetsjUGwqrELHTg0fJqBAtoxm5FMr8VwbIWiueE
         GsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092893; x=1790697693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FweYFWQvoZssJ6fM//sCdfeUPF500+UD5gOd7nynddo=;
        b=WE18qyynG7Zno7SNeRZv5sVeQpPTeOgA18ywmZb5xaxtb0SKBg7gr80aftWWrYTfbr
         +4syLRbzhn+e+1EX3IbGgreVp34UfbjAtdu9gFZmIMGpsQ8m97KEzIky1anz5WiSmyZu
         Cjr744tTslCYnxXHUfI1DtngCRkjyMaTMmQ/+Qni5WbbDS6UKEUrH8k/2uEwWlTLS3ir
         YrJ0+e3AeciYMDdiWVSl547TcCj5g++QoIHZcxxV/rq/1ASmZTr5Ab/cXv+TVNFmz7tg
         XjAjQqOfQmTJfT2TeThRL38TXf0WsQK0FXGBLKMtsfsZJcZQqYwXElM7tMLGFezMyc4X
         RYZg==
X-Forwarded-Encrypted: i=1; AKwUvBzRBoNZy1CC3XQwkfgpreueH8QyfzqV5EuifkhAbLdt+piO4pFKkmu03GSu0xc2GpOnHgf6lHHnVg8oVP4rjwzM@lists.infradead.org
X-Gm-Message-State: AFuF++nIyphkYGfWlqWIH4o23pEx9AYWcPhj8nOCMxCrPJaaQxh06c4D
	9CArSmpgzhJoQUD2Bw6u/Us8Cnx/ktHVN7iiGGNuVj7KD8UP+NaEXy4b/R76Ws73l+Wv3ZLHtZh
	6+dS/D49a7g==
X-Gm-Gg: AYBFou0BMknmaOE8xJo1dtAIVhOzTfd4KMJ1LvOrGULglgFZaWMh5KffdG0Ynq9iGjv
	zZr2IkeaOYu+pJVR4ht+XiG2Qt+Vbt2aX/ZpwngLyXbAkDOx8Wn9TMmx/Ig8j/fnWdWPsX5EgMB
	Hn22Vl5WgNmxPVXUPRILlcPOu8XwAvWcrVRUCwhKxOkr8t5nkH/GtW7imzJoDnJy14fcWCswqCi
	GOloHhZvjS5ijM0mgIR52Xs2Mv+gjFJE/bIarYhTe3iFsKFjEZly+4oXvOprmYd4DUz+qZq7d0d
	F1FbXvZC1zcDVwRZTnInApwqV/d+tuNPPfi3jRj5uNCwem1ud2ydmNcVyuMXd+2O2akd6L/gqGH
	7uCuHhKC8W17gh0EYShmXKy2vBn7CjQXLqe1R+plLWW+PVBj+tLKhVuilhepQEx0rbZkl5XUxIf
	yaKC/U/SQ1/zjABbFoJnCmlvXLEUmy2VQn4VDq9UgBjfxwlWkt14SrWoPPKKJN2LQaDQ==
X-Received: by 2002:a05:600c:4f41:b0:49f:ce78:3570 with SMTP id 5b1f17b1804b1-49fce78372dmr147694095e9.33.1790092892893;
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:46 +0200
Subject: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-1-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=BtLAkNapV4DmIrWa28ic6M0lRmuI8gxGAx+Yq38WqnA=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkWWhnOnds3fnOve0Z1U8XIO243wpvWmr+s2a35WP
 Zgk9GpPRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZyYSojw5qcUG+j9tQ6roOS
 H9z05Xb89jAq6H6fJL84/IjFQkeTPwz/0ybtf7Kn8tHFaIbGnZ5sB+d9Zb+1qbFF9Ps8PRv2Qn9
 lLgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090135_191135_3F8C28C3 
X-CRM114-Status: GOOD (  14.14  )
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
 .../bindings/sound/amlogic,gx-audin.yaml           | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
new file mode 100644
index 000000000000..bdf1db882eda
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-audin.yaml
@@ -0,0 +1,69 @@
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


