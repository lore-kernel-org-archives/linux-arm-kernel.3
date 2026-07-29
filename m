Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D1C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDhpdhv1V/2Mmx+BQS7lBsREzTSL9OED0Q1oe1sMhkQ=; b=ugF7Ne3cjwH/Ln2Se13dIbYSDu
	RQcsaMPlrjNZrI/879DM7HJ2tCMTbTx3pB/LRQQ3Q7fsqZzbGtPb64CKw+6t3aHnJa5Ev7a2Rkwpl
	sCG56CzGAXjwPbzA7KjxCHbG6vMRDoYbwvIBx4LAhhLxcXes4R8aTg49w5DKWxC7M9CmZo21qumUu
	dpS0J4XWsFLPVeOISnM9vupv8kYwouvNlO0t55jUwaRB4E27Ez84M+yCMMud+eaIVl5YnvktUwa38
	59gY1KGipxE3RMlxtO37nJN0Clt78LRiHW/elIvlVuKaWcIyXBA5KW4qPIEBvIdakMga65DoKqkuJ
	+q7Fo45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2zH-00000007oh2-1OBa;
	Wed, 29 Jul 2026 12:02:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2zF-00000007ogP-1MZm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:02:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6934A60A66
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB1E1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326532;
	bh=lDhpdhv1V/2Mmx+BQS7lBsREzTSL9OED0Q1oe1sMhkQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TfheBuyNx4ybA2qvyXwHgUsFRk7A/VQMSxA5wEpghnvZXwDmJ2LAOM3NBzQ7+iFHK
	 qtL4H8pmgrqUeGpUHofgDiEGVkQAILC8pZ02iANY+wB6jT9IQasH74oOJlHvDzigI1
	 YEQNEzCx3DQetMHY9oV2y//gVUHf8mlS6FsLfRF3SCScRVeYhCBnydxKHugQfitwbE
	 S7RPeaU5Swd18E05iWxI8ikqXGIBjhfAzJveUWRpNmf6zBPEyXtcfV0CVmUsIwC3Ql
	 1xsjGpYvbpsTTGmiEZCGOdl6oGFu+tIwAiW/oUw1SRQXw7Iak9xEZbPad+GpganjIi
	 ElixZJAkZQ0vA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c9107baa7so6490011fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:02:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRADkhcagUSdzP2HpN+wcagWs4V9DL8IVjEn7VxZ/kGnRrPZWTNLPMt2bRINsRQ4vHiXsyS4M2w9OupdBvZZdi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6n4eQr3OGnSlQVz/wjLCk1Xuev+uE2VlhVXGD6f+9qn5rk6H6
	55bxG9XoQqBalHpyepr4RMo/bU3aAUNGSBLc9AyE1rl1A2IOQmeKw0ol+fVseaoyfqnfpDbmSXR
	m+hYKFm2i5Kbwfjru+yLSYQD4Tr8mctU/6GSybQUrKg==
X-Received: by 2002:a2e:bc11:0:b0:39c:7059:10 with SMTP id 38308e7fff4ca-39f51eee674mr11861711fa.39.1785326530728;
 Wed, 29 Jul 2026 05:02:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 05:02:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 05:02:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260728152241.GA4281@quark>
MIME-Version: 1.0
References: <2026072410-drained-acts-3502@gregkh> <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh> <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol> <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol> <20260728152241.GA4281@quark>
Date: Wed, 29 Jul 2026 05:02:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mch_3fFqq+khutEMQG3P-ojBE2dnLy_U2_gDV4e1ro6aA@mail.gmail.com>
X-Gm-Features: AUfX_mynAmI1M4yUWJz7xnT60AuUua6HXQnjCMgvWNABYi_64AGSY4Ma6_uoTVQ
Message-ID: <CAMRc=Mch_3fFqq+khutEMQG3P-ojBE2dnLy_U2_gDV4e1ro6aA@mail.gmail.com>
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

On Tue, 28 Jul 2026 17:22:41 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
>> It is consuming a lot of the community's time to help maintain,
>> including dealing with LLM-found bugs, with no clear benefit to anyone.
>> Even considering *just today* we can see someone sent a bug fix:
>> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
>
> Another example:
> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
>
>> It definitely *was* causing problems before it was disabled via the
>> crypto priority system (which made it unused in the kernel) and dropped
>> it from AF_ALG (which removed most of the unprivileged attack surface).
>> When anyone accidentally used it, it caused at least a huge performance
>> problem, and sometimes other problems too like filesystem hangs.  It was
>> an issue for years.
>
> This actually seems to have been an overly-optimistic characterization!
> As per
> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> this driver drains the battery on every system with the module loaded,
> even when no crypto requests are actually sent to it.
>

Are you seriously complaining about people sending fixes to a driver we want
to see fixed? We don't remove maintained drivers, this has been the kernel
policy for years. Unfortunately if we want to fix it, then it'll take some
work involving sending patches to the mailing list.

I think it's time for Herbert to decide before I respin any of the series in
progress.

Thanks,
Bartosz

