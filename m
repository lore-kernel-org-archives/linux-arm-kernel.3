Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAC2CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLN68owvefwcvtwIzXYYcylLx8/qFYkuAE3rLVHaimo=; b=VmHwapYi68nptbADMhDlCuLGK1
	pe5zdQUaS1ryU0q3VKopOeSJSTq4Ka1+ql65L+vYLqTEpMo93WbX1Fl2qQPvWdTm0U+7D5WNUTu4x
	cB3Qa9y45qGEDOT9deBySWSQ+JzTIvPO48oNrSDcOvOtgoaXhxwyLIMcobAcpCy9D+2BvbaFgsHtv
	YSKLXHVc8ufEBqhGxGnjCkW6eMEOqJ4J7xKrJnmbX/1VQdQuLnItvsvZV8g1iWdlQIie0vTtAnTsv
	p5Al0b2Yka8JYhKdC3ue+O3ezg550AiyG8B+oNWpATmvW2dmwcPWliIpRZkMwH74HmEYDmWNYlH54
	QKt9RNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENGC-00000001ySw-3AC5;
	Wed, 07 Oct 2026 08:44:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENG9-00000001yRw-1uHn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:44:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11619625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362659; x=1791967459; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLN68owvefwcvtwIzXYYcylLx8/qFYkuAE3rLVHaimo=;
        b=DEXGwEwjE6tef8XeJNeKvkRkSWVADIOOPdx+j5wd+N1PtGCh9VwQ5oGr4PBSMZOPxc
         xHAAcaCC//A9gMyKsx84e58/eK4HRk3LXhOEjPdJSVhB9ML+39cOSV8A3WR+smRrbm8S
         cRChcwq+190+UQCImCV2FK7S+ELOFjNm1pCr0fJY970l/bHfHztAbIq3ADBla4qQjZui
         Q15xwPJtYJ/jl+kscR4jD1Zmgj8j0rStMgulRjOyp6JooWK1fk4oEkRbZHchVXiHu7I/
         38pkIRFTdPr2tB5jaX139I1orbkXVx3797ufbsPvJTv7YIbxCUTdT+om2uktmGdMaIID
         5PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362659; x=1791967459;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLN68owvefwcvtwIzXYYcylLx8/qFYkuAE3rLVHaimo=;
        b=f513CMGRaV55UkAfxaqMpOkOv5vbAUWj4vKFG334HLk+m73jWtycT3mNmJCxZUV3zI
         3fG52d+yTBnh9beaAMG4U+8UiwbbMPuew8jkwiM5PZ8eCeWY0d5skUp4tf50ZDbPBsJ0
         4ssq/JzO0a7sAtz9ldQ5lSd9Z/rdKSwbRIrfq916C+yfTChNVbBo241zj7uTEeyIh80S
         KfjhIUIezmipfcQD+xA3kBmQYFUYy6xfsBhsEIvCvQNA9PY7EwpwuizVevIOlXYb7koh
         437TDtwZAJBEU69EZDo1OBz61s2OCR9nzHRIZBmhFfuwAWMpNQp9lBN1ARf8ROG8WjBz
         Az0w==
X-Forwarded-Encrypted: i=1; AKwUvBxuBEJ0PXiSztg59X/53XglAWJTcGpRgwUrRPTd2ObLSaKhzZvXh4GvKyYlI1uvcgHAvIrswB9aOTuFBSkmMoYF@lists.infradead.org
X-Gm-Message-State: AFuF++m02jkuTdJjYbk6/y0w/+8gD/5nnB5EL31SmWUml5b5BcSvuZGw
	BGeMy/gZApw6w4yv3rFTPq5haW4N1ascUgbXVRaVGGBmI8MY7FrABnbcnYd95s8qaEHYyKKcQQf
	Vr/PQSMQ=
X-Gm-Gg: AYBFou35NuKLrD2T7NUSTusp18kvWzaLR599hzy0ORHKWgdaIXZkxTB3bIiLeA60i/x
	IE49XHj6IKXToN3KabmThZsX5LZC6iI94EhUF6AAhi+3INeRt6wu9lp1iZzrQLeIQzY91yMz/aq
	uENAfQjBFNiP2t4sZGpuZS/InFgYS6l8qy/wM7fmWErPb/i8HyGahJQxKrTgCKHcbGvRqkLfC4j
	ku3dvVCZEw55E4+wdS+mpFQUuvRNsePU2rYYiTdYPQGbZVXYQuPfhUWPoi1kOSQuvaIOxz40bE5
	uIHf4paWmb6ORb0B1DYrDGeyTgCGQoqH120KNDkP8zJcrTXoHzrfqor/laB/G6iqdvE+AFoygWw
	lM1brYd63Kx0sxR9kxiVrRld/EQ8YXwf5O/9zxAw9zoXxUHsLvwTWCsADnZqikJAba3fm+6KPa0
	B7gly5Nn/M9L+yO4zifv4+R8cf2vIjpBa0PZ8Sv/oPCZNQdUdqwuPn7vKJeZTJhTo9RHDCpeLYT
	Pq+OxqE8ycy7Js=
X-Received: by 2002:a05:600c:5397:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a1806648admr20104225e9.29.1791362659071;
        Wed, 07 Oct 2026 01:44:19 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1803040cbsm25745595e9.4.2026.10.07.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:44:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
In-Reply-To: <20261001-audin-v4-3-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-3-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:44:17 +0200
Message-ID: <1j5wzdzyqm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_014421_582827_F10A5FBB 
X-CRM114-Status: GOOD (  30.55  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> A recent Sashiko review [1] on this code revealed the following problem:
>
>   If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
>   and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
>   snd_soc_dai_active(dai) remains 2. This skips disabling the clock
>   divider.
>   When the streams are subsequently closed, the ALSA core skips invoking
>   hw_free again because the state was already changed to
>   SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
>   enabled, potentially draining battery or blocking system suspend.
>
> This commit resolves this problem by using the 'clk_enabled' field of
> 'struct gx_stream'. In particular when 'hw_free()' is called on a stream
> the code check what is the status of the other stream and then only if
> both are off the clock divider is disabled.
>
> [1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 58dce9f08c9d..70ea39c77b32 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  				   struct snd_soc_dai *dai)
>  {
>  	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);

Not sure about peeking on the other path like this :/

>  	struct snd_soc_component *component = dai->component;
>  
> -	/*
> -	 * If this is the last substream being closed then disable the i2s
> -	 * clock divider.
> -	 */
> -	if (snd_soc_dai_active(dai) <= 1)
> -		aiu_encoder_i2s_divider_enable(component, 0);
> -
>  	if (ts->clk_enabled) {
> +		/* Disable the clk divider only if also the other stream is not using it */
> +		if (!other || !other->clk_enabled)
> +			aiu_encoder_i2s_divider_enable(component, false);
> +

Looks like a race condition is possible here if one stream closes while
the other one starts.

I think you need a common structure between the 2 paths (with a counter
possibly) and it needs to be protected by a lock. 

>  		clk_disable_unprepare(ts->iface->mclk);
>  		ts->clk_enabled = false;
>  	}
>
> -- 
> 2.47.3
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

