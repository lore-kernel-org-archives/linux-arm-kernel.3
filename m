Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DC5E909A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUmIRHJ5OxybzIq3ITnR5lPzqOAOM61VegDyAtQhqBQ=; b=BwqTas3QkK22Y2JqVclkb3k9YH
	yo+GwRBwfG49OWoCYcKr4D4pIT4dPUExfuIwfFDI4bwSufIcpB5/YQiOI8NT5mlDAbR0HRrTYm0/6
	ofnWYSjzsb0YuVzGjBEeAlmDrclgoFVY+rIwqYOG8In9vLqz6qbL2z5HIrfH6FsjsiBylTWaXunyj
	2+5pfEhNPvbqxguRSIBkTdvyLIvs4xmxGS0WO6dHSX+3I13WOR2XftHlKD8zI7yZFm2CpwXVfuGpH
	s4DupQfOYRSbHlVhok/kMca+usYlV+fwDgxesBqnb+WdS/AhXHo5onQIDQV03T4eOSfd9Xfl/1PKf
	TylyRBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLvG-00000008PmA-3kfM;
	Tue, 17 Feb 2026 14:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLv9-00000008Pkl-1SjD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AAC21477;
	Tue, 17 Feb 2026 06:19:14 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6E73F62B;
	Tue, 17 Feb 2026 06:19:19 -0800 (PST)
Date: Tue, 17 Feb 2026 14:19:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260217141917.GA136967@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZNec3B0Iou9PYGw@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_061928_181146_9AABF63F 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, Feb 16, 2026 at 06:14:11PM +0000, Will Deacon wrote:

[...]

> > The TRBE driver might do an extra drain here as a workaround. Hard to tell
> > if it's actually required in this case (seems like probably not) but it
> > might be worth doing it anyway to avoid hitting the issue. Especially if we
> > add guest support later where some of the affected registers might start
> > being used. See:
> > 
> >     if (trbe_needs_drain_after_disable(cpudata))
> >         trbe_drain_buffer();
> 
> Oh great, this thing sucks even more than I realised!
> 
> But thanks for pointing that out... this is presumably erratum #2064142,
> but we probably need to look at #2038923 as well :/
> 
> I can't find any public documentation for the problems, but based on the
> kconfig text then I think we care about #2064142 so that the TRBE
> register writes when restoring the host context are effective and we
> care about #2038923 to avoid corrupting trace when re-enabling for the
> host.

Seems to me, this is correct.

> It also looks like we can't rely on the dsb(nsh) in the vcpu_run()
> path if that needs to be before the write to TRBLIMITR_EL1.
> 
> In which case, the host->guest something hideous like:
> 
> 	isb();
> 	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> 	dsb(nsh);	// I missed this in my patch
> 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> 	if (2064142) {
> 		tsb_csync();
> 		dsb(nsh);
> 	}
> 	isb();

As I_QXJZX suggests, the section K10.5.10 "Context switching" gives
the flow.  I'd suggest the VM context switch is also aligned to the
description in S_VKHHY.

When switching from host to guest, we need to clear TRCPRGCTLR.EN to
zero.  As the doc states "ETE trace compression logic is stateful,
and disabling the ETE resets this compression state".

> and then the guest->host part is:
> 
> 	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> 	isb();
> 	if (2038923)
> 		isb();
> 
> Does that look right to you?

S_PKLXF gives the flow for switching in.

Thanks,
Leo

