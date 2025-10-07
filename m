Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCF2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=; b=Lbv2eVBYODZ0Xk4AtQEk0B0Os7
	wLdXHwtgSUmM7zuaDFRz4MOo3bQxXczVaD+knU3Ms7QDq85huYmP9kAlZY3KQwn4IOqj+QrcSPGRr
	nfaeO+dMOzB29nuMdPYkyCwzi+lt31YphjT+vPiazD3sV4fLV8S9GkiAFXptJO21F6UM/jRTPfEXu
	5dDqx5N0WTswxDEiN2p417llm0N1YGqIfhj2HEoviBDPtuF2KSUZacTjgM2GQXFxRTtYGwMIT+aPE
	qHsNk8kCw9rFM1Dq3r1hojzJpbdap2A2GU0d+ev90NL5gnzz+bgX2kdSxu6yudMZKawDLgmjT+3V3
	sIlWtT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63hs-00000001fwF-1D14;
	Tue, 07 Oct 2025 09:10:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63ho-00000001ftU-3LAp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 09:10:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3634673f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759828199; x=1760432999; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=Qo/78vr1+mCvxco5rVDppQweK54WGIvdkKgPtolAPcO6jovHryCqeldIdZuvaPaFy2
         taJmBN79LOn10O4kagyvGsrepYGGZ4MA2j/uBSrUQrWpznz3z18IZwe+/6Oi/VQsOGjC
         yjNmfctac4HZQcCvlX4FW06LW+jxEqWajyra2BrKz7nz7GkdF7RQQl4LcgS356XhLcem
         GxwujEbl3qQT1GCeudi9E007iVWQX5Cu0MaNrQ4am5cdgmD9oAWRc/RQXTUQWJMkr+D9
         kYDeaed+J8hemWlsNjGXe+LRCzxKOZwL0FHQBrJqSehnGCSNdaiQ0hxOLlnYVQY5Cev/
         KyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828199; x=1760432999;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=GpAjfbOpN27BHi3WmEnMHYtUKu0EZ9h+fBrXAj95TYv5iq6E5/1Kmocg4qw00JuLru
         bCPxUOtWBdDHNAd9pd1i1YPRlzW8pVRO/drszCGKcnXv96nAFNxzspsoOxKmFGtfDiOR
         WOb/mujK99WeGgViee05EHOwFW40G0SGGONkV7oPPZyj7/T3Gs3g8BQqB6tin8TIYyYq
         +d2q0IUKBdcI+0IXANiLkA3ZtXZdwcjo9MqNX3gM4TL7NHljvHeFiAknb1OGnBEyh2ob
         dE1CUK7cF3dMfjLBY9v5n/D1YYG0HiCKL0y8qe7/9U6bDDjAuSdMXPzBbZu9ulJo/V+O
         UUdw==
X-Forwarded-Encrypted: i=1; AJvYcCXbQpCMhGx/Ju47UAHRYgY6DfruzrV8fdFyW2CIhtn0LMOYz2Z6J2g1ze3OKy5jYfkLU6tu1mXe+BuTj1uuYyk2@lists.infradead.org
X-Gm-Message-State: AOJu0YwJsd9qQ+VZWOQ8o2g0kvBPvuSwF/MtjkCconGXtHDrpwVE4yHj
	BuLQlLoHCrbkt7UL61PvvPEsCyuwspeH+9yZc0UyG/4vxe75Gc7YOJLOM6TaWZLBgug=
X-Gm-Gg: ASbGnctW9q2PI6Ai3at5PunXRQTgaWgsYzlH5gFSN0HSjQk+6LXG5tjZsYREupe0krm
	+sSu/iPA/KlU2GVF8eTnY12QnK94pktVNHNDb3W8VDNIw1G0FFKCH4oDGK1C/IsbVGQwHsSBINk
	uIlJ5JYqXGGrUGJIKCcJAA+eSipQ+moh8kBz8SHQNUrICMIj1pO7rZ1+eVeN3MfQ+fPs96uDvi6
	Wu414Dy/s/v0gKMdRTYn6YoCcY4p+JyAOYC9UYD1Z1R/ZElp5pmF2cASbCk0TA8xFhaKlbvzrHY
	/i9mpfim+XVN4fZ756Jjo8w9qNBjHZmD96552EWMeNdGDvNAqiLiOY5w4EBbfJiJSJw4vwJie+T
	kWvmyiD/LFkFibfA0Ar2FHI+D+StrHJmBezgVtzLkx2W3DQ==
X-Google-Smtp-Source: AGHT+IF130TGahKPPoII82+V1/81eeS1iNZCVCSTkdS9QhSxObU5gtpJPCiviLrBgBxmw1J7M2QzJw==
X-Received: by 2002:a05:6000:26d1:b0:3ec:db87:ff53 with SMTP id ffacd0b85a97d-425829bf154mr1925989f8f.12.1759828198634;
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:513d:7ba9:7d81:1c37])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm24412592f8f.44.2025.10.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  vsetti@baylibre.com,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
In-Reply-To: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
	(Valerio Setti via's message of "Tue, 07 Oct 2025 00:12:19 +0200")
References: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 07 Oct 2025 11:09:57 +0200
Message-ID: <1jplaz3wnu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_021001_160862_5840CF10 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue 07 Oct 2025 at 00:12, Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org> wrote:

> From: Valerio Setti <vsetti@baylibre.com>
>
> According to I2S specs audio data is sampled on the rising edge of the
> clock and it can change on the falling one. When operating in normal mode
> this SoC behaves the opposite so a clock polarity inversion is required
> in this case.
>
> This was tested on an OdroidC2 (Amlogic S905 SoC) board.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Tested on the libretech cc s905x (GXL)

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index a0dd914c8ed13616fbcbc0828e36418cfd255391..3b4061508c18047fe8d6f3f98061720f8ce238f2 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -236,8 +236,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	    inv == SND_SOC_DAIFMT_IB_IF)
>  		val |= AIU_CLK_CTRL_LRCLK_INVERT;
>  
> -	if (inv == SND_SOC_DAIFMT_IB_NF ||
> -	    inv == SND_SOC_DAIFMT_IB_IF)
> +	/*
> +	 * The SoC changes data on the rising edge of the bitclock
> +	 * so an inversion of the bitclock is required in normal mode
> +	 */
> +	if (inv == SND_SOC_DAIFMT_NB_NF ||
> +	    inv == SND_SOC_DAIFMT_NB_IF)
>  		val |= AIU_CLK_CTRL_AOCLK_INVERT;
>  
>  	/* Signal skew */
> @@ -328,4 +332,3 @@ const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
>  	.startup	= aiu_encoder_i2s_startup,
>  	.shutdown	= aiu_encoder_i2s_shutdown,
>  };
> -
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20251006-fix-i2s-polarity-d744338fa223
>
> Best regards,

-- 
Jerome

