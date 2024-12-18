Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F976E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+MEtWqv+jtuMkcOt3EU3LJknR9R8KvXbro2h2nqPjw=; b=M6IATZfw4EZU0ak5ftYqqd5Gk/
	rcbtBYBQkvAd59dCqKYCvhhn1ZCz/UGlwwmpr+qFbMgwSkFiNdRPL11zNa+8Agvmna8V8SpaSYdxv
	IhTXIkUjc5ZJWNjn64moU42B5pVzRB8nj2tQcctJ4hV4HN8pWXpvbS+L2Uux0ZqfePwJprOrvofXL
	wDjaQ1ovI4vP+6e0hgY9d6NL40qqnK0q0SYpWZ9l0inCoc0wJnbKIeYB87cx1aJZvJ9m2/IxPeWo6
	9DLvVLIq5jNinBDm4Av6rsPNg7cZhKFQ+EiojXXmbrkC303Qt9Ig2IwkJelplPNzfrB6StxG8SxHa
	2x2qA9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw0t-0000000H1Xv-31HH;
	Wed, 18 Dec 2024 15:31:03 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvzj-0000000H1HS-1TBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:29:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D80F0BFB70;
	Wed, 18 Dec 2024 16:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535786; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A+MEtWqv+jtuMkcOt3EU3LJknR9R8KvXbro2h2nqPjw=;
	b=zTTNS0Ekiu3XFX9gHx6F0jaivYzGs4wdcpgnCHwLtjWnAeINTdfGHJccOgQiDD1PGJem0R
	fzpbonJQFl94z6tF6/owTw/85uW3gRHHPN+VBNYM0+M0B2s3IqvrZHLJ8+ISIwbOMh00mv
	k1KTIKGV+e/xC0sp2q2EUIemqAWmej2woXCVxC3e3Kmp6S/8YJwgBjDiMNbQzpjlPzE0pz
	aQD8o5Pe0a5Z7jjbB/1EGSV6uZCzb2fNqfr15CuMLet8N8gAQWoNBl8vrxqraM2jl9Lo88
	/NGmGne1M+DSYtZx91mUnc+5W4Q8CNXzdPCWozo1r1gyiRlI8pcJqQt5LoCAiw==
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
Subject: [PATCH v3 2/9] arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
Date: Wed, 18 Dec 2024 16:27:25 +0100
Message-ID: <20241218152842.97483-3-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_072951_527698_63DE31D9 
X-CRM114-Status: GOOD (  10.05  )
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

The USDHC controller is able to control the IO voltage of the SD card.
There is no reason to use a GPIO to control it.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Rebase to next-20241218

Changes for v2:
* new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 59813ef8e2bb3..33031e946329d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -232,7 +232,6 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
-		sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 
 		regulators {
 			reg_vdd_soc: BUCK1 {
@@ -555,7 +554,6 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA				0x400001c3
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03			0x41
-			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04			0x41
 		>;
 	};
 
@@ -623,6 +621,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d0
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d0
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d0
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
@@ -634,6 +633,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d4
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d4
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d4
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
@@ -645,6 +645,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d6
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d6
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d6
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
-- 
2.47.1


