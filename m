Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563BDFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ7Kwfl7JFKORZNrG91b8A7OE46qwA5p8e7V5gfiyjo=; b=k2hmLeKsxIutxKixoTVl68zP0q
	voHCeAyqJeM7M8AJt6oSdT2IC+lZkgU4FSqx7gcwt507YGKMX5MUNibhJp9Y8WGAfzI37GBvTVb79
	+3i9iiZrSZCum0v04jFad/DUIaJu6hzqEAdBSf7f6f197tlPZ8Um8r/H1ihH5UUN+alzvVf2WvKcx
	OKeZL62Wm4h3i8LEweAc0LOvMI9bp6LgsKUHxYQC3BF+K5Qu7XGRx352LkGOlDAy7AdyGb3fclAcW
	R4v+S1j3dyF7gc25I6ZmJypPgRxTkQuJZ2AsjF58nmwIIOX+mtoLpN6RISWNr2+P0aciYupqHNJiS
	IaQ0HS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Nb-00000003b4u-1ZtU;
	Wed, 29 Apr 2026 12:51:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4NZ-00000003b4N-1AbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 12:51:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D53692574;
	Wed, 29 Apr 2026 05:50:52 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BA453F763;
	Wed, 29 Apr 2026 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777467058; bh=ZHKgCSa2p4IeAL7WPasC7tJWV3QjBN+isJ06kSKJfq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yfs71Fm+7WXjL3Pw8O3fzE7VPmLUhGMg0AFyoUDw5t6sYgy8kotc3oNxIYtZ58oHt
	 mcJ0yZSWNEB7Y489AFdfLhOmr/au5T4y2rERS7JhawGCKgoBUtNO1FlF0RJVmclhj4
	 1QMfApBPKEjTBKfXCS+cjBcegIerqyfAKd9ynAVc=
Date: Wed, 29 Apr 2026 13:50:53 +0100
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
Subject: Re: [PATCH 09/43] KVM: arm64: gic-v5: Implement VMT/vIST IRS MMIO Ops
Message-ID: <20260429125053.GB708848@e124191.cambridge.arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
 <20260427160547.3129448-10-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427160547.3129448-10-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_055101_417923_62FEE5FF 
X-CRM114-Status: GOOD (  45.41  )
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

On Mon, Apr 27, 2026 at 04:09:06PM +0000, Sascha Bischoff wrote:
> GICv5 has rules about which fields of a VMTE (or L1 VMT) may be
> directly written by the host once the table is valid. This ensures
> that no stale state is cached by the hardware, and provides a clear
> interface for making VMs, ISTs, etc, valid.
> 
> The hypervisor is responsible for populating the VMTE for a
> VM. However, it is not permitted to write the Valid bit (as the VM
> table is already valid). Instead, the VM is made valid via an IRS MMIO
> Op. The same applies to the ISTs - they must be made valid via the
> host IRS.
> 
> This commit adds support for:
> 
> * Making level 2 VMTs valid (only), allowing for dynamic level 2 table
>   allocation.
> * Making VMTEs (VMs) valid or invalid
> * Making SPI/LPI ISTs valid or invalid for a specific VM
> 
> When (successfully) probing for a GICv5, the VMT is allocated, and is
> made valid via the IRS's MMIO interface.
> 
> This commit also extends the doorbell domain to allow the doorbells
> themselves to act as a conduit for issuing commands - this is similar
> to what exists for GICv4 support. Effectively, irq_set_vcpu_affinity()
> becomes an ioctl-like interface for issuing commands specific to
> either a VM or the particular VPE that the doorbell belongs to. This
> change adds support for the following via the VPE doorbells:
> 
>         VMT_L2_MAP - Make a second level VM table valid
>         VMTE_MAKE_VALID - Make a single VMTE (and hence VM) valid
>         VMTE_MAKE_INVALID - Make a single VMTE (and hence VM) invalid
>         SPI_VIST_MAKE_VALID - Make the SPI IST valid
>         LPI_VIST_MAKE_VALID - Make the LPI IST valid
>         LPI_VIST_MAKE_INVALID - Make the LPI IST invalid
> 
> Note: It is intentional that there is no SPI_VIST_MAKE_INVALID - this
> cannot happen while the VM is live, and given that the SPI is
> allocated as part of VM creation, there is no need to make it invalid
> again until the VM is destroyed, at which point the VMTE is
> invalid. Therefore, there's no need to do this via the host's IRS MMIO
> interface, as it can be directly marked as invalid and freed. LPIs, on
> the other hand, are driven by the guest itself, and the guest is
> theoretically free to invalidate and free the LPI IST at any point.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-v5-tables.c |  25 +++
>  arch/arm64/kvm/vgic/vgic-v5-tables.h |   2 +
>  arch/arm64/kvm/vgic/vgic-v5.c        | 236 ++++++++++++++++++++++++++-
>  include/linux/irqchip/arm-gic-v5.h   |  30 ++++
>  4 files changed, 290 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> index de905f37b61a5..0120c3205dea6 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> @@ -666,6 +666,26 @@ int vgic_v5_vmte_free_vpe(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  
> +phys_addr_t vgic_v5_get_vmt_base(void)
> +{
> +	phys_addr_t vmt_base;
> +
> +	if (!vgic_v5_vmt_allocated())
> +		return -ENXIO;
> +
> +	if (!vmt_info->two_level)
> +		vmt_base = virt_to_phys(vmt_info->linear.vmt_base);
> +	else
> +		vmt_base = virt_to_phys(vmt_info->l2.vmt_base);
> +
> +	return vmt_base;
> +}
> +
> +u8 vgic_v5_vmt_vpe_id_bits(void)
> +{
> +	return fls(vmt_info->max_vpes) - 1;
> +}
> +
>  /*
>   * Assign an already allocated IST to the VM by populating the fields in the
>   * corresponding VMTE. We re-use this code for both an SPI IST and LPI IST, even
> @@ -715,6 +735,11 @@ int vgic_v5_vmte_assign_ist(struct kvm *kvm, phys_addr_t ist_base,
>  	/* Finally, mark the entry as valid */
>  	cmd_info.cmd_type = spi_ist ? SPI_VIST_MAKE_VALID : LPI_VIST_MAKE_VALID;
>  	ret = irq_set_vcpu_affinity(vgic_v5_vpe_db(vcpu0), &cmd_info);
> +	if (ret) {
> +		WRITE_ONCE(vmte->val[section], 0ULL);
> +		vgic_v5_clean_inval(vmte, sizeof(*vmte), true, false);
> +		return ret;
> +	}
>  
>  	/* Any cached entries we now have are stale! */
>  	vgic_v5_clean_inval(vmte, sizeof(*vmte), false, true);
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> index 37e220cda1987..6a024337eba79 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> @@ -150,6 +150,8 @@ int vgic_v5_vmt_allocate(bool two_level, unsigned int num_entries,
>  			 size_t vmd_size, size_t vped_size,
>  			 unsigned int vpe_id_bits);
>  int vgic_v5_vmt_free(void);
> +phys_addr_t vgic_v5_get_vmt_base(void);
> +u8 vgic_v5_vmt_vpe_id_bits(void);
>  
>  int vgic_v5_allocate_vm_id(struct kvm *kvm);
>  void vgic_v5_release_vm_id(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index 4e0d52b309628..49eb01ca07961 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -36,6 +36,12 @@ static void vgic_v5_get_implemented_ppis(void)
>  	__assign_bit(GICV5_ARCH_PPI_PMUIRQ, ppi_caps.impl_ppi_mask, system_supports_pmuv3());
>  }
>  
> +/*
> + * The IRS MMIO interface is shared between all VMs, so make sure we don't do
> + * anything stupid!
> + */
> +static DEFINE_RAW_SPINLOCK(vm_config_lock);
> +
>  static void __iomem *irs_base;
>  
>  static u32 irs_readl_relaxed(const u32 reg_offset)
> @@ -43,6 +49,21 @@ static u32 irs_readl_relaxed(const u32 reg_offset)
>  	return readl_relaxed(irs_base + reg_offset);
>  }
>  
> +static void irs_writel_relaxed(const u32 val, const u32 reg_offset)
> +{
> +	writel_relaxed(val, irs_base + reg_offset);
> +}
> +
> +static u64 irs_readq_relaxed(const u32 reg_offset)
> +{
> +	return readq_relaxed(irs_base + reg_offset);
> +}
> +
> +static void irs_writeq_relaxed(const u64 val, const u32 reg_offset)
> +{
> +	writeq_relaxed(val, irs_base + reg_offset);
> +}
> +
>  static int gicv5_irs_extract_vm_caps(const struct gic_kvm_info *info)
>  {
>  	u64 idr;
> @@ -84,16 +105,22 @@ static int gicv5_irs_extract_vm_caps(const struct gic_kvm_info *info)
>  	return 0;
>  }
>  
> +/* Forward decl for cleaner code layout */
> +static int vgic_v5_irs_assign_vmt(bool two_level, u8 vm_id_bits, phys_addr_t vmt_base);
> +static int vgic_v5_irs_clear_vmt(void);
> +
>  /*
>   * Probe for a vGICv5 compatible interrupt controller, returning 0 on success.
>   */
>  int vgic_v5_probe(const struct gic_kvm_info *info)
>  {
> +	struct vgic_v5_host_ist_caps *ist_caps;
>  	bool v5_registered = false;
>  	u64 ich_vtr_el2;
>  	int ret;
>  
>  	kvm_vgic_global_state.type = VGIC_V5;
> +	kvm_vgic_global_state.max_gic_vcpus = VGIC_V5_MAX_CPUS;
>  
>  	kvm_vgic_global_state.vcpu_base = 0;
>  	kvm_vgic_global_state.vctrl_base = NULL;
> @@ -114,13 +141,53 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
>  	if (gicv5_irs_extract_vm_caps(info))
>  		goto skip_v5;
>  
> -	kvm_vgic_global_state.max_gic_vcpus = VGIC_V5_MAX_CPUS;
> +	ist_caps = vgic_v5_host_caps();
> +
> +	/*
> +	 * Even if the HW supports more per-VM vCPUs, artifically cap as we
> +	 * can't use them all.
> +	 */
> +	kvm_vgic_global_state.max_gic_vcpus = min(ist_caps->max_vpes,
> +						  VGIC_V5_MAX_CPUS);
> +
> +	/*
> +	 * GICv5 requires a set of tables to be allocated in order to manage
> +	 * VMs. We allocate them in advance here, which alas means that we
> +	 * already have to make a decisions regarding the maximum number of VMs
> +	 * we want to run. For now, we match the maximum number offered by the
> +	 * hardware, but this might not be a wise choice in the long term.
> +	 */
> +	ret = vgic_v5_vmt_allocate(ist_caps->two_level_vmt_support,
> +				   ist_caps->max_vms, ist_caps->vmd_size,
> +				   ist_caps->vped_size,
> +				   kvm_vgic_global_state.max_gic_vcpus);
> +	if (ret) {
> +		kvm_err("Failed to allocate the GICv5 VM tables; no GICv5 support\n");
> +		goto skip_v5;
> +	}
> +
> +	/*
> +	 * We've now allocated the VM table, but the host's IRS doesn't know
> +	 * about it yet. Provide the base address of the VMT to the IRS, as well
> +	 * as the number of ID bits that it covers and the structure used
> +	 * (linear/two-level).
> +	 */
> +	ret = vgic_v5_irs_assign_vmt(ist_caps->two_level_vmt_support,
> +				     vgic_v5_vmt_vpe_id_bits(),

You're passing vpe_id_bits to vm_id_bits. Should this be vgic_v5_host_caps()->max_vms?

> +				     vgic_v5_get_vmt_base());
> +	if (ret) {
> +		kvm_err("Failed to assign the GICv5 VM tables to the IRS; no GICv5 support\n");
> +		vgic_v5_vmt_free();
> +		goto skip_v5;
> +	}
>  
>  	vgic_v5_get_implemented_ppis();
>  
>  	ret = kvm_register_vgic_device(KVM_DEV_TYPE_ARM_VGIC_V5);
>  	if (ret) {
>  		kvm_err("Cannot register GICv5 KVM device.\n");
> +		vgic_v5_irs_clear_vmt();
> +		vgic_v5_vmt_free();
>  		goto skip_v5;
>  	}
>  
> @@ -148,12 +215,13 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
>  	ret = kvm_register_vgic_device(KVM_DEV_TYPE_ARM_VGIC_V3);
>  	if (ret) {
>  		kvm_err("Cannot register GICv3-legacy KVM device.\n");
> -		return ret;
> +		/* vGICv5 should still work */
> +		return v5_registered ? 0 : ret;
>  	}
>  
>  	/* We potentially limit the max VCPUs further than we need to here */
>  	kvm_vgic_global_state.max_gic_vcpus = min(VGIC_V3_MAX_CPUS,
> -						  VGIC_V5_MAX_CPUS);
> +						  kvm_vgic_global_state.max_gic_vcpus);
>  
>  	static_branch_enable(&kvm_vgic_global_state.gicv3_cpuif);
>  	kvm_info("GCIE legacy system register CPU interface\n");

[...]

Thanks,
Joey

