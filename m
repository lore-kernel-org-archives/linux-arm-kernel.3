Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDEDCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmlqINBz2Q+ZrcrpkgMZGpbGEYV3/LLrzXOGi8nt9xo=; b=OcofRj9/trLIvuoE9PNI2iP0T+
	Go0sv0YADxskAKtrQq09AaixOmognO++n+cwj3ChM2UQkjYVihXsBCK1cZGY+wS69N2GKWwqBZJFJ
	TEygxYFZr5Ahrvd+pXngJjnPWS1l5fruhnmo/SxsRsGw1C5XBRNFGoj0Tv/q1PFIMPvoGb+Kky3XT
	ItGBXmNhoQo8R2yGxVIYLyiTTKyRZmUpv5Gy22kJWprZ9Xw/ftMIUrA42YDmvwL+o6j1kV57pWeOK
	mlvete+vRw4WVt5mRfHNnn8Ndvlv9T4DUEt7sEv83UFgtnmOwUfIUb4MkYYcXx+TYdLlbUquGNY5M
	sbdNUwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPebO-00000004O5D-2E0d;
	Wed, 20 May 2026 10:56:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPebM-00000004O4S-01aK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:56:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2784266f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 03:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779274594; cv=none;
        d=google.com; s=arc-20240605;
        b=X7D2Rmeu07f4b22kwn/9XeZ9kGtgHcHmQsCoIKfevioGZrPL2w5P9nPgfMWoAISisl
         qTnye63PGlbhxDQhOrw8HHWJbuWd30emu1fkJZA8iIRGwGo1e/DhO8gXjCgH1VGzU8mX
         YNXWC9MqbMoG/G0Km6qL//YBAq35Kh7mVO84klmOoVVubsLTnomRlQW7hSLO1nOAMNQK
         GDmjgRHmWfBmVWO/Hn9gqs//RR0+gZq3yPpeigRVhqWvOzjqaKk4NCHrxhlt2FhBYoUy
         dCljW1/D1Oae/d2zLwN1Q2r75vY9PVOuOvaVThazeXoWvVXqV79yHJil9B9Ovp8iC2xz
         WwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmlqINBz2Q+ZrcrpkgMZGpbGEYV3/LLrzXOGi8nt9xo=;
        fh=QeCa3E7bxANw/Uhdd1aMwOb/po5Nr4UG4SRmJaYpocA=;
        b=BIPwJ1ZrIGEJDA8/mFboRjsqugH/T+8gEk//mhT7m5HH8Fs/RQUHQ04K5JDyvfOKFL
         VMKKG3hMfffy0LumUflFU5iHg/hDIkOZRJXxygKDS90dYf6JSzOypot3pGu3+Tf6WS18
         /Io1N8pLdHFsY4p7JdUj8/FLbj8gNlePbLNA1GjQbCY8pjFTXU15bd+0M3e7UE4lhORO
         nohosdLoNqHd9xGf1rgitVtiHDJNUrmGIGOdt6Z6UxM+TPxL8jEXL8EDZ6or5j+MnXib
         8d3ki3kdtvTi5LpW+EgYAogdT0LDZmzY3dei+RREpDa8z4vBRBO+fRj81sh6wzNYbt6t
         F76g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779274594; x=1779879394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmlqINBz2Q+ZrcrpkgMZGpbGEYV3/LLrzXOGi8nt9xo=;
        b=iavrxSSGXiAI5lTVrdLovHNRucxN6pFPBeuT89KNCv3N1likG7TITv66Q3hb00jqvL
         ZK9ZlfGg9BsINd+1PWDC1/JpF1maSe6KaVQmWTt7Nrt8gzConQj8H6KtRRjggquwRfsg
         Sq26QZqsJHZNcfhqaCBKskb8mH5hH6G9fEXAH+iecSVDr/sSqBnxzrc3fxKzTH1te2WU
         30VuNIuJN5SunvT9FQ6ezAezX4c/CmJfA28QgYT2RDcR/12OhMCQJUh8m1MvpMtPp5Ex
         AJAfiV/K/W67N6HJWP8ZaZaB1p9WqozCDPML+typiOEGbso4gTuZx39CkDlo3AY8Y6HV
         +p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274594; x=1779879394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EmlqINBz2Q+ZrcrpkgMZGpbGEYV3/LLrzXOGi8nt9xo=;
        b=DUGbNV1/bVrvYf9AzeWAu6zdNAx4puBe36y5J8j7Igs9JOT9ix9xDqo6HhSEPyRuMo
         Bk/F6GCwUKkET0tkWgeKPDWsFvaaZDSooOdubBbulzyu+ByR6umN2IwI4OJxta0pcEb5
         w/KFsSnHFKicF9K7B4ZwtDdvhctoaD9WHf/l1tSAW03p9Wi2dLEhKb9XSQmJHX1f/tBu
         49arNnsSJ2MlK+XgoqxoH50fRh5dJOrycSDyu7e2qKfw+k08YazyOB3mALMt6JXt9dQe
         +6W7Qbh6NzIrjQb0V4KFL6xvTM21j3x2kr30KTGC+5KJ1h/oPdVZNTRxG26TKP43tDjw
         T6EQ==
X-Forwarded-Encrypted: i=1; AFNElJ90PAtYr4X/sMDRvQvVBMXLBLlTuGLLa+1qTjOyEn9Dd4CXXD+JOiej4VVHdncgw/1T2puCA1pyh8EYqRt1ULPg@lists.infradead.org
X-Gm-Message-State: AOJu0YzUo5SA3+Ibu0QSf+ggzLGxW97RGXf3hI86F1UJKJYnWjnDI/3R
	zWcGnYD2YpSaCxBjqaENiiyEEg1GhoGg84RDVR95R6S1YbucxL3vTAqKOEr5BOtKDW8T5X1y3po
	e2k+qTfqLIin6wcyBeZeLE28JVbnIPUw=
X-Gm-Gg: Acq92OE+Gbvhrh2wOQHyXlx6RC4m7g/l6OPriCNAJG4vQALVL+Kp0v7hYs9vv7yEOcd
	9/tZoBMMWsI4GjIAznqLHELW/RH8og+ld4CPAVgmHqGGh6oUqe4kVueBJaWJ/1z9340aEFgtbQ5
	Tx1JSZ3mi712nb9geueAg7pQPtZML94hCCjOYQzXeYVrLB/5ALuQ4iiikE1fx78b5n4Oi6Affer
	vZk9OoJT4RQ7+hiXkl7K5GNmmnCgpv3aXTu/BFUE6hI3/Low7vhrDKqbzaV8kClX7T7Wb/EpqjD
	sHxPGG+G
X-Received: by 2002:a05:6000:240b:b0:451:2157:6291 with SMTP id
 ffacd0b85a97d-45e5c5a5eb0mr38367387f8f.41.1779274594138; Wed, 20 May 2026
 03:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-8-jiangwen6@xiaomi.com> <ag2CeHWDLLglCF7t@milan>
In-Reply-To: <ag2CeHWDLLglCF7t@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 20 May 2026 18:56:22 +0800
X-Gm-Features: AVHnY4IoL99tDi7mKfIv1wB4vUPhlXOzK32-aiChnWRxAqCCSOXz9iauKTOd2JY
Message-ID: <CAHKocdEKjbuKjpBLCdz6ryohvQfZ0ucOjxb36wKziTs-ybaCnw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] mm/vmalloc: Stop scanning for compound pages after
 encountering small pages in vmap
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_035636_089561_95DD99AA 
X-CRM114-Status: GOOD (  20.51  )
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

Sure, will do.

Thanks,
Wen Jiang

On Wed, 20 May 2026 at 17:44, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, May 14, 2026 at 05:41:08PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Users typically allocate memory in descending orders, e.g.
> > 8 =E2=86=92 4 =E2=86=92 0. Once an order-0 page is encountered, subsequ=
ent
> > pages are likely to also be order-0, so we stop scanning
> > for compound pages at that point.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmalloc.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index b3389c8f1..60579bfbf 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3576,6 +3576,12 @@ static int __vmap_huge(unsigned long addr, unsig=
ned long end,
> >                       map_addr =3D addr;
> >                       idx =3D i;
> >               }
> > +             /*
> > +              * Once small pages are encountered, the remaining pages
> > +              * are likely small as well
> > +              */
> > +             if (shift =3D=3D PAGE_SHIFT)
> > +                     break;
> >
> >               addr +=3D 1UL << shift;
> >               i +=3D 1U << (shift - PAGE_SHIFT);
> > --
> > 2.34.1
> >
> Can we squash this patch with
> "mm/vmalloc: map contiguous pages in batches for vmap() if possible"?
>
> --
> Uladzislau Rezki

