Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF496E909B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAfTNrmbEbrqCj355svFgP7yeQnDzCNVAF5tbyMQ9VU=; b=G/FJI79GsYHDeewdBp9JWYfiwi
	1L+bUB5nMQGSD+XTNqoSKoxUBdl4a4glk5RzAVCMz8BaE/9vm722IZ6RjugzWtgmabyVqvbC/uZB/
	yGpcOq/RSLBkoS/a+A/hXpK87ezZk9GMZi4cJnzSu/Ea6bk7tF13H1OJYt6VfJsvHFHiTT6p7q3Zd
	RWWIMKT/ldJi2RHdngEC3QjEH9E9XgYnVtExkp9tWa2rrpWuaZGv6Yg2adMI4+//0YwE2v0BVaqW/
	HBdD9B2SctUHG0v1200BXWXCu8U9JXMAZvhc/Gj6ZWTQiaoh8m/BKEw+gYoiA+hI9hBvcb2VydphM
	W5VH9IxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMRL-00000008T7L-3n0b;
	Tue, 17 Feb 2026 14:52:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMRK-00000008T7B-3wOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB7461334;
	Tue, 17 Feb 2026 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE844C4CEF7;
	Tue, 17 Feb 2026 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771339957;
	bh=ZP+KYsRvEF5ApvHchr0EfNzRlljIbjaP/4zVMzS25Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkPendG5QIVTlKIjhshbQ6Num6+ZT5R8+Qw5Ka++bkV64I31aTaROkwCPDr2ILI1c
	 6jqwN7HEdnfzrsH8pJttPEOa8SHqGv5xJMJilihNi9rWEIyyL8AbSFj40h3BM2x4DV
	 YTKFkhFTPL/kbtYeSLpIvEQWQkJTy+XsSBHOkFDYrNt+XNkdxC9QmjzgEUTegNnuWo
	 FyX3qNDOVcEjsl+uP2AK7+tfKDdZHDs1a0nbW3xeW5d7k0KnN/Jads5dUu4K0q8shH
	 j+OekI6HtJUQ3rNsQG/GPKjAv2pnRlq5A8TMGxHAPfXaiCsGC+3MNsX/4i1kf8gpOC
	 DO6pu6kv8NnNQ==
Date: Tue, 17 Feb 2026 14:52:32 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZSAsC1YI5_lK3e0@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217141917.GA136967@e132581.arm.com>
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

On Tue, Feb 17, 2026 at 02:19:17PM +0000, Leo Yan wrote:
> On Mon, Feb 16, 2026 at 06:14:11PM +0000, Will Deacon wrote:
> 
> [...]
> 
> > > The TRBE driver might do an extra drain here as a workaround. Hard to tell
> > > if it's actually required in this case (seems like probably not) but it
> > > might be worth doing it anyway to avoid hitting the issue. Especially if we
> > > add guest support later where some of the affected registers might start
> > > being used. See:
> > > 
> > >     if (trbe_needs_drain_after_disable(cpudata))
> > >         trbe_drain_buffer();
> > 
> > Oh great, this thing sucks even more than I realised!
> > 
> > But thanks for pointing that out... this is presumably erratum #2064142,
> > but we probably need to look at #2038923 as well :/
> > 
> > I can't find any public documentation for the problems, but based on the
> > kconfig text then I think we care about #2064142 so that the TRBE
> > register writes when restoring the host context are effective and we
> > care about #2038923 to avoid corrupting trace when re-enabling for the
> > host.
> 
> Seems to me, this is correct.
> 
> > It also looks like we can't rely on the dsb(nsh) in the vcpu_run()
> > path if that needs to be before the write to TRBLIMITR_EL1.
> > 
> > In which case, the host->guest something hideous like:
> > 
> > 	isb();
> > 	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> > 	dsb(nsh);	// I missed this in my patch
> > 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> > 	if (2064142) {
> > 		tsb_csync();
> > 		dsb(nsh);
> > 	}
> > 	isb();
> 
> As I_QXJZX suggests, the section K10.5.10 "Context switching" gives
> the flow.  I'd suggest the VM context switch is also aligned to the
> description in S_VKHHY.

I honestly have a hard time believing the sequence in S_VKHHY as the DSB
seems to be in the wrong place which means the TSB CSYNC can float. It
also isn't aligned with what the EL1 driver does...

> When switching from host to guest, we need to clear TRCPRGCTLR.EN to
> zero.  As the doc states "ETE trace compression logic is stateful,
> and disabling the ETE resets this compression state".
> 
> > and then the guest->host part is:
> > 
> > 	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> > 	isb();
> > 	if (2038923)
> > 		isb();
> > 
> > Does that look right to you?
> 
> S_PKLXF gives the flow for switching in.

Well, modulo errata, sure. I don't have access to the errata document so
I was more interested in whether I got that right...

Will

