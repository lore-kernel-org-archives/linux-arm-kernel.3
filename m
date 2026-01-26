Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF2D13C2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=; b=Lp8GkKAS2MWejCPtGUpsTXJeF5
	pALtJedUepLqKyLTIfREXVrfSpzzsMEzADm3L2cPVFgPWKIXTPTeLrS3pn5YCu2q0utWFrMNXCJBk
	QZKhl/GkEus33u8CPuIEJ9RUKuIJjb7uV+Utuoy2mirySX5wQqtZES4GwbHMt2PMrPFul06WG1tVZ
	/NCUyE9LKb/iZgwPnffGHjZNHH/b3KTqkxj7hFIlOeoXnXi1DqlRvw7lPAki7v9cTHLroEtK2WBh2
	MSD9x0+kCp/NKs88EFlfAJIy81d/v8CgvDsh4812MdLELexGRbhdwby1x7Ip/qHOZp1j1wMAkMIxZ
	EbRqKaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO18-0000000CjLZ-1p6C;
	Mon, 26 Jan 2026 14:56:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO16-0000000CjJv-04Rz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:56:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48049955f7fso39371485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439394; x=1770044194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=aSlbnuAvB1hclcNP3cCoaYq9X9/lTji/rZymmkV/foMO0IqvxFYgZ16brQY0H74zJr
         OwxVCnQnttiQJAUooVAbJw81GTFHOmtf7jgp7lEudwvculkfN5dvbAhqaxXQaG8dGDrM
         d/IxAtQi30WM8XYIIMcsvblOzSFvdcCONAKj5VPACJ4grIjTdBs/2Shu1lb/G/TcP+mE
         qF76287cMlNt4Mt9bwt27+6zFE0/ygMspS0Au9jhtHge1d+ZXmEFNbNcLfMJPWx5l2+a
         Vr74p/XC0KrXCUVwgwQDtSphpBrXOcccSbrZw63lagqlznefqtsXMtzcJ1ab+RXESZSK
         qVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439394; x=1770044194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=dbo1aBRNrFQ75ljpZDzIdUHa7CM54+4wFU9yB/nzaX87GJcXmmQd3bOePbLQqMT1Jf
         0g0GgXMzOaDO69qiQfD0Flu/PwfzjNGdhdCPEBcJrc6TfHzPVytXjVGc98vEUu6E8hRH
         vLizoqnYMD0XuLNoZ21F758SFXVOHQ9kis7wpjj6R+g0LLfp1vFwcL18cOw+Zo5P133x
         UCrDAKkz/X3mQ8kXNt5SQoliU59LtzFOZgF39rpY0luZy3Su54ugxA9cv0QZe1rzdwre
         nlG8Luh/Ko2hk2wFl6I9dHPvQmEkKB5hPyfOAjVmKsn/yQ9v8n4D24H+k5C91WQYFhxk
         vBag==
X-Forwarded-Encrypted: i=1; AJvYcCUjva2n1UNIeO2RUKwDRDUn18w2OMfXI2P8moWk6z+u9dAhWxFO70J4gNIH9//lUkuNOgfbKYMvBkjYEOyiBmtA@lists.infradead.org
X-Gm-Message-State: AOJu0YxdawskLlvtx0I6HnO4Jki/82uWdShptPDcmOdtJw9l7iSO8N/A
	nN4G9RIpk97iRY0ah4N3YbmgnNoKw2i3bUYh3BOIOdobBgIuKxXJ/irw
X-Gm-Gg: AZuq6aJxiXWFLOYJgzKyBP2Z9CVc4f/ofxyLu1c9xUuxUFrFHVkNUpsYb3QXQJA+Xfx
	48Sn6u9TSrhzLA6q3ibPa5wh2ejGQkLNzlr6DS2dGxIAb9dTqqI7bn7/3b85D4JX6U+UrDmvmFT
	r1/PnBXPS3kUp7nwbrWRd+0vPNTWb9m9+R2FwaGOu04k1aq1JbTZ926JrWMX3jBecLDp7GRMVSk
	FL6mvjvJIxmqNgYMedA6790byAv89M1N6/y4/NepD+HJx1enWr50GLKj07M2RcoRYouK3fsRKDk
	Lou74238x1H/0iRYpUwfhSKr6PNgiuzD2haUqsdnzhNfD9XNCLcLztj5onAyXrIdiNadFperotc
	8crbDx3Na/PagHAi9KRZagI/QdnwTkWxZOQOyIUpMru/D5eVJACAnClUP8i8EhEbHqWWdinAehr
	QlojTuEWTwbDOsgXKdPMZtebbABL3kDSgPDkVucw==
X-Received: by 2002:a05:600c:5494:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-4805d064297mr74645505e9.32.1769439393871;
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
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
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Mon, 26 Jan 2026 06:55:37 -0800
Message-ID: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065636_091067_FC033965 
X-CRM114-Status: GOOD (  12.13  )
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
index ca1c4966c867..0f43e3be7058 100644
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
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
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


