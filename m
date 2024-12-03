Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1630E74AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAPsM9kl1wjvCfIVk2UriqfHLpsTudX8xrOCJ684Wqc=; b=FqDjoPq22klcXOlsOmCE1gnk7V
	xYvVLo55Iu41wiO1MC+CqlF66MEvHvw7S2WxblQq4knib29s39R8yeo+/sbI8odACU3M+HMeEXFyp
	WkCur5LZioNK6BN/b2Cy9Vfqoii1FleJ7ngTHygny1E8Bic37KVL3/H3bTHgaMc6MIR1O12VI0IDy
	nFk5AVhrC2rsygLrr2lKWBGYPkvShEdfHrj0ZZx+j7oOKt4c75izkMkiITormTwM04B+eRSOlUniM
	7uKevbY8RCiCByBvnluqqDgTcUXr5GmjoNVqjRtfEJIj5Myy1tXDZHLMQlUgFskTjbiL6oojNcymx
	SLhsROTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWJd-0000000ACSl-1vP2;
	Tue, 03 Dec 2024 17:04:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWFv-0000000ABo3-4C2W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:00:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529A7FEC;
	Tue,  3 Dec 2024 09:00:39 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64CCD3F58B;
	Tue,  3 Dec 2024 09:00:10 -0800 (PST)
Date: Tue, 3 Dec 2024 17:00:08 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
Message-ID: <Z085GKS8jzEhcZdW@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
 <Z08khk6Mg6+T6VV9@e133380.arm.com>
 <9365be76-8da6-47ce-b88e-dfa244b9e5b7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9365be76-8da6-47ce-b88e-dfa244b9e5b7@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_090012_079196_6F9CB440 
X-CRM114-Status: GOOD (  24.93  )
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

On Tue, Dec 03, 2024 at 04:00:45PM +0000, Mark Brown wrote:
> On Tue, Dec 03, 2024 at 03:32:22PM +0000, Dave Martin wrote:
> > On Tue, Dec 03, 2024 at 12:45:53PM +0000, Mark Brown wrote:
> 
> > > @@ -1460,6 +1460,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
> > >  		sme_set_vq(vq_minus_one);
> > >  
> > >  		fpsimd_bind_task_to_cpu();
> > > +	} else {
> > > +		fpsimd_flush_task_state(current);
> 
> > TIF_FOREIGN_FPSTATE is (or was) a cache of the task<->CPU binding that
> > you're clobbering here.
> 
> > So, this fpsimd_flush_task_state() should have no effect unless
> > TIF_FOREIGN_FPSTATE is already wrong?  I'm wondering if the apparent
> > need for this means that there is an undiagnosed bug elsewhere.
> 
> > (My understanding is based on FPSIMD/SVE; I'm less familiar with the
> > SME changes, so I may be missing something important here.)
> 
> It's to ensure that the last recorded CPU for the current task is
> invalid so that if the state was loaded on another CPU and we switch
> back to that CPU we reload the state from memory, we need to at least
> trigger configuration of the SME VL.

OK, so the logic here is something like:

Disregarding SME, the FPSIMD/SVE regs are up to date, which is fine
because SME is trapped.

When we take the SME trap, we suddenly have some work to do in order to
make sure that the SME-specific parts of the register state are up to
date, so we need to mark the state as stale before setting TIF_SME and
returning.

fpsimd_flush_task_state() means that we do the necessary work when re-
entering userspace, but is there a problem with simply marking all the
FPSIMD/vector state as stale?  If FPSR or FPCR is dirty for example, it
now looks like they won't get written back to thread struct if there is
a context switch before current re-enters userspace?

Maybe the other flags distinguish these cases -- I haven't fully got my
head around it.


(Actually, the ARM ARM says (IMHTLZ) that toggling PSTATE.SM by any
means causes FPSR to become 0x800009f.  I'm not sure where that fits in
-- do we handle that anywhere?  I guess the "soft" SM toggling via
ptrace, signal delivery or maybe exec, ought to set this?  Not sure how
that interacts with the expected behaviour of the fenv(3) API...  Hmm.
I see no corresponding statement about FPCR.)

Cheers
---Dave

