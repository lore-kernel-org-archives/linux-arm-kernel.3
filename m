Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD40FD5E151
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9mGmXqHfOmeLgdEOLDPoxQ5MFnm0tlfSuhg2kM00pQ=; b=HrXxIxXDzz0AkHlvoEDtlS8eW9
	/1HyqU8NP2TUkIHn7w1xjA1hikJ+FquXmp0PgV0lc0CuDF3p6jopjKo2wUhPYtJrbmrnsiaBJw4Ew
	36C6RxQazACH5Y7ctqPHWyjB4268sKA01pu6BmZjqoMfv1CPnr4fGlmC2N4EFyAta82X5iqARE7fm
	t+KFcBG4osyT/pgU1GjaKKD4z02jbuFOK/qSbXLUQUnYp6iBfBIH7DVuVdgJQjnINv8+Eo57XxlEH
	Oow7X6cxuXrFgEIygOk9F5GXAZ844DLEeWlTOOPcpR0ZUaY+1QOfXg/F+OWme21uyACpbeoixCW+V
	BbXALk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9W-00000005GBL-1CvF;
	Tue, 16 Dec 2025 13:31:46 +0000
Received: from mx-relay93-hz2.antispameurope.com ([94.100.136.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9T-00000005G9c-0jqV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:31:45 +0000
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=x9mGmXqHfOmeLgdEOLDPoxQ5MFnm0tlfSuhg2kM00pQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891891;
 b=blSRImG3fLUmsX/Ros0mNeTMWvPoaiePTkiHwO+MsMjHqpOMqO+dFmfNTyVhaEskqArgz0al
 16MkImxVIjSqo7ML0TtgmyQlM25zrJL507KVEirMVp4ncfdhgkl7OmON7CcBwZjgJHI/v5cMLD7
 8yX/uZuQiKMCDGlmfYcDvmJ6XG/XKwzkMlzV9vk3hupJm4txU5ihjhTkQs68wESomEP6EzevtuG
 CsZDk3wVPLGMU6jrcNRuUOfQbPNO0XA0V8UBcijC7vnrRS5WUnki2ZSWNCTkmITESvvs6sMZ1Tv
 TeS4fBqL2A/3ifYuGGDunIbO9MPYhKmBMtCfuT+5LHbsQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891891;
 b=hR4U8LBFKfDFFmKWOfSs6eVjawbFw+yAIF7zzRSgPkH/kNmYEa7+mao7swG2iwJ0ZXzlcuTB
 oPLWQRWkTtxv5zLPpFB6xrYX2GY7R58Yvq277SZXN/J91K3U64CF1FPDY6460JBCUPx3IFr/sSf
 42zbBdYBDNSlidEWdxE2N2OFX9UbZ3Pn7tDbv+5op4JbpYOY95n0MtLCFclEO/RTWyBqqf58h59
 w8o/DHVVN6FJi8hqtptFN0qdhRqB/3WR9IBnPj5kH9RdfJIfqe/zCI0cUKhOcmcToDqDEWoj+6L
 ChOfceifkM34EHSRVL1s3n8Lu8r92aGvz8Sq/ZdXyApWg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 16 Dec 2025 14:31:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 56EB55A0F66;
	Tue, 16 Dec 2025 14:31:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 4/4] arm64: dts: imx8mm-tqma8mqml: fix LDO5 power off
Date: Tue, 16 Dec 2025 14:31:07 +0100
Message-ID: <20251216133110.905950-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-body-digest: f05457902f37798828b49e9ea5497943
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dVyW90kQLz4QHDJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 8607d1a79e30606a7dcee9ac57a97bd3
X-cloud-security: scantime:2.034
DKIM-Signature: a=rsa-sha256;
 bh=x9mGmXqHfOmeLgdEOLDPoxQ5MFnm0tlfSuhg2kM00pQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891891; v=1;
 b=YmtJvYL48BGH+QL2lV/ZyuXiuUXMRHEavFOtzx+o1C2dugA67yo+hZDfd86o3m9yb7l6D4f9
 S/cjYmSg25txMLImSJZEBzSKqNMXdaozD98NQ7aMRPn0gvTfGMGl1rD8TjCmIUQbX12BDAQCH3G
 dVpm7S6YDFHqeARSRe+f4NVsmNIPFX8HgNn3fun3Y0VuhpaDMrdSyVIpprubbaiQcttQG8wPyqp
 oyk8FJPStGIlOn14BBbXGV9aj7FLye3stUnRJmHiv8cVbfVdbPyo/Qk7jYfjE5n8a5crooL6GnM
 0S91TKYua/64tmdUM5A++LouKKvK8+FUv8YLPs0Z0914Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053143_899114_8FD36780 
X-CRM114-Status: GOOD (  12.94  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix SD card removal caused by automatic LDO5 power off after boot.

To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
regulator that is supplied by LDO5. Since this is implemented on SoM but
used on baseboards with SD-card interface, implement the functionality
on SoM part and optionally enable it on baseboards if needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 13 ++++++-----
 .../boot/dts/freescale/imx8mm-tqma8mqml.dtsi  | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index b941c8c4f7bb4..8dcc5cbcb8f66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -101,6 +101,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&clk IMX8MM_CLK_SAI3>;
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
@@ -276,8 +280,7 @@ pinctrl_usdhc2: usdhc2grp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -286,8 +289,7 @@ pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -296,7 +298,6 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4>,
 			   <MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4>,
-			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>,
-			   <MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x84>;
+			   <MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 2e3860a5f4fd2..29b298af0d739 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -16,6 +16,20 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vqmmc>;
+		regulator-name = "V_SD2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		vin-supply = <&ldo5_reg>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -227,6 +241,10 @@ &pcie_phy {
 	fsl,clkreq-unsupported;
 };
 
+&usdhc2 {
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+};
+
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -281,6 +299,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x84>;
 	};
 
+	pinctrl_reg_usdhc2_vqmmc: regusdhc2vqmmcgrp {
+		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4		0xc0>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x1d4>,
 			   <MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d2>,
-- 
2.43.0


