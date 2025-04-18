Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED01C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OHF7VWnUsmRHKIb7G4FIttYmy5mYhiEGvrpZInhnF8=; b=ScGUTqtHi5ZBfSdgsLyU9Zi6Bn
	csRocFh9GdXvX0NiCUs0ZvFuEUcpQ8jiX8GX/AhxDUAC0TTaGUsesyyfU5AE8gP1JO5TULL4lCgx5
	D4IiLYZn55JuF6QnfWW1WF86xbL5F0/Ka2wLsfbuNOCILbpPA42eYg6/D9mJGyYg9EqjFLq+lY688
	6mt359XniQs38IdgP2s91qcBnP+t8YmPN+ENEf6LnN6KuUDZHgcLgOKMB0prTTvUY3F92pcvGtHbg
	Vyf7Reoj0osAFAijihjx9tfwLF9Zd/I3vxeRSmuSvdjwwHRDD5bGEyQqrQ/OEHRuYGI2ULEtqmnqJ
	gaLxs9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fhU-0000000FO7J-1Yc9;
	Fri, 18 Apr 2025 06:59:48 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fFu-0000000FGhO-0Ppr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3OHF7VWnUsmRHKIb7G4FIttYmy5mYhiEGvrpZInhnF8=; b=T9+4b4s0o58bwqI9YJEZ5EYU84
	EXydDYA8Z6k/ae+242/xejMhvzZ38OlOuOywYMLUPx5bmVaojuN9KBbIRJs4lfRLm+AKsFD+bivYP
	YMf6I5dWhJ1mVAyzMEyMoj3ICkDoK6YpfyQyxfxbhPxYwHAcb4C15enPH0lKHZQC6SZNZicmMAku+
	elRYShI3b3kBWs8hXWc+o9njKdTPn+OQFkpPYAArI9MiWmXgIAf5zRt6xDr53/Vb2JCfV5QvdjG21
	J9DxlxX9xJnwNi/8bzbVewJVhBoVw9P+QrgntBGe9oTPjDKUvY8h3/LttAa4wcY2/qRd/fHmXPj9r
	dhxqaG+Q==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFt-00AbM0-03;
	Fri, 18 Apr 2025 08:31:16 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 11/15] arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
Date: Fri, 18 Apr 2025 08:31:00 +0200
Message-Id: <20250418063104.2202085-12-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_233118_302581_DFE8B75B 
X-CRM114-Status: UNSURE (   8.25  )
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

Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
interface. The CAN PHY chip SN65HVD234D used on the board is compatible
with the TCAN1043 driver using the generic "can-transceiver-phy" and is
capable of up to 1Mbps data rate.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 .../dts/freescale/imx93-phyboard-segin.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 38b89398e646..be9c0a436734 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -26,6 +26,15 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	flexcan1_tc: can-phy0 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flexcan1_tc>;
+		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -38,6 +47,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+/* CAN */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_tc>;
+	status = "okay";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
@@ -79,6 +96,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
+		>;
+	};
+
+	pinctrl_flexcan1_tc: flexcan1tcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
+		>;
+	};
+
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <
 			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
-- 
2.34.1


