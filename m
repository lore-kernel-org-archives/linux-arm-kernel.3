Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC71E98FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+DQm6KckJPpCvSQbRljrPwKFiy8QdB/i+JwiAKbMo0=; b=puAT/QYPLjG3usSsN/3YxpT+js
	oleFXBsfXzOURhenlOT5pm0b+nig5VPUMZum39GmnURrW0He9IDXLBlkhtbcz5VJkjTxh7qbuhUVv
	ytGdpzum4tUkJ4U+39nk3SdQ36XHdsUQweKgKtdVVO9oGdo1Aoahtk40Y0+ZT014540UFk3lvXbbP
	3khuSNHuvl3Uiorh4oTNIJhA+45wuDf8ClrAK8Jd1o/8dbfXVDwzfcilgDAZ33L2G9VyCLyyVPlkB
	mdi7nOP+QoS5GoOgY9gLP+XzymqbBKJysQl+aucEGPjclfPBidX9j0azOQw4xdKccvixWjqVk+am2
	U2rjkt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAO-0000000A6U1-1MnV;
	Thu, 09 Apr 2026 09:59:16 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAK-0000000A6Q4-17zX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:13 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 1E9A320687;
	Thu,  9 Apr 2026 11:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728750;
	bh=E+DQm6KckJPpCvSQbRljrPwKFiy8QdB/i+JwiAKbMo0=; h=From:To:Subject;
	b=iVu4hRNhUbIgkyOyDEqGjPdD4NYsYhYWU3p+o7wb6z4bQ+uHOlwXDy3i6qKOhBG8r
	 92+Q5CjIhsoUHSD5CO5MNfxYQe7NuKK0WXzLfzd/Z5djXBkur+hJcxPXWfIU2MY+/6
	 WY3aLantMy5+bwhknQIGfPK5UIrOWZ9xLZw9PcSo9ljZd/j/24ZekzrSTPd6L02S1n
	 zmgkKFeRyT/vpY9x2Kb6b6O8EFqzP40dfvFmL/xccsBEUBNqiPShPxf8uQ/3oH8ZWC
	 FLeRDTxW/4F2lyJNAG9axb5wiZpm6b46Qz5MIihFMORenerDWE3YkThJmH2Ny7hidb
	 3Q7ZQ+bRFOrMw==
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
Subject: [PATCH v1 6/7] arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:52 +0200
Message-ID: <20260409095855.61252-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025912_466387_B0E40D6C 
X-CRM114-Status: UNSURE (   8.46  )
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
 .../arm64/boot/dts/freescale/imx95-verdin.dtsi | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index d3737956e2f9..72e7f1e88409 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -541,7 +541,7 @@ &lpuart7 {
 /* Verdin UART_2 */
 &lpuart8 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart8>;
+	pinctrl-0 = <&pinctrl_uart8>, <&pinctrl_uart8_cts>, <&pinctrl_uart8_rts>;
 	uart-has-rtscts;
 };
 
@@ -1058,12 +1058,20 @@ pinctrl_uart7: uart7grp {
 			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B	0x31e>; /* SODIMM 133 */
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 CTS */
+	pinctrl_uart8_cts: uart8ctsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x31e>; /* SODIMM 143 */
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_uart8_rts: uart8rtsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x31e>; /* SODIMM 141 */
+	};
+
+	/* Verdin UART_2 RX/TX */
 	pinctrl_uart8: uart8grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO12__LPUART8_TX	0x31e>, /* SODIMM 139 */
-			   <IMX95_PAD_GPIO_IO13__LPUART8_RX	0x31e>, /* SODIMM 137 */
-			   <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x31e>, /* SODIMM 143 */
-			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x31e>; /* SODIMM 141 */
+			   <IMX95_PAD_GPIO_IO13__LPUART8_RX	0x31e>; /* SODIMM 137 */
 	};
 
 	/* On-module eMMC */
-- 
2.47.3


