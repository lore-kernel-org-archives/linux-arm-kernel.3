Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8AECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhE1GPrxyKAsw37Q2fShYI5FmXFiAGB5BC0k4Zz9C/U=; b=bWno3QUqzSh2oX
	ZSluai90G3PH9FKjb8u1/fThS4TwR9g7RCuaDBUyBjlPp6fWmlHpsX2k2U3i8MV7jKt+yJ2V1SCcC
	pykam6PPnruWYpKC6XX+NSwBTWg43Zaq725eHqQpqBnLUPiMgIS6oLCgGR/U0mihQppaxkgV5Q6Ph
	N5CsJcRagFz9XuDHogY/xE/dnCNeJXtEp1yFsCPQVw3gpWzBEs65wqWRM+eXfO6uWRy4xL6mFv2aJ
	9q35pNAHKEa/O4LXxRNKCzNGfUT+nZuU6BlMphQvbWoWmo94Nebd0zjWFUgwU7JbsH+ZX9PLGZaJ8
	WIQuKEP6zCYB1Pc3vF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIa1-0000000Gs4k-0QVD;
	Tue, 05 May 2026 16:25:05 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIZy-0000000Gs2y-1Da7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:25:03 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so8030851e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998294; x=1778603094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhE1GPrxyKAsw37Q2fShYI5FmXFiAGB5BC0k4Zz9C/U=;
        b=Q1oET0MzcgrbIbUr9mwE3JUT/tALE5avkIbBJFM4GDSkTVLNSrfiktboP72Md1LQ1i
         i7czfbDvsAPcKEkIC1RLbqwbRmBb6qF6ZuTJWWZ2s6T4dVKPefHuTA4dQbIFXAQeS+RU
         z5q22SnEyRZuebxIE/iWk4+QqJNGmAEhdvl/0GkYN/nUQlwnNJGMqTVcG1R5lj8I2cfv
         M2AZ243ym8s2PJ7RVc24PW4B6VJgC/42cHVn0KjA/zKxA4obME8MvdtGI9plTTVwCbvx
         GsPNQ9fV2uB2LsvKTYJkUQPxlGi96thYYhRyaLyhTA/79YSTEMwRyAjbJyAtuoXZFFYd
         yNjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zOv2+ICIYy4NOnxbsMdGoq+aw1V/Ia3cUG+FBXZQNwBuBQ9h7jpkRJHyGzy0+rj+e1w/hN0Eh2THaEGa9M7gZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/lmn+Zb9frQ3oNZX2DSDZAtvZKk5VZw+UkFdafTvdhUyeQ7YV
	nP9Eg+e/wiOLEo1FtN2v3zJcrCXSz4V/64MlU00eLJu1ZUQ23Hzmb78eMvGpMulj
X-Gm-Gg: AeBDievgd8offeR1FvpTvJbkTKUvjvJiVsmYJ3LSv5CQ+9lTDLqPCvuBpl9fX1vsIxq
	nKEgOr0H95kxBhj8121oJx1jJRiafPbH7CJcZXDYyMRBfMGCvKi6E7dRt6mauVpF/W8yiCPViWI
	J+qxm6Fx336lf/7np2u29T3ePCaPbYF/cG8s7fZu55ByV4b4mpCPX6her7QQq0mjgHMFbSjOC6Y
	GxnrG1EvlDxzi1G2mnTGcSzwsyo0a0XHJ1WbcN4fEHUKZzthBdYHzKXmV5S+uSctHqtnvxBQ0Vl
	fFNslBl89DPASbArc7n/+21wSgkQC5ENs8DrYIvzTNCHF6S5QuRFAVXuHFMY0c0Y1gyrnfpXFsf
	gLrUt0dJrlCTFs0Rwr9Yj76bj14gBVrHKyw3Wp1CzX6398moOoh1M76kzaXgh9K2ygClj53lnC+
	/uNAeB7Tyi2sHslIIQTCZ7T+RA4TtAOW3Q1hBv47pPEMJOn7Md0dTJ883wesouKBY3uQ==
X-Received: by 2002:a05:6512:108e:b0:5a7:4ac8:b332 with SMTP id 2adb3069b0e04-5a8631c728fmr5973553e87.38.1777998293894;
        Tue, 05 May 2026 09:24:53 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8690b9fc6sm3052711e87.4.2026.05.05.09.24.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:24:53 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393a44854d2so17986571fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8x/PjkJV6v4NJu1erqEWLeyZIGcvwV6aVtB2nNt+UYuqn5P4WVQkmk0JANQnyEJ++lv/DqFcwIqLyKX+eQcDdR@lists.infradead.org
X-Received: by 2002:a2e:bc88:0:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-393940edd6bmr44531191fa.3.1777998292458; Tue, 05 May 2026
 09:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com> <afoRe6DI4GJIVtg4@shepard> <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 May 2026 00:24:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
X-Gm-Features: AVHnY4J2M27F_ij2YPG2EBXpDPE1R3Ey_Ifi-Xq3Eypf1d-qnvtALFOdRCX5tAU
Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092502_348525_14A8EC9F 
X-CRM114-Status: GOOD (  26.25  )
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

On Wed, May 6, 2026 at 12:20=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC=
:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> >
> > [...]
> >
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +   { .fw_name =3D "hosc" },
> > > +   { .fw_name =3D "iosc" },
> > > +   { .fw_name =3D "losc" },
> > > +   { .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +                                  hstimer_parents, 0x730,
> > > +                                  0, 0,    /* M */
> >
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

We now have SUNXI_CCU_P_DATA_WITH_MUX_GATE() which was recently added by
me exactly for the timer clocks in the MCU CCU [1].


ChenYu

[1] https://lore.kernel.org/all/20250911174710.3149589-5-wens@kernel.org/

