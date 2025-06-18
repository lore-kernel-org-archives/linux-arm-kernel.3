Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE5C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=; b=4j36AmhF6aVN8eYtz5h22okpu2
	U8maNIwyQ7GoUU7Kvl/foDnMmfl5/Wvn6Pq6mfxoMf3Ds8oZpQcMCQJLRupiIa7mc550WPLhTgrTV
	88xlcXjB8QLTm8pjGROCdNq0sWVWSJtvzfAGqgenuSUcLPkZosMBmriMjMAsza2W3GGaCc9ew3YZF
	HlBycrAMgC+CJDpwCn+3M6MuLFyY5uP433+vFyag8z1L4TZeYrszqmfDv9Iwn7zJM6wVSRaPuUvMG
	D8JhU2xor63cUxn9uPAvPnDZWucmBLBkTfhztemhYaQOLxLcnHNJHgcRVKe1IldiNBMDtVJ5Y6Sa8
	W0K1lkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzSf-0000000BKjE-44Nc;
	Wed, 18 Jun 2025 20:32:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzQR-0000000BKX3-0d28
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:30:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55350d0eedeso11652e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750278625; x=1750883425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=;
        b=EXn3b1fz6LYvS++xgpz1TuHRj50sXbvncDvPzfhQZzCt7oLCOZ3eUfvNvozanK3wb0
         FJrpBYwv0rI7nRTwpBRHMaom8Kus44/rHXmbVOTOXGcJZZ8N0g2LGMuNdEH2bTOuFLNN
         6LYOpJXZ+/t+ZYI8KbQDpqOk3wsOUlpdHc8SExNl2X+IA2FtCwssw05ReYQtrk09Tbh2
         wJJBr2iKsYoa2bFv4Tt2K3syBbxAamx4B+ZEPdZpoYseSajplOUewIGjIQOCoIvHOgZX
         ZKnIzh5Su3Qh6U1Pk+tIZo5zglUs4JTEp3Vsk1emz6XwTD+PnjP+dphLehahc/YIykXW
         CrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278625; x=1750883425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLdoNDkIQTY/DyyxkoUYCZc4oqwMzTKWqm89SruIgbw=;
        b=gvxcn1fzcIhbWJrJLHhO7CFV8DCa67HohgdViTylxrqpRvLOotDVSHM4PZx8BHXWeb
         KE6b32X8JibOjfTzH0nY2pMxaru97Jq3I9YzOLV4p1I5YLg82wU/1njG3P3XI+C6cMA0
         9pFLpG8Svs+CGByyOpKV7+pKd1Muv1n8hL/0fAV1Mia0OLHvSuaTjhL5KAkNTGvJYU6W
         RgBZpFS/+rsUZddzlhaSe1CcLRIYKrfftwFncwswsv23f2svuJ887nEX9gEWNU6ENl8e
         IBHAxiLYsodaCNQPrrz1Kx9LyiM0dm6AOpqV29q9bH7EMdwUaRPFqPjVvEVBiRbK5Jwf
         9jsw==
X-Forwarded-Encrypted: i=1; AJvYcCVkCEF+JIFUHhvEw6fK2YIdClrABwz/GRAgWrjPFRH0ji5PsyfGbu4aX3PoCgvOoLgHdE8PF4BUQ7bnHJH25ohy@lists.infradead.org
X-Gm-Message-State: AOJu0YzsA3o6BmIZ1pv0CXV4JmTHjF+ymn//2d+H6IYUW2cAA906kasq
	yFcBM27IqqHkWtsjaeXv6E2wrP9Dy+tEZzxTOQUAry8frubrJf8eklwq9jbw4/7TnMyOsbNNLqz
	0tEBj8yF8WBUPRaLnvit7S52NnobQ3czDre1/pvsJAw==
X-Gm-Gg: ASbGncuUCf0M7HrtiiuMdwKBwpMwD6yoYieiDkjfn+wcpMLldsO+cRWuZ8A5bGhmkCl
	UCZvadU9dRycQHaBkMISTbf70zOOVTEPqvXcOa2Rs3o9K1r0afCvqDZehpmflurfI3ZqE06HJVO
	FheXnzXmSAaIznpM8nW2b/vHux62xvfyrGLVhzRu36Vwz3Nu11NufWKZYG9k04c+ZA81EcqrXNp
	Q==
X-Google-Smtp-Source: AGHT+IE3ya3l3Vyjds/CNEC+pdJ7PNfRktSY/oaPcwaVLIYdAk74hU9wOWTfzaAg/Th6ffhCwtiYM7BcbzGbnbKmAts=
X-Received: by 2002:a05:6512:b97:b0:553:6570:1999 with SMTP id
 2adb3069b0e04-553b6e8c0c3mr4673762e87.13.1750278624608; Wed, 18 Jun 2025
 13:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250618124319.19220-1-kabel@kernel.org> <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
 <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv> <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
In-Reply-To: <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 22:30:13 +0200
X-Gm-Features: AX0GCFs9cmSUmY_Jmx7ICPLWGPbm8lRu4wSMy3Pp9EIGyzkUoqAYScI7QeCF-ak
Message-ID: <CAMRc=MdrpRQyQ84PRAi_6QsEDFcpNU9G140xiEAYHob12UbCfQ@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_133027_420546_00CC844A 
X-CRM114-Status: GOOD (  21.51  )
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

On Wed, Jun 18, 2025 at 8:54=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> On Wed, Jun 18, 2025 at 08:47:33PM +0200, Marek Beh=C3=BAn wrote:
> > On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Jun 18, 2025 at 2:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kerne=
l.org> wrote:
> > > >
> > > > struct gpio_chip now has callbacks for setting line values that ret=
urn
> > > > an integer, allowing to indicate failures. Convert the driver to us=
ing
> > > > them.
> > > >
> > > > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > > > ---
> > >
> > > What's going on with this patch? I sent it a few days ago, now you
> > > just resent it without changes. Who should pick it up?
> >
> > I didn't see any patch for this driver, only for gpio-moxtet (for which
> > I sent R-b). Did I overlook it?
>
> OMG I see it now. Sorry.
>
> There is one difference, though. Your change makes omnia_gpio_set() retur=
n
> -EINVAL on a GPIO that does not support output direction. I put -ENOTSUPP
> there, since -ENOTSUPP is also returned by direction_input() and
> direction_output() methods in this case.
>
> I don't know if -EINVAL or -ENOTSUPP is more consistent, though. Feel fre=
e
> to apply your version (you can also add my R-b tag).
>
> Marek

I don't care that much, I can take this one but please leave an
official Acked-by in that case.

Bart

