Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76524C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOs7eQJLJCUGEFSay4U24A8ybWT+TL/OSie+j9EubR4=; b=nyLOuMiXxxwALUipzhkuUfY0p2
	L4GromBFnrjwddoPtk26mnpaRIOeSBFc+zTKVXtj4IaAAU4ZVNFwSp1Ie1CrHy7BEASryxi4OaDlb
	QC3LMAwDjcag5ziJ0VXn64mYKy5ehyBHuMW5+gI2KlEa8TfEgI4yfeF8CgeorA3dW+GtgSNkw8qZk
	kUjaDen+rxCNplT6t4tZIvbxDJER7Fg9/VH+qT94s4+TUUjWisykLiSNWXoIEM6lTWyJfiCVWRXsm
	i2hFn6CE1+jrbYhft1DLlCQIQzZjT2WzuKbphdn9nlTHEtUdIyAeXD0d6rOvxSbrj8EpuRGj3LENJ
	m4aiMqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPmM-000000097Jv-1Zbv;
	Wed, 12 Mar 2025 17:22:02 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPkf-000000096mr-1IE2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:20:19 +0000
Date: Wed, 12 Mar 2025 10:20:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741800012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mOs7eQJLJCUGEFSay4U24A8ybWT+TL/OSie+j9EubR4=;
	b=K9VX7JmHz2x3px/JqTTXS6bOObpnE8iYmASgHZpf3YaLhlObaD2TuQ6CegwZRFbF1bPcsu
	zsfhYfG64gFgM94Jjm6QbVRfeDERlVdDlrZwDlfU8QJWPWAxySkVUdGzcVY7Vqq77Ibu56
	DwzXcJmp8MdTB6NrovutjeQmdpHOAEM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Writable TGRAN*_2
Message-ID: <Z9HCQ40LxShzL4nj@linux.dev>
References: <20250306184013.30008-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306184013.30008-1-sebott@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_102017_803981_86AFD6A2 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Sebastian,

On Thu, Mar 06, 2025 at 07:40:13PM +0100, Sebastian Ott wrote:
> Allow userspace to write the safe (NI) value for ID_AA64MMFR0_EL1.TGRAN*_2.
> Disallow to change these fields for NV since kvm provides a sanitized view
> for them based on the PAGE_SIZE.
> Also add these bits to the set_id_regs selftest.
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>

I can't tell what you've based this patch on, it certainly doesn't apply
on a 6.14 rc. Consider telling git to include the base commit next time
you generate a patch.

> ---
>  arch/arm64/kvm/sys_regs.c                     | 21 +++++++++++++++----
>  .../testing/selftests/kvm/arm64/set_id_regs.c |  3 +++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 14faf213d483..0730ed8314d0 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1948,6 +1948,21 @@ static int set_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
>  	return set_id_reg(vcpu, rd, user_val);
>  }
>  
> +static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
> +				const struct sys_reg_desc *rd, u64 user_val)
> +{
> +	u64 sanitized_val = kvm_read_sanitised_id_reg(vcpu, rd);
> +	u64 tgran2_mask = ID_AA64MMFR0_EL1_TGRAN4_2_MASK |
> +			  ID_AA64MMFR0_EL1_TGRAN16_2_MASK |
> +			  ID_AA64MMFR0_EL1_TGRAN64_2_MASK;
> +
> +	if (vcpu_has_nv(vcpu) &&
> +	    ((sanitized_val & tgran2_mask) != (user_val & tgran2_mask)))
> +		return -EINVAL;
> +
> +	return set_id_reg(vcpu, rd, user_val);
> +}
> +
>  static int set_id_aa64mmfr2_el1(struct kvm_vcpu *vcpu,
>  				const struct sys_reg_desc *rd, u64 user_val)
>  {
> @@ -2787,10 +2802,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	ID_UNALLOCATED(6,7),
>  
>  	/* CRm=7 */
> -	ID_WRITABLE(ID_AA64MMFR0_EL1, ~(ID_AA64MMFR0_EL1_RES0 |
> -					ID_AA64MMFR0_EL1_TGRAN4_2 |
> -					ID_AA64MMFR0_EL1_TGRAN64_2 |
> -					ID_AA64MMFR0_EL1_TGRAN16_2 |
> +	ID_FILTERED(ID_AA64MMFR0_EL1, id_aa64mmfr0_el1,
> +				      ~(ID_AA64MMFR0_EL1_RES0 |
>  					ID_AA64MMFR0_EL1_ASIDBITS)),
>  	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
>  					ID_AA64MMFR1_EL1_HCX |
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 1d65f4a09e6f..322b9d3b0125 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -146,6 +146,9 @@ static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
>  static const struct reg_ftr_bits ftr_id_aa64mmfr0_el1[] = {
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, ECV, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, EXS, 0),
> +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN4_2, 1),
> +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN64_2, 1),
> +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN16_2, 1),
>  	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN4, 0),
>  	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN64, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN16, 0),

Please do selftests changes in a separate patch.

Don't worry about respinning, I'll fix this up and queue it in a moment.

Thanks,
Oliver

