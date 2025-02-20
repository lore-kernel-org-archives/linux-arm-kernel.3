Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493A2C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxXRd6kScNWklP0aI84Uk3jfvKHEaeWScRLyJ37G088=; b=4MNU7C/hx6hp3dqfD2KwVJhJix
	VKMuWSUavEjqPLp4nuVhk+cLPrcpyu+7sOOWwBsnpIJNkpo1CBhjF6xEFSjeaUmnyn6W9jO9QH8fQ
	OLBiyzpbqRHnrsAIddIvhr1S5/xVvLGtb9UaCLJyc4tJGslq86E61UXuOzi9egopzj6gsERyjR+WM
	SeAeb4rC3KrfBEqaJRjkoG/cWu1juT2Y5iErEMna79hEr1lJngkkyxe3jFEMzBKLqeuohnB+3piEy
	+Cpybi5H4Z8zglfngwll3eXkEaVBtUajGpvIsw302/YT0oXl4BUR+AEe7zlBzlCfX1SFx6MwmwjSL
	btOeaaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBtM-00000002XIv-3ia6;
	Thu, 20 Feb 2025 19:07:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBrj-00000002WsB-12gK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 19:05:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so789856f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740078341; x=1740683141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxXRd6kScNWklP0aI84Uk3jfvKHEaeWScRLyJ37G088=;
        b=OufYI7tKIyP0Q8+ZP2GJQNIUPSnY6NM6DXN8XfrQzUq20PnXSgNdVo81GcbNrUyqLV
         Q/bP7Wo3iAmlJ07wZk8/CglNZkMffz1XX/CLWVxWUksTH7v3Nm+D0DLC/Wj/cG1B9VvR
         Vs9kXcHljSHvRJHlNwxLzqYgTGSVFs79DI6C9O90YLDPngRSF2wxXuqvLXKUpcy0t3Tp
         jXSG+Pbhajq50QcWlahDViQFUOI/kZceijGsEX24ORxUAkvswe23U2irxKokimNOyHuz
         KOysOC4lKzB0l5CbVOm/MTvIhVNJHUrQY65hFrmNVjEBxvYdtUdpLZ1MqBT4shosfcLI
         rCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740078341; x=1740683141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxXRd6kScNWklP0aI84Uk3jfvKHEaeWScRLyJ37G088=;
        b=hh/ZGmDIenL9ZixCHkXPt6WkBGWrF3udph1hGEbAPkUN7RaChg1dgB9ukaj/x5b+kY
         etdhAbMs3XfRCGBE4dSNGdi38o1uHa7s1UpuWRqgYm8FuZSPJzfrOgxClWNaq67k82R5
         seQH55CoOPDZDAJHXMAmX7blHNHEttE+yX7qh2iMR2S0MmEjrWWhltWNL3M7wDk3g/AD
         hHJXXtTuz/1Dgi/Ho3KGrbSQ6TbNHug0bxESbz4348moGAvskdTQQcu4tl/CZh7+qXfS
         CcFsFd7tzBGH2JJLfPICla9wR6j7jg4TFy/VRiC5A080J8U5D+Zm4Bo54tmw4Toch045
         vf2w==
X-Forwarded-Encrypted: i=1; AJvYcCUiSWnJY37chcXTIkxCMCYXFabaj9H54ScElVbI/QTPcNArESOKcuvwHti4g5uKQ38a5jqpayVPhWpEUaPJKK5U@lists.infradead.org
X-Gm-Message-State: AOJu0YwV8hcybMRlJeeyIfLdDIyJIq4CFjKZShfuahHd48CyurQuA0ez
	Ojw+6S8kzfmXDssjg64gw5OoDFSTFkbe/SVADf0p6GG3DYr2Zykr
X-Gm-Gg: ASbGnctYxcIyd7FTkyA8Q91vaDkMg5Hq9I0fc66KIgZJjbwpkLf0svf5Kx0We6v6+e+
	b0fn6T/5Hm2jKj4TcqjV6bdE6hKTALI9YABk/C1JQCX4tEW5wq+WqOlcw3ox5iPdf6RbhtuBn0d
	PZRXe4p451SMyFzfxnAhVx3+ktPnZ28ofXeIChLXKNBMZli403BDZpte/mnx6SYu8nb7lSD53Mg
	QwbwNogirIUfs6muJtveVZXmPLrVP9Vj51wuxWEoNEmAGKq7/FRmXijL3vS27ZDylt3p+RNR79C
	dCJQnrDC6PdDOINNHuanHVCcUBmgZIiCQxnKuxDJfiiwWsXf95jnDINpYvlw3mgrmX4=
X-Google-Smtp-Source: AGHT+IHGlrHIltTgTcFWFI4O0gp4KyFom8vkd8k5Kir49mlEGZQwrYgDsE0U7DMZu3givQVd9isJuA==
X-Received: by 2002:a05:6000:1ac6:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-38f6e95f233mr316305f8f.16.1740078341247;
        Thu, 20 Feb 2025 11:05:41 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8121sm21083169f8f.88.2025.02.20.11.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:05:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for
 h616
Date: Thu, 20 Feb 2025 20:05:39 +0100
Message-ID: <2733255.KRxA6XjA2N@jernej-laptop>
In-Reply-To: <20250214220247.10810-3-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
 <20250214220247.10810-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_110543_286979_1E1FEE18 
X-CRM114-Status: GOOD (  21.22  )
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

Dne petek, 14. februar 2025 ob 23:02:24 Srednjeevropski standardni =C4=8Das=
 je Ryan Walklin napisal(a):
> The previous H616 support patch added a single LINEOUT DAPM pin switch
> to the card controls. As the codec in this SoC only has a single route,
> this seemed reasonable at the time, however is redundant given the
> existing DAPM codec widget definitions controlling the digital and
> analog sides of the codec.
>=20
> It is also insufficient to describe the scenario where separate
> components (muxes, jack detection etc) are used to modify the audio
> route external to the SoC. For example the Anbernic RG(##)XX series of
> devices uses a headphone jack detection switch, GPIO-controlled speaker
> amplifier and a passive external mux chip to route audio.
>=20
> Remove the redundant LINEOUT card control, and add a Speaker pin switch
> control and Headphone DAPM widget to allow control of the above
> hardware.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 886b3fa537d26..f24bbefeb3923 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1916,10 +1916,11 @@ static const struct snd_soc_component_driver sun5=
0i_h616_codec_codec =3D {
>  };
> =20
>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D {
> -	SOC_DAPM_PIN_SWITCH("LINEOUT"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),

Will this break sun50i-h616-x96-mate and sun50i-h616-orangepi-zero based bo=
ards?
If so, other solution must be found.

Best regards,
Jernej

>  };
> =20
>  static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widg=
ets[] =3D {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
>  	SND_SOC_DAPM_LINE("Line Out", NULL),
>  	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
>  };
>=20





