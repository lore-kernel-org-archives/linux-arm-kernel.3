Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5397C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlXAWMI0jccQM6/g/C8LaMfR+EC5iEa5X2zR+R/BcUg=; b=zazq0keEBCtZvia93UyHkwW4nB
	qj/zh6xqNe3DMH8XQMwY7XjsvSG5rU9QexwBWA+9gVTF/ppdm++crpqzy432i4h/Oo2QRoth/3BUX
	Vu/EnSK3xT3MpFehikwD4JNHPG7sriU99aVLS0cQeTsQkKoKNhGWxmyJrTZ529kSdm+50fo+z85ho
	Mmpsn2/OD3rq3LdRr2DvmLk+l6RCClzLSAPqpXRr0BkX/AW70Voi7g5mnNEzlM1l1IvR4X4B05uJy
	5587tlseR50aXExerXUWK7e8Pm6mNM+mHV3IkOmp3SIgkvwr9C2tmuy0hslWFuo7UNLN29A3Rgp9P
	fyBTVyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUGy-00000008osL-1R8Y;
	Thu, 30 Jan 2025 13:07:56 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUAk-00000008o2H-0igM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242090; x=1769778090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XlXAWMI0jccQM6/g/C8LaMfR+EC5iEa5X2zR+R/BcUg=;
  b=K95XFuhpyzuY4ePqJHnsArTnKDwM305YyOyqhh6sZkJG7ThXHfL48Fqs
   YCGd8IcvtGlneoe4nSUMUehg7uiKe/iR+CgUwgmSLjgOSYXGOpDaN1UQL
   q+jY2bmEwS++BnPwFYi0OxUDtxd4WqfbARNZEDEds+X7sydxIIsHGaZ7/
   N9b2pxFDIXf3lrfFEOMXNQadV1LazWMo5izjnZXUD3qYCIJUfWvsVfuig
   oHUNMNqAa8lCIrnjDG87ICqe4nT8LEj8adfVrLLDOsgzi1sGtVN7zjGd2
   3LftbTxco+iReSkT9OhNI4vc62x9tJ7fH70m1hBPY1I3iQc8emhg5BY3i
   g==;
X-CSE-ConnectionGUID: tVv2S7LDQKaRqxAvRIMJ7A==
X-CSE-MsgGUID: ucsh4h+SRWOeH0M15uviNQ==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374630"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:29 +0100
X-CheckPoint: {679B7829-1B-3C670366-E45AD810}
X-MAIL-CPID: AD046D59AB2B64B0B01BA9A3A0E2865C_4
X-Control-Analysis: str=0001.0A682F1E.679B7829.0086,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF14016A8C6;
	Thu, 30 Jan 2025 14:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlXAWMI0jccQM6/g/C8LaMfR+EC5iEa5X2zR+R/BcUg=;
	b=Dp8aGpHnOwlDVpj+8nvp6MWlvkBPp+0y3Gh66FW2SuYuXbC4FX+Jar2TCn59V0XhDRA2Dh
	sbgvY/4L+z2s5c2q9RvwmO9bXqVQfxWvXzotg5AL6Tb+GTmevpPCrVTn7ASOg+U+pQTZ4U
	F3rt6JjghVsCtnjl1h37mSW+IKcXNkn5/wmXceFeeEdhWWke2oDjUqP2gm9enXUyT+TbAU
	hgezjjEVJljmYtPsFRAdeXX0wKF/n5T84IGO8/mo390SPZiXv5HB9Dz3M1w9B3W/QYhmhY
	uixvtci4mKBRqKyB1rM2u1MEYpiAgKPBo+1BktjFLsFjypl4MFIFi8y5Y+hqeg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mn: Add access-controller references
Date: Thu, 30 Jan 2025 14:01:01 +0100
Message-Id: <20250130130101.1040824-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_050130_508199_3888E6BC 
X-CRM114-Status: GOOD (  11.30  )
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

Mark ocotp as a access-controller and add references on peripherals
which can be disabled (fused).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5dd..b023724679b80 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8mn-pinfunc.h"
@@ -431,6 +432,7 @@ easrc: easrc@300c0000 {
 					firmware-name = "imx/easrc/easrc-imx8mn.bin";
 					fsl,asrc-rate = <8000>;
 					fsl,asrc-format = <2>;
+					access-controllers = <&ocotp IMX8MN_OCOTP_ASRC_DISABLE>;
 					status = "disabled";
 				};
 			};
@@ -571,6 +573,7 @@ ocotp: efuse@30350000 {
 				clocks = <&clk IMX8MN_CLK_OCOTP_ROOT>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				#access-controller-cells = <1>;
 
 				/*
 				 * The register address below maps to the MX8M
@@ -1053,6 +1056,7 @@ fec1: ethernet@30be0000 {
 				nvmem-cells = <&fec_mac_address>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_ENET_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1091,6 +1095,7 @@ mipi_dsi: dsi@32e10000 {
 				clock-names = "bus_clk", "sclk_mipi";
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_MIPI_DSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1195,6 +1200,7 @@ mipi_csi: mipi-csi@32e30000 {
 					 <&clk IMX8MN_CLK_DISP_AXI_ROOT>;
 				clock-names = "pclk", "wrap", "phy", "axi";
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_CSI>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_MIPI_CSI_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1225,6 +1231,7 @@ usbotg1: usb@32e40000 {
 				phys = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				power-domains = <&pgc_hsiomix>;
+				access-controllers = <&ocotp IMX8MN_OCOTP_USB_OTG1_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1288,6 +1295,7 @@ gpu: gpu@38000000 {
 					       <400000000>,
 					       <1200000000>;
 			power-domains = <&pgc_gpumix>;
+			access-controllers = <&ocotp IMX8MN_OCOTP_GPU3D_DISABLE>;
 		};
 
 		gic: interrupt-controller@38800000 {
-- 
2.34.1


