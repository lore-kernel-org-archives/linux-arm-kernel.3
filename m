Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC5E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLzU3OoGAZg1lvIIB2cj0SjgTHG2tkXZPV4oMUjorKM=; b=iZUsRarWllV4b6VjSdtvlKxs7o
	6bk2B6iD+CgX+CS2uz++Mk/5fsqVGQHL1Rl+ZLU7Jxpwvnt+qWN2A25ncbiJ3q1lAxc+G3d+K0apH
	OHh5Fd0VWnHocdcnEb70yjAu6MRq12JxHHyEogiCejEti4NNmHrRyVQPdOFmQd8p9LvJ0aQ0tt8u/
	bLr+Od1bQCfr3hmW58klw2Ww7JIf0zgqMVA6B+j1FaFduYo3xKMyGypNoNhiBE7/NCPi84dA8t6/D
	+nPaCSAfYXWf/Gcc2cUOJNTxx0UzoAMfv4ZfFmB8TCMcgIVTy+MJ6COssC71QJ873/EBB7iVMFBbN
	8c9IiCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN826-00000009dzq-1fCw;
	Mon, 16 Dec 2024 10:08:58 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7yH-00000009d9E-2AYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:05:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso49007961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734343499; x=1734948299; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLzU3OoGAZg1lvIIB2cj0SjgTHG2tkXZPV4oMUjorKM=;
        b=jXcy8H4j5shxWUZzhgEvSr2nhVuRTCZ+Tw32xVEgZr2eYL26fHo+0eoW+isemAJjlk
         oehjlVkteZMDAyVlt3+OYvgss/cYOV3UWqU8fpL+1kdb/iXxTXOb8rbkmBa147s0wkgn
         XLoYYVH3OXEvlMi44C2TJh6CvM4k6vRlCWR3dshY6AxZSNFh1pB5GOu3+SCRCL7ujdkI
         I4gAgPZzMMkZUenGwXQKKh7uf9CYhxC8kLIl1pFALCuPnv/P3nep5+TOEVIBku64G0PO
         3xZ+hBQz8zm9OZ3YRJEEhgBNLXczzKunq6TmoUX/pu1D4gbgnEEoZuqis2MqhOvgTsx/
         iI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343499; x=1734948299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLzU3OoGAZg1lvIIB2cj0SjgTHG2tkXZPV4oMUjorKM=;
        b=Y0cWTDLZ1cw0PBo8Jlv3J29BuRhg/wsKx30ONFv4EAhDBgEmeJ7w3BCmXUvtEVWDQr
         tmxoMP0vZqQNkgwVGC+cWKXHmBBW7VhSuPamITV55F9bkT1xrgRIs922BmTnwsqSYm8i
         /ynNXp724eU4k1a0etO/d4ku3uz9mt/ihrwmfIirnXaMFYIyUfovWg/DFzDEM2RF4w7l
         rK7L1Enyxz0UoiJiobymvsgs+crOO3TBszKcGEP1CW8skcHffsjnmd1JsgTev8NzUUdz
         zNFBzR5oIrFriZVsSl5lV1YxWLdrOkEFvMRpfBH0eSg5u4rzrOd8cCa0oUwP66VPw/cc
         N+HA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Zv1xP1s0GKDQVKIddVIqPYXr+lLSu53uG/1Nn0nvG05HLU70IycBoG7pF8qYPft+8KmdRop8fLxaeyS6YzQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnSTXF/aIY5cg+R5W5BJTLzQJxtDv3PUhllPDfKkMfvyuZCum
	3JumTeZoOGdOKMWV/25fR39cLSCCjMbbyezLw6DQPgVX4SgLLMkBZ9/gt8/5O4o=
X-Gm-Gg: ASbGncsBkdp3z+7C5tEYHImggKQUGKOXHHv5qFqdbMIO8sr2tVGFgq9nVY5zinolZ7M
	s79w0ykn4g/y9X3FMQ2+k77Sekze/wx+jwoPVPYUx6DRqtw5dcRNMSLSg51AAhjL4t9dQ6/5InE
	ZAKcEVDYbnkqUAV/pn8Fuksk8812eiEKsoMtTir8EEmvgvUbrdsNDyI1+/YgyugH8HQSX5dJoQh
	9YJ7lBxpV5oEGiePbI+pg47GDs93nO2tx3Bz2UPGKKW4g7DFDuQ8tu04iQphP4pWefWfSz6irbz
	tqhmaNLrEq2uC30ujK0DCmOCvzQWGhQCCXMN
X-Google-Smtp-Source: AGHT+IEANV1rjeOcZD+mfElWFOCdmwQitk5ard7G/sdmw/kgz+ZvJnKtp9SusUqTBt+TDbtuy27Lww==
X-Received: by 2002:a2e:a99e:0:b0:302:16da:a052 with SMTP id 38308e7fff4ca-302544ae804mr44008281fa.27.1734343499432;
        Mon, 16 Dec 2024 02:04:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045239sm8283241fa.36.2024.12.16.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 02:04:58 -0800 (PST)
Date: Mon, 16 Dec 2024 12:04:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Damon Ding <damon.ding@rock-chips.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for
 RK3588
Message-ID: <25bh2uy6wg3kcoqmnzt5dwfamc32bjyjlivkqq4cvne6kryj3z@svlz45bbaoy7>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
 <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
 <4395748.ejJDZkT8p0@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4395748.ejJDZkT8p0@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_020501_554512_0081506F 
X-CRM114-Status: GOOD (  33.77  )
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

On Mon, Dec 16, 2024 at 10:11:54AM +0100, Heiko Stübner wrote:
> Am Montag, 16. Dezember 2024, 09:57:41 CET schrieb Dmitry Baryshkov:
> > On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
> > > RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
> > > TX Combo PHY based on a Samsung IP block, and there are also two
> > > independent eDP display interface on RK3588 Soc.
> > > 
> > > Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
> > > the tests of audio, PSR and other eDP 1.3 specific features.
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Add support for the other eDP output edp1
> > > ---
> > >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
> > >  include/drm/bridge/analogix_dp.h              |  3 +-
> > >  2 files changed, 74 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > index 871606a31ef1..4c9a55776ada 100644
> > > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
> > >  /**
> > >   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
> > >   * @lcdc_sel: grf register field of lcdc_sel
> > > + * @edp_mode: grf register field of edp_mode
> > >   * @chip_type: specific chip type
> > >   */
> > >  struct rockchip_dp_chip_data {
> > >  	const struct rockchip_grf_reg_field lcdc_sel;
> > > +	const struct rockchip_grf_reg_field edp_mode;
> > >  	u32	chip_type;
> > >  };
> > >  
> > > @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
> > >  		return ret;
> > >  	}
> > >  
> > > +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
> > > +	if (ret != 0)
> > > +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
> > 
> > Is it to be called for non-eDP hosts too? Or for older hosts?
> 
> The implementation of rockchip_grf_field_write (in patch1) seems to
> take care of checking if that field actually exists and doing nothing if
> not.
> 
> I think eDP/DP is more a naming thing, the Analogix controller is called
> an eDP controller in all documentation things.
> 
> Even back on rk3288, the Analogix-DP, still is called an eDP controller in
> documentation, with the only difference being that it does not contain
> another additional "dedicated" DP controller

At the very least this should be mentioned in the commit message.

> > > +	i = 0;
> > > +	while (is_rockchip(dp_data[i].chip_type))
> > > +		i++;
> > > +
> > > +	if (id >= i) {
> > > +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
> > > +		return -ENODEV;
> > > +	}
> > 
> > Is it applicable to non-eDP case?
> 
> same as above, it's always called eDP in all pieces of documentation,
> (Compliant with DP 1.2 and eDP 1.3)

Ack

> 
> Heiko
> 
> > > +
> > >  	dp->dev = dev;
> > >  	dp->adp = ERR_PTR(-ENODEV);
> > > -	dp->data = dp_data;
> > > +	dp->data = &dp_data[id];
> > >  	dp->plat_data.panel = panel;
> > >  	dp->plat_data.dev_type = dp->data->chip_type;
> > >  	dp->plat_data.power_on = rockchip_dp_poweron;
> > > @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
> > >  static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
> > >  		rockchip_dp_resume, NULL);
> > >  
> > > -static const struct rockchip_dp_chip_data rk3399_edp = {
> > > -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > > -	.chip_type = RK3399_EDP,
> > > +static const struct rockchip_dp_chip_data rk3399_edp[] = {
> > > +	{
> > > +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > > +		.chip_type = RK3399_EDP,
> > > +	},
> > > +	{ /* sentinel */ }
> > > +};
> > > +
> > > +static const struct rockchip_dp_chip_data rk3288_dp[] = {
> > > +	{
> > > +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > > +		.chip_type = RK3288_DP,
> > > +	},
> > > +	{ /* sentinel */ }
> > >  };
> > >  
> > > -static const struct rockchip_dp_chip_data rk3288_dp = {
> > > -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > > -	.chip_type = RK3288_DP,
> > > +static const struct rockchip_dp_chip_data rk3588_edp[] = {
> > > +	{
> > > +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> > > +		.chip_type = RK3588_EDP,
> > > +	},
> > > +	{
> > > +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
> > > +		.chip_type = RK3588_EDP,
> > > +	},
> > > +	{ /* sentinel */ }
> > >  };
> > >  
> > >  static const struct of_device_id rockchip_dp_dt_ids[] = {
> > >  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
> > >  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> > > +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
> > >  	{}
> > >  };
> > >  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> > > diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> > > index 6002c5666031..54086cb2d97d 100644
> > > --- a/include/drm/bridge/analogix_dp.h
> > > +++ b/include/drm/bridge/analogix_dp.h
> > > @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
> > >  	EXYNOS_DP,
> > >  	RK3288_DP,
> > >  	RK3399_EDP,
> > > +	RK3588_EDP,
> > >  };
> > >  
> > >  static inline bool is_rockchip(enum analogix_dp_devtype type)
> > >  {
> > > -	return type == RK3288_DP || type == RK3399_EDP;
> > > +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
> > >  }
> > >  
> > >  struct analogix_dp_plat_data {
> > 
> > 
> 
> 
> 
> 

-- 
With best wishes
Dmitry

