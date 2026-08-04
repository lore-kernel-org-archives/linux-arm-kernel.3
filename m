Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899DFC56204
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPHVfU3ckhCKpbihU/XRb/uanoYzDmA8wM7tLd6hwpY=; b=QtrQdJrzU/Hh+KgqEWCeuJAB60
	O72zeuAgZpS/IUv5/y3GFVt5gxgZHIY1qPbLYXQm3LMPVZiwMKp8XoU8dZWwKir7OZNu4/aCMeLlN
	U7WwMeOdj8/pbBqK4obAkdQn3lq9GuVPs1WOTYEGWZidVfm89oIdwrcoDBanyj1gMdod2Hq+SFiU4
	8sjt5qVvwWbx+gtcLHd3d/HwjiXrauH5QrsnqqjbaXe5UI4EyEQZ6neon5RRzn5IEk3DtwuVNLZ02
	A2C5zUKcNZrQWLgHuFEB7qygWXVynkq/AvPs/l1cFQZDM/E+Np/6bTiEqC+Jnp0oO0tbiw6+Uwyz+
	OMiRSjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3P-00000002hBU-1zti;
	Tue, 04 Aug 2026 19:43:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3K-00000002h2m-0aRN;
	Tue, 04 Aug 2026 19:43:56 +0000
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50F6435D3;
	Tue,  4 Aug 2026 21:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872562;
	bh=2roZo+O9bfs5wZlzfHNuSLLrkhZGgewmjPJGmYrBLQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SypZ/tnYmbmu60E75c5h9lWc+VFo0GGga35RYTuYVtWqKli0OFFMjM4ic4/7WwlJy
	 tb4A63WnBm93R8JToyuWk7C3ddj548UeEDQHFYzsglHx//eoiVY8EujwxdeY0hjPWm
	 uNP4+Ekj5Xvp9xkPGeD3lbotXlRoEl0GyKeK7n0M=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:34 +0100
Subject: [PATCH v4 7/7] ARM: tegra: Convert to new media orientation
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-7-336998dd63b4@ideasonboard.com>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
In-Reply-To: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
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
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=4365;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=2roZo+O9bfs5wZlzfHNuSLLrkhZGgewmjPJGmYrBLQQ=;
 b=gTMLXiSXouOoSUS3up6VvewOqXEBidSSHEnOFsVDz0zJLC5W9GJm3Qbh0rvX6jfGMPOJ88GfQ
 9CUVycukXTfC+X9JVbgIj+SzOhpZoU3W6T4duCH4nYOZVuKp3fypOq/
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_124354_386939_0CA7FF99 
X-CRM114-Status: GOOD (  12.19  )
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
v2:
 - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
---
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 892d718294dd105fcfbf290c38de74fc3f93ed6b..a7fdd194300c035317ae237dec7d45533246a3cd 100644
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
index bf1c3a31d406240f62ca13ed351c5ba3a42c83ec..76286e15684c289e648cf75c207cd454176b4689 100644
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
index 896639599c12600a1225610af0ec78f5286a8000..28680063bcc05bb2c1c69effe9ad7235c81c536a 100644
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
index 60e8a19aa70ecadb7d7a0d251ee3b12cf9ca01dc..77cab695d3da94ab5b8c46698fd6e94e03430bf0 100644
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
+			orientation = <MEDIA_ORIENTATION_BACK>;
 			rotation = <90>;
 
 			nvmem = <&m24c08>;

-- 
2.53.0


