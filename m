Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E493BCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wQi5Sr8in2AQXetirL79AvfjTF+0mSHck6gNbBu5jw=; b=d2IN5u0KylxqSPeZBOcxd9iYY2
	IVaxz4cyf+wXfYM+ramDjZF+Wrta6Xw10Cw+1iwX81Wqf0hcacB22pcz7mCi83NBN8U3VX24P0M56
	pxvJzlLp+KSIzx3Quw3gw1i6c6wwp3jwJpE4CfQlknE1c9+xw6pOjJpGloYmPhPnqHTSrytZsP7g3
	q9Peivbaj/FcMJJI1IoCRuW00CufEjZ660KDWPGKpUjWIeQr2qIl8KNpPX8cXqxTcE6QMgaorR/+w
	z4TwARfUnotqiQt8FqLS4k5qVBMttjFScPW/IRHqe0c0DDRuKdNfVw0duOCqMoFjvfusFns7FRZ6v
	D5whRWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEkH-0000000APBL-2Ox4;
	Mon, 12 Oct 2026 12:03:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEkD-0000000APAc-3NK9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:03:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 344871655;
	Mon, 12 Oct 2026 05:03:01 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B77B3F882;
	Mon, 12 Oct 2026 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791806584; bh=87JAwL4Wo/puwTtUIlo0MwTa0OtKrL9jDLQqKX3bxp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TICF56M6nNaNZ0BA/yq8qr6ucOZMhtXGjlDncoubsa5DUKj+9gHLENQWxXlo6Lk+9
	 OFjfHSt6tCbGetm28hbc4ZnkyisTwvY2JNmfqM3953GySDxovOIbFO2V3xR8grjucT
	 m9Nmq1OaAXoA507w4TpvDFdwL9+qVjjP2yQ1K1g4=
Message-ID: <6f5dcdd6-21ca-4392-9d6c-fa262a8cf7de@arm.com>
Date: Mon, 12 Oct 2026 13:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] KVM: arm64: Reject the stage-2 flush hypercalls
 under pKVM
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, oupton@kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
 vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com,
 steven.price@arm.com, tabba@google.com
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
 <20261011143648.211337-3-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261011143648.211337-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_050306_670724_2A8FD638 
X-CRM114-Status: GOOD (  19.13  )
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

On 11/10/2026 15:36, Fuad Tabba wrote:
> The stage-2 TLB and context flush hypercalls remain callable once pKVM
> has finalised, and five of the six dereference a host-supplied
> struct kvm_s2_mmu pointer. Under pKVM none has a valid caller: the host
> walks no guest stage-2, its TLB flushes go through the handle-based
> __pkvm_tlb_flush_vmid, and kvm_arch_vcpu_load() skips both the VMID
> update and the CPU context flush.
> 
> Move them into the band the dispatcher rejects once pKVM has finalised.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260914130152.F0D5F1F000FF@smtp.kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/include/asm/kvm_asm.h   | 12 ++++++------
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 ++++++-----
>   2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index ea319c496bb26..b182c908c1a98 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -64,6 +64,12 @@ enum __kvm_host_smccc_func {
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> +	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,

For a moment (pardon my inexperience with pKVM code base) I thought we
could get this called via

pkvm_stage2_relax_perms() ->... kvm_stage2_relax_perms() for the host, 
but we are in EL2 already and it is a direct call.

So, yes makes sense to me.

FWIW:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
> +	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>   
>   	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
>   
> @@ -72,12 +78,6 @@ enum __kvm_host_smccc_func {
>   	/* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>   	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>   	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> -	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
> -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> -	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
> -	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>   	__KVM_HOST_SMCCC_FUNC___tracing_load,
>   	__KVM_HOST_SMCCC_FUNC___tracing_unload,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 7c939baf9c1ba..b2657a3c65b40 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -913,16 +913,16 @@ static const hcall_t host_hcall[] = {
>   	HANDLE_FUNC(__vgic_v3_get_gic_config),
>   	HANDLE_FUNC(__vgic_v5_save_apr),
>   	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> -	HANDLE_FUNC(__pkvm_prot_finalize),
> -
> -	HANDLE_FUNC(__kvm_adjust_pc),
> -	HANDLE_FUNC(__kvm_vcpu_run),
>   	HANDLE_FUNC(__kvm_flush_vm_context),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa_nsh),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
>   	HANDLE_FUNC(__kvm_flush_cpu_context),
> +	HANDLE_FUNC(__pkvm_prot_finalize),
> +
> +	HANDLE_FUNC(__kvm_adjust_pc),
> +	HANDLE_FUNC(__kvm_vcpu_run),
>   	HANDLE_FUNC(__kvm_timer_set_cntvoff),
>   	HANDLE_FUNC(__tracing_load),
>   	HANDLE_FUNC(__tracing_unload),
> @@ -969,7 +969,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>   
>   	/*
>   	 * If pKVM has been initialised then reject any calls to the
> -	 * early "privileged" hypercalls. Note that we cannot reject
> +	 * early "privileged" hypercalls, and to the ones the host has no
> +	 * use for in protected mode. Note that we cannot reject
>   	 * calls to __pkvm_prot_finalize for two reasons: (1) The static
>   	 * key used to determine initialisation must be toggled prior to
>   	 * finalisation and (2) finalisation is performed on a per-CPU


