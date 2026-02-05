Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0916BE91297
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmdqrkHRX2P+TGmxeTfsDPvENFvq2PUQGGfPG+/487Q=; b=pf4E021WwF4JCPot+YK0ReqINN
	omwL1sc7NNpRuNJ5KPQdMEd4f/tyBdBurREWG9ev5A35jNxKrujKmZRNU9iz2IsO46eOfcUa7yTe7
	RqnD6rFrRCLzhBUO4oR7NvxAh9EBcthFyySiQMwDi7oV0RFcc3zhR8Cv3NByGicySjQIliCE7tyIW
	DTSSr+ZV7WX8HNInSzYJnId9w1HYTpmTDcx2v9wCohKAKxKzjEglRUdf80ORuX7aC9oEQMCDuRlrh
	guALIgnQGhdxtd3JmRHiWILB1ID6sO7Twd0+qDfUVZgGoQx33L8QvyjCCim+qeVeamEmou6CYz1Bw
	gHC6lvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvPt-00000009g4U-3oBr;
	Thu, 05 Feb 2026 09:12:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvPq-00000009g2w-466U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 09:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 014FA4450B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Feb 2026 09:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEFEC2BC86
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Feb 2026 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770282765;
	bh=0VYoSDstxiT7/zIXTYviYDaUyON+OJnVTGDLwtgMuK8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hAh2EVYewNSM7losKcE/8wHBl8u2rt7OWGdyrHMZY5eZDU3zmB+tYm7ecKvtmsUHG
	 kuvXJ8+h2CTghbSoLOyLUY7uLgyXp34RHC2gWU0NG8E48v0RgHeH6xdOnfvSOYa5rx
	 bn+Ta95pBvQpsGq1em9Qzo+YdBhZO8ZB1f053FwPTEK4hxPxhl3b+3jzuoLsp9yjF4
	 hYXpC4u5onXeSQehHfZUFJP4re1/F1bQnJ4MQBMOzB7lQxNXKOHlEZFgq9XEfArgGj
	 ChYFaijlcXp7bEUnORSJpRKo4XGbah3JQxejZC4nHxyRTv6h6ptfjuLpQ8O5xyCkYy
	 k47jBOHjuGaPQ==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649b1ca87ddso833713d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 01:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPxTdYN4lvi/HkTkfUSiahfKkQUPkE0//exzDxXeYj/eClqWKg3p2c9Njo8zDK6ykdBHp5a4iO9w/FwmBvpkNH@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGPMm+hD5CVjG9vCqeMm4e8JkEczrOSKhuV/6uxD93Jb2wPfK
	5szDxdN7KlpwshZYbnUdoWEBz2YVu/GS3LlQqvU9p7IDzMV5JKdE5J0Unbi4ON3h+K4BgCf5sJx
	Zf/IK8gUjtwZfFyIA6EILFh5uusfMiYw=
X-Received: by 2002:a05:690e:2108:b0:649:c36a:a9d5 with SMTP id
 956f58d0204a3-649db341589mr3488280d50.32.1770282765028; Thu, 05 Feb 2026
 01:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com> <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
In-Reply-To: <20260204134020.00002393@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Feb 2026 10:12:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
X-Gm-Features: AZwV_Qjg88fpqtNW8DkpBzZtACEt1hAPLR3BpHGpNsKsu27kCes581pWrn13njI
Message-ID: <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Yushan Wang <wangyushan12@huawei.com>, alexandre.belloni@bootlin.com, arnd@arndb.de, 
	fustini@kernel.org, krzk@kernel.org, linus.walleij@linaro.org, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, 
	xuwei5@hisilicon.com, linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_011247_078214_6999A714 
X-CRM114-Status: GOOD (  37.45  )
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

Hi Jonathan,

thanks for stepping in, I'm trying to be healthy sceptical here...

What you and others need to do is to tell me if I'm being too
critical. But right now it feels like I need some more senior
MM developers to tell me to be a good boy and let this
hack patch slip before I shut up ;)

On Wed, Feb 4, 2026 at 2:40=E2=80=AFPM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:

> > The MM subsytem knows which memory is most cache hot.
> > Especially when you use DAMON DAMOS, which has the sole
> > purpose of executing actions like that. Here is a good YouTube.
> > https://www.youtube.com/watch?v=3DxKJO4kLTHOI
>
> This typically isn't about cache hot.  It it were, the data would
> be in the cache without this. It's about ensuring something that would
> otherwise unlikely to be there is in the cache.

OK I get it.

> Normally that's a latency critical region.  In general the kernel
> has no chance of figuring out what those are ahead of time, only
> userspace can know (based on profiling etc) that is per workload.
(...)
> The only thing we could do if this was in kernel would be to
> have userspace pass some hints and then let the kernel actually
> kick off the process.
(...)
> and you absolutely need userspace to be able to tell if it
> got what it asked for or not.
(...)
> Its an extreme form of profile guided optimization (and not
> currently automatic I think?). If we are putting code in this
> locked region, the program has been carefully recompiled / linked
> to group the critical parts so that we can use the minimum number
> of these locked regions. Data is a little simpler.

OK so the argument is "only userspace knows what cache lines
are performance critical, and therefore this info must be passed
from userspace". Do I understand correctly?

What I'm worried about here is that "an extreme form of profile
guided optimization" is a bit handwavy. I would accept if it is
based on simulation or simply human know-how, such as
if a developer puts signal-processing algorithm kernels
there because they know it is going to be the hard kernel
of the process.

But does the developer know if that hard kernel is importantest
taken into account all other processes running on the system,
and what happens if several processes say they have
such hard kernels? Who will arbitrate? That is usually the
kernels job.

> I haven't yet come up with any plausible scheme by which the MM
> subsystem could do this.

I find it kind of worrying if userspace knows which lines are most
performance-critical but the kernel MM subsystem does not.

That strongly inidicates that if only userspace knows that, then
madvise() is the way to go. The MM might need and use this
information for other reasons than just locking down lines in
the L3 cache.

In my mind:

Userspace madvise -> Linux MM -> arch cache-line lockdown

So the MM needs to take the decision that this indication from
userspace is something that should result in asking the arch
to lock down these cache lines, as well as re-evaluate it if
new processes start sending the same madise() calls and we
run out in lock-downable cache lines.

L3 lock-downs is a finite resource after all, and it needs to be
arbitrated. Just OTOMH, maybe if several processes ask for this
simultaneously and we run out of lockdownable cache lines,
who wins? First come first served? The process with the highest
nice value or realtime priority? Etc.

I.e. the kernel MM needs to arbitrate any cache lockdown.

Bypassing the whole MM like this patch does is a hack designed
for one single process that the user "knows" is "importantest"
and will be the only process asking for cache lines to be locked
down.

And this isn't abstract and it does not scale. We can't do that.

That's the kind of resource management we expect from the
kernel.

MM might want to use that information for other things.

> I think what we need here Yushan, is more detail on end to end
> use cases for this.  Some examples etc as clearer motivation.

I agree.

Yours,
Linus Walleij

