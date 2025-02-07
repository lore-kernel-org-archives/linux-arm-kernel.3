Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F40C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlSOdiWqUFd/qMNgBzgsVr9GSLb1yHuwpQFNiE93zxA=; b=Nq03COyq4tKSv1h3sLnUJ3ONTy
	eYHkPuMeCOeUPCht+yBea876jW3r2U5fRprQZbn8bkxLEGq/waAT3vHtlGkEQAtgb+T7KRefF68Hm
	qyZmkplN7wuM8VrObyQL1h+jNZ7vscndheySxwtUpTp0OcoAFzfxvmLO6o3DY0G3vKrkmRRdfqD3H
	mTchBq/zf1qL3kVBSdpmY0KsRamd87iWj6hMHr+3ND+1fVUA3H3DMRdLETQqpRpDqaXdhs/mErd6g
	hV/ZOVzMPpw08Xp2htl1oz3D6tbBcJKNaDJTWOyCL+uUkCaiVg/Nzynup2ZfS6Z/3xwZiq+30HiEV
	fT3xkVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJxq-00000008rfa-1e4Y;
	Fri, 07 Feb 2025 08:43:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrL-00000008qHX-2AeU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917432; x=1770453432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KlSOdiWqUFd/qMNgBzgsVr9GSLb1yHuwpQFNiE93zxA=;
  b=Bx1zF1hkya9nwa0At7zwiXQskhvCts8hN2zo5S2aE/bfopM9tfmVrZY3
   Ak0Auv7mhdmiu3vUJr0TlB1ctspZxxywD1GO9GHJxt1U7tAoCmK+VDXW+
   7OlPYzW5t6pojGaYnUlfl0zb8rYLEuFpdvtcPWJrPtI9XRne75w7U5tvp
   N3mbk/ouJbyLPQWINevcBcGc4cYYvnO0rA4N/5RbhLlq402a+pglEhnNo
   FBN1LZkhOdL0O6Jb9D6z3GLpSzxihHJMZCwkoPxSIkUCmnORAa4eqtVEk
   8IFbqn7VWHZP2bobw6f3GIYOMYnzfw7ez6t5PKUrdrEPcF7HBH4IW8Ld0
   g==;
X-CSE-ConnectionGUID: AVJcsTXrQVmlXrTi5pMN+g==
X-CSE-MsgGUID: LudbVcSIST2ZyjWG+DRFjg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636083"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:49 +0100
X-CheckPoint: {67A5C620-11-8F72533B-EF5B5974}
X-MAIL-CPID: B16014F1042DBAB2C8FE6C97933F6F75_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACF7D168336;
	Fri,  7 Feb 2025 09:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlSOdiWqUFd/qMNgBzgsVr9GSLb1yHuwpQFNiE93zxA=;
	b=rG6gDhm+646H4cQlpSn7OJX8kmP/XTfURE8sMWXwph4Y4l+9OQai7XQFFfM5fA16GVjKSM
	Qx+6r5TWJQP2HKb4A9QvcTBnh8yawtlX+T8B5cd8ak+KnWsbXrHxhJlNwRpbdlcx7jd3yC
	JWVChdUKgvSKqQhb1Ek8UqRokhUsUa8bBy3OpLtEp5cgjNEmGv/HsJovhhLVqzcRGfOz42
	vcmY4T6r4ZOer3nap5QJ6aKY4Su68LrHv/JfF3IRMiCkgdsdeIcHCxBFZPBC7Ji2PRKXBT
	a0Dn5WD2Oz7sHzO3XGKTVg7BU0MF72ikDmrtz7/tQUdIVDKvulUYB8ZlKBCHXQ==
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
Subject: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:09 +0100
Message-Id: <20250207083616.1442887-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003711_875438_D1AD0A33 
X-CRM114-Status: GOOD (  11.12  )
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
index a5f9cfb46e5dd..ee6c3a4be87fd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mn-ocotp.h"
 #include "imx8mn-pinfunc.h"
 
 / {
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
+				#access-controller-cells = <2>;
 
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


