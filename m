Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47D6C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFnDdKu3Hxl7FTSkySekyyZQVF8xWD+m4hHcrRsAWRQ=; b=ZrPo8odKNopjiA13poKc/MZk2e
	6BvcwnXmHNPNGgGFX7YL99OEeqqrB0AMLQD6g7nPuGnm0ofYk1wf6qYZZx5ahoYemGjspJQN5qgG0
	Oq0X4mKABkED3xfGebOXt+V8caxAI+c4naDmBp47FbRhlOYLqvdU28lzPjko2DIpiZfFCmdcwyl90
	K7dRzApKmw3EEaBsA4fo6Y+QIsUtXZPYMHd95NrpX62aMYIKRnZ7wxqoszJ5XiDdaB48iprHzV9Du
	mfT+FI05YnSS6vkGcyzcjOcrDYvjGkVJpYuU1bgcv/Y+nx1qk7qwdg9fHlSf5v1YdkdWwCBEVIKsB
	3gQHO6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnASM-0000000Fi9y-2hKE;
	Fri, 24 Jul 2026 07:36:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnASK-0000000Fi9m-3soS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:36:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05A0260A5A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF47A1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878587;
	bh=eFnDdKu3Hxl7FTSkySekyyZQVF8xWD+m4hHcrRsAWRQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MLy06/I0fd8Uq55S3u0uGmXIyTABIzm9KivElpqsecq90DoPS/uGrgW/wgMMUKGa0
	 NUI9lKLp2yOC3a61ntTBsbFGIiXyj+dOWY0vewNZr2FO3VMeWJ+lhpJ8WIGWOfmF53
	 qN/Gkv29CIf3B5XvZYifZGSgfKNSSqNGF7JfrxLQbWBp4HYKyvHzV5Xofyza72pxrd
	 iH39CspY+C/5EM74xFsFleT9Xmp3ToX79d03DbO1pxV2sIkxB3a/bvQhkaTA5kqo3R
	 Hm1CmGQq8x4mio7bTIzIwMHpPlLx/V7zPio5tZBeGKd+IEJGwSPrkUIeVZX848FNY5
	 i/RxPFrLD+xRA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so983171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpfrkuyW7HzFfj+hBS/Gwf8YmvdIVwltpHGJF2BTN9cKK1batVqq8sqGUVKiPwLVnL0dSinbb6mRqz7FVHokZGK@lists.infradead.org
X-Gm-Message-State: AOJu0YxyKy9aSgMh7kkVaGo1GOz++zu/N/6v9+dala6RSvJ0OnJhCagh
	uGAkGC6hIvQL+shXaQ2RLgT9MD+IAaBOnRnvVVTaIDaIgEyh7GXQmgxdTZ3UtC7bllDhhcPJ39A
	ir+9tBWpguZDJsrD4cQVa5a4G02EcD0t5V3v8/w89Yw==
X-Received: by 2002:a05:651c:b1f:b0:39b:4371:dbeb with SMTP id
 38308e7fff4ca-39f07f1978cmr14723081fa.36.1784878586411; Fri, 24 Jul 2026
 00:36:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 00:36:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 00:36:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026072410-drained-acts-3502@gregkh>
MIME-Version: 1.0
References: <20260724050645.223799-1-ebiggers@kernel.org> <2026072410-drained-acts-3502@gregkh>
Date: Fri, 24 Jul 2026 00:36:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
X-Gm-Features: AUfX_my5XZyE7UqXKRq4QXkQ89HpYi6P6qHi08NgO2eVL5ur0W8C7gKD-xXnu0M
Message-ID: <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>
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

On Fri, 24 Jul 2026 07:28:53 +0200, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Thu, Jul 23, 2026 at 10:06:45PM -0700, Eric Biggers wrote:
>> This obsolete driver was already marked as BROKEN.  However, keeping
>> BROKEN code around in the tree is unnecessary and causes problems.  It's
>> much better to just remove it entirely.  Let's do that.
>>
>> Crypto acceleration remains well-supported on Qualcomm SoCs via the
>> Qualcomm Inline Crypto Engine and the ARMv8 Crypto Extensions, which are
>> what Linux actually uses in practice.  The obsolete QCE driver is a
>> dead-end approach.  It's extremely slow and just doesn't work well.
>>
>> While there's been discussion around using QCE for restricted media
>> content protection, that functionality has very little to do with the
>> current crypto API driver and belongs in a separate, clean proposal
>> (likely under a different subsystem/directory).
>>
>> The extensive reasons for marking this driver as BROKEN were already
>> documented in commit df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN").
>>
>> Since then, it's also been found that under realistic workloads, the
>> driver is not only ~48x slower than ARMv8 CE, but due to massive driver
>> overhead it actually consumes significantly *more* CPU cycles than doing
>> the hashing directly on the CPU -- with much of that time spent in
>> non-preemptible hardirq and softirq contexts
>> (https://lore.kernel.org/linux-crypto/20260724020608.GA51735@sol/).  The
>> proposed BAM locking fixes would only further degrade performance.
>>
>> Additional bugs have been found as well
>> (https://lore.kernel.org/linux-crypto/20260723205801.GD110634@quark/).
>> Pending fixes for some bugs don't change the big picture.  Nor have
>> security-related claims held up.  Of course, these issues are largely
>> moot anyway when this driver's functionality isn't being used in
>> practice, beyond the module loading due to it being in the kconfig.
>>
>> Note that this removal does *not* imply that various other drivers in
>> drivers/crypto/ don't have similar issues.  They do.  Rather, the
>> evidence is just exceptionally clear for this one, in part because
>> hardware availability has enabled independent testing.
>>
>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>

Greg,

I'm against removing this driver but I have a kernel driver policy question
before I start arguing the case: If I say that I do use this driver and that
I volunteer to maintain it and had already started sending out fixes, can
Eric still force its removal? Because in this case I can name a whole lot of
drivers that I deem useless that we still keep around.

The alg priority of this driver has been decreased below that of ARM CE and
since CRYPTO_ALG_KERN_DRIVER_ONLY it can no longer be used accidentally by
user-space either.

Even if in practice the driver is used for testing purposes - does this warrant
its removal?

Thanks,
Bartosz

