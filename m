Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC0AF436BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vch+b5gN8XkDATxEAmBf1usmVfgP52a23Hj3kYuiWCw=; b=bJxFCdmwCCCfu8/AwAZlhz2NdZ
	gxy2DEvO/FLWx9Rtixj0al1lvA6fMuFQXdx8fbXmvKstKERWUPRtYoXVW0docer0gU49kld4UY0o9
	yhteDPQrKNKheezmQV62c+UrqI2fZMMBiR52ixj/eO0ynjjxsr26Ve2ULGQYstDQAft/hKs4NXFaN
	kJiIS0ML+u9mbYLeUUTzqjZG9jX7poih9KA+NbwM44dyocFpgGpLvZE19NC85Oxgzf7DkAEytAeGh
	WYGg0qwaoLNLW6DuZOo/jb632boWUimfjVjeopQYGYzLfd1JBGSROLzYkmsljnJlg99/5nGHWQ7ao
	cW0tQwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlm6-00000004FP3-1fdc;
	Fri, 17 Apr 2026 16:10:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlm3-00000004FOY-4645
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 16:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59A871DB5;
	Fri, 17 Apr 2026 09:10:24 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42973F641;
	Fri, 17 Apr 2026 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776442230; bh=XX5Jc5mwKcR3BHo7TPiJOgf4iAQTIKsLBFkjvK6rZPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmPMow/vX8WYOIT1UZvNxYcV3rE+cDGzptJrJv//wnH/4t7JrUskipDkXBTQvwWvC
	 SHD334VgWS2Zr5iDQ5mAhsTkGdXeDX4Ml94dUOUPrGb3bNkcmgJIXubWuH8gxmsopo
	 VmQKtLOkLErgUnwB+X8igVawt8eezB79SU8IEj6o=
Date: Fri, 17 Apr 2026 17:10:26 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 09/18] KVM: arm64: vgic-v5: Limit support to 64 PPIs
Message-ID: <20260417161026.GC3311048@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-10-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-10-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_091032_100377_48B3C720 
X-CRM114-Status: GOOD (  29.57  )
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

On Wed, Apr 15, 2026 at 12:55:50PM +0100, Marc Zyngier wrote:
> Although we have some code supporting 128 PPIs, the only supported
> configuration is 64 PPIs. There is no way to test the 128 PPI code,
> so it is bound to bitrot very quickly.
> 
> Given that KVM/arm64's goal has always been to stick to non-IMPDEF
> behaviours, drop the 128 PPI support. Someone motivated enough and
> with very strong arguments can always bring it back -- it's all in
> the git history.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/hyp/vgic-v5-sr.c       | 82 ++++++---------------------
>  arch/arm64/kvm/sys_regs.c             | 17 +++---
>  arch/arm64/kvm/vgic/vgic-kvm-device.c |  9 +--
>  3 files changed, 26 insertions(+), 82 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/vgic-v5-sr.c b/arch/arm64/kvm/hyp/vgic-v5-sr.c
> index 47e6bcd437029..6d69dfe89a96c 100644
> --- a/arch/arm64/kvm/hyp/vgic-v5-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v5-sr.c
> @@ -30,10 +30,9 @@ void __vgic_v5_save_ppi_state(struct vgic_v5_cpu_if *cpu_if)
>  {
>  	/*
>  	 * The following code assumes that the bitmap storage that we have for
> -	 * PPIs is either 64 (architected PPIs, only) or 128 bits (architected &
> -	 * impdef PPIs).
> +	 * PPIs is either 64 (architected PPIs, only).
>  	 */
> -	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS % 64);
> +	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS != 64);
>  
>  	bitmap_write(host_data_ptr(vgic_v5_ppi_state)->activer_exit,
>  		     read_sysreg_s(SYS_ICH_PPI_ACTIVER0_EL2), 0, 64);
> @@ -49,22 +48,6 @@ void __vgic_v5_save_ppi_state(struct vgic_v5_cpu_if *cpu_if)
>  	cpu_if->vgic_ppi_priorityr[6] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR6_EL2);
>  	cpu_if->vgic_ppi_priorityr[7] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR7_EL2);
>  
> -	if (VGIC_V5_NR_PRIVATE_IRQS == 128) {
> -		bitmap_write(host_data_ptr(vgic_v5_ppi_state)->activer_exit,
> -			     read_sysreg_s(SYS_ICH_PPI_ACTIVER1_EL2), 64, 64);
> -		bitmap_write(host_data_ptr(vgic_v5_ppi_state)->pendr,
> -			     read_sysreg_s(SYS_ICH_PPI_PENDR1_EL2), 64, 64);
> -
> -		cpu_if->vgic_ppi_priorityr[8] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR8_EL2);
> -		cpu_if->vgic_ppi_priorityr[9] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR9_EL2);
> -		cpu_if->vgic_ppi_priorityr[10] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR10_EL2);
> -		cpu_if->vgic_ppi_priorityr[11] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR11_EL2);
> -		cpu_if->vgic_ppi_priorityr[12] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR12_EL2);
> -		cpu_if->vgic_ppi_priorityr[13] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR13_EL2);
> -		cpu_if->vgic_ppi_priorityr[14] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR14_EL2);
> -		cpu_if->vgic_ppi_priorityr[15] = read_sysreg_s(SYS_ICH_PPI_PRIORITYR15_EL2);
> -	}
> -
>  	/* Now that we are done, disable DVI */
>  	write_sysreg_s(0, SYS_ICH_PPI_DVIR0_EL2);
>  	write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
> @@ -74,9 +57,6 @@ void __vgic_v5_restore_ppi_state(struct vgic_v5_cpu_if *cpu_if)
>  {
>  	DECLARE_BITMAP(pendr, VGIC_V5_NR_PRIVATE_IRQS);
>  
> -	/* We assume 64 or 128 PPIs - see above comment */
> -	BUILD_BUG_ON(VGIC_V5_NR_PRIVATE_IRQS % 64);
> -
>  	/* Enable DVI so that the guest's interrupt config takes over */
>  	write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_dvir, 0, 64),
>  		       SYS_ICH_PPI_DVIR0_EL2);
> @@ -108,50 +88,20 @@ void __vgic_v5_restore_ppi_state(struct vgic_v5_cpu_if *cpu_if)
>  	write_sysreg_s(cpu_if->vgic_ppi_priorityr[7],
>  		       SYS_ICH_PPI_PRIORITYR7_EL2);
>  
> -	if (VGIC_V5_NR_PRIVATE_IRQS == 128) {
> -		/* Enable DVI so that the guest's interrupt config takes over */
> -		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_dvir, 64, 64),
> -			       SYS_ICH_PPI_DVIR1_EL2);
> -
> -		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_activer, 64, 64),
> -			       SYS_ICH_PPI_ACTIVER1_EL2);
> -		write_sysreg_s(bitmap_read(cpu_if->vgic_ppi_enabler, 64, 64),
> -			       SYS_ICH_PPI_ENABLER1_EL2);
> -		write_sysreg_s(bitmap_read(pendr, 64, 64),
> -			       SYS_ICH_PPI_PENDR1_EL2);
> -
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[8],
> -			       SYS_ICH_PPI_PRIORITYR8_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[9],
> -			       SYS_ICH_PPI_PRIORITYR9_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[10],
> -			       SYS_ICH_PPI_PRIORITYR10_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[11],
> -			       SYS_ICH_PPI_PRIORITYR11_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[12],
> -			       SYS_ICH_PPI_PRIORITYR12_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[13],
> -			       SYS_ICH_PPI_PRIORITYR13_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[14],
> -			       SYS_ICH_PPI_PRIORITYR14_EL2);
> -		write_sysreg_s(cpu_if->vgic_ppi_priorityr[15],
> -			       SYS_ICH_PPI_PRIORITYR15_EL2);
> -	} else {
> -		write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
> -
> -		write_sysreg_s(0, SYS_ICH_PPI_ACTIVER1_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_ENABLER1_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PENDR1_EL2);
> -
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR8_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR9_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR10_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR11_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR12_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR13_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR14_EL2);
> -		write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR15_EL2);
> -	}
> +	write_sysreg_s(0, SYS_ICH_PPI_DVIR1_EL2);
> +
> +	write_sysreg_s(0, SYS_ICH_PPI_ACTIVER1_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_ENABLER1_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PENDR1_EL2);
> +
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR8_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR9_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR10_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR11_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR12_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR13_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR14_EL2);
> +	write_sysreg_s(0, SYS_ICH_PPI_PRIORITYR15_EL2);
>  }
>  
>  void __vgic_v5_save_state(struct vgic_v5_cpu_if *cpu_if)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 4ef13ac0703df..eba3ef793097d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -724,6 +724,7 @@ static bool access_gicv5_ppi_enabler(struct kvm_vcpu *vcpu,
>  {
>  	unsigned long *mask = vcpu->kvm->arch.vgic.gicv5_vm.vgic_ppi_mask;
>  	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	unsigned long reg = p->regval;
>  	int i;
>  
>  	/* We never expect to get here with a read! */
> @@ -731,21 +732,17 @@ static bool access_gicv5_ppi_enabler(struct kvm_vcpu *vcpu,
>  		return undef_access(vcpu, p, r);
>  
>  	/*
> -	 * If we're only handling architected PPIs and the guest writes to the
> -	 * enable for the non-architected PPIs, we just return as there's
> -	 * nothing to do at all. We don't even allocate the storage for them in
> -	 * this case.
> +	 * As we're only handling architected PPIs, the guest writes to the
> +	 * enable for the non-architected PPIs just return as there's
> +	 * nothing to do at all. We don't even allocate the storage for them.
>  	 */
> -	if (VGIC_V5_NR_PRIVATE_IRQS == 64 && p->Op2 % 2)
> +	if (p->Op2 % 2)
>  		return true;
>  
>  	/*
> -	 * Merge the raw guest write into out bitmap at an offset of either 0 or
> -	 * 64, then and it with our PPI mask.
> +	 * Merge the raw guest write into out bitmap, anded with our PPI mask.
>  	 */
> -	bitmap_write(cpu_if->vgic_ppi_enabler, p->regval, 64 * (p->Op2 % 2), 64);
> -	bitmap_and(cpu_if->vgic_ppi_enabler, cpu_if->vgic_ppi_enabler, mask,
> -		   VGIC_V5_NR_PRIVATE_IRQS);
> +	bitmap_and(cpu_if->vgic_ppi_enabler, &reg, mask, VGIC_V5_NR_PRIVATE_IRQS);
>  
>  	/*
>  	 * Sync the change in enable states to the vgic_irqs. We consider all
> diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> index a96c77dccf353..90be99443df3b 100644
> --- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
> +++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> @@ -730,18 +730,15 @@ static int vgic_v5_get_userspace_ppis(struct kvm_device *dev,
>  	guard(mutex)(&dev->kvm->arch.config_lock);
>  
>  	/*
> -	 * We either support 64 or 128 PPIs. In the former case, we need to
> -	 * return 0s for the second 64 bits as we have no storage backing those.
> +	 * We only support 64 PPIs, so, we need to return 0s for the
> +	 * second 64 bits as we have no storage backing those.
>  	 */
>  	ret = put_user(bitmap_read(gicv5_vm->userspace_ppis, 0, 64), uaddr);
>  	if (ret)
>  		return ret;
>  	uaddr++;
>  
> -	if (VGIC_V5_NR_PRIVATE_IRQS == 128)
> -		ret = put_user(bitmap_read(gicv5_vm->userspace_ppis, 64, 128), uaddr);
> -	else
> -		ret = put_user(0, uaddr);
> +	ret = put_user(0, uaddr);
>  
>  	return ret;
>  }
> -- 
> 2.47.3
> 

