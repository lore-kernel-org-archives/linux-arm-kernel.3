Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2F8C5CFF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 00:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlmeWGEmtcxnDUYeUCe8CxGlmcOJQGiOihkK0JOKzj4=; b=Bi69q/x6fqddfB6Me/0bBqtq49
	9a9uCPIpxE7o9bQsVK6FUjh8YM/5r7RY7uuAnGhDjHnVZsIBw4bc5jkjfoy+3NNGxkQvsKnUiWEDj
	WhV6z5u0fviWLGlsmj2tChow9m2a1YUAgwuFERplO97UZ1gdYhwP6Uh6mJwfjIq3nyM7xSYqO/yp5
	zavPx9wkniDMc1O6rEIHWnX8CZUMdlR9ejNXV7GXD05DLhs7zCut+pZqfbC+iXJGfj5qZgy0xIgiY
	KJcrInpUUf2HxS1BHiUgZiiiGVPgBQzUdZPtCuNGfwkNV87drb7K/rFS9+QYRyKc+yJ1/UNzsUsTb
	3/qvrajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtavT-0000000Fifp-01xx;
	Sat, 21 Feb 2026 00:32:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtavR-0000000FifP-1Ig7;
	Sat, 21 Feb 2026 00:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37BC2436DB;
	Sat, 21 Feb 2026 00:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CFFC116C6;
	Sat, 21 Feb 2026 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771633968;
	bh=kwlKI7Kb62LlHiwnwWmHi20ea2Opc01sVtwHb3z1XRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQMkNQ3zrB9bFmSsQll8RGmasXbrw+cZiGTiWcGGacpVS6Zh+QzSBYwEcNSIvcGEp
	 qa3yMvBKE48mCd0PnjHXqDRCfoxz+EHkCHd+w7rt5xPHxboI163pbPe0PyQL0U4t2X
	 zozPONVkp8Vqn8pmfrv6JAWXBQTy9KvN/o4fHf6pIt8Wt5HtOwYb4S/+nwbp7cKmCE
	 Qzj0vAnqF3g4TGUXuW0me4Cf2GVmjQft9kd3h8nGrN9frsbhXLIm1sdg3yQ1qWT/LR
	 ujpqI506aqQwvCcIqCRbHHAGMOyycQsOZewcFaaedlA3CFjGrGttRpiZkD5fG3UJfW
	 IQBSLT3lqnLNg==
Date: Sat, 21 Feb 2026 08:14:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZj42cyIHADECszW@xhacker>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-4-jszhang@kernel.org>
 <20260220123414.GF136967@e132581.arm.com>
 <aZheqINXslxlrmTt@xhacker>
 <aZhi1p0NJH5ug8CA@xhacker>
 <20260220164738.GH136967@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220164738.GH136967@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_163249_392132_4733227D 
X-CRM114-Status: GOOD (  15.38  )
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

On Fri, Feb 20, 2026 at 04:47:38PM +0000, Leo Yan wrote:
> On Fri, Feb 20, 2026 at 09:34:14PM +0800, Jisheng Zhang wrote:
> 
> [...]
> 
> > > > Run 3 iterations, and measures three metrics (messaging/pipe/seccomp)
> > > > and results in seconds. Less is better.
> > > > 
> > > >   +---------------------+--------+--------+--------+--------+
> > > >   |Without change       |   run1 |   run2 |   run3 |    avg |
> > > >   +---------------------+--------+--------+--------+--------+
> > > >   |messaging (sec)      |  4.546 |  4.508 |  4.591 |  4.548 |
> > > >   |pipe (sec)           | 24.258 | 24.224 | 24.017 | 24.166 |
> > > >   |seccomp-notify (sec) | 48.393 | 48.457 | 48.232 | 48.361 |
> > > >   +---------------------+--------+--------+--------+--------+
> > > > 
> > > >   +---------------------+--------+--------+--------+--------+--------+
> > > >   |With change          |   run1 |   run2 |   run3 |    avg |   diff |
> > > >   +---------------------+--------+--------+--------+--------+--------+
> > > >   |messaging (sec)      |  4.493 |  4.523 |  4.556 |  4.524 | +0.52% |
> > > >   |pipe (sec)           | 23.159 | 23.702 | 28.649 | 25.170 | -4.15% |
> > > 
> > > If you check the result, this result variance is abnormal, it means
> > > your OS is noiser.
> > 
> > BTW: if you remove the abnormal run3 result, you'll find that the
> > benchmark is improved by ~3.5% on CA73:
> > (23.159 + 23.702) / 2 = 23.43
> > (24.258 + 24.224) / 2 = 24.24
> > (24.24 - 23.43)*100 / 23.43 = ~3.5
> 
> TBH, I don't think we should subjectively select data.  But I agree a

The precondition of this is testing the benchmark properly. And I just
tried perf bench sched in noisy OS, I didn't get the similar abnormal
variance as you got, so I think your run3 result was CA53's result.
This isn't an apple-to-apple comparison.

If possible, could you plz test after forcing CA53 offline or test on
non big.little platform. Anyway, I will test CA73 next week too.

> clean test env is important to avoid noise, and I also agree that the
> current results already show positive signals.
> 
> Thanks,
> Leo

