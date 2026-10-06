Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749A5CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPJXXQVjMbcrdoG8rT5He+PCXmg6oCae9J9HjUac2RI=; b=qChFj9ooJgQXghsWjk2hNuCPN0
	usxWBK7oVEDQpNH9i4E9hzk5uwzufyrrkHWb+jaCN8otfUkSe//Zk47rckUHb9ePk798cMBFmEs0S
	4b1ONp5IHusHlnW55GxygG0KtLEJ3DNj8ufDlG+BS6HR/sLO7g/BcCujzmWhu2B4UwVNRr+qJA8QH
	BhkyvDNa2SFM5pqQ6r1AYx2kNINGiciq0fvVgY8FgSuWnrPkSwHwhx8k26WvMG4P1K/4p+5h8zloW
	zlE5KgfcU2ps8KQNrnA/TvLpBy5j5t0Ngt+iwpov8WDgXyUavnPX9Cq24AjZR/WkTipwDPqOLwEDX
	ujSp5kPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE51R-00000000pxP-3gIy;
	Tue, 06 Oct 2026 13:15:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE51P-00000000pxC-2epv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:15:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DDDE601E4;
	Tue,  6 Oct 2026 13:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9871F000FF;
	Tue,  6 Oct 2026 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791292553;
	bh=lPJXXQVjMbcrdoG8rT5He+PCXmg6oCae9J9HjUac2RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aBGYT4tsSDfzDqI6aslxN4IB9QH6DPgY/M5H8kIcYszHq0vlxvF1gxcTWGS6K9vWm
	 Viqk/JbSr5ZEnozb6gCiA0CGn4SScl/xzQN1W00w44OGjyJCmC+3roKRYnZvkWAQmQ
	 zanWgvP0s9UBcYqIt0FWuQnsr8bRvxOBsxo+uYsPFtV4jz0C0ySWGiomO6mTKjGyWO
	 d2MGJJ1GpDc9b9anHeeIQFTLJzfbXVgnET7S6iDilaKrjxmFoxya2YsyjNMGnVbfcm
	 T2sPhe0xNfFZUsztsDtKRL0O2lWh/bQQnwUixTvHcW0Ah6bmtdAWAfeihXmW9yQhE7
	 vlm3hjziMvpbg==
Date: Tue, 6 Oct 2026 06:15:47 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com,
	tabba@google.com
Subject: Re: [PATCH v2] KVM: arm64: Mask SErrors in a protected vCPU's host
 copy at first run
Message-ID: <asT0g8CcKoXBAmfi@kernel.org>
References: <20261006092826.2201763-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006092826.2201763-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Tue, Oct 06, 2026 at 10:28:26AM +0100, Fuad Tabba wrote:
> The host's copy of a protected vCPU has SErrors masked from reset, so a
> host-injected SError is pended through HCR_EL2.VSE and the guest takes
> it when it unmasks SErrors. However, the VMM can unmask SErrors in that
> copy before the first run, through PSTATE.A or SCTLR2_EL1.NMEA. KVM
> then emulates the SError's entry on the host copy, and the guest never
> takes it as an SError. Exits that copy PSTATE out set PSTATE.A again,
> but nothing clears NMEA. With NMEA set, an SError injected after a
> KVM_RUN that completes an MMIO access but returns before entering the
> guest also trips WARN_ON(INCREMENT_PC).
> 
> Mask SErrors in the host copy when the first run creates the hyp vCPU,
> after which KVM_SET_ONE_REG is rejected. An SError injected before then
> is still emulated, but only writes registers the VMM can set itself.
> 
> Fixes: 872383bd12e11 ("KVM: arm64: Add per-EC entry/exit state marshalling for protected guests")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20261001142109.794CA1F000FF@smtp.kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> v2:
>  - Set PSTATE.A and clear SCTLR2_EL1.NMEA in the host copy when the hyp
>    vCPU is created, instead of testing vcpu_is_protected() in
>    kvm_inject_serror_esr() (Marc).
> 
> Applies on kvmarm/next. A follow-up to "KVM: arm64: Confine protected VM
> vCPU state to EL2" [1], from Sashiko's review of its v4 patch 12.
> 
> v1: https://lore.kernel.org/r/20261005050352.836980-1-fuad.tabba@linux.dev/
> [1] https://lore.kernel.org/all/20261001135711.1640520-1-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/pkvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index d4822d8bb16b8..49973c689789f 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -191,12 +191,18 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>  	/*
>  	 * Mirror EL2's seeding of power_state from mp_state. The hyp vCPU is
>  	 * published, so take mp_state_lock against kvm_psci_vcpu_on().
> +	 *
> +	 * EL2 never reads the VMM's PSTATE or SCTLR2_EL1: undo any unmasking
> +	 * so that a host SError is pended through HCR_EL2.VSE.
>  	 */
>  	if (vcpu_is_protected(vcpu)) {
>  		spin_lock(&vcpu->arch.mp_state_lock);
>  		if (kvm_arm_vcpu_stopped(vcpu))
>  			WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_UNINITIALIZED);
>  		spin_unlock(&vcpu->arch.mp_state_lock);
> +
> +		*vcpu_cpsr(vcpu) |= PSR_A_BIT;
> +		__vcpu_rmw_sys_reg(vcpu, SCTLR2_EL1, &=, ~SCTLR2_EL1_NMEA);
>  	}

Urgh, I hadn't realized that PSTATE.A is still modifiable by userspace
prior to KVM_RUN. In that case, I would prefer the vcpu_has_nv()
approach that I had recommended as a backup.

FWIW, since pVMs do not implement FEAT_SCTLR2 it should not be able to
write to the register at all.

Thanks,
Oliver

