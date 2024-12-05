Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7945CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=; b=iuHRzPFKfclXvqNrk7yJBfS91h
	XB7AGMEHe1fQxbphZa2/XDn8EnAno7FFW7r5JLw+paEhMOcZaJf7x0PyISDvzIPH9VIscCKcQd9nQ
	3OoalE8rB4PvKP0TgxKxHifNEHF+9nwiO3jTjVEC1NwkVERYD2G2/3YTSi3uasFnke3J6L5O6yR1B
	fEIZozty4M9Lpp8g2t2D9pucS/bmpQCJHNqwb+ybA6HVJR/wXjF+SEtNZKOlJ/WpOw6/Mo5VM03RL
	lxYTGqrc15bOXz6dmbDns8sDnmOD/uyANWsCyyuaVpKZp3BiaHCBI6s9/vSE6/kuDpJvAnjl3DPxh
	+a2ujn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB47-0000000FyNg-2myB;
	Thu, 05 Dec 2024 12:34:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAyj-0000000FxCg-14QE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:29:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df1d1b726so871332e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733401747; x=1734006547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
        b=fOXG1ThTgx/K7CbWjzoE0AkL84ippEO8UNZM0vTpOICQe1KsWhfrp9R1HIKuy2UlpR
         UBgvdcinEPD3VXssKRg8xk0w3yQ+9U4Bd4ZR7hHYuTi6tLRsky1XCQX/7lMqPdXZSqxV
         la62651vZ0wfYAjUEM98ye09pEmcU1qMLF8OaQRDUkMYb7X3okJYViLa9yIO4zR+C0IW
         FvE7adH38k6R5EnT/0OkUm8O/6i+k61gsE4YhYCjO1UqYtLK1SMP3Xth75ITIDaul/9N
         HckOODUWAc894wD+DDZ1jvizw17k7pokJDWy9gKCNfJUUGAauGyk9yqQdjfFcoNsMZZ9
         9sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401747; x=1734006547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
        b=iN2nv+1U74tHkabPAHtwVJF0fdMbmlQM+oteNwHdPlsbWIoebwaC9OabfSC6uu3kla
         SXfU1+jEfBVR1I+xDC/1QqQksGkdyV+M1qoCVzGPInwiCaDn61zhzZgVsF2IIzdo47lb
         DVtP6RfoLYtAAV71Ixk0qHXlzDWbMNRoeAa63hdwksJAjqorne8o3GITlZrncJslMHh2
         ybJ5q+Ob8dKpIPEuPpPr2RP6FoE4uuxH73CUD4roqAApZgicwdlwG7F4lYtkkakIAjDN
         xAEAiH5W1PNGfpRF29afHtmAsp22Ocmm9983fUYTVVlma3fcZMFzf6qOmgo4ovIjrum/
         2Hmg==
X-Forwarded-Encrypted: i=1; AJvYcCU/tpaNdOYpwtX3wRzPd+gkGrfL7ZMomm2Btg9MhmRpFQfF1aLD7B/3PELWo9OoqipMbMl5REWIok4s8lUtdtot@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMa2pDXZ5/1zAQA9fSF82MW6ysGbVMCnMLp7CzF07WQfjKchd
	xH4L13K0z8z0T8MBIz7pWjBjbzd12cmy2WPUjEQPX3RIpB227HWMremFGkqRIt8=
X-Gm-Gg: ASbGnct1cPDvmk4xoaMd4UVSSGq03epDiY8DoqezUFOP2TGmiaQJUh505BDOfC71ZMM
	8I0FD+gh5ygZlGTqd9apxyMC9RNj7EUE3+Cg/OcPW8woK2JYVVaSqvc1VuT2cM+f2l564n9XxDh
	AiPdDJK1Uwr96C0+bM0hqk157HDHez6FqeqSb3hR/ahm857YO6lCxgjYePc+Cz2jG2gwVczb3Q8
	tBnNzHL8A2J8YepffU6xwiAjplOiveZKeuxFTWuXAeDzrPEEsCC0+ShfK2SXMbLroNOYgpu2NFa
	/c0/qSoh6hgS9U8TcZwQ7xBh7HEipQ==
X-Google-Smtp-Source: AGHT+IGWyrIJVNkXZfMk2D77Z12NxWguDqxu6KGooscExaYt6vk4bYi8IUDxyjnT5IkrNFyNFyZrTg==
X-Received: by 2002:a05:6512:3f1f:b0:53d:eefc:2b48 with SMTP id 2adb3069b0e04-53e12a01888mr5509943e87.33.1733401747192;
        Thu, 05 Dec 2024 04:29:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c1d6dsm233341e87.183.2024.12.05.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:29:05 -0800 (PST)
Date: Thu, 5 Dec 2024 14:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Message-ID: <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042909_305359_A3021567 
X-CRM114-Status: GOOD (  18.18  )
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

On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
> 
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
>  5 files changed, 729 insertions(+), 635 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> 
> @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>  	return 0;
>  }
>  
> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
> +				    u8 *buffer_avi, size_t bufsz_avi,
> +				    struct drm_display_mode *mode)
>  {
> -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> -
> -	hdmi->csp = HDMI_COLORSPACE_RGB;
> -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> -
> -	return 0;
> +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
> +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");

Please use the HDMI Connector framework instead of handling everything
on your own.

>  }
>  
>  static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)

-- 
With best wishes
Dmitry

