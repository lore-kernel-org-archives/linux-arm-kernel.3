Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AED3CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrVg/J5EzMKPSWWh0QN6HjWznUfKRbFhONdZmAyyMV8=; b=M/+xQmj6xiCP3aVVj3HQ6vYDU5
	CueZlNGDZSWK3mEQmwxMpI00WWUGKNeomJSlKiWyNAfneN6kDYKiiXhEtA01lShSHZmiAyrlE4GFw
	PqurQwzW3hHA9VSdMSdhU2up/PWt7AhoUMd4cUssUyoRP3utR9x3yER5i1WDtpF4sQEEotTbkKIZJ
	bnr5WWDPL0XG+t1ZtNZFuOgelZt/A+W2heeHwkmRnGMxYMYHGL0uWhiSCcsbYNC/NLjiL1yIabmia
	N2MDobXtzSJ8w/dhKI6w3h5C9X4vg3SGJicEs+Awe+AFJWfkmveOKADT5yEEMESFpuk7eP/nM0290
	v4vp1y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRYV-0000000EVTC-25Vo;
	Mon, 27 Oct 2025 18:02:55 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRYT-0000000EVSI-0ojP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:02:54 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3761e5287c9so59210551fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761588171; x=1762192971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrVg/J5EzMKPSWWh0QN6HjWznUfKRbFhONdZmAyyMV8=;
        b=FHPDqfC802+MA0XgrrvmwWpl7R9417Al/i2Jt+mhdjdmQ827iaD5zyhoYOUWzmrr3C
         Vbo0zEkVDLpjBQSPax2U9aFUd+OSJMfIpCxaAWmGqE0LRXJ3woGawdCcuMG2Nvn0Qn8r
         ZfrFPW3jRBf1xiAtqir/sOxS+IX3sQTEv1Uo0bdjGYslsdt07/KcRfvkpf9Ks6Fpb/4y
         uzvAZun1c2uhnNVO8h4XEgvneR3+Dyl99JMIbU9WO6Gc1RLtfgrm7seSm5jTGqMaUf8W
         eMxh8UifFfyn2qPseCmPsA1S1wC3O7mi6jWiZJlXJclfWrzavSuUr6al5AXKJER39vDo
         PkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588171; x=1762192971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrVg/J5EzMKPSWWh0QN6HjWznUfKRbFhONdZmAyyMV8=;
        b=KeepySq0Q/ItlQQ+uopzP82XJJ+7IDB2ABAKg3kZ+5HZvEvOKQhazoMvIlQa44YKvR
         l4eg4ycP+3RE0ct/mlPUmV+79gdm174JRd9mYYA5ihE4+6qYqkCCXfSYjXb4OmxQicWj
         ieZLGLD6l7Ewff83qLeRMpi50pEFvtg8LuhIUUfchIejCRzBl4QnfoCpn0cRaaazKwXF
         ypPMNzxQCSuZcHWMj5s3pjQ15AcoOp0gRUdc5MqXCXDJL1pTEDnJThvCA/pbyGN870ek
         jeTArcMGHUpU5tKdte4pro3fHWODZkzUS5WjakNIGbxFB3fZh1xQbSP7lt9oAI56SEUT
         IuWw==
X-Forwarded-Encrypted: i=1; AJvYcCUI25D+GLxU4MDm1+jL/nDs3lVsQejw2sjGUFdX9wW398T5p/hdLvsCd4rGZ5wTYhqzNMBVCBU5ScXjGn33f8qd@lists.infradead.org
X-Gm-Message-State: AOJu0YxxvgMcb6Dkj+EMfMKFS5j9iBvLrJVblOyFg5ZqIjaG1dbPmc4Z
	qPJY0E5+1vvJPNUH7HKeRItzTT25U+jzgCHbM2QiRiUj4frAZOCuw25kCjc1G6mjWLia6QXeVLu
	UDc7yYqGsuZJeOV7TUBiCPcM9SFsEUHKZ12V7zicydg==
X-Gm-Gg: ASbGncunvgD6+hj9FgPZm1oW1bfx1BGmwiCT6VRcug8Z3/nzXZxS1VRoJurTQxdqsno
	FyG/3dbuT8luf04HF2ZSXZeM5NHYRKV6U8gPJSeHxW87KlOMkL+i4mkT2SU2bjuCKPeIxTShtJL
	whjZtr2fwwXheXJYtfRP36l7TecpOyPORQnhfdfsYOAxC4aROzrNzSRgToB3QlP9IkpR9CFohbw
	TO6VbdBFYgwOZxmtK7FA6w9/IHKWF50vdBJuE7lxTa3ZyjIokOU751xSgYL0g53lqZYWW/lNmRh
	injqb0Wfkb8nUNiVkXwb6IfTJyA=
X-Google-Smtp-Source: AGHT+IGeODzsqrNJ7WuEiKEpxQ5OBP/KG1OFWpLiokHxsv2XfWfnBCCdrZ+rxY66M0Jj9bx+MfrB+UPW9NfpXb19HIk=
X-Received: by 2002:a05:651c:882:b0:36b:a355:3cb8 with SMTP id
 38308e7fff4ca-3790768d47bmr2162091fa.6.1761588170689; Mon, 27 Oct 2025
 11:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org> <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
 <CAMRc=Mc165HSLdug1F+t3qcOoE52mR1e_zEh=rSTUKN_-dB5NA@mail.gmail.com> <aPsmMruDxOil_wYQ@smile.fi.intel.com>
In-Reply-To: <aPsmMruDxOil_wYQ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 19:02:38 +0100
X-Gm-Features: AWmQ_bleXE1kwyQiCrUiv6lt2gYC06TJbSUdkSnPixltI9qUPpS9huAScAVx_CA
Message-ID: <CAMRc=MfG9fOFQT2L0B5gSGvgvzFTKOVKW4zXLYZ6tmVocZJwjg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_110253_361961_D7C5F995 
X-CRM114-Status: GOOD (  30.94  )
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

On Fri, Oct 24, 2025 at 9:09=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Oct 23, 2025 at 08:55:27PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 22, 2025 at 7:34=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 22, 2025 at 03:10:42PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +             if (!strends(prop->name, "-gpios") &&
> > > > +                 !strends(prop->name, "-gpio") &&
> > >
> > > > +                 strcmp(prop->name, "gpios") !=3D 0 &&
> > > > +                 strcmp(prop->name, "gpio") !=3D 0)
> > >
> > > We have gpio_suffixes for a reason (also refer to for_each_gpio_prope=
rty_name()
> > > implementation, and yes I understand the difference, this is just a r=
eference
> > > for an example of use of the existing list of suffixes).
> >
> > And how would you use them here - when you also need the hyphen -
> > without multiple dynamic allocations instead of static strings?
>
> Something like
>
>         char suffix[6];

Well that is quite fragile, isn't it? Not only does it require 7
characters but if we ever add a "-gpios+1" suffix, it will not work
correctly. At some point you just have to open-code these things for
better readability. I doubt you save any code with this.

>         bool found =3D false;
>
>         for_each_gpio_property_name(suffix, "")
>                 found =3D found || strends();
>         for_each_gpio_property_name(suffix, NULL)
>                 found =3D found || (strcmp() =3D=3D 0);
>         if (!found)
>                 continue;
>
> Of course with more thinking this may be optimized to avoid snprintf()
> (probably with a new helper macro or so).
>
> But see my next reply, I found something more interesting.
>

I must be missing it. I don't know what you're referring to.

> ...
>
> > > > +     /* No need to dev->release() anything. */
> > >
> > > And is it okay?
> > >
> > > See drivers/base/core.c:2567
> > >
> > > WARN(1, KERN_ERR "Device '%s' does not have a release() function, it =
is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
> >
> > Huh... you're not wrong but I haven't seen this warning. Do people
> > just use empty functions in this case?
>
> I dunno. Maybe something applies a default release in you case? Can you
> investigate that?
>

Ah, this only happens when the release is triggered, not at
registration. If I force a release, I see it alright.

Bart

