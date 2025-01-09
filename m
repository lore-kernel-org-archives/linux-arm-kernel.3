Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2F4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PluEJNm6A4jMqOqyB0FTg4D45gj8yEkPQ1baSXUmCTM=; b=odUzjQn+fmA0lMA5wQM/U7QfnI
	a/xCZdzMhmGUzpSLpp0tOwFz/LfUzU7+O5NGi6WH78T7U+lFmFvXlvyU4IwXT0/abeboLlANo8EW/
	pLExsLp/mobA/RwzWobVHZfc6LwLhfwkvFkr8lULVXQIMJPTsSnDTjdOlhCH4A96hOCAnf4mzXkzB
	/2HgVB5gr/mV1hJ+kbQSB342ne+ex5FtnC6eCqilN90nV/7zCXFnDvh1UnI/x5G91XetD8+2jjgnE
	ehfII6bYd3WZhHqE6HGigEBJQg9vR25+P4SSDvvqW4rLxUEOIb/wLubGJ71H4ZsIxtbaLJZhIlmwJ
	8kuBKwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs8C-0000000BvX2-2M3f;
	Thu, 09 Jan 2025 12:59:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs6x-0000000BvEq-041V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:58:09 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30229d5b21cso7812501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736427485; x=1737032285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PluEJNm6A4jMqOqyB0FTg4D45gj8yEkPQ1baSXUmCTM=;
        b=lj9vCnM3KQp9k4o/nXMSeolcwbevtxzmJB4Vu8527jX03UuS0yA5sJEa+MKjajfo3D
         BX9El+zOEafkArR7ULgWJWhKqMm4cPGwVlbBuq1959O20oi8HOrhDDzwK9iC+R9SpCW9
         8dQ28K55JQGMH9GLex0QO+TE0RbVW3iODCPv2q27kWPIU6qUdgS8xkpGKKCUyUa9pofF
         cVTpbbutp7yl9BOji1d7dJzxNbzBJDjq/qS4xXteT5TjVQ5I52Hd9TSptwEI/bivteNj
         A765leJZE6hcPsPilBpTg9yJeI4NHuAq1PUXQTvCV+nwHW3oMSbqV0kUc1HIJRAmahxu
         QK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427485; x=1737032285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PluEJNm6A4jMqOqyB0FTg4D45gj8yEkPQ1baSXUmCTM=;
        b=cWduAY74QaMzXFNo3DNScJp6JKl4LHA/zjTUyLSu50hIcrEdBTVEEtLrbDDZMV5yJc
         A9G7l7BPZIzYAP0EAGx08cULRw0Q1JWbA/viXcZcJPp21Wqsg+IUKtHlGnb73zmcFSF9
         wcPgSM1ljelhBENkDbY27MHKoTp5B1/4Gabv5rEgUUrebPv9u2clxTeyJOPnOeTtyA3b
         7NYJH5/dsoVB9yVmsGXPNR5UVCz4eArXEiOOb2b3eZugQmkwNY9JwOIxkLPldpS4i/7f
         MkDCemxpv4x3bboBcQhPPkOcoZuxIXIq1NmW8SXhLJCPHtkqaJQyzvMlsh9SENmQCMPv
         GWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuZvl9/1asXKl+BWWlz/QW3n1RYd0e8FHet9IYcraMb8DBjzJsyAo+u1brYO2VKyspiZN/1ykuZcCEkskOaWkP@lists.infradead.org
X-Gm-Message-State: AOJu0YxY5Db5G56+LGqBPgFd8t8m3sIXjD5kPlYhbQ1Hzx/IrOR27KjE
	2UOTNLpEaUp34DXInMw7e0Dbz0hCR5Fss3matooQl/bbdsKWlDbAcTHBALMQz28=
X-Gm-Gg: ASbGnctK6HWh4OCP3aQrQljPqh1yglWiG2Zq3HWVPtCmfY4TaHg0qLZJuWCNSDZTZ31
	qDdDy2z6UTKqu0ENloEWkJ9a3vsnvnPr9bIlgWHAD9724k1qZyIg3JMAo1F+dlquEMRMvvN8wtm
	QMNaVWsZ51+KwxZ3V56QTByHWhoh4teOJPZeXsaUo42gaIhc4PWxpzpRsLOC+a4mebH0gwFp8QW
	vqEzNIceHQInQpY+YVO6Ps3AguaoCVn1tgpfpaDkRbStuKY4X/4vn4dxhnT+CJOBUaO5L+gkWUj
	jVikbLijUtLTCJeWBvtgVW+KTXLPguo1UX9s
X-Google-Smtp-Source: AGHT+IEvGTGt6x25ztvT/50kVctTk1CY/fLXQXxYXUd2ctSdHixShfg0M2M1+bWWr8+u7Ko3bFZHyg==
X-Received: by 2002:a05:6512:3082:b0:540:1b2d:8ee1 with SMTP id 2adb3069b0e04-54284507047mr1803562e87.11.1736427485004;
        Thu, 09 Jan 2025 04:58:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bde9633sm197114e87.0.2025.01.09.04.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:58:04 -0800 (PST)
Date: Thu, 9 Jan 2025 14:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 10/20] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <uqsmsoumny6ovf7n56tbcjmdzbzikk2iijk62bvefh5tjtgrvu@a7ogvep5e4yt>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-11-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_045807_049092_DECF1EAC 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Jan 09, 2025 at 11:27:15AM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
>  include/drm/bridge/analogix_dp.h                   |  4 ++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b05f5b9f5258..8251adfce2f9 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1794,6 +1794,20 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
>  
> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_device *dp = to_dp(aux);
> +
> +	return dp->plat_data;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
> +
> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
> +{
> +	return &dp->aux;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
> +
>  MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>  MODULE_DESCRIPTION("Analogix DP Core Driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 6002c5666031..1b119b547988 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -7,6 +7,7 @@
>  #ifndef _ANALOGIX_DP_H_
>  #define _ANALOGIX_DP_H_
>  
> +#include <drm/display/drm_dp_aux_bus.h>

Nit: it should be enough to fordward-declare struct drm_dp_aux here.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  #include <drm/drm_crtc.h>
>  
>  struct analogix_dp_device;
> @@ -48,4 +49,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
>  int analogix_dp_start_crc(struct drm_connector *connector);
>  int analogix_dp_stop_crc(struct drm_connector *connector);
>  
> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
> +
>  #endif /* _ANALOGIX_DP_H_ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

