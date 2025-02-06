Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30880C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=; b=OzLpvpW7QGZ5b/R36PMDhyxU1F
	Zr8rVckb5b8CI2qMLb5wHGPvDKMGJtL68GyA+7VNHw3se+3g9hob7IbLhaEBrru2q3rWIvSV+0/9G
	W04npZYYEd/FNK6ro8HG90KLRHS40JdegUQZtjifsiUz8W9hayI0vd82ZUaV2sJCU3sFvuHxEZvPh
	MCotzOvTZaVLfG3rHyt7gN5jv7Iy1dMSiglEsrfDKH897eMcjG9Y7G070mwEwWqxxs47kynuwDK1z
	am2Hnw/oG/8+V5wr7jbsWcPaDvPjYd0lGQ4cJVEdpvO511o2hQBVp9gT/uU0nF/VmdKGcs/26mbXs
	djxhdH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2e3-00000006XK8-2ydN;
	Thu, 06 Feb 2025 14:14:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Wj-00000006WNj-26PQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:06:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso6581375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738850804; x=1739455604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=gE6/pTIDELIzrn+2+EppimSaDeA8UFgcwMPZYzQqB+6KUs58lJviwpQj5aWQxwtWLv
         IbMNCEExAvdLFEJD+8lkxTphMdRHv0sWWjTnqFS9vahgCW0llHX5iTmShDUYUUHWtNwb
         OPtCcgRWGeW3m7Ckzdvvtfuzm5fdoGigwC6/ApAk+graO1TpdMcr+PIRSaNVJDZXS6oU
         zVTbfHbIyG8yOMGVzPy7sQKnqP7xLKOTZ4scce4UWEVxLraIMphUEnX1yQTVrUezJbUY
         ZYdfwcepVujBatuM8WLapFVxJxUayZow0nBKYnk2ooZTWDS5ktKHd/XODy2qLULoQyYq
         bVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738850804; x=1739455604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=DoyiFJJx7i6pPvzZKJ6b+3d26Uw+sXSaYmUf6twrVAC6buKGGt5/JVMWPRDQcxpeIk
         CQnILB6414eDnwuULZouTLxW0x5kkSziVcMWEFRThReAvaJELdJbKZU+QIsX5rq3ft23
         CuRXyQaY3hXPS0r2SvOhHfgz5N2a+OoZSk4OH5qtJd/yr9g/zrGCTMieWGwcDrPf3Ui2
         VLS3jy0MKCbuEzRnOnE4dDjxdUgnWMJmPeedNhepciYfEncoyXfh5l4QMOWh7SjRjOOL
         e5aTY2/xAUeMVcYySsNqXZCzZHAt36uPhLtwDGc/nSSA8en3obNGL5upkIhapnR0tRoA
         OZdw==
X-Gm-Message-State: AOJu0YyZ1MhmB29U2bNPF+2G95+XvyEr+XZ6cZLJxJOY+bn7Nrhvf5UO
	xoBzipIMU2V727r/1QBfSmmPbTyqp2tJJxy+t0UbNq+qOS82EgHfF2ZCVMMG3/Q=
X-Gm-Gg: ASbGncuCx1RgdFTeOjxH/QJRn6KLLqH8t1cwBeuh1apwqV/NM+r4peEazyWONTwsCZN
	igu9NaIqi9gVIsWtfRWlcnMwFBnFajU6G5/M7mSXOx0kpLNdp0DpNBnZvPmiq2miarQDlzW9ic/
	lxYDQJTa6C4V9lfgmVs7QTm7QhiErjAsRTWXhFxmsSW9PYU6TVUj5ubqquKsT2cVjyCS9BWfzid
	gEbz9DY2Rdx0RLOKw4LKAzj0K/6oDSmAkPv52NNQ4YSgIRE1EMTlVbyc5YTWqa9WPTENuvYT3Lu
	vyXAhnhtQ9wGJAzY4VosRoVefcrBovbhOnAlePU/E+v0FM2Gp6a629xzBfuLzTa5QTZu
X-Google-Smtp-Source: AGHT+IHs1VOvbH74HBC3VcwOcN7MOCMT0bodbdljyOmjoFYNhPQCucKzp9v30TbevBnlEmQ683kP3g==
X-Received: by 2002:a05:600c:5254:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-4390d5b2fa8mr64022775e9.31.1738850803080;
        Thu, 06 Feb 2025 06:06:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm1444844f8f.92.2025.02.06.06.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:06:42 -0800 (PST)
Message-ID: <cd9b99b0-0a63-4c6c-8064-e48f98fa7c02@linaro.org>
Date: Thu, 6 Feb 2025 15:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
 <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_060645_562988_9B722293 
X-CRM114-Status: GOOD (  13.03  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 06/02/2025 15:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   MAINTAINERS | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
>   F:	include/linux/host1x.h
>   F:	include/uapi/drm/tegra_drm.h
>   
> +DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
> +M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
> +R:	Janne Grunau <j@jannau.net>
> +L:	dri-devel@lists.freedesktop.org
> +L:	asahi@lists.linux.dev
> +S:	Maintained
> +W:	https://asahilinux.org
> +B:	https://github.com/AsahiLinux/linux/issues
> +C:	irc://irc.oftc.net/asahi-dev
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
> +
>   DRM DRIVERS FOR RENESAS R-CAR
>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

