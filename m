Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWIzIpH8a00nMIO23YrefbZEhT8NbDGs3/Ve9oenG9g=; b=iU8lYZxZB6cF67TwK0oD5B+kMt
	9ezfJv/7z0VULVOEWADGrLS2xevVrwzwZhXe2Zaz5qfvnXm/Kv+mjNtuoceU65xgTr7zk2PQEEwhY
	ZjAG//bzy35RdmaIAEp1cA9F/OuxiQPmdgm5VZcEUDZv+ZjPjpZCYAKAaFslB2pmP361RKMDSJCVp
	z/vHensGH4Yg6wRuXAs/TbKuc6uUR4clrw9sTwDdYdCrdFB+YLCgydZ2xKCFn/IYwj/KWX+vvlcgl
	A3DH0FIngTnrvmJp8KtiuY5Y1aCz+TOWBFarAf4hsD02rbJtkK4dKysVde8kIcRLuXwp5PKd1jnwe
	SF+vwPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAOv-0000000Fd9E-1slJ;
	Tue, 07 Jul 2026 18:20:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAOu-0000000Fd93-1B57
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 18:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47E1460018;
	Tue,  7 Jul 2026 18:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF961F000E9;
	Tue,  7 Jul 2026 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783448407;
	bh=AWIzIpH8a00nMIO23YrefbZEhT8NbDGs3/Ve9oenG9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ep0suLijWN3eWlVd2Fpqz+yCycdYo+MNXSN0RmNnb84pJ7Ym/zvlHhZ+yQCzN7Fln
	 mBRJ2yMJDx9RWbXnfb1dBoY+nskN7XRxrU3hfUM99tCczOI2mCyvieaC61VDUbyyml
	 1z2swx2WCvXQFjqpB3T2YArm4OfIGpw0hV9mr5reikdj4MpRhuK3BSQt/l3/RwWO9V
	 PxLSCgIAFC2hf+yYA+dBuRxho7Qh57l7zrQNFjmhlgUP7aSj597ytZycegiTG+FMuq
	 RS8diYtYN1HGOY9ZestohQsiYB9rBLFD+L8zfbiw6Zsf5p/TJoaARjDEFzGzGrAGL4
	 UaN10YmI1I4mw==
Date: Tue, 7 Jul 2026 11:20:05 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
Message-ID: <ak1DVUs0bgkpZh0N@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvgIWqBjAp_VA_A@kernel.org>
 <e03f17b2-a765-4912-adf6-3da26e7eeecd@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e03f17b2-a765-4912-adf6-3da26e7eeecd@rsg.ci.i.u-tokyo.ac.jp>
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

On Tue, Jul 07, 2026 at 08:08:03PM +0900, Akihiko Odaki wrote:
> On 2026/07/07 2:04, Oliver Upton wrote:
> > Hi,
> > 
> > On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
> > > Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
> > > PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
> > > That covers systems where PMUv3 is absent or non-uniform, as well as
> > > systems where IMPDEF PMUv3 sysreg traps are unavailable.
> > > 
> > > However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
> > > sysregs, but the pPMUs registered with KVM only cover a subset of
> > > possible CPUs.
> > > 
> > > Reject vPMU unless the registered pPMUs cover every possible CPU.
> > > This avoids carrying support for partial pPMU coverage into the
> > > fixed-counters-only UAPI introduced later in the series.
> > 
> > Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
> > have a PMU after creating the VM.>
> > I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
> > system feature. That way any CPU which breaks the system-wide assumption
> > cannot be onlined.
> 
> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS only says that IMPDEF PMUv3 sysregs are
> trapped. It does not say that KVM has a driver-backed PMU usable for PMUv3
> emulation. This patch checks that extra requirement.
> 
> I re-checked CPU hotplug. Onlining a CPU without a PMU later does not make
> an accepted VM unsafe, since the check is against cpu_possible_mask.

Sorry, I missed that this was against the possible mask.

> The problem is the reverse case on ACPI: this check can disable vPMU when a
> possible CPU is offline. DT populates supported_cpus at boot, while ACPI
> initially populates it only from online CPUs and grows it as matching CPUs
> come online.
> 
> That makes this patch too conservative. In practice, I do not expect systems
> to mix CPUs with and without a usable PMU. A better approach is probably to
> treat such a host as out of spec and add TAINT_CPU_OUT_OF_SPEC. We already
> do that for architectural PMUv3 by detecting mismatches in
> ID_AA64DFR0_EL1.PMUVer; we can do the same for
> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS with non-standard PMUs.

The presence of the workaround is, by definition, out of spec. I just
never bothered tainting the kernel because these machines are already
TAINT_CPU_OUT_OF_SPEC by way of the broken VGIC.

Ok, so how about you keep the check that you're doing here and promote
IMPDEF_TRAPS to a system-wide feature? That would satisfy the two
preconditions we have for PMU emulation, which is system register traps
and a backing arm_pmu that understands PMUv3 events.

Thanks,
Oliver

