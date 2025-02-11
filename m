Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE94C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 23:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qEcHnFbnJv5rEQMaO2HHhljugT3IlHPIHIMW9SmVWI=; b=J7wfIIHfcztI0Rs7KXxoa6+B1n
	iIz5VLEVMZ1mF70wKan5TOzw3o7dRfJyuUZGDk+aC53NAC6Nrtt/iTuCcdNGS3chjXh2dbtkXK1RB
	2Rsw3Trahpx2FU2YyZBfACDw5Eh+vroBiJ36dpiDBP3kIR84aImBNEwpSUpSPHQO/COyYme/PWJzk
	D2/VQZhkcJwiDtyjWIGhrO5c3lLbdRqjwUv7Drv4NSWjd1X1qoEVP2xgcNbMVz9rJgO5PhTmPDUsF
	cnR7k2ZrbGbI64AvtsZEF/+eTnuLNR4vTyM4NlXihqQTT1isHB+riIhW0CKSuEemZxvL+Aq1cLbVq
	rMbCu8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thzIm-00000005XeC-0sPH;
	Tue, 11 Feb 2025 23:04:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thzDQ-00000005Wv2-39tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:58:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7e80c4b55so195462266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314731; x=1739919531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qEcHnFbnJv5rEQMaO2HHhljugT3IlHPIHIMW9SmVWI=;
        b=FpJ2y66jzrFFn8va+/ALn7I3L7vf/NshRg2AGYUYEMOL3+VO3he7YM5fdV5TqaVblL
         iPzHcnNSPqOaxexWOgKxKcz0hO7cR+JpjX3LZYJtHu5L7Q808RYZ0zDWWnc/nOXx+hbJ
         cO4HUd4FDcIxrxVydOQoigXE3GnsudX2oOvW2IX9jgGDFLXPOPEIOPnSVTFRphdO5jaE
         bHAHHJU0IUJX8qXbz62utmFaUi7LWk09NJMqID84DmgJzgSf7cGcphXfL0pBr3Mz58OK
         0LlqxqV6NNNpDOUSVZpRICpPT4droY0hWBTz5PC+J9zHGrW2J15t4tn9o8z2V8EY3wHg
         9n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314731; x=1739919531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qEcHnFbnJv5rEQMaO2HHhljugT3IlHPIHIMW9SmVWI=;
        b=TtrSj9SUBGxPmf9VZGvBe6gbrjIbArxOFTVa5DNiD48wERzN01nq4fuyErwm2Lxa/E
         BWpLu6ctoE2876Ygh7wTIgdvk9hUBNG/wbK8EqH17HYa4ujbMqIEGT5oD3OGQp5IrCy7
         R/Im7ouXQW9y/v/YUalXaO9D6QotF646abWpFyoosiw0nnmhBHm9y9rTEUiigarYSfeo
         5mQsmGF+Xjk8T7RHMjMb5CgWRQap4RcuvbWloCxu/fO50uH1aE7VkOs2u5bcJasjfVxx
         C3OwCAxiuabOyhPSaOQv41CThCuZOZDXmiapo8NaGoK8xJ/VuV/6cYOo3QNc9H1P9O4x
         324A==
X-Forwarded-Encrypted: i=1; AJvYcCUWJUUsnXfpn8COBFX7yG0OIa405aVhTPzJ121SHODjToPhRgtpZIfkKMaUzjMA/Mmn4CQJZwKRI0JlZs9n+Y0x@lists.infradead.org
X-Gm-Message-State: AOJu0YxvB11SHImHoEXQz0W8iIqmDVzKU315CKP1TZg1wbwJMmqeuBVu
	5hQ7ygCnj8sve+JUvP4CtnYKCI+SPEuZmDb2G+NNVRR6C4WyEJ3/TF+vUg7n
X-Gm-Gg: ASbGncsyWC98jlD8Ka40IczrAGQMZCcgUBkRTUoZXHafJw/k94/8A7/BbLxgHF5M4pK
	62rArf53QmfEKQUSk4J0b/k3KsfaZls1yq/kWfpMGHeFQH3mnuBjaoFfmRJbGeOXqAtab7OR/Oa
	ubYiajZjCCsnWYmKJCoc2yBKXuKdneFY300i+B3Jd9k9gXhtSs0apXuFdRNE8arO9Nsu+wAg4jh
	JDqeeuNvgDGYJM2TH3XP4cETPdVqibLEsNehT9Uv4EUm4YMe4bmZeDOfwr0AL6WjivPQQ8RGoC8
	lcT4+cGgjWM8yEtx3DJCoyF3UitKmSe9OtkPerHv+pGPjkqn1tZz9Q==
X-Google-Smtp-Source: AGHT+IHyuiaJRoN+GdUxbeu3lRwZ7O6QbyCCZjzjPJTrp3NnmoIIq3WEcO3F8K15XX7Gr6EziTEjNw==
X-Received: by 2002:a17:907:3f21:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-ab7f347c15dmr55101866b.37.1739314731047;
        Tue, 11 Feb 2025 14:58:51 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:50 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Date: Tue, 11 Feb 2025 17:58:08 -0500
Message-Id: <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_145852_794898_BC3E12F5 
X-CRM114-Status: GOOD (  14.69  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7..27f64e333e4b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..ce7b2384e459
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95-19x19-evk.dts"
+
+/ {
+	sof_cpu: cm7-cpu@80000000 {
+		compatible = "fsl,imx95-cm7-sof";
+		reg = <0x0 0x80000000 0x0 0x6100000>;
+		reg-names = "sram";
+		memory-region = <&adma_res>;
+		memory-region-names = "dma";
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		cpu: port {
+			cpu_ep: endpoint {
+				remote-endpoint = <&codec_ep>;
+			};
+		};
+	};
+
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sof-sound-wm8962 {
+		compatible = "audio-graph-card2";
+		links = <&cpu>;
+		label = "wm8962-audio";
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Headset Mic";
+		routing =
+			"Headphones", "HPOUTL",
+			"Headphones", "HPOUTR",
+			"Headset Mic", "MICBIAS",
+			"IN3R", "Headset Mic",
+			"IN1R", "Headset Mic";
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+};
+
+&edma2 {
+	dma-channel-mask = <0xc0000000>, <0x0>;
+};
+
+&sai3 {
+	status = "disabled";
+};
+
+&wm8962 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>;
+
+	port {
+		codec_ep: endpoint {
+			bitclock-master;
+			frame-master;
+			remote-endpoint = <&cpu_ep>;
+		};
+	};
+};
-- 
2.34.1


