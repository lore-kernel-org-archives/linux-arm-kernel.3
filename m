Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76981E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t86gi9G7/Nyl3NdC1IVXRnYkcURnLh8hewaEmUmJ3Y=; b=tAyu+L2kqLTpofGmGxOfUDYM3h
	VuIey51PvvyuZhfxk/tJLFKlMPrRmya7gzl+AdE8k7GUXG3ccZ59L2pBsCODPbe/2ShL+L47zlna+
	ZxRxaqEdd3pIvHN0+gTjIQ1jmqPhgLUPlhoGmBZnybhzolSLgcpBkaMf6lJ7TWIfU4KQappVqAt8y
	nVupXpkgM43TXmO3QzWpvQApjhQfIkVZGxwNO8bNNB7BIOXy+XylStbyoZtwiXGB/xegm/DZha2KK
	pkQaQ9sGOXwbBa7fBlPXRimnuhX1npf6nHS1GKBorz8vn1mL/8y+F4mjCHosmuhIJ1Ruz1H6qoCDZ
	tu8mAwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQfd-00000003R1U-0QWG;
	Fri, 20 Dec 2024 00:15:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQeV-00000003Qnt-1UIM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:14:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401b7f7141so1073255e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 16:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734653637; x=1735258437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+t86gi9G7/Nyl3NdC1IVXRnYkcURnLh8hewaEmUmJ3Y=;
        b=PoPIDl2CaI2gb/EJNzHUgnUVhMqFbyzDhOUW1J2g+0BRDmi+1jbJo5jmLNsJDGLauV
         rOiBujQbSSeBsDmSwrralSiz3vxz28L/R0lcSGh6U7l+wZ2isDpz0/cupVLrHY1RvOR2
         pgUA+D6kH0zRpt68FxAEKASIEqJt9skn+mCHevB2S6YL3XSs65hnSk9rxhUrVXoXJlfg
         +Sk9Emxr5a9oyOjbZMLECUUabuwxo0qgIDbKOlW+QblQwM3Zk7wbQ5tWaHtolvYl0q2D
         KeBuZNVeZ451iSP8gmPI4Ktvg41P2pFXWlLK6jUaePiiRu3fz2QrjCLWCoqFP1vgimx2
         li0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734653637; x=1735258437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t86gi9G7/Nyl3NdC1IVXRnYkcURnLh8hewaEmUmJ3Y=;
        b=NP4UQrN/UXSiO1Ozbch1ZT3YQno8Kl8V/tgOTU7vXFI8igDtMh/aXVsY4R3pGs7r/p
         Ek5Wv4rliWmrs+td7FHWFHoZXso7P5DLlJNH9sEyMk2zMzNNRPIYZAGXf/PxHg9TlHZV
         olItOHz9uz6I3NdVZhYbQeF6iV7A7Vt/w4i9BlB8uYre8Pq8AvAzXN0T1cDO5QGLx101
         YkvuU3uJsnc4cwCdjd7KXyd4hxiSld7qmG+N7OBY0dFraYHtFlZul44kEE0IDq17VI7H
         ZgP/rf5bX1BohAWl6oFeAgH0aYWC+AC2AMeSPhOeXpi/G4x33MwdhCYpFJi/JiULgI/N
         Axeg==
X-Forwarded-Encrypted: i=1; AJvYcCXKFSoqFgdUCfrjvXkfpHDgvuIJX9gjw1xyD4tPMXoo2NaAKe+BlwilsOrKN5EhxMQyD5A8UhC8SHRXRnQyFYpl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0H84Xkay8q4Zz/R0PqM5GA2JVXiX2qm4vxsVzYAqYQthKy1+S
	VsCCIDE3Y/+iME8Kdfnw+bm7Vc9pMD8KSsJG61t0FgTpzmbPUG7SguSLjsRoDjPwMI2kSGnrUXV
	r
X-Gm-Gg: ASbGnct+zhG1WR4u0yd02qrgvxSoGvNT8zXm3KrTwABGhCAA/cVXfS4L7J01+FGf0AE
	K6UDDh4gPRN90EmY3/2I9W2vy7LDIlhDYOXgne5rkqvEuwkvZleoRn5fMtRy1WiF97NQTdIAeXl
	pRTG8Ky1E/3YHSTuxlM/5YyG0a1fZ/UkkHrPHFu3NO72onC9aOZqexD0PJTbdVENjjTje8gH/cv
	RmK3xsbHCGhdy3r1S6qTL6z2GsL0qElEgWU2fjnwbjBJsI1WHVo2Vr5fBP0FWccdPbLa/QjirOt
	hJzman5CJEdEoOj5TrisYPV8B8nAbyz8gArO
X-Google-Smtp-Source: AGHT+IF+jUkTs+trNuGfxVH/FmJYswxWVXFWxwsAch+XkSokcdZa7gP9TyRJCdDwYd2ZnKdNocqqsQ==
X-Received: by 2002:a05:6512:33cd:b0:540:358d:d9b7 with SMTP id 2adb3069b0e04-5422957ac6cmr152434e87.52.1734653637396;
        Thu, 19 Dec 2024 16:13:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215b6sm308711e87.188.2024.12.19.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:13:56 -0800 (PST)
Date: Fri, 20 Dec 2024 02:13:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_161359_407638_B5CAF154 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6f10d88a34c5..9429c50cc1bc 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
>  	if (dp->plat_data->power_on)
>  		dp->plat_data->power_on(dp->plat_data);
>  
> +	phy_set_mode(dp->phy, PHY_MODE_DP);
>  	phy_power_on(dp->phy);
>  
>  	analogix_dp_init_dp(dp);
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 3afc73c858c4..613ce504bea6 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -11,6 +11,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
>  
>  #include <drm/bridge/analogix_dp.h>
>  
> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
>  void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
>  {
>  	u32 reg;
> +	int ret;
>  
>  	reg = bwtype;
>  	if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
>  		writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;

Should not be necessary, you are only setting the .set_rate.

> +		phy_cfg.dp.link_rate =
> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> +		phy_cfg.dp.set_rate = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>  void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
>  {
>  	u32 reg;
> +	int ret;
>  
>  	reg = count;
>  	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
> +		phy_cfg.dp.set_lanes = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>  void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
>  {
>  	u8 lane;
> +	int ret;
>  
>  	for (lane = 0; lane < dp->link_train.lane_count; lane++)
>  		writel(dp->link_train.training_lane[lane],
>  		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> +
> +	if (dp->phy) {
> +		union phy_configure_opts phy_cfg = {0};
> +
> +		for (lane = 0; lane < dp->link_train.lane_count; lane++) {
> +			u8 training_lane = dp->link_train.training_lane[lane];
> +			u8 vs, pe;
> +
> +			vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> +			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
> +			pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> +			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +			phy_cfg.dp.voltage[lane] = vs;
> +			phy_cfg.dp.pre[lane] = pe;
> +		}
> +
> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
> +		phy_cfg.dp.link_rate =
> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;

This two should not be necessary, please drop them.

> +		phy_cfg.dp.set_voltages = true;
> +		ret = phy_configure(dp->phy, &phy_cfg);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> +			return;
> +		}
> +	}
>  }
>  
>  u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

