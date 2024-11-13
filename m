Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A08AD637B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyiKN4j8ScToVeD29C1kvH+uEOhOz+pcRKy9I30xNm8=; b=NzaWSZJS2AuGFbJhgP3Ul6YmaH
	Em+tOplAoU/a4e7AP8gzFfDmehyx4m3wa26v7pGj1zWjT1dD833obD0Wrn5d2LIQIHAFYibIZP9GF
	mYZlMVYwS2XPjHnXFtGaUx3REH0drUtFY2DY5h0RqIQC3EpW23M1c5JUr87b+iA4xAI1BAjYgrbk5
	MuI8JBcBChNlvezvUt/a+ykJbxANNara71ZCY8L7x03VESzemdOnooo1X65iXCwPTnY9tBD1yf40d
	EcydxDGDHpDbCHoVYD9Lnhhe7C/xjzPqZSl+KEAFoQaiR2g3NYh6LMLzgORrxlWh04rK0oBISSUE2
	0W7Q/vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJbc-00000007ucS-2rx9;
	Wed, 13 Nov 2024 20:04:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJQg-00000007sna-2Kx5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:53:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431ac30d379so63403595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527609; x=1732132409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyiKN4j8ScToVeD29C1kvH+uEOhOz+pcRKy9I30xNm8=;
        b=SIzfB9xEMhF6Nn8GRZtYrdto8GlhrsDT9kuYCU0RaryctoIM9aBTSuJkOJU3l2M8J8
         0SqAk0fbgX3tCwLwpAqZp19r064n2sHqE7+1iPHwWYUkl8Uw298bFXMPzHH2mzOzRptG
         fKzoDZDFeOOr99Pq9olIZxOBeHThKVLyXSfUhsfQslaQO9Y5tvLODFUhkkQE0NJN1N8p
         DVvYYd/QskSN+seIoS8ZHnExSJZONbtN9NmC4K6rcNjrv4lGLnTmvSR9BnPlx0dAKCkE
         kmZeFsAsquttfnCivd718vf67XY/smKN3IQjf5oZpG5y7SCwdf7zjkKV4U5AtjIAGvnR
         GSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527609; x=1732132409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyiKN4j8ScToVeD29C1kvH+uEOhOz+pcRKy9I30xNm8=;
        b=eWi4nAXtqlUQAxBqBiDylEJNKRTEeUi+i8uSNBYLfNAWaTn8wS/ixXqicYF1pJchIY
         spqr/xjj1gd1hbcWgzJWW9zxFqG1Sjd7apIOfeekadsTB/GlrgiHA7NOajihWDE2QCMV
         23jvQMnwVcYl9l303vUsCSFSmlTwTAVRnAxyBV+/hDCdbCbqhG4Yx6RJrrAZ6b1YWaRz
         vBCKI+vFjXZrc0ub3+UHKxIkN5JG5SyCPy+NzhLTOmsejPitGUw+/t7UXTMp93T0H+XX
         /WUoU8cNcuGle7gRWQPKSUo2CVlhIO2DpGTLHwEUP0eJhFLIWnf5ory7jNANYI1485fJ
         AF/g==
X-Gm-Message-State: AOJu0YwkPtOzkYL82HndZOv8vgCzmiRIc7nnECZtI454UnPnZ6/AyhTx
	sD8bPpxKiLAhinseK6MJYTP/NxcjzRHgqrBLOcsi13P/3bapCVGh
X-Google-Smtp-Source: AGHT+IH5pQOH+tdTlfkMOvIS+MQ4+qFU/bkE57iZL/f5drqJXEIAe1r5ZHxHvXGCYhMteIXIcTN3Ww==
X-Received: by 2002:a05:600c:5251:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-432b7515a08mr170581965e9.21.1731527608970;
        Wed, 13 Nov 2024 11:53:28 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:28 -0800 (PST)
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
Subject: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Date: Wed, 13 Nov 2024 14:52:40 -0500
Message-Id: <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_115330_633836_D83259F5 
X-CRM114-Status: GOOD (  14.00  )
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 42e6482a31cb..0a313133d013 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..3fa4c252e355
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,74 @@
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
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-wm8962 {
+		status = "disabled";
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


