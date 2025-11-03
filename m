Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF412CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCGGNMYDM+CWrXnvfp3MrePdydtXWfwLBOFLQtyEm74=; b=d8ApWy8+D0YJ0tLrn5MRxwpV2m
	TG3yJZ6cklCoJsWxbNlsGzL6IlMl1kdxPfR/nKs9Pb6oXuT/wRrSY/CjvijdjfsAvBn85YfF1r2UL
	L6yk2Lx9an0C2co9hmqPSpmA3r8LiCGDECNLtNTrSYPGJ8ngLIcaHq7yh2hMZ2uuhWrDuvx+XU6n1
	uxqrGcFQ0Hn+SBlMgeoNHVvrvan8kjxwdlK2iwbDXYQpIteT9qTt8BXi0O+ur1GAWYesCosI+TyU/
	XuP53+psHSsv35Mcod0TZgDYfLz2U7aI+wtfb23rklrQ2E5A4pITLHkSgvI5V5aAp+q24iKqD8ILD
	z/5jbrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2X9-0000000AgWG-1vjI;
	Mon, 03 Nov 2025 21:56:15 +0000
Received: from mta1.formilux.org ([51.159.59.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2X4-0000000AgVh-24rO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 21:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762206965; bh=iCGGNMYDM+CWrXnvfp3MrePdydtXWfwLBOFLQtyEm74=;
	h=From:Message-ID:From;
	b=cdBGM9GdXTAuIPWVYd/BqCseBtO7stH1i8qgYni1YLCnT9sJVI2EOagHIo9vMH/j0
	 fiBsux1DvWsp7TBo8lsf299e+Bh4JsViT4l84Py+at1fKodg4CBP3iozbzs7N9ifRj
	 4HHraeiS0wcPqvU8UBdw/zFkM0zd+6nwqg6q20N0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id BC1C2C06ED;
	Mon, 03 Nov 2025 22:56:05 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A3Lu5XF018887;
	Mon, 3 Nov 2025 22:56:05 +0100
Date: Mon, 3 Nov 2025 22:56:05 +0100
From: Willy Tarreau <w@1wt.eu>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <20251103215605.GB18847@1wt.eu>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQkjhI4ddUGLLQbL@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQkjhI4ddUGLLQbL@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_135610_967590_CF61832A 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, Nov 03, 2025 at 09:49:56PM +0000, Catalin Marinas wrote:
> On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
> > > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
> > > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > > index 9abcc8ef3087..e381034324e1 100644
> > > > --- a/arch/arm64/include/asm/percpu.h
> > > > +++ b/arch/arm64/include/asm/percpu.h
> > > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > > >  	unsigned int loop;						\
> > > >  	u##sz tmp;							\
> > > >  									\
> > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > >  	/* LL/SC */							\
> > > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > > >  	unsigned int loop;						\
> > > >  	u##sz ret;							\
> > > >  									\
> > > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > > >  	/* LL/SC */							\
> > > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > > -----------------8<------------------------
> > > 
> > > I will give this a shot, thank you!
> > 
> > Jackpot!!!
> > 
> > This reduces the overhead to 8.427, which is significantly better than
> > the non-LSE value of 9.853.  Still room for improvement, but much
> > better than the 100ns values.
> 
> Just curious, if you have time, could you try prefetchw() instead of the
> above asm? That would be a PRFM PSTL1KEEP instead of STRM. Are
> __srcu_read_lock() and __srcu_read_unlock() usually touching the same
> cache line?

FWIW I tested PRFM PSTL1KEEP this morning on the Altra with haproxy just
out of curiosity and didn't notice a difference with PRFM PSTL1STRM. Maybe
in the kernel it will be different though.

Willy

