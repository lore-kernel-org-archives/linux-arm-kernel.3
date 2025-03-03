Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8607C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6Ssv1Pi5/l09GtY5Tp1NZoyz32uNw/sUvPD95BnsD8=; b=zI8n0zzg/T9ofAj86opGTbav1W
	WgRgswqdyvN/K1eoMwZb2jGd4bHovBx1ugWeRZoFKfDL7wi773AxdGu8Qs4fye7/YN+Fl6ApgkvNQ
	tGHVQvp66iQmpLfMxuPAQ5dgNnCZsTKgBxY3+l0xvOBBKrSzXTumV6qL6Mtb6iYSSmW8tNWpdnPAR
	9yX2ETUEBZMEbuTJQHFTjMyYq0sONiG8tm9cTa8Q0xlJgwekP4ZCZ/bpwcd6SyLlpA6wOdYXE3B8Z
	a2ngRjAny8JD3rba64W6Mmuahrrp3Bs4aQM9l7TFSdthT1KscXMNGaVYCTvBV3TrjBSUCZPb9UscY
	VmnaIHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBSW-000000024Ht-2jFY;
	Mon, 03 Mar 2025 19:28:12 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBQw-0000000249m-2E8Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:26:36 +0000
Date: Mon, 3 Mar 2025 11:26:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741029989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e6Ssv1Pi5/l09GtY5Tp1NZoyz32uNw/sUvPD95BnsD8=;
	b=eFhViSfqEkZ4vo/8zItk5pKaSpk2SrRf5ADD1i/13+D1jULcmd/qNRMxEhT0n2KKindPvf
	jaymDdXLv6vRnzAnGEtD9tNCfzmZQUpGN2+BFeyBnx9/mlhUlDuR4fsYbOPrCUC+MC0dn8
	DGB4YRjuRVwPLZbEwriBSpv/8CrjoEo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, devel@daynix.com
Subject: Re: [PATCH] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Message-ID: <Z8YCUFkt8gdnWRSk@linux.dev>
References: <20250302-pmc-v1-1-caff989093dc@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-pmc-v1-1-caff989093dc@daynix.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_112634_714237_982263C3 
X-CRM114-Status: GOOD (  28.81  )
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

Hi Akihiko,

On Sun, Mar 02, 2025 at 05:12:54PM +0900, Akihiko Odaki wrote:
> Reset the current perf event when setting the vPMU counter (vPMC)
> registers (PMCCNTR_EL0 and PMEVCNTR<n>_EL0). This is a change
> corresponding to commit 9228b26194d1 ("KVM: arm64: PMU: Fix GET_ONE_REG
> for vPMC regs to return the current value") but for SET_ONE_REG.
> 
> Values of vPMC registers are saved in sysreg files on certain occasions.
> These saved values don't represent the current values of the vPMC
> registers if the perf events for the vPMCs count events after the save.
> The current values of those registers are the sum of the sysreg file
> value and the current perf event counter value.  But, when userspace
> writes those registers (using KVM_SET_ONE_REG), KVM only updates the
> sysreg file value and leaves the current perf event counter value as is.

Are you trying to change the PMCs after the VM has started?

> Fix this by calling kvm_pmu_set_counter_value(), which resests the
> current perf event as well.

I'm afraid this could introduce some oddities for save/restore of a VM.
The PMU configuration (e.g. type, event filter, nr event counters) is
subject to change before KVM_RUN.

For example, if the VM programmed an event that was filtered on the
source, KVM could erroneously allocate a perf event on the target if the
filter is restored after the vCPU sysregs.

A similar issue could happen with the PMU type not matching the final
selection as well. Attaching the perf event in KVM_REQ_RELOAD_PMU avoids
these sort of issues.

> Fixes: 051ff581ce70 ("arm64: KVM: Add access handler for event counter register")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 42791971f75887796afab905cc12f49fead39e10..1de990edc6a3e9be2a05a711621bb1bcbeac236a 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1035,6 +1035,22 @@ static int get_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>  	return 0;
>  }
>  
> +static int set_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
> +			  u64 val)
> +{
> +	u64 idx;
> +
> +	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 0)
> +		/* PMCCNTR_EL0 */
> +		idx = ARMV8_PMU_CYCLE_IDX;
> +	else
> +		/* PMEVCNTRn_EL0 */
> +		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);

nitpick: Let's get rid of the manual decode for both the getter and
setter. r->reg already provides the right info, we just need to
transform that into a counter index.

> +	kvm_pmu_set_counter_value(vcpu, idx, val);
> +	return 0;

WDYT about only calling kvm_pmu_set_counter_value() if the vCPU has
already run once, otherwise update the in-memory value of the register?
I think that would fix your issue while also guaranteeing that the perf
event matches the final configuration of the vPMU.

Thanks,
Oliver

