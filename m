Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgXJOwqZq7z9FJdaFDvPADjYrQE6PHEqlaR7Z7XgQRw=; b=1PR/mVUCqHolW69htP6xz5+JBn
	H9A2xEOyVnXhyxJKiTS8kchSt4NQoAAHSzFzPAYHY6b+bA61Wq9d1Lr6+fpbt4vySRe6QYFbzuRxC
	QeSXgTuUF5kBMS9ZLN6fc/3s9eMzkJK/PLKCGVMjJCcKUpeLN14ba95VZdp7cFh3jyLYbiUAImXPO
	VPgWfUwyEh0Qrzj476lGp/rYXjZeSUJkCSRfaVUEDJnLBTjz815KBWLlff2Dcd7ZqrqAScc9Y1cv1
	+9j8D/B2COBn5+MEudcxJLXaqUbsgw8QtfDIXDwZMOn7e4DSWahKt8o8hXSw27S9qZ1O6mqjaxZ3Z
	dMDMHeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7cK-0000000BSmv-1XfA;
	Fri, 26 Jun 2026 14:33:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7cI-0000000BSmJ-0n8h;
	Fri, 26 Jun 2026 14:33:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA78C174;
	Fri, 26 Jun 2026 16:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782484351;
	bh=CZ0z/+7L9rBI6NAopwzlR5/H/pl2Sg7uOENYiAE89Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaYJp02L6ggXbNKJ/p2G+39jSfZv0m5HXuoGPk5gwlYg45jbwCXrNgBQABA/rtwSX
	 xHDRhxB62BtiG8pCegOGjkel7zkI0idDXw2VeWyHUqi/4jZXyDdxPGMcHS1nW7M8v5
	 aB8LSibRy+/Jc2bFx4uj682WX9fxn98nDwtTMMKI=
Date: Fri, 26 Jun 2026 17:33:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
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
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation
 definitions
Message-ID: <20260626143310.GF2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_073314_382354_C141FBC4 
X-CRM114-Status: GOOD (  16.54  )
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

On Fri, Jun 26, 2026 at 01:07:56PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the nvidia device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> index 892d718294dd..a7fdd194300c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/power/summit,smb347-charger.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -991,7 +992,7 @@ front-camera@48 {
>  			vdd-supply = <&vddio_cam>;
>  			vaa-supply = <&avdd_cam1>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> index bf1c3a31d406..76286e15684c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  #include "tegra30.dtsi"
> @@ -1262,7 +1263,7 @@ front-camera@48 {
>  			vdd-supply = <&vdd_1v8_cam>;
>  			vaa-supply = <&avdd_2v85_fcam>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> index 896639599c12..28680063bcc0 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /dts-v1/;
>  
> +#include <dt-bindings/media/video-interface-devices.h>
> +
>  #include "tegra30-lg-x3.dtsi"
>  
>  / {
> @@ -132,7 +134,7 @@ front-camera@48 {
>  			vdd-supply = <&vt_1v8_front>;
>  			vaa-supply = <&vt_2v8_front>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> index 60e8a19aa70e..c58e3026a115 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/mfd/max77620.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -1216,7 +1217,7 @@ rear-camera@10 {
>  			dvdd-supply = <&vdd_1v2_rear>;
>  			avdd-supply = <&vdd_2v7_rear>;
>  
> -			orientation = <1>; /* Rear camera */
> +			orientation = <MEDIA_ORIENTATION_REAR>;

This should be MEDIA_ORIENTATION_BACK. And you should compile all the
device trees the series touch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			rotation = <90>;
>  
>  			nvmem = <&m24c08>;

-- 
Regards,

Laurent Pinchart

