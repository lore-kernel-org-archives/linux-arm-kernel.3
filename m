Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F91C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuhqEAaLyo1TfL58LFojlqr8Kt2uO2XQeV1j7pUA3HU=; b=HuFZ19cGms4Z3aQh49UH1Paf+a
	SqH3QiBtQToAV3L3wXUX9j4M6RDFOvHYaBcZ33KcKpiHnzEha718Lf+d69TPRn3L8Sk88zGWNtnqb
	ke/TbRCkr/y4NbH9Ow4C8RZtNglLR8dK0zMQdvaJkSD1xHRzb/h+D0qy33Xwpap+zX3O8jevIInP2
	foCnK70wCI95ZskgkWe95G8S2uwxO0YK8UC3zDaH/WGArQNekvhyAe2kSXBSrlY3YVwKuugQlzE2X
	wv88XVwf71ClOUXENL6hkHs+pzXcFU5V9Q9Mxz162g2tZ8QfWKSf99lam3LZhT0HvGXPjUUOt3tfg
	xvgVobYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZt2-0000000EBtw-0ehU;
	Mon, 24 Feb 2025 14:56:48 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZSD-0000000E64v-1xtf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407345; x=1771943345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iuhqEAaLyo1TfL58LFojlqr8Kt2uO2XQeV1j7pUA3HU=;
  b=pRiPEJtiDcmY1LkeTyKSG+zNp1gvaBnAduPjPQ52he+7gcgOHggwUwQm
   2mYOfOX8eRPLCMSZVnKb4jn3qbr8UHzHkPCec61epdD/WUM+iFbqa+gMP
   s18UYtXSb99Ox2wEhDW8ADrPyP3EJKEE9HzkhoVsbwMo94cXtCKOwMBzD
   c9Ar4/cmj/1GlIarFhK1WiiuYi4oRY4qx7wxTJ8QMqextspk/t6z8pY7Z
   TXUrqW+nYmbOc8w9CaoZzpXBRXN28DbGVM2gxX9yiOkkuuhUNLKWlW+kf
   JPTB6EHDZlWk8ybfFULbZETuhVx6ZY4qx+zNNcndW75dQtxZuVwpPKZw9
   Q==;
X-CSE-ConnectionGUID: cM3QtSdVSYqcuGFY3JrXTg==
X-CSE-MsgGUID: rj1n1ru6QRu1j27DMik2JA==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042112"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:29:04 +0100
X-CheckPoint: {67BC8230-12-B8541F8F-E50F9B0E}
X-MAIL-CPID: 68B2CFE4E33B4BF4841F93BBD2BBDC69_2
X-Control-Analysis: str=0001.0A00211B.67BC822F.0075,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFC8116799F;
	Mon, 24 Feb 2025 15:28:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iuhqEAaLyo1TfL58LFojlqr8Kt2uO2XQeV1j7pUA3HU=;
	b=dUL0z/APovQ9RTMwny4LCZ3571enF/b83suByyVuFNRHU1GDB6Kwr/nUwyR0Yy5ItV5CkW
	HEv1IpwK7uOHdwyMXXpmMrzJQyaIzWKyLctCJqC5OH7+vcUrCuxe/Elp4sHCytgbHLJAQ2
	p6ATLWGEgXdttCk0W39puTuxUl8FuSZxpuLmq1HB2oRsOVrbWC/7zEh2ksJqemEsyfT0Ed
	4BmirktovYI+/bBBhvDfAkModjlKGL6jmnVro9eVXNFoA9PFPiUSk5UuALfwvZiWwReHlI
	Euvz32GOvPlwXaBRo8ylYswwGKv7PuT4ec8UVnuOWt/DuQJMFLYDJJcGxyIsjg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: imx93: Add LCDIF & LDB nodes
Date: Mon, 24 Feb 2025 15:28:25 +0100
Message-ID: <20250224142831.485159-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062905_805385_0850EF21 
X-CRM114-Status: UNSURE (   9.59  )
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

LCDIF port 1 is directly attached to the LVDS Display Bridge (LDB).
Both need the same clock source (VIDEO_PLL1).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 77 ++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 56766fdb0b1e5..2628e1e628ec2 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1273,6 +1273,9 @@ s4muap: mailbox@47520000 {
 		media_blk_ctrl: system-controller@4ac10000 {
 			compatible = "fsl,imx93-media-blk-ctrl", "syscon";
 			reg = <0x4ac10000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 			power-domains = <&mediamix>;
 			clocks = <&clk IMX93_CLK_MEDIA_APB>,
 				 <&clk IMX93_CLK_MEDIA_AXI>,
@@ -1286,8 +1289,82 @@ media_blk_ctrl: system-controller@4ac10000 {
 				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
 			clock-names = "apb", "axi", "nic", "disp", "cam",
 				      "pxp", "lcdif", "isi", "csi", "dsi";
+			assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+					  <&clk IMX93_CLK_MEDIA_APB>,
+					  <&clk IMX93_CLK_VIDEO_PLL>,
+					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD0>,
+						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+						 <&clk IMX93_CLK_24M>,
+						 <&clk IMX93_CLK_VIDEO_PLL>;
+			assigned-clock-rates = <333333333>, <133333333>, <0>, <200000000>;
 			#power-domain-cells = <1>;
 			status = "disabled";
+
+			lvds_bridge: bridge@20 {
+				compatible = "fsl,imx93-ldb";
+				reg = <0x20 0x4>, <0x24 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&clk IMX93_CLK_LVDS_GATE>;
+				clock-names = "ldb";
+				assigned-clocks = <&clk IMX93_CLK_MEDIA_LDB>;
+				assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						ldb_from_lcdif: endpoint {
+							remote-endpoint = <&lcdif_to_ldb>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						ldb_lvds: endpoint {
+						};
+					};
+				};
+			};
+		};
+
+		lcdif: display-controller@4ae30000 {
+			compatible = "fsl,imx93-lcdif";
+			reg = <0x4ae30000 0x23c>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_LCDIF_GATE>,
+				 <&clk IMX93_CLK_MEDIA_AXI>;
+			clock-names = "pix", "axi", "disp_axi";
+			assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>,
+					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+			assigned-clock-parents = <&clk IMX93_CLK_24M>,
+						 <&clk IMX93_CLK_VIDEO_PLL>;
+			power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_LCDIF>;
+			status = "disabled";
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				lcdif_to_dsi: endpoint@0 {
+					reg = <0>;
+				};
+
+				lcdif_to_ldb: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&ldb_from_lcdif>;
+				};
+
+				lcdif_to_dpi: endpoint@2 {
+					reg = <2>;
+				};
+			};
 		};
 
 		usbotg1: usb@4c100000 {
-- 
2.43.0


