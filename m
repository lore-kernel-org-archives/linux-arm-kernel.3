Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D416ACAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=; b=uG5Ll00nEcMoPUItvAcOIbqTO/
	DGPqLVa+R6u1/XwiWWSuzqCBaVaeLHGNWXBrpkdVASUr2hS29WvvUAijs7l+u61Qrms/TxGq3ctfh
	bNtJv/mcKzofpq+xFbD5FXhKWyxH5tya0fGMmN/MRny1B2C0kZjMO2xmWxSysXmkFbZ2l1LY9kB5h
	Lv6ixNK5Sr4gwGyUO6rvASBLHU3F4PG1MQ1oQZkoo68corpfHmOGTm2SyrFGMxzr9FwROZ8KQJHhC
	jjDlQybrXTM/THNxzGyRkqauKKk6I+pst3cKktz0/767C92BJEWP44jMDxuzAs1N8tWbE77GM1CYp
	N3EeuG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26O-000000094eJ-0mhT;
	Tue, 09 Sep 2025 17:25:56 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw14w-00000008U34-0aiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:20:24 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-336dd55aae1so52347571fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757434820; x=1758039620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=hVfaTM2jr5UcW3EphSn6SLIqBz5y9oFHzjAIfkQNzIozMbVFiHaPbo8M+7WgPLYVsh
         T8JNFyWmwb0daZ6BZmsh/9tKhT6vZnMMUToXbMpwEaOhJQXoqHTIOu5BMeKKW8Tei6zd
         AiYvAdsQrrknKGyVgEoAmqv7jqTDbeG2YRrONUNAbeGZYwQQ69jwzN1cW3KFsD4bR5rX
         wlaPdPZu30IezctiCpIvsp/T9/Mf+poDaYilfLxnfoBbTmEhCaFht3ld0CNiO65CMDrN
         nnHv8K54IVyauZmQ0BbUX+8LZfGtQQ4GyhFqKKfRfgGvt8G3pIQtkqXlyG3skZ8jTDCP
         vGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434820; x=1758039620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=StdSGbjSF4ifhzdTNn7f/69Vxplt/p5i6qXGSsioyrRiKluL7VcqjQBk3KVRty1J6e
         fCRmU444T3mpAGvEXnrZRzz5Ls0GAHNlOo8pExrdgP5LGSBJRsjRZ8V0Yiq8aKN+Tz0k
         +py50KPfIUwt6lZ0Q1rZkqVVdQHQ4OYTZnlBcjyyhxHfCE894WqS3ZEOkkwOPaXENmj6
         jqxdb0Ya6ZBeEOQLtrQpUeG6AEeNIKgZqnEAAG2qGnwU74ugABVXMWzX5q4rxN4/drhr
         cWU2e7iNCBhw5SWh5O5YCx2ryoR2q3g8wsezy6Vj167k1VOiQtCgdsFuWOL9vrFvgdZn
         Fbmw==
X-Forwarded-Encrypted: i=1; AJvYcCWKUPyfljOMLMUlBUk2Fu2xE79rDltCp/98qWcDJqN09kKHNW11ttql2vNSyPKWcF8XJxXVC0WiKsJn0Re+ragv@lists.infradead.org
X-Gm-Message-State: AOJu0YxFtXaiZiBHT6Y2nlV1jxNMMUKaOgRl0+ZBZeHrpg0/MsEoigrA
	/P2zusKIh9e89RfWecZCz5jH5MjCfa1W9+MXhR/xYJF9NumUNk/oaPysljoRODHxbWbCx4e1rGx
	fw5WeaZ2ZpaH1u0pvjXbkmrVsxZoTBXMtBt0K7IuXzA==
X-Gm-Gg: ASbGncv2aux7KOKvmTe3CkTObol4Bd4bc+N4pohtK/SE1v3L3tYdN/YFrKfMKeSslbX
	1lmSMZDhZT+PGr3eF80gz23CH1SE770BKZJ5lLOUL7AnTd+bqP7kOrZB0CfSQBAnlHpo91wj7b0
	DZkLOqui5JfyaexPU7kmB+ZtYBivNbjDz1CyxXktn6lMj/CsOGPXnx5YuvVaLAlvuEYzOgAVe6r
	e9tOfb+fm5cp33qMRIY8XpGrWYRyVAzceHqZOdJnv97eWJPgQ==
X-Google-Smtp-Source: AGHT+IEztBpigh5RxbO1CBt/5KgEHGRrHXuTWtPssLeYdALPuaphhHGsx19aeCNSyhIa3AeA3fW9VXpZoFoDSTU49vc=
X-Received: by 2002:a2e:be08:0:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-33b51b18984mr33377121fa.21.1757434819790; Tue, 09 Sep 2025
 09:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com> <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
In-Reply-To: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 18:20:07 +0200
X-Gm-Features: Ac12FXz3JLlhRsOgq8cOPinTet2g1mbuWxd9zMtxwsTKBrX27rDe6FL8vxMW4vc
Message-ID: <CAMRc=Mf0sXnak0Ov3bwgv_xVVvw+CxA1iAcvDv+B4a155HZq2w@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20250909_092022_200113_718C0EA9 
X-CRM114-Status: GOOD (  26.70  )
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

On Tue, Sep 9, 2025 at 5:26=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 6:15=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > > On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@intel.com> wrote:
>
> ...
>
> > > > > > TBH, I think those 6 all made the same mistake, i.e. thinking o=
f the compound
> > > > > > literal as a cast. Which is not!
> > > > >
> > > > > What do you suggest?
> > > >
> > > > Write it in less odd way :-)
> > > >
> > > > foo =3D (struct bar) { ... };
> > >
> > > I don't get your reasoning. typeof() itself is well established in th=
e
> > > kernel and doesn't
> > >
> > > foo =3D (struct bar){ ... };
> > >
> > > evaluate to the same thing as
> > >
> > > foo =3D (typeof(foo)){ ... };
> > >
> > > ? Isn't it still the same compound literal?
> >
> > It makes it so, but typeof() usually is used for casts and not for
> > compound literals. That's (usage typeof() for compound literals) what
> > I am against in this case.
>
> FWIW, brief googling showed that nobody (okay, I haven't found yet
> reddit/SO/GCC or LLVM documentation) uses typeof() for compound
> literals. So, this makes me feel right, that the form of typeof() is
> weird and works due to unknown reasons. Any pointers to the
> documentation you read about it?
>

Ok I'll change it. I also need to change it in existing patches that
already landed in next then.

> > > > > And are we not allowed to use C99 features now anyway?
> > > >
> > > > It's fine, it's not about the C standard number.
>
> E.g., https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Compound-Literals.htm=
l
> (8.1.0 is the same).
>

I get it, I understood incorrectly how they work, no need to rub it in. :)

Bart

