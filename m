Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA29DCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=; b=bJW64mQgWOUWiAgrJb7Kq3QKDh
	iwJycKm5GvDQh5fol9XUZHP/l7nEGAhQPU8m8PGfHYULvg4GjZreRcCukJmGI+1jNYGcJfLuxz0yx
	53G74U9jc8QuukLpG3uxPtxnVaxPbFxofaJO3uHoSjYNYSQtm/m1wrx3FaDjhm7MxteHpS4REwGIw
	F0dC3v455/gxspriQscjdfMOF6moHLvZNMjClV2DtPycF4NOF7mxo+TugeeEy9upJo80m3FKcJlE8
	Ief2vVubx39vfB97ipIoqLDY1yVZNUj/fKzAizwsCrP0g3LRn2ImidKdBMVEs4Q4d7XQlsDBBfplX
	ETrlPpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Y2-00000001tKE-2nDW;
	Wed, 29 Oct 2025 15:57:18 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Y0-00000001tIL-1c0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:57:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-378f010bf18so12088741fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761753434; x=1762358234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=;
        b=aCr8jpAOmWZimAycj+jti8yfQkpiUuJh/lLLD4lyfri+RIM8o9i33vLbeTzfTdw82j
         gUgDwd/x6sunbigAUfEO3ZXEXZKolqbNzA+SfTnZQwKXzbjkHrrPWIAASyQE8JkEk2MQ
         h+9CKDkvLicNGApac3ndQXnyuoKpoqpVW/F7VHCj783mG0ehhGrKaRqTc+SiE9bYaFxM
         EyVmkhMXqPWGV8dKcBVMe35M1KG/l1rgGqOH0vqFX6wLUcAlES3gvyDguXhWycMOrexF
         tMIoTh27iJa/nQ95MgOZd2RJ0TIYof7UmwcRk1A2z3zTbTxteJUMYDTMB0IjjfLGb5lq
         DQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753434; x=1762358234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwDgrJ1PHv1+Z/jYYOmoTTQu/BLRyS0iXW4M5TIKQkY=;
        b=fcfxjPMUxkfcW9SHScgWe3yED1aeeaUVuBlNQLs1Uqtr7WaOZrYRgnVWMKcEukM9qg
         knOGc0+0jEIdzrlKICVuSmsWrtymMmjGf2f2ea0uDcIZEB9Slz6owLWWkookmMBOTpaY
         e2Sk96jeaJ56pol6FMt2E6r7Es1jMnp98/8Zv5557p3hniB70+6bBax6yHTdap/bYcyK
         K/u0yhu5Rg7gbms/Ix1Joe+6gDnOnjTDCyQIwmAxuYTGBncenFd+p4pmZ5Nk58mO83a8
         8UKV2h7wBx8Wk5TC8Py/T4ijG+4WRv5VconCXTau5DwWGAzuL8h3APvE0/aaLit83NgJ
         8Usg==
X-Forwarded-Encrypted: i=1; AJvYcCWOIvgin/SLVSIkbSiptxeHaP+rGIoiyWsxxX3+WIPKlPoAvlE8OXf+WOZUxa4n0i8B3HmknOopJegyR050Gjcn@lists.infradead.org
X-Gm-Message-State: AOJu0YzpkgJgPs0pffIVRTxUTR39o9zd0TF7UjMsU4/iCoRkHXmw5nBp
	ChfHLBNkiF1gIaPoLGBLRq9iqKMKdti6w1nRDPaf3ZZv3ssJXYOg6YvgpLEcWyvsRSxxPz3iOSn
	8R85d8q0fn/iNBr4HGKfdTVSTYbW3Y6Yz+Lr+LzP/FQ==
X-Gm-Gg: ASbGncsMiXPd8JObzmQ878nwq8hWfnAwKJiobGT0QJG3mH1DYORM5dK3usN38sTsRSP
	PeeckYPn2dABSJaox4gYBoTqPEyP2G1X7chSfXzup2gGTaJSIaRvWy0/f6vc66rtVnQXnj4YMwN
	ATift52YwYi9x/7sP+9LVuHj+xp4z20BrCh5rg42eRFeOw5dEp2VbnlQHmZt3xt65PkWqGQfzHh
	KMtPPO+XDrLvZf/id8eN1ZO2GWMj+xyA8rfUAPVi7I1T05rIjy5/y4N3Y0uCQN02G66/C6MIq7D
	82G0+lwzn7qzS3qLYfCIBhyRUxw=
X-Google-Smtp-Source: AGHT+IFY1i/xx25cv6Ui/VCi3uSKIAy54H7ItoaBFtAYqTtPocNBBoyPi6yJvvk6xxRW45U/aC0bt+x56RpHt48kapg=
X-Received: by 2002:a05:6512:3a8f:b0:592:f912:c890 with SMTP id
 2adb3069b0e04-59416d1b67bmr30458e87.7.1761753433905; Wed, 29 Oct 2025
 08:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org> <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
 <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com> <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
In-Reply-To: <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 16:57:02 +0100
X-Gm-Features: AWmQ_blmdCXVfDmCuctOcWac3U7ocspMQ35GR3eCIvgTpPWEqk3le8O9ZO4wqZM
Message-ID: <CAMRc=Mfz+Se0Wq4cXjgP=DBOMkTqSBdoV-CcC-+Ma0hfELARzA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085716_534255_2297CA72 
X-CRM114-Status: GOOD (  36.42  )
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

On Wed, Oct 29, 2025 at 4:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 01:39:34PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Oct 29, 2025 at 12:45=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> > > >
> > > > This module scans the device tree (for now only OF nodes are suppor=
ted
> > > > but care is taken to make other fwnode implementations easy to
> > > > integrate) and determines which GPIO lines are shared by multiple u=
sers.
> > > > It stores that information in memory. When the GPIO chip exposing s=
hared
> > > > lines is registered, the shared GPIO descriptors it exposes are mar=
ked
> > > > as shared and virtual "proxy" devices that mediate access to the sh=
ared
> > > > lines are created. When a consumer of a shared GPIO looks it up, it=
s
> > > > fwnode lookup is redirected to a just-in-time machine lookup that p=
oints
> > > > to this proxy device.
> > > >
> > > > This code can be compiled out on platforms which don't use shared G=
PIOs.
> > >
> > > Besides strcmp_suffix() that already exists in OF core, there are als=
o some
> > > existing pieces that seems being repeated here (again). Can we reduce=
 amount
> > > of duplication?
> >
> > I'm afraid you need to be more specific here.
>
> You can simply browse the file, it's not long to find and think about it.
> I'm _thinking_ that it's possible to improve the situation overall by
> try our best of deduplicating (or rather not duplicating) things.
>

Sorry, but this is not how reviewing works. You can't just say: "I
think this can be improved, go figure out what can and fix it, you can
browse this file for reference". You need to specifically point out
issues in code and propose alternatives.

> ...
>
> > > > +#if IS_ENABLED(CONFIG_OF)
> > > > +static int gpio_shared_of_traverse(struct device_node *curr)
> > > > +{
> > >
> > > I believe parts of this code may be resided somewhere in drivers/of/p=
roperty.c
> > > or nearby as it has the similar parsing routines.
> >
> > I don't think this is a good idea, I want to keep it within the
> > confines of drivers/gpio/ and the use-case is so specific, there's
> > really no point in putting parts of it under drivers/of/.
> >
> > If I could only iterate over all properties of an fwnode, I'd have
> > skipped using OF-specific routines altogether.
>
> The problem is that every subsystem considers "it's not a good idea" or
> "historical reasons" or other excuses. Since you are adding OF-specific
> stuff that has something already done inside OF specific code, why to
> spread it over the kernel by duplicating in another place(s)?
>

Well, point me to the things that have been done already and I'll see
about reusing them.

Bartosz

