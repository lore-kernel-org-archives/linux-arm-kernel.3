Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B06ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E5douEvnl79iHjWkyFm82J2TQ2sXA9KpzAuoqF4t4M=; b=K8kVfgpl7aUE7gfkfyWPFSah5L
	sWkR2BZJVm6yJU9Af4hB8c4o6IUdQoBy0vckrIvf4GUwmwq/V2JmdoH2iNoXXtIgLWsCo9ohHtcaG
	a7/g9kchD+vYqAQhkdqt7qVe/3/0rHb2emn9XFusMzxtm11LXGvA/mTCL4Imhykyys70fcCefn5+h
	0DPEz+qUT6Ki94Btte+xLRM/f3q4dpjIv1pY2fuSNWAvjtsBIFehiI4mY92HaJ29HWaX96EFjRUt1
	j+YishZp5bd2k+eo0B2zyVyd8bgz9I3jhupsKPNDhYGh9Dcur4jIeYmygaJcwyi9AcTOC4fa7v6n/
	XrF0shSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESU6-00000002bKk-2bYh;
	Wed, 07 Oct 2026 14:19:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESU5-00000002bKO-3Eqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:19:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB995601FF;
	Wed,  7 Oct 2026 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831641F0089B;
	Wed,  7 Oct 2026 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382744;
	bh=9E5douEvnl79iHjWkyFm82J2TQ2sXA9KpzAuoqF4t4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gk4XJlTjQoSq2o6hSxLhwTu84JOe9R3yg1stHfUIJNJs/ZoJOFA12d714OGlTfGJT
	 DbsyPQWsprKRYM4S1xW10HiR8XUmxWsxjz5fOwDxgDD/M/RiuyHcTqIWwPA5cA9TAN
	 kgSlr3kASKMNNPzfDHSqn9qAp8QbUqYJ4joEbzZD/9Cryt+gqfCSDB8ex7J54r9F0T
	 3NrXBEf3rSYAs0DdccebCaBy/hFuP2drjuWD9Y4bqtdIOE9pXE0RF4HV8f1W+wJoYl
	 R9yIpzNuPeQlUQXHHKX76UnsroY6SyEVWpSzqEzOXWYTWLel1DB3FoCMumRMMJmPOB
	 TbposgSKGkAhA==
Date: Wed, 7 Oct 2026 15:18:59 +0100
From: Will Deacon <will@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ
 lookup
Message-ID: <asZU0waS4-lKy8uQ@willie-the-truck>
References: <20260811041934.7609-1-phucduc.bui@gmail.com>
 <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck>
 <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck>
 <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
 <asJlxV06xzDIgqW4@willie-the-truck>
 <CAABR9nFz65Yt-SeHAx-Gxe18c4i3Sb3b_H-zsr7d+wwK5gB=CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nFz65Yt-SeHAx-Gxe18c4i3Sb3b_H-zsr7d+wwK5gB=CQ@mail.gmail.com>
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

On Mon, Oct 05, 2026 at 03:02:29PM +0700, Bui Duc Phuc wrote:
> > > > Sorry, but how is failing the probe possibly better than continuing without
> > > > the optional interrupt? Add a diagnostic if you like, but aborting the probe
> > > > feels completely unnecessary to me.
> > > >
> > >
> > > My understanding is that the driver is designed to be generic and
> > > support various hardware configurations, some with this resource (IRQ,
> > > GPIO, clock, ...) and some without.
> > >
> > > If a configuration describes the resource, it means the board is
> > > designed to use it. For that hardware the "optional" nature of the
> > > driver no longer applies, so if we fail to get the resource the error
> > > should be returned.
> > >
> > > A log alone is easy to miss, and the root cause still has to be found
> > > and fixed later anyway. Failing the probe makes the problem visible
> > > right away, when the board is being brought up.
> >
> > If you're doing bring-up, you should probably pay attention to the logs.
> 
> OK. Then we should probably write it as:
> -------------------------------------------------------------------------
> irq = platform_get_irq_optional(pdev, 0);
> if (irq < 0 && irq != -ENXIO)
>         return dev_err_probe(pdev, irq, "failed to get irq\n");

Won't this bail on errors != ENXIO and != EPROBE_DEFER? I think we should
only bail on EPROBE_DEFER. That's also more robust to changes in the error
codes that platform_get_irq_optional() can return.

> -------------------------------------------------------------------------
> 
> > If you're trying to use the device, you probably don't care about the
> > interrupt.
> 
> If we're worried about returning an error here because it might cause
> the device probe to fail, then shouldn't we hide errors from all
> the other functions in probe() as well? :-)

Not really. Only the irq is optional; we really can't continue if something
like ioremap() fails.

Will

