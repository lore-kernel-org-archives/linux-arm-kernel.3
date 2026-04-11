Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF7F3ED40
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=; b=Nqb5P5qjim6lDk/QPa99WaIhxm
	ljTsP/iLfqlQWkBC78QfRvEcn2uvU39gsb1GCQ1J3mGVqWj1cxvCybTpfT6mRiEMljwxPHYx5yuDK
	+tYmncROMVJc5o18y9nIxfD4Um76QM36xsqte4tZBTitEJD0A0QoswZL4DcZ/3ok36WwZgILfu5P2
	MYHf1sWmm9JtYqNYZRmQQm05ZGmioI3t8sR1ORoy1kL2OOKoTM37N6es45V30ZFbV7+WbhODeB8qq
	6VkDjvKK4Q09NOJM7xjimRsmHywQ7VYHuuUGbE+R/qF0Gx6ygE7KDPvqouSLwRwHleg9x9iPxQoTt
	QxC0OGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmm-0000000DXlm-1Jwx;
	Sat, 11 Apr 2026 14:58:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmh-0000000DXdj-1BYy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so28383855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919486; x=1776524286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=L3qYJBzzoZP4XilJlSXRIkPH3pyTKFaWDJBGcOh3HlrUkg3BVRfaftJbbGh79t+kDG
         JFKJvH/g3E9osrXhoZdfmE7oHEaRpVbjR/WRhXNx6ol16FshWnx/40foPkyr0ia0lzyk
         9Dx6XP7xUDY2oiAtbPTspXWChvah6H7gPFqUN2sOzf54Edl8CuxHWIPfrJABCFdOrOOh
         wYn+nR+MoH9Qe6F8NUG39S88EapxtnrnhYAgQAxjBd4EpO75h/l40ol/+QHpPICNxcXr
         BglM2pD5kieWyejwp0GVeLH3ipsPARSnmbNiKSucMwnQYuaVpQ0ZOEFQVAPllDTXessf
         95OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919486; x=1776524286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqzpSMm9hvDl83iw/EoIWtzwO8VYSoc9MWM/tx+T2Ys=;
        b=jnNtJZ1YyO1Fndi4bVYaG2mVs43qoLMo1PxjX3INPV5YIls1IoLvzsXsmqEfR6WTOF
         tAt1TBFLahQIOZ/RMqBhGiGcq7SGNL7bvDWvcSVjgHiqn4LTfln5wkzZdETke767wUWk
         vCU4w/hgEBGfxnI2p1z2Cqm4fpikT6EVKtNYVl3E0SokwYRqR74ayPlrSXewvycUcbm0
         q9p+EPCKgGOoFk6JMnT0TxugBC5kDO3khvFFWz6WC07yBsd632N8Tb941FkQhyiUle7X
         YYPMES+T1QKs3DPGUsTVVWyWbP6bjZwIwUxNKrODXA+TEpgckX4cncepGeVN9aRvjZAw
         3v5A==
X-Forwarded-Encrypted: i=1; AJvYcCVQnEm2fGvum6aCXGxc9JurrOmv5qZf4f/o4vJkmzVK9RPojPIbSvnzintvzD/XO+9pknqrtiKA3c2CDYlN0gEH@lists.infradead.org
X-Gm-Message-State: AOJu0YwQVLQywu5ixCu+nEqHiAdDnp+cXKlViGUu5ly47lTKeimbVD+0
	pHLyKaSI1b2yt51Do8fjRrhHIRtk944xCRfQInsrkdbClXY2DaI+WKll8BbR7E03Y9c=
X-Gm-Gg: AeBDiet8DeptzHiTSRcUQ/R5MgW8iAPLbmXkCoXx/nbYFo2VgY2FsQ11ZD0ICZNK2qQ
	4IdGAKkWIhROj+nzS9AJ7iN1trcgv4IjyxEoeLtpXzxpuKzUdUbo0OeoUw+kLGJPBqOWJO6d3dD
	kct2jhxLyExhlqxKSoGVY0pImRzGkls9Mt4wiyy1GEDRy2IKx78tzqUUJ/kzoLyyDJZf4bXEApN
	YKXqPZqZVCMIK1GWb9tIjK3x8TtvnRNgKxkiWJDRuyRwF6kq5A5PFx0Q06F5cIpvyjBxk5jBCXL
	Pe5+wCknqyqCOn5Obtdi7+2sva6mbuULHC4BIF8NhDsW3KetXTibFIFe7KJE3JN1XniI4VMyMmX
	RAXuWMYvuTPNVJevigv5dXJ7Wpr+f5BGAMU+twxLg5unOvNjK7i9v6DVmuClGJRkO0UMjg+SQ5o
	j6qWsi6JmN6QLLWwQ9d7ml
X-Received: by 2002:a05:600d:d:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-488d67b8da2mr72755715e9.5.1775919485044;
        Sat, 11 Apr 2026 07:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:04 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:30 +0200
Subject: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PHZLLnMsIE8GpLnJkBykfRLhYRx2iFJYTw8nQWNaVlw=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosN3vB9XsUdlXc2ZPYKzqm//naZXdxa+++XzbJXa
 oeU3lqld5SyMIhxMMiKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAih/oZGW5XMcRf9OW+cjjh
 9ZHd1bfZlbzfXdE3V9py4Hvh/HgjNQ+Gf8a7rq+y/5TKs7glY+9Okz8lsbHWP8yrlIVy3/OXiE5
 iYAUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075807_369157_4B31BC3E 
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

Add schema for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo" modules which are used to
provide I2S audio input support to the Meson GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  | 49 +++++++++++++++++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eaf57603e1ecf5944ffdcf7a1b6146d1a0295696
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-decoder-i2s.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-decoder-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GX AUDIN I2S Input Decoder
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-decoder-i2s
+      - const: amlogic,meson-gx-audin-decoder-i2s
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-controller@a040 {
+      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+                   "amlogic,meson-gx-audin-decoder-i2s";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "AUDIN I2S Decoder";
+      reg = <0xa040 0x4>;
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4957c8711623ac45d2826ca96e6344d0aeac2735
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
@@ -0,0 +1,63 @@
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
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-gxbb-audin-fifo
+      - const: amlogic,meson-gx-audin-fifo
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  clock-names:
+    items:
+      - const: i2s_input_clk
+
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+
+    audio-controller@a080 {
+      compatible = "amlogic,meson-gxbb-audin-fifo",
+                   "amlogic,meson-gx-audin-fifo";
+      #sound-dai-cells = <0>;
+      sound-name-prefix = "FIFO0";
+      reg = <0xa080 0x1c>;
+      status = "disabled";
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+      clock-names = "i2s_input_clk";
+    };

-- 
2.39.5


