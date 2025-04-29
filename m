Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E15C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4rs6Notsey7ElcizSFlMJjByni1EwUDvtZu5Ly1L6g=; b=4yrIOuS01+e0aOm4J74bsU/CCW
	iNkvLYDbji99Zrim+Lk1I13dPSbAaBuSLi1W4rFIlZX2X+2+7BTjD1eyQKKh+a0RpDHD7gVPCuHlo
	bzAyoXYDRBkibv45pAx1enz5JRzkQjO8K513pctRS9AzpawYfcbWvE0VjTWL1KQoyDsh46ClnidLw
	RPR183S90W+BGw40Nekmkh9Vt44sopHdmFOK2G1eVac4bc0NQNwir0+XcnDLyLyS7ol/v++EnOPBg
	QuZWqRneR0zLnvWHO69B2Mn5FI5oJobk59T7I+Zd40YZ585A26ilgsijOHowraBO1CD5mKbJj1YEs
	1idr/L+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgx-0000000A4tN-34qy;
	Tue, 29 Apr 2025 15:16:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9khL-00000009jdJ-0v4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:08:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D392A1515;
	Tue, 29 Apr 2025 06:08:23 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA503F673;
	Tue, 29 Apr 2025 06:08:28 -0700 (PDT)
Message-ID: <363383a2-c05e-458c-82b7-acc6e5d73939@arm.com>
Date: Tue, 29 Apr 2025 14:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/42] KVM: arm64: Unconditionally configure fine-grain
 traps
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-25-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-25-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_060831_301728_4E9B22C9 
X-CRM114-Status: GOOD (  15.45  )
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

Hi Marc,

On 4/26/25 13:28, Marc Zyngier wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> ... otherwise we can inherit the host configuration if this differs from
> the KVM configuration.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [maz: simplified a couple of things]
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/kvm/hyp/include/hyp/switch.h | 39 ++++++++++---------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 027d05f308f75..925a3288bd5be 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -107,7 +107,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
>   
> [...]
>   
>   static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
> -	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
>   
>   	if (!cpus_have_final_cap(ARM64_HAS_FGT))
>   		return;
>   
> -	__deactivate_fgt(hctxt, vcpu, kvm, HFGRTR_EL2);
> -	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
Don't we need to continue considering the ampere errata here? Or, at 
least worth a mention in the commit message.
> -		write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
> -	else
> -		__deactivate_fgt(hctxt, vcpu, kvm, HFGWTR_EL2);
> -	__deactivate_fgt(hctxt, vcpu, kvm, HFGITR_EL2);
> -	__deactivate_fgt(hctxt, vcpu, kvm, HDFGRTR_EL2);
> -	__deactivate_fgt(hctxt, vcpu, kvm, HDFGWTR_EL2);
> +	__deactivate_fgt(hctxt, vcpu, HFGRTR_EL2);
> +	__deactivate_fgt(hctxt, vcpu, HFGWTR_EL2);
> +	__deactivate_fgt(hctxt, vcpu, HFGITR_EL2);
> +	__deactivate_fgt(hctxt, vcpu, HDFGRTR_EL2);
> +	__deactivate_fgt(hctxt, vcpu, HDFGWTR_EL2);
>   
>   	if (cpu_has_amu())
> -		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
> +		__deactivate_fgt(hctxt, vcpu, HAFGRTR_EL2);
>   }
>   
>   static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)


Thanks,

Ben


