Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA767C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irpvSqgjgTj5pR4QAa0LXMYagaabjkDRM99tvNprbEE=; b=PSjaoKl36ljc677+C+zZfBhsGW
	eo36jonmzVrhgOibBvxvdKSpvsie/NAKrLU0UXdOskBPhOly5KzSPC8cd54O15RHgJAO8dW01o3GI
	OuP8ij4yZ5QxSJDJ3HzBI+oSzlQ3KeO2CCBaXaOjVQOVByA5hYeaU866mVTPgwRUZGkbIrKa9ga7J
	7FGxR5mqKzctHY5h2ZzSFu+Tw7REUY8CuGOxdZMImQ0BKaIraU5GIXySI1Vs9LkRqwfcBPpGTD6WG
	erftBfaaU1OI6l47VBnTpq+eEODMuLzjFDSO6RWErFBxhfd0TB/gyTmgWRbHSOMQcB7d827/q8diT
	XDbdPYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCVu-0000000BFQ6-3Wm2;
	Sun, 23 Feb 2025 13:59:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCUR-0000000BFIT-0Vcx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 13:57:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f2f748128so1580637f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740319069; x=1740923869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irpvSqgjgTj5pR4QAa0LXMYagaabjkDRM99tvNprbEE=;
        b=Ru3DAucnqr4i+RDvEZF1SqqO53UAtxXMq5RjOe9vKBsV8CEHgz6iT/UET1ezP7ncyA
         m/UTfA0M/3xTFMjnx7BkIWkemUvsINt/cU0ZDB8TLsMR+A8stmWCxbndWfM7g4dBm/l8
         6paRsJYm5rOU4g1pPP5rwPHKlgm1Kxssz1jitY1CO5+oUaPVdGrYzUgi0Df2S92GNIzF
         JOPrN+EuhG6bwXUqNVBVgCW4Aa1KOfR0UOZpEcc19XKYa0YB6b9WG8WbY6OJbKPkSmeG
         5bT33WelVY8cuoqjMWgmbEB58evphjPtmBUM3sWbGni1OAciYqmHhor30VSwVAnRRB/p
         eUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740319069; x=1740923869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irpvSqgjgTj5pR4QAa0LXMYagaabjkDRM99tvNprbEE=;
        b=Esc74F4NDO0bPYtav8S2SBpMmKsAlGlpFZCVd/jGQBpSJHIWHUb96bcVT5N6BEHUmY
         kRtnA1BoJHLMQ798QQsRparaii+0/2E9vRV/WD7JNIsRYkwhNb0qXsUHq3l0E3J+bwVk
         VUklruHkmm8lyT0oFEGnZ0a9mn3A2RPH3oUJ9ZnRvrwDZ8h4XqPBs/nPJPI3W9HkMaTA
         R+zf3W4OHkzGYDMUIUQB1chhdUfl/E3SdYNFTNJFNzbhIb2HXj+hEpkX498ed1sR1uiY
         YUv4bYuMCVOxMUGTYJaUiXpg2q3WfEOFax2NIKhqgAHIqBuQvtJjNrxpXzKHgdjq7vXK
         AW2A==
X-Forwarded-Encrypted: i=1; AJvYcCUyRL2Ph2uW8vMoapROnWZhv1fasuASruBpZGr6raWlyMpDHrlIs4ciWViQhLRKozlvm83kQuI2tkiPY2Ci2X2/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9GK6+ioiusnpRFDQeX9EIJZDJdVUVxDox/7MmMOhiT0HiKsGg
	ktyYqOo0R6Nn8xKqXAb5xxb75dwq5k3xooj/webWWqEP8eNFVx4b
X-Gm-Gg: ASbGncuAjhgSs3Ri9w01nnrcFqyy156r/xoh6SLlQYgBusoWwzSNFczot01AeHOv+h3
	5hLeDT1yDoU/7I8y55juWLnYua2VhHzgeWnombDOnQGYwjAGDXzq9pDodbM3jgY1JmC34Vaz921
	hyUpeggzcpcsNCIK95OUGADTgHW7ifSbdo9Hs4f+VJjrZWvoWyEbdGwllhmEPpmKQSq7b9pYCF6
	9IiwRB75VbyJ+qzxYWxdX711xmn8heUSB5NyizFe88TPdLItF7Po6AKLQyJcQDHycM3aSgXpHTB
	Qgp60fzBtjzzqv6IlJGrhpYkCTMluPaIcaU4ihJyvjdNMTkc7vNr8LyOnNuYIt3n8bWgzueCpqQ
	J9g==
X-Google-Smtp-Source: AGHT+IGEeE9J4uj+DGWwC9Wbtpp9SyskHFPKyeD+C5P4aQJjEmUKEGcNWd3Du/ly0SHMEDli0b4+Wg==
X-Received: by 2002:a5d:588c:0:b0:38d:ddf2:afea with SMTP id ffacd0b85a97d-38f6e95f301mr7975856f8f.13.1740319068981;
        Sun, 23 Feb 2025 05:57:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b031c5casm78071995e9.39.2025.02.23.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 05:57:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 1/1] clk: sunxi-ng: h616: Reparent GPU clock during frequency
 changes
Date: Sun, 23 Feb 2025 14:57:46 +0100
Message-ID: <2716580.BddDVKsqQX@jernej-laptop>
In-Reply-To: <3297157.aV6nBDHxoP@jernej-laptop>
References: <20250220113808.1122414-1-simons.philippe@gmail.com>
 <20250220113808.1122414-2-simons.philippe@gmail.com>
 <3297157.aV6nBDHxoP@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_055751_161528_968B80B9 
X-CRM114-Status: GOOD (  27.45  )
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

Dne =C4=8Detrtek, 20. februar 2025 ob 16:41:54 Srednjeevropski standardni =
=C4=8Das je Jernej =C5=A0krabec napisal(a):
> Dne =C4=8Detrtek, 20. februar 2025 ob 12:38:08 Srednjeevropski standardni=
 =C4=8Das je Philippe Simons napisal(a):
> > The H616 manual does not state that the GPU PLL supports
> > dynamic frequency configuration, so we must take extra care when changi=
ng
> > the frequency. Currently any attempt to do device DVFS on the GPU lead
> > to panfrost various ooops, and GPU hangs.
> >=20
> > The manual describes the algorithm for changing the PLL
> > frequency, which the CPU PLL notifier code already support, so we reuse
> > that to reparent the GPU clock to GPU1 clock during frequency
> > changes.
> >=20
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> Changelog is missing here. What's changed?
>=20
> In any case, this patch isn't useful on its own. What about PPU and GPU D=
T node?

In the light of separate PPU & GPU DT series, this patch is gtg.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej
=20
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
=2Dng/ccu-sun50i-h616.c
> > index 190816c35..6050cbfa9 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0"=
, gpu0_parents, 0x670,
> >  				       24, 1,	/* mux */
> >  				       BIT(31),	/* gate */
> >  				       CLK_SET_RATE_PARENT);
> > +
> > +/*
> > + * This clk is needed as a temporary fall back during GPU PLL freq cha=
nges.
> > + * Set CLK_IS_CRITICAL flag to prevent from being disabled.
> > + */
> > +#define SUN50I_H616_GPU_CLK1_REG        0x674
> >  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
> >  					0, 2,	/* M */
> >  					BIT(31),/* gate */
> > -					0);
> > +					CLK_IS_CRITICAL);
> > =20
> >  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
> >  		      0x67c, BIT(0), 0);
> > @@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
> >  	.lock		=3D BIT(28),
> >  };
> > =20
> > +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> > +	.common		=3D &gpu0_clk.common,
> > +	.cm		=3D &gpu0_clk.mux,
> > +	.delay_us	=3D 1, /* manual doesn't really say */
> > +	.bypass_index	=3D 1, /* GPU_CLK1@400MHz */
> > +};
> > +
> > +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> > +	.common		=3D &pll_gpu_clk.common,
> > +	.enable		=3D BIT(29),	/* LOCK_ENABLE */
> > +	.lock		=3D BIT(28),
> > +};
> > +
> >  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
> >  {
> >  	void __iomem *reg;
> > @@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >  	val |=3D BIT(0);
> >  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> > =20
> > +	/*
> > +	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400=
 MHz.
> > +	 */
> > +	val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> > +	val &=3D ~GENMASK(1, 0);
> > +	val |=3D 2;
> > +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> > +
> >  	/*
> >  	 * First clock parent (osc32K) is unusable for CEC. But since there
> >  	 * is no good way to force parent switch (both run with same frequenc=
y),
> > @@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >  	/* Re-lock the CPU PLL after any rate changes */
> >  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> > =20
> > +	/* Reparent GPU during GPU PLL rate changes */
> > +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> > +				  &sun50i_h616_gpu_nb);
> > +
> > +	/* Re-lock the GPU PLL after any rate changes */
> > +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> > +
> >  	return 0;
> >  }
> > =20
> >=20
>=20
>=20
>=20
>=20
>=20





