Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTQndh5EWhkqDmZmwB0OKhZyQvnI7PXjv9A+hnMrJew=; b=odv/XFAcU70d1o
	2z30OX2rTD8DCXwDaViQ1q/+BvNpFIFgSkN5UtJb07wE1ZXHZmYCi/tVSff7lgzoLob+iQfBfReF6
	XHlGp304J4bxafQ1aKKL36Iq6wc82cLTbCeEKV0Ct+yU3QyQ4jkGZorXIP23cZZlEnY3O52DtFGOr
	NEiY4CQl8HVXdFeokz9OR0fvW+VKXoS11FfXtHk3TClfIx20RSJBxoV/4HV0Gd7DvY1YmmKCwnmpT
	uYyzGn2V6RWqQeoGT07spcTMpPS9K/OMUsaA+eAC99VvWx880x4nD0EvQZG+ua0c3cyGFaUmk5NlU
	91dniBaV4pWXe/vEs6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2yM-00000006WxO-3ah9;
	Tue, 23 Jun 2026 15:23:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2yL-00000006Wx6-2Cdc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:23:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4C1160207
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C46A1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782228212;
	bh=KTQndh5EWhkqDmZmwB0OKhZyQvnI7PXjv9A+hnMrJew=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Hki6YJhi28GASZHqwwCkhhXl3skcmPrBO9cxVQXJyt0GTu8NZ3ld1tHZV5uAcHFrH
	 PBW1IT/3SPjJIdgE2Abt3y4ywURZuNjtb3VwUBL1SEspfjUbA0nXXQqEg1Ip4ZBqh0
	 VTmcZdEqRm9JiqF6perVrk8acOQwPQD/FfluKIP7zylSA5m/8Rl6cgztYYOVAntNbG
	 VlZeBMLZzRhgCGFx6SbhVvCcy1Enre6GVOSAgVTiAJmwfYpTT4gGBxf+2aUAjMftL3
	 BOJhy1bkUBgq9V7aoF/qhk3JiEY4wrGGEYhWW/xa9KFgXm/2jkYd3eB/CZ6LL1+jBY
	 Fm13Neg9+4MZQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-399f5e574b0so11153961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:23:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KFazKCZoXY6sNRPB0i/u/+z2CDrsh6/OccHKFALqBTc37J9l/oHBF7ul+bjwvmB6hP3sCaqvG5Kt8cFxuHmSF@lists.infradead.org
X-Gm-Message-State: AOJu0YwunEK8UxGhWbkk87m9kCKFMjPcIzPDGbkPdlCOQiInNUW6VL5h
	TcySd+gdIF649VwK0OOC+LCUZA6TH6ojuOkNudOfLrBqbZohpFWyFMg/eZNQ+QP9lqfjULd2FaU
	dTjMk0obGSRbsG5nJv02D6TIkUwNKHQA=
X-Received: by 2002:a05:6512:4388:b0:5a8:86a8:2e09 with SMTP id
 2adb3069b0e04-5ae3616553amr944685e87.7.1782228210964; Tue, 23 Jun 2026
 08:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech> <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
 <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7bjd6wi.fsf@starbuckisacylon.baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Jun 2026 23:23:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67eqHz3LxyLwk2_+RR_ucc8hxBLfk=iLcSN3hdsnsmPXQ@mail.gmail.com>
X-Gm-Features: AVVi8Cd45Q12_JEAbrGeRNR4K9bnBVwQtAKYrj4bVtPHJ3Sm3pX_iR5U5sy4IUU
Message-ID: <CAGb2v67eqHz3LxyLwk2_+RR_ucc8hxBLfk=iLcSN3hdsnsmPXQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2026 at 1:56=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 28 mars 2026 at 22:41, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral=
.tech> wrote:
> >>
> >> Add support for the internal CCU found in the RTC module of the Allwin=
ner
> >> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compati=
ble
> >> with older SoCs like the sun6i, the A733 introduces several new featur=
es.
> >>
> >> The A733 RTC CCU supports choosing one of three external crystal
> >> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
> >> logic to automatically identify the frequency used on the board and
> >> exports this DCXO signal as the "hosc" clock.
> >>
> >> Furthermore, the driver implements logic to derive a 32kHz reference
> >> from the HOSC. This is achieved through a muxed clock path using fixed
> >> pre-dividers to normalize the different crystal frequencies to ~32kHz.
> >
> > Have you tested whether the actually normalizes the frequency, i.e.
> > selects a different divider based on the DCXO frequency? Otherwise
> > we're just lying about the frequency.
> >
> >> This path reuses the same hardware mux registers as the HOSC clock.
> >>
> >> Additionally, this CCU provides several gate clocks for specific
> >> peripherals, including SerDes, HDMI, and UFS. The driver is implemente=
d
> >> as an auxiliary driver to be bound to the sun6i-rtc driver.
> >>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
>
> [...]
>
> >> +};
> >> +
> >> +static const struct clk_parent_data hosc_parents[] =3D {
> >> +       { .fw_name =3D "osc24M" },
> >> +       { .fw_name =3D "osc19M" },
> >> +       { .fw_name =3D "osc26M" },
> >> +       { .fw_name =3D "osc24M" },
> >> +};
> >
> > As mentioned in my reply to the binding, this is wrong. There is only
> > one input.
> >
> > The most you can do is check the rate of the parent clock against the
> > detected one, and _scream_ that the DT is wrong. And maybe override
> > the reported frequency.
> >
> > If you want to do the latter, you could add a new fixed rate gated
> > clock type to our library. You would fill in the rate before the
> > clocks get registered. I probably wouldn't go that far. We want people
> > to have correct hardware descriptions.
> >
> > Funnily enough Allwinner's BSP actually implements a fixed rate gate
> > for the next 24M-to-32k divider clock.
>
> What about implementing the register bellow as a read-only (and
> non-cached) divider using the factors provided by Junhui ? That would be
> an accurate description of the HW I think.
>
> The oscillator gets set in DT and if the output reported past the
> divider is not 32728Hz, you know you've got a problem (bad DT or HW gone
> bad)
>
> With a fixed-rate gate, you may actually end up lying about what
> actually happen, if the HW does not behave as expected.
>
> Do you prefer a fixed-rate gate still or should I try the RO divider
> approach ?

I think either one would work. The RO divider is probably more accurate.

Sorry for the late reply.


ChenYu

