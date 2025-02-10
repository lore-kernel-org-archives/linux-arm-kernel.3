Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHo+XPr8ei5XXwJ296+SzwpRXGDRvOG0n8AV4CyeLr4=; b=C3OaNPIMvuqOtZj07P8lAMQ7c9
	a8WS8vQ/3u224wwwRHBkyrCRIFQ5rCSMn8E5R6fqehZ+LyxxG2yzZgzf9aJmhMeZxlRaSdg8/mssx
	0HLBpOtNkE/iCeFwXG50LdzSul/LoFcjuVmzNZlYO5Cm6TPkypmD2fp8UJLamH7Z9tPzu9OWnXr6V
	IV10qbUSlEFu+up+IFuso5eKdi3f4hKcaM1JUvAJqbRT8JxnVQb8Bcta0yGXGJCh2uTEaTHPVqZfN
	Z9T4ik4QK79OuLArz4e38KFvTJhm8FuZT7vyPn+uXasc3tqwXPK/gwB1XlMWe7mz9DKEN1bqDZTJN
	h/PVbkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWQL-00000000Svg-3tl2;
	Mon, 10 Feb 2025 16:14:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOw-00000000SW9-1iJT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46E065C5AF1;
	Mon, 10 Feb 2025 16:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BACC4CEE7;
	Mon, 10 Feb 2025 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739203969;
	bh=5WIIG4Dg8N8gj/fGw3vBXRm+uKLD8KX6NxcJaL2mvRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XejSj2mPeA5iJGCF6cLB4eMgzTmZMI9yDTMRkFEYzsooB3QizAUfu4ho+Lox8I/L7
	 M0zlMwpjD7zo+vQrt3GFJWvdMX8vVMwopVWrNLuPUj6ElYzUVXqY+Qgx7ehuL2jQ7F
	 9oQO/OEc3DevfiXvFpaZohize5q1OSBt1VOx2msqGg+nq8kPdagGiKWHtm1Zep732Z
	 UOSm/l16/0TFU2634s6SNaQqesRgnJESOmOPgi7Tjp3lUxa0Nz7KSaXaD+K1L1cUU/
	 SVq5PqS7JWVG3LlcYvtR5T6mhhid/0/FJzyHeA1Plzu/aENcyFfsBX9g/brcCqEeRE
	 e1YelJdpctPUQ==
Date: Mon, 10 Feb 2025 16:12:43 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <20250210161242.GC7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-3-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081250_537126_AA09BD71 
X-CRM114-Status: GOOD (  27.14  )
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

On Thu, Feb 06, 2025 at 02:10:56PM +0000, Mark Rutland wrote:
> Now that the host eagerly saves its own FPSIMD/SVE/SME state,
> non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
> and the code to do this is never used. Protected KVM still needs to
> save/restore the host FPSIMD/SVE state to avoid leaking guest state to
> the host (and to avoid revealing to the host whether the guest used
> FPSIMD/SVE/SME), and that code needs to be retained.
> 
> Remove the unused code and data structures.
> 
> To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
> VHE hyp code, the nVHE/hVHE version is moved into the shared switch
> header, where it is only invoked when KVM is in protected mode.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h       | 20 +++++-------------
>  arch/arm64/kvm/arm.c                    |  8 -------
>  arch/arm64/kvm/fpsimd.c                 |  2 --
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 25 ++++++++++++++++++++--
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  2 +-
>  arch/arm64/kvm/hyp/nvhe/switch.c        | 28 -------------------------
>  arch/arm64/kvm/hyp/vhe/switch.c         |  8 -------
>  7 files changed, 29 insertions(+), 64 deletions(-)

[...]

> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index f838a45665f26..c5b8a11ac4f50 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -375,7 +375,28 @@ static inline void __hyp_sve_save_host(void)
>  			 true);
>  }
>  
> -static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu);
> +static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * Non-protected kvm relies on the host restoring its sve state.
> +	 * Protected kvm restores the host's sve state as not to reveal that
> +	 * fpsimd was used by a guest nor leak upper sve bits.
> +	 */
> +	if (system_supports_sve()) {
> +		__hyp_sve_save_host();
> +
> +		/* Re-enable SVE traps if not supported for the guest vcpu. */
> +		if (!vcpu_has_sve(vcpu))
> +			cpacr_clear_set(CPACR_EL1_ZEN, 0);
> +
> +	} else {
> +		__fpsimd_save_state(host_data_ptr(host_ctxt.fp_regs));
> +	}
> +
> +	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
> +		*host_data_ptr(fpmr) = read_sysreg_s(SYS_FPMR);
> +}
> +
>  
>  /*
>   * We trap the first access to the FP/SIMD to save the host context and
> @@ -425,7 +446,7 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	isb();
>  
>  	/* Write out the host state if it's in the registers */
> -	if (host_owns_fp_regs())
> +	if (is_protected_kvm_enabled() && host_owns_fp_regs())
>  		kvm_hyp_save_fpsimd_host(vcpu);

I wondered briefly whether this would allow us to clean up the CPACR
handling a little and avoid the conditional SVE trap re-enabling inside
kvm_hyp_save_fpsimd_host() but I couldn't come up with a clean way to
do it without an additional ISB. Hrm.

Anyway, as far as the patch goes:

Acked-by: Will Deacon <will@kernel.org>

Will

