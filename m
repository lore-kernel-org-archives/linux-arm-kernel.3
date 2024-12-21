Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCAAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PATFMChhLOatUbs24Qo4cqgbFe2Ze6ssjZjOW46/WfE=; b=tQkQTXJyGCadSFBQ+Rxe4E2QmY
	Nd8ob+zlj1EPxhcxIyZIbjkrynPIwcyHHiMgtESXicY4HXV0lTmzQNXnzzG8atYjFkNp3871jDdDK
	yan40XPe0Jo2OQIdi/gK26n5pRj7sKQGAiu0/siX32NEhUJYNEsFCJmqRDTxzQBDIK5DWEKuyEYDK
	+X0+1P0NalsASJxVeFNT9tD6VS2+kmOyYnUuVKGB7fQjfqcF/yp8nd01aCFsm3x/uc8zcNGR0jcsb
	hF8A8f8ezJI5yijo10z0NGtJZzLgcdXldY9fWlydaIaM4FH4FH4soS/gb+M6/LFKr4Qe+kqsRG9AO
	wiMIiaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7YP-00000007U4Y-2XZ1;
	Sat, 21 Dec 2024 22:02:33 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7Wx-00000007Tug-2nFP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 22:01:04 +0000
Date: Sat, 21 Dec 2024 14:00:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734818460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PATFMChhLOatUbs24Qo4cqgbFe2Ze6ssjZjOW46/WfE=;
	b=WzuOPhXkJksF0wAENIQ9XoOTaFFCHj0JIOeK/r3zILJCMewYLuvquL3gR16FTHAvpwPULy
	OBGCZtoLmUqjLtsQ3o4Of4W8i14rywD5zqW/MijE+0R2UuWYYWh7fCmPpVym5eKdo8JOWt
	WFguTLjlNP+qeULVBqxlQeCJJHbE38A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Janne Grunau <j@jannau.net>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Message-ID: <Z2c6l1cTM7V1Jy7V@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
 <20241221134549.GA2917938@robin.jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221134549.GA2917938@robin.jannau.net>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_140103_853486_D5336123 
X-CRM114-Status: GOOD (  22.65  )
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

On Sat, Dec 21, 2024 at 02:45:49PM +0100, Janne Grunau wrote:
> On Tue, Dec 17, 2024 at 01:20:30PM -0800, Oliver Upton wrote:
> > One of the interesting features of some Apple M* parts is an IMPDEF trap
> > that routes EL1/EL0 accesses of the PMUv3 registers to EL2. This allows
> > a hypervisor to emulate an architectural PMUv3 on top of the IMPDEF PMU
> > hardware present in the CPU.
> > 
> > And if you squint, this _might_ look like a CPU erratum :-)
> > 
> > This series takes advantage of these IMPDEF traps to provide PMUv3 to
> > KVM guests. As a starting point, only expose the fixed CPU cycle counter
> > and no event counters. Conveniently, this is enough to get Windows
> > running as a KVM guest on Apple hardware.
> > 
> > I've tried to keep the deviation to a minimum by refactoring some of the
> > flows used for PMUv3, e.g. computing PMCEID from the arm_pmu bitmap
> > instead of reading hardware directly.
> > 
> > RFC -> v1:
> >  - Rebase to 6.13-rc3
> >  - Add support for 1 event counter in addition to CPU cycle counter
> >  - Don't sneak past the PMU event filter (Marc)
> >  - Have the PMU driver provide a PMUv3 -> HW event ID mapping (Marc)
> > 
> > Tested on my M2 with Linux and Windows guests. If possible, I'd
> > appreciate someone testing on an M1 as I haven't added those MIDRs to
> > the erratum yet.
> 
> Tested on M1 (t8103) with perf in a Linux guest and the patch below
> 
> Tested-by: Janne Grunau <j@jannau.net>
> 
> I'll import this into the downstream asahi kernel as there was a request
> for performance counters to aid FEX-Emu development recently.
> 
> Janne

Awesome, greatly appreciate the testing Janne. Hopefully we can get this
worked out for upstream too :)

-- 
Thanks,
Oliver

