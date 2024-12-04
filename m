Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E65E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/icQyzmGHz1TzMA4Cqp5hMi0/miDynHZBXtehJraUg=; b=eKG1G4AabhR1yEK22E+KFnYV2h
	23MJ0qpXePz+hejLr8jpGRq2l87yG5SexoWL/d3ylPFE55ZM1LGXhXjUTH4GSi46z+7H4U7jmhu4l
	RA36fx5nS+H0/DLQhpIcCDFONHb8LCsOklOlbhlLje5+vO6FLhCP2l6QU2UvHMrYSK0awZ4DCn4CL
	bHxfmBzHT92DRL/wAxezUPEFw/QgTZu3CgfSaMOIa6sZhN1xUlYmm/gOhunKlaw7OiFyFp/oRuG0U
	36lk+5p6VtHIh+YR7FQRdBQU9DAg19T07hCNwLMziZM2udz5yD8/vkSbFiyCy/XjkL9kyo5nG0tH8
	LB0S2t+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk4k-0000000BlLL-1PUO;
	Wed, 04 Dec 2024 07:45:34 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk3i-0000000Bkpu-466F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:44:32 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85bb64447b6so989451241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 23:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733298269; x=1733903069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/icQyzmGHz1TzMA4Cqp5hMi0/miDynHZBXtehJraUg=;
        b=CcqiiE7ZHX++ig/DmFzNehSFSbKDgXZjuqQkklVLaSR43HvZeSvXQhyEebdbSsYIOV
         wjLAYgK2dM2zXDGCJtw+XgR6dEeQjpPKx6JUabAXSQRLCYcGUz6kHSsLOZlQu2TANuFR
         FrerAQeFpBRIgl7YwxAApxwcRB2gnr1cIVuZuYxWUQTaAP8qxpqT2EI+ntRUoQQFSAKZ
         5PtVdC90G7MCVl7OQ3Y/gKkQiFTr7ogsLeDvSNOR/d5jQj0dHNRSuHnEg4aQQdQs54BG
         Nk6lnXnfDt7Nyc8ym7Aak9s9wHq4KsCsRCTmWiwE44e8Sfd9yDTMq8RVKpN0OJRP8ES5
         p66Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/b1HTcXCS19BGkCgx9MfVvzR4jwDOE8JFCKFExTsAJKtmLB58g1i2asQBFFEEjw7kDTGWK0hsLimZIPYOlwe4@lists.infradead.org
X-Gm-Message-State: AOJu0YxPMJQORen269PwKtNBxTs8Ehr4jrL2uGMpdym+5M2lDxWjM21e
	/aIWSpmLPsG4MJMXdLY+z488sWXCrVKmzjGu71tH/SWHfy1njqj4N+XMhMyb
X-Gm-Gg: ASbGncsfyTP1jueqrqZTBTMaDh/hB0UgRvsu1USezrtF/WdLWvk+BvJ9vzaa+I8qRIR
	L+p84u4fSgmBzHD/xqPkVTHlmXc1+R8+lA4fvjUcZ6lT11Nvc5auAjY8CNBQl4tA1oSfkovfZal
	W0eRNziYSfy9jvkWq3BnR0iqTDw9nUeUErJvO0lwdU90v2uOe24lZxnGqx7sLqJ5LTzFOuKiOzL
	DB9Zor9y1myWr+frOcF6xkHtFr2SmSlwwOi8qN3v+ldkTqsKaxR6YXPL1wqeNrRNBx9WORYCLcp
	5NpZtg56IY4J
X-Google-Smtp-Source: AGHT+IFcj2YTjRFOPHTBr6alWl6SdwGsmpk79wNFBxkDmC7uJohIiHur10g+chup15S82bxsbSDacQ==
X-Received: by 2002:a05:6102:5129:b0:4af:4beb:f4e5 with SMTP id ada2fe7eead31-4af971b4d1fmr6452777137.5.1733298269470;
        Tue, 03 Dec 2024 23:44:29 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afaac2f689sm164067137.24.2024.12.03.23.44.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:44:27 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso1060315241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 23:44:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg3wXjMt5Hs+9APWRwFLI2jNfjN5GeKM/Ka6rvObK3EXUeKgIMD3GTJVi5yYlRWCRoJcH0sce+9wpfWz3qCuws@lists.infradead.org
X-Received: by 2002:a05:6102:41aa:b0:4af:48a6:79c4 with SMTP id
 ada2fe7eead31-4af972eaa24mr7774024137.17.1733298266923; Tue, 03 Dec 2024
 23:44:26 -0800 (PST)
MIME-Version: 1.0
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch> <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
 <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
In-Reply-To: <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 08:44:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaPkpSzrkqPRzZZfj6Npmj-8Ax5dXEGbjKXAyCW_DLXA@mail.gmail.com>
Message-ID: <CAMuHMdUaPkpSzrkqPRzZZfj6Npmj-8Ax5dXEGbjKXAyCW_DLXA@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_234431_012178_C7EC241F 
X-CRM114-Status: GOOD (  25.70  )
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

Hi Andrew,

On Tue, Dec 3, 2024 at 9:59=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Dec 03, 2024 at 09:29:02PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 3, 2024 at 9:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > > > Merely enabling compile-testing should not enable additional
> > > > functionality.
> > >
> > > Sorry for being dumb, but i don't actually see what is wrong here.
> > >
> > > There are 4 GPIO drivers which have
> > >
> > >         def_bool y

None of these depend on || COMPILE_TEST.

> > > COMPILE_TEST is about building as much as possible, in order to find
> > > build bugs. So i don't get what you mean by additional
> > > functionality. No additional functionality within the MVEBU driver
> > > gets enabled by COMPILE_TEST.
> >
> > No, Geert is right. I have been yelled at by Linus Torvalds already
> > for too eagerly enabling too many options. COMPILE_TEST is really
> > about making it possible to build more things with make allmodconfig,
> > not necessarily defaulting to y for everything.
>
> So are you saying COMPILE_TEST should allow something to be enabled,
> but should not actually enable it?

It is meant for relaxing dependencies, i.e. to allow you to do
build-testing of drivers that cannot possibly work on the system you
are compiling a kernel for.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

