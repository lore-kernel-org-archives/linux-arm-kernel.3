Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6DB10775F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qv+VyBE1K3FlDIC420JGSZ7lF1e0uHRwral33evP7M=; b=bJcSX+Hf3TvF6Iu0/mnNkhG/64
	D5ckaNxAjOphOakUvJvdU02t1QsL8UDoWpxCO+zUtBrPpkgnRG/YWf8NpEyBOkdPh9ppNvJyjSLtU
	K7dK3hMzgegR/rusKJg2O76VOLz3gjBjWC2D0G46u0Gpewth3AVZcOIWvfR9g6khi1zZEKDZQknsD
	8Q18C+gKvCmzjctQWBYO/HftpdWsO2Fdao+2sQntaGTnO5HjF7MRSY2gn3Lysq6PA8f1+rGhRr0TI
	rDl7nzRgH+Ro3/vLW7K4fhkWMr/G667E5/vMNBs7WGz9lSG57LkMljl2Xf/KPzlEk36iq0ZdbEKLz
	WsjqYfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ugE-000000094GB-41Zf;
	Wed, 18 Mar 2026 17:27:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ugD-000000094Fz-1Gxh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FD7A60142;
	Wed, 18 Mar 2026 17:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76149C19421;
	Wed, 18 Mar 2026 17:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854856;
	bh=T9bC6g62zkjZlkxi+B63SQAYsJpcohcn3oqwWLqc/zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0PWTNv2SzUQd+Ef31U2tJLHT/aTwdz2C0Jm+dvGlGhHJSH3SGAlB1CVuSGZ1eR+u
	 CO6A3NqVzKMU1gUn+Jo9FuYmA4vvQc7/qgCw1wGJ87XPYIDjjtpx1p3Bi9FUgm3Q0z
	 mRYmy3IiFE3ZZMPR5Q+CgPV2uyh3bUB1HDZTxeaXM/HjSYAH1Kg144iOpQUbJJY/+r
	 eEHgj4j5ecEStg029m6OqbSEwEehSF3g4Xyk9aGdl8KBlpudw57Kkmb2U7F9QN2Gco
	 PCm00fat2kiYqjQ4dxJkKoWNGjrptOcPO4tBtxe28vNZX8RUqi9o5muZNBT+zCQ2sQ
	 B2obfRn24xa3w==
Date: Wed, 18 Mar 2026 17:27:48 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 17/30] KVM: arm64: Support SME identification
 registers for guests
Message-ID: <20260318172748.GA2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-17-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-17-43f7683a0fb7@kernel.org>
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

On Fri, Mar 06, 2026 at 05:01:09PM +0000, Mark Brown wrote:
> The primary register for identifying SME is ID_AA64PFR1_EL1.SME.  This
> is hidden from guests unless SME is enabled by the VMM.
> When it is visible it is writable and can be used to control the
> availability of SME2.
> 
> There is also a new register ID_AA64SMFR0_EL1 which we make writable,
> forcing it to all bits 0 if SME is disabled.  This includes the field
> SMEver giving the SME version, userspace is responsible for ensuring
> the value is consistent with ID_AA64PFR1_EL1.SME.  It also includes
> FA64, a separately enableable extension which provides the full FPSIMD
> and SVE instruction set including FFR in streaming mode.  Userspace can
> control the availability of FA64 by writing to this field.  The other
> features enumerated there only add new instructions, there are no
> architectural controls for these.
> 
> There is a further identification register SMIDR_EL1 which provides a
> basic description of the SME microarchitecture, in a manner similar to
> MIDR_EL1 for the PE.  It also describes support for priority management
> and a basic affinity description for shared SME units, plus some RES0
> space.  We do not support priority management for guests so this is
> hidden from guests, along with any new fields.
> 
> As for MIDR_EL1 and REVIDR_EL1 we expose the implementer and revision
> information to guests with the raw value from the CPU we are running on,
> this may present issues for asymmetric systems or for migration as it
> does for the existing registers.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
...
> +#define IMPLEMENTATION_ID_FILTERED(reg, mask, reg_visibility) {	\
> +	SYS_DESC(SYS_##reg),				\
> +	.access = access_imp_id_reg,			\
> +	.get_user = get_id_reg,				\
> +	.set_user = set_imp_id_reg,			\
> +	.reset = reset_imp_id_reg,			\
> +	.visibility = reg_visibility,				\

nit: rogue backslash

> +	.val = mask,					\
> +	}
> +
>  static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  {
>  	__vcpu_assign_sys_reg(vcpu, r->reg, vcpu->kvm->arch.nr_pmu_counters);
> @@ -3238,7 +3280,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  				       ID_AA64PFR1_EL1_MTE_frac |
>  				       ID_AA64PFR1_EL1_NMI |
>  				       ID_AA64PFR1_EL1_RNDR_trap |
> -				       ID_AA64PFR1_EL1_SME |
>  				       ID_AA64PFR1_EL1_RES0 |
>  				       ID_AA64PFR1_EL1_MPAM_frac |
>  				       ID_AA64PFR1_EL1_MTE)),
> @@ -3248,7 +3289,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  		    ID_AA64PFR2_EL1_MTESTOREONLY),
>  	ID_UNALLOCATED(4,3),
>  	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
> -	ID_HIDDEN(ID_AA64SMFR0_EL1),
> +	ID_WRITABLE(ID_AA64SMFR0_EL1, ~ID_AA64SMFR0_EL1_RES0),
>  	ID_UNALLOCATED(4,6),
>  	ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
>  
> @@ -3454,6 +3495,13 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
>  	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
>  	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
> +	IMPLEMENTATION_ID_FILTERED(SMIDR_EL1,
> +				   (SMIDR_EL1_NSMC | SMIDR_EL1_HIP |
> +				    SMIDR_EL1_AFFINITY2 |
> +				    SMIDR_EL1_IMPLEMENTER |
> +				    SMIDR_EL1_REVISION | SMIDR_EL1_SH |
> +				    SMIDR_EL1_AFFINITY),
> +				   sme_visibility),

Shouldn't we sanitize the SMIDR value obtained in reset_imp_id_reg() and
add SMPS to this mask, if we're hiding everything from the guest?

Thanks,
Jean

>  	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
>  	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>  	ID_FILTERED(CTR_EL0, ctr_el0,
> 
> -- 
> 2.47.3
> 
> 

