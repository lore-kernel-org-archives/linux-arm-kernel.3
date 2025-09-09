Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F039CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=; b=1La+oIasw0QZVaO/svsdIPukvg
	Zm9CDSoTIdUdU64ApPGgJetiYR3AaOOYkTUOFXy92pJAaiRH6sATu2+MoS2ngB3h4wSfDSIxzab2+
	BO74e9p+Qp/n5BjLtRJQvKDWNPOJSfJiebxqKHLp9T8kRaoA92lRzu+84HwOnvbtPQalhuHwdyMOa
	IO6x3UQEpshgFVzVVSGd6wSzA0D5fwFwuNwGbczzffaSZ088QHKGNO+h3V6pvWaJwaTnLA10uYusa
	Mfr2wuksEYmhWli+/9KMY44QfvQbUHuxq20Sp6upWMBBzgL6iwtL3VKufYuW8FtOU5upkFsBllsAE
	IS6J/yNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw230-00000008zLf-13KA;
	Tue, 09 Sep 2025 17:22:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw04l-0000000801X-0iGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:16:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0415e03e25so773698266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430965; x=1758035765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=dTXkonhGBey2WoNS6BmzvpABED+KulAoytTDZ0R959mQiS+sBkb2n7PbcGSn+vnrkf
         Ybjs9WuN1DYrcn7wfReoB+r+UMm0A3LA+bQddydTrcgipWfRKzrI7e5rcG8gP5RSQTq5
         ZX9afgXumBVeZbxZjZ6MoQmfCqwBUJYUCNoGnsZhDdqUa0ve58AyH8Myjm/wS/HJcKUl
         WE2sUXs4e2kmLfvasBgTu4urFgb83oX9snbqwa7uKCYPfqRFWKurOwj6vhZyEYEi8M9V
         Vr0+EuqYWjYX8zo9RSBmFwUkxL3N8hoyjaiXe/Pc2/1JB37lKLoH7UYStxDVFQV9ImG5
         TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430965; x=1758035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=Bxh0UqWeLdnur/qK/aMjXzPR4GJDrfEvhxsd37gBg3Bl18L4OMucJddceGP/80UQOh
         Kuu2S0QkJvYu+N8GbVnf78Jk+bmeE0MRswLAS5k5WqcI3jLreN+SvCqyHsVfUEtrM4Dl
         0ovwlCRSx/PkqfwL4CCV1afSXd2X2wPQBWemdIX9bwYf7nYYW4uR6jWHxyQgmP8DPYeu
         1VlAxRuxwkaEcmvT7zyQTKfGCN6n2I9lRSbLTaERkSxfbEokvctqeZJY1fShHgfoGNhB
         HVuUTU9DpLJ8FlBm/bqfjKJfT4eox3svRkkhG77+ripuo6ROkZxNa6GLTSz6WmkPSEl/
         e6ag==
X-Forwarded-Encrypted: i=1; AJvYcCUlM2TnW9EnJJ1iEuunLo31AiSJWJILo+4SlTRCK8r979bPKc8EsQ03qqjYkRaHZZ0ov/flwBbgWRy5IYXBN6k7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+aO9TZW+e3auUDJup512r6/YzjO4HJ4Yx4317atCXyBX/J5/X
	4sPSIbkPfAclzszqcK+5KItu3f4IVyXg94WKP0WVlqqxJWxNSIgF+5mMb2NN5GeZw7x2OOJe6FZ
	WkhKqFyWp1D49LNPrTeMxCMfMGtzteQg=
X-Gm-Gg: ASbGncsG+xYcTY5IEzFHRHvMxSDbXnIwgvWgIKjfZKzHnFpgylgqiHdmhEVDhRXlaI0
	WhJnp5K33TBGLWQOt9ktEvcS1KjI7VnsGKUbY1L4p4y4u3U6k/hSvfGZ/5Kb4FJEE1U+/4OlfoB
	arUVqEHOLgUcR/9FwD+HiLCuzmwyiTsIVLaXmpN9yrjhwoOjBc7S9AcHjG67XX3P3Y1tJRot+yJ
	pjc/oHnQg==
X-Google-Smtp-Source: AGHT+IGeaHcV2kH627FcZIyd8vYLnu/2Up2e6b2i9sBG/bmosVjOp6dqHGnQ87UTIB1WpGArwM97TNlubL6NJn+jj/k=
X-Received: by 2002:a17:907:7e8c:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b04b1003707mr1194942566b.0.1757430964857; Tue, 09 Sep 2025
 08:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:15:28 +0300
X-Gm-Features: Ac12FXySsG8IXlocwCfN3VG6y5KLpIc0a90AoYqlSY-xU72GOTjlNCZIc8n9fs0
Message-ID: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250909_081607_208207_B60F0EB7 
X-CRM114-Status: GOOD (  22.34  )
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

On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:

...

> > > > TBH, I think those 6 all made the same mistake, i.e. thinking of th=
e compound
> > > > literal as a cast. Which is not!
> > >
> > > What do you suggest?
> >
> > Write it in less odd way :-)
> >
> > foo =3D (struct bar) { ... };
>
> I don't get your reasoning. typeof() itself is well established in the
> kernel and doesn't
>
> foo =3D (struct bar){ ... };
>
> evaluate to the same thing as
>
> foo =3D (typeof(foo)){ ... };
>
> ? Isn't it still the same compound literal?

It makes it so, but typeof() usually is used for casts and not for
compound literals. That's (usage typeof() for compound literals) what
I am against in this case.

> > > And are we not allowed to use C99 features now anyway?
> >
> > It's fine, it's not about the C standard number.


--=20
With Best Regards,
Andy Shevchenko

