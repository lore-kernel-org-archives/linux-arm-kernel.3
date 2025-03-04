Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1AFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VoAaV45utjStyReGTSKahDfsHoCThtjhDMr40/ZGtg=; b=Kr6srWmZL6ZF0uV5T17q4OxFlK
	kosvx8Ynk3w4lI+++u46ChTq+LipSEm1b+qAdslq/aQPHj7jK9w1geuXGq9mO+xjU4krKEIiYBlQO
	+ghrRNJmN+IJ8/3mjUYibZRgihNukgFcXGNJBSkIIxK9CWXdtE9TLrfPTQhieqRg50bGNoBM/kKea
	+MDp8EvNTKA2HxyR0S2iiL+ELPr3o+RsEPXnI9owrMdrWEOUsZ9+X2EpWeHXslswav3ipKVkW13fE
	imptR0Lb9O4CEfZiUAy+Cv5FqyupdJg5iP7RKuJ38mXfEctfNeDxIceU8DmOqqk0PqPnziCdi6C9b
	xInhZpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVp9-00000005ZdI-49F0;
	Tue, 04 Mar 2025 17:12:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUWx-00000005HyD-03Qo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103403; x=1772639403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8VoAaV45utjStyReGTSKahDfsHoCThtjhDMr40/ZGtg=;
  b=pdzEjLFqnOT/gzQyrKHq7YyzTlwe+2lh9QoWTeExTYMR4IHvmI6MIB8I
   ugssbLpCGZXmbmXF7dPO1ssXAXorwNV8ej7qy4FRdTB/axnH9XdyRprRn
   ASOVwbdaxHYVyP7sP/0K9QnUdK2LTUvRAhn1Z++e4AP1bQBKME4QII1wH
   oRf8hKfWNhYPnZQGmkmZroxo6eaQDWm2QmEVn0Nayl6DcJu45Q7ltUeTq
   1ZHs/ZgwZSeMFRJ5dAQJ1wGaLuh/2dbp3bG6X3hnRGxfLmT+vQFZ02osN
   Fh2Y1sRmKYE0G9KKzO98bAE477kBnIaqOwUkEFRFsiMMbuiLiOXIdXTaV
   w==;
X-CSE-ConnectionGUID: LfRjySMJQHuFg6AXqcHyxg==
X-CSE-MsgGUID: gPukJPRnS7SFRHjQMPPMPQ==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272746"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:50:02 +0100
X-CheckPoint: {67C7212A-0-2417938-F0170C2B}
X-MAIL-CPID: CC92DBED37CA786F3092364A9E7C0752_2
X-Control-Analysis: str=0001.0A006367.67C7212D.0028,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B14E016180C;
	Tue,  4 Mar 2025 16:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VoAaV45utjStyReGTSKahDfsHoCThtjhDMr40/ZGtg=;
	b=d0ZpTXW+XW9H0wxY7wcgCEQ6dljQ3Hv6H59YAmhYbAlONxHn98m9h4qO39IiCd0/nSlRhL
	EOxEmadDTzRmdGCszjiduenMDxtl6rz7SUqda64s0ghINesnyORHLr8UWplBOnzScNN0A1
	3QQGhM9tfTdAlj6XCWCVFKndIgrW48VuyS/ixmZC5LnzQ0Y9XZJswb33jID4xVNx4nO+zG
	q3k6hSX+EeGPxTa7nQ6E/awEDjpGMRJIJwrGLC2Qz2Omdsigsh2zUjxXFRTYG0/rTiB5Bz
	t7iGzADX/ov3ns8Q55S3DckdYzKo+z/T33rmmXaSegWfDCPdLZVfFYsAGxhGWg==
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
Subject: [PATCH v3 4/6] arm64: dts: imx93: Add LCDIF & LDB nodes
Date: Tue,  4 Mar 2025 16:49:23 +0100
Message-ID: <20250304154929.1785200-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_075003_359217_64EACF3A 
X-CRM114-Status: UNSURE (   9.74  )
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
index 56766fdb0b1e5..69a639a8c833f 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1273,6 +1273,9 @@ s4muap: mailbox@47520000 {
 		media_blk_ctrl: system-controller@4ac10000 {
 			compatible = "fsl,imx93-media-blk-ctrl", "syscon";
 			reg = <0x4ac10000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4ac10000 0x10000>;
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


