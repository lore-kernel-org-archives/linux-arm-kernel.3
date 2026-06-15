Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3950CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g36MIwpGYoz3X7VL1Yutn+HhGIx2EjVVLG9IrRo4XS8=; b=UhvFGo7yz5RWWETe1im2867iqU
	/4qF678dLb242NIiQclwWeDT98aYs0/fXrpNLP0od9ZpKeTfxeH6rCU13sSP3roizj/5stepgNvF/
	7f/SmDBNifGB7WC/dDKRdUEpN8LNCDdD+LM/cl9V/lHBobVx6D2j4Vb/1SUc3b9B0u2Byl5Lw6lZ8
	/nk/4rICmZ2FyK0anAPe0TXDqgpqPyG2CaKhwddwHHYvH7zK2Ybs8A7gITScdlDl7ImxKneM+6KWU
	86ES69IBastR7G1n7lfztrfYM2c8GLlNSzdATf0BZsvxlaXfjhzQibFy4NQOGpygES/Vml/j8yTDs
	Oy8T8wGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0o-0000000Ee2e-0VbQ;
	Mon, 15 Jun 2026 17:22:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0h-0000000Ee0i-2h7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:22:12 +0000
Date: Mon, 15 Jun 2026 19:21:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781544120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g36MIwpGYoz3X7VL1Yutn+HhGIx2EjVVLG9IrRo4XS8=;
	b=AwdVrvNTMnPiP117pH+w8Yusw6Pu9fpqsyY/bfv0hfJ9glQiTBK7M5v6xyuI+/od5zUjAV
	Nwb/yR1D6G2D27VWA/9Ajka/728BGF5OzevCisU98XPgaznpZdmJgC3NDfyItFWFXoAsQr
	fvBW3s35VfsU2Hz8Q0I/qMwuBR/7UZP3wK0yG40bAJEzhc0dyxcECkreKSY9y8jNGEiBb6
	gcYC3sI+LGSc3U6b27t17nyukhwU3FdWGytMtwCHNQTkY5GZsmfEPZJTiLt0b2y1HubbTZ
	yMCCZRtrMzS1zc5SLZE8KFrkw3GzwgQjnymC1/a0eBkOoXsbKSa9p/dcED9Asw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781544120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g36MIwpGYoz3X7VL1Yutn+HhGIx2EjVVLG9IrRo4XS8=;
	b=bF2Jx9DjIAugTGfzqoeBJPeJfR2Oft6+R/cw7JPECtOjFGNdrEoN16C4yoqQlIfbIArarO
	YvsEFaxd9OJCvuBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Waiman Long <longman@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <20260615172158.AoVQ3Q3K@linutronix.de>
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
 <a5251664-2c15-4a8e-906b-d204e10c38be@redhat.com>
 <20260528145124.v9o6OcOc@linutronix.de>
 <20260528153554.vllN7_T9@linutronix.de>
 <aho0eqjMESuHxECr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aho0eqjMESuHxECr@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_102207_823915_F24685E6 
X-CRM114-Status: GOOD (  16.99  )
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

On 2026-05-29 21:51:06 [-0300], Luis Claudio R. Goncalves wrote:
> On Thu, May 28, 2026 at 05:35:54PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-05-28 16:51:24 [+0200], To Waiman Long wrote:
> > > > The kernel backtrace is produced using the latest v7.1-rc4 kernel. There are
> > > > a number of changes to the debug_exception_enter() and
> > > > debug_exception_exit() functions over the years, but the preemption disable
> > > > code remains since its introduction in v5.3.
> > > 
> > > Let me look at this again.
> > 
> > So how do you reproduce this? The calls within debug_exception_enter()/
> > exit() look harmless or I miss the big thing here.
> > From your backtrace, you have brk_handler() and this is gone since
> > commit 31575e11ecf7e ("arm64: debug: split brk64 exception entry") which
> > is v6.17-rc1. I can use gdb with breakpoint handling.
> 
> Sebastian, in the original series Ada provided a few tests, including the
> two files I list below. Running that test in a v7.1-rc5 kernel with
> PREEMPT_RT and DEBUG_ATOMIC_SLEEP enabled, I get this backtrace:

This is a reminder to myself that I need to look at this since it does
not look solved with the breakpoint patches. But this is also perf.

Sebastian

