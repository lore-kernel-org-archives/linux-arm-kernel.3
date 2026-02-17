Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D06FE6817A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hc+l3zgnI4c6QaBzgq7ZMckdC5KQum6uKCRCoXKGfk=; b=eamxKROxZczudww6vA9tDIJD6s
	dRaXI38aVTPPe5oDUw8bEtIpnS/i20bUrGGFvkI9b9I4OcvXefbVOnMjSP7qN5qMnW3W25L5dx8MS
	e+0vb1LpCfl/uJDYpTU4MD666s/akq20Q9WM5C/fmUoeePkbXbFh1Zk7sjMDqNVs5y7vQDpNYx5nr
	xPFWSzQyLpn8mwIMsd4Cowxi/aHIurc1EqecrqH5uNAL3UFa84bn/C5nMppPULiYnA9vx0mut5QWf
	l+z8fQX31/BbpLEF7Z9y7EtcBic65jQwZN//MrdIhbNDkJngio+lqCONX99B/Wc0FqxAFEbhaT639
	R/Z3oExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK09-00000008BQp-3lRa;
	Tue, 17 Feb 2026 12:16:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK08-00000008BQg-3g2S
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Feb 2026 12:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1hc+l3zgnI4c6QaBzgq7ZMckdC5KQum6uKCRCoXKGfk=; b=iCmmFhwvMmC0jcbw89jRpd6KZR
	xJX1GlyEcvJEvO3l8L3vUbnjLIMTVd3jdvd4K4PLWKsv9CYhP9zGahFiKL3wh9xXqqfdqaP+nDL4j
	lmGL07NLREcBwR0CL0nevxeXES9/0g0esSUIb31YofW6729xRDxegJodS8fV4z4c8X8R83T+bRo+Y
	7Z+evSWggHCtLlE0Veqtb/R4CoQ93AtqHn3G0TUIcuvmGwaLuD4L4paWYSRtX2H6iBUhGeN1W9w8b
	CZLscVHDavWAFfuX80ilc3LgT9f9aqnoUuItqKWo9swGJZxYCU2uaCuwykOE1SQYVGgAoWTJDqXN9
	Ekl9RIWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsK03-00000004Ozt-3KLK;
	Tue, 17 Feb 2026 12:16:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 563C5300CDE; Tue, 17 Feb 2026 13:16:19 +0100 (CET)
Date: Tue, 17 Feb 2026 13:16:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260217121619.GA1395266@noisy.programming.kicks-ass.net>
References: <aYNUmEfDzq7lTFFr@willie-the-truck>
 <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin>
 <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin>
 <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin>
 <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216174324.75d47e37@pumpkin>
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

On Mon, Feb 16, 2026 at 05:43:24PM +0000, David Laight wrote:
> On Mon, 16 Feb 2026 07:32:53 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:
> > >
> > > volatile structure members are almost free  
> > 
> > No, gcc does absolutely horrible things with volatiles. It disables a
> > lot of very basic stuff.
> > 
> > Try doing something as simple as a "var++" on a volatile, and cry.
> 
> On x86 I just see a load, inc, store - not that surprising really.
> (clang did do 'inc memory'.)
> 
> It's not as though 'inc memory' is atomic (without a lock prefix).
> 
> Also var++ will be 3 u-ops the same as the read, inc, write so the
> underlying execution is much the same (ok you might save on the
> address generation and the compiler doesn't have to find a register name,
> but I don't remember anything modern being limited by instruction retirement).
> You might save a bit of I-cache.

Interrupts can tell the difference, and that matters.

