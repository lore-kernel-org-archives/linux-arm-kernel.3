Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5865C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMCSgP1jqOSpYfOyIfGCKgapP8IcMXQbC49KZ7zqoq0=; b=WhJc/A4VTz+Q/i
	xEBe+8zaeGyXFNJ6+fpA4TsRbbibLDZM8GKCvF9MHOgMqyNUdZKbBc1iFRRXNhIcamvJ/WVVnjmD0
	7LLw1zfeqMLJCP8yLLZhoaO5Q2vGWVqBPykJtaxqnhnFSoN80C7PM6sbPtHgYa+4mhw6G28mvof20
	oEzsgQrR3QYzWgD+529lc7ZSglA84d4sx3SqAiIHMOOteKN7S/4+xGMdkrzxttKIswOEURiUcg9tb
	/mBHR64q+SO8ZbUbwD22tsCrFaqib8aDwf9apuDFAna9054kZRNBWlVblRCojqY6Y7lqJvW7ySko8
	QHy6UZ5wznAneVTsJoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhI8-00000007JUc-2L8j;
	Sun, 18 May 2025 16:55:12 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGhE1-00000007JDO-1Qho
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:50:58 +0000
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso28951131fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587051; x=1748191851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMCSgP1jqOSpYfOyIfGCKgapP8IcMXQbC49KZ7zqoq0=;
        b=w93Z8IUild2WHpnauvR6kKIGcJelD6oi2WcN9wMWvjahxeAgjX5SWur5wv4rQHkQSc
         N28SlLib8oc9zyrLHUfv1+WtZNFCE6YR3UO5emIP4JqJ8mtRwkK3iSehCAX90ymGK8MC
         xdc4NSrarhkO+aaPd/SosDd0SO5HLoi8NiGUjcYALdxlZwqTwSxHFp63ugu4t9mjF6RA
         tRdpLNt2xgF2SUdzPxXhVfQOm/wikMRrceEkiYgnuI5wIyqj0s1Rl42At+Z2sARa4AJw
         z1D+ZaJfjVEAMctNWzgZrGZcP/yxs2zEiCIrL2ExjmjgPEEmfRFWiAjisSIDMWLiUwFg
         lwCA==
X-Forwarded-Encrypted: i=1; AJvYcCW9vSqnJkpU3u3x+GoBH/JDmz1A91pN/I61oFPQghawAQuL6v85aeiICNSMvYAil404q2vShFZ+dcm2BIBlessW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kBAKkg7Xa+ZmZDXnAc6SlR7SP37U48ynAbQOUI58RDDZQN+g
	mBtrqfavLKJm58QOQBextcVT3UvC8icnoRqgxK4H+hD3azgGItAohppAePvh7FLWtfM=
X-Gm-Gg: ASbGncsNrov23pa6R9P0/N0MYBNly+6z2/OPWzS03CvSaLRpRRV+qQ4uMHnEMeBEgXF
	Tt3rDrD3u3H+EVYnBIaBd/4jrL/zWoSG2xpFOHCTnbltIskzXXTeY+W+xVV6Y/RNPDzFKqlxB/j
	TGd9HJKkqllrLowD2V8KwDjLkieT3lOzMBlhxS46a0LUm9oAnb/fvSG9E2rQ0FuhXhqQbwHDK0i
	zQ39ebrhsezRpByjfzBlXcdpGnBWvIVdn6EhERI5pzqlZtJVlnTPa9DNLCOXQ3aCE0TjeqayCBB
	FKC+lRy4ZCQ992wRGGjhBfNO5iuFVb7qPoGegrAAboaAB+lsA2NSwF6iGF7uDI8wOO8XEu31oJ+
	sZcSKrhwp
X-Google-Smtp-Source: AGHT+IG2Cydcedh1RV4wqpTCGDiIk/2rtz0Sxxh7wm6696leelG2UCU2ncA/tpzYHAbjDXnieiPvmw==
X-Received: by 2002:a2e:8a88:0:b0:328:685:7cc4 with SMTP id 38308e7fff4ca-32809782356mr26567141fa.30.1747587051206;
        Sun, 18 May 2025 09:50:51 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf95bsm15362141fa.108.2025.05.18.09.50.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:50:50 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso28950671fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9mHP/iaGlmVL/FbOisRb03DhY8+V+lijoLGRfKkVjxkVq9/5nClkSbDa1dTJgr2B02gDvURZnb4VydGKaIAM4@lists.infradead.org
X-Received: by 2002:a2e:8a88:0:b0:328:685:7cc4 with SMTP id
 38308e7fff4ca-32809782356mr26567051fa.30.1747587050098; Sun, 18 May 2025
 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:50:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
X-Gm-Features: AX0GCFthsimZ1Vpr-P15pdmflifaZ2Czon48jDxa1m9hAkmxkrKyvTCzCS0vxW4
Message-ID: <CAGb2v67oQhoM9aFnOX9njcF3USmEz_80oqfrmY7jrMboHT8fEA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_095057_381753_5EB716B8 
X-CRM114-Status: GOOD (  26.17  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
>
> Changelog v7..v8:
> - Add top/disp regmaps to mixer for DE33
> - Remove YUV-specific code
> - Remove use of global double buffer
> - Remove unneeded if/then parentheses and fix an alignment issue as sugge=
sted by checkpatch.pl
>
> Changelog v9..v10:
> - Use names from vendor BSP kernel for register blocks.
>
> Changelog v10..v11:
> - move before vi_scaler patch as vi_scaler code references new DE33 enum.
>
> Changelog v10..v11:
> - Convert de_type enum to uppercase
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 15 +++++-
>  2 files changed, 84 insertions(+), 13 deletions(-)
>

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index b75008d05fc9..870f9b9daf0d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -21,6 +21,9 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF               0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE                        0xc
>
> +#define SUN50I_MIXER_GLOBAL_SIZE               0x8
> +#define SUN50I_MIXER_GLOBAL_CLK                        0xc
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN           BIT(0)
>
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE                BIT(0)
> @@ -154,6 +157,7 @@ enum {
>  enum sun8i_mixer_type {
>         SUN8I_MIXER_DE2,
>         SUN8I_MIXER_DE3,
> +       SUN8I_MIXER_DE33,
>  };
>
>  /**
> @@ -178,6 +182,7 @@ struct sun8i_mixer_cfg {
>         unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
> +       unsigned int    map[6];

This needs a corresponding change to the kernel-doc immediately
before it, or the doc generation build will produce a warning.

You can keep the reviewed-by after fixing it.

ChenYu

