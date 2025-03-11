Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1A0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=; b=enJSuzMZI0Uzqqo76Vag5FSdsx
	BCIoFopzsL+SDH028LOU32Wvfy+4i7JnlMSFaysmJVJwJ6jDgCYknT+3ew+3fwqz1XcgRx3f9/QlI
	qyAbnV2QceVxhTTXDpBiz79uvT6uEpokgWkOYLF3Ye15Pp8UjkLWRkBO37Ei6R4McUFSSBWAdc+vK
	esAc+CSVHG5U4NULGp4+R+oucpx08wAx7ElXUNDtWzlCqTey3d18dPRM4FAFjJy6j5NcmBxTzuR8Z
	M5S5blva2BMwU6fx9CmmlrhbULFmUbwUpYOjrewU9/1ll+YbX3YlT5KGYn1AdQlDUGWb0MginYVQZ
	/X+v0qDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2f8-00000006M3e-0Lyj;
	Tue, 11 Mar 2025 16:41:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Yj-00000006LRL-3prI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:34:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so48937715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710864; x=1742315664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=LobU3f8icABCGpcX3owroWQYAT5pfsgatikd5ErKW0aN/CcXPS9WRcH6h8504iwmXZ
         ebqqZDUSnO9Lv/1PJ1XKgBI1tL3ciBh1wBftma917ILTjpRFpkWScs6FlNPiuwhg48SY
         W3cpyeUWXZtucRkeblV35bR7aQD2G/66mFGHdtb2dzyp51krvyykg4tmHZt/fy/7NoJs
         Na/yWXmXcpW+GbMcWG0+0VACUf6svqJj79Y/7jMpoKy7YRYHPpcCnBIcgp6f80gnYFbC
         xtSoG1mEtbNa1gGSnclPgBMPXYD9XlTp80e8yWyRGYJHWvZZ+z+160H1sd84FYgAF6tB
         AKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710864; x=1742315664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=AtIIiX550X+rCpSqboVp2I49Ak/WBAHwKDEe6o28eTuqK/fncSf7gtwiXqpdOAWOos
         7Apj9jZ/86ETt9lab6zVKjFse+Um+s7mr6JbUx/e8XeozhkqL6NU19KTwgQLayY2fvaU
         Dfl5a1uqgAQdErkrO5t6RiKa6rpK43WcVaZu2TRqfhEY3KBH4vFGJ/Tl7M5wC32JX0ub
         IdouhLgS7of+xNjUW2WbvxaxF0Q0avTMYjkJfLFqxfpecK7xPvLjfU9jThGrVigjQ1G/
         jIsLVBaMiTAya23pjO7tEHg/HlbHTusz26sU+jBIaGNxCcKqj1AO9/NWafce5FzvrFqq
         Ymzw==
X-Forwarded-Encrypted: i=1; AJvYcCUWDZW+uMu8yEGsHWf1EMd95TzuzrLJ7XmTrywKNjU/XbM45AGmzdguGGafElCQDP17JhbHKvuxsYE8BkrkRxBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzxcdfHa4boGatDy+7RgOYbCN7v1PtAuwQF1/XN2ep0z+pnOIeR
	DjOGZGHSlf6EUKwR4ZHg8IbbFOeuYVT3knPzWaPFy3u3uPgWxu1c
X-Gm-Gg: ASbGncuqLWwhk7j9LoJDR7P0wK1LOo1nU4eqNfXEGm6b+aeU0ESQaXRYEFmQVITRI0f
	P3NZdrXlbGtVLyB0r4WipMDFEARWEJJ05uKH6s6DSLtl52/K18Ouz8qs0OEYmdrHxsgn5LKhzo5
	Rc2GMQwg/ePHLryl2ofeAnZmhsVHyBVIRE8dR1V/gGz17x24Eafi6LSrWgQMd9UcaJMVmu+BF8h
	Z9CrZ0UwQkbF1H+lH5viK5Dayw1tKI8isnHZNDWUM8AX8El8QmGb6u97v+aNDgGfsw+gCwG+bg0
	+S7MTEQAQc8iSnYEwGJsCQIGlbgvq2qgWqdaCn+LJjyZbxvcr8SJ4IDaPmVlZQlQE2zSlXSVDM2
	Ia929Atg=
X-Google-Smtp-Source: AGHT+IFEWyfiuJdnyqtyoZYKg9bklwY80ObfuMi86YATpJPQGXZVWeSfXdJIo6hDrYC4S2OTrqZGsg==
X-Received: by 2002:a05:600c:198e:b0:43b:ce08:c382 with SMTP id 5b1f17b1804b1-43d01be6dfbmr66002135e9.16.1741710864569;
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Date: Tue, 11 Mar 2025 12:32:55 -0400
Message-Id: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_093425_956356_2E56F826 
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be6ef4c56fbf..fa19250b6676 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -299,6 +299,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..808a9fe3ebb2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,84 @@
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
+		sai3_cpu: port {
+			sai3_cpu_ep: endpoint {
+				remote-endpoint = <&wm8962_ep>;
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
+	sof-sound {
+		compatible = "audio-graph-card2";
+		links = <&sai3_cpu>;
+		label = "audio";
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+		widgets = "Headphone", "Headphones",
+			  "Microphone", "Headset Mic";
+		routing = "Headphones", "HPOUTL",
+			  "Headphones", "HPOUTR",
+			  "Headset Mic", "MICBIAS",
+			  "IN3R", "Headset Mic",
+			  "IN1R", "Headset Mic";
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+};
+
+&edma2 {
+	/* channels 30 and 31 reserved for FW usage */
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
+		wm8962_ep: endpoint {
+			bitclock-master;
+			frame-master;
+			remote-endpoint = <&sai3_cpu_ep>;
+		};
+	};
+};
-- 
2.34.1


