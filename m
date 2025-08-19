Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C74CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=; b=O3Y6qjXIMoJQf3LDS/7iTQ+z4R
	aatKT2RKxTxrB6kr9qNo6s31dQf90M2zWlF+zP/LeShc6GU65pa9afuDnWipazG34qVQLDJMI4Xay
	tgmTiWifx22KISkQVY3qevW1U38TAq/YozR331Xia0VkxkANZDlI5Bj87YIr5KMJyXunJ+DH63Azj
	0+fC93FSFT0cgRJTPu85+MdCauRe8/DAqvyvJkufbOL1UaGG91Lk1b3aXJRYz50s2SdpM+JFJ6Qk6
	tyzlorjgfr5/GbD+WK68vk8/jzrn6FXHjd0pddtrhs8Fb2Z5FkMGAbsxcQGjcc5IYfOmK0zep6piw
	hTitNqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEvl-00000009R24-068Z;
	Tue, 19 Aug 2025 05:30:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEt9-00000009QlE-0vWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:28:04 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ce520caf9so5889397e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755581281; x=1756186081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=;
        b=Es/x4xed4X051AlFjA+l7RlMRPrifdpLjZggZsK1f5DbTRH/AO3Tas5nEC1Nw+Li8R
         UOWVHUjKFJodNYu7+0eviwVTHv0nKj8RqzNMOIdcnshAZpLGHNQLxCDIvboio71gM2/Y
         Tn3V42rRibhCDSsWP3au6bT9oHZr1KPWX59Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581281; x=1756186081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1RoE19cvLBaBi0011V8fYVXjhA8rp/exNRIajTxVcc=;
        b=R4mmBwIsVQG6GEfqogx3z8vhuuuyVT1CtEJNB5Oe61+eJAqYw+5a+kHYlFTKiZb00r
         1Ryfv4KYeCuYnPxNgtI5QIUv8sKWBU+82Pbm15jJ/1m77PlSHyh1sjjkshduM9YHXvU1
         JS7sYGuoh/NuVjnaNHCKaziPP1FUJxC0bAfs/PwQ4iLwK47fU8hgI8NjGJMoyfWFKjA7
         sfyScGAKYatTJ1yI8I05TwONwitSUfbLh+FPlKz2D5QTTXnJSavOQD1GeSNg23NAOdhy
         0LYPyWKP9B74pm3JPPTclscRCrh+F8TqVxrFgUNoXetCnTKUD6Kf6gL8ohiGWIrvxD03
         vOLw==
X-Forwarded-Encrypted: i=1; AJvYcCWv3SjiZYifzF+3ZTejTWDpz6amYaKaMHkB4g2JuDA9LYvl+4a45LDJoFG0tZTXQnuBt/PmGyUAWVWGY9D2rKKk@lists.infradead.org
X-Gm-Message-State: AOJu0YycYC57Mx/Hn+lhdPeTKtHiG9M/f2BcavMMqgHK3OxmjNKcm6oe
	X3/Jcqz0a/ha7YQrA9Y77UU/oLaXs5CrTzuYwYERvDbVoCZHYgBSB89riPL0ZnytRvz8la/rzj3
	ZUmlDh3VOgJYuVQrsCQgvFW0Z488XVVpBRlI3fIpo
X-Gm-Gg: ASbGncvSJ5xGanQ92vo3b5PgXZwlgBpS7Zq219E/G6UqNx1hd96h27O2+nEBgNc2aCN
	3jrOx/8WQSSdaCq8q+nJVSdemXU45qsrdvSLXpLQHjrGeK0K/AnAWPz06/sOGtKWUCNNbiotM6i
	yY+0mj8Ivsi3fSn70jc08JTGAWPK7fdzusB2NWDZt0rDrlWlVOmMEBJyeaYuRn/GePhdKTYGGJr
	q9kw11mL5+SGrvvF5KtXxsc7NK6pEjJhtA=
X-Google-Smtp-Source: AGHT+IGQHTGEbyr4SR72kvidWQutZvf7AK9o9RoOcU43ggNdNpSPatYscdMG6FtrXgyqF7WItvuWeeeG17g3X0SMn88=
X-Received: by 2002:a05:6512:1585:b0:553:2f40:3705 with SMTP id
 2adb3069b0e04-55e007aeccamr350494e87.15.1755581280895; Mon, 18 Aug 2025
 22:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com> <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
In-Reply-To: <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Aug 2025 13:27:50 +0800
X-Gm-Features: Ac12FXyZj9pu4uTVlJ9GtMYFjXUlZm3D496E2G53MlvCfEEQUDKze_RDvsyqUZk
Message-ID: <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20250818_222803_287284_5C5DCB44 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
>
> > >                 pins-clk {
> > >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> > >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > > -                       mediatek,pull-down-adv =3D <10>;
> > > +                       mediatek,pull-down-adv =3D <2>;
> >
> >         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> >
> > and so on.
> >
> > ChenYu
>
> I agree with ChenYu, the more standardized properties are the better it i=
s.
>
> All the custom properties makes sense for an engineer working with just
> that one SoC (like the SoC vendor...) but for field engineers who have
> to use different SoCs every day this is just a big mess for the mind.
>
> The standard properties are clear, concise and tell you exactly what
> they are about.
>
> The argument should be in Ohms though, according to the standard
> bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> something like that?

For reasons I can't recall clearly these are just placeholder values
that the driver then maps to the R1 and R0 settings. But at least they
use the standard properties.

The reason was either one of the following or both:

  a. not every group of pins had the same resistance values for R1 & R0
  b. there are no known precise values; the values depend on the process
     and batch


ChenYu

