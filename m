Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F4C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3M9YxOcZUa74sXCLirAN+6EyYJZ3pNbhFgKbhNBWUhA=; b=lbvtrRzsn/n1v2
	m1xdgyZTxYzibzlzP/jRapJr/vFTUtFrOCbck3hbm+esOZ7Q7OQWszqSuRc/+zmNggpvG8f9XsDGt
	TXin66TEAYuP2Td7cqJLVvq8DXMsiLIgyK5zyzlg45V+drsB6l2XI2gfFfaoXk8Gu092dFmLMliJo
	LbgvVR0WFVtddb+0KgX2GhuybzKf4fK7X4AE4F97xYlKOGPf0XedkWGa4fRHN1jaD5WSgDYHLeQeN
	tXjc2q9ekzscfnlxZgqQFfj98b4cxyH57cEiNi50YuQDZaNmlxYHBO+D9R7XNeUf1WUG2oM3+8MDu
	JHuY1LJ3iCfBB0MeYciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C90-00000004rWu-2QE9;
	Tue, 08 Apr 2025 16:49:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C5t-00000004r8w-1hla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:46:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D97FB1688;
	Tue,  8 Apr 2025 09:46:35 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B77F3F6A8;
	Tue,  8 Apr 2025 09:46:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 17:46:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 00/14] arm64: Preparatory FPSIMD/SVE/SME fixes
Message-ID: <Z_VS5wvn0C7tdjbo@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45cb5ce9-39af-4c42-b68d-fa506b67bc55@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_094637_518729_AA946B8C 
X-CRM114-Status: GOOD (  23.22  )
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

On Fri, Apr 04, 2025 at 07:06:50PM +0100, Mark Brown wrote:
> On Fri, Apr 04, 2025 at 06:44:21PM +0100, Mark Rutland wrote:
> 
> > * The ptrace ABI for SME is written around the assumption that
> >   SVE_PT_REGS_FPSIMD and SVE_PT_REGS_SVE are separate bit flags, whereas
> >   in reality these are different values (0 and 1 respectively) for
> >   bit 0 of the user_sve_header flags.
> 
> The documentation definitely doesn't reflect what actually got
> implemented, IIRC the errors are more around returning the header only
> rather than the assumption that they're separate flags but at this point
> it doesn't really matter given that the documentation is clearly wrong.

I think it matters because the kernel code was also written to that
incorrect assumption, and the reason the effective behaviour differs
from the documented behaviour is because the assumption is incorrect.
This means portions of the code are wildly misleading, and this caused
secondary problems such as providing register data when we didn't intend
to, which I assume is what you mean by "the errors are more around
returning the header only".

From a quick scan, both GDB and LLVM determine whether streaming mode is
active based on whether the NT_ARM_SSVE header indicates
SVE_PT_REGS_SVE. We can make that work, but it doesn't work in all cases
today (see below).

> >   I haven't yet worked through all of the implications of this, but
> >   AFAICT we can't reliably indicate the value of PSTATE.SM, and
> >   userspace cannot reliably save/restore a task's state in all cases.
> 
> Userspace should be able to read by looking the SSVE registers, if you
> get SVE format register state back you're in streaming mode. Streaming
> mode state will always be saved in SVE format so a read of streaming SVE
> vector state will come out with the SVE bit set, if we're not in
> streaming mode it won't be set.

Unfortunately, that's not always true today.

While fpsimd_save_user_state() will save streaming mode state into the
FP_STATE_SVE format, other code can manipulate the task into a state
where thread_sm_enabled() is true, but the task's registers are saved in
the FPSIMD format. That combination is broken for a number of reasons,
but you seemed to permit this deliberately in commit:

  bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register state")

... which says:

| Now that we track the type of the stored register state separately
| to what is active in the task, it is valid to have the FPSIMD
| register state stored while in streaming mode. 

I will assume that commit message is misleading, and that we do not want
to permit that case. It's possible to get a task into a bad state
regardless of that commit.

We can fix that in a number of ways, but we need to think of the shape
of ABI we actually want, e.g. whether writes to NT_ARM_SSVE with
SVE_PT_REGS_FPSIMD should be rejected outright.

> For writes writing to the SVE register set will disable streaming mode,
> writes to the streaming SVE register set will enable it.

Yep.

Mark.

