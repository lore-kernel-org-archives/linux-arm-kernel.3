Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1733C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMWBZw6MaYdMzW8IhV010AIuCc/bId+aXKm3E4ztfLk=; b=Gbg3jvUJ2HclADTkwhwxsHDE/E
	WRQ6nCXjC94D9XRaiOB8TrRSqGhXP7cfaEUBmunXGYdKRKHRxNh0Q4Dkh+FpAAl//XA+A9d8R6k2/
	7hS4E12PaZogzFrS9ClaSqoBMWdBHXbK442d7RADno5gzjrCrBWsS7n5Vk03sG9URi/Ub67Zpey2R
	nmuIBbNOBogFxOTJyAFIwjdpyI8fjOfYzeWk1x3l2bYhI97Moqf7LPaI3shaQRcc3sA3F1vJfrgQg
	1YK9DiRxw5lWNB0scKzjhvh9+IiGgUA9c2iBMWl7zKJBwB9ECgZLEQIPVludtLO+/peCCZyXKiiuC
	wxoZsedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7dy-0000000BT5h-4BxV;
	Fri, 26 Jun 2026 14:34:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7dw-0000000BT4v-0iew;
	Fri, 26 Jun 2026 14:34:57 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8306AE2C;
	Fri, 26 Jun 2026 16:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782484453;
	bh=UGXXFQRGSKo2cXSGjWLUkw5C2Nn/39vXlo3eOhESb+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pk++YKR7AU80RrEqPod34Ls8DJUeEUMMNFe0LBjVUoVPNAr2I5n3sd4utdgRJLCcB
	 Le075QkWk97tkLJ458yvmCECh5Zko8pDvLogbtfQ72m02cqfu+JoEpkWQozVGZaGe/
	 cUeXbFxqKbMEDj7nINS1DGzpRpIFEG/YSanJJdc4=
Date: Fri, 26 Jun 2026 17:34:53 +0300
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
	linux-rockchip@lists.infradead.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
Message-ID: <20260626143453.GI2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_073456_360723_B5822873 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Jun 26, 2026 at 01:07:59PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the renesas device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> index 3acaf714cf24..b816382bba0a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j1: clk-cam-j1 {
> @@ -44,7 +45,7 @@ cam@10 {
>  		VDIG-supply = <&reg_cam_j1>;
>  		VDDL-supply = <&reg_cam_j1>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> index a19bc0840392..4019b80a88b7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j1: clk-cam-j1 {
> @@ -46,7 +47,7 @@ cam@1a {
>  		vdda-supply = <&reg_cam_j1>;
>  		vddd-supply = <&reg_cam_j1>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> index 512810b861aa..fea1ef4a1178 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j2: clk-cam-j2 {
> @@ -44,7 +45,7 @@ cam@10 {
>  		VDIG-supply = <&reg_cam_j2>;
>  		VDDL-supply = <&reg_cam_j2>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> index a31524b59834..177201a8a6d2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j2: clk-cam-j2 {
> @@ -46,7 +47,7 @@ cam@1a {
>  		vdda-supply = <&reg_cam_j2>;
>  		vddd-supply = <&reg_cam_j2>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {

-- 
Regards,

Laurent Pinchart

