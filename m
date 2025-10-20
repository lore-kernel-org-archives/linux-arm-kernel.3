Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C0CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=; b=Adb5FNcOoUKhXT5VPAEmYKkU7X
	nl6IM7vOr48wl78N5gBD0gUK+frdQwOXjpMPw/xE5XVlVQB5pQr4bkXoLUKN3h09MJco5F2WguaWk
	W0aGjRpfEyoD0NhXWZXrJZGvCRiwLONvXpPGh2YDoqt4x2xdAMwrSbfVvbWwF/30X+t0V++iayfwj
	v3FLUUSK3bOIB4OYXNDT133HAT2kWG4ZEC2gVTIYD5G2LNuUao5H4EiUW5fMh5uFYrbeNF+oh8cj4
	Z3m1kCR4HLoWc7vQUUVOBUXoT50vlBl0GoP0fhLqlLcFFKQ4XCMmhPlVpyv7uTikIwBGJ8lMLNkCj
	7ay+I0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu3W-0000000EY5l-1lGS;
	Mon, 20 Oct 2025 17:52:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu3U-0000000EY52-1wt5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:52:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-427015003eeso194913f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982743; x=1761587543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=lGJCGbkkmmdqhpMoyjzC3o5Aw5uZ2qAJgBFCm1JkqOrTskNzg/OA/JxgNiUMb0E7x9
         0pbyfk6IWsFbIk/bE2iLhaptPeyPiTRnjmHo2dhAk8QxpGQh5+m0a6xn5s1xTNoo+oMs
         GxgBspSyjTBdnVHewV7jrqS3WxsHvZqJMrmgwW9H0R3p8hB61ParTDGDHElYYALEnHYB
         DuAVJPh3GOn5HX/zvZoKgVUdQOQxwfUcTrqM269nIf7mpsp/wGHUkeya1pCNiiHAJ7bH
         0o6extLFJ77Q3v6L6lN41ViDlORVuDw8vSeUtkRjupIgPLEkSp90VlBqqPGO0DEQDPTR
         dOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982743; x=1761587543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hPztYo4gHaE9LtG99gGwWjUyFltd44jOHvoR42cvBk=;
        b=GucpOMns5DpBC42xFby8EZ4guDiLPi2b3ny7kxsrZjBkDw+cIcYiBSA4kMDlcEJz5b
         SzEFt6IxN+6Lt0jIS9iPTbJk4o/FUFDVvFf6CIbMY9I/Q6XPrKfjMelVE5jWzdBEu1IQ
         lDfyjIycFOjmFEOp4sGjDTbU/GhJ38OO0uIu00sHQ6oAFUYqV9GBzbSiuIKt0PQvDEla
         f59llQiaWh4MyHui0a3wVPYV5MW/UIjTYYFtDmBahJzj8ZbeSyPWQJv7ozSgW7TWcwkZ
         FbJwVsP2RENlTGJdiAYoexend4FXD/c0Hzzdmk3AWWbL3JRW75ppJmd94NORoJNQLwbz
         sS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu56oglMzrOZA0WEdP4fO/Wpo/cjukt9appwQf9Bftks59zPTlIB7q9J5cUucJ2n4Gsd46G8HvOXVRsL+52gyS@lists.infradead.org
X-Gm-Message-State: AOJu0YwMLaHVXs9nOe3oXp3GRnC+3s/I1W7Hf772t7RFyBdXYXxNe9H7
	h5mYsB9bCHQLCrKUbnBxXTw8HY+zyTuqkKEWlTH1jglh9qwnxa2RojOx
X-Gm-Gg: ASbGncvC2FRSQtZTQ+Fe/6RBs2hbHNIr56GbXQ8vvbY6VWRjhIcOwga7ezlWC6a+UXG
	gATnPKv69ual28jPy1ueARRl9JGXs3P2oFzdNaQ1BW2hk2M8KgHd+aasQ/Thug6zi5GIPaO+CWt
	+SEdchutvWKzpBbuFA1Oso1ILL8tTviq186l98fhXzrBoF0b+iSU8t7T40oYp3PZBX0wXdRN1qS
	gYjMuLpaIDnjNX0IC0NuxQ7/d9jkLoXnZtEP5N7k+v4v1UYH6ZtF5relgGrfEKidujNVbzKsk9Y
	isVZbTrMPmo1/5hrTBmsEz7Zj4QVoWqJNUgnhZvMTYzisNuhgqJe4YfWwn0IjmFiISA8xb8Tt/e
	lT0seiWvh1iUZTdDiYfw2jNMxbYCX6Ss3FtJcKq7/y9pTvAjOA7f9NJvXDA0cFfV8TdafsjhXXe
	wVPTdVWjP8zv5uoVayyY3B0EDQVb0RW00iXKpi8DcShhPQJJ1nAw/BAqFEplWIHhGiiPZlBkSLa
	o+ryg==
X-Google-Smtp-Source: AGHT+IGEpXcGziVc/IPeVNYdyzKmZC+YRn2Z3nf2tImqr8LtU1jXE0yH1+EHM8IBNjLdRoUankugUA==
X-Received: by 2002:a05:6000:26d2:b0:3e6:f91e:fa72 with SMTP id ffacd0b85a97d-42704d83dfdmr8290390f8f.7.1760982742464;
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm16222568f8f.17.2025.10.20.10.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:52:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 19:52:20 +0200
Message-ID: <8591609.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20251020171059.2786070-7-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-7-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105224_519768_7C7C62DA 
X-CRM114-Status: GOOD (  17.47  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> While the user manual states that the PLL's rate should be between 180
> MHz and 3 GHz in the register defninition section, it also says the
> actual operating frequency is 22.5792*4 MHz in the PLL features table.
>=20
> 22.5792*4 MHz is one of the actual clock rates that we want and is
> is available in the SDM table. Lower the minimum clock rate to 90 MHz
> so that both rates in the SDM table can be used.

So factor of 2 could be missed somewhere?

>=20
> Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PL=
Ls")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index acb532f8361b..20dad06b37ca 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
>  	.m		=3D _SUNXI_CCU_DIV(16, 6),
>  	.sdm		=3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
>  					 0x178, BIT(31)),
> -	.min_rate	=3D 180000000U,
> +	.min_rate	=3D 90000000U,
>  	.max_rate	=3D 3000000000U,
>  	.common		=3D {
>  		.reg		=3D 0x078,
>=20





