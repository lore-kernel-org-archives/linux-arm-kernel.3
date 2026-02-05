Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A677EC1EB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD1TBMKrq8YAWGjnNJDGA2DajyXk+TV14oyNk/DyLGk=; b=uUS9M66Lcaiev7Sxoz4pAYMlby
	AyNCkedxiT/kDJHQKifHYeHFFu+i1TPJJ1slOBMM5bU9+B60SAm7JM1Dt5SuVxthLsdVcXQK4bmot
	fQ3Y+aGd4xPrTRal9GccvERc6Nz91SjkqGa2wZagxbBbACln2GJv8SCoLAYomfyXa3pKWiD9YA1FR
	cHgZAzESJLCVJl89JtWSK8KS5yu24Fyn1Gup19bE3oB807Q6tk/QRHxleRuALFGoED2yotOrsCUO5
	gfwuwUPUsbKdNIf6j9ujwe2V9iVLXTfjk8wsKHqGJL+RIbfE91uEXXxCIaPJazLXaYTGA1B6x219J
	c5DxgA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzi0-00000009yQD-08AE;
	Thu, 05 Feb 2026 13:47:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzhx-00000009yPP-09ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 227074442D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Feb 2026 13:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72A0C19425
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Feb 2026 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299263;
	bh=TqQSl/AXwq5O7mCDqC49lTspKU6uswlxqLVsnpyKeRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYAdiBrhmJ0rhRzrbO3Gw3UV3p2TSesz3Ozh6UiqO/W07dhXkbEgo5HIrDZvUuOd0
	 jM4FUe1B2R877lUiayjXad7npnP5W3v9f47l6TMUBfJCqafwWYiPIBG3DKxQZlwZ4B
	 tTGH083509uupNCwt73ovV0b5EKPvi2smSGbJ0VbGNgyOhc/r4Vk0gAwwef3sJNabC
	 2FuaLUcU8omCMFtu4PqALpObdY4rHvOKHhtk+lGQXdBl5eN+DQjrWrwPU5+Mg+UAf4
	 NzPnN9K2EapkIdp+6KqAvANK1vlDgIZkd/3e+2yltkmTAhnmeWfKUu3+dGR8cr6v23
	 96yXxXR0arCFA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649655f14daso1010647d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 05:47:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxRGFoEE4Fm1jjnClbRIw3ugUb8c0+CWcj1TzRBqX9rQdd015zdDRFnmN6ZodOENeNoF2FE6Fy9dZf5N9yBWpj@lists.infradead.org
X-Gm-Message-State: AOJu0YwKHauq1LQ+QTBAHpvXcsnZqiVzphwHBTHEXFUGCtBBvqeBJftL
	80sZMtk2Ea7rRsZXqqPoXhFfbPOf3YJOo9ZSQwGlxihhjfSDLar3R1926r0+eczQ7irl5ZkT970
	682TLsJ6v0v64Fo2pnlyU+o8Q92nPjY4=
X-Received: by 2002:a05:690e:1382:b0:649:7026:a866 with SMTP id
 956f58d0204a3-649db32c9d5mr6671361d50.16.1770299262859; Thu, 05 Feb 2026
 05:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com> <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com> <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
 <20260205101814.000072ec@huawei.com>
In-Reply-To: <20260205101814.000072ec@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Feb 2026 14:47:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkVoorGWceRaF0VNeNLQz8TM1p2Dz-ivgyr4_T_QB_wfg@mail.gmail.com>
X-Gm-Features: AZwV_QgY-8JDDFOoXj-BL6RYvwLgIGqsSSSabBOxLwvwR5MB2AwK8YgkOXrL5AU
Message-ID: <CAD++jLkVoorGWceRaF0VNeNLQz8TM1p2Dz-ivgyr4_T_QB_wfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Yushan Wang <wangyushan12@huawei.com>, alexandre.belloni@bootlin.com, arnd@arndb.de, 
	fustini@kernel.org, krzk@kernel.org, linus.walleij@linaro.org, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, 
	xuwei5@hisilicon.com, linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
	reinette.chatre@intel.com, james.morse@arm.com, 
	Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com, Tony Luck <tony.luck@intel.com>, 
	Dave Martin <Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_054746_081008_182BA976 
X-CRM114-Status: GOOD (  32.46  )
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

On Thu, Feb 5, 2026 at 11:18=E2=80=AFAM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:

> Take the closest example to this which is resctl (mpam on arm).
> This actually has a feature that smells a bit like this.
> Pseudo-cache locking.
>
> https://docs.kernel.org/filesystems/resctrl.html#cache-pseudo-locking

That was very interesting. And more than a little bit complex.
IIUC MPAM is mostly about requesting bandwidth to/from the
memory.

But maybe cache lockdown can build on top?

> I'm also not sure what appetite there will be for an madvise()
> for something that today we have no idea if anyone else actually
> has hardware for.  If people do, then please shout and we can
> look at how something like this can be generalized.

Cache lockdown is an ages old concept, I think others can do
it too, you are just the first to try to support it upstream.
Personally I'm all for this, as long as we can come up with
something generic for others to use as well. No custom device
+ ioctl stuff.

There are adjacent stuff that vendors are doing is about prefetch
and which I mentioned briefly:

Fujitus prefetch:
https://lore.kernel.org/linux-arm-kernel/20220607120530.2447112-1-tarumizu.=
kohei@fujitsu.com/

AmpereOne prefetch:
https://lore.kernel.org/linux-arm-kernel/20231122092855.4440-1-shijie@os.am=
perecomputing.com/

Maybe that is more related to MPAM actually. What it has in common
with cache lockdown is "significatly indicate memore areas of special
interest". But notice Will Deacons reply:
https://lore.kernel.org/linux-arm-kernel/ZV3omRGtVS9l-tKk@FVFF77S0Q05N/

 "We tend to shy away from micro-architecture specific optimisations in
 the arm64 kernel as they're pretty unmaintainable, hard to test properly,
 generally lead to bloat and add additional obstacles to updating our
 library routines."

> My current thinking is first come first served with a path to
> clearly tell an application it didn't get what it wanted.
> Scheduling, priority etc being involved would all interfere
> with the strong guarantees lock down provides.

That sounds more like mdemand() than madvise() doesn't it ;)

But surely an all-or-nothing ABI can be specified, and maybe
a please-if-you-can ABI as well.

> > MM might want to use that information for other things.
>
> Absolutely, though I'm doubtful about trying to design a generic
> way of conveying latency criticality without knowing more of those
> use cases from the start.

Well, abstracting is about boiling the world down to a few facts
that can be used for making general decisions.

But for one I suppose if someone locks down some cache lines
in L3 and then not actually use them much at long intervals
because of misc, I suppose it's not very nice if the kernel decide
to swap out the page with these cache lines in it, because that
would have adverse impact on the performace once it hits for example?

Or did someone think about that already? Is that avoided in the
current patch set? (Maybe a stupid question...)

Likewise I see that this code is keeping track of which CPU
the l3 cache line were locked from, but I don't see anything in
this code blocking task migration for whoever called this ABI
or am I wrong? What happens if the scheduler moves the
process to another CPU? Or is it implicit that this is nailed to
the current CPU? Then surely that need to be enforced?

I just get the overall feeling that this was just tested on a scenario
such as:

1. Boot
2. Run a process calling this code, hey it works
3. Terminate process

No sleeping and swapping under memory pressure etc happing.

Designing for the generic case and in a central part of the kernel
(inside MM not in drivers/soc...) would avoid such snags I think.

Yours,
Linus Walleij

