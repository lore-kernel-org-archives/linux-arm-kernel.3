Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A930CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWHMpsxWnohP4Px+QryuliaXaq7V2BV1HAII16bRoaE=; b=hgiopXWStsoiIx9RKtIyRKb4AC
	xNt6QzKlu6/IX69WUCHsEY3kUVucma5rNpuh3NO13Qfsx8v9hVT7rUO6Dji1W0XhhIrE3Rmad4dEy
	BTq1ELaKoq6n3aOgP2FpvJzaJXUrxXDHjQ9N+f3o4uikIYvL0SL0uTlGTk8vOy8Ft7sMngenNorT0
	aU0fb3P9n4z9MgqPeEB/yVG7KBDllIwtCgrbY2AjdkrLlWwjf7EP4WnHyGbd323xSDJxyTgEUDRwy
	VjiaB446NjSQPhBD3Wef1Eg+CLx3EOM8L0J5DCstgss/VsIGxmzP2o44YVcRRJROmYo3EP5bK9g5c
	CAavDxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8tw-0000000Bkcb-21hM;
	Mon, 01 Jun 2026 20:06:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8tv-0000000Bkbu-0xjy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD1D6601E5;
	Mon,  1 Jun 2026 20:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375E01F00899;
	Mon,  1 Jun 2026 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344378;
	bh=CWHMpsxWnohP4Px+QryuliaXaq7V2BV1HAII16bRoaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KVTHEsmOSMN+SRz4NIUG1DEoFBhGVQCBBAqR/W/sprFelK/BkAYEHNbvDVQmqEwmU
	 iDO9SBnHwz5A/1vREXsMEK2Rg+UUiKEbwLw+t+YoPUlAg+pTDmfbdDqZLLX8oQjUpS
	 wfxlspOINYDHUhQcPyhlewInq39MxtIfqVUykBvH4XTuYhj3e3OV2vEZQSrbXb5mBA
	 2Imqw8JfqCZFTqCQsmGFZr2R2ICNvs/kuNP794H9J+hU/b+UcUGRCde5k63TA+BO8j
	 VFXdS/OiXoJA66kBKw+K6MvDyEn04cErjnsnvtiDQCRuSbEVGlbgt7kCcBBtJIV45i
	 hGfpQ3iV9eYtg==
Date: Mon, 1 Jun 2026 13:06:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Congkai Tan <congkai@amazon.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Haris Okanovic <harisokn@amazon.com>,
	Geoff Blake <blakgeof@amazon.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Message-ID: <ah3mObchzwb80_3S@kernel.org>
References: <20260601193954.2103455-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601193954.2103455-1-congkai@amazon.com>
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

Hi Congkai,

On Mon, Jun 01, 2026 at 07:39:54PM +0000, Congkai Tan wrote:
> Commit 46081078feb4 ("KVM: arm64: Upgrade PMU support to ARMv8.4")
> trapped PMMIR_EL1 as RAZ/WI and masked STALL_SLOT* from PMCEID1 to
> discourage guests from relying on a register they could not read.
> 
> Forward the SLOTS field of PMMIR_EL1 so that the perf userspace tool
> can read the correct value from
> /sys/bus/event_source/devices/armv8_pmuv3_0/caps/slots. Today, perf
> stat fails with message "Failure to read '#slots'" because it can
> only read 0x0 from the sysfs location, causing the parsing failure
> of the default metrics.
> 
> Fix this by:
> 1. Adding an access_pmmir() handler that reads arm_pmu->reg_pmmir
>    and returns a masked value containing only the SLOTS field [7:0]
>    to the guest. Other PMMIR_EL1 fields are kept as RAZ to limit
>    the extra information that this change exposes; individual
>    fields can be unmasked as KVM gains support for each feature.
> 2. Removing the STALL_SLOT, STALL_SLOT_FRONTEND and STALL_SLOT_BACKEND
>    mask in PMCEID1. The mask existed to hide these events under the
>    sysfs events/ directory when PMMIR_EL1 was RAZ; with SLOTS now
>    readable they should be correctly exposed.
> 
> Tested on Graviton 2 (Neoverse N1, pre-PMUv3p4), Graviton 3
> (Neoverse V1) and Graviton 4 (Neoverse V2) metal hosts with QEMU:
> caps/slots reads 0x00000008 in guests on Graviton 3/4 and 0x00000000
> on Graviton 2 (correct for pre-PMUv3p4). perf stat correctly
> evaluates the default metrics.
> 
> Fixes: 46081078feb4 ("KVM: arm64: Upgrade PMU support to ARMv8.4")
> Cc: stable@vger.kernel.org

This is not stable-worthy, nor is it a bugfix. As KVM presently does not
implement the STALL_SLOTS* events, PMMIR_EL0.SLOTS = 0 is a legal
implementation of FEAT_PMUv3p4.

> ---
>  arch/arm64/kvm/pmu-emul.c | 11 +----------
>  arch/arm64/kvm/sys_regs.c | 26 ++++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index e1860acae641..bafd5a258927 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -864,16 +864,7 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
>  
>  static u64 compute_pmceid1(struct arm_pmu *pmu)
>  {
> -	u64 val = __compute_pmceid(pmu, 1);
> -
> -	/*
> -	 * Don't advertise STALL_SLOT*, as PMMIR_EL0 is handled
> -	 * as RAZ
> -	 */
> -	val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
> -		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
> -		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
> -	return val;
> +	return __compute_pmceid(pmu, 1);
>  }

Make the change to PMCEID1 in a separate patch from PMMIR_EL1.

> +/*
> + * Expose only PMMIR_EL1.SLOTS to the guest, which is consumed by perf in its
> + * topdown default metric group. Other PMMIR_EL1 fields remain RAZ. Future
> + * patches can extend the exposed mask incrementally as KVM gains support for
> + * those features.
> + */
> +static bool access_pmmir(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> +			 const struct sys_reg_desc *r)
> +{
> +	struct arm_pmu *cpu_pmu = vcpu->kvm->arch.arm_pmu;
> +
> +	if (p->is_write)
> +		return write_to_read_only(vcpu, p, r);
> +
> +	if (check_pmu_access_disabled(vcpu, 0))
> +		return false;
> +
> +	p->regval = cpu_pmu->reg_pmmir & ARMV8_PMU_SLOTS;
> +	return true;
> +}
> +

We can't change the value of PMMIR_EL1 unconditionally since older KVM
treated this register as RAZ/WI. This also mixes poorly with the default
PMU garbage that we have since as the value of the register can change
based on where KVM_ARM_VCPU_INIT gets called...

Considering everything, I'd like to see this wired up where:

 - PMMIR_EL1.SLOTS takes the value of the underlying hardware PMU only
   if the VMM explicitly selects a particular PMU implementation

 - KVM allows userspace to set PMMIR_EL1.SLOTS=0 for backwards
   compatibility

Thanks,
Oliver

