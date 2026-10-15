Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA8CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=; b=XNaEIyyN6cA4UUkuDC3MqDgJgf
	729u7nXcmI4Hhwu7p6wpLE6Ub/hROTLm1xOhkCKTbNY5gXbGxTy5TiZVxfeRsqSPoE5dgPAsCco0g
	e6LEFkFF1m+MX89ZhkaIaHmWP3DIYR9guMz7johQeWtZYOEf0nGL6eWjatuZWbXPPMo99RyM1fDUp
	al5BRs+G9E4JJIyk/n/LeZKh6K8vUelgTzyzSETCF3tTmyEvpSGmkLtI30+1iwYTpcbiIYCCnnAMe
	wKA1STXT+DUfbgJuq8kP9K+QAN3VB0cNuCLYBONb+9pAce4bOgnMUoOIhZmnVu8XOC3CLkR1LsceO
	RKS8lSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOEY-00000000p86-41UU;
	Thu, 15 Oct 2026 16:23:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOEW-00000000p6y-1u51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:23:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48870973bddso101721f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081386; x=1792686186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=cU741UcAh10fKoZuT8Z3K9JTdhwcdRamYYSoyOPpsYbe7TNIPHJTmy8xAErL7YYuoV
         /4kbhLhGJahTvTSsvChHcEMY6SGaXCnCavVTh0H72SK9eMPwY/BT8xesCjVXTr713LkS
         yCLKgJ5afkxNBbYNezo7EXmcLOkHGlWL51pbDQLRkImpwa+AII6OIFRZ3cxzlQzg1oiy
         pWt3rDpZ/z5XkAvms2SYke7muNR6bVBMoBiYSIxG2nK92rRwcdHm6pSRFl9uQrNMwdXg
         2hRafHRBbj9jUBlmkZsMGoLySfCbQQQtlmIHOqwWCJ0uhUb7RzuGzp0NQOnNHO4QGxIW
         H2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081386; x=1792686186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=PZRfsbzN+qGYAtwLI8LD8hU6EzjjM91PtKcLNKY3/nu9tkk14UbSKR5F505lq9spKf
         8ucgv/6e5UqFB8BhgFkVP7g3va0AMoAhTttVmmGP5P5ISGdf4b/gXoiaHtKzIywA3x8l
         ckPL5whKZf1+xMIMOB1X1FP5+tzS7BN8EKvMbeKEieqwWRcxtuG1ipEHJ9HYV838Lt5+
         jt2c1e1BGEVjdy9q+hItO58/X2mPtB548zEq16VL3vA3GIR/TTqdZqkp4SZRlV0wKome
         GXe+tUbcJa0p6yFE9Li79DC4tU9ztREduOz5ABg6s881N8/bXFZuOq1mkJqjnXPGt6NT
         wlag==
X-Forwarded-Encrypted: i=1; AKwUvBzmVAqUtFo1bkvv10WEieHFwDEQFILMYTMqbNvblZ7AVGr9IAlZzroKVSNYeQ2DnTeDBXB4RMfCvd91ROzIy+wi@lists.infradead.org
X-Gm-Message-State: AFq9FYJEWPovRLOfPYyF86S3oXbcuiYGZBq6rx40B3U35EZ7Vl15hLf0
	hxMixo+FlRTbnyLzAfGQE1jcmclZ/BxPm0n72cx+/yd9hnzzjwiq7CgG
X-Gm-Gg: AYBFou1KY6oAk9gkL76TxxwvCFvjz6lgAZZ8cMOhk6DgZy7jLbsW2QgK+qneZTKt6Jt
	oet+RpmKTZgZTG2Ks/zhJUbD2FVfI1v29WtcVASTX79ZprpD48KQZyQvNwhIcIO6tpxZ6wXaZwK
	x6M8Q2euXSEpQFJh7hJn5bW+gsKt6OJ0VujDb4O4q74AKTBmOMYY56fTGb+GCU48IdpUUR4SI4V
	t26pLL1kkz4AZXV2E//uNmJ5EapmpNEpVBfQXWbvKJKIEQ+sbxpMH82yDkde57eA9VdwmyqN1Lr
	Pry2MhucFvox9HM4E0mKa/TuM3Z3uaejWkA+nRibZFxp3aY//zXApfELyPhHiFDu1/m6ZauAAl3
	DLnO7tntJrm9VdR2WLOmrd4wYtVXr5oDKCm95KvGZFTKTh2u1JAoHSNN6kJQ/qS8aOGJMDnNbk8
	aydxEQXjYkBQ0OqVAbLCBBuXGOQLj1ilrrqXM5wdgYtMBuf+geqbptaODtFewrmbj1a6XumOQsW
	nJrc16nSx+j9NtW8+hMFeuo/xtBe45CdHjt0V2tHADdk9+BypV7aPOEi60q2N9YrezOvq+KKdAU
	NtIGnQNiB3oWyW5t1TiBmw==
X-Received: by 2002:a5d:428f:0:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48dfadffbcbmr1105292f8f.10.1792081386308;
        Thu, 15 Oct 2026 09:23:06 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm20616982f8f.28.2026.10.15.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:23:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640 camera support
Date: Thu, 15 Oct 2026 18:23:01 +0200
Message-ID: <20261015162301.63838-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_092308_514901_C5DEF2C3 
X-CRM114-Status: GOOD (  11.59  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the OV5640 camera connected to the Sonata carrier
board's first MIPI CSI port.

Describe the sensor on I2C2, its 24 MHz reference clock, fixed supplies,
and reset and power-down signals controlled by the GPIO expander.
Connect the sensor to the MIPI CSI receiver using two data lanes and
enable the receiver and CSI bridge.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..427a255fe8ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -75,12 +75,39 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	camera_clk: oscillator-cam {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 	};
 
+	reg_camera_1v5: regulator-camera-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_camera_1v8: regulator-camera-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_camera_2v8: regulator-camera-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -95,6 +122,10 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -200,6 +231,26 @@ ft5x06_ts: touchscreen@38 {
 		wakeup-source;
 	};
 
+	ov5640_mipi1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&camera_clk>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_camera_2v8>;
+		DOVDD-supply = <&reg_camera_1v8>;
+		DVDD-supply = <&reg_camera_1v5>;
+		powerdown-gpios = <&pca6408_1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca6408_1 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mipi1_ep: endpoint {
+				remote-endpoint = <&mipi1_sensor_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
 	extcon_ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
@@ -263,6 +314,21 @@ st33ktpm2xi2c: tpm@2e {
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi1_sensor_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi1_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
-- 
2.47.3


