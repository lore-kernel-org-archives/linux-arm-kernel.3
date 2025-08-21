Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XqE64ehpfFVMXdf0mu6KGyBJbvhTkkFtXnvogIAeTc=; b=vVRKzhmqPeU0vc0PwTZImXGCiu
	TAgP35483xrm6l7ZkFiMESzpFVs8ZlGWu4Fbx3xFv5swfAxqG/zSFLeWvmpawZfn93fTzsgzzqJyf
	tpkTWhoEyTE/BPx5rua3cZ5G02nPAIjLLuZ25ZFCh70eMbXXhAO+09xjquw2Iq3A5QL5x51fHDE7H
	Z7Lhs03vqxqoAS4jwdpVHyVTE9OuGKpjzCaRCyKPhYuf2Ok4k+q0v2fXxGgVuFjhAn3Mx92JIbM8S
	W54SiEANkwYCbm50KQ73eXuzgCfxXDcu7NWy++PCSh/NXEIXHbski32cLhI1HIRCKoD4EabhTogjB
	H4Wf3BlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8n0-000000001vG-3Rcb;
	Thu, 21 Aug 2025 17:09:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up576-0000000H0h7-19Yh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:13:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3F8152B;
	Thu, 21 Aug 2025 06:13:47 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9EFC3F58B;
	Thu, 21 Aug 2025 06:13:53 -0700 (PDT)
Message-ID: <95819606-ef3b-46e1-8201-1abf0219659f@arm.com>
Date: Thu, 21 Aug 2025 14:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] KVM: arm64: Handle RASv1p1 registers
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20250817202158.395078-1-maz@kernel.org>
 <20250817202158.395078-3-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250817202158.395078-3-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_061356_359418_4A520562 
X-CRM114-Status: GOOD (  16.73  )
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

On 8/17/25 21:21, Marc Zyngier wrote:
> FEAT_RASv1p1 system registeres are not handled at all so far.
> KVM will give an embarassed warning on the console and inject
s/embarassed/embarrassed/

> an UNDEF, despite RASv1p1 being exposed to the guest on suitable HW.
> 
> Handle these registers similarly to FEAT_RAS, with the added fun
> that there are *two* way to indicate the presence of FEAT_RASv1p1.
> 
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/kvm/sys_regs.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 82ffb3b3b3cf7..feb1a7a708e25 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2697,6 +2697,18 @@ static bool access_ras(struct kvm_vcpu *vcpu,
>   	struct kvm *kvm = vcpu->kvm;
>   
>   	switch(reg_to_encoding(r)) {
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
>   	default:
>   		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
>   			kvm_inject_undefined(vcpu);
The default condition needs updating for the case when 
ID_AA64PFR0_EL1.RAS = b10 otherwise access to the non-v1 specific RAS 
registers will result in an UNDEF being injected.

> @@ -3063,8 +3075,13 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>   	{ SYS_DESC(SYS_ERXCTLR_EL1), access_ras },
>   	{ SYS_DESC(SYS_ERXSTATUS_EL1), access_ras },
>   	{ SYS_DESC(SYS_ERXADDR_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGF_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGCTL_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXPFGCDN_EL1), access_ras },
>   	{ SYS_DESC(SYS_ERXMISC0_EL1), access_ras },
>   	{ SYS_DESC(SYS_ERXMISC1_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXMISC2_EL1), access_ras },
> +	{ SYS_DESC(SYS_ERXMISC3_EL1), access_ras },
>   
>   	MTE_REG(TFSR_EL1),
>   	MTE_REG(TFSRE0_EL1),

-- 
Thanks,

Ben


