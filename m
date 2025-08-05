Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C40C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eY5N7v+zWU8+UjZUkDsBJT0AwO4FrfcIvgZ3TXySOJk=; b=pS9nvLEi66NbhisD4WHHGcTT4n
	8+KAx1pDcNbB9a2dPY3kHjivPUw121C41EvxNzZJB6omR3MGFR+RIJZYn++BVMxEpQDz1Z42O0dUz
	s8PTBEYU2hv4k+/KdYwHff4ZEiyCha2gllpjL/3GQthyJx39YEmYStMgfiTasaiQ9euAKRv+D8Wkf
	nnyrhWLxruWD+spt9G5PLG1ZZy4eK6cPvc5OF11KzjhXLbv9KEWDFOHK72//QAemXcMCVkoLWP9bE
	BgRCsk/1HfWY6OWJBAvs3CG0T8lbjmkCLvPKmNa03gdlWHY6CvmdTz4YMeRVdf0VulWuarBXaK1/0
	WbAXdp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9sI-0000000BnNC-2hRr;
	Tue, 05 Aug 2025 05:06:10 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9pn-0000000BnFb-0jNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 05:03:36 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71b4677044bso55683257b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754370214; x=1754975014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY5N7v+zWU8+UjZUkDsBJT0AwO4FrfcIvgZ3TXySOJk=;
        b=AD6FkjMw4ZZLFJjK6L8g/RKsIffIQo/ozPBEch/+GW545MEYiIW4mv3kxfgQZ2jdaD
         DrSF3dJsSSasG4wJKPIczsb5AOpbO96ftvOloPgLY0BirecY0jQbetxR7JRyYqslguyj
         nMMA0NtoLb1bFkDaITvKB6w2mRnBX9wxL5nMRaIB9gbqT/DwvDiPDQgWUbcc2a4W9UNs
         Fb/8kWRA2EWAPzYbQlwN4Y9qAfevwHzqIivZBS0qru00esaHy3blr5hvncY1svGpm+rk
         vSBNRjh8c+yWSM7VRswwhU3nwrb/7Qw/bQDIqIR5uVxe1gEFabMXzULc+vgF+D2rVZtC
         T53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370214; x=1754975014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eY5N7v+zWU8+UjZUkDsBJT0AwO4FrfcIvgZ3TXySOJk=;
        b=UC3k/gciyuGB2pAK0x71GVodQYoSCAq3kfoZljWz2lo17yR9nVY8E6yEa3eWUzXzOS
         V8a87a5yxky8+DuPMFC/W3kZOhlSZMx4TOwMnh67GZQmrNreBrShZOtYoxpiDwBblOY3
         ws1oqX0ZhNuzCEeBulTivJKQyJ6X0VzslYSF5Q4LLqbePj4iS5XGDD7i2hrQ2ZkxS96Z
         56iBOhLRiKbbSSR1P+ApzjJTY9SxGB+//29VWeZ/s1pebFN5ADmpgNSgyPoFdMzM28VL
         LbWqX9rXI5JZuRi9T24yxjjH3IndnYPn8vjrKSmrKwMgdLvlMLb6TOPUNINK5Eppl60h
         h+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXp9MLjNdYH/gEtTf3nnBiYhfIHi7Rk/pYYF4OBmia0FrXt+v46iEjWFoqUtR8MgD+43p9+VNcptjTEFrkN3OtC@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrD3zMZy1dQl4Pkfg0wInDn144DWWEaTo5mBpzaT/K/hUpOIB
	4XdIO/1YlUGEO7CPw3s934EgvNqzQyBgXBcpstNnTFeKI5yaXykHIDWHfx8U+31qbCgpr1iQySh
	24OleszA1aw2xqA+q40SzLLvDb9bEuSmTQEF/0/JCcw==
X-Gm-Gg: ASbGnctJAZ+A+5Aq/Df2NSvdck43zDE7FJLVZJu12Bp40wBvqe/u27YfWudhB6b0Dub
	UVdoAo84ffKSw5K3y6BSMe9IBIi0O0hLPHrRKn61ejmjYGfU3HlXuGP0mXDZfb/1Q0Is9Gf1EgY
	u91lm0cWPndlOX0Pu6JQ+nQqwZ3kD2g3UkTtbrUflaOhEjV/fkZfJBIo11WcGZlurqCpZw7GS09
	Z1Gng==
X-Google-Smtp-Source: AGHT+IG1oZhqjscU5pfjiY1Q7UEpsk3imnmFMsZ67z7dBWGY5jc3R9ttC3dArQUXZ4i83be1Xm4e66GVmgTedDEMPjA=
X-Received: by 2002:a05:690c:6f0f:b0:71a:251e:36eb with SMTP id
 00721157ae682-71b7ef66861mr146668157b3.21.1754370214226; Mon, 04 Aug 2025
 22:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com> <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
In-Reply-To: <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 5 Aug 2025 00:03:23 -0500
X-Gm-Features: Ac12FXwhfK5c6hCAFDVH8lXtPSm0rXJFOVWdmBpTpuOp_j1X3bUQ9DkVKABvZIY
Message-ID: <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Guenter Roeck <linux@roeck-us.net>
Cc: sw617.shin@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com, 
	wim@linux-watchdog.org, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_220335_247287_CA9E5261 
X-CRM114-Status: GOOD (  32.16  )
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

On Mon, Aug 4, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 8/4/25 21:22, sw617.shin@samsung.com wrote:
> > On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko@l=
inaro.org> wrote:
> >
> >> How about something like this instead?
> >>
> >> 8<--------------------------------------------------------------------=
->8
> >> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) =
{
> >>      const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
> >>                  S3C2410_WTCON_MAXDIV; /* 32768 */
> >>      const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
> >>      u64 t_max =3D n_max / freq;
> >>
> >>      if (t_max > UINT_MAX)
> >>          t_max =3D UINT_MAX;
> >>
> >>      return (unsigned int)t_max;
> >> }
> >> 8<--------------------------------------------------------------------=
->8
> >>
> >> This implementation's result:
> >>    - is never greater than real timeout, as it loses the decimal part =
after
> >> integer division in t_max
> >>    - much closer to the real timeout value, as it benefits from very b=
ig
> >> n_max in the numerator (this is the main trick here)
> >>    - prepared for using 32-bit max counter value in your next patch, a=
s it
> >> uses u64 type for calculations
> >>
> >> For example, at the clock frequency of 33 kHz:
> >>    - real timeout is: 65074.269 sec
> >>    - old function returns: 65535 sec
> >>    - your function returns: 32767 sec
> >>    - the suggested function returns: 65074 sec
> >
> > Thank you for your feedback.
> > I'll make the code changes as follows in the next patch set:
> >
> > static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *w=
dt)
> >   {
> >          const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> > +       const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
> > +                       S3C2410_WTCON_MAXDIV;
> > +       const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
>
> Not sure if splitting this expression adds any value. Why not just the fo=
llowing ?
>
> const u64 n_max =3D (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
>                     S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
>
> Or just use a define ?
>

Oh, that code snippet above is just a suggestion, please treat it as
pseudo-code for this purpose, -- I just wanted to illustrate the idea,
and should've been more clear! Yes, definitely should be revised and
re-tested. And yeah, I agree, one single const or define would be
enough, no need to make it too verbose. Also, the naming may be not
the best, e.g. cnt_max might be better than n_max for example. But
I'll leave it to Sangwook Shin to decide on the implementation, just
wanted to communicate the idea.

> > +       u64 t_max =3D n_max / freq;
> >
>
> Make sure this compiles on 32-bit builds.
>

Can you please elaborate what might be the possible problem -- just
curious? I admit I never though about 32-bit case when writing that
code, but don't see any immediate issues with that too.

> > -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_M=
AX + 1)
> > -                                      / S3C2410_WTCON_MAXDIV);
> > +       if (t_max > UINT_MAX)
> > +               t_max =3D UINT_MAX;
> > +
> > +       return (unsigned int)t_max;
>
> I am quite sure that this typecast is unnecessary.
>
> Guenter
>

