Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C8CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bsSCY5UtFIH4J3YGmp49wNWDSra2kfjxxhdqkpeB0c=; b=kMj4GTjZXwM+Vp0ZvvvT5jbr0+
	g6jMrQ7fN8sj3GdMxBjRjq/ZDC52XYyYoaNqwuYb966VVoDaDyX4rGRCbLLbma1y76/ARkCP84hGc
	3zv2X7aWfb+SZWL3bM6XSfbvhmBphBeSFs18Ga56YpWsqiI/sPjgf2P35BlN4VKoPTGuFD0KWjjNV
	D/q6me140kN64nqV5lR1TnS+PimRHhEGJR/Z4sPSbbgME1mAJJl+VUGj3a+i/INZ+J+RHjJf21Ohy
	SV9L578JUooFqllGgxu16TxMdharM+6xtegNF+0aWHe4PSUlOUsbJW/4ogvGrRqCOtgbf2SQRDv8v
	I2Lwk8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavGz-0000000CJJp-0JU3;
	Thu, 23 Jan 2025 11:21:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavFf-0000000CJ9l-3aXx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:20:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54024aa9febso877581e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737631198; x=1738235998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bsSCY5UtFIH4J3YGmp49wNWDSra2kfjxxhdqkpeB0c=;
        b=L3SFEcXGb9eEgcwKiJduSO8X3b6hjHhxzaE/+RtSJH9lCt9iXxSReolAVW6MGFRzV5
         wS1gpjWLZdaEqT9h2YkwcxA5C6mkcn/SGcpPhYgv4AHYjLyacdOD/wisaR7snR9s+ekx
         Wi75C5JDofg3Qnc25DAWmk6rz3K4CIsEct5cTHzFUemgfmgChYZIU6MX4gVOYD5wgJQZ
         Zd7Mb1axtRZGnD1O30AWJ1VemCzxVEBmwVyE6OTsOKVygpMo39lmx8+YhPAfacnpSppD
         MteB4LD7k9GN05JSVT5+V3fJmv4gZNt43zUTK803SGqAFa1e0qvvPGwzs0RE5W3i88hB
         KQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631198; x=1738235998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bsSCY5UtFIH4J3YGmp49wNWDSra2kfjxxhdqkpeB0c=;
        b=dKVWDrOwPo9U/AaBQfqkW0Q8/r1TbTVZnJQ4cgOGOW0QsV85WGbC74k81ONxZBmlp3
         m5I8Dmh+NImwLI+dnjwdagnQZ2Zb096r2E+gpgNmdcl3AjW1HhVjCeMaXT+PwBes5Dq0
         2iHYU0bgtTLCk6FC518YgRZxT65NLxKygJ9zfkTL5MwYgUkV7ItGUOei6q4/z9ldPOuC
         JBJdjnZYu6MlcBeXqX70hhIe0vnCZvLG/yIx9NnMlUCb/R/uEdM4QQduIAv/hDNlsQQA
         xrRNX/sXJ0FneX4Tab/3dFs0b8CSGtYL3TsHzJkqnvswu/230KDIEGWERBT8Qx3tbiuG
         nu8g==
X-Forwarded-Encrypted: i=1; AJvYcCXk7+yQ0X6RUC/SGeazjqN4ZHda3sTAz42iUW3oXuP+obQ3QQtvfxhmxztyLacwZUXliWOaO/zmlxPJdxCfp99x@lists.infradead.org
X-Gm-Message-State: AOJu0YwXFA35lCSUZFa+xcwvn7l2tcr8NMzcbjW9G7RVivgEFNgJuD78
	8E4VJ8Am0ALNW0+8ovKaX9O4XNFd1bPg5WUE4VmiVOcLIqOxaTHcdAU24X2YOUE=
X-Gm-Gg: ASbGncvLI+NS84+u8uoaRFmNB8C5ObGzDISeXGnHVbOkritVZycrOGITu9pSqiB05Tx
	LzrM/LX0cT3e1rOskIN5W0rP1JXMsAWFlVwTCg/bOeMpoGpvLXC/cjReZOe68P4tPVh7nCy7cIL
	y5gnYMt+6u9CJL36EDK3fG3PleH4sx22pzvKlUJheUyJmjgwsSoE2JtVahcZJoWVbbNFH8wfi3m
	MLgncxDgqpoGjrFwLM51wASnoGJMd7pbDC6UGHps63leT9Wc4ArvaVwF9bW2Ihb6R7HJZDJtbH0
	yRAAo++yHdnnLtaOzqhvsPwWnOP/Y1alyqH+gyn31SmvGEdhyLzb3V29ygUB
X-Google-Smtp-Source: AGHT+IFJoD1ZpSDXSEK4+7GESjrAS6LXVt6ZkzdoNAPzcbKpEHkPVqYdSxIGbzeDq/Vi6d+KuKKiiA==
X-Received: by 2002:a05:6512:10c8:b0:540:353a:df8e with SMTP id 2adb3069b0e04-5439c282caemr9883136e87.39.1737631197914;
        Thu, 23 Jan 2025 03:19:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60a20sm2652478e87.137.2025.01.23.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:19:56 -0800 (PST)
Date: Thu, 23 Jan 2025 13:19:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 06/14] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <y4yzgkvcmvmphviuoroijaaotd2zdworbs5tfhdxh74kchirk6@dgoqwoksckiz>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-7-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_031959_897627_244D6C49 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, Jan 23, 2025 at 06:07:39PM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Nit: it should be enough to just forward-declare struct drm_dp_aux
instead.

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

