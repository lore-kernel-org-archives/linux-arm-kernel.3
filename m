Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C46ACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPd5s07Wz1T5kgRM9kUsjgiX0HrnPwVC/4KrAzB1vt4=; b=p91QDSuuA36deQYEEaSqxHtMd4
	lBbxBE8HbWtr8YjtxOxbujEIj5r5DHpDmot7EBIZhaSuNsfXxrTqA+J7Fflgp2/8qbRoCqUnM0FX4
	OD9Yq7h8d9Besa7AeaMn2wgREw37F2DpJVZijN84nXGCwN7xqDpVgdZ1cON7AevwbjNfbArVEkzrv
	G6y+cSa6XjHUR1ewE/OtGk0ko4Ac5k59GnIwuVZ2tD1XgrK0nUSiFxwV79NsxHkFoFU7XLs2xbglt
	KPM1Vm2M2TOK+OWT06yuqit0HE0k4KDQzhCG0nEL3U2xj6nN65CHnh+AEV1wa8DQjKzde9kAtV9gP
	X9kdbpmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGizw-0000000EIMh-06EK;
	Wed, 05 Nov 2025 19:16:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGizu-0000000EIMZ-3eIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 19:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E43EB60229;
	Wed,  5 Nov 2025 19:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF9C116B1;
	Wed,  5 Nov 2025 19:16:44 +0000 (UTC)
Date: Wed, 5 Nov 2025 19:16:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQuimp4CRywdy97S@arm.com>
References: <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
 <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
 <aQuGR1fx2qBrJSA-@arm.com>
 <8ef2390c-e805-4b8c-8417-88a6762f9a54@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ef2390c-e805-4b8c-8417-88a6762f9a54@paulmck-laptop>
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

On Wed, Nov 05, 2025 at 09:40:32AM -0800, Paul E. McKenney wrote:
> On Wed, Nov 05, 2025 at 05:15:51PM +0000, Catalin Marinas wrote:
> > On Wed, Nov 05, 2025 at 08:25:51AM -0800, Paul E. McKenney wrote:
> > > On Wed, Nov 05, 2025 at 03:34:21PM +0000, Catalin Marinas wrote:
> > > > Given that this_cpu_*() are meant for the local CPU, there's less risk
> > > > of cache line bouncing between CPUs, so I'm happy to change them to
> > > > either use PRFM or LDADD (I think I prefer the latter). This would not
> > > > be a generic change for the other atomics, only the per-CPU ones.
> > > 
> > > I have easy access to only the one type of ARM system, and of course
> > > the choice must be driven by a wide range of systems.  But yes, it
> > > would be much better if we can just use this_cpu_inc().  I will use the
> > > non-atomics protected by interrupt disabling in the meantime, but look
> > > forward to being able to switch back.
> > 
> > BTW, did you find a problem with this_cpu_inc() in normal use with SRCU
> > or just in a microbenchmark hammering them? From what I understand from
> > the hardware folk, doing STADD in a loop saturates some queues in the
> > interconnect and slows down eventually. In normal use, it's just a
> > posted operation not affecting the subsequent instructions (or at least
> > that's the theory).
> 
> Only in a microbenchmark, and Breno did not find any issues in larger
> benchmarks, so good to hear!
> 
> Now, some non-arm64 systems deal with it just fine, but perhaps I owe
> everyone an apology for the firedrill.

That was a useful exercise, I learnt more things about the arm atomics.

> But let me put it this way...  Would you ack an SRCU patch that resulted
> in 100ns microbenchmark numbers on arm64 compared to <2ns numbers on
> other systems?

Only if it's backed by other microbenchmarks showing significant
improvements ;).

I think we should change the percpu atomics, it makes more sense to do
them near, but I'll keep the others as they are. Planning to post a
proper patch tomorrow and see if Will NAKs it ;) (I've been in meetings
all day). Something like below but with more comments and a commit log:

------------------------8<--------------------------
diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087..d4dff4b0cf50 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
 	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse "\t%" #w "[val], %[ptr]\n"			\
+		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
 		__nops(3))						\
 	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
 	  [ptr] "+Q"(*(u##sz *)ptr)					\
@@ -124,9 +124,9 @@ PERCPU_RW_OPS(8)
 PERCPU_RW_OPS(16)
 PERCPU_RW_OPS(32)
 PERCPU_RW_OPS(64)
-PERCPU_OP(add, add, stadd)
-PERCPU_OP(andnot, bic, stclr)
-PERCPU_OP(or, orr, stset)
+PERCPU_OP(add, add, ldadd)
+PERCPU_OP(andnot, bic, ldclr)
+PERCPU_OP(or, orr, ldset)
 PERCPU_RET_OP(add, add, ldadd)
 
 #undef PERCPU_RW_OPS


