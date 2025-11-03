Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8D2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUsXEWEh/5KNXnE1WdqsAA9w86Qy5u32JRZ2Qc848lM=; b=oe1TS19poCNjKhj3Oqb6YxodYr
	8B+HEwVlsBW2DxKj4LKrxemoLP4S2/X7QB1phP4JXZpP3oa2pkG1ZmDGM5E758ASmlVWKQzube+1J
	VWHu4d4kSxWPmdVsjuMVz+nElJRCZMdzLwfIkqLNmEtnYD0tIkY/MZyCcMAd7jRnqdggk7c+TYvQT
	xHbJ1HlPtDIBWkmEU3FKAN56FuHiUg3CQ52fWtRbGnOe7QZZKBst0RSBcQoNn69YWJyfEqZYR13Ms
	iKH0b06ZT3tfmkJ9LHekFA9rDUaX0DiAMiRWznXFvGDzyObnwq6Bpi5n431N0yIsJJ7TbCqCma4xR
	hFqDrAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2RB-0000000AgBK-2p2o;
	Mon, 03 Nov 2025 21:50:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2R7-0000000Ag9X-3P8d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 21:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DF7243D56;
	Mon,  3 Nov 2025 21:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F129EC4CEE7;
	Mon,  3 Nov 2025 21:49:58 +0000 (UTC)
Date: Mon, 3 Nov 2025 21:49:56 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQkjhI4ddUGLLQbL@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_135001_878132_E2E7F991 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
> > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > index 9abcc8ef3087..e381034324e1 100644
> > > --- a/arch/arm64/include/asm/percpu.h
> > > +++ b/arch/arm64/include/asm/percpu.h
> > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > >  	unsigned int loop;						\
> > >  	u##sz tmp;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > >  	unsigned int loop;						\
> > >  	u##sz ret;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > -----------------8<------------------------
> > 
> > I will give this a shot, thank you!
> 
> Jackpot!!!
> 
> This reduces the overhead to 8.427, which is significantly better than
> the non-LSE value of 9.853.  Still room for improvement, but much
> better than the 100ns values.

Just curious, if you have time, could you try prefetchw() instead of the
above asm? That would be a PRFM PSTL1KEEP instead of STRM. Are
__srcu_read_lock() and __srcu_read_unlock() usually touching the same
cache line?

Thanks.

-- 
Catalin

