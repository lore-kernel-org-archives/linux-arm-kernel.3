Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F0C10A88FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4oUCsRnoIaW2TGVVr1v0fc10aw2+Dzx01XN7duE+vc=; b=vHhk+WSeRvN3V52tzgLHSHQNFx
	7+MlV1h4lGOxwjAqa/1AmxkPW6noHw6x0DUv7cNNeVZNvrXphSKDLaWdGqSCBjnBXQJyVqwkdzreD
	QzSKRji5O007j5jQOXc/UGCK5ShmVwCzRppPDZnpfYZrSxGfImuJraysG3tevMGERWVwK5yt+2v5+
	t2wzLypce31AlwIlJi5zt6NvT97SfTdCZg0/cINiuLn3oLCW8bzR7V5UO52yP9FKsLHwUEP8gMhti
	dIat0vq479sjzRunPysbmhvnrfIk/UtqoPDVjBGwA+TGVUm85DjtIswz3mI9DZnsFW47ZKSuQzLiK
	awh4Os0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pBf-000000060bl-3Meg;
	Thu, 26 Mar 2026 18:12:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pBb-000000060ax-1nUU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:12:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BAA1AED;
	Thu, 26 Mar 2026 11:11:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0A43F905;
	Thu, 26 Mar 2026 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774548718; bh=dgIj3a5tK1onWSWVfqDJCKoL+8uwDoGTJyJ7ifoq1WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pI8s02Y0og85zbp1uQ8eqYQhI5vaRqB/BdG9J9LhF+uyJtQfveZ9OA2eDC5pKbLZ7
	 uh+Oa5bRLyHYGTTeXgVYdM5ddoR/qrKKdcafCsmegawct+nuY/dIFNB3sSOLvG2PV6
	 flVGMh48lSb196pxzpduqOUBoBeYQdCsS9c2h4tY=
Date: Thu, 26 Mar 2026 18:11:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <acV2552t5X4OlNYi@J2N7QTR9R3>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
 <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com>
 <87fr5six4d.ffs@tglx>
 <acPAzdtjK5w-rNqC@J2N7QTR9R3>
 <87ecl7gbeu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecl7gbeu.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_111204_067541_D7B227B9 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2026 at 04:46:01PM +0100, Thomas Gleixner wrote:
> On Wed, Mar 25 2026 at 11:03, Mark Rutland wrote:
> > On Sun, Mar 22, 2026 at 12:25:06AM +0100, Thomas Gleixner wrote:
> > I *think* what would work for us is we could split some of the exit
> > handling (including involuntary preemption) into a "prepare" step, as we
> > have for return to userspace. That way, arm64 could handle exiting
> > something like:
> >
> > 	local_irq_disable();
> > 	irqentry_exit_prepare(); // new, all generic logic
> > 	local_daif_mask();
> > 	arm64_exit_to_kernel_mode() {
> > 		...
> > 		irqentry_exit(); // ideally irqentry_exit_to_kernel_mode().
> > 		...
> > 	}
> >
> > ... and other architectures can use a combined exit_to_kernel_mode() (or
> > whatever we call that), which does both, e.g.
> >
> > 	// either noinstr, __always_inline, or a macro
> > 	void irqentry_prepare_and_exit(void)
> 
> That's a bad idea as that would require to do a full kernel rename of
> all existing irqentry_exit() users.
> 
> > 	{
> > 		irqentry_exit_prepare();
> > 		irqentry_exit();
> > 	}
> 
> Aside of the naming that should work.

Thanks for confirming!

I've pushed a (very early, WIP) draft to

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/entry/rework

... which is missing commit messages, comments, etc, but seems to work.

I'll see about getting that tested, cleaned up, and on-list.

Mark.

