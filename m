Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3126C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a41+bB89oEsW1wfNqTnoD2mSGvojfgsSkj8QeUjUjjg=; b=gHaVzqCNlB73KMcnvl3JJx47SQ
	dz2wJ+Xk59j2Rs4pLMSKrTSnAeas7AF5DwdKvk++EHldeBYcSu51nv6wpHtTWVYetIuCRH6+be0tD
	d9Q3wRBGzhqMGybDXMMBVCuqvEUKKh8Z19tmBQJFCzZUer2cbd4KvJkFL13bUrLBYZlviWP+MhRdS
	vrDGj4Wn1AwfW1t5pauAIZ2RDS776k/07HBdjCkOSEUuZntiGY3+SDwYRS8NGXTW//KlA2qgFEeOe
	LlFg1vrDDDIMC2THruRRdr3eVU496U1QU48WU823kSGaXCzfbTXeHWQnQLhsUp5q1tE0ZJncgm+5Q
	bvOM6GyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpyb-00000003swD-1Zfa;
	Tue, 11 Feb 2025 13:06:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpVH-00000003na6-2rTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F48D1424;
	Tue, 11 Feb 2025 04:37:00 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8A6C3F6A8;
	Tue, 11 Feb 2025 04:36:37 -0800 (PST)
Date: Tue, 11 Feb 2025 12:36:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 06/18] KVM: arm64: Plug FEAT_GCS handling
Message-ID: <Z6tEUzwcHVHALIdu@J2N7QTR9R3>
References: <20250210184150.2145093-1-maz@kernel.org>
 <20250210184150.2145093-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210184150.2145093-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_043639_764160_AC6213E1 
X-CRM114-Status: GOOD (  20.82  )
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

On Mon, Feb 10, 2025 at 06:41:37PM +0000, Marc Zyngier wrote:
> We don't seem to be handling the GCS-specific exception class.
> Handle it by delivering an UNDEF to the guest, and populate the
> relevant trap bits.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/handle_exit.c | 11 +++++++++++
>  arch/arm64/kvm/sys_regs.c    |  8 ++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 4f8354bf7dc5f..624a78a99e38a 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -294,6 +294,16 @@ static int handle_svc(struct kvm_vcpu *vcpu)
>  	return 1;
>  }
>  
> +static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
> +{
> +	/* We don't expect GCS, so treat it with contempt */
> +	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> +		WARN_ON_ONCE(1);

Just to check / better my understanging, do we enforce that this can't
be exposed to the guest somewhere?

I see __kvm_read_sanitised_id_reg() masks it out, and the sys_reg_descs
table has it filtered, but I'm not immediately sure whether that
prevents host userspace maliciously setting this?

Otherwise this looks good to me.

Mark.

> +
> +	kvm_inject_undefined(vcpu);
> +	return 1;
> +}
> +
>  static int handle_ls64b(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> @@ -384,6 +394,7 @@ static exit_handle_fn arm_exit_handlers[] = {
>  	[ESR_ELx_EC_BRK64]	= kvm_handle_guest_debug,
>  	[ESR_ELx_EC_FP_ASIMD]	= kvm_handle_fpasimd,
>  	[ESR_ELx_EC_PAC]	= kvm_handle_ptrauth,
> +	[ESR_ELx_EC_GCS]	= kvm_handle_gcs,
>  };
>  
>  static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 18721c773475d..2ecd0d51a2dae 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5056,6 +5056,14 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
>  						HFGITR_EL2_nBRBIALL);
>  	}
>  
> +	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP)) {
> +		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
> +						HFGxTR_EL2_nGCS_EL1);
> +		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_nGCSPUSHM_EL1 |
> +						HFGITR_EL2_nGCSSTR_EL1 |
> +						HFGITR_EL2_nGCSEPP);
> +	}
> +
>  	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
>  out:
>  	mutex_unlock(&kvm->arch.config_lock);
> -- 
> 2.39.2
> 

