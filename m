Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60775E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YldMD6AO6cWhmK0HNGndxAie+TN7T6jfuhzSfeZi77g=; b=bhkmWCwwngGBX1zdGVubo+qAyO
	EuulqeAVutblxvGKt7lDI8ttw8lrahJakVOg/xo6y+Eoe/9p1ebXWvY4mQ/Gg2tehCLgYGSen5VMD
	XrsvwEPDAuYncA7KPx8gP/4jtcovxWl09TIukgxJny1zioptQZm8yi+xLV8mslgoMuUlY1s1oHOah
	jDY22LZ3952i04sJ/PKcS2m6y/0NNfvVEAkhxLIgnWKYmImB6vwnr9NFQLHr8LTcAgBC7SwbOBqWV
	TZ9BuR4sdPgq6+7bIuLf6fqG/vfv8MjEo6zR6/eMEcXHr9aG19a6V6frd+qH2d0Xc06jMmUWRVcku
	oQnUztxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIndx-0000000COkM-2Ieq;
	Wed, 04 Dec 2024 11:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIncw-0000000COcf-40PO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:33:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC120FEC;
	Wed,  4 Dec 2024 03:33:33 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9C33F71E;
	Wed,  4 Dec 2024 03:33:04 -0800 (PST)
Date: Wed, 4 Dec 2024 11:33:02 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
Message-ID: <Z1A97pR+un1Trtyg@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
 <Z08khk6Mg6+T6VV9@e133380.arm.com>
 <9365be76-8da6-47ce-b88e-dfa244b9e5b7@sirena.org.uk>
 <Z085GKS8jzEhcZdW@e133380.arm.com>
 <44d67835-1e43-47cc-9a18-c279c885dcec@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44d67835-1e43-47cc-9a18-c279c885dcec@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_033307_077062_0D081116 
X-CRM114-Status: GOOD (  34.28  )
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

On Tue, Dec 03, 2024 at 05:24:39PM +0000, Mark Brown wrote:
> On Tue, Dec 03, 2024 at 05:00:08PM +0000, Dave Martin wrote:
> > On Tue, Dec 03, 2024 at 04:00:45PM +0000, Mark Brown wrote:

[...]

> We know that the only bit of register state which is not up to date at
> this point is the SME vector length, we don't configure that for tasks
> that do not have SME.  SVCR is always configured since we have to exit
> streaming mode for FPSIMD and SVE to work properly so we know it's
> already 0, all the other SME specific state is gated by controls in
> SVCR.
> 
> > fpsimd_flush_task_state() means that we do the necessary work when re-
> > entering userspace, but is there a problem with simply marking all the
> > FPSIMD/vector state as stale?  If FPSR or FPCR is dirty for example, it
> > now looks like they won't get written back to thread struct if there is
> > a context switch before current re-enters userspace?
> 
> > Maybe the other flags distinguish these cases -- I haven't fully got my
> > head around it.
> 
> We are doing fpsimd_flush_task_state() in the TIF_FOREIGN_FPSTATE case
> so we know there is no dirty state in the registers.

Ah, that wasn't obvious from the diff context, but you're right.

I was confused by the fpsimd_bind_task_to_cpu() call; I forgot that
there are reasons to call this even when TIF_FOREIGN_FPSTATE is clear.
Perhaps it would be worth splitting some of those uses up, but it would
need some thinking about.  Doesn't really belong in this series anyway.

> > (Actually, the ARM ARM says (IMHTLZ) that toggling PSTATE.SM by any
> > means causes FPSR to become 0x800009f.  I'm not sure where that fits in
> > -- do we handle that anywhere?  I guess the "soft" SM toggling via
> 
> Urgh, not seen that one - that needs handling in the signal entry path
> and ptrace.  That will have been defined while the feature was being
> implemented.  It's not relevant here though since we are in the SME
> access trap, we might be trapping due to a SMSTART or equivalent
> operation but that SMSTART has not yet run at the point where we return
> to userspace.
> 
> > ptrace, signal delivery or maybe exec, ought to set this?  Not sure how
> > that interacts with the expected behaviour of the fenv(3) API...  Hmm.
> > I see no corresponding statement about FPCR.)
> 
> Fun.  I'm not sure how the ABI is defined there by libc.

I guess this should be left as-is, for now.  There's an argument for
sanitising FPCR/FPSR on signal delivery, but neither signal(7) nor
fenv(3) give any clue about the expected behaviour...

For ptrace, the user has the opportunity to specify exactly what they
want to happen to all the registers, so I suppose it's best to stick to
the current model and require the tracer to specify all changes
explicitly rather than add new magic ptrace behaviour.

Not relevant for this series, in any case.

Cheers
---Dave

