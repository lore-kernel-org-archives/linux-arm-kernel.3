Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A142E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=; b=YqtfQS+haPKlYD7x5LgquYQS5x
	37DpsfySxCAMFwqbhx7zdCGEOHOS+w0hoBPF8heWHUqk9YZgN914UoDPqzs/RA7I6Ku357pyl+FV2
	x8ZHZknq6Ej7Gg7br7t1MYGwcey8RlsX5yH7kfHJQeIi3QW3qnRmr/AikN3X70SZuVsej8sWkgCKY
	5OIDhDSl1DEPgIvslZTEwSl2EpQ+4/ghtDQQCSGS5yiHJjnZNpEQF6vimZxNXT9mGu1CLrAtl0HDP
	OFVklhs+hPHrqPBEsifg6quLNGldW2gqhZg1kqMwxo/sCEphHVdPZdNZjbWvL1t+SZPI1GMQ+ZkEd
	oN8ySgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW4M-00000008bjF-13ko;
	Wed, 08 Jan 2025 13:25:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVsg-00000008ZD4-2kjX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:13:56 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so17704005e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736342032; x=1736946832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
        b=luPIJNq4hiS9/MMj3YKPv4yu19WRfzT0PaYtvf/S4fOSaw58/mGwywzkr9KsLDzaSS
         4QLpFwWQ0qZEueH4I/dxp/lqJn+YXG5NNHbzRlnSndBCSzfa6iOfExg6kuqfdapxmGjp
         gVX9rHFDRURF8aGQB1rVNW1VqNvXEg9MWo+n8NH7iw0WjuYSM7+ap0WN/LPioZImLure
         i2FcgTs7xZlxxTBN715Ip+LBQxFYlYLNqgqoZUdwswMMwDexOVirl2fBZhIdIF8yzotZ
         /bQGEIHcB4RvrkEB5phjWJ8taD5EGZL4W75XgUUVHPbN8gM/p4umgzmbmA+cY/pDNYDk
         csdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342032; x=1736946832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
        b=Itz4ucbxcLdonVexCty/BJnbcpmjOjkJRkLkvq8wlvCfyIpYTDrjZ+FiMieKZQaTOF
         lp0nX2jJtMR7qWq86n5ueqRba9XFlp/z6yyYXvmV4oFP9/Xhx7JiJDzpieK57F5X0NE7
         cdw+JhahBFpM0jcvYfqFps/OS37l3m4Y3dzcEnfohlQkKHOWUo4XwU8ySyuDt60HuYyU
         sKYvDF3L0RdDTKAWKEAgPVA11NzGERQ7/V7ifGRqRoD8mPjQmF2YPYeHngDd1q9XzSEr
         HFH48d8Sn7+ZSuvs4jwacshk4YBM1jD+HVeNAPGjy3bSMru4ACpS7NzVNDhnLZcjEWFX
         X9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWlOTgaCK05fCaBNYdYPW8gOcerlmMM56JS243Lg6XypRWSymeaFpXa+v0F/8IHv4pRqiVS1WpSe+TZ2dE7doq/@lists.infradead.org
X-Gm-Message-State: AOJu0YzzUIlRlAr+NCuPPk5HG0gHgUVa7nHV0LAxgSYMf0JPNzoqLHfh
	H6jpb+QME5MJeIXzZvEfZ3xXb3N64QtLMUZOBqPOfB7osrRXTp5Y/Qz7Uj09QPc=
X-Gm-Gg: ASbGncsRhRMNaWiKP+5zB9X/8uREem7SgxqQNHyYwLW5GeJa5kR04QWgkbwMfvNtntF
	xVNPIQHmKluhMW1TrPKmCdzGSgi29xs1w94HTsG63XOkRCm5rPvKz5Ne1oz1nXBTWILtLsIloD5
	ZnpIYzY7hZHltQdr173hUTNo15I+lCjvvmYDZwFZdlDJul8dU9KsBR5WAI4m3hj6gMkHrkkpiwO
	ICIHpKW9sQXYEbIjIj9JF2tyzKfm0U6VpEVO6Hec9XLunJgmrYu3f3H8oNDBAJv2ONADVWKw2LT
	qDXEIliC8baxzw7Gvaax7JqazGcHxvsi8oqE
X-Google-Smtp-Source: AGHT+IEkuQPiOLgGXs8zWdEMj0wAqNSMaSTV6vSQ/tkCnop+NG9gWvZpeLRpiajpdeM8K2LlU6tzqA==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id 2adb3069b0e04-542845b9480mr694480e87.14.1736342032480;
        Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54269fd89e8sm1549488e87.91.2025.01.08.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:13:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v4 33/34] drm/mediatek: mtk_hdmi_common: Add var to
 enable interlaced modes
Message-ID: <bovw662duw6ufmjleicb4kuhyn3an6emo53mgg3477dfuarapq@zcmekc7zzeub>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051354_698999_FF3D1195 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Jan 08, 2025 at 12:27:43PM +0100, AngeloGioacchino Del Regno wrote:
> Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
> which will be used to signal whether interlaced modes are supported
> by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index 4cecfef1466b..8841fa4e476a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1301,7 +1301,8 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
>  	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
>  	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
>  	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
> -	.num_clocks = MTK_HDMI_V2_CLK_COUNT
> +	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
> +	.interlace_allowed = true

Nit: if you have a trailing comma, you don't have to change the last
line when adding a new one.

>  };
>  
>  static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

