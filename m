Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733F8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enikGLAVKD32XDQkaI8PyWJI+pkAkZngBKEbealMEZc=; b=Pu2GI5cidaqqbuZ7cr+1waQ8e/
	aWukkbP5ApFPL6UO7VPVkcHseQ8xL8ZDRCg0HK2qrQjbIsibRZEU8LG/XMPYdP3FXKiYyXKLsE8hy
	os2oMrZ4hIbqAmy+0y4L1kYd2xFoFfjVYy722IWTVMXYkw9zsCdpPfPZSDSqGn7WMY9sqfu/oMX+G
	no6dH6Y9wnDcXsMoKdI8tMpSGbrYCMBoScJdY2KkUqiITka9t2uZTR2z76XGooY84RShREstg9EDt
	tzPF+HGVMY+lXlxe2eAOHhPSr+CIHKpm3aPqQL6LfW7RnZWeJqvhoti6gt5nab/Yf9j3cRh7e7yJr
	SSRu+oSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfjz-00000003K4I-3zno;
	Mon, 10 Mar 2025 16:12:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfHA-00000003Dit-1XH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:42:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2243803b776so69998735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741621362; x=1742226162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enikGLAVKD32XDQkaI8PyWJI+pkAkZngBKEbealMEZc=;
        b=z3LWjHL8W6P3po3GockNly/yjk3LVhFjNffBy40gOU8NCVdPYUNitki/w2Kukr/tsx
         AHe9EjzpSUjzJIWXax37nnGHyA1f4WU2Z9kQ0hA3IA/Q5ytFtjElUxdsI9iaCfZqWwvG
         UMMWR0veVUBTlOpYJJpG6VLOL6TvBRFJspD73LeZZupZt2YMvtiZjS4CwnBz0EqYHGKf
         /+OKYwL688+8zfH70niD7RkPtHKtOWySoQUcAmAl7edER3yJ0FzQgFQc2kadCIGc7SpT
         FwMMAGT9aWP7bkYXfnEPJSC22R6V+qskzEi+Gt4wJ/gC/xyDC3hyG8mDZoczY16eLKkq
         H1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621362; x=1742226162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enikGLAVKD32XDQkaI8PyWJI+pkAkZngBKEbealMEZc=;
        b=G3adoUyfUObVD9usA+2DbNGhK7iyhR+VLSuukWCi3fCx8r74hYPS4g4LEJJMf64tlw
         M5N4tdbW4+ob4Ez2hkRbdubDXK0hLedvtS/DMTBE2NyEsiK5V4wJ6hf4irieQIDpidMT
         GO/kH0nzwFio1cJ6htiaHR8prmcnQQEtHAZjg96zoj9T4Nd0kZKcZX/4UooPQLHWIa3K
         WzUuwlE+bSMXYnPbpHKyy/UfplS9EcFCU77XiN9OVcHR+sbxCuClmw2Um3I/w9c2iCn+
         XC84hRPcblaywI3zEJsDb3q0uTek3VgVbVWhxcKfRvd9a6IEfYd3WDcS162XFjRevwzP
         NkEw==
X-Forwarded-Encrypted: i=1; AJvYcCWRgBrp8RIk9J1TDNM7JhaVpiFs6W3TrYRXLpAZFfOYV2QJfrnHcQ1+r2vEMzrq0snBTjyFy+f/Mg/rfr2eykhw@lists.infradead.org
X-Gm-Message-State: AOJu0YwaeJfJPS8F9sEa+Cf+y5N/6sSWdkhuauvKMFiYf8fBMGeXPKfL
	lIscsly44lCenDjvsnZNy1YnqqzZmTHP2oIHrz4xXTek9Zqu/zOravrYBKmKI8s=
X-Gm-Gg: ASbGncvSaLXqM+xzqOhOsm/OiZsANIfuj1AzHnSF8gj+Aq9o849BtflVQ1tRg8EL6Ra
	H4rMzm/DMqyGjUgYsm8nyfIdL4k5Uge+Z+eLEjJk59VrHt/1zmSEyurNQ9Ue98BnjM1peWT7MjG
	T4k6inl0tSFaaUgBQNZMIGyQGQDkeaLsw6FK+k4Dft6Y9URBnGGvFLbNttf1XIbeJCTCFLdYfQB
	mxu4N26m9oqbVV29rRoBtrgosH5pX+yJyzo7IEcw16q7RAAFZJw+7efOVXdkkrHFxMpeBNbgr2I
	H4cU85OJEbInERd6p9lzgcEfR+sERaGND8+gnvJGFiRuArwD
X-Google-Smtp-Source: AGHT+IHNf11G7DyVu/twsvugWYwlU9A3A6njxqIwYNnQaUcCkH2JVILiZmtg9HpM2KZSrY/MiuYxRw==
X-Received: by 2002:a05:6a20:c996:b0:1f5:8903:860f with SMTP id adf61e73a8af0-1f589038757mr2586991637.14.1741621362485;
        Mon, 10 Mar 2025 08:42:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d163:942a:6a37:7631])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af286bb9f26sm7496813a12.25.2025.03.10.08.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:42:41 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:42:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	Frank.Li@nxp.com, peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Subject: Re: [PATCH v4 8/8] imx_dsp_rproc: Use reset controller API to
 control the DSP
Message-ID: <Z88Ib7HkbRQoiyZp@p14s>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-9-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305100037.373782-9-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_084244_464424_517FBB89 
X-CRM114-Status: GOOD (  30.19  )
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

Good day,

On Wed, Mar 05, 2025 at 12:00:36PM +0200, Daniel Baluta wrote:
> DSP on i.MX8MP doesn't have a direct reset line so according to hardware
> design team in order to handle assert/deassert/reset functionality we
> need to use a combination of control bits from two modules. Audio block
> control module for Run/Stall control of the DSP and DAP module in order
> to do software reset.
> 
> Initial design accessed RunStall bits from audio block control using the
> syscon interface but this got NACKed by community because of abusing the
> syscon interface [1].
> 
> So instead we use the reset controller API.

I am good with this patchset.  The only thing I'd like so see modified is the
above changelog.  The second paragraph doesn't belong there, i.e it is not
useful to remark on a design that was not accepted.  Instead please concentrate
on _why_ we are moving from the current design to using the reset controller
API.

This can go in the 6.15 merge window if you send me a V5 fast enough.

Thanks,
Mathieu

> 
> [1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>  drivers/remoteproc/imx_rproc.h     |  2 ++
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ea5024919c2f..bc60edcdd661 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  
>  #include "imx_rproc.h"
> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>   */
>  struct imx_dsp_rproc {
>  	struct regmap				*regmap;
> +	struct reset_control			*run_stall;
>  	struct rproc				*rproc;
>  	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
>  	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
> @@ -192,9 +194,7 @@ static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
>  	/* Keep reset asserted for 10 cycles */
>  	usleep_range(1, 2);
>  
> -	regmap_update_bits(priv->regmap, IMX8M_AudioDSP_REG2,
> -			   IMX8M_AudioDSP_REG2_RUNSTALL,
> -			   IMX8M_AudioDSP_REG2_RUNSTALL);
> +	reset_control_assert(priv->run_stall);
>  
>  	/* Take the DSP out of reset and keep stalled for FW loading */
>  	pwrctl = readl(dap + IMX8M_DAP_PWRCTL);
> @@ -231,13 +231,9 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
>  
>  /* Specific configuration for i.MX8MP */
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
> -	.src_reg	= IMX8M_AudioDSP_REG2,
> -	.src_mask	= IMX8M_AudioDSP_REG2_RUNSTALL,
> -	.src_start	= 0,
> -	.src_stop	= IMX8M_AudioDSP_REG2_RUNSTALL,
>  	.att		= imx_dsp_rproc_att_imx8mp,
>  	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> -	.method		= IMX_RPROC_MMIO,
> +	.method		= IMX_RPROC_RESET_CONTROLLER,
>  };
>  
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
> @@ -329,6 +325,9 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  					  true,
>  					  rproc->bootaddr);
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		ret = reset_control_deassert(priv->run_stall);
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -369,6 +368,9 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  					  false,
>  					  rproc->bootaddr);
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		ret = reset_control_assert(priv->run_stall);
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -995,6 +997,13 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  
>  		priv->regmap = regmap;
>  		break;
> +	case IMX_RPROC_RESET_CONTROLLER:
> +		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
> +		if (IS_ERR(priv->run_stall)) {
> +			dev_err(dev, "Failed to get DSP runstall reset control\n");
> +			return PTR_ERR(priv->run_stall);
> +		}
> +		break;
>  	default:
>  		ret = -EOPNOTSUPP;
>  		break;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 17a7d051c531..cfd38d37e146 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -24,6 +24,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_SMC,
>  	/* Through System Control Unit API */
>  	IMX_RPROC_SCU_API,
> +	/* Through Reset Controller API */
> +	IMX_RPROC_RESET_CONTROLLER,
>  };
>  
>  /* dcfg flags */
> -- 
> 2.43.0
> 

