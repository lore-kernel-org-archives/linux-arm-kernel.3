Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBA3D4335E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYfmjInTwSrf8wkLQDjO5520/3amtQeI91RgnNq7ubc=; b=oKMZrpFxHsHFe9UnQB3mPo1+c9
	uQ1hAt9/sDLhiBvkd4dl1I/Cio90xuyqOE2DHcd/XVP4x1DvJVH6z+Ikeveph/uJexqgqvQYXV0CV
	ddVcS4I8STQJvmc8MDTQE0D/M9aLt5CUb1k7IzacCcPLBPrHVvdq/5D2YTPRTuci8XoCG0H2v2zt3
	uEvjDutY6V4T3JWIuqi42SdBAsfAJrBG5NI5tO5nm0hJ4qgS5HiA6ppQF2SZmdGxMqLD0klr6aNbX
	GPKdYV6AlLvkdfGYtmYvEuWgUhr1CNJig1P7NrV25itUlmxYvsb9RkwzZsI8AvvgldTlMNn+zPwCo
	sqBmrixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92qm-00000007AHh-0jVn;
	Thu, 07 Nov 2024 13:47:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92oz-000000079sz-2syq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:45:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53c779ef19cso1086590e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987111; x=1731591911; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYfmjInTwSrf8wkLQDjO5520/3amtQeI91RgnNq7ubc=;
        b=EbWiM0Rc5+b4JyMpt1bCcADaYcwNT+gUpA/mrIjQnE1W5UGrAtzsRz+F7MQPtXQ6Pn
         ggmOhnm/koQQCNfr90BvjVmof+7njUegXyaiTsznQbFflJoMqIvPK9Xm2ct19xMB7t89
         1UkOoQDjstmwYNeBw2yT3RdDs48HnVighe6+yDQL3bpHl/3dISaP8KZflIvuvlQZ29o2
         LcLxbNLnBiTt3wdSOfGAAE3xwA33x2RYpR6dFCsoSQA9G/R/r2pzWfASAz/BYhe8tnpn
         ezQkAKCsgj7k9wcyDwKukbewwmfJXjdGXyysYOd129X88qJ/JQNn+AwzHvMWi/qVpKc4
         z5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987111; x=1731591911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYfmjInTwSrf8wkLQDjO5520/3amtQeI91RgnNq7ubc=;
        b=spLV3mSJSgGXou4zJspF0rVqTc3xiAMrYGXO2bgD691d6nUjMQa8W/9FITnaNwk8ec
         nA/r1dGLyyVyCwAIl0l1eTBKSp08KA9tx8WOVTZsjk1IqL1ztX/CeN0hnQ4yzjj5C/T/
         AECq/B7/tVJSZRd5QePifCyZBTJODbxAu5ktswQ5d/Niz2dGAQ3RWo9Tw/qDXviPrF5l
         fOZgxKejAf1kZ7B15puFg5WRCibj0jhPnAi9s7y8huXfI6RiX9rKCMwysVQLXhe3dLNa
         Rz7u6r1zSCJ5/SGIIrCG8LnQQG5cybT6puPbgEF3OWNRNHgF+V+mcQ0KgmwZhzV9blJ5
         rvlg==
X-Forwarded-Encrypted: i=1; AJvYcCU5Np6Z6rA9QQB3Rjh8hGj4dNDf/x/c7+naxlHPQggNlCQzB+F/3Uo0VwgudPSf30qtrfIno+lOOFPQhO7JGn4h@lists.infradead.org
X-Gm-Message-State: AOJu0YwQZTravKkOVlbmDEQDMQDp+o8zh7f99z/feULaKULaIko6bjtJ
	IgQ/glnHq6D8xZZ/wenW+jHx+n6toxUBrAfJSDesQzcBAw/inNB7ImrdbqGZGy0=
X-Google-Smtp-Source: AGHT+IFl+p0mMdxu5dSXrUkocxo9piGoG3Bvth7m60W3yHUYwLPE2t5/+pSBydipp+y555REAJVHHg==
X-Received: by 2002:a05:651c:543:b0:2fb:628c:2580 with SMTP id 38308e7fff4ca-2ff1e88880amr264501fa.2.1730987111409;
        Thu, 07 Nov 2024 05:45:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178f3ba1sm2202531fa.35.2024.11.07.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:45:10 -0800 (PST)
Date: Thu, 7 Nov 2024 15:45:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH v5 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI
 Host Controller support
Message-ID: <6r4nna5i63eo7oo2xoclqxpuodbttvxceuwn2yl4to7aqti3md@i2wtdzhsj4fp>
References: <20241106093429.157131-1-manikandan.m@microchip.com>
 <20241106093429.157131-5-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106093429.157131-5-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_054513_755003_0BCEBF79 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org, claudiu.beznea@tuxon.dev, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, varshini.rajendran@microchip.com, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com, dharma.b@microchip.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, jonas@kwiboo.se, maarten.lankhorst@linux.intel.com, mripard@kernel.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2024 at 03:04:29PM +0530, Manikandan Muralidharan wrote:
> Enable the Microchip's DSI controller wrapper driver that uses
> the Synopsys DesignWare MIPI DSI host controller bridge.

... It used on the board ABC DEF.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  arch/arm/configs/at91_dt_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 2022a7fca0f9..3ff89e27e770 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -145,6 +145,7 @@ CONFIG_VIDEO_OV7740=m
>  CONFIG_DRM=y
>  CONFIG_DRM_ATMEL_HLCDC=y
>  CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
> +CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_PANEL_EDP=y
>  CONFIG_FB_ATMEL=y
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

