Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2230EE98FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oeln9JFl3xMIZpXa990FnDvFwc3Ph1pCSyvABpPHh8=; b=d2I+ngDyx0AJfw+z4rPSOuoeRb
	CKiwhOpYUfIqNYA4IlcicGimyKEZBEKz6oYCztpZwVpkho3bA4s/xHrsUFz4di5AdW6wCsZiTX6Je
	qjwWvNwiIZEzwTgjI3PaiPhEqfNgH7AfDx4qyZgDLZsjC65Uw6IIf17cTifOvMQBnnsYedSGw06yu
	rWwFzikSMujI7SphZrKooJswmmfSC0Fg4aomSXcGAlm6OMc0y2SQYlbm6Dwf3ZeajeXTo7bZNhsmr
	KsA7KJNddM55873EvOfn2qQ92q46WKXDGjBetZqmxeWMVRMQmmxCBMZiQQYKs4SYy8oWUD9EV6odY
	CbIn/VkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAN-0000000A6Tj-465l;
	Thu, 09 Apr 2026 09:59:15 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAI-0000000A6PF-42Ws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:12 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id BA2FE2035D;
	Thu,  9 Apr 2026 11:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728749;
	bh=3oeln9JFl3xMIZpXa990FnDvFwc3Ph1pCSyvABpPHh8=; h=From:To:Subject;
	b=ajF8FaMnzUqXRCsZ7aDfsCwGHWoT0NO4zdp3CT8on86/aAEe2KcEZ5GeiqhH0l1yV
	 iReHRUBmD4YDhgYUSiNiLLJi9zQBcKAZrYHB5c/jGEP+e+PVPExjZK1eDnhkR3ojh0
	 arzfid+SVOgW1ezZ9dwQA5lz005ne1hK6EggnsgWmI5k23ZysrvRAs4oqAAGuqHdP5
	 2oIUC+GCn8K8ad80qasZ7OohRiqWkOW088ou7wL3li4K/SS51z4k9o14Byj4NGrrFw
	 54E209QplebTwrSrZ0447x+9jEYlDplhaYtLBQSwCp+uWzInNiabrarLo3zkmvN9x8
	 qrXNvtsWhT+tg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/7] arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:50 +0200
Message-ID: <20260409095855.61252-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025911_156079_3996554E 
X-CRM114-Status: UNSURE (   8.29  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Some carrier board reuse the UART_2 control signals as GPIO, split
the pinctrl RTS/CTS in separated nodes to maximize flexibility.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d31f8082394f..9fee2cf9ef54 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -846,7 +846,7 @@ &uart1 {
 /* Verdin UART_2 */
 &uart2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-0 = <&pinctrl_uart2>, <&pinctrl_uart2_cts>, <&pinctrl_uart2_rts>;
 	uart-has-rtscts;
 };
 
@@ -1277,10 +1277,18 @@ pinctrl_uart1: uart1grp {
 			<MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x1c4>;	/* SODIMM 131 */
 	};
 
+	pinctrl_uart2_cts: uart2ctsgrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SD1_DATA4__UART2_DCE_RTS		0x1c4>;	/* SODIMM 143 */
+	};
+
+	pinctrl_uart2_rts: uart2rtsgrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SD1_DATA5__UART2_DCE_CTS		0x1c4>;	/* SODIMM 141 */
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins =
-			<MX8MP_IOMUXC_SD1_DATA4__UART2_DCE_RTS		0x1c4>,	/* SODIMM 143 */
-			<MX8MP_IOMUXC_SD1_DATA5__UART2_DCE_CTS		0x1c4>,	/* SODIMM 141 */
 			<MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x1c4>,	/* SODIMM 137 */
 			<MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x1c4>; /* SODIMM 139 */
 	};
-- 
2.47.3


