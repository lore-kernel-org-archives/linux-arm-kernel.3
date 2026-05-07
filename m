Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C8BCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm52jc2RxHGND87DERITHVmtx/vlXa+LykfPcBly4ak=; b=0kH8N6RjzbLVnDFc1mG4bhfAqT
	IbZs5U7Gw0uHEheTgYOXz40w02i9vdUOXG24z2+w0E0GBLkkH/gJpWa+p9io4y8vi9znd5TNt840E
	7OH5SKb3sBqRYpOTZPVj4WHz/toteOQh+LYrHESm3TyvAqkd0awkF4Hj8DFo8evUuAX0A9Qh0Fagm
	AtyOFhHqwVqlV+SvHUA5DiBCnr0iizzlolmSuJoUhZvYUkVGlqWVlcztfdBzZh39suqrqPNgRRF+y
	XRQ6nHnmBt459lRuvZx9u1IjbGscZk1PEK/CCmv22DlFdfQBJ3dOyjAqTfIrw0o1XrreG1bcAMvOc
	7Sdd6D7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZI-00000002wx3-3sic;
	Thu, 07 May 2026 06:50:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZG-00000002wvx-44fa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 06:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tm52jc2RxHGND87DERITHVmtx/vlXa+LykfPcBly4ak=; b=OvUOCU69cUcttZpYZPnGbBn/7C
	aARuDKdK9UCqNJnny+pYcEynVzFsebTtW6MnlSfXuQKzEo8fuKn9jlZLvEYh30dXxtESA/pL9aIGV
	7AbJ25FZ+0V1cT/Uu6PvVZspQup3cMZb07CFM6c77QlCLN6If+v7Lg+dj2QwVrjBVfVcDfweWw6iV
	Edy3SSfOUyyNd81czSRuT64KlQh/+pUF82clZdIbtaI1IfUCFkYQqv+1cQkTEGMPLpEJHbt0fMB4h
	QkcoINm3tNQoCwI2cAVGZJ+nlZdWzmztpjQEvwdbV3qMhVOb0y/oqiNG3HAl+ABAZYAELQo4wDYIl
	nD2Mqqaw==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZC-00000002k6E-3uYS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Tm52jc2RxHGND87DERITHVmtx/vlXa+LykfPcBly4ak=; b=OmfHirpDm7jL0+ITFDLPNzb69t
	tB1rf99X3ftZuBZBPKolIGgqMP0b6Bo+FLppvav1OrRwYKFl6sAPUScNc5GcTsXeS7+GQ8iC33Kwe
	Nge/E8MLQy41YOB0RaC4AajkPNN8ZepmKObd9AMnuTZ9mJiY6V0BF29VzKUVw/HQQzgSue0IoVCsp
	S8US5sbDZt7KFlq8ZPijBMy1J8601+DiOHP2AXkGe24YxxprCr9bye8Z5QKAJRZeHg6APwQ5PeXZC
	XMMjJ8HCrir30ApufUIu1Pa9NKRQ+KQEPqiCpBVoWtWm+ZV/qgK4CmrsvXdWzHVNc4xOGEdMV5zDG
	5S+6qgOg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40514 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wKs6Y-0000000AGWs-3xYq;
	Thu, 07 May 2026 08:21:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 3/3] arm64: dts: freescale: imx{91,93}-phycore-som: Improve USDHC signals
Date: Thu,  7 May 2026 08:20:58 +0200
Message-Id: <20260507062058.1711292-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062058.1711292-1-primoz.fiser@norik.com>
References: <20260507062058.1711292-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075039_537841_A5C81995 
X-CRM114-Status: UNSURE (   5.63  )
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

From: Christoph Stoidner <c.stoidner@phytec.de>

Apply improved drive-strength values and pull-up/down configurations as
devised from hardware measurements to improve signal quality on PHYTEC
phyCORE-i.MX 91/93 SoM based boards. Also improve eMMC HS400 mode by
setting property "fsl,strobe-dll-delay-target" which shifts the strobe
DLL sampling window to the optimal position.

Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx91-phyboard-segin.dts     |  6 +++---
 .../arm64/boot/dts/freescale/imx91-phycore-som.dtsi | 13 +++++++------
 .../boot/dts/freescale/imx93-phyboard-nash.dts      |  8 ++++----
 .../boot/dts/freescale/imx93-phyboard-segin.dts     |  6 +++---
 .../arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 13 +++++++------
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
index 7b18a58024f5..aec83da87c4e 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
@@ -309,7 +309,7 @@ MX91_PAD_SD2_CD_B__GPIO3_IO0		0x31e
 
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x1382
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x1386
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -321,7 +321,7 @@ MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x139e
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -333,7 +333,7 @@ MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x138e
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x139e
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x139e
diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 8038d92da2aa..d9397080fe48 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -194,6 +194,7 @@ &usdhc1 {
 	bus-width = <8>;
 	non-removable;
 	no-1-8-v;
+	fsl,strobe-dll-delay-target = <1>;
 	status = "okay";
 };
 
@@ -252,7 +253,7 @@ MX91_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x179e
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x119e
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x1386
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
@@ -262,13 +263,13 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x139e
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x139e
@@ -278,13 +279,13 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x139e
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x139e
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x139e
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x139e
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x139e
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x139e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x13be
@@ -294,7 +295,7 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x13be
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x13be
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x13be
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x13be
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index eac389ed30f3..a7bd490b042b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -339,8 +339,8 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000178e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001386
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001386
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001386
@@ -352,7 +352,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
@@ -365,7 +365,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index a982606de1ee..291b409b159f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -310,7 +310,7 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
@@ -323,7 +323,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
@@ -336,7 +336,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index a624aed48efe..4276140afb5c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,6 +196,7 @@ &usdhc1 {
 	bus-width = <8>;
 	non-removable;
 	no-1-8-v;
+	fsl,strobe-dll-delay-target = <1>;
 	status = "okay";
 };
 
@@ -255,7 +256,7 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x119e
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
@@ -265,14 +266,14 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
@@ -282,14 +283,14 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
@@ -299,7 +300,7 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
-- 
2.34.1


