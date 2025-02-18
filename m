Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD3EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlblhZxU3iVsYwkr51/ImiciPsL1o8htH4i6i7QSyJA=; b=F7YJhnCe8lyFXc1QxrCXgTeXom
	HxlSntFu6NgrtVPNFHJukmCHeUtm85siTSg4hoQf9yfwbEV9GdT5zQ82l9/EYrAoNrDTbfTrt45Ds
	UYHuVPlvh9+nMkKkSA/V+j+jXLPpWJYs6+RltqUQXWzD01mgMD2odAoW8wKyhvlS7CvwyqkC6BxFt
	nCfBjcfE8uEn5br8If4l0qBT6eapZXyHQGiXLD5AJD/S6DSVMZkUFJQoqpLcpeOnmgfUqBhstvhL9
	0XHERcE88UbVjvO2aLpo7W+RrxgLuJersVrA/fLjJKZhzStmYmui1JNwor7bsfLFAFepaTZY5M70+
	e6xIS+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTKR-00000009aho-11Fh;
	Tue, 18 Feb 2025 19:32:23 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkc-00000009SD3-40lc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt8jW1601166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:55:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904908;
	bh=mlblhZxU3iVsYwkr51/ImiciPsL1o8htH4i6i7QSyJA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=erMxm0NXfRBSV6x4+3/AO6V/TaFoC+4RsY+WesoP8O0Ga5nieBXqA8kIMF83j/ht+
	 R/hFaYToKjmD3LB36aAZc1yuhHbQyLENGhqNeU6qQwxUOKLkAjeerYC8RqhxZjv7cJ
	 9Bf18RyqZuxsSORRp1+v4aeJvSYQwlzyHDqaTSrc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt8Z2000987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:55:08 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:55:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:55:07 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIsrxb123821;
	Tue, 18 Feb 2025 12:55:04 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>,
        <y-abhilashchandra@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH 3/5] arm64: dts: ti: k3-j722s-evm: Add camera peripherals
Date: Wed, 19 Feb 2025 00:24:50 +0530
Message-ID: <20250218185452.600797-4-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218185452.600797-1-vaishnav.a@ti.com>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105523_100928_EC5517E3 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

J722S EVM has four RPi camera connectors and dual MIPI Samtec CSI
connectors which bring out the 4 x CSI2RX instances and the I2C camera
control interfaces. Add the nodes for PCA9543 I2C switch and enable them.

J722S EVM schematics: https://www.ti.com/lit/pdf/sprujb5

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index d184e9c1a0a5..5c0200c8811d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -263,6 +263,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
@@ -631,6 +638,27 @@ tlv320aic3106: audio-codec@1b {
 	};
 };
 
+&main_i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+
+	pca9543_0: i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+	};
+
+	pca9543_1: i2c-mux@71 {
+		compatible = "nxp,pca9543";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+	};
+};
+
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
-- 
2.34.1


