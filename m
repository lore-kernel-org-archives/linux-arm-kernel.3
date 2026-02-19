Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664B8E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lDuxuhfvhyYj9DmohVZkkBnQY63QlxYeSYRoTS+Ns0=; b=pnzoShzucQgh699Bbm0H4ukwaa
	o7uXnctxP/ZAQ4V6rz+kr5begWr9UACMUrUgg9iOBs41gMYs3RLyeKf62NBZpw3JA0yCWgO+RkH2w
	x6Du+2MrvOHZCX1aOFxfn6tMabUB0Po67SsU1eoqid3xPO0/z3XK1q6Sw2jhu3KB8Hssjqa7+pS5w
	PDqBMBzK/cqvcgnucLqUVFdJAeBdQfNyOwJbuLHD4nghUJX3KM8A8oGP2SPTP/g4bokX954cQxWT8
	D72rGugF6rXPWnLT+c9yrZTVxUsTKtD3YrFhxiJ6hcM7jQkAdBYpJJbds+zpGc4DUpL7arw/E+0W5
	7Ov2XsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0TT-0000000BBGg-18JR;
	Thu, 19 Feb 2026 09:37:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0TP-0000000BBFR-2RlI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 09:37:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 248D34E40544;
	Thu, 19 Feb 2026 09:37:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E33805FB45;
	Thu, 19 Feb 2026 09:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A23EF103687B9;
	Thu, 19 Feb 2026 10:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771493842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7lDuxuhfvhyYj9DmohVZkkBnQY63QlxYeSYRoTS+Ns0=;
	b=Qs7xBkjojWvKSegG56N80vX1+QzwYAIXimUmRsF/s0TS99jdUnoogsbA5NP//I1GCAQqp3
	VSoHLgSRu2M6OIOMffopO5HwVljvbBgD8R5Ja+U5gzdvbe/rIGIGOGXZcduJVf3WUe1CbA
	AFZ82ON8jDPV18CAzchq8isc2CMcAndYTcLUBvlsVkc0ltDhNpuPLZZ9C7F91YWQWuplwH
	ttScovBRCuqDRb3yUz//S5eiqkDq61n/5PIe2L99QulQQ58VHS8a3Bik4ciBL7VxczIR8M
	0SrwDH9E80uCB0Aw6GMiiNqhe3FK3GuW9wy8FogHz1IUqCqUSuO0knB73KeKsQ==
Date: Thu, 19 Feb 2026 10:37:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Message-ID: <20260219093718b7d29076@mail.local>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_013728_119756_1487536B 
X-CRM114-Status: GOOD (  21.74  )
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

Hello,

On 18/02/2026 15:18:34-0500, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
> 
> Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 770b9bfbb384..fc52149ed6ae 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -22,6 +22,7 @@
>  
>  #define DRV_NAME "rockchip-i2s-tdm"
>  
> +#define DEFAULT_MCLK_FS				256
>  #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
>  #define MULTIPLEX_CH_MAX			10
>  
> @@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
>  			mclk_rate = i2s_tdm->mclk_rx_freq;
>  		}
>  
> +		/*
> +		 * When the dai/component driver doesn't need to set mclk-fs for a specific
> +		 * clock, it can skip the call to set_sysclk() for that clock.
> +		 * In that case, simply use the clock rate from the params and multiply it by
> +		 * the default mclk-fs value.
> +		 */
> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> +

Maybe this could be set as the default value of i2s_tdm->mclk_rx_freq
and i2s_tdm->mclk_tx_freq in rockchip_i2s_tdm_probe instead of relying
on it being 0 and testing later on?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

