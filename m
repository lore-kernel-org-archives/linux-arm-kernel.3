Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57C9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEM0zfX3wsqmsS+G3CHSqb1iIzWY6ggkuK6U3KLRVD8=; b=GlmxyEeDFxUlQwOsLwBb4kxMXI
	ZO+jErnoRZRgOq4bkyMoyDc/L270L5Cf/a0MsQD60FStS2SrRtLcr4UsxY8DaHeV3KVm9QhkAB2N4
	O/2W2dqiYIjW7EfS80KATxR2Wtguxpiuwm0ejaPtw+vtnuNdzgeiS2fIaoljKgdydPEAledDFbhrK
	9xJhloaAzkxNmODsWuUMXaAXhYgRD9OS9YidK7Loay/c+v16UAjI0Aa+bKeHP65FIaaAGKNugwoF6
	a2qSlbDXF/LVBtf1rdrKPi3/ikIVe0yiUB9vBExMBj9Ju8UP7nmkYBReVdHbVekQMQh9MnU9n1MRa
	UkY/szWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyvL-00000000OSB-35W5;
	Thu, 07 Aug 2025 11:36:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyY0-00000000LF2-0Q81
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:12:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5521C302F;
	Thu,  7 Aug 2025 04:12:25 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A78503F5A1;
	Thu,  7 Aug 2025 04:12:31 -0700 (PDT)
Date: Thu, 7 Aug 2025 12:12:26 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 2/5] KVM: arm64: Handle RASv1p1 registers
Message-ID: <20250807111226.GA2351327@e124191.cambridge.arm.com>
References: <20250806165615.1513164-1-maz@kernel.org>
 <20250806165615.1513164-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806165615.1513164-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_041236_182479_CCF43B23 
X-CRM114-Status: GOOD (  17.88  )
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

Hi!

On Wed, Aug 06, 2025 at 05:56:12PM +0100, Marc Zyngier wrote:
> FEAT_RASv1p1 system registeres are not handled at all so far.
*registers
> KVM will give an embarassed warning on the console and inject
*embarrassed
> an UNDEF, despite RASv1p1 being exposed to the guest on suitable HW.
> 
> Handle these registers similarly to FEAT_RAS, with the added fun
> that there are *two* way to indicate the presence of FEAT_RASv1p1.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index ad25484772574..1b4114790024e 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2695,6 +2695,18 @@ static bool access_ras(struct kvm_vcpu *vcpu,
>  	struct kvm *kvm = vcpu->kvm;
>  
>  	switch(reg_to_encoding(r)) {
> +	case SYS_ERXPFGCDN_EL1:
> +	case SYS_ERXPFGCTL_EL1:
> +	case SYS_ERXPFGF_EL1:
> +	case SYS_ERXMISC2_EL1:
> +	case SYS_ERXMISC3_EL1:
> +		if (!(kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
> +		      (kvm_has_feat_enum(kvm, ID_AA64PFR0_EL1, RAS, IMP) &&
> +		       kvm_has_feat(kvm, ID_AA64PFR1_EL1, RAS_frac, RASv1p1)))) {
> +			kvm_inject_undefined(vcpu);
> +			return false;
> +		}
> +		break;
>  	default:
>  		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
>  			kvm_inject_undefined(vcpu);
> @@ -3058,8 +3070,13 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_ERXCTLR_EL1), access_ras },
>  	{ SYS_DESC(SYS_ERXSTATUS_EL1), access_ras },
>  	{ SYS_DESC(SYS_ERXADDR_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGF_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGCTL_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGCDN_EL1), access_ras },
>  	{ SYS_DESC(SYS_ERXMISC0_EL1), access_ras },
>  	{ SYS_DESC(SYS_ERXMISC1_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXMISC2_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXMISC3_EL1), access_ras },
>  
>  	MTE_REG(TFSR_EL1),
>  	MTE_REG(TFSRE0_EL1),
> -- 
> 2.39.2
> 

