Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75920CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojHPpkhAgtVZ2meE6FIMZrLuRZ+39ojNJx8xTvLIyA4=; b=RIhKp3Xb/e8DOiZvkHx7GRFlWC
	t+uFbGmfPDKjAWdkE/9vTNm24FtbVCcwZCHEIRo2JAoI/bUZX7uRZuIgLxvW71ZM/Ea4oEtD9B1nG
	LRkA8Xr3huBqPSI3li0L+2KPn478Xb7dNcgetbRkCZ2daNZlRPfYddahm/ak4bm7xshsej70VPF5a
	Hiw0PIP+upior0KVk4k8jAGyntqGYjqVbqUeiZqBMrVqcI6BCE/xWPdLCvnap9OoxXOCaGKdGWvbQ
	LLSgrKaSWp6xeaTHVC4wV7rikrlFl8fIrISBx0vlKQEhUxywV0hE9biYqgrbfZdIliRYyTXNjV0Su
	MfBe5AuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU1E-0000000BRbw-0Pa4;
	Mon, 24 Nov 2025 10:42:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU1B-0000000BRbM-2IXB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:42:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 612D21477;
	Mon, 24 Nov 2025 02:41:51 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA8CB3F6A8;
	Mon, 24 Nov 2025 02:41:57 -0800 (PST)
Message-ID: <576d088c-0176-41e5-a66c-8713f5cb09b7@arm.com>
Date: Mon, 24 Nov 2025 10:41:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 4/5] KVM: arm64: Report optional ID register traps with a
 0x18 syndrome
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20251120133202.2037803-1-maz@kernel.org>
 <20251120133202.2037803-5-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <20251120133202.2037803-5-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_024201_627081_31526F5B 
X-CRM114-Status: GOOD (  18.38  )
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

On 11/20/25 13:32, Marc Zyngier wrote:
> With FEAT_IDST, unimplemented system registers must be reported using
> EC=0x18 at the closest handling EL, rather than with an UNDEF.

I think this needs 'in the feature ID space' adding. Something like:

With FEAT_IDST, unimplemented system registers in the feature ID space
must be reported using EC=0x18 at the closest handling EL, rather than
with an UNDEF.

> 
> Most system registers are always implemented thanks to their dependency

'Most of these system registers...'

> on FEAT_AA64, except for a set of (currently) three registers:
> GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
> and SMIDR_EL1 (depending on SME).
I agree that these 3 are currently the only optional system registers in
the feature ID space.

> 
> For these three registers, report their trap as EC=0x18 if they
> end-up trapping into KVM and that FEAT_IDST is not implemented in the
> guest. Otherwise, just make them UNDEF.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 40f32b017f107..992137822dcf9 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -82,6 +82,16 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
>  			"sys_reg write to read-only register");
>  }
>  
> +static bool idst_access(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> +			const struct sys_reg_desc *r)
> +{
> +	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, 0x0))
> +		return undef_access(vcpu, p, r);
> +
> +	kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +	return false;
> +}
> +
>  enum sr_loc_attr {
>  	SR_LOC_MEMORY	= 0,	  /* Register definitely in memory */
>  	SR_LOC_LOADED	= BIT(0), /* Register on CPU, unless it cannot */
> @@ -3396,9 +3406,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
>  	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
>  	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
> -	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
> -	{ SYS_DESC(SYS_GMID_EL1), undef_access },
> -	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
> +	{ SYS_DESC(SYS_CCSIDR2_EL1), idst_access },
> +	{ SYS_DESC(SYS_GMID_EL1), idst_access },
> +	{ SYS_DESC(SYS_SMIDR_EL1), idst_access },
>  	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
>  	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>  	ID_FILTERED(CTR_EL0, ctr_el0,


Thanks,

Ben


