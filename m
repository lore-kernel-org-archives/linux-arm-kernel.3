Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C229EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWpeoNy1D03nd+2y1T3gOuhEjAr9cvPUV+WQbj5qUgU=; b=f/e2lUTzY9VgyEC6s7nNKkK/RE
	dX7CFWgKJ4zWrqt00G+nsXwqkwZlGXoO8+ghFoU/XJ3CH9e/8HLM+k96n8t1+/RoOW/70G12oSy3i
	ak4MJIjPpk4Xj96thvk8aa8y28TQQw/DWoOkCIHshom0ftBQ8Y5o4A1t8eEHdwdHMhldCHDlHsJMw
	YBI1Uzfd0sbpIUadvCNI3Ci5wqRcASsMR6XMC7qS5Pl6DgVgpe1WRTrSpPrPdZekF5B2c8xpPSfU1
	QjYLNHD2t6Rd12+w2q/p2CDJGInGqdFjdTGx/ekzLXUkdcC5dciP6j8rAXWlXyNgTJ1FeDbrlLhns
	YLC4pcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVY8-00000000Jlk-0wwb;
	Mon, 23 Feb 2026 13:00:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVY7-00000000Jla-1y4y;
	Mon, 23 Feb 2026 13:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FF9A600C4;
	Mon, 23 Feb 2026 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D62C116C6;
	Mon, 23 Feb 2026 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771851630;
	bh=uOtJDy2FyPxpMhP2bRO2gFMv/2nj4Vw849MMg7jCtgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clGrAsM1eO4t5380MKOhdLbYwfD37kNqsjhSPZfNmBaOz+46Aab5ZPI93qEZEU5nS
	 DcwHN+ArfBxcohFQnPXImXwzoJa/FHhgA0Z9jrj3wh7XDmC3M+vqCxsmgfy4RSA5tt
	 kkQBqXWtWNzYKtp35Gc+GZEl+P9QXOmoXkBRlX43RAI4LY7FuHvlHjYGeyDpC+RGBT
	 tUqkFw7eNYiDbxZ/wRx1d7LsNHhur4YAEp9jJv9TLYXDgW2OX+BkEv5rWEz9yWRU0b
	 nbhXvY0Av3j2c9EfjiEXgY8ljwW0Re4YGY8ls3P4Q9In+IRfQjjZq3NlZG1S3pcp07
	 1d/WixW1O9Mnw==
Date: Mon, 23 Feb 2026 20:41:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, ardb@kernel.org,
	mark.rutland@arm.com
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZxLE-wNGaEGDHGI@xhacker>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-3-jszhang@kernel.org>
 <877bs4wi0c.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877bs4wi0c.ffs@tglx>
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

On Sun, Feb 22, 2026 at 11:06:11PM +0100, Thomas Gleixner wrote:
> On Fri, Feb 20 2026 at 17:09, Jisheng Zhang wrote:
> > Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> > is a pointer which is set during booting, and every irq processing needs
> > to access it, so it sits in hot code path. We can use the
> > runtime constant mechanism which was introduced by Linus to speed up
> > its accessing.
> 
> The proper solution is to use a static call and update it in
> set_handle_irq().  That removes the complete indirect call issue from
> the hot path.

+ Ard, Mark,

Good idea. The remaining problem is no static call support for current
GENERIC_IRQ_MULTI_HANDLER (or similar, arm64 e.g) platforms.

For arm64, Ard tried to add the static call support[1] in 2021, but
Mark concerned "compiler could easily violate our expectations in
future"[2], and asked for static calls "critical rather than a
nice-to-have" usage.

Hi Ard, Mark,

Could this irq performance improvement be used as a "critical" usage for
arm64 static call? Per my test, about 6.5% improvement was seen on quad CA55.

Another alternative: 
disable static call if CFI is enabled, and give the platform/SoC users
chance to enable static call to benefit from it.

Any comment is appreciated.

Thanks


[1] https://www.spinics.net/lists/arm-kernel/msg931861.html

[2] https://www.spinics.net/lists/arm-kernel/msg932481.html

> 
> Thanks,
> 
>         tglx

