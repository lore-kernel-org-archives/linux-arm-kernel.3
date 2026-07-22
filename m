Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569A4C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JveG0oejOW2O9COzeYw/2B+NG7nZfbNpTQXg7A1ksyo=; b=tguJD/bLhY9menkjMH5OiopxO3
	EA74iUEj1dFUpB0bM+R3MDomXu/ppgz46lxx/UmSCZBkYUeFIpMH5KNheCp1oCh22MokVffTK3yJ3
	voc3nlZMD73Ns/wNKco97rYPCTgtoE8jsDxERDm3XHXCfJ7QZDbxFjhXdA5x8X/1OH/+i983iTXZ0
	1pewTha0nfCEyxP/Q5lIklx4EwuHjHuWibKVd9XOvKjWNj3UY5/X8zGHkSqXqXC/xSaQcZo5ifC9T
	upwLsxoHzv1MwRifKoUiIaRRUYISyiijS35q5uTGP6ZWKdkxrZZ7rBGqKe+xUtEB95tSt/W63M7Lf
	nQG5MoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSIu-0000000BFke-3eLL;
	Wed, 22 Jul 2026 08:27:48 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSIr-0000000BFjL-2X7p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784708867; x=1816244867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6/Cy2Lm2NZMPaXXZdMdvVBBo9YiQl5f2TUMPmfny+2k=;
  b=l10Ar2pcBNOjopLXhdXmcvKH1YgoikSh2BEvkw11iukuxcwlyhIg1poO
   eC4BUma4ggFzNypoOoXNlIchD3SE5HYBEfrrlt3NSYV+d8nqqf5Q5pT1/
   /4PYfIRcvRrOR5r1I//kgc8WwbLhzR8kgu5/RrtwsS6/jgBvrLnq3obMu
   hJNIEln+CNlBjtCVXRtyjeqjaUqTkzvEQiewAEgyZ6jisYfJ9HCNYVZgW
   j4bsRtgI+0B+Xi1iltVKwei3QX2Fty2gQtydgh5aT9gyBBUKwgsy9PvWv
   iTQYuMz2mN1apaD5wbKC8Xb3X1yx0Trnev/TMhHjst6spTx96Qq1Hii7x
   A==;
X-CSE-ConnectionGUID: LMrvxJjLQUWlkQ4YcOYm+g==
X-CSE-MsgGUID: /G+sfGXIRzKbiNUq7pAkZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="236168811"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="236168811"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 17:27:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D7AB01002B89
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:27:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9085686127C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:27:40 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.69.159])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id 212C0404331;
	Wed, 22 Jul 2026 08:27:29 +0000 (UTC)
Date: Wed, 22 Jul 2026 17:27:29 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v15 12/37] KVM: arm64: CCA: Support the VGIC in realms
Message-ID: <amB-opawGgF6jNHB@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-13-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715142841.80544-13-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012746_066708_AAD701B5 
X-CRM114-Status: GOOD (  30.02  )
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

On 07/15 15:28, Steven Price wrote:
> The RMM provides emulation of a VGIC to the realm guest. With RMM v2.0
> the registers are passed in the system registers so this works similar
> to a normal guest, but kvm_arch_vcpu_put() need reordering to early out,
> and realm guests don't support GICv2 even if the host does.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Hi Steven,

I've been testing this series and found that when the host CPU doesn't have
ARM64_HAS_ICH_HCR_EL2_TDIR this series doesn't work as expected.

Since commit 2a28810cbb8b ("KVM: arm64: GICv3: Detect and work around the lack
of ICV_DIR_EL1 trapping"), when the host CPU doesn't support this feature, KVM
traps all GIC sysreg accesses in the common group. However, currently trap
handlers for ICC_{PMR,RPR,CTLR}_EL1 registers are missing [0]. So when Realm
guests try to access those registers, KVM traps them but just emits the warning
shown in [1], and Realm guests fail to boot.

As far as I can tell, the CCA requirements don't require the
ARM64_HAS_ICH_HCR_EL2_TDIR feature. If that's the case, this seems to be a
problem. Is there any workaround for this issue, or should we implement trap
handlers for those registers?

Thanks,
Kohei

[0]
static const struct sys_reg_desc sys_reg_descs[] = {
    ...
	{ SYS_DESC(SYS_ICC_PMR_EL1), undef_access },
	{ SYS_DESC(SYS_ICC_RPR_EL1), undef_access },
	{ SYS_DESC(SYS_ICC_CTLR_EL1), undef_access },
};

[1]
------------[ cut here ]------------
Unexpected undefined exception injection to REC
WARNING: arch/arm64/kvm/inject_fault.c:330 at kvm_inject_undefined+0x100/0x148, CPU#1: kvm-vcpu-0/370
Modules linked in:
CPU: 1 UID: 0 PID: 370 Comm: kvm-vcpu-0 Not tainted 7.2.0-rc1-00096-gd6d40e6a3103 #161 PREEMPT(lazy)
[...]
Call trace:
 kvm_inject_undefined+0x100/0x148 (P)
 undef_access+0x18/0x30
 perform_access+0x54/0x1d0
 kvm_handle_sys_reg+0xfc/0x308
 rec_exit_sys_reg+0x34/0x168
 handle_rec_exit+0x12c/0x4c8
 kvm_arch_vcpu_ioctl_run+0x7a0/0x9a8
 kvm_vcpu_ioctl+0x180/0xb50
 __arm64_sys_ioctl+0xb4/0x118
 invoke_syscall.constprop.0+0xb8/0x120
 do_el0_svc+0x48/0xc8
 el0_svc+0x44/0x248
 el0t_64_sync_handler+0xa0/0xe8
 el0t_64_sync+0x198/0x1a0
---[ end trace 0000000000000000 ]---
 [...]

> ---
> Changes from v12:
>  * GIC registers are now passed in the system registers rather than via
>    rec_entry/rec_exit which removes most of the changes.
> Changes from v11:
>  * Minor changes to align with the previous patches. Note that the VGIC
>    handling will change with RMM v2.0.
> Changes from v10:
>  * Make sure we sync the VGIC v4 state, and only populate valid lrs from
>    the list.
> Changes from v9:
>  * Copy gicv3_vmcr from the RMM at the same time as gicv3_hcr rather
>    than having to handle that as a special case.
> Changes from v8:
>  * Propagate gicv3_hcr to from the RMM.
> Changes from v5:
>  * Handle RMM providing fewer GIC LRs than the hardware supports.
> ---
>  arch/arm64/kvm/arm.c            | 11 ++++++++---
>  arch/arm64/kvm/vgic/vgic-init.c |  2 +-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 38fac98cd6a4..2959a1451232 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -791,19 +791,24 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>  	}
>  
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
>  	kvm_vcpu_put_debug(vcpu);
> +
> +	vcpu->cpu = -1;
> +
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +
>  	kvm_arch_vcpu_put_fp(vcpu);
>  	if (has_vhe())
>  		kvm_vcpu_put_vhe(vcpu);
> -	kvm_timer_vcpu_put(vcpu);
> -	kvm_vgic_put(vcpu);
>  	kvm_vcpu_pmu_restore_host(vcpu);
>  	if (vcpu_has_nv(vcpu))
>  		kvm_vcpu_put_hw_mmu(vcpu);
>  	kvm_arm_vmid_clear_active();
>  
>  	vcpu_clear_on_unsupported_cpu(vcpu);
> -	vcpu->cpu = -1;
>  }
>  
>  static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 907057881b26..fd77db35ef02 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -81,7 +81,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  	 * the proper checks already.
>  	 */
>  	if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
> -		!kvm_vgic_global_state.can_emulate_gicv2)
> +	    (!kvm_vgic_global_state.can_emulate_gicv2 || kvm_is_realm(kvm)))
>  		return -ENODEV;
>  
>  	/*
> -- 
> 2.43.0
> 
> 

