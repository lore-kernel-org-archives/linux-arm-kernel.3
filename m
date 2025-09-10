Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15854CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1alLi5TCWrgqVg4gWAi4guSOwfn7tcAcmAIIueAQAFg=; b=T3AtCVchve+Atjcl8xIQK2sPEb
	jqlYjsupmbw6nRoNNd3M4rvb4xKJbAinz3IXUD/VwAU+Us20GyuBbLUkIPXTdysg5Yd4aAXvEXaEu
	crPpYlGWFFkdkzewTSchfikrQSXOz8gGnqds5ZZ9OXO9axxon6oe23NpEerRHUolAY4LWzcaamX1e
	oqV4tygZP85ce1QaHsS3XG945J4gKP1BZedIguLrhJdhVHwwQ7bxWqRWl0kLKgEyr2f+2a2dzlsgu
	QOOmLZNfnwbh/AgHF9ryX9VvHyUXWMaAOwzrAqwp1yO7n7RR7h44pYlKp2nSXuHTci3JgwzUKUrZg
	B1uYrGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrs-0000000Cn3j-05fJ;
	Wed, 10 Sep 2025 08:07:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFro-0000000Cn1y-1FPa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:07:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45de287cc11so1782275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491666; x=1758096466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1alLi5TCWrgqVg4gWAi4guSOwfn7tcAcmAIIueAQAFg=;
        b=0rRxwn1HO7Spq4XMT/UD7tX39cdYaBRq7F69Ae9NWpaJLnORYuY0LtaSKZI3Au5Rsp
         q1lqp2vMxPVEO6IrN/CreMYm6dJdX7Jq1noM39VplE+jK4xPoh/AP5wcKwh1BgImW0rx
         b6R+yqHEeANHwaWr3SK+BHwJpRgCuBb+Xw9ncLSK+TeMgEDRqz017IVd5Cc8jI0xAMSz
         rjjyg8Nti/gDBHt4TymChgynpfpgUjoSwkb+kZ6FnZa6yNUSwGvskYBH59Rx3Q2v5zKW
         ZU2/Y0+q57fv17N20Rn/MTnFWTQ9bKpBDmYJwWBJ5kAcQdmJHUR6uvkV8mUHVCYOCeA6
         95YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491666; x=1758096466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1alLi5TCWrgqVg4gWAi4guSOwfn7tcAcmAIIueAQAFg=;
        b=qvMFiIXkUco29EqDNzZJnHrzCjKYwlwwFXiSIrjPbatBAfo+4yH4xf2QLBMreu8+iH
         bpxrSwMLiSp6WXrkhFz9K+vLYjcGDETAdPdlq/0xUwK8CuixhJVAe4I2n/TOWvsjdXhM
         hg+d1TDupWgornNxwFRGC+WfMZ0L6T3r6UwLG4XpQxy9jE5dNrwYvSLeIVRJrTXjeGeH
         zkM+/biASM0MCTFTQTbsHMKyUHwvrztTXeC7Hb6AbjjRG6pHcEU2dkGO1MHQgMdnz3Yy
         Guuc/nI6Mt7QKJsRpgm/Wyauc+bbRzIIbk4KIo8BW52TBTXy982GuW8fEJESkxrQFUt2
         Qbpg==
X-Forwarded-Encrypted: i=1; AJvYcCUlUiekywkYbxQSWr672Gew40uvSNZnjMuDmKQAQVFiQ2HL9moPbWeN2v7bpX4ILN4hS7oUDhHJl8s6zePF4Y8i@lists.infradead.org
X-Gm-Message-State: AOJu0YzV9bhLhex5F6YkP/ROEUZXkO+epZ6KriD3WIOd4kG9XrkbtH4k
	VwTTAc0+g9VQYYX69Wv3Spp1Lm1137yy8zktaC7iH/7JyOg8RrCEUwmIO+UavP7x8yQ=
X-Gm-Gg: ASbGncsi2II8iqEkwz05rjPFkMxBZDFNnI0Ib8FT1Ztgtvnaj4ZYposbZ+MBCC5R6Dx
	SiZlDBhVYFt44YqWIE6zdSM7q0emaYA6dieGBbLfIeDc+SCSc8ThTec12gHpEyf8Az1FACivrdP
	ZBLrsWeiWTz3hqxoYDErDsGy2tSPZ8CHJjCv6xo554xtNFxAVyMfZ6HFOGwhA1/NHSQCXLBV2zF
	lL5IcWjiP9XHd1Dd5I5G2kFvhmPaN5OyvB5snBJaEfcyb64Ngpyxd59gQ5w9TZNNwZMVfv1PaZe
	QPgx5lUkAcDQm3kkk4zggH2ldfmoJGF8jJZ7m5FmfYA/BMlwuWhgSiXMlnSSEbOPZbWFNjcGCLG
	d1foLBGCG4LDtbMiU7g==
X-Google-Smtp-Source: AGHT+IHUfNjE0pY7vZ+IcCgXIXh8Lahm+PtGcdsfEFu9OwRBe2SmxKxdGyY8wQLIJhN0eScOcZH4jg==
X-Received: by 2002:a05:600c:3b97:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45dde200426mr141421605e9.11.1757491666390;
        Wed, 10 Sep 2025 01:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:38 +0200
Subject: [PATCH 1/9] arm64: dts: qcom: sa8255: add ethernet nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-1-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6804;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6sz23anPDRYU+tsW+2XaI9tMLFTu/c/A2ZuoT/MQdio=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHMW6xqaogABRNf5jUw3TNxGIijVhn0iE2mz
 +JPHFY9Xq6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 cokeEACkWEntE6cCSgV4bnEfG5JjbhSGi4KEv3WLjNNIVMmMVfSOm8K2pX2w4btzgnQP+pc/PR0
 R5RfDyNuRpjDjawkEmAmVI0gghRTBaPea5XNfJczc+FUAAquNr9BdGAnpejL1TP2LLYzb0pCu5Z
 HyVPHLlx5pXLQSREfLTxbal4NI99m4QzS6KNSrlYX5+pT7Xmx2Xfgmxk1VWv3/2irrZBEwjkUHW
 JFOiMMHtTe3oSNvZJMn/b1uyakFUGedEdNwc6UgfHZR9qMJcxpMQHC0hVX7EpUaAB3K8bNGBjxs
 VLK200yoFl0u+z9eyPIjFg1G2n04kpT4UavsqwSS2VVABsVElOxCCc94fWbsh+NC5+We34qaejf
 V/IaglWkftnQnnkByHw2TCpYqGVvqq1RQ6MZgBjxB5BsgMs8SW6kg7Ef4b6J+0DSFYZCW1gNRJz
 YiOXauKAIoa07K+tpYqBXZr3sh9P0aSmRD5pE+lvI5yA6wynpcAsE5QOVsS0ByV+ZmO3Dng1cbn
 Vw/wfzOxLt4CCA9L7J6clGkNzKrcwk7Wupq6z+9ng05E9IbPIdkgtRXGbaJeVsfSJgUWB3eZXzn
 Tf3FJkOwlVdpodvRNFeQfGlcUg2JYOUVwiqGvm9/JXSKVgOEb3zfqV8yV5+yOHnDZX5yXjlbuyw
 rWEI0tlQdSBnq7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010748_395651_646932AC 
X-CRM114-Status: GOOD (  10.67  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add ethernet nodes for sa8255 SoC and enable them on sa8255p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts | 201 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi     |  44 +++++++
 2 files changed, 245 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
index cb866f897d0a372ed82b08a1734202fddb4e4d3e..62b3101caeca2ef43b2eb096753dd38b665684c6 100644
--- a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
@@ -16,6 +16,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -31,6 +33,179 @@ &adreno_smmu {
 	status = "okay";
 };
 
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <1000>;
+
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>, <&scmi7_dvfs 0>;
+	power-domain-names = "power_core", "power_mdio","perf_serdes";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		sgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&sgmii_phy1>;
+	phy-mode = "2500base-x";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <1000>;
+
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+	power-domain-names = "power_core", "power_mdio","perf_serdes";
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -59,6 +234,14 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -75,6 +258,24 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart4 {
 	power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
 	power-domain-names = "power", "perf";
diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
index bde94f8af8f7d2844855fe7ce432dbbaa996b6cc..144745b2ac75b5d42b682bb107ebe4b27afb6644 100644
--- a/arch/arm64/boot/dts/qcom/sa8255p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
@@ -1093,6 +1093,50 @@ cpufreq_hw: cpufreq@18591000 {
 			clock-names = "xo", "alternate";
 			#freq-domain-cells = <1>;
 		};
+
+		ethernet1: ethernet@23000000 {
+			compatible = "qcom,sa8255p-ethqos";
+			reg = <0x0 0x23000000 0x0 0x10000>,
+			      <0x0 0x23016000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			iommus = <&apps_smmu 0x140 0x7>;
+
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "sfty";
+
+			dma-coherent;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <16384>;
+
+			status = "disabled";
+		};
+
+		ethernet0: ethernet@23040000 {
+			compatible = "qcom,sa8255p-ethqos";
+			reg = <0x0 0x23040000 0x0 0x10000>,
+			      <0x0 0x23056000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			iommus = <&apps_smmu 0x120 0x7>;
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "sfty";
+
+			dma-coherent;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <16384>;
+
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {

-- 
2.48.1


