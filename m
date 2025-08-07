Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E927C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+m3CLRJeGGFy4BLD6C7GaUw1o2PjTEdTvohH8r846A=; b=PNixOwpIt/iFXwk+JjTbAcZCEW
	YK4jfrXKDd4ZGtn82W5LyCypau1OYIVDBWU19hVMjbtf/UFZb3F4EKofj8IAMpKY7U7JEVEn/YEih
	Jcr4GxY4cO1jMg6DGVIz8qbcuUSW1t+PSQl8RLyIe1tsCsPx+iVGDICjkCm4l3wz0BPGcnfna7uz9
	WVsPgZ+Vr75E8vFfoUNQ9E3zrwJemrQOAzRAPj7QPEXacWJhOC+BMMV63crd0CT2/Xsi/hdBvsjgN
	fUEDGRGg5irh7rfKWjtyLscX87SpbQYBOK9UGG5SiidKIkyIeZ4z2Yfm3NEuKu13X9MLRK2QzIF+u
	VFbCKO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0Jn-00000000drb-1rAc;
	Thu, 07 Aug 2025 13:06:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk09j-00000000c8N-3byJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:55:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C7841713;
	Thu,  7 Aug 2025 05:55:27 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCA5A3F5A1;
	Thu,  7 Aug 2025 05:55:33 -0700 (PDT)
Date: Thu, 7 Aug 2025 13:55:31 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Expose FEAT_RASv1p1 in a canonical
 manner
Message-ID: <20250807125531.GB2351327@e124191.cambridge.arm.com>
References: <20250806165615.1513164-1-maz@kernel.org>
 <20250806165615.1513164-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806165615.1513164-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_055539_976827_56936DBD 
X-CRM114-Status: GOOD (  22.15  )
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

On Wed, Aug 06, 2025 at 05:56:14PM +0100, Marc Zyngier wrote:
> If we have RASv1p1 on the host, advertise it to the guest in the
> "canonical way", by setting ID_AA64PFR0_EL1 to V1P1, rather than
> the convoluted RAS+RAS_frac method.
> 
> Note that this also advertises FEAT_DoubleFault, which doesn't
> affect the guest at all, as only EL3 is concerned by this.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1b4114790024e..66e5a733e9628 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1800,6 +1800,18 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>  	if (!vcpu_has_sve(vcpu))
>  		val &= ~ID_AA64PFR0_EL1_SVE_MASK;
>  
> +	/*
> +	 * Describe RASv1p1 in a canonical way -- ID_AA64PFR1_EL1.RAS_frac
> +	 * is cleared separately. Note that by advertising RASv1p1 here, we

Where is it cleared? __kvm_read_sanitised_id_reg() is where I would have
expected to see it:

    case SYS_ID_AA64PFR1_EL1:                                                                                                                                                                  
        if (!kvm_has_mte(vcpu->kvm)) {                                                                                                                                                         
            val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);                                                                                                                                   
            val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);                                                                                                                              
        }                                                                                                                                                                                      
                                                                                                                                                                                               
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);                                                                                                                                       
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);                                                                                                                                 
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);                                                                                                                                       
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);                                                                                                                                       
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);                                                                                                                                       
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);                                                                                                                                      
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);                                                                                                                                      
        val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);                                                                                                                                 
        break;                                                                  

> +	 * implicitly advertise FEAT_DoubleFault. However, since that last
> +	 * feature is a pure EL3 feature, this is not relevant for the
> +	 * guest, and we save on the complexity.
> +	 */
> +	if (cpus_have_final_cap(ARM64_HAS_RASV1P1_EXTN)) {
> +		val &= ~ID_AA64PFR0_EL1_RAS;
> +		val |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, RAS, V1P1);
> +	}
> +
>  	/*
>  	 * The default is to expose CSV2 == 1 if the HW isn't affected.
>  	 * Although this is a per-CPU feature, we make it global because
> -- 
> 2.39.2
> 

