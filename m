Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F13D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhLdh2zZK+bYAbQvWFFaUIm6SUaBfCue1vhMyALyCxw=; b=BGowOzzQrnHSd2vR2KGMyhgPmm
	ANHW3/u/QnMUJyIFPw+f3B1uRUHXOLuhPYCVM6PPP14+Op3ujSVJmpuuOkajuHQJolg+lgT52ymIj
	g4OIMgtGzPsSNjXZNHS3c2g/h1hs0872lyqJmD93eR2Cm1/y76aAyRjFNEa1Z70BN2AsNh7x4Urct
	Yz2sgFE23nzLSbK683AqSQWko2KyU9iFFjI9JjzND/XdKSEaE4llJ9jNbIbA+AZIbWpPcrU2munRo
	McUMjRjK+Wq1ornvBDP/8pgasy98CHpCZ83eAZx6f0+X48bwDkqJDlAHxz/xr1zG0tlOQVTijUgvv
	N/Xz8Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHp-0000000430g-1S2K;
	Tue, 20 Jan 2026 15:04:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHk-000000042xw-363i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:04:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b86f69bbe60so855419166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921487; x=1769526287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhLdh2zZK+bYAbQvWFFaUIm6SUaBfCue1vhMyALyCxw=;
        b=fcKi3A0dAqrzcoSwLA1TOKbp/Tk6zp5zEgNmm6DnedkZYf7u/dvC88NmDR/vi45gYK
         0fZf+LTsCqsfTcRKKEYypmssQk9xF1JlRXW6wbnUdunRWua1IVveBOaN0LD20mdWzA68
         QtLjSfJpjqp4iqqDJYlyaghJfNeT3k553Ep0lM8PIza6DozW7uv/tXmVlJlbMHC5+sNG
         NdbIoGzVzookXVvwTpHpFZyHhH+ZtAQVf0fp/dfewo2buXyJuGZ3QwQ0MiNulCfrzemI
         WcgWt4SkLFmiLe9c9QjGVF4MKVspJIrgeMUBUr1iqBg0PAuC+NxI46v1jU+oM0YSZ9zF
         YeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921487; x=1769526287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhLdh2zZK+bYAbQvWFFaUIm6SUaBfCue1vhMyALyCxw=;
        b=WQkhBS6BGEjle05UFLBrLVTRc0G8ufHjl8/NSNJsM4c415r0MVg6lO4j5h+awAvac9
         0P07W79nLipiy9RuCuQ+MzNsQaKTSNNGbsVo+wMZBWFGZCUjE2YyziFmYRYADBlG8OJQ
         0BTg0aBEqpwiJ4QjoUI0yU9OcIQ9yvLRULACSm0mr092lLEWC/67fCwn2UmQGMxaEXxE
         0YJBPYxUylc0WklE4sS95uK14zF6DqOEn7g7kEyUa5nEXDuSaaiU7tCNyIxUF89b4SQb
         fRC7WUk1LyLb5d2NSOcdGPJBz633KlLKJ5k7qHCNzL16kiba785NWXzVlY89s+WTl2r/
         0vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX51hpK4LmXK52Ecb0iThG4Zb30BhFNBiyDE0Ak1/AGm24HPUaW+KYsdz8yXRzMwwFvJz+vidoTTzVBNn3BM+Xs@lists.infradead.org
X-Gm-Message-State: AOJu0YzMLeB/4g+hu3Wfac76m7aCr/Y/LdPkGkeMGnaVdkg0cVM30HLZ
	wRucd8F9TXj8fFEQRXlVJsnsYH5wyyVOjZ/AIqePPqjfXzawBUFxzrQE
X-Gm-Gg: AZuq6aIRlneuNpfWcINNumYc7eOUqxCPv9x6F7pdFviL4ROsG3IjsOFGdHiw5+tlOBt
	YVUn8Wo2kWAuZPMPO+7T5JrjzmK1ZExfHyU1tv7Y2qudmT3+CVArpHTBU24JwKHGKrqQqpWF4GB
	HjIMssoZpj1WYQGchCJ/bf+rhEOm39jO5Ra2zAvBazDQslWl1bcxfNe3fmD+5aKXYMz9nnbTXHB
	zFs7kZadphhXHTcuRpN2P3fl8s1WYLuCuxzVmfPSPh/akfEh4gbohsnTks2Fd1NKuAEZ7sMN5sH
	TARnuTEpEFLTG6s990kmGGCdzUJp1e/DR+IE5X0YA+iD3cM8zO/UiSbTFBphcXlpDZ9FSqiD/HJ
	hkjWP1QGllMWEZxKRdlUj7nLTOTqvGkvKjeJsC49J+0aepV+k8349dXrdkZOmNU1rXUAQ2FqKzR
	iTvUrWV6UUmMWB8ZDPypd0bPKVFFvb2IK6xQhJ
X-Received: by 2002:a17:907:97c8:b0:b87:40fd:c913 with SMTP id a640c23a62f3a-b87968b6b22mr1267788266b.2.1768921486189;
        Tue, 20 Jan 2026 07:04:46 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:45 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Tue, 20 Jan 2026 07:03:29 -0800
Message-ID: <20260120150329.1486-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_070448_805575_401C251E 
X-CRM114-Status: GOOD (  12.38  )
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

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..53aae25db7e4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -243,6 +243,12 @@ codec {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
@@ -473,6 +479,21 @@ &mu7 {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX95_CLK_SAI1>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		mqs1_ep: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_port1_ep>;
+		};
+	};
+};
+
 &netc_blk_ctrl {
 	status = "okay";
 };
@@ -534,6 +555,51 @@ &pcie0 {
 	status = "okay";
 };
 
+&sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+
+			sai1_port1_ep: endpoint {
+				dai-format = "left_j";
+				system-clock-direction-out;
+				bitclock-master;
+				frame-master;
+				remote-endpoint = <&mqs1_ep>;
+			};
+		};
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
@@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT               0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT              0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..0c55861d673c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs-1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-- 
2.43.0


