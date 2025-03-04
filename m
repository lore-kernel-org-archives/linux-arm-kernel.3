Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A75C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wATod6NDOZo61jBXaDR35smZE6WmaKYxcn9zydFDCSg=; b=Wz1DNTvhwNT1H0jevQly6JzMTv
	bbn3tUyVz/n84o9G5/K4lK7+Ug86kt7b78Oa69WIHxMdMuc5glCcFuXjkeMXE5NyB2xxRvrJCH6Ns
	zA06kyaw+lVja8/OEh+If/iraAUpzEKjVkBhGOkrXXyh1HxZYV6jqqQNlrKqtb39vUpKnjcNRQEL3
	GrxawZBr68pyHu0GAEt7i66aNjncA1schPK1eE7yyukrRbNkVihColM8/EIq9Wa7HpQ7/jG42Ky+j
	noh5MxXLqR29OjNJSLyTkWImIgbOhzMtWScHQMB80PF4B9r1RDLThnihhOfxauWEOL0z+hLyxyZur
	sNYmSVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYQI-000000068Dy-1i0Q;
	Tue, 04 Mar 2025 19:59:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY8u-000000064HS-0CC1;
	Tue, 04 Mar 2025 19:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741117288; x=1772653288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mSXJN62c9c43TayjWMcrZoUoqbOEtw2eHIrrgusAkcQ=;
  b=n3ifJmcUUbwT6WGY6Zzn8Fc+uGzUOKpWQpIVpphUJ8b4lBpdtYsVuMp7
   gOUrtPLkHdtZf9LA1Zcgv0cem00e2mHxk1j45ZyFCx5fiNnVjTsU1qMpc
   2g8VxZfwUoKqeWPQBIfE4X5+e9NN+1XjzJmPolpSWubwDTjzg46qPGs5D
   wCCOs/Ra1ZQhlA6w4MrzB4jyDANXHqBM+mLxs1J8kjnN0dG/9yOxYuSiX
   9Jroc1dE9PnrJ191PopR7PV2frOctLOv7J05QzwvgYRJKDwWv6fqDxEhT
   Qr8blbVzVgF3G+dlSlf3nRYkaQjszdnHYj/OzWETwJ73lwBR29lp409Oe
   g==;
X-CSE-ConnectionGUID: 0LIxnIhFQ4ap3/oyNiMUJw==
X-CSE-MsgGUID: fHUpDJFATwS01TO8IelmOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41235961"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="41235961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:41:27 -0800
X-CSE-ConnectionGUID: U8VV1OeURqOA6GR9LDuIIQ==
X-CSE-MsgGUID: EHHSAZjkRsupzERpxCndxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119369326"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.231])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:41:22 -0800
Date: Tue, 4 Mar 2025 20:41:14 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 06/11] media: rockchip: rkcif: add driver for mipi
 csi-2 host
Message-ID: <3fztpczfxlfzt3bdll4alzllrrqvvr3akhkiqtmtam2v2sbw2y@6hb3aok7h62x>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_114128_095507_A18B32C7 
X-CRM114-Status: GOOD (  23.59  )
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

Hi Michael,

thank you for the patches.

Sorry for the big delay!

On Wed, Feb 19, 2025 at 11:16:37AM +0100, Michael Riesch wrote:
> The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
> and one output port. It receives the data with the help of an external
> MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video
> Capture (VICAP) block. Add a V4L2 subdevice driver for this unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>  .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 +++++++++++++++++++++
>  2 files changed, 732 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> index 818424972c7b..0c18efd1f1b4 100644
> --- a/drivers/media/platform/rockchip/rkcif/Makefile
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -4,4 +4,5 @@ rockchip-cif-objs += rkcif-dev.o \
>  	rkcif-capture-dvp.o \
>  	rkcif-capture-mipi.o \
>  	rkcif-interface.o \
> +	rkcif-mipi-csi-host.o \

[..]

>  	rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
> new file mode 100644
> index 000000000000..fa3f42b2dc55

SNIP

> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
> +
> +static struct platform_driver rkcif_csi_drv = {
> +	.driver = {
> +		   .name = "rockchip-mipi-csi",
> +		   .of_match_table = rkcif_csi_of_match,
> +		   .pm = &rkcif_csi_pm_ops,
> +	},
> +	.probe = rkcif_csi_probe,
> +	.remove = rkcif_csi_remove,
> +};
> +module_platform_driver(rkcif_csi_drv);

[..]

When adding the driver for this CSI-2 Host bridge, you added another
call to  module_platform_driver()

but in the definition of this macro:

"Each module may only use this macro once, and
calling it replaces module_init() and module_exit()"

and as you can see in the diff of the Makefile,
rkcif-mipi-csi-host.0 is part of the same module as rkcif-dev.o, where
you already call module_platform_driver()

I think the solution here is to call
platform_register_drivers(drivers, ARRAY_SIZE(drivers)) in rkcif-dev.c

with

static struct platform_driver * const drivers[] = {
	&rkcif_csi_drv,
	&rkcif_plat_drv,
};

then define module_init() and module_exit()

Btw. MODULE_DEVICE_TABLE() is missing both here and in rkcif-dev.c

> +
> +MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Host platform driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

--
Kind Regards
Mehdi Djait

