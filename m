Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C032CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=; b=C7A5tqTmGHvE+2tziXomyPJ7A5
	Rn6jejDM9ltR39JxslfFr9e9EfaXoVgEYLu5gK0h31QO2sia2vdLJtiZ3FcbAflEsGzgX/Hha5Svc
	IGMmLd7yHaVYeIMBcREZInG4i2k46cxqj/vuS52c0ReGn8gyFFgE9Zo5kPj+oxIWgpREYygqzup1G
	XwHPdPx43H6qOMkd2edXLsOJocMW6KVMHP9OZ8BewFSURvKNDKLvmx8v9m14eNxUTWjJffOJbQDfA
	Ddb1R9Gm3VyiQUEtKTdZGnpo8JIM6RrgsV/xy+E+m45BDm+B7+xcwtCfaGN5mbUYOHwnk1FGpcJT9
	fpMtfdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw23F-00000008zfG-34kl;
	Tue, 09 Sep 2025 17:22:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ei-0000000838k-1J4h;
	Tue, 09 Sep 2025 15:26:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b043da5a55fso773410366b.0;
        Tue, 09 Sep 2025 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757431583; x=1758036383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=JOjIljSkgiclH0Hd8rqgpuUNVOIvyaMbVLe45Lt1BTLVgf80VuwjIMTVOLyur5HNwT
         UIyNYQ1ekhi7cl5IpSUKcmSpCHDKwwOceLo6QnG7ZFwUyJ4PkN60GqApnCJagj5bsobA
         CBgm1LliSzVaVpcnJUnjcULzgMv8Jk0DV4cAhKT0eopYfHqN4SoP50DUncPjnbG4XFcR
         /VZ0sTLmdQ42aM/oylzFAsI2v3SQ1HS3FQx+hPZxmRErlQiV71CbkgFTyZp5KgZz4GmO
         rvUbvuEYrdv31G2+j4XjbpPz7xYg/3ReV9oni0WUWC86LpDyHSx4ysFuC1/uHNM48luw
         kJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757431583; x=1758036383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=tyUucGu6CZgAFNmgGI2Hai1OUl2LLZniK/ggDr0tj8/kyTkW5CvFDw1Tgb/hSNoiWc
         11YF6q5a2SfI82sm0Q7569+/R8Yf8Gien2vfnctlo8H6hARM07e+8oKWKcMcJeb0xfEk
         Cw6ZSCzG7rDAmyryVk6SMnOgZZbMgihxESflYz5i9zzMJh/NbGI/43wLudP/BKt5Vlhe
         7yO1Z8KpdfZqYZMEDswJc9xam0NKHPkS2udJSoxyOBslnTXxZJJnIsZch4a1CiWd4Y5L
         t0h4z7Aem55CCXVnw6f9njqovwBh4Nad3nsAo/YKX32VUUkAVD+jpZOh0A9b+j8mc2qv
         0gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/rWgBd34NDgTjJcBEYnxmm96hLJnipaND/U5R7sOr7f7ziZHy14ss2SILSzMVJ7PrrVhndeUCBZMVPAY=@lists.infradead.org, AJvYcCU8/1StqMdE8lBnFOgL9cJDMuNqb53F5xvZ7kSRrYz8X7QIl7b4YpXpeX6M9S4RC1pRJOli1au+rnxx64BGwvKe@lists.infradead.org, AJvYcCW2vQM22147xXiesD1lzItKNfi0Xl/aGrJ8ilOVwabZTfxvD6bUSoPorAxCHNp9JWhvkJlJc1u7rIQq5037/dw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9J1ZC3FuwB1dEN8HFs99JOIZ6LcdEo5tY6G2MbqGRzjICe0x
	Ix2obBmvM8N/tRtVcJtaF0W4EL0loy5eW91QSPGnkTHyWx4cCtA3HWJM6n585XnEX54e0DT7/VW
	tAd+ct5dg91NdJKgmv7xxKs7OIXErjvg=
X-Gm-Gg: ASbGnctMwqI8g8l6eWMbN0HIJ8eOCwHywRshdNbIDnPaUxT5/wqez7C8kvjM+wJOGEq
	o2iLfNyL77VMSUxs0K5ipUrA3t9b0CFhh1Di6c6Miuj2qWmR5gYKxMBWmRwOkzMI9+WT16v4XQN
	S6tU4eZPoN8cfk3pt/e6/NlwU0XjACXpB5uZ/1n/6QtPkkxwdGhAAxcMoqhdo2DGdZI7Id/S0UQ
	Nrkoor+2A==
X-Google-Smtp-Source: AGHT+IGZg15DrtF72G9h9dyt21xSsowFAKz71cJqtEpccOZC9aRv/EPnYIUJriaKNXq/eDdw8hEDX9pZ4E1DPi0ePuo=
X-Received: by 2002:a17:907:8687:b0:b04:5200:5ebe with SMTP id
 a640c23a62f3a-b04b173704cmr1239828766b.54.1757431582431; Tue, 09 Sep 2025
 08:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
In-Reply-To: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:25:45 +0300
X-Gm-Features: Ac12FXzLAWj8jy-m4m9ZPXb_pPgfqX2JAuL57q-duTifXdjD_POsau2MIQgkxqI
Message-ID: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_082624_353152_BBA2178C 
X-CRM114-Status: GOOD (  23.17  )
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

On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:

...

> > > > > TBH, I think those 6 all made the same mistake, i.e. thinking of =
the compound
> > > > > literal as a cast. Which is not!
> > > >
> > > > What do you suggest?
> > >
> > > Write it in less odd way :-)
> > >
> > > foo =3D (struct bar) { ... };
> >
> > I don't get your reasoning. typeof() itself is well established in the
> > kernel and doesn't
> >
> > foo =3D (struct bar){ ... };
> >
> > evaluate to the same thing as
> >
> > foo =3D (typeof(foo)){ ... };
> >
> > ? Isn't it still the same compound literal?
>
> It makes it so, but typeof() usually is used for casts and not for
> compound literals. That's (usage typeof() for compound literals) what
> I am against in this case.

FWIW, brief googling showed that nobody (okay, I haven't found yet
reddit/SO/GCC or LLVM documentation) uses typeof() for compound
literals. So, this makes me feel right, that the form of typeof() is
weird and works due to unknown reasons. Any pointers to the
documentation you read about it?

> > > > And are we not allowed to use C99 features now anyway?
> > >
> > > It's fine, it's not about the C standard number.

E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.html
(8.1.0 is the same).


--=20
With Best Regards,
Andy Shevchenko

