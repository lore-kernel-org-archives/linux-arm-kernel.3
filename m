Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6220DCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGstWPR7c1VC1Ecy7nFORD38QY5nvebaQlN9p58vCz4=; b=k2nPnS0CKUshjP6zFqP5UdFMfd
	HiSR/+mesjaxt8ruqI0JOy9JMdJZN6m8sdhZMWpa/6+FIt6TvPMlahWDunIiHp6hHPrJHLbXxLqbw
	9KFnh9eZEotg1i4LRKTSdiEXsDAxXOK0/nOVtV4pgzYZ4YajW7KkcL7xr9U2qJQSizhxtLVCIQtO1
	dRuMO0I79je0K/4EqZjm4QG+lRd+g3heDIsd/ANoxdlvsFHH1TOUGVIsUb8II1lKsDxXL52e5rIHt
	aawi2ic5wXdtSNfaMl5UcpOMmYMdhvSfLzX1dM9nRJbT37nT4566c6RibmvXU2Q0OlYVTqK0PIZVc
	GlJKMaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeaT-00000002tf5-0iOH;
	Sat, 08 Nov 2025 08:46:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHeaQ-00000002tcr-31j8;
	Sat, 08 Nov 2025 08:46:20 +0000
Received: from ideasonboard.com (mob-5-90-142-135.net.vodafone.it [5.90.142.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E81E8A8F;
	Sat,  8 Nov 2025 09:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762591458;
	bh=5f9LLR2G5PjtiaSZgbdwtMDFj6zttyrTMGNkNYlOtFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXDIwjeKo1Xa20m4bm+sG9QKg04n6meFCVclWUEfYbuqVDy57Nnnpd5Cy+UM/tOlH
	 ZX5JW4sLth1DJGhfUqgI5VCUh8CCDYcGR1lniTPN5h0npg2WRSNpfvWuZroQ0ia/+G
	 V/koM0zsfmqJvcgg6hAa7NT/7O+0OpvyEyCqzChU=
Date: Sat, 8 Nov 2025 09:46:10 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Antoine Bouyer <antoine.bouyer@nxp.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 6/8] media: rkisp1: Use v4l2-isp for validation
Message-ID: <tkgroszon7wi43jvmte5vylbxdn7oafm665weecztkfguqhu6c@mw24ipqvwxou>
References: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
 <20251020-extensible-parameters-validation-v8-6-afba4ba7b42d@ideasonboard.com>
 <20251107231818.GH5558@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107231818.GH5558@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_004619_043666_54B9922B 
X-CRM114-Status: GOOD (  32.02  )
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

Hi Laurent

On Sat, Nov 08, 2025 at 01:18:18AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Oct 20, 2025 at 10:24:52AM +0200, Jacopo Mondi wrote:
> > Convert rkisp1-params.c to use the helpers defined in v4l2-isp.h
> > to perform validation of a ISP parameters buffer.
> >
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
> >  2 files changed, 77 insertions(+), 107 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
> > index 731c9acbf6efa33188617204d441fb0ea59adebc..f53eb1f3f3e7003d8e02c9236aeabb5ae8844f7b 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/Kconfig
> > +++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
> > @@ -10,6 +10,7 @@ config VIDEO_ROCKCHIP_ISP1
> >  	select VIDEOBUF2_VMALLOC
> >  	select V4L2_FWNODE
> >  	select GENERIC_PHY_MIPI_DPHY
> > +	select V4L2_ISP
> >  	default n
> >  	help
> >  	  Enable this to support the Image Signal Processing (ISP) module
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index f1585f8fa0f478304f74317fd9dd09199c94ec82..a880a46d2eefefc6474b36dc5aa69b4f3dce51d1 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -12,6 +12,7 @@
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-isp.h>
> >  #include <media/videobuf2-core.h>
> >  #include <media/videobuf2-vmalloc.h>	/* for ISP params */
> >
> > @@ -2097,122 +2098,166 @@ typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> >  			     const union rkisp1_ext_params_config *config);
> >
> >  static const struct rkisp1_ext_params_handler {
> > -	size_t size;
> >  	rkisp1_block_handler handler;
> >  	unsigned int group;
> >  	unsigned int features;
> >  } rkisp1_ext_params_handlers[] = {
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> >  		.handler	= rkisp1_ext_params_bls,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  		.features       = RKISP1_FEATURE_BLS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> >  		.handler	= rkisp1_ext_params_dpcc,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
> >  		.handler	= rkisp1_ext_params_sdg,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
> >  		.handler	= rkisp1_ext_params_awbg,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_flt_config),
> >  		.handler	= rkisp1_ext_params_flt,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
> >  		.handler	= rkisp1_ext_params_bdm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
> >  		.handler	= rkisp1_ext_params_ctk,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_goc_config),
> >  		.handler	= rkisp1_ext_params_goc,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
> >  		.handler	= rkisp1_ext_params_dpf,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
> >  		.handler	= rkisp1_ext_params_dpfs,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
> >  		.handler	= rkisp1_ext_params_cproc,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_ie_config),
> >  		.handler	= rkisp1_ext_params_ie,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
> >  		.handler	= rkisp1_ext_params_lsc,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
> >  		.handler	= rkisp1_ext_params_awbm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_hst_config),
> >  		.handler	= rkisp1_ext_params_hstm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_aec_config),
> >  		.handler	= rkisp1_ext_params_aecm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_afc_config),
> >  		.handler	= rkisp1_ext_params_afcm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
> >  		.handler	= rkisp1_ext_params_compand_bls,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  		.features	= RKISP1_FEATURE_COMPAND,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> >  		.handler	= rkisp1_ext_params_compand_expand,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  		.features	= RKISP1_FEATURE_COMPAND,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> >  		.handler	= rkisp1_ext_params_compand_compress,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  		.features	= RKISP1_FEATURE_COMPAND,
> >  	},
> >  	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
> > -		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
> >  		.handler	= rkisp1_ext_params_wdr,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> >  };
> >
> > +static const struct v4l2_isp_params_block_info rkisp1_ext_params_blocks_info[] = {
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_bls_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_flt_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_goc_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_ie_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_hst_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_aec_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_afc_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
> > +	},
>
> We could make this more compact with
>
> #define RKISP1_PARAMS_BLOCK_INFO(block, data) \
> 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_ ## block] = { \
> 		.size = sizeof(struct rkisp1_ext_params_ ## data ## _config), \
> 	}
>
> 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
> 	RKISP1_PARAMS_BLOCK_INFO(DPCC, dpcc),
> 	RKISP1_PARAMS_BLOCK_INFO(SDG, sdg),
> 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
> 	RKISP1_PARAMS_BLOCK_INFO(FLT, flt),
> 	RKISP1_PARAMS_BLOCK_INFO(BDM, bdm),
> 	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
> 	RKISP1_PARAMS_BLOCK_INFO(GOC, goc),
> 	RKISP1_PARAMS_BLOCK_INFO(DPF, dpf),
> 	RKISP1_PARAMS_BLOCK_INFO(DPF_STRENGTH, dpf_strength),
> 	RKISP1_PARAMS_BLOCK_INFO(CPROC, cproc),
> 	RKISP1_PARAMS_BLOCK_INFO(IE, ie),
> 	RKISP1_PARAMS_BLOCK_INFO(LSC, lsc),
> 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
> 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
> 	RKISP1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
> 	RKISP1_PARAMS_BLOCK_INFO(AFC_MEAS, afc),
> 	RKISP1_PARAMS_BLOCK_INFO(COMPAND_BLS, compand_bls),
> 	RKISP1_PARAMS_BLOCK_INFO(COMPAND_EXPAND, compand_curve),
> 	RKISP1_PARAMS_BLOCK_INFO(COMPAND_COMPRESS, compand_curve),
> 	RKISP1_PARAMS_BLOCK_INFO(WDR, wdr),
>
> It helped me quickly visualize that the block types and data types
> matched, so I think it could help reviews when adding new blocks.
>
> This can also be done in a patch on top. Same for the c3-isp driver.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Nicer, thanks.

I've also added (here and in the C3 driver)

static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) ==
              ARRAY_SIZE(rkisp1_ext_params_blocks_info));

>
> > +};
> > +
> >  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> >  				     struct rkisp1_ext_params_cfg *cfg,
> >  				     u32 block_group_mask)
> > @@ -2646,31 +2691,16 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
> >  {
> >  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> >  	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
> > -	size_t header_size = offsetof(struct rkisp1_ext_params_cfg, data);
> >  	struct rkisp1_ext_params_cfg *cfg = params_buf->cfg;
> >  	size_t payload_size = vb2_get_plane_payload(vb, 0);
> >  	struct rkisp1_ext_params_cfg *usr_cfg =
> >  		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> > -	size_t block_offset = 0;
> > -	size_t cfg_size;
> > -
> > -	/*
> > -	 * Validate the buffer payload size before copying the parameters. The
> > -	 * payload has to be smaller than the destination buffer size and larger
> > -	 * than the header size.
> > -	 */
> > -	if (payload_size > params->metafmt->buffersize) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Too large buffer payload size %zu\n", payload_size);
> > -		return -EINVAL;
> > -	}
> > +	int ret;
> >
> > -	if (payload_size < header_size) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Buffer payload %zu smaller than header size %zu\n",
> > -			payload_size, header_size);
> > -		return -EINVAL;
> > -	}
> > +	ret = v4l2_isp_params_validate_buffer_size(params->rkisp1->dev, vb,
> > +						   params->metafmt->buffersize);
> > +	if (ret)
> > +		return ret;
> >
> >  	/*
> >  	 * Copy the parameters buffer to the internal scratch buffer to avoid
> > @@ -2678,71 +2708,10 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
> >  	 */
> >  	memcpy(cfg, usr_cfg, payload_size);
> >
> > -	/* Only v1 is supported at the moment. */
> > -	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Unsupported extensible format version: %u\n",
> > -			cfg->version);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/* Validate the size reported in the parameters buffer header. */
> > -	cfg_size = header_size + cfg->data_size;
> > -	if (cfg_size != payload_size) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Data size %zu different than buffer payload size %zu\n",
> > -			cfg_size, payload_size);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/* Walk the list of parameter blocks and validate them. */
> > -	cfg_size = cfg->data_size;
> > -	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
> > -		const struct rkisp1_ext_params_block_header *block;
> > -		const struct rkisp1_ext_params_handler *handler;
> > -
> > -		block = (const struct rkisp1_ext_params_block_header *)
> > -			&cfg->data[block_offset];
> > -
> > -		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Invalid parameters block type\n");
> > -			return -EINVAL;
> > -		}
> > -
> > -		if (block->size > cfg_size) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Premature end of parameters data\n");
> > -			return -EINVAL;
> > -		}
> > -
> > -		if ((block->flags & (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
> > -				     RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) ==
> > -		   (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
> > -		    RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Invalid parameters block flags\n");
> > -			return -EINVAL;
> > -		}
> > -
> > -		handler = &rkisp1_ext_params_handlers[block->type];
> > -		if (block->size != handler->size) {
> > -			dev_dbg(params->rkisp1->dev,
> > -				"Invalid parameters block size\n");
> > -			return -EINVAL;
> > -		}
> > -
> > -		block_offset += block->size;
> > -		cfg_size -= block->size;
> > -	}
> > -
> > -	if (cfg_size) {
> > -		dev_dbg(params->rkisp1->dev,
> > -			"Unexpected data after the parameters buffer end\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > +	return v4l2_isp_params_validate_buffer(params->rkisp1->dev, vb,
> > +				(struct v4l2_isp_params_buffer *)cfg,
> > +				rkisp1_ext_params_blocks_info,
> > +				ARRAY_SIZE(rkisp1_ext_params_blocks_info));
> >  }
> >
> >  static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>
> --
> Regards,
>
> Laurent Pinchart

