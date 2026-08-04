Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C072C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFLaVenczDK5Ii5dl1l3XfeTIeVw3Ra44uNhpjbL//A=; b=U0N2A3+qXhNus/U2o3k0m1N9u7
	J5jLmftRses3eNML5p4wS/JYrhN/yeSrGJJXSnd5fDnCUoBVXPgLzWXQCKhOt6rT0wrI/O/rz2TiF
	ORmkhmK+8D87ktkCGKvpNaoZI7G+j/zhEZf0KCmKRaXaGFmVC+dte6/ZGqnVoKTnucKcFrKG7NTvw
	gvpB7lcLjfp16O2+sKh4eCd69S+eFgILlDIcH5QxMjQFgx2leqHAuprn5acw9gbguQalVw3PsQAJL
	xpKogEx99Deb+0BTaRzGd6AvMwt3L9IpZYDjny80jlgMKawRlA1sPVyCLAB5Yn3uXG6ojYDvsRvlV
	SjMHGfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5AJ-00000000rbu-1hCZ;
	Tue, 04 Aug 2026 02:46:03 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5AH-00000000raz-1Xll
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785811557; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=tFLaVenczDK5Ii5dl1l3XfeTIeVw3Ra44uNhpjbL//A=;
	b=a0aG8T0Q1EIHtPiTuvkte4YWxiVL4hMRu66/W91YZEXIdjkjInZ+4IqMg9H1WEJmKsuBnmNTYheAZIFqV+ac2YEG6ivOljgUHCXpRA/SbSV+aVRjlGX3BViKH57WfadphMJvBMMAj4Qc2nWG7+GfizOFEBrifu7ujmJBciHemf0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X8MEYed_1785811556;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8MEYed_1785811556 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 04 Aug 2026 10:45:56 +0800
Date: Tue, 4 Aug 2026 10:45:55 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] KVM: arm64: Remove VM-wide VNCR mapping counter
Message-ID: <loio5yjlm222debm2ohrpo6kz5ayviye2ugubv3nso6ouzglt5@ru3cnrl5f5cp>
References: <20260801124818.366274-1-maz@kernel.org>
 <20260801124818.366274-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801124818.366274-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194601_565642_F6B9391E 
X-CRM114-Status: GOOD (  28.08  )
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

On Sat, Aug 01, 2026 at 01:48:13PM +0800, Marc Zyngier wrote:
> The global VNCR mapping counter is used to decide whether an L1
> provided VNCR page is mapped in L0 on any CPU at the point of
> dealing with a TLB invalidation. It is incremented when a mapping
> is made in the fixmap, and decremented when unmapped.
>
> As it turns out, this tracking has several flaws:
>
> - we are trying to invalidate TLBs, and the mapping is only an
>   opportunistic consequence of the TLB. Checking this counter to
>   decide whether a TLB needs to be invalidated may result in missed
>   invalidations.
>
> - an L1 vcpu invalidating its own TLB (a very likely case) will not
>   succeed in invalidating the VNCR pseudo TLB because that page is
>   not mapped in L0 at this stage.

Agree, the easiest way to trigger the issue is run single
vcpu L1 and run single vcpu L2. I think it's more harder to
hit the issue if the L1 has more vcpus and run L2 w/ more
than 1 L2 vcpus.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Given that this tracking fails at delivering the minimum guarantees
> that are required and is only a performance optimisation, remove it
> completely.
>
> Fixes: 4ffa72ad8f37e ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 ---
>  arch/arm64/kvm/hyp/vhe/switch.c   | 3 +--
>  arch/arm64/kvm/nested.c           | 3 ---
>  3 files changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5c..ac16f96c878d6 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -411,9 +411,6 @@ struct kvm_arch {
>  	/* Masks for VNCR-backed and general EL2 sysregs */
>  	struct kvm_sysreg_masks	*sysreg_masks;
>
> -	/* Count the number of VNCR_EL2 currently mapped */
> -	atomic_t vncr_map_count;
> -
>  	/*
>  	 * For an untrusted host VM, 'pkvm.handle' is used to lookup
>  	 * the associated pKVM instance in the hypervisor.
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index bbe9cebd3d9d5..c09b1d411c584 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -427,8 +427,7 @@ static bool kvm_hyp_handle_tlbi_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	 * If we have to check for any VNCR mapping being invalidated,
>  	 * go back to the slow path for further processing.
>  	 */
> -	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu) &&
> -	    atomic_read(&vcpu->kvm->arch.vncr_map_count))
> +	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
>  		return false;
>
>  	__kvm_skip_instr(vcpu);
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index dfb96edbdc43c..f3c75954cf36c 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -48,7 +48,6 @@ void kvm_init_nested(struct kvm *kvm)
>  {
>  	kvm->arch.nested_mmus = NULL;
>  	kvm->arch.nested_mmus_size = 0;
> -	atomic_set(&kvm->arch.vncr_map_count, 0);
>  }
>
>  static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
> @@ -890,7 +889,6 @@ static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
>  	clear_fixmap(vncr_fixmap(vcpu->arch.vncr_tlb->cpu));
>  	vcpu->arch.vncr_tlb->cpu = -1;
>  	host_data_clear_flag(L1_VNCR_MAPPED);
> -	atomic_dec(&vcpu->kvm->arch.vncr_map_count);
>  }
>
>  void kvm_vcpu_put_hw_mmu(struct kvm_vcpu *vcpu)
> @@ -1592,7 +1590,6 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
>  	if (pgprot_val(prot) != pgprot_val(PAGE_NONE)) {
>  		__set_fixmap(vncr_fixmap(vt->cpu), vt->hpa, prot);
>  		host_data_set_flag(L1_VNCR_MAPPED);
> -		atomic_inc(&vcpu->kvm->arch.vncr_map_count);
>  	}
>  }
>
> --
> 2.47.3
>

