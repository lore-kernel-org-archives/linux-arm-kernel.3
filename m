Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04FBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyIVLkT28r4TU0EMijOb+j2RXpDTj6f3sAkEcVbKSk0=; b=p13LhqwsKgyUSFLtEJ0vrGkOVH
	gpCnOS/14VIoOQVjJUA8kmASoLFZg1a1n7A9wPq9HsOM+c3Vs+oksBJ8nL54omqLqke5D8c2g9RoV
	paR3QECZoA24YABXkDoLDetwju/Da9c57Oo9ebGUi4431dU50ZI8IOtS2HeTp9CAHsF77xl55fJss
	E4fnwqhxchMdaN1KDBWgD8catGFlZ68G3PATEJgpI/9uiAX2kGIEyWbRFrLpU43sPR8+8bqNXDkVv
	KyD13pNdbfWnPe2BGY7nYbCQVNmvtyNO0ifrdgEJiYOr8vPPGVSATYZP0t43hBc1jNdttVlrGQI5C
	bkATL/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8i4-00000001daD-1c1m;
	Thu, 20 Feb 2025 15:43:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8gY-00000001dEd-4Ate
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:42:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4399d14334aso9701565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066117; x=1740670917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyIVLkT28r4TU0EMijOb+j2RXpDTj6f3sAkEcVbKSk0=;
        b=bUeXyc1n/vDOWQWHZWa3rk6JIeJLV5TMpBmIFDAa5j/DL6n1TUmSp+JMauYsfQYVSF
         u2D/IsdjKCSHugWWE4inOAqtS7HntDqZpHLUeaG3cVuisyK199YukAu65YilPBB1zPJB
         nYJsfb9EHyPq4zc2mT/t+rNAB8jOORhgVzfIdlw8NPTvTbBDiI147V88qLQP0hpqHs5C
         apwnb/JKvB7mu6IcZg3UzdqMu6jIhJ0zy4RHWLQ9SUhzz2qh8KJ67sdXKdwYnF673DZf
         Wr5bJJmGsyafbJp03UnquWKNBoXxYHGUefGHLRXQjhUGCvsqRgxQ6X1zOP1lenzNWK58
         7GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066117; x=1740670917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyIVLkT28r4TU0EMijOb+j2RXpDTj6f3sAkEcVbKSk0=;
        b=CBXiYPTn/3NUoOSWRtrTMk0t+qbdoD8DncbdOQcSzHERnQVJO5Is82RHIaXUmfpI1k
         AmAAb2+q6mRS+AAVG9hQJ0O1axqSP+MmAndOSVJ1ZzIPL9dRQ0dG6VJ6laaA+fgQAzRN
         Msc64dkNjIxAkzuS2CD+WJFyi5CcIvgEH6W16qqChzXfEZelR5gmTMQx1vUQYt0L/kTe
         JjRIPoEajEBxEhO0dpBJpL6/20+p8OpIwneE6Kn5PcpCoOTWlFHMK5tanU5C2neggzar
         jB4/U8zGB7+4hQe2h7s4KYPt7e9b8O+Sm+1SP6fYjPSTTyE94v7dvhoQmLB+c0jPic8e
         H7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Q2MwjOGoy9MTO3y3QcLES6+V42aF6fe8vye7clPs7nrAToTzZFDkV4MDSzZCHs9V/ukN/9h7xLXTGarPAN/9@lists.infradead.org
X-Gm-Message-State: AOJu0YzVisSgsoDM1jg4tC6vwMjM50eF7XNSlBozFBjfukI7b4uXkji+
	llIrMSI5RXjmwbUVZ7e0MFcUbOJo/2GCewSiJobylHhNDTRziuft
X-Gm-Gg: ASbGnctPNwHeYDygLuMmpa/23tYSmosQQYtfV0ShPIfqtz2+/mQW3Zo3oXyad2s+By4
	h69f+DdVSv6Xs0XjF6eN03YY0xFfUXVvRQCYC6BMsJjM2TbO7KTWhbNs4j2ArmO908iweyL9dvb
	zRwFY+w96YjUxUt2cuw/qd4JulNqGmlmtDUcBHlHCXsVy0IF4ufWuOgEbeIgE5qB3X8peKHZmfX
	MUNvp3pPSCmg3RoC6lKQwvAtxW38iZ7M5Bs7bcSmr7PWgwNZMzeKxmw0ZEH+7vJctDjfCW6dU3f
	B6STnqgAC48tuiqKBsg9jLdoxvEqohme7QlEdaT6KcWcDtRBZfxmm47W0a0saFqW5JU=
X-Google-Smtp-Source: AGHT+IGLMBgWAS8md1eWr3QLcZNc7eKtGIVV3ogJUweYOTxfA509OyXxG3f6PzbwI1nZtFPUxbjlgg==
X-Received: by 2002:a05:600c:4f48:b0:439:8bb1:14b1 with SMTP id 5b1f17b1804b1-43999d91255mr100404625e9.11.1740066116912;
        Thu, 20 Feb 2025 07:41:56 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7e0sm20646011f8f.48.2025.02.20.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:41:56 -0800 (PST)
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
Date: Thu, 20 Feb 2025 16:41:54 +0100
Message-ID: <3297157.aV6nBDHxoP@jernej-laptop>
In-Reply-To: <20250220113808.1122414-2-simons.philippe@gmail.com>
References: <20250220113808.1122414-1-simons.philippe@gmail.com>
 <20250220113808.1122414-2-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_074159_033564_DA1A065D 
X-CRM114-Status: GOOD (  24.62  )
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

Dne =C4=8Detrtek, 20. februar 2025 ob 12:38:08 Srednjeevropski standardni =
=C4=8Das je Philippe Simons napisal(a):
> The H616 manual does not state that the GPU PLL supports
> dynamic frequency configuration, so we must take extra care when changing
> the frequency. Currently any attempt to do device DVFS on the GPU lead
> to panfrost various ooops, and GPU hangs.
>=20
> The manual describes the algorithm for changing the PLL
> frequency, which the CPU PLL notifier code already support, so we reuse
> that to reparent the GPU clock to GPU1 clock during frequency
> changes.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)

Changelog is missing here. What's changed?

In any case, this patch isn't useful on its own. What about PPU and GPU DT =
node?

Best regards,
Jernej

>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 190816c35..6050cbfa9 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", =
gpu0_parents, 0x670,
>  				       24, 1,	/* mux */
>  				       BIT(31),	/* gate */
>  				       CLK_SET_RATE_PARENT);
> +
> +/*
> + * This clk is needed as a temporary fall back during GPU PLL freq chang=
es.
> + * Set CLK_IS_CRITICAL flag to prevent from being disabled.
> + */
> +#define SUN50I_H616_GPU_CLK1_REG        0x674
>  static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
>  					0, 2,	/* M */
>  					BIT(31),/* gate */
> -					0);
> +					CLK_IS_CRITICAL);
> =20
>  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
>  		      0x67c, BIT(0), 0);
> @@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =
=3D {
>  	.lock		=3D BIT(28),
>  };
> =20
> +static struct ccu_mux_nb sun50i_h616_gpu_nb =3D {
> +	.common		=3D &gpu0_clk.common,
> +	.cm		=3D &gpu0_clk.mux,
> +	.delay_us	=3D 1, /* manual doesn't really say */
> +	.bypass_index	=3D 1, /* GPU_CLK1@400MHz */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_gpu_nb =3D {
> +	.common		=3D &pll_gpu_clk.common,
> +	.enable		=3D BIT(29),	/* LOCK_ENABLE */
> +	.lock		=3D BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>  	void __iomem *reg;
> @@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>  	val |=3D BIT(0);
>  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> =20
> +	/*
> +	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 M=
Hz.
> +	 */
> +	val =3D readl(reg + SUN50I_H616_GPU_CLK1_REG);
> +	val &=3D ~GENMASK(1, 0);
> +	val |=3D 2;
> +	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
> +
>  	/*
>  	 * First clock parent (osc32K) is unusable for CEC. But since there
>  	 * is no good way to force parent switch (both run with same frequency),
> @@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>  	/* Re-lock the CPU PLL after any rate changes */
>  	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> =20
> +	/* Reparent GPU during GPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> +				  &sun50i_h616_gpu_nb);
> +
> +	/* Re-lock the GPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
> +
>  	return 0;
>  }
> =20
>=20





