Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94309E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgASWdXNS3RqXVlA/ImzhuUR23AWDdoHokCYtEmwqDo=; b=rHY8vuLJeOCI6ZpuCziB+z/lzo
	2kqn717PNI75woM5OxrDYN33YSkADPJQzcCtU95VBL0jiNVDQ9UBHgWDc4oj0RgkyaTNvDNnSxImm
	dIrGvRcrkUy0Y+jwRvBM+vrCa3dBEDNze5cncOWTzoh8VU8Y0UbHme/3JL+VxRYsY6LraeldMLUZw
	YB5tc8ddivV/WYS8/3shBvKseF/q7h/DpAs3V8YhTnkbC8wqpR3wDrtQqdg7tlnnacf//IsmxcVh8
	9UpsNjn12BEBlDwTulKC3FLtXACChTWzAcmT+HzAPAMBLZZGw+Bt0lxbK+26kBUIIXvnX/DlFQPXK
	IoAstiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwAW-0000000H3V4-1Zum;
	Wed, 18 Dec 2024 15:41:00 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw04-0000000H1OL-0d4B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:30:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 412FBBFB05;
	Wed, 18 Dec 2024 16:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535810; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JgASWdXNS3RqXVlA/ImzhuUR23AWDdoHokCYtEmwqDo=;
	b=L20Isi2DAUo2qXpjkQIriyp7PxpAWdBObbWKlkfL2ZxkAYpaonmHa/wS1oVceOXLNgijSj
	eunGPCDTQlNVAzlgfuQbUXxJNYH3jIpj5bNaMjogZ8FvUTWSrTaHcMbN+71Qa8LuBOk21j
	ITYm+eh8UPy81F0ZtjcUW5ZyKLOwKSj9lzjzqCkIBDReC1iAfzWY9C0uUFdhucx7gdh13r
	g0qXlQgI2OmwmL2kWGj3xYax6Po1ZgxvpAAp2GHOvFwe8Swgq7nTZ2VdcQrm2ycCkYiUk4
	r+XLne08y0F4+uveZQO6XVjNWZ7yyVVC2iBTIVqkFH4h6KjmCeWUZg3iJBNJfg==
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
Subject: [PATCH v3 9/9] arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal
Date: Wed, 18 Dec 2024 16:27:32 +0100
Message-ID: <20241218152842.97483-10-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073012_346945_BA1C5925 
X-CRM114-Status: GOOD (  13.63  )
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
Changes for v3:
* Rebase to next-20241218

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
2.47.1


