Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587CC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugxtBlHTb3OFluSd7sIGAPr/vpouYAqWL5sP8bH4Iqo=; b=rAqP4tpBMfcFW400aa4zXc7sGu
	PdHYFEK4GXJHL8m7g+88ujaI07SwZkdc7iLcUCKH3ZiF+NYxrgBxP1lyPUeAqVnUr4ZdHDkqVyVs3
	AW6QBU6z8OxwfOCrRdKD6yIT1TlM+M81SomY5hLAc3yT/1u6MK95YVwz613Cqk66b94kPvR4BgNGy
	4cICzPe/oOUh0sBgxrPaubO7SxeAjWnsBSV7jBFWFlwdalInOi45wND+zH2ZRrl1mhop5jcCRRZsQ
	nzpypEZNA36L5Hqbq7QKMw+spwy1wUH3MDL/rSxcdYTckBvf65L6Lf3w3EkbsNQecwfDUNSQHE7DN
	K/784qeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnzO-0000000A3LT-2kpg;
	Tue, 27 May 2025 06:40:42 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnvk-0000000A35j-0hjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327816; x=1779863816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7zeaY485iuldgqut5ZbwwPrllwA1ayRl+Nd/rGxucU=;
  b=ffcfsbDJuF0zdchxTCxjzc+x8h8HROa5tcAg0yo1hXJzxE3wR7yegbHs
   EwQkegKRga115GBvQ2tMOSDcmSV0Ft929ufrvaEJlgll1SgshD/hDh0qY
   m6LYR8dhm50R+1cNNkRmGmwIq71C0HXSIjWznL5xz1ZUAq+wkdNHhwRIL
   x6uX4sslx0ijlpZOkOPcO9m3rJ2U5P4Ja/gUfXzqtsqCA59+qoXf5NqX7
   Ti+Agfdb8j6b5HRdMW7AxNE4decRRdeFJ1WFDwQx1/nkGlnXwNwV2kydm
   rOQ0r26b2C83BcPuwQ6KmowgQYXCdGze4+y/+lzydWIps4XcGJyAN6N4M
   w==;
X-CSE-ConnectionGUID: ZJbdv8v1TvKwMhoN5yVS8w==
X-CSE-MsgGUID: GqSF6FPxQ2GbNT7w0+n+mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="75693438"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="75693438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:51 -0700
X-CSE-ConnectionGUID: /PhxJ89BSNaYc6wNOcq0Vg==
X-CSE-MsgGUID: xA3sQva5RqaRW2I2vgVTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="146557371"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:36:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ACC1511F738;
	Tue, 27 May 2025 09:36:42 +0300 (EEST)
Date: Tue, 27 May 2025 06:36:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 7/7] media: mt9m114: Set pad-slew-rate
Message-ID: <aDVdekApG-GT5BHj@kekkonen.localdomain>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-8-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-8-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_233656_220221_2B886784 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Mathis,

On Thu, May 22, 2025 at 04:35:11PM +0200, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Read the 'slew-rate' from the DT and configure the pad slew rates of
> the output pads accordingly in mt9m114_initialize().
> Remove the hardcoded slew rate setting from the mt9m114_init table.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 9ff46c72dbc1..f3f9ecc0866c 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/types.h>
> @@ -42,6 +43,9 @@
>  #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
>  #define MT9M114_RESET_SOC					BIT(0)
>  #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
> +#define MT9M114_PAD_SLEW_MIN					0
> +#define MT9M114_PAD_SLEW_MAX					7
> +#define MT9M114_PAD_SLEW_DEFAULT				7
>  #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
>  
>  /* XDMA registers */
> @@ -388,6 +392,7 @@ struct mt9m114 {
>  
>  	unsigned int pixrate;
>  	bool streaming;
> +	u32 pad_slew_rate;
>  
>  	/* Pixel Array */
>  	struct {
> @@ -650,9 +655,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
>  	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
>  	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
> -
> -	/* Miscellaneous settings */
> -	{ MT9M114_PAD_SLEW,				0x0777 },
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -784,6 +786,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> +	value = (sensor->pad_slew_rate)
> +	      | (sensor->pad_slew_rate) << 4
> +	      |	(sensor->pad_slew_rate) << 8;

Please drop the redundant parentheses.

> +	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>  	if (ret < 0)
>  		return ret;
> @@ -2398,6 +2407,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  		goto error;
>  	}
>  
> +	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
> +	device_property_read_u32(&sensor->client->dev, "slew-rate",
> +				 &sensor->pad_slew_rate);
> +
> +	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
> +	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
> +		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
> +			sensor->pad_slew_rate);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  
>  error:

-- 
Sakari Ailus

