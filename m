Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA3AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6AXuDDeUL1WpUxErghD7iQZDxn7tXl0MHZ3gm9RjBI=; b=myn7zgO/Ra0rfa5X6xyvBmh1UH
	dB1aTsyEWcFGEf6Bq6qOvnZJkFCDoh/DbLQ/f6gbtBt2SjZIgXV6JfMf5/8f2mp9V3RZr8iXhtUNN
	fB2XT0NpKvnGTzIYej6UtkSPQ/5bj1vtEAtKhMRFLWhwjDmHm3J4zTnxoGlDL+YHeyoJj+lMLkBmm
	Z7WR+axT1He5w6uuV032bZSOUZdOyjEQmUlettX6MkqMjD+XMmvDdcdrXBkzoiBbO6SZdPL96EOQS
	ulHcY/sWjUsRKhSMNpGKL2WmvzuG4pIEhfXEkMvQSbzp7sA9TsOsHH05bkxqHVtiufLDa8bcXMoah
	Mm7m63EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh899-00000001mbS-1t9E;
	Wed, 30 Jul 2025 14:51:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh83j-00000001lsW-0QvL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:45:36 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso7344950e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753886733; x=1754491533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6AXuDDeUL1WpUxErghD7iQZDxn7tXl0MHZ3gm9RjBI=;
        b=d3AhZe64Z/4CaFKb1BYhBWHv2UZSJkfMOI9Z/iZd9O9L9fMu+H2xW9I+s+uHpBtbUX
         8Jbbgp4r24XKTGLhVJUNCf3XgfqCCW7RU4aNAlskPhq9cOkVr7SzXClyyIPJmHqA6NmF
         yIagDu11Ao86wjX1p2iRUMeapZ37l3Cnb2AtSorWb4v7Dt0cUWEGfJrs+PUqHMwuGMBF
         gEosyLE62YCfp2g7/5NNL2kJA4tKLODRkgEsl6eshlst6xOBE6CClxpo2bueZ6W05BfR
         NvEf/sOeLBerYWP0qr5CGwb20/HZKF/zIOcT4EzzMpt38Evg1UZi7Tc04ZM3+Y0c6wYF
         2deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886733; x=1754491533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6AXuDDeUL1WpUxErghD7iQZDxn7tXl0MHZ3gm9RjBI=;
        b=RSju7qxAfCMC3v32Z2GR1Jyd4JfJ9zXAu1hG8OYDcU5UUjbqWPUWzCH9I5H61SVTlc
         wRUgndYfMJwNofd8NFvd89aBZ34UF06OgqoBiplq1kplnm++1vbM1HiRawj05Bsr1bE4
         onhZIt6rRBRBtqhPGSJBVhtJV7zVLLXoWCsGkyy9Tioj7E003qoa87C08aV9LbQqeaMj
         gDEnXkBEhWgdTiX21fZ0coZS7mpGZaGgEhQ826VqXMFxJnM+FIy691H55akv7insy1VI
         duim+mbsPyZK49vQRnzD7dZI8U4xbPLF65tPS6BnoBwOXf5W7eUizOQnhMfUdntiZSzH
         lMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhoyc9NuE1+z1N9C8UrLsQ4JF8N/ZXSnxCeZA9FwHU6Vs9QTc/bliFtI2NoUDNBT2/t/R2KQqRGv7ZjmxHULa@lists.infradead.org
X-Gm-Message-State: AOJu0YzX1S2TDO3OYjt4h8cx8K+2SiC9GmC8g9xKR4eGBkcCOHd8D0Q+
	ZilimUiQ2nEyxLm/jg57F0uSf+Slu/lQ4lRxlrKNy8v95J4+ZC3uGqko4Nm1MV49lSWjjEK0N7L
	rG+4qIk2CfN4HePlQUKdEsgVGEEkYPSb3pcIQP4KafA==
X-Gm-Gg: ASbGncupAdNo6RgJDPgP4WtUTNjvhvNU3gWU3cQAh4R2OMPqrM0xSGm2QHFxyVrdVsJ
	qflwMev5p2rsSSGM9uvvDlta1BgzOIx9DlywwA62gBeiLDGblbn/twnT4UZI8x6h9twpHEmdBMF
	GhUVJOxidBgg3vniKlWBxXzXlbKc/7ufl27Ratjn68/VcP5qKHGYn7cWwin4x9RsMindvO/teKs
	InKtLzkyFa0uXZfcjppOH4qVNqiFSurK/gXQMg=
X-Google-Smtp-Source: AGHT+IG0Q6hH9i+UpqLftCvpSVBouzPpbLbuygIY2t4i0+nQyoHOVMz3gwtmG10RMLHn13yYgB8U2bSlEYWDzelEprk=
X-Received: by 2002:a05:6512:23a3:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55b7c027afamr1034186e87.15.1753886733212; Wed, 30 Jul 2025
 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
 <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
 <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com> <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
In-Reply-To: <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 16:45:21 +0200
X-Gm-Features: Ac12FXyd8ePQ6VSvFuinf3meGy3NBROTyjzQV07xe8o_XLvEkxT-hmgEmHvLoEA
Message-ID: <CAMRc=McPvFzb7CSFSKOsQZD9ZPwtf+bCw+Ui=m6OoX0GxH9DtQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_074535_145025_592C1A47 
X-CRM114-Status: GOOD (  30.71  )
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

On Wed, Jul 30, 2025 at 3:30=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > > > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > >
> > > > > >  struct pinfunction {
> > > > > >         const char *name;
> > > > > >         const char * const *groups;
> > > > > >         size_t ngroups;
> > > > > > +       unsigned long flags;
> > > > >
> > > > > Not sure we need this. If the function is GPIO, pin control alrea=
dy
> > > > > knows about this. The pin muxing has gpio request / release callb=
acks
> > > > > that change the state. Why do we need an additional flag(s)?
> > > >
> > > > I'm not following, how does the pin controller know that the functi=
on
> > > > is GPIO exactly, other than by the bit set in this field?
> > >
> > > AFAICS the gpio_owner !=3D NULL means that. No need to have a duplica=
te
> > > of this information.
> >
> > No, that's not at all what this series does... gpio_owner is the
> > consumer label of a pin used by the GPIOLIB framework. The flag I'm
> > introducing it telling the pinctrl core - before GPIOLIB is ever
> > involved - that *this pin can be requested as a GPIO by GPIOLIB*.
>
> The certain pin control driver may even not know about this. But even
> though the proposed change is an overkill. If it indeed needs to be
> done, the solution of valid_mask approach sounds to me much better. It
> will be a single bitmask per pin control to tell this.
>
> > It's
> > the other way around - without knowing this, for strict pinmuxers,
> > GPIOLIB would never be able to request this pin if it was muxed to a
> > function (even if the function is called "GPIO").
>
> I need to read the series again, but I truly believe we don't need
> this new field in the struct pinfunction.
>

Without a code example, I can't tell what you're imagining but let me
give some more context: the flags field could only exist in the
qualcomm drivers but the problem will be the same on all existing
platforms so IMO it's better to centralize it right away. And if we're
already centralizing it, let's make it future proof by making it
possible to define more such flags if we need it. Since the GPIO
category is a function property, it only makes sense to put it in the
structure defining the function.

Bartosz

