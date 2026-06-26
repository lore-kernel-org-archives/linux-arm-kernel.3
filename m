Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CAECDE016
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nszFh3Ga9qGiFWlQlgx+dAewcGZbOGo2FprlGnTdMgM=; b=vMcZWO58rMOtvZ9o625dvUboiM
	F4A7gI7b6TgxzbIbFyzy5OU74Njbv6g4hW1YwapzoFTzdODk/yl44gbkBlxyWWU38mXPB8SlNkkOV
	BXgIKf6085Gnncbt79QxFIRrrWzfaxydAZmBTkIYDfRrcz+xQTbx+8356pJy0mxuzZ91LLUGhVOkQ
	YjD4LNCA9XvB+LxJwJXcn4xG9S5VWGpLv5lfz0TdUQtZugfYdNj1yWkTscoHETHxSwlyh+VBOyt36
	C46MQSt33wzBguUp278vnNR8hVu40I+oM9whyVDkpCYVPwwrEOdFavDGf+p5adsWuJFm2zgyxxf+A
	1mugJgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5MB-0000000BHay-22AB;
	Fri, 26 Jun 2026 12:08:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Ls-0000000BHLR-0bMg;
	Fri, 26 Jun 2026 12:08:09 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E1671AE5;
	Fri, 26 Jun 2026 14:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782475645;
	bh=0HHSiXNFmOrdeXOhxamWpYO055wtLa35Qk5vwrPlMs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RT+Y+cYfZH2wlqLpFSYCUDT21BsTQpmpMNVt6mGxCWoO5Pe6MrCnvtlVD2ePugp4n
	 Cd/m3DGPCPQXWlrE3Dor5ejcSogK4aEDCwIlEU7PJLiwPNj0hkJEg9oUkPj+elYYy/
	 ft6TN5LcG730caKCTbodeDFs4WVju1DL9zkuUAs8=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 26 Jun 2026 13:07:56 +0100
Subject: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475679; l=4007;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=0HHSiXNFmOrdeXOhxamWpYO055wtLa35Qk5vwrPlMs4=;
 b=cOXQ7Hl+GodGt79Cbzwoe1W8LZ3vBTB0o67pkkcnCIReW+JVEmFQd7j9/zaTFf1gC/usIr/md
 0SFg5RTFRDBBf5DRfA9FEKn/6bbQT3JlVB7NCD75egi2I9oPLic17dS
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_050808_342272_43FAC10E 
X-CRM114-Status: GOOD (  11.01  )
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

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the nvidia device trees to use the new
definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 892d718294dd..a7fdd194300c 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/power/summit,smb347-charger.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -991,7 +992,7 @@ front-camera@48 {
 			vdd-supply = <&vddio_cam>;
 			vaa-supply = <&avdd_cam1>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index bf1c3a31d406..76286e15684c 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30.dtsi"
@@ -1262,7 +1263,7 @@ front-camera@48 {
 			vdd-supply = <&vdd_1v8_cam>;
 			vaa-supply = <&avdd_2v85_fcam>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 896639599c12..28680063bcc0 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/media/video-interface-devices.h>
+
 #include "tegra30-lg-x3.dtsi"
 
 / {
@@ -132,7 +134,7 @@ front-camera@48 {
 			vdd-supply = <&vt_1v8_front>;
 			vaa-supply = <&vt_2v8_front>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 60e8a19aa70e..c58e3026a115 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/mfd/max77620.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1216,7 +1217,7 @@ rear-camera@10 {
 			dvdd-supply = <&vdd_1v2_rear>;
 			avdd-supply = <&vdd_2v7_rear>;
 
-			orientation = <1>; /* Rear camera */
+			orientation = <MEDIA_ORIENTATION_REAR>;
 			rotation = <90>;
 
 			nvmem = <&m24c08>;

-- 
2.52.0


