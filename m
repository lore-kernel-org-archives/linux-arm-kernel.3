Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C45D6ACF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhtswKrs5hWgUHWTjspzoBdgsbXdHPpxNxDCoXZGs+A=; b=c9HXM8g+qMhX4OIqdy4CFJwEaM
	VR6wPkkHp/o8j6xiJkdxXbS1Q5OLYMZ0kQHzXmtXVPV/7drMJXekjwECnlb3Sd9Gq8TA2KeewTxcA
	84xY6XE/6ONug8ebklf1suTcQLzwZP131PeXzTtsObU79QOkmVg/H7uJxFQDFEd7TBVyVazzXAQJH
	Pauby0eBTIKxx6pbYjQDBwADk7qMVlt8BWvP+qIPrgidI3sVpKyIkIhTw2sPBj9aHxj1NkZ/b6vBq
	p60d2YWJM8PJug9rJrbNv8RAshH7Y4mnQwAJxErbx2znFrwleIFrUcxxiRkSYEb9oxvdN83Z2rVek
	lWCzB03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLLv-0000000DhW5-2jQM;
	Wed, 27 Nov 2024 16:57:23 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9y-0000000DfO0-0ySS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:45:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D471BFB68;
	Wed, 27 Nov 2024 17:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725900; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GhtswKrs5hWgUHWTjspzoBdgsbXdHPpxNxDCoXZGs+A=;
	b=QQPuhk0hAAXOKMhdeO7MSjXUxOA6Ht9IjSizaQMw8s28RNbRzPYFR2M/ij2ojM/L/O1DHM
	MhW3Lm9wuUCCZHwtW2gkquuufVlWMXKsHfAs/TVghYK9pjA6nSUyUaeKEQONuD8T2EtT/F
	CVedpawlZs8qEtNcBoTIVNFEhjZuViiL1VXsexyT86bx1UN6AZqyIIigSV+/Ekl4+syM6/
	qvV3doIz1YECSHiZmVkERYKt9ZBCG08sqeabwks+24EjPImgXiT0A17GbCJz1AN6+Hbudf
	b7eIaCe/1CXr+lAJ0aURETN18ujwlXU7/Us8UURR5VYq92EGqfl8UCDhzac2rw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
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
Subject: [PATCH v2 11/11] arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal
Date: Wed, 27 Nov 2024 17:42:27 +0100
Message-ID: <20241127164337.613915-12-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084502_433216_61CD990F 
X-CRM114-Status: GOOD (  13.91  )
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

This fixes the LDO5 regulator handling of the pca9450 driver by
taking the status of the SD_VSEL into account to determine which
configuration register is used for the voltage setting.

Even without this change there is no functional issue, as the code
for switching the voltage in sdhci.c currently switches both, the
VSELECT/SD_VSEL signal and the regulator voltage at the same time
and doesn't run into an invalid corner case.

We should still make sure, that we always use the correct register
when controlling the regulator. At least in U-Boot this fixes an
actual bug where the wrong IO voltage is used and it makes sure
that the correct voltage can be read from sysfs.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index e0e9f6f7616d9..b97bfeb1c30f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -311,6 +311,7 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -808,7 +809,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
 		>;
 	};
 
@@ -820,7 +821,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
 		>;
 	};
 
@@ -832,7 +833,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6 /* SDIO_A_D0 */
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
-			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x400001d0
 		>;
 	};
 
-- 
2.46.1


