Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41D10F92EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9AK6DIGMWYAVZmBe7u5FVPQtTZovHhLw2skFMvmSIY=; b=NjEwaaXX0zvVTCtRWqiEUaWxgl
	r0A3EN2anwXsyltCP2GmaZvOqj1qfW7yFeNy/yY91pVr3EtoM5boseRsShXBtCBaB1vOZEHiLBMi8
	hyPO7Lokj2lQiWThMCFkRh9BH8jIn0U8JZ+87KKRvIizSb3zS125PlVm/o//5NnwSPk8kTGT1SBbR
	mDsbi4aEwdEVZoyPn///oPwa3V/28KQTekLaSCT1cKa5nsolkQxejD/4DTDmHaZE2Qfe+Ae6viNJ/
	LDxJTogxp5vgeFIpSCohzByRUDjCdocSLTGjH0Qz0S0AcvkznNcdMDVykiERSpb3a/yOnNfWnfT6I
	nNUFm8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ehd-0000000DTeJ-47hJ;
	Tue, 31 Mar 2026 19:24:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ehc-0000000DTdm-04uC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 19:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D916013E;
	Tue, 31 Mar 2026 19:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10E2C2BCB0;
	Tue, 31 Mar 2026 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774985078;
	bh=Vlvq4dWngbHl7LTYF8a9wczf6DlxhM4X0LWpoPJbuYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOhKmUbG2mxRA4pZdyB0G0h2YPyBXS5l2w1TvzcJa2VYbRu4lY/6aiCc/VV4CVGtR
	 LfD+uzqtYK+KJnS5YwgBnlIzvk6u/rTBK+P1zSrK2evLMe38gsmA0iAgQtkjczI66f
	 IloyFPslOdAUitKTlHKkoGtvvXAyQh/qrYC2CAzlf95/DMMhPN9a/qiAszkkj99vHJ
	 3y0LciEYuSPx0Dqbn/MLwZWRIfHQG8rEPbFzLPFovsWU6Nf12kVsi10JmKCCM7m4cF
	 Rni1ddnsisv3NsdpqjuBqMq22L6wgT7Ok2cfPBE/pMmPygG21SCa5KJZ+GfbkO6cyD
	 laK/v2IkMeDtg==
Date: Tue, 31 Mar 2026 20:24:32 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 11/38] KVM: arm64: Split teardown hypercall into two
 phases
Message-ID: <acwfcFytYX7eHAUZ@willie-the-truck>
References: <20260330144841.26181-1-will@kernel.org>
 <20260330144841.26181-12-will@kernel.org>
 <0cf948e9-be64-4c75-97f8-a560442eb5d2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cf948e9-be64-4c75-97f8-a560442eb5d2@sirena.org.uk>
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

On Tue, Mar 31, 2026 at 08:15:40PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 03:48:12PM +0100, Will Deacon wrote:
> > In preparation for reclaiming protected guest VM pages from the host
> > during teardown, split the current 'pkvm_teardown_vm' hypercall into
> > separate 'start' and 'finalise' calls.
> > 
> > The 'pkvm_start_teardown_vm' hypercall puts the VM into a new 'is_dying'
> > state, which is a point of no return past which no vCPU of the pVM is
> > allowed to run any more.  Once in this new state,
> > 'pkvm_finalize_teardown_vm' can be used to reclaim meta-data and
> > page-table pages from the VM. A subsequent patch will add support for
> > reclaiming the individual guest memory pages.
> 
> We've started seeing WARN_ON()s generated in -next on N1DSP when running
> kvm-unit-tests under pKVM:
> 
> 1821 23:03:59.721620  <4>[   17.558270] ------------[ cut here ]------------
> 1822 23:03:59.725053  <4>[   17.558274] WARNING: arch/arm64/kvm/pkvm.c:373 at __pkvm_pgtable_stage2_unshare+0xbc/0xfc, CPU#3: qemu-system-aar/390

Aha! That's probably the thing I tried to fix today. Please can you try
these patches on top?

https://lore.kernel.org/r/20260331155056.28220-1-will@kernel.org

Thanks,

Will

