Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889A4C79FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApdltZkRhsVxOKrNUqqL3XcAJ2zFJ2RCffIpIs58H/g=; b=wauhJRAtVUmVpd8WvCOGNUwviS
	h0TX9RFOMFHWeuvuh2sBF5z+pLAlwrMdDceHswFISg2cjJ3XqODkrZyn0BbBppWnJ7m0yCZFC77hu
	ExP7OxZO1QawdpRt8l44222RHj3XgZxyCH1RE6XS1pGlCILHYrcwMAJxO6Jzd/CHjsJ5ErG2GQT0D
	vVNLYdd6wfIyHwuk4f7TzET1QkJCphgKHkLVjoQazIBItrG6Z+p4Bi03ROopNH3fsITDPdqhGybvP
	lsfHfZYVHUDw+0bMi5iTGWNQoHnnUuERTI3LbfYIwcphDa2+Rpe4T0GOz32k/ktYe6bjee6vMyAOq
	p7OY2k/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGC-00000009Bb8-1Zxr;
	Tue, 08 Sep 2026 13:53:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGA-00000009BaG-3Wxa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ApdltZkRhsVxOKrNUqqL3XcAJ2zFJ2RCffIpIs58H/g=; b=oOC7PSgaHgFgd769ZKa8wV+7UV
	f4VQuX+v3FFJqYuuIRbJh4qSdTcztqLHphV67sTHhQx5r3S4vK9EZVRiWTb7AKlm0fCZNf6Y5qtFr
	tl3PyP+0Mjag5HJjmFXt+693dx8vTq9eRZhU0Fs3MI8GYOiAOT96qJH59XR+RTHh+qBWA6VXFrTge
	J0pdQNe7O0Ac+iI+dNvkxO08ZLinElnxMfA0asdnMZaOhlMvelwyVRwWSMJ4WLf/JKff8wzvTHwpz
	4X9zrtI0Ngo8bXk/2bTSrJCjnzkjnj6r8/JTM7eSIWI+O/VPFT7xmYvnHOoSS+gWmL77AhhvNe6Ru
	UXd43zcQ==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wG7-0000000HUeJ-3quJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:13 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ApdltZkRhsVxOKrNUqqL3XcAJ2zFJ2RCffIpIs58H/g=;
	b=sYrdQZB9HA8jXyruuTDBKFVyfdSFZ8mdvmILkAF57uRcHsvbmYV1I3LHfKltg21rNtnUGZ
	8mbUV9TmQGZrbrwfx2n4jVheQX6FUp+XcpP9KKug7u5wUgvMWSiPW5ZKHvn3OxJJ9Klm27
	TgE1BB6Sg/n/dbBDQ8ClR0qa1s4YJA6wcZbeVR6Orbbzmc6McWqd3gN+URBysVO2gXiHbz
	P+4GlzRN3OpfjbyaTj9VgFdsObjEIZnjvQmi+UHqr6shM/QGfOP0SJwaLxKZJy+Oe9pJNy
	fWEVAd2kkEwktmAm2Hm+f1v8eY0nd7N9uMTxJNbMhQv1JfpOoLajINYYDALDyg==
Date: Tue, 08 Sep 2026 15:51:48 +0200
Subject: [PATCH 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with
 DIP switch GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Eberhard Stoll <eberhard.stoll@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=AE7Nzyaxb6x1i6gLi1eAISRF4DYohgutdzU1pqO/mwQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsJOJ992Mvc+f7s8PP8R3S0Z/urGOmXIut43UBNcrS
 v4TSws7SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJqJXz/DPtv9ODGOyZ7ZtgUJF
 lkDvRu1fr6rkHnrt2ncpT3/6jcrPjAyTS0vc5z+Oc3aXZp+m8+yw07NQ/bPmXlIfFiQ9iK+5K8Y
 HAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145312_187824_B4D12551 
X-CRM114-Status: GOOD (  11.24  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The latest board revision has DIP switches and lacks UART3 instead.
As the old revision has long been deprecated and not maintained
anymore, drop the support and reflect the current state of the
hardware. As the old revision hasn't been widely used, UART3 was
only available through an obscure extension connector and we have
carried this patch downstream for years, no users are expected to
be affected by this change.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi  | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index f4c45e964daf..a71669bef7d4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -172,13 +172,6 @@ &uart2 {
 	status = "okay";
 };
 
-&uart3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart3>;
-	uart-has-rtscts;
-	status = "okay";
-};
-
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
@@ -283,6 +276,11 @@ MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0	/* DOUT1 */
 			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* DIN1 */
 			MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x1b0b0	/* DOUT2 */
 			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0	/* DIN2 */
+
+			MX6UL_PAD_UART3_TX_DATA__GPIO1_IO24	0x1b0b0	/* CAN_ADR0 (DIP sw 1) */
+			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* CAN_ADR1 (DIP sw 2) */
+			MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0	/* CAN_ADR2 (DIP sw 3) */
+			MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x1b0b0	/* CAN_ADR3 (DIP sw 4) */
 		>;
 	};
 
@@ -334,15 +332,6 @@ MX6UL_PAD_NAND_DATA07__UART2_DCE_RTS	0x1b0b1
 		>;
 	};
 
-	pinctrl_uart3: uart3grp {
-		fsl,pins = <
-			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
-			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
-			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
-			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
-		>;
-	};
-
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1

-- 
2.55.0


