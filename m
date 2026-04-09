Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE6E98FDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rilisu3ZqruoV1nzBO4jO5k4MVTLVZBUuqa+slZBBfA=; b=n+s1XCfwjyioEJWLb5LQnqSJDM
	T7i5mO1yGVkCUCO/4+gc6rLj6jdcM9P7MHB20M7FgGVNKJ0CcqM5anhc9oeRzpMCW7u7rEMZ07Ytr
	VuhFOAZDPM6KGKVR1yX4sseD0AfBWPYeQ95PJHNJnmYzQ5hGsH7Ohdi0rpnkKo7MuVeUsk+7hPfYc
	GkhPRJUKDk1sLP4zuoE09D3YI+FsYetecd1CnxCwor0mBqTjDh8Gq3hFnyHl2ZPSKX+TfI9EB3tpP
	dlbanKES2F+Q6Pz06PiKe7WnLJVXs1VEg6xQ9GRh0FZzI+z+IOqL3Qi4RyZDGti/p7LmQ+zJGU1wF
	UI9ZR1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAK-0000000A6R1-2VhD;
	Thu, 09 Apr 2026 09:59:12 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAH-0000000A6P0-2SLy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:10 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 6771220379;
	Thu,  9 Apr 2026 11:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728747;
	bh=rilisu3ZqruoV1nzBO4jO5k4MVTLVZBUuqa+slZBBfA=; h=From:To:Subject;
	b=b8g3NX1NdIjgOoXZ6fdu3FWRYHasMPjj4kAp0KYM1J8VKJEZsX6ko8EfHKKWHnUX7
	 MnIc2bu/xa6VmHq6xA0Zf8+a+iGbvqv5U/t8XKQFHJB6iKyeOUf5h7K1VRE/6elveH
	 8FBfY4IMwJyJTq7aSAjjG8mQ11riCrUG76Xkpgi/7pU0gnF2li40EySXzA87kdDHA3
	 7fESurPu/nv56qw6Z3WVKS65twNmBlCTR1y+X7tO02IP6h6EFD5r0GbHLWkGbek0Gt
	 p/3yqSw/3XSjuGWszM9o/qJfx32+i/KjShVHdoSOLSG7F5SirGbUaxlCyYE7k+APbW
	 UOtxrm8/tdVhw==
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
Subject: [PATCH v1 2/7] arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:48 +0200
Message-ID: <20260409095855.61252-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025909_779391_E7B91A7E 
X-CRM114-Status: UNSURE (   7.79  )
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
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1594ce9182a5..5fc177f589cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -735,7 +735,7 @@ &uart2 {
 /* Verdin UART_2 */
 &uart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_uart3_cts>, <&pinctrl_uart3_rts>;
 	uart-has-rtscts;
 };
 
@@ -1144,12 +1144,20 @@ pinctrl_uart2: uart2grp {
 			<MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x146>;	/* SODIMM 129 */
 	};
 
+	pinctrl_uart3_cts: uart3ctsgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B	0x146>;	/* SODIMM 143 */
+	};
+
+	pinctrl_uart3_rts: uart3rtsgrp {
+		fsl,pins =
+			<MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x146>;	/* SODIMM 141 */
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins =
-			<MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x146>,	/* SODIMM 141 */
 			<MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x146>,	/* SODIMM 139 */
-			<MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x146>,	/* SODIMM 137 */
-			<MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B	0x146>;	/* SODIMM 143 */
+			<MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x146>;	/* SODIMM 137 */
 	};
 
 	pinctrl_uart4: uart4grp {
-- 
2.47.3


