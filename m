Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE44C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU92PAxMuIwAbEifcOhSO2wdvjiG74/DYY2SKby5M8Q=; b=2blrNQT6pkPZPyWRadZsFwg2uy
	rSIE4IdZXUEr/sXAqIWx3IfO2n1L4riwUK05uZVcyyEP85Bl6zjVvlVO4Ebice6gaK6m3I9CqM8jJ
	Pr/wLKBQSiEvtMsMw3Qcw0mDbYNbNEsVoB0t8Kl0jm9UcoZgxFZgENlYG6f83lBdDvqCoUwC3+fe6
	HiVcBkmWAOhjIigRyZ+C4bOoiLNnb12u5sT6QQ7orpWhXf2Arub6dUdMCkHcNQbKl8KUZSFpKXjww
	4xlq8/A7OrqCpBBnS1tkpvGGpO/j2+jzUco0oBcZ2zbdRwR7ezupgk1VnyTsMOPqofL5DIkzK3HoN
	WPRiqfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyPc-0000000AjWG-3vG0;
	Fri, 28 Feb 2025 11:20:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxtu-0000000Ae5u-3Zkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:47:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so20433661fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740739644; x=1741344444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NU92PAxMuIwAbEifcOhSO2wdvjiG74/DYY2SKby5M8Q=;
        b=PSzr22APjyoYibZlZFJjBtTbXdxcAI8YtF3Xhb8XsEVHJXSYlI29KcctwxKAjTwRpM
         FVYLbsgJq0U5cpQEOnZAfHKX9JSU1d3Xuq3iNKBe2vPXCt+zZJvwOLuBR5quVkhjiU6O
         azIfQFZ3LIxhT1PHTa6OUv4lBJUPRsT7ohWxMffah9wDEybrgsmjg+HEX6PGG/2MFHxc
         nqgedRdaH874l9z1VwD9H6Q3F1ijZGDC2W3p7QwQL7vJlNoU1ka8MSqmO4KlWpl34lg1
         M0m+OVkI6TfSrMNALA79DIyhRSuD8KEvHNpf3GZwmwSqX2L1DcGS4srRHLpBYQ0lD/Xx
         nuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739644; x=1741344444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NU92PAxMuIwAbEifcOhSO2wdvjiG74/DYY2SKby5M8Q=;
        b=cBmQ+OGOYfcNX87uA4ts1gc+dg9t1HyDXjBubwcNwi7tf3ARj8rJ9LE/iA3utb4Rv8
         okwojvzeUXC+XG+Hto7ka0wo/DluIb8dj2BZMFe0CyzJKnz8hkdCTaTy/Xus5idouXeN
         0ATbUgYkqmidGTTDD0jmuujFDijnCuy2+wSX/c4zwWmY/+s5deHgYHQ5Q6uOG6o11BvH
         1rPV/FOra4qNiz6FTjGWkKcExDvoYmCtCFKu+IwlxhqLb/wmn5DAH1vUWUL7vAUiDsM9
         S8H2CigXja9OCVBXu3Q/H1lTAjPossYMBqwqIHWfSTXtrehSmlwkTUai3Oertd0yw1+X
         ghlg==
X-Forwarded-Encrypted: i=1; AJvYcCXi0VHgdah234czoH2uoKODFwIQ53cdbcTN6Rrm8GT6lzn0g1bz75qnLwXv3ivxCTyAgJfmesobAdZ3nKU3/cUi@lists.infradead.org
X-Gm-Message-State: AOJu0YyLsK9h4t9bT1oalD3sG/a4Wc3YpxeTXvTxgnugN+JjH4EYQg8q
	e7usIXh1AQjkDebm1HMQosPIC/J+AaqLx3KRzvZMuBXdLnCtPIEQ3//7ELdokk3lEqont1WKpOg
	vc6IsmTKsaYWgtCPj/ilBa3ZyopiGIIV0YB65yQ==
X-Gm-Gg: ASbGncsoXFOB5zgt6K3hhpcfSPcXgYD32Rl9W2+fx/oOT6BFA8l+Jd2ufLfJj0dwsE9
	rDZOnT2EOmuozz7CNvxJBfkf/yOzzZDCSN0M2z3znvFcTuK2saqe8sF1IPtkvHCG63jeHtwJlW1
	btnkzCT2rOfk6bt+YqoPBKy18sbm/ZigkUSCugTbU=
X-Google-Smtp-Source: AGHT+IEffbnoGh/ZB0Av+vhJaJSeIcPXpBvqptVNxXGkyb3XMvwRwNUY07bvRzkN6KART5xjUd6SjTwMbagTMx4dBss=
X-Received: by 2002:a05:651c:1545:b0:308:e803:1175 with SMTP id
 38308e7fff4ca-30b930c7c11mr9231511fa.0.1740739644452; Fri, 28 Feb 2025
 02:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl> <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
 <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com> <CACRpkdbkcX5pEeikkDZAxSGp+M3kJH5SWimxQA6P35iiDAUNdA@mail.gmail.com>
In-Reply-To: <CACRpkdbkcX5pEeikkDZAxSGp+M3kJH5SWimxQA6P35iiDAUNdA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2025 11:47:13 +0100
X-Gm-Features: AQ5f1Jq-ljcT0uOKj_SffP5eijOqNrKUyeoMU_8l6yP7Bn_KmF7NH0MYmjepHtY
Message-ID: <CAMRc=MfcyAxF6Q4XyCiJs-7jCDX5dyT5=1HPmcDGQGiJoXf5Sw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024727_055775_4583CB4C 
X-CRM114-Status: GOOD (  26.86  )
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

On Thu, Feb 27, 2025 at 11:53=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Feb 19, 2025 at 3:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Wed, Feb 19, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > >
> > > On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Since commit 9d846b1aebbe ("gpiolib: check the return value of
> > > > gpio_chip::get_direction()") we check the return value of the
> > > > get_direction() callback as per its API contract. This driver retur=
ns
> > > > -EINVAL if the pin in question is set to one of the alternative
> > > > (non-GPIO) functions. This isn't really an error that should be
> > > > communicated to GPIOLIB so default to returning the "safe" value of
> > > > INPUT in this case. The GPIO subsystem does not have the notion of
> > > > "unknown" direction.
> > >
> > > I see this was already tested for these specific boards.  I've also
> > > found that Avenger96 is failing with bisect pointing to the same comm=
it
> > > this is fixing:
> > >
> > >     https://lava.sirena.org.uk/scheduler/job/1126314
> > >
> > > as is the Libretech Potato:
> > >
> > >     https://lava.sirena.org.uk/scheduler/job/1126285
> > >
> > > neither of which produce any output before dying, they'll not be fixe=
d
> > > by this change.  Seems like an audit of the drivers might be in order=
?
> >
> > Right. I don't know if they return EINVAL or some other error so let
> > me prepare a change that will not bail-out but simply warn on
> > get_direction() errors in gpiochip_add_data() instead.
> >
> > This patch can still go upstream IMO.
>
> I'm fine to apply it, maybe as non-urgent fix at this point? (for -next)
>

Yes, the offending changes in gpiolib.c were dropped so this can go in
the non-urgent way.

> Do you want to send a non-RFC/RFT version or should I just apply it?
>

You can take it as is. It got tested and reviewed, so the tags served
their purpose. :)

Bart

