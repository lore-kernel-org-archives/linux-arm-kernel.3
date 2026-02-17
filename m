Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3FAE9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQDWoPmS0Fu8be+Sd/3K3vJD2836HWO+zN3GKlVA4EM=; b=YaCjwh6/UdmL6WPKDTYcScP70K
	x9SAE9gRbRpziluraJzJXpJUogcrgqcy73PWllkOAPn9IImQ7IN64yukdbBGvKCswLxFCDOcm0s/Y
	Jho73WiiODVTxUooF2b5BCG2GcyZO4nWnSgZAgSjcV+KaapK5PcDFpiFwbQEpb0FKv1PxBfCHrii6
	VoUARSoR+KQM1zpf/WJz0ColJEJIkbBlapvvVuaRAiXuURPPb6f7Xqf9FlXE+McalbtdIwritlW3g
	6GqCB9wGGzWU7Lg72uLL50yslzYqvYSrQ3MOYY9ZO/hktMuYoBPIeNW/UseSK/ndv6Bf2OVPxkI3Z
	Yb3xQaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQKA-00000008mKC-0D6A;
	Tue, 17 Feb 2026 19:01:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQK7-00000008mJR-3A83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 19:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 253821477;
	Tue, 17 Feb 2026 11:01:18 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29513F7F5;
	Tue, 17 Feb 2026 11:01:23 -0800 (PST)
Date: Tue, 17 Feb 2026 19:01:21 +0000
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
Message-ID: <20260217190121.GB136967@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZSAsC1YI5_lK3e0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_110127_833314_B3760B9E 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, Feb 17, 2026 at 02:52:32PM +0000, Will Deacon wrote:

[...]

> > > It also looks like we can't rely on the dsb(nsh) in the vcpu_run()
> > > path if that needs to be before the write to TRBLIMITR_EL1.
> > > 
> > > In which case, the host->guest something hideous like:
> > > 
> > > 	isb();
> > > 	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> > > 	dsb(nsh);	// I missed this in my patch
> > > 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> > > 	if (2064142) {
> > > 		tsb_csync();
> > > 		dsb(nsh);
> > > 	}
> > > 	isb();
> > 
> > As I_QXJZX suggests, the section K10.5.10 "Context switching" gives
> > the flow.  I'd suggest the VM context switch is also aligned to the
> > description in S_VKHHY.
> 
> I honestly have a hard time believing the sequence in S_VKHHY as the DSB
> seems to be in the wrong place which means the TSB CSYNC can float. It
> also isn't aligned with what the EL1 driver does...

Sorry for confusion.  I am checking internally for the flow suggested
in S_VKHHY.

> > When switching from host to guest, we need to clear TRCPRGCTLR.EN to
> > zero.  As the doc states "ETE trace compression logic is stateful,
> > and disabling the ETE resets this compression state".
> > 
> > > and then the guest->host part is:
> > > 
> > > 	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
> > > 	isb();
> > > 	if (2038923)
> > > 		isb();
> > > 
> > > Does that look right to you?
> > 
> > S_PKLXF gives the flow for switching in.
> 
> Well, modulo errata, sure. I don't have access to the errata document so
> I was more interested in whether I got that right...

Please see the doc:
https://developer.arm.com/documentation/SDEN-1873351/1900/?lang=en

Thanks,
Leo

