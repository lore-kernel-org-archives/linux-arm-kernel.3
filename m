Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37227CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=; b=G9VPIriT9s5EdcM9k5TZzblPLS
	gCQ37gPNlTi5DOW8lTCnxaG4OQlJnBNdxcNMuVJqNEoF2X7WvX76MfLXg6alDMuuBJZGbBspiw7M6
	DUEGchCm3Z4tc8acvkEMSeSjgnEO6/qmzr+sN8NPyVYNk3Hb/lIbfazWQwCa3lg7w7Nl2PJWNBNfS
	u3kOPZwIjSKxw0y9DFURZEPLGR13ELz+9Ly3zaJglJr3JUlfrv79kN0G66WEP2eXEFUjPSKlfV4Ov
	zRAAcJxFGvQboaDc/NWvVejuGYGq6NRSe5BJjy+O1WpxvaSOFmV8l+b4zvtCW1izjp9sGpG4KtFKO
	begso6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fUP-0000000FQms-2jgu;
	Wed, 23 Oct 2024 17:49:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7a-0000000F7oW-0JX7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=; b=O+WwOCU/Tfu5Af5DQJ5+8dt+Lf
	XpjGyeqToeaXStTyRjjx9eILrO6jxYZAf/LiF8OeGzNcmsbLUcAUBEgPw/19Lo1E2AozCTcg49Dms
	qOUr9jhKEarabVj+F4J1h20WZu7GkQ/N+dtzDnP2YFK8qd4kIgdwQzM5UNL036EqngVkvFDyWutUA
	EzLl/JKgo8QeXWJqEDcLoFxOLTxWYlUfDoEj0cSiB2Aap7VNH0FsotQuAwBw04i6KUOv1aM++Eeg9
	I2o60rcPvWr9saRZKsrBIUBYmA5wX5G+TZDf75myDaHg+SOxB5wAjS4dSkX1zcKolNaGxx7nlgKUy
	LQSLDK4w==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7X-00000008R9f-04Vu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:22:04 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so8095682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700520; x=1730305320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=NcAeFxOyRwZXZ/UveHjfDBVVAvvnz1+lfJxOSBDJ5t69X23nZIxJNZZr4TkUG6GqNS
         F+B+YM5geyfrYKGTEA3f2osRNM+5lGHpErR+CKyJ4CiLDv6MU+1PWoEJJcqsbbvJA2c6
         xb2Ob3hIUj9dcZFYMBxCeneWRUgpk+Chs8rZzY/iC1+EUebxTPKZzeV4DnedKKoOViHe
         r2GEXCkBKHbtyNQf4CnXi5ZN6G9zppNAsf/i+c4E2uR8x7JHHMXVHaI64YqZOoULJq0e
         Noh9MFDvCXzct7C/JtPRpvjHJ4m8vWLBuWlm7v7/YcDvxsZbjuJ8fXQMvjCkBFUCkFg3
         4Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700520; x=1730305320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=EOfjgHJkAHPbx79eOCc8K7aGMqZbwMRPAH3Bgm9fjq+4RVTDIaOiHLdZWNKXjTolfu
         2gyEh4HBpzAya0HKBFkidGUlvMjFDGgHR/8BdcV5bRhwOXwWi0Isil6loEF5vH3QlcTV
         HddjYiZakEW1l9+D1XQTI4vou8ohQ+vw+lTHMnvhYwkXtFoJIAdDZoSD5dFw2eNKZcc4
         8zNKb5+vXq7kIowp7JwY2wD0HUdpEfmw1/besEoFuHAj4wL73JMLVtfpYQtDcjEIy6DP
         G2+U0cdbhXTuCGO7zWFk4jHLloAbBXJunKBmgOCISUc8sFtGh2wHcLxDAzb8pc8Kmn+r
         Fg/A==
X-Forwarded-Encrypted: i=1; AJvYcCXcdlV70obOw5BI+govu36vY4VsTqFMvUUCbEKCihuVxZrRAPKHyWDmYdfFLM8CMcIngpXrPJ39Ztr9k+NWZ1CO@lists.infradead.org
X-Gm-Message-State: AOJu0YxmFuy6zdZxpzAKo2GI2D7ibFMmBFbXSWi3s/agdwij9yA2ueML
	Y13Eb/kxbn6qgSCidakJAG0VUI1DgYqBclyl1GQDXUUPWqxRXPfE
X-Google-Smtp-Source: AGHT+IHyWANucfMDs/aKTkkC8XZgbLKNuPqA5aMjbx82Ju9yhv6/bGm9rJGwx/eAlr5ksCAKO44IYQ==
X-Received: by 2002:a05:6402:2344:b0:5c9:59e6:e908 with SMTP id 4fb4d7f45d1cf-5cb8ac5e8ebmr3350503a12.6.1729700520186;
        Wed, 23 Oct 2024 09:22:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx: add imx95 dts for sof
Date: Wed, 23 Oct 2024 12:21:14 -0400
Message-Id: <20241023162114.3354-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172203_222834_E4AF2B01 
X-CRM114-Status: GOOD (  14.67  )
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a69b7ec6d6d..94660e3e8b2b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..b10dc1af5ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,86 @@
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
+
+		links = <&cpu>;
+		label = "wm8962-audio";
+
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+
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
+
+		reg = <0x0 0x80000000 0x0 0x400000>,
+		      <0x0 0x86000000 0x0 0x3000>;
+		reg-names = "dram", "mailbox";
+
+		memory-region = <&adma_res>;
+
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		cpu: port {
+			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
+		};
+	};
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
+	status = "okay";
+
+	port {
+		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
+	};
+};
+
+&edma2 {
+	dma-channel-mask = <0x3fffffff>, <0xffffffff>;
+};
+
+&sai3 {
+	status = "disabled";
+};
-- 
2.34.1


