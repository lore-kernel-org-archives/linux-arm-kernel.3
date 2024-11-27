Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96A9D6ACF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zl3FVHQMKuhP3XVJBG/Ttr48W93+v0BfVf6Zw4g7fc=; b=VOFsH1NRKUeCDc1aORPU7uLqHw
	NuA8yM2X/36gJ/Xogg1AaqNjiWqWAswt+h08AZ9qNHRC2idZlJ2QUIykurnIUgadFRbvwTACQ7kXP
	bxZWAWabb0DSuuYaoWndxZIZppo50kZIqm3fAETPf9DUtWK3BBjwHPQgWD78dySo0WQc0uLiOMHOF
	HxB6mVjJjYsvAb6cDhkKUFKQwgNtr1L5IImWXaaub/QdISEnI04P7eLAx+Im52T3nPqZsx8rBVnIu
	PVFWza3KlpdOaMNzhwuW3F3Y/dmFfFJ2dxLN3iOxqH6dLZMSakJwFT/WqQ0MfE6GUU4Xa9SlRtEOO
	AxlOdleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLJ6-0000000DhCB-0qbA;
	Wed, 27 Nov 2024 16:54:28 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9n-0000000DfIu-2bJn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C01BEBFB93;
	Wed, 27 Nov 2024 17:44:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7zl3FVHQMKuhP3XVJBG/Ttr48W93+v0BfVf6Zw4g7fc=;
	b=dEM1yq0jm86SeDL3LgsMmo8o8DyGwbeDsnltKY2YZ2vqhEAtUFHm+zfOObUWy42IiZuvmz
	xoZcLo51owZKhNeu/APDsSbmQ1dncvJqm5OPpBZ6x2j3BzrgSFdPe5bhEYDF2y3kJhcJdD
	fe+Sa5iPBsjulub/Ui/fEZVHN+7TH2Z1j8P4jU0LSi1QRniY3SEq/6AjMXhIeG4uZou0uX
	T1JWQWErldLCAHGbbKjNE4ikIYiVlyKKwYpR4H1psxCSrbxMA5V02PVKDd+eD0Avyt+dl9
	WsMz/eNxiHEr+afpYj/BgWXY/MU8svW8dpYl+aWeyGHiLAtYIimWdeyAbccyRg==
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
Subject: [PATCH v2 09/11] arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
Date: Wed, 27 Nov 2024 17:42:25 +0100
Message-ID: <20241127164337.613915-10-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084451_954546_1D49CF98 
X-CRM114-Status: GOOD (  14.94  )
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
* rebase to current master
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts    | 10 +++++++---
 .../arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 ++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index a8ef4fba16a9e..d16490d876874 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -254,6 +254,10 @@ &pwm2 {
 	status = "okay";
 };
 
+&reg_nvcc_sd {
+	sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -454,7 +458,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 
@@ -467,7 +471,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 
@@ -480,7 +484,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 663ae52b48526..d455429652305 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -342,6 +342,7 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -794,7 +795,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
@@ -807,7 +808,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
@@ -820,7 +821,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
-- 
2.46.1


