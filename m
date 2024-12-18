Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CFE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MglykLElRkkNwHFoO+5brxcsZetAnMpPwRMk/KFCtsI=; b=AijDewrOfcGnrl+QGnctDcv+eH
	hZw5j+qos91xXq9o+vd025bDy/Lk1xkhuw/SfWdw1KDo3mLuKqeUtveUcEDul1SUWUPMYkxZc9foy
	9w/w3+epVlFuKD6SoWIv9p/FGIJUg0aGtF16Rxkyio82eycyfTaId5m7wo/lE0LnvDs6waZCCv6pw
	OmXbj1pT41osW4IGgomqNmO7zDHyDwyNJSHed60870CWW+jQoQ3vWSCct4IpPB5AUyrRWIpf+avib
	3feVHN1eTB2ktrvJDdid1MM6qqgVI1D52jxlxypbFWCRPWJhSETuuf9RgRn6vKY2pLxkvnKdbf9AL
	qcBecU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw9R-0000000H3GW-3Dsd;
	Wed, 18 Dec 2024 15:39:53 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvzx-0000000H1My-42mH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:30:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44960BFB6F;
	Wed, 18 Dec 2024 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535804; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MglykLElRkkNwHFoO+5brxcsZetAnMpPwRMk/KFCtsI=;
	b=nXNhE4Jme2kQOwKw3mZQU4UntRyuOOlV9OxAdxKtLX2yhxLnR8hljlcfsjv1u3j3uykP04
	VBQNfHl0seNBssUinoK4a809T/2/b6E4VO5VeoXmaFSUB2pNt2Bnegbv4TQwDR03sDAVcV
	BQgZXvQdTeBvLyxBoCOw7nHqHIUz0gjEjqkJkGnuvSTeUNCIi8/DJMSV2UuvuYVcitLbXH
	w+uNYJCE+wckImIbYTqfxMzMrpVhzl8L1lGwQd4aBr3GKVZylonzpBMFzCZmM82yTUxcVQ
	ZgyxTUNVat3bvJXx/GxJDLHb0ASchufv7GeGFYVXgYWRgpDj5UAmW0HwtUDqwQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 8/9] arm64: dts: imx93-kontron: Fix SD card IO voltage control
Date: Wed, 18 Dec 2024 16:27:31 +0100
Message-ID: <20241218152842.97483-9-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073006_147252_1243D914 
X-CRM114-Status: GOOD (  11.48  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The OSM-S i.MX93 SoM doesn't have the VSELECT signal of the USDHC
controller connected to the PMICs SD_VSEL input. Instead SD_VSEL
is hardwired to low level. Let the driver know this in order to
use the proper register for reading and writing the voltage level.

This fixes SD card access with the latest hardware revision of
the Kontron OSM-S i.MX93 SoM.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Rebase to next-20241218

Changes for v2:
* new patch
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 47c1363a2f99a..119a162070596 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -189,6 +189,7 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				nxp,sd-vsel-fixed-low;
 			};
 		};
 	};
@@ -282,6 +283,7 @@ &usdhc2 { /* OSM-S SDIO_A */
 	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	vmmc-supply = <&reg_usdhc2_vcc>;
+	vqmmc-supply = <&reg_nvcc_sd>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 };
 
@@ -553,7 +555,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x40001382 /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x40001382 /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x40001382 /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x40001382 /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -565,7 +566,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -577,7 +577,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x400013fe /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x400013fe /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x400013fe /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x400013fe /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
-- 
2.47.1


