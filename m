Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJg3inX5iy8rb6nSuSXw/iPxmbpJ7Y/aBoGJRj/Me0s=; b=srHz85gM2Iw0bEVX3PlXHcxOBd
	loonQseqGpPHsCtjFANNQDcyFJy0+YZw/nT4K6bdClSzBUjMnkhFB6vgKYrt8ClgFcEYO5+9+MwJn
	ydtN+3rUprszrvpLRlthr2ulLirWl/HzatYLWbOfYHwVKeYvCx+OcGcEenQf7IsqOU42XJpkevDgt
	VJxT0WBeXDHTy0Ey0mUD6DHWHsCrCj95TH9LYaXiXUAA/Fto1Wqo3K20d5YNcq33DhdPQixmw2rKm
	8Qwz94JJ7FjKmuEVUqk1dOv2Ist4bRdOwbmVlH8dGUYdNKVGev/gmSbabBmf3lrdrQWlLtX5AxNxs
	npiRywEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFQr-00000004IWj-2Vmq;
	Thu, 02 Jul 2026 11:18:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFQp-00000004IW1-47Os;
	Thu, 02 Jul 2026 11:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jJg3inX5iy8rb6nSuSXw/iPxmbpJ7Y/aBoGJRj/Me0s=; b=d9FS99uQdqdRPtX0epGTfBuXv6
	YddgtwIuQV8k6gbBrs58fB65WzNZXegFxrXWCyWbPtqz2opt9JB6OURvje2XjsiLEuRc1NgDzJ4dV
	c9LvrtuEM+QV3Tbo3N6VHRRkkTH8O/oynZZpGIGpyh0xs8fg2QiXkXrap/6upwYQfZQq9ouTRK9qL
	SjdTEPE4Ogcp9HG7XveSo/IKQCjZ7AV/ICKOsijLCsM58+YyPlNG+XqiQksRtK9NftxvDWklJkZrp
	nx6+k+BJN/fr9DZ0IYCyI92MXVxSYVMRZb1WlEXE7MHRv3UhhwBC+AqKlGmudwNYA3kYxGGvg5dy3
	ASBmS/ZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFQm-00000008Qd5-0pXm;
	Thu, 02 Jul 2026 11:18:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E93BD300220; Thu, 02 Jul 2026 13:18:07 +0200 (CEST)
Date: Thu, 2 Jul 2026 13:18:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] futex: Optimise the size check get_futex_key()
Message-ID: <20260702111807.GI751831@noisy.programming.kicks-ass.net>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
 <38239f40-1673-469f-baa3-4a343d2aa4c3@amd.com>
 <20260701161736.xYYizA0e@linutronix.de>
 <20260702085921.GD49951@noisy.programming.kicks-ass.net>
 <20260702105615.PiYhQ9Rt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702105615.PiYhQ9Rt@linutronix.de>
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

On Thu, Jul 02, 2026 at 12:56:15PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-07-02 10:59:21 [+0200], Peter Zijlstra wrote:
> > > Could someone verify this, please? The 5% look a bit high. This is on
> > > top of the series (but not worsen by the series).
> > 
> > Bah, I tried to reproduce and couldn't. Then I noticed I did a clang
> > build and that is in fact clever enough to do this optimization itself.
> > 
> > /me tries again with a GCC build.
> > 
> > pre:  [thread  0] futex: 0x561f14430680 [ 9021408 ops/sec ]
> > post: [thread  0] futex: 0x55feadbbb680 [ 8977527 ops/sec ]
> > 
> > (and this seems to be well inside the error threshold of this test).
> > 
> > So I see the GCC build do the DIV, and no longer with his patch applied,
> > but for some reason I cannot get the runtime performance to actually
> > improve much of anything on my system.
> 
> I did open https://gcc.gnu.org/bugzilla/show_bug.cgi?id=126078 for the
> div.
> 
> My .config is the debian distro on the 4 node big iron. [ in case it
> it has so much overhead elsewhere that this place a bigger role].
> 
> "perf top" showed this as 6% or something and red in the function. After
> the removal it did not show up.

Right, I build whatever random config I had on the SPR test box. But I
can't argue with the patch, it is sane and GCC does generate better code
with it. For $raisins it just didn't translate into actual performance
for me.

