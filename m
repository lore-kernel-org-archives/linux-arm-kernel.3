Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD330E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=; b=Jz2BwIZ1eH4u/JuHB9KqT1YLDy
	oiXqIZ9VMLNapFPMQqtfgUJu2OjkFvI5LXI+P/+ZunNtNaRdWx4uLQW/oHy95SToC150iLe/S0Fn/
	YtjiKiGcK1t9NZ7BlAwnHkdeue0Ev1lKmDv8GMESO13LnqTIs29SXmtIuY5yz/cUYbAwQUQRzbHB4
	pTewElX1H8w0ZkLFDFn6+gSX6Ocj7wJ8aK7BD2RjGriePMdqIfzxZnPaDsk5nY4t0X4d7wjpXeBSm
	TuCFAcE+j1+X8QfwUQO2isrs/Hh6+sVmi62/JXO+gPKfTx4slgC77wjkZR5Wq8BBMGjyyZd7nVGV7
	p+g1Bemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCXg-0000000AKKE-2GdQ;
	Mon, 16 Dec 2024 14:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRV-0000000AJ96-38m8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 14:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=; b=jrpQTJ6p/63PumhdfsFGgkPWrl
	xkowa9F42bJgzac6adrm1k635qASeRzWOpNUD4PdbunKKfupBXz73NTEOzbXFQVHQeJHyOEtc8aRO
	X5NRt3U6ybw3vifcj/dlFyLJ6Xy3fyA7T6m52vgiAt6PBm32UjHHQSjz3OGZ5DeYhqZ6xL38or69y
	3AqrZ4B1RtNecHhmWAmMmOlven165bCCPiLVZsiwKb9gHnSxN7q0rTm7pCprJ9Y1nXxAJ4zp+cW/C
	h90cor+vrvOaFpDONcrLFKtmM1K5Xk+0weNdMvpg0IC44wa5ov+7JSIYsH+W967LDv1QK5igccv0k
	p/53L6iw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRS-00000004sGs-47am
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:51:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43618283dedso41219205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360684; x=1734965484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=;
        b=WoJ05Mpxtp5XFoRj4gPZREhc2PLf6JU71ynlrgGm4q2KLdl7hvDfYozcaip4a1tijS
         VHzmqNpTNvO+/T7NDMEv0pD0uF1Nwnw8WTMBVVfTOIlOMDNGEU2Ad0DRcnyyoSYc8GX7
         CQX4+KFIcNanAIzls1wFF6Hw3e4uR+9zBC2Fqubo9pXsbiQyOCx9uC1IiqSIjFSCHCTT
         8uWVG4yyFF75KDN4Hr79Iuug+tJOREnIx1iMFHhFgEqnxr/IlsEYtXLAVHvi6g3dPYFa
         5N/7L/63dOkhGyNsD8Hg0lUBg6fFQWIjGvPRPeXgRNggVkFuUWOqgQQ8Bl7DhXPrUdRc
         by+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360684; x=1734965484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=;
        b=tHi4W72aThsyECtuGeN0rr1Eoq7qXPY3DgyPTMyCoM/eDkmSgoxnrBpKvuYUm8Ht8y
         YKOSSqJy2SXTiC9YwgqmXnZD1mngbORQLqmJhNNK/POZlRbIhfNPXXVFoPA7oFkXyQn4
         cgxXKBRDXcq48O59KsZ+qS+QWxSUrbQxGQvPBk/zo9jnQnCaGF76BI1N/XaIbUJkDDbw
         TIS3bV+GadTvJ+NA9fRko1Bi8LAu7aXpzSpQ8sA53m96IFljORfEVj0mlkE4x2vho46C
         tZiOkIeOYAEIkj2gTFYg2BVuvScQaeJzjD27ENuPHw6FkqC8Pc99FZv+kIGJbMGTZz30
         s95A==
X-Gm-Message-State: AOJu0YzykFGNmAeBrJlthkrnj38v6WdI16mAsoiW9DmyyQI9nnlqnWIR
	zbJ7vxgo3jm8InwdfZZvOJqJcYqR7XXTTldtmH//a7SyvZf2iBMR
X-Gm-Gg: ASbGncteciPb/A4ZznVob3JftZqnI6gbw5pe3nXBQ0DeRFEbe4L49oVlMt9v0+VbDKh
	97mTqWlCk5WLTq3mE6eXBa4dqy125nwBnX2fRqqUD3KBm3f/GshI+PaT0n0bdGyUwyDOGqCMDEG
	V+lcbGfGXEDKXLyZmosg88SidDMAw3l2mDBqYiuzSf7UtwvNszZ3kveCcYmPAUO2RcmPunxUYTE
	OrugGAYNadaK/LUmioGjgNf3fHvQn7/kIgOx73A1s4ibMTrGDbiDw8y2mN/L9Wuepw4l3rXlr1u
	9vOb/a3JmhZevDC7
X-Google-Smtp-Source: AGHT+IF6mGQ66zqt23wxmdgyvCpFmx39WbIi+8c7emJk9Jb285zsFEtWpp62qxObMAzNXGOH9H4hJg==
X-Received: by 2002:a05:600c:a011:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4362aa3a029mr127042805e9.9.1734360684343;
        Mon, 16 Dec 2024 06:51:24 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:23 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: imx: add imx95 dts for sof
Date: Mon, 16 Dec 2024 09:50:39 -0500
Message-Id: <20241216145039.3074-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_145127_178729_20523F25 
X-CRM114-Status: GOOD (  13.51  )
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
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
index 000000000000..8eef83d7bdd7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
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
+		memory-region = <&adma_res>;
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+		cpu: port {
+			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
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
+	port {
+		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
+	};
+};
-- 
2.34.1


