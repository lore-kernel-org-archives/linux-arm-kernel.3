Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFFDCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVZcBNGwpkq+v3DR0vvpafxBkSL/1KeRhlI8oyXPu5U=; b=aAhJ/MS+T9YOtgGqGSbEBVn/LD
	pLhTx+4XqA0YqGL45UMvL3rpvu7Qy+tNlMGCK9a6aMsqKeV6DJ9upAbc0NBhrIO08pJZlt+lOGNTQ
	SSwFeWGyTmvGEzO1FuVw7RmsjCrW2SgCBcqSYEIiIMbetoDqilvDPEcs+XwwNSINM1OCQeU2oMRog
	iFrVjPU20eoP0K281PzoROI/j2wOgRO7DpF2AXnOWUB/ctJdRvdql/hGyW9D+Y+z1WxsIEd5hl41I
	CZkMAHh8ViDljifavFGEvAZ9HdXKxV2TidqUQJNWMsOLloipNl33Z/Hw47r2IUOwLTDhcXyjraJ4L
	uJBF3scw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4fl-00000008Mpt-2dbv;
	Mon, 18 Aug 2025 18:33:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1gh-00000007uRv-2WTy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:22:21 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f8ef379dso35836431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530538; x=1756135338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVZcBNGwpkq+v3DR0vvpafxBkSL/1KeRhlI8oyXPu5U=;
        b=U9AgTGsTFszS5Fmo6fkIV5hIPrxzsCHRKujUc0z1C57CtBihFi3lSBfLDceK1h98rj
         IjUFv8n27BYfM9HWJTkCRawJdBAAEuGPjpZ8+wEQwTjb5brblQ0oL520G2uB+O157UKa
         XCKUq2LrEPc+O1bEnYYSGI0LQhSK9ExnS0c+f2XqCvWOWktcIV0xzSzF1N63/Yny0g43
         Cu7YtaZfS85zru2L8QuzwzOx3Cf6pJeeAP+X1AFV7kwDnw91/jcbm9ie2N67U1+5Wldb
         KLCLA1xTNMkKvEqnoK/BvlsOy4bQLSXnHQIkZxK2Bl7+2Da+IlWzyBjwnH4z947JE/fm
         axvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530538; x=1756135338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVZcBNGwpkq+v3DR0vvpafxBkSL/1KeRhlI8oyXPu5U=;
        b=rcvmZ3Q5/gLfpJAC+rcyXRkXKitFQ0/KtpIsIfNdXYc2pZxSSVENyyFkp8UasL2x8r
         10C5dnSffhvEpNhk09T1u0T1Afu6ulAkfTwAMELadRbqGOd30LKSY5EeaFZBlLak+3B1
         U0p2mX5Te/VCWj2alv76BTDUlaxJKaFWEuVHzrU8Mr+zazon7btCDBUOvCj0yaL9uTbw
         YwPbpjTlW30Fmgq8+XuhljeP9W/P58C98Cbuj5mYr2Tx+i+dOxi8bVhlT0AIDcS4gzZu
         lGtdtc0lbrbn4Ft2vXL6Rb2Tp7B0L/DuLffJ19FAc5ggxvlWNMyd+fKlWwf2W9nkvmxS
         AnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNhy6MD+tlF/LKasobkWzTnxnlnMX43LmXm7EDRMbewEuUmFlpOHqfY05KKAiULzPUrDkKGifxLVy5wHYKHZFB@lists.infradead.org
X-Gm-Message-State: AOJu0YzI9peJj9gwwcJsYnPYqfA0EXe7y9wowCCJP/cjJbTkMbf/rloU
	gTzFSAu5XHhD4t8YfDvKUyI+Ftija8soFKB2dOeAKxagUujiwspfJ9UJdkeXS8jmt/slEABpUns
	SOwbEtsn5x2ANxkk0Frbzl5pru0eSrQEqNhMO6ZDamg==
X-Gm-Gg: ASbGncudIvyApqLuqsMMovD1OkKussMXd1TRviC3Emnp3V936Ti0dkrNYbiBzujw7s3
	niP1geNISmyHy1FdX/ZATHMpdTA0U9gtMk+LT6i1pwZZJq2o1dC9sdJ/mHaZQqAgLy4nvgFsfo+
	wp9lU3s+q69wfQQQmX/gYHyv2ExXg84hsKGMbJLR7hWuz29rPYIOj3AWDIF79g0AX/4LUu9Lizy
	6N5itVmNcav
X-Google-Smtp-Source: AGHT+IEuIn7Pd5TPUO8L66bFb+S5ecBGsVI6khVLYk/8B6wK0KvSrOChhN5fjVMUxuyUcCqgOaWvaaAbYkhBGXf3lsc=
X-Received: by 2002:a2e:bc1b:0:b0:333:ad65:c4bd with SMTP id
 38308e7fff4ca-3340990b5cbmr39999151fa.23.1755530537596; Mon, 18 Aug 2025
 08:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com> <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
In-Reply-To: <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:22:05 +0200
X-Gm-Features: Ac12FXwpejZ0ETsmnb_X42vgeTPsfQZWI7EY17l_sz1-eYnLo5UFkub2X4VrxBw
Message-ID: <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082219_641819_87CD0BAA 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
> On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote

> >                 pins-clk {
> >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > -                       mediatek,pull-down-adv =3D <10>;
> > +                       mediatek,pull-down-adv =3D <2>;
>
>         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
>
> and so on.
>
> ChenYu

I agree with ChenYu, the more standardized properties are the better it is.

All the custom properties makes sense for an engineer working with just
that one SoC (like the SoC vendor...) but for field engineers who have
to use different SoCs every day this is just a big mess for the mind.

The standard properties are clear, concise and tell you exactly what
they are about.

The argument should be in Ohms though, according to the standard
bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
something like that?

Yours,
Linus Walleij

