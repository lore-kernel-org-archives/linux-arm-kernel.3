Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2376C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 05:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=; b=UMP2exOxtFVvu+LAUkftzMkSqO
	h2fwVSS4ILRSHuGHza7f4E5KfnFplzp4FMyIViWm37motD3Fe/Oa8mGXpRlGol0r9IqiBHXJioS0l
	wrD1qo51dFuO4tR4wK3hL38mGTI/zS4h5urQim4RC9fENbJaMIbaURhzFXpTxFVvr8OQCxso9vD5b
	hUgiVkRX32qIJgoUeeVIiIARPQ6RtqGbuuveWpmH5REL5CNjEgiXBoDizFrJLkl0Fb+p1JJvfyH3W
	xvKmW/4wXaYUGlhMnZZHF5m0P07WzUZN5pxfWmYSwZseUlIdJY8uNLp0a4IWb4QD9H0k+xt6dM+Jj
	puOMSdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdBH-0000000FydT-43uX;
	Tue, 29 Jul 2025 05:47:19 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugd8p-0000000FyIT-20ZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 05:44:48 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4e80d19c7ebso3449878137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753767886; x=1754372686; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
        b=MTVPYv/eUQD6Xv+okLrALCkSMZysS87NNwWNC0/EEYQBisZsQgpdw7kW/G1hDzxGbn
         vlqqu8NBaEEvJ6tdWWiNwR1TnY9WYyQFWjZzfMDacMhXSw1824Yl5a1po3+dUanhCvNY
         Q3Je5xz57fcWVsJPVsfbQV7nauMcQunRtdOWieSh2LB4n3AFvzPP38ZlYCB+BWrXKuRo
         nyuFy7QTRS87LDj7sQ5LQJTQMQcWCk4kMKzOKcpBnNEgTJR0BpFeSpSfk70cvlbuUDrS
         Y96BIRyCJYIby/LGWvY2f8en8VQuyUvF+EIrTFMrsgoaReIAEpzs+g5q1FlpDtxjSKbd
         W1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767886; x=1754372686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
        b=SdmZvIV9fbshfRzBfWnYD+wQAC1NoN5imRT1QqFPAHww0e0YTNuHP787INg7+Uy6xs
         pidQ1zfibfPiX0Gj/pWIVOAX+APctwxVbwAp2rcuh51+nfp676U1uq98wjspXOKUtr0d
         RYN+oJ9+JxhP9xavwrV02pM+D1iWp77XFTvPAObFIJaGbn0jS/tOfgupgAjM35+sKsXL
         eWVLXiJF9knwVWjWirnpRPIP0oeoi0JGimvBUU5sIVXHRE20FdKjtIUqYG4t2WMk4+Ov
         zkq8lHnkArEbaBycrakCAp0NFQrlJneM+oiKpaCLw+QF7gwm+nivCpZPFpKbINSLMIOf
         wIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAoI7LU7fUknBSznaDAwz2OxEE4V9VsVw0L6EpbEeiiUAb5hxg/yritYiCAkCrIdFnqZsMa6gE5XPKqSyZIVKO@lists.infradead.org
X-Gm-Message-State: AOJu0YwRLLJY9j4EOz4/KFuzb3+cAZZ/HIYB7l3hfAlduMpvPpM182lY
	2umlYBAnL/EKypihoS9CrnO897wuT2xMKVVAyUb93iIwU8jbJqIW1lexbSc5jOTEh90zouyQu7W
	6aNC2xOgx2ECgK86EjivXIw6bFibh69o=
X-Gm-Gg: ASbGncueiSPyIhL6Z4DgCGmmTHLnvipkv6bC9zxjBhy/l233qQgRk6ai2YTbIifDZt/
	F1GREXmFHhs7NgkBCnoAerVO+eWTXEjlo8x9oCPsAGjdVKh3TiAfbIEq+lPpCWSgcwv62882aRN
	JELXYdY89imfRQA9O9wRN45WMbilGhMtMQ9i6LlppDAslpOom39j4Sw7NCY+d3HLFl8VWEQP3NQ
	oMlPA==
X-Google-Smtp-Source: AGHT+IEsVgJXjoaJJQ1V37M9wx7CFXObKZWA/ky7jPfEPGlwsIppSymEDnwGfyFMHa/pUSY45t6bV5SHcp/btowCI3c=
X-Received: by 2002:a05:6102:648f:10b0:4fb:142:1ff5 with SMTP id
 ada2fe7eead31-4fb01422464mr654319137.26.1753767885910; Mon, 28 Jul 2025
 22:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org> <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 14:44:03 +0900
X-Gm-Features: Ac12FXzAP3fREaTsrBTi2grtepIb_8yjQOzO6O2L5XoQ97YnHsqpGgIB0mEB7O0
Message-ID: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_224447_518329_EAF2EB0A 
X-CRM114-Status: GOOD (  20.91  )
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:28, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM requires more time to stabilize its PLL. The current
> timeout value, 1000, doesn't suffice. Increase the value to 3000, which
> is just about enough as observed experimentally.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973=
b02507436750889 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 1000;
> +       timeout =3D 3000;

Relying on an implicit loop to wait for PLL stabilization is not an
ideal solution.
According to the datasheet, this can be addressed more explicitly by
using the DSIM_PLLTMR (PLL timer) register instead.

By configuring the pll timer field in DSIM_PLLTMR appropriately, we
can avoid arbitrary loops.
For example according to data sheet:
If the APB clock is 80 MHz and the desired delay is 20 =C2=B5s,
the pll timer field should be set to:
delay_time * apb_clock =3D 20 * 80 =3D 1600 (0x3E80)

Once this value is set and the MskPllStable field in the DSIM_INTMSK
register is unmasked,
the pll_stable field in the DSIM_INTSRC register will be set after the
specified delay (20 =C2=B5s in this example).
We can then check this field to determine whether the PLL has stabilized.

While the current patch relies on an implicit method, I=E2=80=99m fine with
merging it as-is for now.
However, since this patch series likely has sufficient time to
mainline, I believe this is a good opportunity to improve the related
logic.

Would you be open to trying the approach described above?

Thanks,
Inki Dae

>         do {
>                 if (timeout-- =3D=3D 0) {
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>
> --
> 2.49.0
>
>

