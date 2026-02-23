Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80108EA4FC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW6N3rGU2ZBKiA5TO2fqe3PHPUs/lOREE9/IWMJ4tOU=; b=khbWyk8pbfy9sUcb15qVIpwafR
	if6OOMN0SpPseSYZZWqiEZrBamFcrA9yEfBJEXD09lDCnprOgD59puu1sjfg4SQAQDQ9NmviyOZd4
	BUR0nQwhi7O2PhElTKGK+tOg15YAx3PkeQF2ujxc/bRvLC2d/1a9Hn4HKXQjiGIeGPwQ4Yg7gJ5Fm
	+Nl7Uo6h/b+7qaf204UOO74TePKvjQKZ3NoDcxXgaFV2x0W+OdEz1oTV7mFeZ8HUU7UUL676LM8Sa
	ZqStYzqczpZ9ecsTBD6ohox+pgpnnQlzBvL9GE5DwJGTccjT9VAavNci9L1aDoKuHuCzkVdYjyNhJ
	C1ZYiOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWPZ-00000000QP6-3KmJ;
	Mon, 23 Feb 2026 13:55:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWPY-00000000QOp-0VKG;
	Mon, 23 Feb 2026 13:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HW6N3rGU2ZBKiA5TO2fqe3PHPUs/lOREE9/IWMJ4tOU=; b=aawVdu4i1mo1dCrOic3p9eRbsp
	Hd3IJZ7C8a60VdgJggU97MnBqnGnSf1BueQY77k1KbpP7jyxtPgQ03+unR7Z8NSfWZx1qRxe5w1ly
	JcKhsq8LRiJxwkv3CkCdQvRbAvwYArz7kN5+3BsBhOruu6NyVnN+4BTg2PM+hacGmL9o2u+/JfzW5
	HkbVy3C5jWGJQeggD3ZBk8pGCU97tHZ9wSTIlSPqvs8rrQeg9cNpqmPAqqBdP8//vbTqDKVSkWhil
	zUsmBGvlAYRb5EVwQBVdD/yr2ySbuL4iut9m2iXcLpK5XdquDM0vayZ7P9BCDC2uzT3Rt8Ik49zdW
	pB8SP2mA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWPT-00000005B0F-1Fkb;
	Mon, 23 Feb 2026 13:55:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6F6339;
	Mon, 23 Feb 2026 05:55:31 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 240543F59E;
	Mon, 23 Feb 2026 05:55:35 -0800 (PST)
Date: Mon, 23 Feb 2026 13:55:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, ardb@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZxcVGr47wYM--nr@J2N7QTR9R3>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-3-jszhang@kernel.org>
 <877bs4wi0c.ffs@tglx>
 <aZxLE-wNGaEGDHGI@xhacker>
 <aZxSEoFkXMg18qLV@J2N7QTR9R3>
 <aZxUpATkNI5_PbNl@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZxUpATkNI5_PbNl@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_135539_709368_6D3464DB 
X-CRM114-Status: GOOD (  17.70  )
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

On Mon, Feb 23, 2026 at 09:22:44PM +0800, Jisheng Zhang wrote:
> On Mon, Feb 23, 2026 at 01:11:46PM +0000, Mark Rutland wrote:
> > There are various reasons for not supporting static calls, and in
> > general we end up having to have a fall-back path that's *more*
> > expensive than just loading the pointer.
> 
> indeed, if arch doesn't support static call, the fall-back addes one
> more loading overhead.

I think you've misunderstood my point.

I'm saying that *even if* arm64 supported static calls, we'd have to
have dynamic fallback paths that are more expensive. For example, where
branch range limitations force indirection via an out-of-line stub,
adding an extra BL+RET pair. Note that was the case in the patches you
linked from Ard.

[...]

> > > and asked for static calls "critical rather than a nice-to-have"
> > > usage.
> > > 
> > > Hi Ard, Mark,
> > > 
> > > Could this irq performance improvement be used as a "critical" usage for
> > > arm64 static call? Per my test, about 6.5% improvement was seen on quad CA55.
> > 
> > As per my other mail, does this meaningfully affect a real workload?
> 
> This improves generic irq processcing, I think all real workload is affected.

I asked about meaningful impact. For a real workload, does this show up
at all, or does this fall within the noise?

At present, I don't think your singular microbenchmark result changes
our previous decisions regarding static calls. For various reasons, on
arm64 static calls are nowhere near as significant an optimization (and
can be worse).

I'd be happy to use a runtime constant (modulo my concerns about the
initial value) given that the we already have the infrastructure and the
maintenanace impact is minimal.

Mark.

