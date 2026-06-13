Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24991CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=; b=mn7eaH7iY3PqF0
	4WEKOe/ed+gcru3v1POTmm3qYC8Lf/UBsKJPZ+ybyreJeE2wHMeT6PQr40lfw9u0WntYOzP9N917H
	MB1ZfgtKQR0f+SQUECy3KyE69H21/LsEeX9mqFymqClh1d6usJrVFXC0+wVJ4lRHN+UyrK7lVOOnw
	ODJ1ca6qkbFDSTrlbGTwLzuf8F9oUMUhLTVYXYQKUHmZCdnZVFYyLCI/2yavh62P7I1SSRl5u7jSu
	jZtni7xZm3JBGzVvS4EzsBvdFUC4bpxyaDJJAm7zq29jDAAWr7cvjXHIjEWES9GGktYJfSkLfiF7z
	byC2oa7f1MylpIsa8Kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPRE-0000000CMGv-0Ruh;
	Sat, 13 Jun 2026 14:34:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPRC-0000000CMGp-1Abx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 14:34:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E09643FF5
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BA91F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781361257;
	bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SBHqpKC7BREORrxBTVx7sACccSGVw8i23QX7+RIK5eckd2TmCZktg+BuSCQ9ZJ3yJ
	 Kue7h6YyzWJ6cBULg+8t0egR8uzypz9mbNx5wzL4NFxcbQ8UVzR/0I3il5ZaLbmAgA
	 6XI+B9N7r6a/A7QQlC/qWONiroFFhzFCSsIQAAJdjirZrH2xEDS3kjMXfmnYg1liH5
	 WiQuomqBJ91IEiWZgyk7qRvIWJFqHdY7UpLHDvFAt7AjIty+cv7LjeO+94kXT0JuyM
	 nlGvFoZeBf2873j+tyl+fdW1buWoPl5nc6cNVqXfr8kp/8pTAbGJRyfaYH2DP1VGd5
	 pql7mT6lEAkeg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so1702023e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 07:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++endiSEGlQzTAOHPHh6oWcjOVyKUVfGnhPG8+G7XMni5vrt94KQRwyT+4WaBKTdA0KuSiyIgwSxZlqHFWWMBv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Jj0OY5dHdPCuOhlzpul6KNDhi7Z7ZVAm9/7fvmP88R1FDGM2
	r9FUCezU7bcXQREXhtIvc3OyBD5T7t0voRycEztLc3jdD3qWvO7xoXSzCAk/RSZht+SRFLkb5dL
	jpRvG8QSbSZ8PfUJ5pkth0LDz6I/ljkE=
X-Received: by 2002:a05:6512:1596:b0:5aa:6842:7a6a with SMTP id
 2adb3069b0e04-5ad30d703e4mr921898e87.0.1781361255568; Sat, 13 Jun 2026
 07:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 13 Jun 2026 23:34:00 +0900
X-Gmail-Original-Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
X-Gm-Features: AVVi8CdvXAQ1C_gR9wE2a9xH-URFH8zH5uSNUhPubBOtyL4bNWe140GF1Ea1p7c
Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skra=
bec@gmail.com> wrote:
> > >
> > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > > The Allwinner H616 SoC has a video engine hardware block like the o=
ne
> > > > found on previous generations such as the H6. In addition to the
> > > > currently supported features of the H6, it is also supposed to incl=
ude
> > >
> > > Remove "supposed".
> >
> > I can't actually verify that, so "supposed" is accurate from my point o=
f
> > view.
>
> Isn't info from manual good enough?

The manual says the SoC supports it. Same was said for the H6. Then
we discovered that the VP9 decoder was a separate Hantro block.

So again, *I* cannot claim in the commit message that the hardware
block supports VP9 decoding, because I have not verified it.

> In the interest of unblocking this, I would be fine with "supposed" too,
> but manual and all my experiments show VP9 is supported.

Please give an ack or reviewed-by with a comment at the end stating
VP9 verified.


Thanks
ChenYu


> Best regards,
> Jernej
>
> >
> > ChenYu
> >
> > > > a VP9 decoder. However software support for this is currently missi=
ng
> > > > and still needs to be reverse engineered from the vendor BSP.
> > > >
> > > > Add the compatible for the H616 variant, using the H6 variant data.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > >
> > > With that:
> > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Best regards,
> > > Jernej
> > >
> > >
> >
>
>
>
>
>

