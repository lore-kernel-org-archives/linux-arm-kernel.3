Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29481C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9JUnfo3wl5UyreXFTnb+x4SWzh+eUjW68p1XzLVUpM=; b=vYsed6gfCKBrHsL6/C6s1QfDrs
	ZpJ+7bwfCh9nXPvhJnsqjR4XKppzv/KF/zWKeeEemtu9Y0lZl0rM8TLnxSbKi/3gperkWCuGxLcyv
	GUu/f4R/EpUp0meSxVplNrYFONBGgE680dn09Sf7x8lpotjqXrdgQjo5HwukebZbG/Pe50RDVjopm
	ymKz4DGrSA0Mx5uZAihBPpcnm/FvRpYsKNd89i3W4xcRaPz3s0CKgOGyOcrAtx70IjivFZL2An3OC
	9P7FxYeiZRy82Ox9R5X/FxnO41jzoSALq48D7BDGqZdKPkK/LiSjAdk7qOKcpHEcpCaLD/H1Gpje6
	6B0YU8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTf-0000000E2sz-4BBV;
	Fri, 18 Sep 2026 10:05:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTY-0000000E2nk-1Ums;
	Fri, 18 Sep 2026 10:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j9JUnfo3wl5UyreXFTnb+x4SWzh+eUjW68p1XzLVUpM=; b=EX4oW83pfv8Zu6bdanEocXB6t2
	5tGgzQ2dsYr4TnLMWvOW0/F9/QLH/M/ZDFtWgeP/5k1nSt8HyCTZU8V3hL9ca1LcPAYMq4vUR2f3S
	e9qR8+9CtPFPrZywSqjc3+REZfT3Shx2ChUg/IldhZeCvwLgYL0h9yVrb70l9MlLP0UHxaAsd4HJ3
	YykdiQCqEgxnlBOPAFQXlLY0agJvOR99790M9ArG3Jvxkx9cuVJC7j9YvjJ4iJR7SVAyhYo++d3aH
	3A5P5rPEg/cs1QFtNvY2w/JaKv/s/TjgRhEjHyNVheceTd1nr9OZFl13gEBETJHt012eCcJowfPqI
	vwX+mRlA==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VTU-00000009tr1-3Pbj;
	Fri, 18 Sep 2026 10:05:47 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDE352335;
	Fri, 18 Sep 2026 12:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789725840;
	bh=LOdjOuiDa5EMlmABS/nhDQm3v5RQfRvKfR3wfM/bt0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aMDisbTtZzsIdm0/YEWxhNd2FjnYUkDNZj6MEf8DDgeGyaQ1kvyziSB5Dbuw87bR4
	 g8MtB1QEQkD4HvdQbjbYoDhp9uw+EFiZfnRwpYWqCeee1fLbFR5MqP1q6A1L0QJCIz
	 OvZefAds7+PguLs945mX/kWAHZGJ1lsYAjXNjq9o=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:05:26 +0100
Subject: [PATCH v5 5/6] ARM: tegra: Convert to new media orientation
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v5-5-e1a134326988@ideasonboard.com>
References: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789725933; l=4149;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=Wjt5veqgt2cH3AYWBoFwcgxVrdtQEOScHWgKInDvv9w=;
 b=47ciwhYBVQQGqlk1ytCw4XkSRiCSGnTREMprq7X6AnEhLSuQhkGyxLyyVLjLOSmimL5VVJDwc
 b+AbP1DdeMqCxngv49wsTDsCxX4mTiYa1UNkk25FlOYU5+vXfVaoaKP
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_110545_176476_98F5961A 
X-CRM114-Status: GOOD (  11.98  )
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the nvidia device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
index 60e8a19aa70e..77cab695d3da 100644
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
2.52.0


