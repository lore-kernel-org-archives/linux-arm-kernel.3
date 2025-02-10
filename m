Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA20FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkRnaY0hUe5AgymJjE591wHusvF75a7KGMu1eW6170M=; b=yDrPyr4cPQwtFOPGOsaqAKHnnt
	F8UfQmYaLLgCL8s8k56B4desHgRdHZ8JNdzVqY84W74ePcqcqmNHqTU3b0CmPMjhsifI7r2ezqMdR
	bPx0+EJTLNxUUW7BXEkdVLDO/ol2bziQ3HlKpfjQxeQtPd9bwJiXhOO+WP43+kfpkrktd/bDGdsJ3
	FiQUz0kPOtM/EMfPshIHsuC08cw70bKnuHGj0BL+j1vFxeMC4nv92ZtnrZFTwCmixhcDPmapd3Eut
	83tza9e++CLnTI0MUECCK74drx4jSXCmqhVHt0dSjevjPTrjr2tbGwRW/cAgKe8lFdSMWG32ebC+S
	uMPXUcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXMa-00000000gTi-2w9y;
	Mon, 10 Feb 2025 17:14:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thX2L-00000000bZ8-2KfS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42825A41B9C;
	Mon, 10 Feb 2025 16:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF3EC4CED1;
	Mon, 10 Feb 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206412;
	bh=+U6f4hXX7C0GRaNUMJjhdcdq6kFjycr0JQndGKbnuKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccTpa/pZUYvpCRwzIS9iHPjsZEkMOs+OrNd91i7nv/UAbgO9TfOIeTQKyu1EmwOxG
	 VdPzKfmfwEUdMXMksW826XZgaC6TvbuW0R37RMA6pTBPzsEtDwF7Q+l+N4iv+AU0Pc
	 jPvKhysURNPtHsNroNVKD2jfyTASVCpkUKaxxvoHzT3qqjmvGV5i3KuqzwYN1JwUoU
	 xZKUI8o95ZK5Yf/Qf6L1i0/9aJIoB/m1f/sJNAY/MhwcAyxuYEu0ijDZJEEn89qElT
	 Jsng1PwCM8bzsMDWpHGAXCHHX9xuhU3d7H3kuuaDNWbvAc3UCumI7OMdbnFCFMDIjz
	 m4rIlMyOLp+jg==
Date: Mon, 10 Feb 2025 16:53:27 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <20250210165325.GI7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-9-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_085333_721797_BA2201CD 
X-CRM114-Status: GOOD (  32.94  )
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

On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:
> In non-protected KVM modes, while the guest FPSIMD/SVE/SME state is live on the
> CPU, the host's active SVE VL may differ from the guest's maximum SVE VL:
> 
> * For VHE hosts, when a VM uses NV, ZCR_EL2 contains a value constrained
>   by the guest hypervisor, which may be less than or equal to that
>   guest's maximum VL.
> 
>   Note: in this case the value of ZCR_EL1 is immaterial due to E2H.
> 
> * For nVHE/hVHE hosts, ZCR_EL1 contains a value written by the guest,
>   which may be less than or greater than the guest's maximum VL.
> 
>   Note: in this case hyp code traps host SVE usage and lazily restores
>   ZCR_EL2 to the host's maximum VL, which may be greater than the
>   guest's maximum VL.
> 
> This can be the case between exiting a guest and kvm_arch_vcpu_put_fp().
> If a softirq is taken during this period and the softirq handler tries
> to use kernel-mode NEON, then the kernel will fail to save the guest's
> FPSIMD/SVE state, and will pend a SIGKILL for the current thread.
> 
> This happens because kvm_arch_vcpu_ctxsync_fp() binds the guest's live
> FPSIMD/SVE state with the guest's maximum SVE VL, and
> fpsimd_save_user_state() verifies that the live SVE VL is as expected
> before attempting to save the register state:
> 
> | if (WARN_ON(sve_get_vl() != vl)) {
> |         force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
> |         return;
> | }
> 
> Fix this and make this a bit easier to reason about by always eagerly
> switching ZCR_EL{1,2} at hyp during guest<->host transitions. With this
> happening, there's no need to trap host SVE usage, and the nVHE/nVHVE

nit: nVHVE?

(also, note to Fuad: I think we're trapping FPSIMD/SVE from the host with
 pKVM in Android, so we'll want to fix that when we take this patch via
 -stable)

> __deactivate_cptr_traps() logic can be simplified enable host access to

nit: to enable

> all present FPSIMD/SVE/SME features.
> 
> In protected nVHE/hVHVE modes, the host's state is always saved/restored

nit: hVHVE

(something tells me these acronyms aren't particularly friendly!)

> by hyp, and the guest's state is saved prior to exit to the host, so
> from the host's PoV the guest never has live FPSIMD/SVE/SME state, and
> the host's ZCR_EL1 is never clobbered by hyp.
> 
> Fixes: 8c8010d69c132273 ("KVM: arm64: Save/restore SVE state for nVHE")
> Fixes: 2e3cf82063a00ea0 ("KVM: arm64: nv: Ensure correct VL is loaded before saving SVE state")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: stable@vger.kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/fpsimd.c                 | 30 ---------------
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 51 +++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 13 +++----
>  arch/arm64/kvm/hyp/nvhe/switch.c        |  6 +--
>  arch/arm64/kvm/hyp/vhe/switch.c         |  4 ++
>  5 files changed, 63 insertions(+), 41 deletions(-)

[...]

> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 163867f7f7c52..bbec7cd38da33 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -375,6 +375,57 @@ static inline void __hyp_sve_save_host(void)
>  			 true);
>  }
>  
> +static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
> +{
> +	u64 zcr_el1, zcr_el2;
> +
> +	if (!guest_owns_fp_regs())
> +		return;
> +
> +	if (vcpu_has_sve(vcpu)) {
> +		/* A guest hypervisor may restrict the effective max VL. */
> +		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
> +			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
> +		else
> +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> +
> +		write_sysreg_el2(zcr_el2, SYS_ZCR);
> +
> +		zcr_el1 = __vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu));
> +		write_sysreg_el1(zcr_el1, SYS_ZCR);
> +	}
> +}
> +
> +static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
> +{
> +	u64 zcr_el1, zcr_el2;
> +
> +	if (!guest_owns_fp_regs())
> +		return;
> +
> +	if (vcpu_has_sve(vcpu)) {
> +		zcr_el1 = read_sysreg_el1(SYS_ZCR);
> +		__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)) = zcr_el1;
> +
> +		/*
> +		 * The guest's state is always saved using the guest's max VL.
> +		 * Ensure that the host has the guest's max VL active such that
> +		 * the host can save the guest's state lazily, but don't
> +		 * artificially restrict the host to the guest's max VL.
> +		 */
> +		if (has_vhe()) {
> +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> +		} else {
> +			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
> +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> +
> +			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> +			write_sysreg_el1(zcr_el1, SYS_ZCR);

Do we need an ISB before this to make sure that the CPTR traps have been
deactivated properly?

Will

