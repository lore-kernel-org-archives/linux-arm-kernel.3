Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F67AE6403D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XshnFRtBSr7UhB3YJV64KxbBeRECk31YK3bPI5LBXvg=; b=wfF3e/4415nzuep1KPBTb30nka
	D0IxIXT5GNeXaSqqWCTD+r/1VqxfteEvaZHf9mXAx+jJSTepE6jswJS8MsiLb/F4NhRqnLxoUhBCN
	suIos0esA6m2M9ax7YRKfQmZMI2osSNTY6m6TujXym+z+c7TV+Tv8HZru5fEtG5Mcn7SsuMlPN+YX
	FfaC6m9mL1tenM5/RwEZhxnBz4mwzuLZY9XaU5TFfACh7SAiyZh00UtLDCoPZOQ+6wM93n7sg7RMA
	hXUUF8uisvcIIJsOwI21jFkYXLkWwGtpxEM16amg+eF62cfcQC4DwLjVy2Gc3GpIfMy95mDgkQJNj
	rApUEFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQnq-00000002Ere-2NKD;
	Fri, 22 Nov 2024 10:22:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQcJ-00000002D6x-15p8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:10:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2212724e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270222; x=1732875022; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XshnFRtBSr7UhB3YJV64KxbBeRECk31YK3bPI5LBXvg=;
        b=rUfQ/hPfnuqQEnhYWP5vXoYetZ5azWJ8p94S56H7vJ+fGHgxMgNN5LjkeZaB/NARw6
         Ha5RhF0Q4gI9pbCwA1RwSGc6PA6mkc3mxCib0lYaRvoz1arNpEffiP6gN2Fx1ymV5rUO
         BOgQX0uHA/fhPd9DSFjzlItOb98aXnkx45ov8CA49K6DeaFqWe2uCfgz2RkiI938OfkN
         2RD8SKZRC17sbb5n02fNuJ/R4wmQ/j03BMadBgGpL94ye3Wd+2lbJ2c4BarYcjmcUqGF
         iYRV7PcI956SFRGZ05Tmjpedn/RiiJ02h3oziZbRui0h4G3RgYm3sJr1d+Nj9/XMZkvV
         URDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270222; x=1732875022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XshnFRtBSr7UhB3YJV64KxbBeRECk31YK3bPI5LBXvg=;
        b=uSqalx0PT95f08zYKie48HY9rwu3fjLFWF28MS1W+UW8raO5p3A9s2NKcU8BeEpLx4
         wRaf4POsrrc7+oAlVC3auJQ7TT2RqFbaMWwLY9KjpIQ5ePjHaRShe9xuZ6INss7Km3XL
         IPpAwai6Ge2Elr6/2JEQPhLY2meqcBhFsw8N9o7Xt72vu5ZPiMte02PoBim/1DHINVJq
         I2DoCWJ6sqwWcGE0YpvYDuzMp52JByU+uq0B5rbrkxPinL53ykUduHgqbmE/QtrsmYe8
         3jREDUGAhuJI/dXZUCKNoYsG105SqyI6GmDMTt/+6CqxW7FRFVaOXyes4ITOGwUacvD/
         KfRw==
X-Forwarded-Encrypted: i=1; AJvYcCXkf/jma0TzXms1zVQaJ4wACKSoT3R7oidV1bR7deYTMNOMjv1EW4GFA1aGFw2adOlR9oKhuT9eHqTGiPZjEvHy@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXg0ErvGM3CCQ1/giZxFO/4UARupDbu1bNY/HO90VDSuzUGCe
	IWTo/kEo9C1xaNDMx2LkrB0wW0994DLumrQw6aD9RtLKVBVmSko+9czJH+/4gkc=
X-Gm-Gg: ASbGncsP0gg/CTQLauqS9Eu92D0/H4XevtIU85BRKT8KibMUPgsP7fXr2oVdB4J0yag
	lyADTM2gYEbPAQWVPuulKOaNksjFDvIaJ/17za+UrWhQVPDEANGRzKPvrVmvdmd9tjx+RST7BXC
	IwxXieXzWcsiSJsiP5/489ftrxUjgf5HIjELwhYgqhgg7gr8oic7aE5oUBzvXtsls5I5Mqsew/M
	Vm4XlCKRgQfHGgvvGyYfrMX8cr6WlE+zf/YAi1p+fOy6ZK0XACQsOgcIP5kdHfxiXi96NHQPFj/
	2MDtS/Qrak6Fb64qN3x7FQMeXxeecA==
X-Google-Smtp-Source: AGHT+IFPiycj5qeplibnOojl42rf2zmubg4BvxwbPRG3LEmjxqFIgmgvbEd9YnOjveQDfC+hRoc1Ig==
X-Received: by 2002:a05:6512:2395:b0:53d:d5fb:5111 with SMTP id 2adb3069b0e04-53dd5fb51a5mr687991e87.18.1732270221653;
        Fri, 22 Nov 2024 02:10:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd249c927sm311682e87.279.2024.11.22.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:10:20 -0800 (PST)
Date: Fri, 22 Nov 2024 12:10:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
Message-ID: <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_021023_306826_E9DDFFCB 
X-CRM114-Status: GOOD (  19.54  )
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

On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on SM6150).
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> -		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
> +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */

Not true

>  	},
>  };
>  
> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -23,6 +23,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
>  #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
>  #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
> +#define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001
>  #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>  #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

