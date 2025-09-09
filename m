Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEE1CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiPDvR6ZseDfZONnWJWsyImGvwysMua8qOuAT6/itt0=; b=w+UqK0uiUKNCFM
	vusvFRv6P6dmlygF9ASSKucMivgeLNOYHlSfAFQy/Gpw0+rg+PtfTA7apIoXeWGEcd6SfSk1owgv2
	5VLEr4fdqgVd5so2OAVEkGKXCOBDNU+ZmEICVBDRlqux9H63zhjlrQdpp0DGcH6ePU4immXNINu8l
	UnY+OG+3QcW35K7sERi+I7jqQG/Sdh4IBSF60jb5xeDPk3EyfnzEd1CakxkAcf3vadUM5tOhJ7HwK
	zBwc5Da8pHuliC6VdKRmO7X+AULpWyAkNwKYLOqJKAWsw7f7VUiXGy4BMFytNFeloQgEiGN8ZSn4L
	A8z8TF/oc7FxRD4Mwrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zJ-00000008tDt-0V1D;
	Tue, 09 Sep 2025 17:18:37 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyTD-00000007PcC-1YYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:33:17 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so3041979e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424792; x=1758029592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiPDvR6ZseDfZONnWJWsyImGvwysMua8qOuAT6/itt0=;
        b=ssj1YL0VTYbTqh9yHH+kxA5a6vzRz3euW4WI4NLqjorvX6Bqf2WfjCJnQahQ8Jy4TB
         S9U/ltk3fjox4nATHP69YQ7znl+Q/psbtdShh7fAPn3OpJ5Viy32v7CldmRrAw/bYo1d
         QAiUhBjyTWBrcV7okM8cije+iPy3KwFWZC+rF0f5LB42PgWjO0KAS9UUlPAA9DCpL1zh
         ltmYQjYl6muZyWVXBnINJBWFtnI5QGhzs64s8EaiW5UI4jAD2o8ngquqkas8KTI/VPKX
         fBPOjTnskVPwmtygaj21Ycu1TzbRe6ZzohLUo9qoiUnJHkGFV0D7/klAVgTh8BTrkDX9
         jTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx2Pp8T8/IfchOzAM58QS1vLKddOABOpDtofHe4T/L6KnBB5XNUTyQBE3spSqoA+HHMMUyeRtpzQTrWAfSNM20@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy351Ny1BcAsZnTJiA//mI03GkA3gB1ts19xuD7KGtMeHsRXj7
	lmbSRp36tPR1QemiDFQrPzX78D2g1dC/3ots6XQyxUzH2IUl64wYO83mzB6oXtA/
X-Gm-Gg: ASbGncuRQZH2mKENau2Zo0owfE/27SMLUXM1bznlK6bmzlnauF/nMP5jf715BHYh6vE
	7j8sIX9QXEZc6UU7jSp/EH3CvSYc5CyMT+HxN/nH2NxguUh0DwACbQJJw9pZEjEOYxOSj7XdA10
	MsUu3IPRV40cLRc3Fl6q4d6Q2s1eNm5BS88au+A/fcxJmc9Is2lzQx76SsXczCzj/qTQFoSEnUd
	8j2OO1XBqUj7v+duBLRA1bwbk/RQB+aKqLc4vFLu9ruPB2gPTJgxtMpmv/2YhqdWiBuIn7HSTfK
	S1J0xgZA+1TpSfD791mDwM7K7K9d+GEDMKAp2GxqL00z348EYFqNrKHg8X7+DDnBCnK849N3jeI
	fF9pH5RFHAvv7EW5d8GDGndrkGkRGrZwFJQLRoeqy8ZWgqOuf7r0bDBxPbJdauorsEw==
X-Google-Smtp-Source: AGHT+IGsjw7/haH/LbjCmLgk1Ag3WUOJjrFJicvKilxLSwohN2Vv3XHoiIFPv/BRfjTEAL9ITi0X+A==
X-Received: by 2002:a05:6512:3c88:b0:55f:453a:59ea with SMTP id 2adb3069b0e04-562636d7a75mr3515565e87.36.1757424791873;
        Tue, 09 Sep 2025 06:33:11 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c424fb2sm536254e87.11.2025.09.09.06.33.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 06:33:10 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336cdca667aso41378141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpOuUrls5vVEwvD5PtqRjqV5ryix+b/EwfQI2NorrMeSZnpGRceJrQecmNHcSagXPwsg4aO097tNbOHlrRRKQ5@lists.infradead.org
X-Received: by 2002:a2e:a54a:0:b0:338:a33:96e0 with SMTP id
 38308e7fff4ca-33b52891786mr32184271fa.21.1757424790514; Tue, 09 Sep 2025
 06:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
 <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com> <20250903112054.173fe7b8@donnerap>
In-Reply-To: <20250903112054.173fe7b8@donnerap>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 9 Sep 2025 21:32:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
X-Gm-Features: Ac12FXwVCVC7-rgwvVDgpfgKJIONLlDmlW4y0Cq7K_8SdacVRdO0XPJ7BtdhumE
Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063315_409000_C57D2084 
X-CRM114-Status: GOOD (  34.99  )
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

On Wed, Sep 3, 2025 at 6:21=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed, 3 Sep 2025 12:20:55 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> > On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > The "mp" clock models a mod clock with divider and a shift field. At
> > > least one clock in the Allwinner A523 features just a power-of-2 divi=
der
> > > field, so support an initialisation of the clock without providing an
> > > actual divider field.
> > >
> > > Add a check whether the "width" field is 0, and skip the divider
> > > handling in this case, as the GENMASK macro will not work with a zero
> > > length.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> >
> > In my series I have a patch that adds this to the divider clocks,
> > thus adding a P-clock type to the M-clock bits.
>
> Yeah, I saw that, but wasn't convinced this would be better. Hence wanted
> to post my version as an alternative.
>
> > Maybe use that instead? I prefer we use actual matching types instead
> > of disabling one part of a complex clock type.
>
> Good that you bring up that topic: when looking for matching clocks I saw
> we have a lot of them, though often one is just a subset of some others,
> with some code duplication. And we use the pattern of "use type A, but
> without feature X" already, for instance for "NKMP without the K".
>
> So I was wondering if we should revisit this and clean this up. IIUC thos=
e
> clocks were all modelled after the H3 and earlier generation, and the
> clocks have changed since then. For instance I don't see PLLs with two
> multipliers (NK) after the A64 anymore.
>
> So what about we consolidate the various types into just a few distinct
> ones, like NKMP for all PLLs, for instance, and provides macros that
> disable fields as needed? This could ideally be done under the hood,
> leaving the per-SoC drivers mostly alone, hopefully.
>
> What do people think about that?

I guess we could combine the NK* types, since those are relatively few.

I would like to keep the basic ones, those with just one multiplier or
one divider, possibly combined with a mux and/or a gate, alone. These
are based on core clk helpers. We only add features like fixed post
dividers or update bit support on top of them.


ChenYu

> Cheers,
> Andre
>
> > >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu=
_mp.c
> > > index 354c981943b6f..a03dac294d048 100644
> > > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, un=
signed long rate,
> > >         spin_lock_irqsave(cmp->common.lock, flags);
> > >
> > >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shi=
ft);
> > > +       if (cmp->m.width)
> > > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cm=
p->m.shift);
> > >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shi=
ft);
> > > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > > +       if (cmp->m.width)
> > > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > >         if (shift)
> > >                 reg |=3D ilog2(p) << cmp->p.shift;
> > >         else
> > > --
> > > 2.46.3
> > >
>

