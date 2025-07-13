Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F40C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ6idt8wXYfGLyA4P/4xIcoRSI8FZxbhnZ/aUjNlza8=; b=UFsTSJQG+BTVNKVXLEge0nGfCI
	58yje0XMwoHyjmRBP09y7OhdWu99pnvGO44550HRoR1sj9KFnvhbobnjGzOFu/5PnVdA8pN5ulzIY
	ux9eNaEh/esMVz1P1qrZLIikTZZVwBy8JsTMKDGVABkhRPzgIf9XnvPImd0PZ0r6+UtXL1X2/mzBA
	ZKJ80Goh1i3xZOl/dRuCgrTk2SjKxwZNY/2vm//3GVHFo7c9mMWIP424VdUsw6KCZj+sBvVKg7xW4
	4bBgLrTTtrzBgrGo5Cdi3onvwcpDQnn2PQoCp4QbXbK+RkLc/gjJtzvMFo5RtfMooO9Z5rg5ejgzQ
	Hs+Qa9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3S8-00000000buk-1wS4;
	Sun, 13 Jul 2025 20:37:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3Pj-00000000bkh-1u5p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 20:35:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45610582d07so5695005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752438909; x=1753043709; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6idt8wXYfGLyA4P/4xIcoRSI8FZxbhnZ/aUjNlza8=;
        b=e220aHWdXYjaOaAKq38QOi9siere/WFBw/WUNKsIcncWJtwU+xo+dg4oB4X3WD+ysx
         s0A9sDwuzIsizT5kzk3FUlJuzChD8v7TMjBjGfDg/HtFHYxMnEWulIB/gu297mg2f0wC
         BtuYGFxF6/t6ppShLLUv6Lv8hjU1TKBo/6yP694XAfwjpCbSzZCua862yh4cVoN8XQwV
         uOIB0uNZLykxigNkxB1XnpwXQEyXCsUXpvvW/d5m+doDB9qv2wj0YT2sblIv5cn/H6Gf
         p9w2WOp1D0JI8Dw6AKBHmNBlZSLeSlZkBrk4m1hr1mBZhztYyspaTk/ObnTWqrp82rs3
         IBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752438909; x=1753043709;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6idt8wXYfGLyA4P/4xIcoRSI8FZxbhnZ/aUjNlza8=;
        b=vc96vgBsYOqLs44AXmgNgRigqV+7V2q6/04dQN2vOOtrLOwwVZpjnYOqe8pnhH3WlV
         HuuZXLWEX0jTLTmGSYok3eoJZyYRdPj7lfnaTYZhec5TJCQA0nQFDj3Yz6i7DD8KW6fG
         qQpi6uzInM6rfVoPV1T3EwbkcqYxT27v5dSM2r3SLA90ki9hnRlQVE8G/HlEbRmf6Ics
         Dai0w30D6DVK+b6CUDM5suaG1AyBKKGI/3+wEqn3EB3phEYkOkda2iOgHDGFEDKnIEWg
         eP4h/KK2m0n/tXJN2MWuK9idbtQZtFt3gGxm7PRzLoU6v/fP2V1Df4IpvMlovNH/Ja1l
         IWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOagkqJnzpcDHPo/pvuDnMHOkPB0QjBvlAWyHNngik1q713u4mvOU+jkQwbZri31XAvy6XajXxxb1uWKtFa6bN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/70VK9jXXqITE/qOp0nEoLY/YuxwZLf5TGa9dmUy6L6ahaF4K
	kTJa0wvpybdLnzqDb7wzisR7DWi6/HHlkBSPySJT8qWnXWn+A+VhtmLn
X-Gm-Gg: ASbGncuoGZPa+84aRGRIkDQBfqAgo6yTOEBatLAMkw9uvWZKskyKPMJtZ9tQMc7Mer9
	FnUu2LmBULAAWMoaUV4mOLE3RPaOflDVv5MwemXDAiQXfn/pCJpSSkkTjlwkKg5pxC67ZKysdEH
	WJywrF/mg/zuZ1dPPbJ58TYhwJ+/vL5PCGx5B30ABX0b56jbBPdCM2q4Gi4ibiYpMj5KP4Ln/9d
	KdXnSTJfLjt1xJ+ZI45J8a91LWxO2iiQhuGIBmOuPxQYRMREXKykWL6iVa5ukW5azf2rOyN0s8C
	foJiynW51buo4ZfWlXG1VOAPduIgIxnZBPrA6DD1RfSgqVfvgIIyuaMu/a+98ULGOmKg6nIJWEQ
	lTgI2ejfVBH4dts+o6X8TxqaH6pZThaz84Ho90+iA8HV8hR2MlBV++vAm0sgCjxbZmy4kKEzgT0
	ZejdNojbeYEOgACifpq+9/rBw=
X-Google-Smtp-Source: AGHT+IH4AVDkH02c07HSfsSSYjsNFz8Gnpusc8AYfW7vNFYqCGsRW7lQ5eG2tpWiRi0fKTIFLEfChA==
X-Received: by 2002:a05:600c:4ed0:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-4561a41fd79mr11636015e9.22.1752438909101;
        Sun, 13 Jul 2025 13:35:09 -0700 (PDT)
Received: from dell.localnet (2a01-114f-400e-9dc0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:400e:9dc0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm10793602f8f.34.2025.07.13.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 13:35:08 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 1/3] ARM: OMAP1: clock: convert from round_rate() to
 determine_rate()
Date: Sun, 13 Jul 2025 22:35:06 +0200
Message-ID: <6172340.lOV4Wx5bFT@dell>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5023095.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_133511_502826_60E7236B 
X-CRM114-Status: GOOD (  22.02  )
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

--nextPart5023095.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Sun, 13 Jul 2025 22:35:06 +0200
Message-ID: <6172340.lOV4Wx5bFT@dell>
MIME-Version: 1.0

On Friday, 11 July 2025 01:42:16 CEST Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> ---
>  arch/arm/mach-omap1/clock.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
> index 83381e23fab983522ca01b8feffb861b02fee730..afc6404f62d39c4ddbac6f1ee04d889be6c47186 100644
> --- a/arch/arm/mach-omap1/clock.c
> +++ b/arch/arm/mach-omap1/clock.c
> @@ -705,14 +705,21 @@ static unsigned long omap1_clk_recalc_rate(struct clk_hw *hw, unsigned long p_ra
>  	return clk->rate;
>  }
>  
> -static long omap1_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *p_rate)
> +static int omap1_clk_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>  {
>  	struct omap1_clk *clk = to_omap1_clk(hw);
>  
> -	if (clk->round_rate != NULL)
> -		return clk->round_rate(clk, rate, p_rate);
> +	if (clk->round_rate != NULL) {
> +		req->rate = clk->round_rate(clk, req->rate,
> +					    &req->best_parent_rate);
>  
> -	return omap1_clk_recalc_rate(hw, *p_rate);
> +		return 0;
> +	}
> +
> +	req->rate = omap1_clk_recalc_rate(hw, req->best_parent_rate);
> +
> +	return 0;
>  }
>  
>  static int omap1_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long p_rate)
> @@ -771,7 +778,7 @@ const struct clk_ops omap1_clk_gate_ops = {
>  
>  const struct clk_ops omap1_clk_rate_ops = {
>  	.recalc_rate	= omap1_clk_recalc_rate,
> -	.round_rate	= omap1_clk_round_rate,
> +	.determine_rate = omap1_clk_determine_rate,
>  	.set_rate	= omap1_clk_set_rate,
>  	.init		= omap1_clk_init_op,
>  };
> @@ -784,7 +791,7 @@ const struct clk_ops omap1_clk_full_ops = {
>  	.disable_unused	= omap1_clk_disable_unused,
>  #endif
>  	.recalc_rate	= omap1_clk_recalc_rate,
> -	.round_rate	= omap1_clk_round_rate,
> +	.determine_rate = omap1_clk_determine_rate,
>  	.set_rate	= omap1_clk_set_rate,
>  	.init		= omap1_clk_init_op,
>  };
> 
> 


--nextPart5023095.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmh0GHoACgkQ2WqSnlts
jBr2jAf/bEu29PFvQWChV00x7wXHruop7Es3gHolRxKbv8LxnEtWZm4kkGIk36p2
FQMQZxPbpRfn3zanPLBWAsmiXy+nvWrk9zBu/OEEY8r8QsVLZwU9VV81SAI6rNrz
Tp89RkhQV8FsCoXVKZAIdvj1WOzpxVTeYJP3ds0IzQ49+Fpg+nWLSiaNH+awHky8
Xqms5mXh/SP9almdFvaZKmeAVTPUQpxsUmGMCSxWuEoWaDHKxpDa6FcaZMGetg2C
M7ZW3GznaKmZt906lQdvj2YcjonHirbjX3TULqMaDc16h/7h6BUWXr4Xt06VWTm6
LLLhsNUuQjG59V9d6+CFawQ+CzteNw==
=7sdR
-----END PGP SIGNATURE-----

--nextPart5023095.31r3eYUQgx--




