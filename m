Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0318ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZU3znEXh/uLIUG/2fb75uXkzqbS+S44wZ9CridvcCc=; b=TMHPO+z2QHyB0LvBlSHgH9bNYN
	+NLLnZkIyzHa3UlRzcZupcC1v0S8p72IVsi2h2hyvUGliC5bcmGSAHq3iyqKeD2HbjfySs4J1a7xt
	haVIxFp6rhUF6soTJo9c7rVORFfY/H+uCI5xgdhRMIEnpQcgCpYrV8Y+vWm3xcTAFOc3dkq148o3l
	2uWL7i1hZ+Ohq0LwqNAjGzS7ywC6NDBq/JxXx3tqJMQpbWoZlwXuujWZY0GlX1qj6D9NQUACRoSTV
	7mw+ncV/9/AAgzVmCIH4wFWPTqF1OZLDVoh9jA+yEeVmhaSS5ckLP1KG9LEQvytT57yBooUDWSUJg
	O8pCBiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP7C-00000002Cpu-2B8q;
	Wed, 07 Oct 2026 10:43:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP7A-00000002Cpf-3cJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:43:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4678D43FEB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 10:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8991F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369792;
	bh=tZU3znEXh/uLIUG/2fb75uXkzqbS+S44wZ9CridvcCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CphSWWDnNBQIhr3M3z/LttDsZdUFcltjorC3JEUTtDfO6LOwOzNRmbeUhzcFjbJf4
	 xyAoSnALV5NWzV4Hw2/I/O5ogmBau2dKrIs31W3ryj90CkRTNBx8kLPsg+bX4uEsZ6
	 jAtZlsIZ4pkU3p7DVFENQOR44myUbzOsWlIUWzno6jHuuztkyLWemDj6PsFFuPJaxm
	 dAMsBHr6hSwEPkVoCqEUjvuo3TVhSLaCrnY+0DZnsJKEO6bmzq4ieQcZU+N3FU9Z/b
	 lit+Z0KGtjQQSfmk7oWJFMFwY0uRJU5vwWUjOfIIyQbUgLX/zm13hpa8Z/a9IL4xEf
	 y8yRjzkyB7Z9Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso1372973e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJm+mbZs6+laOTHmWlY55+vCDkONqQL1d/BeelS9MR/l1Ob4Ln0+y9ghdAMfo/BBfuRAvYQqynGXNdhliEQF85@lists.infradead.org
X-Gm-Message-State: AFq9FYKOowHSNoadUYRUQhOus+SFR1mWh2t56jvqZ+f7LnOkbzbSPAP3
	f/mnu7OX4ls67Nrci1SD8rjysaGDfS/Nkmns6LqswOjZaUIBNfFKML13/C4CB8qpTfIzVxdXHXl
	yQ6cJTThTCLtQepg5P6Hqk2vEthqkrxM=
X-Received: by 2002:a05:6512:1384:b0:5ba:4472:75d4 with SMTP id
 2adb3069b0e04-5bcd06c1b27mr555897e87.10.1791369790920; Wed, 07 Oct 2026
 03:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
 <20261004225724.0b821e9c@ryzen.lan>
In-Reply-To: <20261004225724.0b821e9c@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:42:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v9iiAndsPEmCn2QfrWJEEvGCwQQzMwY6QT6xR7Uh=MQ@mail.gmail.com>
X-Gm-Features: AclHuK-YxAeDefZ88KcDng2EEUMdgtWxZiqOozdJ8Jk_iHK1xMkQpwOglF-Fr6k
Message-ID: <CAD++jL=v9iiAndsPEmCn2QfrWJEEvGCwQQzMwY6QT6xR7Uh=MQ@mail.gmail.com>
Subject: Re: pinctrl: sunxi: a733: irq_banks too small for port K
To: Andre Przywara <andre.przywara@arm.com>
Cc: Norman Herms <dockseed@proton.me>, Pablo Mazzini <pmazzini@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Oct 4, 2026 at 11:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> Norman Herms <dockseed@proton.me> wrote:
>
> Hi Norman,
>
> > Andre, Linus,
> >
> > Observation on "pinctrl: sunxi: add support for the Allwinner A733"
> > (Andre's series [2], now in linusw/devel for 7.4):
> > the A733 pinctrl description sets .irq_banks =3D 10, but PA does not
> > exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
> > IRQ banks from PA, so PB is 1 and PK is 10. This is the same
> > numbering problem as in Pablo's thread [1].
> >
>
> So I blame AI, but that below is a lot of words for a simple problem:
> the number of IRQ banks should be 11, not 10. If we go with the dummy
> IRQ. There are no official DTs for the A733 yet, so we need to decide
> there, and I guess that depends on the outcome of the A523 problem.
> I will send a fix after -rc1, with one of the solutions - unless you
> beat me to it.

Sounds good to me, and yeah the AI just loves to talk, to the
point of making you not see the forest for all the trees. :/

Yours,
Linus Walleij

