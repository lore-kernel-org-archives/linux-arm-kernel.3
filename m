Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBD0FD8FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBXxLPGkEsdM2dVaAMMMdPDzLTE9QgFOJJoZPQk5xXw=; b=vrDNRLeMcnWoCPF0vBPub9r1tr
	tv34v7N4mZLGXbbMUHGqgd36PtfA4mRV3Nkh1uQB+pHw4TuGYBmDeQhozMkM+sxHZkI9fn5AXqIwu
	D/5EtJY43HyhMp2kcPhNGCS38xHFCLUjBQkr1m+aDQ7cA6uqM3fUOVtSZ+FEUs02U+SYS+vqDuTeQ
	af6yzS6/u6AxjxXdjOGRT9PeFYwQnM7liRf3Wqko0L02hCWgaSt4ge7KDTUp+pfW4HGi+wGH2qrOo
	y1Jw4kyJDEydWiaLpkVKkamWwmIL1HfnTGUlZMGKrjJhrZCR0QFLUjwm2zc9m679CAdhdfzPBWRzw
	NWY9P2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfoH-00000006vGE-1D74;
	Thu, 26 Feb 2026 18:10:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfoF-00000006vFU-0fOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C14543C1B;
	Thu, 26 Feb 2026 18:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC3FC116C6;
	Thu, 26 Feb 2026 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129398;
	bh=IAT7/uP0nUuNP8sV3ZS+aCZKk0ydj/y2dZA9+Lnf9+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci8ar+WTRPL6UBv14ZkofG/cp6y56vp64vYvzhx1Yiom1zGxfdvvM4L5t00mv4Oa+
	 MzGo1JBxplrqZlhhCAHn9knETDys1bedrD/siEDaFPfvVQiX4G87z7JJM7fShhWc/l
	 +QU86O0lt2Z4P1qo9K95Vlt6mMFFCNDMIPWfPkv/ZAS1QAdNDFh1yR3VzRVWwCH4pT
	 KffI+KSu9lYEfsZKjEcRJU3KWVAFjaRdXzSJkPk2MTxBhTxBacuMV8fiPV6Ek/jPYI
	 ummEnvxP8mvhlFkvMUKmrB4ResIymMg/VFTD8HjIWZvu0ira+l+D5vQrUgNm6H2bM6
	 N6dm397z7RHBA==
Date: Thu, 26 Feb 2026 18:09:53 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/3] clocksource/drivers/arm_arch_timer: Expose a direct
 accessor for the virtual counter
Message-ID: <aaCMcU8qbpoEpLaz@willie-the-truck>
References: <20260226082234.26707-1-maz@kernel.org>
 <20260226082234.26707-3-maz@kernel.org>
 <aa607343-9dd8-4e96-a7e3-5937fa084891@arm.com>
 <4ab7b471-a67f-454e-aaf4-9e0b1f0d96e8@arm.com>
 <864in3a1tm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864in3a1tm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_100959_218734_44DC72C8 
X-CRM114-Status: GOOD (  20.56  )
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

On Thu, Feb 26, 2026 at 04:48:05PM +0000, Marc Zyngier wrote:
> On Thu, 26 Feb 2026 14:03:36 +0000,
> Ben Horgan <ben.horgan@arm.com> wrote:
> > Or is the point that if you haven't enabled a relevant workaround then
> > all cores are treated the same and so there is no need to disable
> > preemption?
> 
> There are multiple things at play here:
> 
> - we cannot fail to enable a workaround. If we find one, we enable it.
> 
> - if no workaround are available, then there is no need to disable
>   preemption, because the read of the counter is the same on all CPUs.
> 
> However, this code is a bug nest, and I just re-discovered an
> interesting failure mode (boot on a sane CPU, keeping the broken CPUs
> offline, online a broken CPU late, enjoy the fireworks).

Damn, that was the scenario I was worried about :(

I couldn't see an alternative to disabling preemption for everybody
but my brain's not firing on all cylinders this week.

> Plus the fact that we don't indirect sched_clock(), which means we
> never really enable a workaround if the boot CPU is not affected.
> 
> I have a small pile of hacks to address all of this, but I need to
> convince myself that this is actually correct.
> 
> Stay tuned...

I'll keep an eye out!

Will

