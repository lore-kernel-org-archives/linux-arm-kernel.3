Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D85C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=; b=bacuHoWXwxkxLxt266bTgGdeal
	rmk/yBCmf7fijnsYslDWLHcDu5XpC+3mF8OTGoSA+IXL5jkNbtVuWrwXppBE54gazjBIiwqB9lmFh
	bnyOHb4eC5GS8jgUwpgs01kNzX7MwpEuCSa8fINL/lGcsXrjtUQs1hocsEObgFVXnwcEy3Ji6iyy/
	qnQAPZLgxzkrrI4zOZLDHL2BT57IsMBZBEg1lb2AdZOlLjRg4uL25yeqTVm0J8EtuJbO3nPPFNK1s
	hnb+TKwj1GyviHlByyKYdeNaqZZGHi54cCf83BFQJF+mhs9QimW9PZUMYUfOfaTH26fTDJUhiXt/w
	8IfcJ3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdJ5-0000000Ccr4-12wQ;
	Thu, 12 Jun 2025 08:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgr-0000000CVVq-2iVB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 07:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=; b=S8UYGOlLf5ANISsMTiZfYD1UwX
	rMFjqx+Vuv3x9tKsvGBJkZiboPtAKmaofXTvQibzGwFqx3C78IIrkyZ14ITjcgNQlzbGNkicEvDe5
	DQEnV9so8LQ8UrTOw7trNISMg5HR9qlP+YAP45U/0zJNjUuXjv/zVD2miMMA0yY3wki0vnXZ7YEer
	xRhcM2sJHzFFEL4Nt5bOaPzElXyKnqeLg1z5yib+Ro5e0tqVdvZmPPbHBikOsauA29kXl0sfh26Ib
	c0xDIGX6h05/+b7aSb13zPFxLq0K54IUqRjqNoNLZeKWIhLG8dW7y1KNvHPZCPVi1t5IVayB0Y/Ms
	zhNEJzBw==;
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgo-00000002aHL-0R5b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:36 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-40a4bf1ebb7so374115b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714570; x=1750319370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=AElMbC565iqYME6vPU+CChrAQ+g0O/MVuFx4/g5ZDkWJ4sVGabtULpb0T5fKakpxBN
         31qsDgTCOi/eV7FfA8rnufSK+Q2aiqvaNnNhokk5p7vC5qUPV/cGxggzCh7H1X/bdlZU
         DZd5ukAoTl73tlAbSzmVDSZxleA0750M54iQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714570; x=1750319370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dZevLz3MchUHKLeflzToo/+N7rtScyOYND88JFbOUY=;
        b=gLwDdncUGleaEqYqh2EHcwtXi7BKQrP7Fi4NWzRwrPbHn3JrOyfoW7Dhti2XKZMiEB
         A7SWE39qZ+f+99XUUAmtb4ca2DPjOStPbOwSvFbi9fZy0PDOC4BVGPRk67F4xxMFtC5+
         +e3Vad36BzqKWS1t7ZZcRCgnxrJ2HEPfU4Qvq8Q2/Hc2kNCjgIw+CoQ6zTZX/uPvWIi4
         6h2RpRcQF+nfcJZPcMFDIavq1t40iNaUQAsd+fHNlmcbdHtrPK3/6frzsMffJDKVXh0h
         fLQOwGFUUqocpOTvTgh3H7gxjqrmcGh1vtDS9ebXMlWMfhEaqWlLYDiFLBVN9RnWhP1C
         LTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkzCfihc5nfoUlGQhF07ZOx0Pi7IMKP/w0u6HZ9vtsS8RnyhUbUsKuHpTlwnzY9Pe/EbjVkb/fMgaTQDkKj253@lists.infradead.org
X-Gm-Message-State: AOJu0YxGY2FM5i185cRJwtFEiEEAUhcm3K1XcmVGWGrGpAiytsjINEpr
	Rs7MSUetgmOj5WKLG8TmKeMx9emRC0pTIE+dNdhkMDQTfzgbvmxosSU1bufHaCCCXtUyO9cZP9C
	V5LY=
X-Gm-Gg: ASbGncsYUht8m3MpRjb5xuTQ00b2EIFSAHgzBdjAJ75t+7dPdwV4B/byYtR0W0MoNW9
	ThdVZjDK9Nxyg9GsGcxNTxDZNgZox9Lgu49xDZ1EbX5J8lxK/eBjskqbeHKlEmPDKblc6jMtqWb
	p9DCGxYbPM91wSyD2BMFkDsG2xsNn49P1PWCb2KMmVCPfrpDJ4bODnNTbJ9REu7UvMGZYARfGu3
	Dt9B9F9uopQ027C+1h1er0jVsyst9TouCyS/QakszmHm3ZnXbFsnqKTn7VwaYqugIEEmLrSR+4t
	vgzCx39BirhZAIzaGY4FgoKsmmMQSV3dDufpLmvSonC1NS3otrSzRke5a5rH+htCOldZLts/94r
	cO7o=
X-Google-Smtp-Source: AGHT+IHec1zUXIa5nP38bZlEL08BVN/XVUdoN70CGx527A+qcXzcKljkY/6lP9dS1yxTSifW5ZVikg==
X-Received: by 2002:a17:902:ccc8:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-2364d676a85mr32691565ad.23.1749714557205;
        Thu, 12 Jun 2025 00:49:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
Date: Thu, 12 Jun 2025 15:48:52 +0800
Message-ID: <20250612074901.4023253-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084934_384342_67802A03 
X-CRM114-Status: GOOD (  16.11  )
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

Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
in YAML. "clocks" is added to the list of required properties to match
"clock-names". And the example was slightly fixed up in style. Otherwise
everything is as before.

A contributer and maintainer for a recently added MediaTek audio binding
was chosen instead of the original submitter.

Cc: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------
 2 files changed, 87 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
new file mode 100644
index 000000000000..a95215ba6361
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for MT8173
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: audio infra sys clock
+      - description: audio top mux
+      - description: audio intbus mux
+      - description: apll1 clock
+      - description: apll2 clock
+      - description: i2s0 mclk mux
+      - description: i2s1 mclk mux
+      - description: i2s2 mclk mux
+      - description: i2s3 mclk mux
+      - description: i2s3 bclk mux
+
+  clock-names:
+    items:
+      - const: infra_sys_audio_clk
+      - const: top_pdn_audio
+      - const: top_pdn_aud_intbus
+      - const: bck0
+      - const: bck1
+      - const: i2s0_m
+      - const: i2s1_m
+      - const: i2s2_m
+      - const: i2s3_m
+      - const: i2s3_b
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mt8173-afe-pcm@11220000 {
+        compatible = "mediatek,mt8173-afe-pcm";
+        reg = <0x11220000 0x1000>;
+        interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        clocks = <&infracfg CLK_INFRA_AUDIO>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_APLL1_DIV0>,
+                 <&topckgen CLK_TOP_APLL2_DIV0>,
+                 <&topckgen CLK_TOP_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_I2S1_M_SEL>,
+                 <&topckgen CLK_TOP_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_M_SEL>,
+                 <&topckgen CLK_TOP_I2S3_B_SEL>;
+         clock-names = "infra_sys_audio_clk",
+                       "top_pdn_audio",
+                       "top_pdn_aud_intbus",
+                       "bck0",
+                       "bck1",
+                       "i2s0_m",
+                       "i2s1_m",
+                       "i2s2_m",
+                       "i2s3_m",
+                       "i2s3_b";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
deleted file mode 100644
index e302c7f43b95..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Mediatek AFE PCM controller
-
-Required properties:
-- compatible = "mediatek,mt8173-afe-pcm";
-- reg: register location and size
-- interrupts: Should contain AFE interrupt
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"top_pdn_audio",
-		"top_pdn_aud_intbus",
-		"bck0",
-		"bck1",
-		"i2s0_m",
-		"i2s1_m",
-		"i2s2_m",
-		"i2s3_m",
-		"i2s3_b";
-
-Example:
-
-	afe: mt8173-afe-pcm@11220000  {
-		compatible = "mediatek,mt8173-afe-pcm";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&infracfg INFRA_AUDIO>,
-			<&topckgen TOP_AUDIO_SEL>,
-			<&topckgen TOP_AUD_INTBUS_SEL>,
-			<&topckgen TOP_APLL1_DIV0>,
-			<&topckgen TOP_APLL2_DIV0>,
-			<&topckgen TOP_I2S0_M_CK_SEL>,
-			<&topckgen TOP_I2S1_M_CK_SEL>,
-			<&topckgen TOP_I2S2_M_CK_SEL>,
-			<&topckgen TOP_I2S3_M_CK_SEL>,
-			<&topckgen TOP_I2S3_B_CK_SEL>;
-		clock-names = "infra_sys_audio_clk",
-				"top_pdn_audio",
-				"top_pdn_aud_intbus",
-				"bck0",
-				"bck1",
-				"i2s0_m",
-				"i2s1_m",
-				"i2s2_m",
-				"i2s3_m",
-				"i2s3_b";
-	};
-- 
2.50.0.rc1.591.g9c95f17f64-goog


