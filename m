Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1945AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=; b=eO1DKYcW8f0g5CRfjKsOrHQytB
	EGfVAmqTKGJ5+fSkHi6P6HjebGZBFNmC6/mxCo70IEYuEZ6gWTMhFTeiuVNj35/fga6e/R8negW6L
	iugN2TEqQD4umKAsWiMVMHPzg2D4SKE1uYwakPMdhoowf3nL9LWUMVmC/w5X4nuSFF9if/YBFlWWS
	HJvG7M45stDoj8Yr72Wn2C9rVueMoyEsaV8W3SPoE0KdMrQ8xqfPRrmWVKVsYS0TSb4oIuD712zcH
	s6yeq6slwvGKt08zAKDcKtQotOgK/4LXOvgYJoLoCMywictHB00m5Zz3h4V1zaDM2X7ha1rZNH7RI
	G5WZcRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUB2F-0000000FZqy-3b60;
	Sat, 04 Jan 2025 20:46:15 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUB15-0000000FZk1-0Ras
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:45:04 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5f2dee7d218so6001698eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023502; x=1736628302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=AHG3btiirgDhF43UAToAbaCUzq4KS15W5DBL9oj0BB5WqMNos6oRcBQpEMXzGlWNZZ
         o9gMuL9VQANj3O5+Z/FKl/GDrZq52VTQ9GJT2A+P2TWcSGBo5Kc0x8EBobtNMJhncjio
         WIZ4Uwf+a42vI5QYIEp4ielUzZdtWapLWceEC6E+STJZC5fWnhQWBHvG7MZ6TurzF9Ar
         CE3l6wYE6KfwLkwDoDqnC4WnAB0RJrfO4CgobsDKL+Y9BxGm8Vj3n6jWENyeY4rXblNE
         RjofHB0fDOC01NxAp+tOhGfieRJEp0nplGmlg085BSGgn5CqrX6nDZikvWHhdB7Xaqkq
         Ls1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023502; x=1736628302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=TmCCI4wvL5m+tmpIO51kX1S8LKAv/E+PJPpJ8BmTuc7n9qQzta6bnh5KENhoakSY7y
         zH6HsQueuapRzCO5IIg5VpxOOk5WYJvcgKy8ej95bgqXIWqnEUpsRnALRt7BNT9U98uz
         sy9sg1hGAGeWWegIngTULCTszvIRPrBDq9+2FAGrMYXkGdeyciW9oi8fSmnSyrgVKwoh
         9ro7E3Wep+DQaPdCuDKzoH8zvaU0JWkIk2tQFUu/4lFvYY7VeJxmEnv8yUXnkRmtRmyW
         ZM1TwdudFp6R/oOHN5m/iIq4ZrW0RM2tazZBlEJQJBnyhbU08+w4AzxFWbGjikeiefC4
         BG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXysRkhY7CYygV7VMJIi17AW4Zyn+hbVCzU7nHKNy29HcjPckaYh82UsneqjxHPIQtJOLuggm2SKSE4PHWJ9jmD@lists.infradead.org
X-Gm-Message-State: AOJu0YwLDDP1SN7fMj2J4S+tdn38pKddbPOCi5ugXKdeRo93gAZ9bW4F
	nO6RBOEpKRig1NLj+ak1Y2Z2GIPeqAIakMt0J00v0wl22Jt/NRl2vN9NN9fl3D3i4/QylV50RBA
	inP2zBoDxZ0KFf+tou4oiA7yQ1ik=
X-Gm-Gg: ASbGncvaP2Q1EonMm1UjhX7bCTYOmqIWaZMLNC4u2Yd5qRei6/SR1F05HhrWkI4YVdm
	16t1BjaChIHBU03xMubzJZPVFwa13h7pQ68ka1QGEFfpW8b1S2T1o
X-Google-Smtp-Source: AGHT+IET3PfD2lydjmB9lUAPFdSJsVQcRdVdEXojLiqSBWvz4vm97/5ujV9jy/Tj2jeiVODvP+E7drTMo/tGOD5/NwM=
X-Received: by 2002:a05:6871:328c:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-2a7fb40f20emr28771169fac.39.1736023502000; Sat, 04 Jan 2025
 12:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <pc7en2jjvce6et6s22sdfooixxxos4u5bitcfhylt7ms65o7wt@bxdvnyeus7b3> <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
In-Reply-To: <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:44:35 -0800
Message-ID: <CA+E=qVfdh0OMM8ZuJdhFkjuuwNZKQBt--YMBw6T=NRvh8jb31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_124503_146724_4F9F0EC7 
X-CRM114-Status: GOOD (  14.83  )
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

On Sat, Jan 4, 2025 at 2:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/01/2025 11:16, Krzysztof Kozlowski wrote:
> > On Fri, Jan 03, 2025 at 11:36:57PM -0800, Vasily Khoruzhick wrote:
> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> >> select TCON0 clock parent in dts
> >>
> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCO=
N0 mux")
> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Where did this happen?
> >
> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> >
> > And these? I cannot find traces on the list.
>
> I found them, cover letter.

Yeah, most of the tags are replies to v1 cover letter. Stuart's
Tested-by comes from IRC. However all the mentioned people are on CC
list, it's not like I'm trying to sneak in counterfeit tags :)


> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof

