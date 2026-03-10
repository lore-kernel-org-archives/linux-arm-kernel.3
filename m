Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44B1FD2D62
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejvKQJ0BUEIYO8YyNFJZK6EePkf04xdfkGOlJrEYICI=; b=fJGzYNZYvz9r7a
	JmrRwSS8ASAZS/3kUV1dKTLl1Y7LJX0Nv3BW2O6RiSDvH4wr4cgmJlu8EAxljpMev2JK/OT1gnccr
	A48J9tYcETS8N8rf8o66GL1jl23oQIjL94JZ+bTGYO/ulPZDtzSoJWjZ47numf7TTUJqpeDDzfkHc
	urlH0xsqswUOpcm6qPEPJK1nO9o2mZEVtynez10lE1m/WYu9R7+T/KRK4G71nAF1q+xsXJjVpIngs
	0wiREVvyh4+rjE9Qdu1Ma1rZpA4o01iRSxwCtHqQHPzgsCtjnh2SOzBxh9+ILLa9D/I4rnyNLQGL+
	otDgY9k1vTuHJEeL4h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvoc-00000009RfF-2Nvl;
	Tue, 10 Mar 2026 12:03:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvoa-00000009Re5-26ng
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE2FC60138
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745F4C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773144235;
	bh=ejvKQJ0BUEIYO8YyNFJZK6EePkf04xdfkGOlJrEYICI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Pnn/vg+WltwVVTkjJiM19hHcrRXtoPtor7C23uNtus7c+cIENikuD5uQXzzOrKwAe
	 Mepx7a0s9FmnahpgfvnIi2YoN1TDpeNh9T1d8gWWRw03kRr5JaZxm57G4YENIPOQZe
	 5wx0XL96edi28WWewbAbGHF9U31NfzmSCzig+7x5ltEGOTy72udE8QNzEC+tJD9vqf
	 W6JSH/fT28hmdOn79e7H5T5W0oc0K+M1HZPLJW2oZES2Tbt94JkEPzdeEnQKc2cttc
	 o1ObXW9bSnBqUu2uFdmd3yTKy+7X1715NyfX1J7QV3sUSDnOn2tUCJe5wEl5KscpId
	 bK8J93Z5BEB1A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so55359761fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKOIoaHWx5ptOs2aA+LpRTB7doTBJYOikJ0ePzagwZmpK1QahY4dc8Vf1W5ZuXYBv8wYQKybpKyvzloZiOa7go@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPSm4Tgq4bVd4B/pQ8NgMLWpIEzLoKpRShGaM+OdgiF9xZ46I
	LBxcz8xT3xzX3wC7W9JZmxvai+EU0fUo8ERdYlDicAYLVbM+rglmCWWYepv59Ea86awILB1a+b5
	syc/vAix3sTnHVdFtw+nOr1FkRkkI9BA=
X-Received: by 2002:a2e:a546:0:b0:38a:5402:a9e9 with SMTP id
 38308e7fff4ca-38a5402af62mr27099711fa.5.1773144233600; Tue, 10 Mar 2026
 05:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org> <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
 <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq> <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
In-Reply-To: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 20:03:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v65QfrYuv3mLnHneiv7hJX00zXhrRQ5ffLv0qDYiSf0E5w@mail.gmail.com>
X-Gm-Features: AaiRm51dUfCJeT2mVGemMIzLa1HTaQCPrrr1QohizDFvRW1zlr0AxQq85bAXp8g
Message-ID: <CAGb2v65QfrYuv3mLnHneiv7hJX00zXhrRQ5ffLv0qDYiSf0E5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 7:46=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Sun, Mar 8, 2026 at 10:34=E2=80=AFAM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> > On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> > > On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.or=
g> wrote:
> > >
> > > > After commit 471e998c0e31 ("gpiolib: remove redundant callback chec=
k"),
> > > > a warning will be printed if the gpio driver does not implement thi=
s
> > > > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > > > sanitize the return value of gpio_chip::get_direction()"), but was
> > > > masked by the "redundant" check.
> > > >
> > > > The warning can be triggered by any action that calls the callback,
> > > > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> > > >
> > > > Implement it for the sunxi driver. This is simply a matter of readi=
ng
> > > > out the mux value from the registers, then checking if it is one of
> > > > the GPIO functions and which direction it is.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > >
> > > Pulled out v1 of my tree and put in this one instead!
> > >
> >
> > Please do not merge the correction yet. As I was pointed out by Jernej
> > Skrabec the solution is faulty and just cover the issue. I will provide
> > proper solution as soon as I find it.
>
> Too late, this is already upstream and I think that is how it was detecte=
d.
> Shall I queue a revert?

Michal sent a v2 fix [1]. It's more of a workaround though. See my reply [2=
].

[1] https://lore.kernel.org/linux-sunxi/20260308-rc2-boot-hang-v2-1-516fdb8=
20953@mmpsystems.pl/
[2] https://lore.kernel.org/linux-sunxi/CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw=
7F0xQ0bKbpUqch4w@mail.gmail.com/

