Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFBACFD652
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0m6qrjM++EX1JPQbt0U+H0JDa6SDyotsLzRZmvjPOI=; b=FtQDgBpPZkRevmlzzz0JaAVrax
	IHTCAFXLWY865imY+A+mpiACdP0TzeQq2wyyCaaMrRo0q7ZtcrfAT9nnHlGPqTvVgDRzRvGAyHkBB
	nW0yhI0uJUAq2qFRZ9DnY7uXD5m63EI0BmLRKknJhS8NxnGg3aTiE4o68UUQsLzW/XOybACMR/GfN
	2S7rETyPCzSj5uQ8Y4OsJIImIgT+/JWcCyTlxOduRn+5ITCzpOtgIH80aCj4P/FmVYCwa0znHqy2t
	hNWyrEjh4DUFEh8bmm7Nk0HOiDsfRa5kN/RLxXcCM8tmtl7fvJthdI0JRN4edDA6isre7tiCONby0
	Vaee776g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVIH-0000000FA0O-3pg8;
	Wed, 07 Jan 2026 15:17:53 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVIF-0000000F9y5-1XGc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:17:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m0m6qrjM++EX1JPQbt0U+H0JDa6SDyotsLzRZmvjPOI=;
	b=elUV80muaVjrHBusOw+FMQaH2tX6IiLXEtBLQWqkUHmRO1e+Lb5UDdL6SOUBfDhWHyB29mAcz
	QdoCY90ABhQDw2JvnkXuIlkvajdrN+gptLwU1tJP1Fk8tiPqSoxqEpTdxB4rAZqWAfw16nnNEen
	fvHAtc4P82QYqGcQ4W9s09o=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dmWmx1QPQz1P7sc;
	Wed,  7 Jan 2026 23:15:13 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmWqc6FxGzJ46Cj;
	Wed,  7 Jan 2026 23:17:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 40AAA40539;
	Wed,  7 Jan 2026 23:17:36 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 15:17:35 +0000
Date: Wed, 7 Jan 2026 15:17:33 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 22/36] KVM: arm64: gic-v5: Trap and mask guest PPI
 register accesses
Message-ID: <20260107151733.00003028@huawei.com>
In-Reply-To: <20251219155222.1383109-23-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-23-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_071751_831161_E39B899D 
X-CRM114-Status: GOOD (  29.81  )
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

On Fri, 19 Dec 2025 15:52:43 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> A guest should not be able to detect if a PPI that is not exposed to
> the guest is implemented or not. If the writes to the PPI registers
> are not masked, it becomes possible for the guest to detect the
> presence of all implemented PPIs on the host.
> 
> Guest writes to the following registers are masked:
> 
> ICC_CACTIVERx_EL1
> ICC_SACTIVERx_EL1
> ICC_CPENDRx_EL1
> ICC_SPENDRx_EL1
> ICC_ENABLERx_EL1
> ICC_PRIORITYRx_EL1
> 
> When a guest writes these registers, the write is masked with the set
> of PPIs actually exposed to the guest, and the state is written back
> to KVM's shadow state..

One . seems enough.

> 
> Reads for the above registers are not masked. When the guest is
> running and reads from the above registers, it is presented with what
> KVM provides in the ICH_PPI_x_EL2 registers, which is the masked
> version of what the guest last wrote.
> 
> The ICC_PPI_HMRx_EL1 register is used to determine which PPIs use
> Level-sensitive semantics, and which use Edge. For a GICv5 guest, the
> correct view of the virtual PPIs must be provided to the guest, and
> hence this must also be trapped, but only for reads. The content of
> the HMRs is calculated and masked when finalising the PPI state for
> the guest.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
A few bits inline but nothing significant so I'll assume you tidy those up
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kvm/config.c   |  22 ++++++-
>  arch/arm64/kvm/sys_regs.c | 133 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index eb0c6f4d95b6d..f81bfdadd12fb 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1586,8 +1586,26 @@ static void __compute_ich_hfgrtr(struct kvm_vcpu *vcpu)
>  {
>  	__compute_fgt(vcpu, ICH_HFGRTR_EL2);
>  
> -	/* ICC_IAFFIDR_EL1 *always* needs to be trapped when running a guest */
> +	/*
> +	 * ICC_IAFFIDR_EL1 and ICH_PPI_HMRx_EL1 *always* needs to be

need to be

> +	 * trapped when running a guest.
> +	 **/

*/

>  	*vcpu_fgt(vcpu, ICH_HFGRTR_EL2) &= ~ICH_HFGRTR_EL2_ICC_IAFFIDR_EL1;
> +	*vcpu_fgt(vcpu, ICH_HFGRTR_EL2) &= ~ICH_HFGRTR_EL2_ICC_PPI_HMRn_EL1;
> +}

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 383ada0d75922..cef13bf6bb3a1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -696,6 +696,111 @@ static bool access_gicv5_iaffid(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  	return true;
>  }
>  
> +static bool access_gicv5_ppi_hmr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> +				 const struct sys_reg_desc *r)
> +{
> +	if (p->is_write)
> +		return ignore_write(vcpu, p);
> +
> +	if (p->Op2 == 0) {	/* ICC_PPI_HMR0_EL1 */
> +		p->regval = vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hmr[0];
> +	} else {		/* ICC_PPI_HMR1_EL1 */
> +		p->regval = vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hmr[1];
> +	}

No {} as single line statements in all legs.

However, I'd be tempted to use a local variable for the index like you've
done in many other cases
	
	unsigned int index;

...

	index = p->Op2 == 0 ? 0 : 1;
	p->regval = vcpu->arch.vgic_cpu.vgic_v5.vgic_ppi_hrm[index];

Or use the p->Op2 % 2 as you do in ppi_enabler.


> +
> +	return true;
> +}
> +
> +static bool access_gicv5_ppi_enabler(struct kvm_vcpu *vcpu,
> +				     struct sys_reg_params *p,
> +				     const struct sys_reg_desc *r)
> +{
> +	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	u64 masked_write;
> +
> +	/* We never expect to get here with a read! */
> +	if (WARN_ON_ONCE(!p->is_write))
> +		return undef_access(vcpu, p, r);
> +
> +	masked_write = p->regval & cpu_if->vgic_ppi_mask[p->Op2 % 2];
> +	cpu_if->vgic_ich_ppi_enabler_entry[p->Op2 % 2] = masked_write;
> +
> +	return true;
> +}
> +
> +static bool access_gicv5_ppi_pendr(struct kvm_vcpu *vcpu,
> +				   struct sys_reg_params *p,
> +				   const struct sys_reg_desc *r)
> +{
> +	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	u64 masked_write;
> +
> +	/* We never expect to get here with a read! */
> +	if (WARN_ON_ONCE(!p->is_write))
> +		return undef_access(vcpu, p, r);
> +
> +	masked_write = p->regval & cpu_if->vgic_ppi_mask[p->Op2 % 2];
> +
> +	if (p->Op2 & 0x2) {	/* SPENDRx */
> +		cpu_if->vgic_ppi_pendr_entry[p->Op2 % 2] |= masked_write;
> +	} else {		/* CPENDRx */
> +		cpu_if->vgic_ppi_pendr_entry[p->Op2 % 2] &= ~masked_write;
> +	}

No {} wanted in kernel style when all legs are single line statements.
Same applies in a few other cases that follow.

> +
> +	return true;
> +}
> +


