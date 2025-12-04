Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02BCD1F9B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4qfD3RGkyx1FtAVS7OvQdgB3hipMvBBFyXvXVYRaF4=; b=1n8C/0HbkrniVnMyuGiiZvgYUx
	54IxEt+7HQ/8IDwcdy8MmG4ooGN9ZHfr7Szp7HHf7nvMLSsjP1LZZ9mL3xsImcxjdH21Es9nXe9jy
	HR/hC3d7v56/w/ClZ5xar7IiF/kaROOrZmsoHMyj4UQQTkQrDD/Eu0gIPXH8livvMIrJWmIicSmOV
	UCOyxK6D+ByFJnwWfEu9o6E1cLWRjkl+BlL5JFmjJPiZLFBRWvMNzlIhiaAt4QPUX7maVVnxoqj1r
	qkQDjTMpAbxBRjrbElz0sx63Ih5ndAqbPxsW2gfgBZbCwb+zomlJAvQ2oMrG0KFQkT+u+d5JACNFv
	f9bY5rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6vm-00000007sAM-2jM9;
	Thu, 04 Dec 2025 10:51:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6vj-00000007s9l-3dQc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:51:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E45B0339;
	Thu,  4 Dec 2025 02:51:14 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061513F73B;
	Thu,  4 Dec 2025 02:51:20 -0800 (PST)
Message-ID: <7f853a85-f1da-4e6f-ab3f-63507731f8ee@arm.com>
Date: Thu, 4 Dec 2025 10:51:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] KVM: arm64: pkvm: Report optional ID register
 traps with a 0x18 syndrome
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Yao Yuan <yaoyuan@linux.alibaba.com>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-9-maz@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251204094806.3846619-9-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_025123_949781_67FA9851 
X-CRM114-Status: GOOD (  17.78  )
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

On 12/4/25 09:48, Marc Zyngier wrote:
> With FEAT_IDST, unimplemented system registers in the feature ID space
> must be reported using EC=0x18 at the closest handling EL, rather than
> with an UNDEF.
> 
> Most of these system registers are always implemented thanks to their
> dependency on FEAT_AA64, except for a set of (currently) three registers:
> GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
> and SMIDR_EL1 (depending on SME).
> 
> For these three registers, report their trap as EC=0x18 if they
> end-up trapping into KVM and that FEAT_IDST is implemented in the guest.
> Otherwise, just make them UNDEF.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 876b36d3d4788..efc36645f4b5a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -347,6 +347,18 @@ static bool pvm_gic_read_sre(struct kvm_vcpu *vcpu,
>  	return true;
>  }
>  
> +static bool pvm_idst_access(struct kvm_vcpu *vcpu,
> +			    struct sys_reg_params *p,
> +			    const struct sys_reg_desc *r)
> +{
> +	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, NI))
> +		inject_undef64(vcpu);
> +	else
> +		inject_sync64(vcpu, kvm_vcpu_get_esr(vcpu));
> +
> +	return false;
> +}
> +

Just wondering, why is the pkvm version register specific? You changed
the non-pkvm from register specific to generic.

>  /* Mark the specified system register as an AArch32 feature id register. */
>  #define AARCH32(REG) { SYS_DESC(REG), .access = pvm_access_id_aarch32 }
>  
> @@ -472,6 +484,9 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
>  
>  	HOST_HANDLED(SYS_CCSIDR_EL1),
>  	HOST_HANDLED(SYS_CLIDR_EL1),
> +	{ SYS_DESC(SYS_CCSIDR2_EL1), .access = pvm_idst_access },
> +	{ SYS_DESC(SYS_GMID_EL1), .access = pvm_idst_access },
> +	{ SYS_DESC(SYS_SMIDR_EL1), .access = pvm_idst_access },
>  	HOST_HANDLED(SYS_AIDR_EL1),
>  	HOST_HANDLED(SYS_CSSELR_EL1),
>  	HOST_HANDLED(SYS_CTR_EL0),

Thanks,

Ben


