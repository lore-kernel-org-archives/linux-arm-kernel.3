Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F04DCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWtZc0bjjl64xaANXigV+9F0Zg1QFWUdNiNWNiWvNto=; b=k42i/I7nyM3GB507vPxFFvUcp1
	20INrnJHJRQYvSLo/j3oyBY6MBMRoBLUOEpW+4o8eDlUsGlrtAvbt8qwwJqBo72vdfvAqMPfqQoyC
	wIxNYop36EYKxUeQpTQ/MFGKY4hXWwIDyCI6x0cEqomnmu90KxNNu2Hs6U+xOqeeBD5oSbOwyt4GF
	5IwtyqoFCq77Rt+HzVPkf1iNJGfSE6+c/lVDJ+6+bIbiPMQcsgJ8vdakr2Num+oPPYCQc/NUm66PJ
	y054Im2XGF6hboAGHbkPze19QFNY9e5ibJLsWDAMO762h6ngMGhI9D9EF3tCLosCBwemcByqK/Jqs
	6JA4bl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHqT-0000000EZOZ-1nuN;
	Sun, 04 Oct 2026 08:45:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHqR-0000000EZOO-2Toz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:45:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 483F742ABF;
	Sun,  4 Oct 2026 08:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E621F000FF;
	Sun,  4 Oct 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791103518;
	bh=mWtZc0bjjl64xaANXigV+9F0Zg1QFWUdNiNWNiWvNto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZYL6ljQie/p6P3XjvuAqOTszsXJz0/4NmqMGLHgFUkl6eUusjXheNkOk0TEpslfh
	 JAkOnL4DRM4wpjzDMk8SLZiZjzMXpRu1J+MdZ0n4p3ci1FtFaDAkvqJRjBEchsi5Cu
	 ybJ8iRy9gCfwSsI9jFgeLe5ErKoKtR354m35+UW8igrAefAGO+7rCr/R3g1wTZeR46
	 ZBDCZFWKz+rnZbafxP55dxaRYgrZzpaMMy6RKYLPa/eYexZMgboIc8MjAQeEZk3Ucb
	 4hxiqVXKKxFhid6v8IrOQJrpqgR9kV+m9eE18hXr2/QbEcILBTg9t4xriL/XkF7mam
	 pMaHqZmEHDCXA==
Date: Sun, 4 Oct 2026 09:45:13 +0100
From: Will Deacon <will@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ
 lookup
Message-ID: <asISGdljsG86gUwb@willie-the-truck>
References: <20260811041934.7609-1-phucduc.bui@gmail.com>
 <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck>
 <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
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

On Sat, Oct 03, 2026 at 06:11:52PM +0700, Bui Duc Phuc wrote:
> Hi Will,
> 
> > > > Not sure about this. If it's optional, why should we bail the probe if
> > > > we don't manage to get an irq? Surely it's better to continue without
> > > > the interrupt in that case?
> > > >
> > >
> > > platform_get_irq_optional() returns -ENXIO when no IRQ is available.
> > > Other negative return values indicate errors, including -EPROBE_DEFER.
> > > In the case of -EPROBE_DEFER, we should propagate the error so that
> > > the probe can be retried later.
> >
> > Thanks, The -EPROBE_DEFER case seems more compelling, so perhaps we should
> > check for the expliitly (because it won't fail the probe altogether)?
> >
> 
> The idea of the _optional getters is that only the "not present" case
> is turned into a special value (-ENXIO here, NULL for
> devm_clk_get_optional()), while real errors are still reported to the
> caller.
> 
> Besides -EPROBE_DEFER, platform_get_irq_optional() can return other
> negative error values depending on how the IRQ is obtained. These
> indicate an actual error rather than the IRQ simply being absent.
> Ignoring them would leave the device running without its interrupt
> and no indication of what went wrong.
>
> 
> So I'd rather keep:
> 
> -----------------------------------------------------
> irq = platform_get_irq_optional(pdev, 0);
> if (irq < 0 && irq != -ENXIO)
>         return irq;
> -----------------------------------------------------
> 
> and continue without the IRQ only for -ENXIO. This is also the usual
> pattern for platform_get_irq_optional() users.

Sorry, but how is failing the probe possibly better than continuing without
the optional interrupt? Add a diagnostic if you like, but aborting the probe
feels completely unnecessary to me.

Will

