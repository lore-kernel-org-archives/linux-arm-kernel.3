Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC4DCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vg5ewRXhTTAj3dwOtg+KKWn0lOGtPCOEr24O5UKKpJQ=; b=hmSt6jmfcggiBg1O3B7HfNLaAO
	BMP6gtKtLKrd7U38m6/dMx4CuO7K8RQti536uYMx7KYW77IZYFiwoDJmUQ0Ix+i9yqmkZAvFDlqVF
	CTSvQYjSaKbH8nMUebYo6G/ipmwhZQiiqZ8KyDafbcknWnBibL/BxI0sS+UTrYycsQUxGQNnKqf1p
	r+JsZEPkBBNCeg0aLIDoaq53Jfk44Ba8oESj7vqBionY1OjNpbrLHl4p4kB0RmRhZPf9DU42wBXHP
	RVIvMlANs8Xl47kVqIs8GKQy3tO/iSguUWiUrrK7M8pGQDf6bevrC5Z5HEQIW2q4Fvna5Br37qjtZ
	1SIgTdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsf1-00000007NAS-0Mhq;
	Wed, 03 Sep 2025 18:56:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto70-00000006gca-0JMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C82B7447E1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95D0C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756908321;
	bh=eKNu0P169Q3NEmF9/2kn88R7etBh4b2ftcRq7KbNGzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GarjbhYPuBwzN4LKvw70mu25trun6v2gsNZoMS79qq5b6fFdnkIvAU84g+t/ZNTuA
	 qItjKLs65j8DmS5uRuHG/tkDx9bXVhY6n/sDUArtE3jYBFiDdbCBST3QfRGBlrIjZZ
	 0EOijnVmbkyGgntMKf9LztVwMTAF3BXSFTiQIhxDLLh5BAaXagqUwEBIB/EXoG4eUl
	 281whCCc5omD9u36zHFpRpeOaOwok4ld/LprRIQlPor080oofNvmT9lX50gaNYeXn4
	 27f6a9fUVkD0fJtu6rpxsExGEGI8IjbPgMEwoK885Yu8kqSJZ31Y78BR6mvEm74tEa
	 BkIhFCAL3LF5Q==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61cd3748c6dso13488738a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 07:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdWzkyFR2+oxtLjIYtZGm8whMYZ+vqeALThPcxfZhhs9z2q0sNM785mYSDuecaqhmNAtYptNsJ5uuljYC8Wg7P@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7NalDN6e2ZxIPlCeKRpM7qe6P8we4uIGg2j9p3eUEWe0Bj2B3
	dyouWM+gEVRYnZmaMT+YGhU6rsVQxCD/SYLbRpoRRLwvkPEDsYNqsbdBQUfWy+SGnGDbNfC2BQg
	muv5m1EPxn1qVb4BbBJLkZ+doUydGKQ==
X-Google-Smtp-Source: AGHT+IHhgqqdWQtLgJ3n4i+fkorAw1PLf/dG7GMkfPu1VyhaFYexbX0Opd6FI4UepF1zq8MJg0/D/0FlKAcuRTaWSho=
X-Received: by 2002:a05:6402:1ed6:b0:61e:9ebf:d340 with SMTP id
 4fb4d7f45d1cf-61e9ebfd58cmr10082183a12.32.1756908320220; Wed, 03 Sep 2025
 07:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250815230841.3487764-1-robh@kernel.org> <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
 <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
In-Reply-To: <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Sep 2025 09:05:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+TcACG=vGp__tT8RE6kOjchoUSq59i=H_+qSRn-ucMkw@mail.gmail.com>
X-Gm-Features: Ac12FXwkg-WgIKnHEs8UoaeM3TBl6YtocnO-RvpeXFYLKucgpiCnVNz9w-PqANM
Message-ID: <CAL_Jsq+TcACG=vGp__tT8RE6kOjchoUSq59i=H_+qSRn-ucMkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070522_156576_6E543174 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, Sep 3, 2025 at 1:52=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2025-09-03 at 15:01 +0930, Andrew Jeffery wrote:
> > Hi Rob,
> >
> > On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> > > The ASpeed DTS files have various I2C devices with missing or incorre=
ct
> > > vendor prefixes in their compatible strings. This hasn't really matte=
red
> > > and doesn't impact ABI compatibility as I2C devices get matched with =
their
> > > vendor prefix stripped.
> > >
> > > With this, the "maxim,max31790" nodes now validate and have some
> > > warnings. Remove the spurious "#address-cells" and "#size-cells"
> > > properties to fix the warnings.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../aspeed-bmc-arm-stardragon4800-rep2.dts    |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  |  8 ++-----
> > >  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 24 +++++------------=
--
> > >  .../aspeed/aspeed-bmc-facebook-tiogapass.dts  |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |  2 +-
> > >  .../dts/aspeed/aspeed-bmc-opp-palmetto.dts    |  2 +-
> > >  .../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |  4 ++--
> > >  7 files changed, 14 insertions(+), 30 deletions(-)
> > >
> >
> > I see you've applied this to your tree. Sorry for being slow on the up-
> > take, I've been focusing on other things recently. Happy to take it
> > though, if you're happy to drop it?
>
> Actually, do you mind dropping it from your tree? It conflicts with
> Krzysztof's patch that I'd already applied:
>
> https://lore.kernel.org/all/20250819131743.86905-2-krzysztof.kozlowski@li=
naro.org/
>
> I've applied your patch here with a note in the trailer:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=
=3Daspeed/dt&id=3D61a913644a8c5b6c8bd9da09f78f88e50edfaeb

I've dropped it. That was inadvertent.

Rob

