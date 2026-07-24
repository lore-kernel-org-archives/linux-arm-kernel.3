Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DDC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc2VYYqrq42W/5SGTHQcpL32EmlWmR6pet5QVyrl61U=; b=SRSKk+0c8wP/NZiAOesjmd1/Xr
	T6z+Fr4wJprloTMOnJv5HuneohdjZfRq7unAGgVmIEtBCHct+7ImXqsLYKsNNOvhKoF2RYbijntQG
	qcxjfuMoD+fFndYhEYjtsC6Z242ZEM+yn8/c7OgK5q8nXkiIro8jorlucW9Y4cKqteziv2cUMsq7c
	lxRUKg1JAPXvpAHl4o6er1FDdhtghwladhfWIJS5skoTXUp+QV7oNyOkB0ds49iwGwQUoygkNGR1+
	W0aNmEsPnPB8ZOKgwzO0oFzI9WJrWiJL+Upr0JmgA0BeNI3j/27/V/lwLvaR2KNbHkkF9XF21z2Mq
	VWeJaH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAz2-0000000Fm4U-3SnQ;
	Fri, 24 Jul 2026 08:10:16 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAz0-0000000Fm3l-3vho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784880612; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=tc2VYYqrq42W/5SGTHQcpL32EmlWmR6pet5QVyrl61U=;
	b=vQR+Sv0Ps7CCX8dstyyNC+jwg4yqwiSmbt6PWsV1U5w6ne1cl4Zgk2wQdZkjip/VG6YWpnRJ77+Qu8dbNPcN4KEIANFGwNUazX2EHOZdgB0qtaExVTUVHYHET8IVCYr+csNVBB9WrkUiMD33CUNb8pfcwSSp+iZXJ4sQ8BlL6PE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iVo7m_1784880611;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iVo7m_1784880611 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 16:10:11 +0800
Date: Fri, 24 Jul 2026 16:10:10 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 23/28] KVM: arm64: Add NVHCR_EL2 context switching
Message-ID: <yxrqmwrf5uwsf7a7g2rtdpamrl7m2tjfpuo4kqizqocmi4c3rf@cfcvhsur23jj>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-24-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-24-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_011015_155747_CDF79B93 
X-CRM114-Status: GOOD (  23.60  )
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

On Wed, Jul 22, 2026 at 08:42:29AM +0800, Marc Zyngier wrote:
> Since NVHCR_EL2 represents the HCR_EL2 state of the EL1 guest, it
> must be dealt with in some particular way:
>
> - for a guest in hyp context (an L1 by definition), NVHCR_EL2 directly
>   reflects HCR_EL2 as read and written by the guest itself. It must
>   therefore be eagerly synced back with the emulation code which only
>   knows about HCR_EL2. This is unconditional if NV3 is available on
>   the host.
>
> - For an L2 guest, NVHCR_EL2 is controlled by the L1 guest, and we
>   just context switch it like any other EL1 register. Yes, EL1, as
>   that's where this thing runs from the PoV of L1. This is conditioned
>   on the guest using NV3.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 +++++++++++
>  arch/arm64/kvm/hyp/vhe/switch.c            | 10 ++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de9..c382848d31947 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -172,6 +172,10 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>
>  	if (ctxt_has_sctlr2(ctxt))
>  		ctxt_sys_reg(ctxt, SCTLR2_EL1) = read_sysreg_el1(SYS_SCTLR2);
> +
> +	/* Retrieve L2's HCR_EL2, and save it for future use */
> +	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
> +		ctxt_sys_reg(ctxt, NVHCR_EL2) = read_sysreg_s(SYS_NVHCR_EL2);
>  }
>
>  static inline void __sysreg_save_el2_return_state(struct kvm_cpu_context *ctxt)
> @@ -285,6 +289,13 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
>
>  	if (ctxt_has_sctlr2(ctxt))
>  		write_sysreg_el1(ctxt_sys_reg(ctxt, SCTLR2_EL1), SYS_SCTLR2);
> +
> +	/*
> +	 * Publish the L2 view of HCR_EL2 to the HW if L1 is using NV3.
> +	 * Otherwise, the data is already in place in the L1's own VNCR.
> +	 */
> +	if (is_nested_nv3_ctxt(ctxt_to_vcpu(ctxt)))
> +		write_sysreg_s(ctxt_sys_reg(ctxt, NVHCR_EL2), SYS_NVHCR_EL2);
>  }
>
>  /* Read the VCPU state's PSTATE, but translate (v)EL2 to EL1. */
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index e5a51dc3cbe5e..cbda9e087db39 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -71,7 +71,10 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
>  			hcr |= HCR_NV1;
>
>  		/* Publish the guest's view of HCR_EL2 to the HW */
> -		__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
> +		if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
> +			write_sysreg_s(__vcpu_sys_reg(vcpu, HCR_EL2), SYS_NVHCR_EL2);
> +		else
> +			__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
>
>  		/*
>  		 * Nothing in HCR_EL2 should impact running in hypervisor
> @@ -567,7 +570,10 @@ static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
>  		*vcpu_cpsr(vcpu) |= mode;
>
>  		/* Publish the latest HCR_EL2 to the emulation */
> -		hcr = __vcpu_sys_reg(vcpu, NVHCR_EL2);
> +		hcr = (cpus_have_final_cap(ARM64_HAS_NV3) &&
> +		       vcpu_el2_e2h_is_set(vcpu)) ?
> +			read_sysreg_s(SYS_NVHCR_EL2) :
> +			__vcpu_sys_reg(vcpu, NVHCR_EL2);

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
>  		__vcpu_assign_sys_reg(vcpu, HCR_EL2, hcr);
>  	}
> --
> 2.47.3

