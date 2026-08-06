Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC29EC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OloLxCbCdCb2VJxUTkF5CFkFEV6FsO0774Maxxh1ZoY=; b=Wtj2Sj7ahvFZd8RCPdCVzp2wLp
	0b5Qg19NzeQTIzndZJ8mTVqzf0KAXrDlMb5r2fQPMx3a47Pfep8WYOD5xi/swh8pECe4VdkgJ2Rrf
	eHGh9C2vBlWu58+F1CXr2tWUj4bhnn2kOaQddZnCrEn0smqSPk6kVnMk9ahOTENyWd1vmxAdXiFml
	M/lvJHrODTDjuyLFm207QCF2bmW8VfjvMIGY85rnNxF4kP/WojW+QCT2FWsyGpmGNs6aRBc4UHGae
	TbbxKbk4Ex/oXiNiocXdbHk71d7KozptVXKZUh/kCJPpxFUZrVfCMdfvwpn8eKEwP+eL56FT2WYc7
	JrFwOQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qd-00000006NAh-49GV;
	Thu, 06 Aug 2026 17:25:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qc-00000006N9a-1IzJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFE7A4016A;
	Thu,  6 Aug 2026 17:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F751F000E9;
	Thu,  6 Aug 2026 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037137;
	bh=OloLxCbCdCb2VJxUTkF5CFkFEV6FsO0774Maxxh1ZoY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lmYLAD/RHaxZCZPZm4FSrcVFJpGcoW9uX18QFiGjczPvA4K89swvlYElZZLft9N0T
	 aqpRcR0zFprcNQNwq6K8rF+YrQeQj2PFnI9PqUkVMGM1tNfwoM+yrKUB7oxOHs9I59
	 kFp5JrHFpJyowHkTGqjZENaSFZ+h4mTLTiNb5kYhUV/B5fRr1A79XpVD1F7hogI/iS
	 v9q1tC5Ey2wgxZt/ILAPnxk3dwEZQWTt6y/42S7A2n6c86gPH4I80gZT+TGylac2kO
	 NyWruh8uuzI/GjUDtwyx9z8vnvWjTBMkFuM0ITTJ9FOdpzmwHfWhYM038b6i/Qsge4
	 Qq9IG8wQf25Hw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5D4C5CE19F3; Thu,  6 Aug 2026 10:25:37 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:25:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
References: <d345dc9f-c61e-4db5-a342-11b0ff3fb846@paulmck-laptop>
 <amyaRXx8zXxOMgTL@J2N7QTR9R3>
 <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anR28GyRtCpApQYX@willie-the-truck>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 06, 2026 at 12:58:40PM +0100, Will Deacon wrote:
> Hi Paul,
> 
> On Fri, Jul 31, 2026 at 11:39:14AM -0700, Paul E. McKenney wrote:
> > On Fri, Jul 31, 2026 at 09:44:16AM -0700, Paul E. McKenney wrote:
> > > On Fri, Jul 31, 2026 at 01:51:26PM +0100, Mark Rutland wrote:
> > > > Hi Paul,
> > > > 
> > > > On Thu, Jul 30, 2026 at 04:59:57PM -0700, Paul E. McKenney wrote:
> > > > > The .need_resched field can be accessed from both task level and
> > > > > from interrrupt handlers, so apply WRITE_ONCE() to the update in
> > > > > set_preempt_need_resched().  This also brings arm64 in line with s390
> > > > > (which uses atomic operations) and x86 (which uses inline assembly).
> > > > > Other architectures avoid this issue via the empty definition in
> > > > > include/asm-generic/preempt.h.
> > > > > 
> > > > > KCSAN located this issue.
> > > > 
> > > > Do you have the KCSAN splat to hand? Seeing the exact race (and the
> > > > relevant reader(s)) would be handy.
> > > > 
> > > > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > > Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> > > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > > Cc: <linux-arm-kernel@lists.infradead.org>
> > > > > 
> > > > > ---
> > > > >  preempt.h |    2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> > > > > index 932ea4b6204289..610853da140a78 100644
> > > > > --- a/arch/arm64/include/asm/preempt.h
> > > > > +++ b/arch/arm64/include/asm/preempt.h
> > > > > @@ -28,7 +28,7 @@ static inline void preempt_count_set(u64 pc)
> > > > >  
> > > > >  static inline void set_preempt_need_resched(void)
> > > > >  {
> > > > > -	current_thread_info()->preempt.need_resched = 0;
> > > > > +	WRITE_ONCE(current_thread_info()->preempt.need_resched, 0);
> > > > >  }
> > > > 
> > > > I was under the impression that we only used this in a context where we
> > > > couldn't have a nested writer (e.g. within a scheduler IRQ hook, with
> > > > IRQs disabled).
> > > > 
> > > > If we have concurrent writers, this is probably broken regardless of
> > > > whether it is single-copy-atomic, and I worry WRITE_ONCE() will mask a
> > > > bug.
> > > > 
> > > > If you can share the KCSAN splat, that'd really help.
> > > 
> > > Let me regenerate it...
> > 
> > And please see below.
> > 
> > > > I think we need READ_ONCE() in test_preempt_need_resched(), but today
> > > > that's only used by tracing to determine what to log.
> > > 
> > > I do have tracing enabled on some of my runs.
> > 
> > I did build with CONFIG_TRACEPOINTS=y.  Or let me know what sort of tracing
> > you are interested in.  Or I can send you this guy from my ARM test system:
> > 
> > tools/testing/selftests/rcutorture/res/2026.07.31-10.25.08-torture/results-rcutorture-kcsan/TREE01/.config
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > [  738.696166] BUG: KCSAN: data-race in __delay / set_need_resched_current
> > [  738.696184]
> > [  738.696188] read (marked) to 0xffff000005899b48 of 8 bytes by interrupt on cpu 8:
> > [  738.696198]  __delay+0xb0/0x378
> > [  738.696212]  __udelay+0x4c/0x60
> > [  738.696225]  kcsan_setup_watchpoint+0x3b4/0x820
> > [  738.696238]  __tsan_unaligned_write4+0x228/0x26c
> > [  738.696249]  set_need_resched_current+0x138/0x1a8
> > [  738.696260]  rcu_exp_handler+0x418/0x4a0
> > [  738.696273]  __flush_smp_call_function_queue+0x36c/0x4a0
> > [  738.696288]  generic_smp_call_function_single_interrupt+0x20/0x30
> 
> This is a bit weird -- it looks like the read is occuring from within
> kcsan itself?

Ah, you are right, as part of KCSAN's software watchpoints.

What do you suggest?

							Thanx, Paul

