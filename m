Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A978F588DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAfBSQ8VAz+T3MEQfU5/82R3tFozaNIvqC/8V0XY7+I=; b=qqW4eDXGt+nCRPr0xZL4GvORDr
	CUe3qu1bt15KHkb1u06aiT9nNhmCEPVK9KA2r1MPGQ251RHEJRrTuvNw/m4178WYMEABrgQFexcu/
	/1RzbDyCN76o2m8+zG9X8PoTXOWMr9FIvMinPOoQeVc3mhoK1KVxtG1zDdG47bP7/3dAwzG8DJ4Xy
	Rqu7N8pLOJDUhyIXmbd+57YkupCRHZbA3BuBXcwnJFvex6k1HwHiCwID8/k8VGq7odPH/liTSddtT
	LE8NcjNn/LKkDQDI98f1KJ9D+jamVBayW4vBUg/U9ucjvQQJm0v9nPPYwWhQHTzJ/EracQZFW5Y9K
	zY7eEIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpOr-000000079N1-0o0R;
	Mon, 20 Apr 2026 14:14:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpOp-000000079MS-05lO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:14:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FAF51516;
	Mon, 20 Apr 2026 07:14:48 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A0A3F7B4;
	Mon, 20 Apr 2026 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776694493; bh=SpGIaEO+7YDPT6wqwPtFUdsz9O2FOsqYjyt7X+bnG/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8nxiXMMinxckJ9ZLOcltuhZulg6xfO98CBq7Tp2DdYdMlKcpampDDAL2zPuQ6aix
	 KQlG1bUSXOIH61XNE37+ldY3eoXS/27aJ4N2zD7THcQ34VVCAqrInxExB4vbzKhn8a
	 UzXgffCdno/WGaXqNsvp6PR23jc11+wZ/5/My3kM=
Date: Mon, 20 Apr 2026 15:14:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, leo.bras@arm.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paulmck@kernel.org, puranjay@kernel.org,
	usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] arm64/irqflags: force inline of
 arch_local_irq_enable()
Message-ID: <aeY02X5MDWPhGPCK@J2N7QTR9R3>
References: <20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org>
 <aeYkz_4WKDdb1NTp@J2N7QTR9R3>
 <aeYmHr_lgPJbBoL_@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYmHr_lgPJbBoL_@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_071455_127996_3B17F922 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, Apr 20, 2026 at 06:15:24AM -0700, Breno Leitao wrote:
> On Mon, Apr 20, 2026 at 02:06:23PM +0100, Mark Rutland wrote:
> > On Mon, Apr 20, 2026 at 05:42:11AM -0700, Breno Leitao wrote:
> > > arch_local_irq_enable() is a small wrapper that dispatches between two
> > > unmask paths: __daif_local_irq_enable() on most systems, and
> > > __pmr_local_irq_enable() on builds that use GIC PMR-based masking
> > > (Pseudo-NMI). Both leaf primitives are already __always_inline; the
> > > wrapper itself is plain "static inline".
> > >
> > > In practice the compiler does not always inline the wrapper.
> >
> > I think this was my mistake, and we should have marked all the helpers
> > as __always_inline for noinstr safety, as x86 did in commit:
> >
> >   7a745be1cc90 ("x86/entry: __always_inline irqflags for noinstr")
> >
> > I think we should mark all of the following as __always_inline in one
> > go:
> >
> > * arch_local_irq_enable()
> > * arch_local_irq_disable()
> > * arch_local_save_flags()
> > * arch_irqs_disabled_flags()
> > * arch_irqs_disabled()
> > * arch_local_irq_save()
> > * arch_local_irq_restore()
> >
> > ... which then ensures noinstr safety, and has the side benefit of
> > giving nicer traces as you're suggesting here.
> >
> > Are you happy to try that?
> 
> Absolutely, I'll work on testing it that and put together a patch
> addressing all of them.
> 
> Should this be targeted for stable backports as well? If so, which
> commit should I reference in the Fixes tag?

I don't think we need to worry about backporting, and can do this as a
cleanup for now unless someone shouts that they're seeing brokenness in
a stable kernel.

There's no specific commit for a fixes tag; this has always been a bit
dodgy, but we've evidently been getting away with it in practice.

Mark.

