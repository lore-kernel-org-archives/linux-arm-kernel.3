Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67CD1A639
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5Idcev8IEkG3xe18Vl3Gr0En0TfoMr3ZN0kAU10bEo=; b=wTnj64Ev9l/BTq6XlxeEajREWM
	KBIs/NvnHFGMIgAu0+Iq8wMD+kWh2H4EcUiq4LJKvgF7bGKfl8E84M+gv2hPRZM+Pd1pZOvpk0f9k
	sgWHZ/EAPa+nBoXzW477yucjWQq8uV43a9LunPuRaZZ3I9xWPhxlpOyIlBUx0JKEYheccTep+hz7x
	yQNAOnk/cUJsiuNASkp977+FjGulM+ncWTIeooVh5pLN8TCYzg1SnMC3SqpewUIqq0Nl3TWTXYeTe
	tGNn0OFFhFdNGTjNRTjcYP1ilJHZ1BXrLrlOsxnkhGzOzpiHhHC5Z+F+o0mSmVShT1WRvlGx2ZUlv
	MHvo40rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDyf-00000002RiS-1oVX;
	Fri, 09 Jan 2026 15:00:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDyc-00000002Ri6-2ZyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:00:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D33DFEC;
	Fri,  9 Jan 2026 07:00:25 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21D6D3F6A8;
	Fri,  9 Jan 2026 07:00:30 -0800 (PST)
Date: Fri, 9 Jan 2026 15:00:27 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 33/36] KVM: arm64: gic-v5: Probe for GICv5 device
Message-ID: <20260109150027.GB223579@e124191.cambridge.arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
 <20251219155222.1383109-34-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219155222.1383109-34-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_070034_791184_2936037A 
X-CRM114-Status: GOOD (  29.96  )
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

On Fri, Dec 19, 2025 at 03:52:47PM +0000, Sascha Bischoff wrote:
> The basic GICv5 PPI support is now complete. Allow probing for a
> native GICv5 rather than just the legacy support.
> 
> The implementation doesn't support protected VMs with GICv5 at this
> time. Therefore, if KVM has protected mode enabled the native GICv5
> init is skipped, but legacy VMs are allowed if the hardware supports
> it.
> 
> At this stage the GICv5 KVM implementation only supports PPIs, and
> doesn't interact with the host IRS at all. This means that there is no
> need to check how many concurrent VMs or vCPUs per VM are supported by
> the IRS - the PPI support only requires the CPUIF. The support is
> artificially limited to VGIC_V5_MAX_CPUS, i.e. 512, vCPUs per VM.
> 
> With this change it becomes possible to run basic GICv5-based VMs,
> provided that they only use PPIs.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---

Reviewed-by: Joey Gouly <joey.gouly@arm.com>


>  arch/arm64/kvm/vgic/vgic-v5.c | 39 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index 97d67c1d16541..bf72982d6a2e8 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -12,22 +12,13 @@ static struct vgic_v5_ppi_caps *ppi_caps;
>  
>  /*
>   * Probe for a vGICv5 compatible interrupt controller, returning 0 on success.
> - * Currently only supports GICv3-based VMs on a GICv5 host, and hence only
> - * registers a VGIC_V3 device.
>   */
>  int vgic_v5_probe(const struct gic_kvm_info *info)
>  {
>  	u64 ich_vtr_el2;
>  	int ret;
>  
> -	if (!cpus_have_final_cap(ARM64_HAS_GICV5_LEGACY))
> -		return -ENODEV;
> -
>  	kvm_vgic_global_state.type = VGIC_V5;
> -	kvm_vgic_global_state.has_gcie_v3_compat = true;
> -
> -	/* We only support v3 compat mode - use vGICv3 limits */
> -	kvm_vgic_global_state.max_gic_vcpus = VGIC_V3_MAX_CPUS;
>  
>  	kvm_vgic_global_state.vcpu_base = 0;
>  	kvm_vgic_global_state.vctrl_base = NULL;
> @@ -35,6 +26,32 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
>  	kvm_vgic_global_state.has_gicv4 = false;
>  	kvm_vgic_global_state.has_gicv4_1 = false;
>  
> +	/*
> +	 * GICv5 is currently not supported in Protected mode. Skip the
> +	 * registration of GICv5 completely to make sure no guests can create a
> +	 * GICv5-based guest.
> +	 */
> +	if (is_protected_kvm_enabled()) {
> +		kvm_info("GICv5-based guests are not supported with pKVM\n");
> +		goto skip_v5;
> +	}
> +
> +	kvm_vgic_global_state.max_gic_vcpus = VGIC_V5_MAX_CPUS;
> +
> +	ret = kvm_register_vgic_device(KVM_DEV_TYPE_ARM_VGIC_V5);
> +	if (ret) {
> +		kvm_err("Cannot register GICv5 KVM device.\n");
> +		goto skip_v5;
> +	}
> +
> +	kvm_info("GCIE system register CPU interface\n");
> +
> +skip_v5:
> +	/* If we don't support the GICv3 compat mode we're done. */
> +	if (!cpus_have_final_cap(ARM64_HAS_GICV5_LEGACY))
> +		return 0;
> +
> +	kvm_vgic_global_state.has_gcie_v3_compat = true;
>  	ich_vtr_el2 =  kvm_call_hyp_ret(__vgic_v3_get_gic_config);
>  	kvm_vgic_global_state.ich_vtr_el2 = (u32)ich_vtr_el2;
>  
> @@ -50,6 +67,10 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
>  		return ret;
>  	}
>  
> +	/* We potentially limit the max VCPUs further than we need to here */
> +	kvm_vgic_global_state.max_gic_vcpus = min(VGIC_V3_MAX_CPUS,
> +						  VGIC_V5_MAX_CPUS);
> +
>  	static_branch_enable(&kvm_vgic_global_state.gicv3_cpuif);
>  	kvm_info("GCIE legacy system register CPU interface\n");
>  
> -- 
> 2.34.1

