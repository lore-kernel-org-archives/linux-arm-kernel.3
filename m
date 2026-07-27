Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEED4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMzu0YZPeujF4hgLIyl5V7nNY+ZvYerUPeUqAqta3NU=; b=XKjuwL4i7b/Hiyo3iNKfZGSr9Z
	8/dKMm2GoLCvi3BFHZTyAM24QJpGO4qO5XaHv/bditioDxOGvSGcdz1lrbbdHhX5c6yXGv5yf8Atv
	Mfs2D8WtQEy1nx8+ehp1/ZNerJ01UyXKr6S42ayEx7hO0ArX22xc2eLvfZo4bSmsGiU0vdv7zFFUM
	pZSWdmkich9TLWdnzbziWWUw/8GWiswQgudrBexxHdeUfAYTrW3cbDfizj03xwPyz2WH0MRsuKl73
	MGzP+Ifw8qciTPQWso5hWZwUtqsZcxfGUMMv9eWkqPw9byo7ktcY3IYG6jHoUSHna2x7ppzJfFhvs
	44Q2Y9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLME-00000002r94-1oDN;
	Mon, 27 Jul 2026 13:27:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLMC-00000002r8Z-1mD6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D85F743AA7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC331F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158819;
	bh=hMzu0YZPeujF4hgLIyl5V7nNY+ZvYerUPeUqAqta3NU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Hs83fVEVIPs1CW/EchwUpduulAUtn2HGPJNdpZjXRJSEnx12nJFDxCJXvuNQZWBXJ
	 2EUu6zE6YrJjBad1Hin+D9U+QJdJ3vSAy4CfpvN11gjiRsDDbmfxdU3v2Nr1i5JyHK
	 dIx1LHTwS609tV6HrLS5iqdr+h+h5gAz/7+wNQ4/loc4DO2lTRymyQbyFV77WprgQC
	 JdorA7WSiBZKogRBIQ7nLoYirElu6PMJIUE4L2FinQSc8qVEA4TwoXuFIFAat5Rkhm
	 uk+30ex3VhiB04Q5E7G1wIRn/rLWTo1iTzh86VQaypMLatpA2TWduEqJFJo2rMx02S
	 eqRq/akHMXrqg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so2085968e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 06:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqL1zV8YR6ANuNkG4WK6rQ23W2cPwdOre1gMg8251BoZHFxBe6teG9Y3H4rSvBeIelrAGUjgyszP6mOoFgzdZpw@lists.infradead.org
X-Gm-Message-State: AOJu0YyPqzoi+gsI7K5+Ytgo3daha+ZGAHxWpSVb+4BStP3JSONRhhuA
	S6dgjV1aVsw81FC7YbkHJf19p1PsQRzJY7QftNvgnkWZXuDm2M/zK3ANiXuqja03oW4S287MSVh
	Rd1Ocp3YGma5oAIayFQXgDqD/OBm5dJIHByp6SH/3cQ==
X-Received: by 2002:a05:6512:10d5:b0:5ae:c063:6397 with SMTP id
 2adb3069b0e04-5b2c1b28bfemr1598059e87.15.1785158818476; Mon, 27 Jul 2026
 06:26:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 06:26:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 06:26:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724155144.GA2032@sol>
MIME-Version: 1.0
References: <20260724050645.223799-1-ebiggers@kernel.org> <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh> <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol> <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
Date: Mon, 27 Jul 2026 06:26:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me_uO0oMqjyuZzs7AxjWoSyy-=rT1eshmFQcNH_3H2ygw@mail.gmail.com>
X-Gm-Features: AUfX_mxSGJIwgP_5kRNku_9aMjFsY22xgajMAr4jyELVwyozqMhKzWVoej7PhOg
Message-ID: <CAMRc=Me_uO0oMqjyuZzs7AxjWoSyy-=rT1eshmFQcNH_3H2ygw@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Demi Marie Obenour <demiobenour@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 24 Jul 2026 17:51:44 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Fri, Jul 24, 2026 at 05:25:46PM +0200, Greg Kroah-Hartman wrote:
>> On Fri, Jul 24, 2026 at 08:09:32AM -0700, Eric Biggers wrote:
>> > On Fri, Jul 24, 2026 at 05:04:46PM +0200, Greg Kroah-Hartman wrote:
>> > > On Fri, Jul 24, 2026 at 02:47:48PM +0000, Bartosz Golaszewski wrote:
>> > > > On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
>> > > > >
>> > > > > And with the defaults QCE is *never* used.
>> > > > >
>> > > >
>> > > > It's almost EOD here and I'm going to disconnect for the weekend but I just
>> > > > wanted to say before I leave: this has never been a reason for an aggresive
>> > > > removal of any driver. We remove drivers when we stop supporting entire
>> > > > platforms, not mostly unused drivers on actively *supported* platforms where
>> > > > they can still be used for experimentation and testing. I'm fine with dropping
>> > > > this from arm64 defconfig but with fixes, the BROKEN tag should be removed
>> > > > and I definitely object to removing it from the tree. How many people still
>> > > > use greybus? Should we drop it from the kernel too? And I'm saying it as
>> > > > a project ARA alumni. :)
>> > >
>> > > I agree, if someone is willing to maintain it, and there are actual
>> > > in-kernel uses of it (meaning not just a stand-alone library that can
>> > > never be called either by userspace or hardware), it should stay.
>> >
>> > What would we be considering the in-kernel uses to be, then?  Just
>> > wiring it up to the framework is enough, regardless of actual use?
>>
>> I was meaning that we just don't want to have code lying around that is
>> impossible to use.
>>
>> I'll defer to the subsystem maintainer if they want to remove it or not
>> here, as that's their call, not mine.
>>
>> But really, if someone wants to maintain it, no matter how slow it might
>> be, I don't see the harm in keeping it if it's not causing any other
>> problems.
>
> It is consuming a lot of the community's time to help maintain,
> including dealing with LLM-found bugs, with no clear benefit to anyone.
> Even considering *just today* we can see someone sent a bug fix:
> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
>

I volunteered to provide that time. What's wrong with said bug-fix?

> It definitely *was* causing problems before it was disabled via the
> crypto priority system (which made it unused in the kernel) and dropped
> it from AF_ALG (which removed most of the unprivileged attack surface).
> When anyone accidentally used it, it caused at least a huge performance
> problem, and sometimes other problems too like filesystem hangs.  It was
> an issue for years.
>

Ok, feel free to remove it from arm64 defconfig, you can add:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> If the justification for keeping it is that it is disabled anyway, then
> I hope there's not going to be a contradictory push to enable it again.
>
> I don't think we should keep crypto drivers around just for
> "experimentation and testing".
>

This goes against the linux philosophy of encouraging the upstreaming of
drivers. This driver is a nice testing ground for the BAM pipe locking which
can't be easily tested on NAND but which will eventually become useful for it.

Is disabling it in defconfig an acceptable compromise?

Bartosz

