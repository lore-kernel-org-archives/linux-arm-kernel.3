Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B290C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MWm6Fd/agMeB9eO07odRN2tJuMWbyOOIV2lDS1aT4U=; b=3sn3DlsFSU68UCJ0xdvN0Tk846
	o+KiS7NZT3mneJtnkdwjwOStfabDMZiSvZsg/J5ywvBsJo25M15/DPrmzkWJQIJPLVKLa9PRr1cO6
	QEs385cfUpE0kMuwG85TQsvWuh8R/auQgJXQXFxUvbVprTPYlilVQ8Hdp/13u963vfVseqXlxVI3H
	2uZSWLx1we2aBysXi1xHI3Sl7FsqXFQIK+cZu3i0NRNCQsi+qD8bQPozIHdP4+dzprsqrkTFlngT9
	nxhQy00MJBJ23GMVrpa7yBU6udgECTfUoEnqqUBXTlIotvBHLvQQR5AZFBSyVEAfTTxEmnUTMEK81
	1QJqHluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2c6W-00000008RsU-1DTI;
	Wed, 09 Apr 2025 20:33:00 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2c3B-00000008R8A-0uil
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:29:34 +0000
Date: Wed, 9 Apr 2025 13:29:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744230571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8MWm6Fd/agMeB9eO07odRN2tJuMWbyOOIV2lDS1aT4U=;
	b=i8EAhSbD3oIJrrUWLt1yR8/WfDQQkIbD/PIUo5M/qIAZLkDido4pQfiVdeH8l6VFHnIGgV
	+47lGZWoXWLHzNKcZTCjyOaV8eufmJFCIQ8eY7BCKnZpoiFichCZUufJjIN6SNceN5YXYm
	5d2ekFidltTVmfuSoU4tZsOrYThobts=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 5/6] KVM: arm64: Handle out-of-bound write to
 HDCR_EL2.HPMN
Message-ID: <Z_bYp_ow7hGKCZjx@linux.dev>
References: <20250409160106.6445-1-maz@kernel.org>
 <20250409160106.6445-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409160106.6445-6-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_132933_400023_E4336DF2 
X-CRM114-Status: GOOD (  23.13  )
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

HDCR? I thought you gave up on 32-bit a loooong time ago ;-)

On Wed, Apr 09, 2025 at 05:01:05PM +0100, Marc Zyngier wrote:
> We don't really pay attention to what gets written to MDCR_EL2.HPMN,
> and funky guests could play ugly games on us.
> 
> Restrict what gets written there, and limit the number of counters
> to what the PMU is allowed to have.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 00b5396492d51..e53b8f82ca7f8 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2571,17 +2571,33 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>  			struct sys_reg_params *p,
>  			const struct sys_reg_desc *r)
>  {
> -	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +	if (!p->is_write) {
> +		p->regval = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +	} else {

nit: you can do an early return for an emulated read and get rid of a
level of indentation for the write case.

> +		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, p->regval);
> +		u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +		u64 val = p->regval;
>  
> -	if (!access_rw(vcpu, p, r))
> -		return false;
> +		/*
> +		 * If HPMN is out of bounds, limit it to what we actually
> +		 * support. This matches the UNKNOWN definition of the field
> +		 * in that case, and keeps the emulation simple. Sort of.
> +		 */
> +		if (hpmn > vcpu->kvm->arch.pmcr_n) {
> +			hpmn = vcpu->kvm->arch.pmcr_n;
> +			u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
> +		}
>  
> -	/*
> -	 * Request a reload of the PMU to enable/disable the counters affected
> -	 * by HPME.
> -	 */
> -	if ((old ^ __vcpu_sys_reg(vcpu, MDCR_EL2)) & MDCR_EL2_HPME)
> -		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +		vcpu_write_sys_reg(vcpu, val, r->reg);
> +
> +		/*
> +		 * Request a reload of the PMU to enable/disable the
> +		 * counters affected by HPME.
> +		 */
> +
> +		if ((old ^ __vcpu_sys_reg(vcpu, MDCR_EL2)) & MDCR_EL2_HPME)
> +			kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +	}
>  
>  	return true;
>  }
> -- 
> 2.39.2
> 

Thanks,
Oliver

