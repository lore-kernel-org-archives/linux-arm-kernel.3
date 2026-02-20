Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30062C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9NFw82XaTmgkRmb3zUbqU38MJMt9EHrWt3ALHjmW5Y=; b=3rV9QfYJGllgB04URfSE3l+b9P
	MISqDwLULuzgzin3Wbxpw4p2ci/Q+ES9ygtLYxryuPq5R9WqI6pDoA6G6h56Jr2WQpFOfxyoqiWz7
	mTg7L3DtcGiNke6Dh7J0e/iE2I2WGCM/fFo1gmoq/BmzacfkkXQXsoR9YLQh7NERmaU3F1UporZ15
	fO3jccSBk0s1dOTgqOb9NOsHB8QFZiYl3xcZnKs4pKtkX2N0+jsCL70Np6hne2ztPVJA4MXWpyZ0Z
	pLqGbbTIQXqkB1S6tWxeDL3yoxOflalsFygQdXO0PXj053JcRskF7CI2MQQJGcj4ztCsnXIq7XA7k
	gUlYmf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSjz-0000000F652-1hwc;
	Fri, 20 Feb 2026 15:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSjw-0000000F63q-2uUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:48:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE889339;
	Fri, 20 Feb 2026 07:48:16 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABB5C3F7D8;
	Fri, 20 Feb 2026 07:48:22 -0800 (PST)
Date: Fri, 20 Feb 2026 15:48:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260220154820.GG136967@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <868qcsbsbd.wl-maz@kernel.org>
 <076e013a-b66d-4985-9709-734d7184ad72@linaro.org>
 <867bscbpmp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bscbpmp.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_074824_768255_639C0A3E 
X-CRM114-Status: GOOD (  20.22  )
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

On Mon, Feb 16, 2026 at 04:49:02PM +0000, Marc Zyngier wrote:

[...]

> > > But that's *not* working. If you trace EL1 only, even with a VHE host,
> > > the result is not usable.
> > > 
> > 
> > Do you mean not working because of the missing exceptions? I did a bit
> > of testing before and the trace did seem somewhat usable to me. It had
> > EL1 and EL0 atoms in there.
> 
> Sure. Now try to look at what that means for NV, where all the
> EL1->EL2 exceptions are emulated, where all the EL2->EL1 exception
> returns are emulated.
> 
> What does it give you? A bag of nonsense.

Sorry for jumping in.

If we enable TRBE in a VM, whether nested or not, why is it necessary to
capture trace data for the exception transition between the VM and its
higher level host(s)?

Seems to me, regardless of what happens during exception emulation, once
the VM is switched out, tracing will be stopped, and then re-enabled
when the VM is switched back.  In that case, we should be able to record
the complete trace data for whatever occurs while the VM is running.

On the other hand, when launch a trace within a VM, I think we should
not trace higher level's hypervisor or hosts, this is concerned for
security leakage.

> Same thing for EL2->EL0, by the way, so you can't even correctly
> profile an EL0 program that performs a syscall, or that gets
> interrupted. And while without NV, these exceptions are rare, having a
> trace that is unreliable has the potential of being worse than no
> trace at all.
> 
> Until the architecture grows a way for KVM to inject the missing
> information into the trace, TRBE support for guest will stay out.

I agree we need to understand what is actually blocking issues for TRBE
virtualization.

Essentially, I'd confirm the methodology for trace virtualization.  I
assume it allows a higher privilege OS to trace a lower privilege OS,
but not the other way around.

Thanks,
Leo

