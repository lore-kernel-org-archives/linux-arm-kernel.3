Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5599BCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 18:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idff2GCr/rgl9LEAxhtfcLAWSFytNVfJ+A3pEkgTlyo=; b=BcgwGY4vDp7hDMlgST59JVBaK0
	wh+L1J3prIShMqrD/J1LUQkAH7zVJxbPClPetyUs/tqBvpbdmJq4JuNf2jih0dQHahzV21HosbdIt
	7DoAUqht5LB8F+g/46ZOiCHeQo/652XEYGTNTK45J5k9jxzenb4X763g8mfUZbrsod+BhIdUOjuAA
	hTMoQfAVVINONWcwKEKiPQVHGmIRo1SKI1ZLPm6ZQw/nH2g7eJ1aJAgKQTvNoiSai9iRSfDfJc8jS
	4+KFdGV+s9GSga5utRFfxjOBZf/fdev5s9MrAyYlesjHLyVbvFYOtFzhw7FzAHwbsRIaQqaE66r3x
	8Gd2PWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFG0h-00000007zm9-1d5O;
	Sat, 01 Nov 2025 18:07:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFG0f-00000007zm2-2aE7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 18:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D6F4601D9;
	Sat,  1 Nov 2025 18:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA86C4CEF1;
	Sat,  1 Nov 2025 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762020447;
	bh=0wCFmmZDYfWqDHSMAygYf7Vtd7wmxoh1/pbxjGPybV0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=aZ1YKnYN+9lnQ1yASx7GW7Kxd10+Vw20rwdZhKT+3KsoUZ4tgo5a+jiYc61EqUArY
	 BGoQ+6KJ2CR4FWF8zI5Lvuvi6SwsfODf7fWU/waa4wbSOvl3ik9zirnlXZGQ1MCPy+
	 I3g0HG4j4NPQJAmuGBvqEQeAjikQMfRFGq4KZamkcxXIFsUYitj3vG3c9cf7Pm8/ur
	 lNMHAzBIoJ7Kj9Uz7jYFzQiE2rmJPnqCLPnuL89bT3hfWQahgjrb3WLPdHv78mtkZZ
	 p2FjIRv46wYlAmymRhWXI+7ebzfu0qgEhTDZ2Tq0Tnh2qlz1tDZkDYcxd3cKVi7kPH
	 eSppVwwgugtkQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 92D6BCE0BA5; Sat,  1 Nov 2025 11:07:26 -0700 (PDT)
Date: Sat, 1 Nov 2025 11:07:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <c5ceff22-08b4-48e7-801b-824397b3c4e7@paulmck-laptop>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <20251101094448.GA28965@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101094448.GA28965@1wt.eu>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Nov 01, 2025 at 10:44:48AM +0100, Willy Tarreau wrote:
> Hi!
> 
> On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> > > > -----------------8<------------------------
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
> This is super interesting! I've blindly applied a similar change to all
> of our atomics in haproxy and am seeing a consistent 2-7% perf increase
> depending on the tests on a 80-core Ampere Altra (neoverse-n1). There
> as well we're significantly using atomics to read/update mostly local
> variables as we avoid sharing as much as possible. I'm pretty sure it
> does hurt in certain cases, and we don't have this distinction of per_cpu
> variants like here, however that makes me think about adding a "mostly
> local" variant that we can choose from depending on the context. I'll
> continue to experiment, thanks for sharing this trick (particularly to
> Yicong Yang, the original reporter).

Agreed!

And before I forget (again!):

Tested-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

