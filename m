Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B2C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlNU1Or4l5o+0AThB881QO3Q6R/MIqKOg4LBnIwykJY=; b=FJhL244t5tVzFLf5Gl7ally0Ye
	nDgESDcX9TYw9Eo+Xr8OqoQknU84GLB/0/Wv7PMzCUtPFX0QAP+5mh8kHpaDQlt20JJn+fpNie+oN
	iOQv177jYh4BV21KBk06a8OQAk7BRMgFblw0KchsQb2FlbgN/BQlIFpg+iR3Y9aCGhR1oBn+Bb5Gy
	6EaTSEI8gZ1DgwxfotC1spQU5waql+lVAyAX5Ml6Ph6aO9MypAyXvYtpRfALBZ13/KrCGFIlwHLDM
	r77SkHzstWtgMCol6yjEDiAJfuY0ukixPqXX/GWb4TuVeYJ2iH5FQMBDSTh7NSiFJwxbeBOOla8M3
	Pe8m7H6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCDz-0000000Fxx1-0qQ9;
	Fri, 24 Jul 2026 09:29:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCDx-0000000Fxwr-21SX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:29:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D720543D4C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2A61F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885384;
	bh=XlNU1Or4l5o+0AThB881QO3Q6R/MIqKOg4LBnIwykJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=foILZPri5l4otgeJKEYXmq/gKGllx0r6qMcy7EaribQT8w8x4q8sPkPnKsDCzIMXV
	 K8NdFIQWR9fHwCgN9qz+NTadQ+KIL6vQViOGlGT4nNJOSVCt21oCFO2lEbv8HuoVq8
	 ck1l9Cp37i/Ec2XwUD0IazGGzM65xyyvNJf1EpOIrXzlL0iuXas8+/de+t+Wfmjigm
	 dJCjc6y3qxZ0GbXSWmV/yZaPMY5LSdWEIuKDQObqsa6kegbnKkOnMWh3TmfIhFwtub
	 yrJcVgBEf8WriD1anJ87cmihu7pKQl6hs59mM5UAbYLMImeQVXsxc0MV4uSmMB4GvW
	 j20MD9yIut/QA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so284365e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpVOyEAZuco7ZVkXiiwck/5EPWobH8V0Se0gpE+QMr1yHoBSCIxO62F7XICms2yCdt8F110WKM2S2deztNqPqyQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5B293icw7/QePfGUUNsUdmg1+X9Hv7+Nrf3nqtXb3BsKXHenr
	S1wHr6QZaGQ8z13EZCxH6KAohq8aRgFoYxFdrqZj8+tcBxPfWz2akv7s/FO2a8O/ztjKGspnT07
	TiTN9xQSeCFITdBE0zrEE8LQcVQ5CIHKzFPz8grZZ5g==
X-Received: by 2002:a05:6512:669c:20b0:5ae:b357:1d1a with SMTP id
 2adb3069b0e04-5b2b2e52e6amr870628e87.8.1784885383436; Fri, 24 Jul 2026
 02:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260724050645.223799-1-ebiggers@kernel.org> <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com> <2026072412-decrease-sandbag-70a1@gregkh>
In-Reply-To: <2026072412-decrease-sandbag-70a1@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Jul 2026 11:29:30 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
X-Gm-Features: AUfX_mwy71y0qLd88ygHtoEMp3d2oiZ2geN4DNt_v5rVUEAjVAH0o7dlfP4dPGc
Message-ID: <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>
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

On Fri, Jul 24, 2026 at 10:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 24, 2026 at 12:36:24AM -0700, Bartosz Golaszewski wrote:
> > I'm against removing this driver but I have a kernel driver policy ques=
tion
> > before I start arguing the case: If I say that I do use this driver and=
 that
> > I volunteer to maintain it and had already started sending out fixes, c=
an
> > Eric still force its removal? Because in this case I can name a whole l=
ot of
> > drivers that I deem useless that we still keep around.
>
> But you aren't using it if it is marked as BROKEN.  If that's not the
> case, and it is not broken, well why is it marked that way?
>

It was marked as BROKEN only a couple of days ago (it hasn't been
released as BROKEN in any upstream tag yet) despite my NAK, making
myself the maintainer for this driver and having sent the first set of
fixes addressing crypto self-tests failures. There's a bit more
context here. :)

> > The alg priority of this driver has been decreased below that of ARM CE=
 and
> > since CRYPTO_ALG_KERN_DRIVER_ONLY it can no longer be used accidentally=
 by
> > user-space either.
>
> If it can't be used, then again, who is using it?  We can't have ONLY
> out of tree users for code that is in the kernel.  We HAVE to have
> in-kernel users for it to stick around.
>

It can't be used *accidentally*. It can still be used by in-kernel
users if you bump its priority via netlink.

> > Even if in practice the driver is used for testing purposes - does this=
 warrant
> > its removal?
>
> testing purposes of what exactly if there is no in-kernel code that
> calls this thing?
>

Of several of the crypto accelerator IP's functionalities. But that's
just an example. We do use it - I was just asking if if we use a
kernel module to test HW functionality of an IP - is this enough of a
reason to keep its driver, not taking into account things like FIPS
140/3 certifications, etc.

Bartosz

