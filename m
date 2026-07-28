Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE178C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUdocc9AyfaWpOM5SNPJip/RwRNo5MSCyklyHVO9Wws=; b=nEpM5DQSPxBw145dDqgBIVVX9Z
	B80kSQGR8NZwgC/vtqjCK2bRxd4vvx+SQbfphxBh5OV2RvzAij3+kqXsVU+3IYzOK/V7XSgOVxD3X
	rIXyYT2D1z78xoDynUjd+pTAQDJaFus1igOj7wuiefA9blduu+Tgv/tT0csVhO2uEyA70urgQX7Uu
	JfmahdUEPYWzFoQM7/6LfDU7yDtJLj5f5eZltTwHBtRjWWRdrEG7wJ7e2zx75C/xX9i7h3UtADt+Y
	RM7KiHLMGnqdtbcaGZrAN7ar6PwCSUx/Nhp/xvUNaaxP0AuSnqG5kg+m4IU/uwbWuYJuyUCLoWHng
	8MOXSTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woffS-0000000529Z-42cL;
	Tue, 28 Jul 2026 11:08:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woffR-0000000529M-2XAW;
	Tue, 28 Jul 2026 11:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XUdocc9AyfaWpOM5SNPJip/RwRNo5MSCyklyHVO9Wws=; b=F4iPhNzOmo8NpbJb+tV6CswPGi
	+YCKtt8bsid6mcaEYcbDf3iYC8DCtCRsMy/bsVClYGCieP2r8DU303Iv4guwsi7UYqR03nOeEDkSK
	56qpqtPT/VLc8PvXtZ5h/g7q9erG4AKjqUkG+4eIl0qMv/j/Xb932EoEnjm4KYzrDd5Fk7iwfl41u
	grFxNPvv2ez60OT3dtPnXylCD1+t/nHHTdYxSmbEUVfTcxHTiv7zkgE7fT/yZm8u8OznQD9ribqUi
	G+fI3woBoHEUDLnKzKsPe7ptdNYj4VnHFzS9cC7Ixype8if2pU52BCJYozxNfjNECkFbGIqBlqMED
	OZuDKqQg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woffL-00000004ryR-2Oyk;
	Tue, 28 Jul 2026 11:08:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1DC6330093A; Tue, 28 Jul 2026 13:08:06 +0200 (CEST)
Date: Tue, 28 Jul 2026 13:08:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Huth <thuth@redhat.com>, Jisheng Zhang <jszhang@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v6 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260728110806.GJ49951@noisy.programming.kicks-ass.net>
References: <20260728052540.4728-1-kprateek.nayak@amd.com>
 <20260728052540.4728-9-kprateek.nayak@amd.com>
 <20260728104653.GH49951@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728104653.GH49951@noisy.programming.kicks-ass.net>
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

On Tue, Jul 28, 2026 at 12:46:53PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 28, 2026 at 05:25:40AM +0000, K Prateek Nayak wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > Runtime constify the read-only after init data  __futex_shift(shift_32),
> > __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> > hot path to avoid referencing global variable.
> > 
> > This also allows __futex_queues to be allocated dynamically to
> > "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> > (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> > 
> > Runtime constants are initialized before their first access and
> > runtime_const_init() provides necessary barrier to ensure subsequent
> > accesses are not reordered against their initialization.
> > 
> > No functional changes intended.
> > 
> >   [ prateek: Dynamically allocate __futex_queues, mark the global data
> >     __ro_after_init since they are constified after futex_init(). ]
> > 
> > Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
> > Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
> > Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> > Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > ---
> > changelog v5..v6:
> > 
> > o Picked up tags from Charlie. (Thanks a ton!)
> > 
> > o Picked up Peter's S-o-b from his tree.
> 
> Right, so I also munged the Changelog in my tree to include those
> benchmark results. I failed to actually push out those patches before
> disappearing on holidays, but I recon I should refresh them patches and
> re-munge the changelog?

With a bit of luck I didn't wreck things and this new version should now
be available in queue/locking/core.

