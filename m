Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201F5CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=; b=luk8EHvmzdjzN8aN6GTib5cA4j
	tRspYGk6YPJkbEVzmV+yL0yuotCtcV6ZoT/0f/2amGkyApAt3t1czd1UlXqrL0zLcHzOc2uBNP2RJ
	JFDf75RZ0APmnRJ4wr7FL/8rL+EXzHs6BEEjmbq0R6UKaqgQZ7+OcRqjJ4dOIDB9jMBRiq+9RdL15
	AV21yH6wzIMvrbq+WTI4KmlO3wt+J45oPuufYopnSutG8pdosRBsM/9MS21p8Aa+JHhyoK3yo2bwk
	BCAOM1YPNuSDKdAUfAx8/P6Xj1g3rY53giZIIj/uUwuN23D9PZdk9qRjTR9Ya0UQSWtZsHwsaqxsL
	AOh0hNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5Sx-00000001C5H-1foK;
	Wed, 29 Oct 2025 12:39:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5Su-00000001C3S-1DB0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:39:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-592fdbeb7b2so7557148e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741586; x=1762346386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=;
        b=kCtBgf/7yUUwG7v2AXDs8HPSbC7I5m5wpqax8qEvwT7iiH5ZZ3CGTHNUStJMDlJbTV
         rr3JNMbOwcm0yhd8hZ090Yn4WNmwEplk+WF3A5OwchGryOcW6Y5s9AGQUzh0lMcHuPaA
         uBr+tGH29QLtNS+d+Fha8Lu/NUeADSkzvXPKTuScGhVlleVmg+0RbYY09zggsDmcfmIr
         YScWfyBCXHcg0skXB+Qb0puiVFp4XSG13rxF1bynXPmaL/3M8+v7HobEGKU49z8vtt1h
         DdcSLz0AaTLX0gdbY/fuQS27Cy0hbKl8KqITteZtx6PhGHfn5tQC7Zc8uFmiRdiazDeq
         xtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741586; x=1762346386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vepLqSyPiapW1CscUULDIr1ukJTRIyuoFYsiHMuP74c=;
        b=RyYHGJkccebBmWqTfD4GUXuafAkIMuwXs+xP7L3nEplnJ5VxDiYaCw1MKdCBJ8hUQk
         Ps2XII16AjCqdjXI5EfSsqkRlI/MHsjzCUlwX6+23yMlIezg+CAq0kMmOnyjP97rcSMo
         i2hZZlgjpiTzlvpihQlVkUjsBJXH4Yy5yu6iS+kmPKgwwarbhhO2Ka0g9F5A55j0u/ZB
         VPqQdAgvn0mqcd5wtEh6iWtGULiTTK+n/WW0CPiP293JkznwynAOoq2pxGDwa/JKVXKo
         s4Wiad2PZPOVdQcbtSefhu1DckZItK4waPbbqZZ6a8CznKRRpKivZhaqWZwBRoTXl8Am
         +0/A==
X-Forwarded-Encrypted: i=1; AJvYcCWyngqommJeDw/CXkq0IfVrINzTemUUGdv+eP15DRV0BU4T4UjeJBy4P1JYJRkn19bipKBhXOgSVmu+2z+OSlUK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy32NHQSqYvLl58QjBk+XZVegdMfvhraDzIya0KuQcclEM82FT/
	VjZ3ApLQ7A6if92GpjUQEqdxtYROvzDJRAGVZbzAV5F347VKUfSqtgbJm7HpfEXmZ77gQXmM4/B
	aokHDJOJ4wB6xnyuAdDF9WDg3/ro3n9w0NTiicC/oiA==
X-Gm-Gg: ASbGnctt2SZoxUVDgp/5dxj/ODSUtlVB5kli/EPqb4zjwWAgknXzElRZml57OUyHN3a
	l4sXx8rQsytDyxQskdaMYl31Y00mFlNbabjMJxJeO/riJiHIby/Vnqd60f0MTn/v1gNtAeezXL6
	MrpYBfTQDBTPDtl3bl/3fKiU3t99kxyJLsfaTys1/Mpz5hEDhhcq7MmsY3WWMhJX+OyibktN2CI
	JMoZQ/NhhT0tNAJhSMdWBLwNkfhAl47zyi/k4QeXu9w/zAGktQDQJOMW+TvITINMl2PNh2aKrxS
	x68qIxpvfKVsxqxdeOtnVMYH5ys=
X-Google-Smtp-Source: AGHT+IEhlmDPn2tgHOCgKXhItr9HaCh2am9KNpwJ0IjxOJ3YFVumxgTyoy/YlwjIRIN8akgjhohEFSM52fM0JyvB8BA=
X-Received: by 2002:a05:6512:1383:b0:592:f315:843 with SMTP id
 2adb3069b0e04-594128f53f0mr1119595e87.50.1761741585982; Wed, 29 Oct 2025
 05:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org> <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
In-Reply-To: <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:39:34 +0100
X-Gm-Features: AWmQ_bmg8NCddAGmpteBxJYDcYFplccsm6nERfQwYpmUT3SY-Zt_nlxAn9CZjjE
Message-ID: <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251029_053948_345075_40AA5299 
X-CRM114-Status: GOOD (  24.79  )
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

On Wed, Oct 29, 2025 at 12:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> >
> > This module scans the device tree (for now only OF nodes are supported
> > but care is taken to make other fwnode implementations easy to
> > integrate) and determines which GPIO lines are shared by multiple users=
.
> > It stores that information in memory. When the GPIO chip exposing share=
d
> > lines is registered, the shared GPIO descriptors it exposes are marked
> > as shared and virtual "proxy" devices that mediate access to the shared
> > lines are created. When a consumer of a shared GPIO looks it up, its
> > fwnode lookup is redirected to a just-in-time machine lookup that point=
s
> > to this proxy device.
> >
> > This code can be compiled out on platforms which don't use shared GPIOs=
.
>
> Besides strcmp_suffix() that already exists in OF core, there are also so=
me
> existing pieces that seems being repeated here (again). Can we reduce amo=
unt
> of duplication?
>

I'm afraid you need to be more specific here.

> ...
>
> > +#if IS_ENABLED(CONFIG_OF)
> > +static int gpio_shared_of_traverse(struct device_node *curr)
> > +{
>
> I believe parts of this code may be resided somewhere in drivers/of/prope=
rty.c
> or nearby as it has the similar parsing routines.
>

I don't think this is a good idea, I want to keep it within the
confines of drivers/gpio/ and the use-case is so specific, there's
really no point in putting parts of it under drivers/of/.

If I could only iterate over all properties of an fwnode, I'd have
skipped using OF-specific routines altogether.

Bart

