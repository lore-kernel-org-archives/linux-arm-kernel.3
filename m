Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039EAF436B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fov7EzfMPt0++dVxGy+OJv/n0rf39Bf5+3guSwTEk2s=; b=KRsbR650MTwszfaAt1PTiDWOUe
	B8f2RK/HHMeEHgo9qQzuUmclg/1KSX4yjU16ZZeFbVPQcdhmU4i4aH3OLtkiEq/EcYIKFePJEu60y
	qNXhy3F7qDdgscreEvPz1CTIjqgRsPvnm1+DZ3Fl4tUJ+SdJelRkJPqqYSdToUynwanf6ljWRxDC3
	wUOMm9ek1Ek8Ooo8Xkl6gz48yzuzFdy4SJ9BsUYmzOVSLAUJjATXNKoe7/ICBObVxTvkBLNeZ0JKo
	/v6IeSPOCIttdhZ1XRZZbfxOt/v47LPZ/8TCB108yWMOU1/q99qIttOpT6E4FalL/YCg/wng/4J2J
	9k6saLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl0y-00000004CgT-3Asj;
	Fri, 17 Apr 2026 15:21:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl0w-00000004Cg6-0Sfs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:21:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B137615A1;
	Fri, 17 Apr 2026 08:21:40 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 690393F7D8;
	Fri, 17 Apr 2026 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776439306; bh=cd9Rsv0Yx3PKYaozVpdSsPm7OsaRdQE/jXvlFpuAv/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA15Bho54g4VCuj9pYPPA7+hFZfzZUbnrJH5C19n0FE8HqDs2yRBIwRfH6LtVhP3v
	 bKSfThXWvKJ571R4wxK5wR8wIN8bK34EibsyaOD1V4iPyVdsrdJPYTns2XpeWfFkJs
	 khZMOzvY7RJw3TOabdtP85AwRJlunvPH/a/T28Y4=
Date: Fri, 17 Apr 2026 16:21:40 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 08/18] KVM: arm64: vgic: Rationalise per-CPU irq accessor
Message-ID: <20260417152140.GA3311048@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-9-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-9-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082150_296066_6308D71D 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, Apr 15, 2026 at 12:55:49PM +0100, Marc Zyngier wrote:
> Despite adding the necessary infrastructure to identify irq types,
> vgic_get_vcpu_irq() treats GICv5 PPIs in a special way, which
> impairs the readability of the code.
> 
> Use the existing irq classifiers to handle per-CPU irqs for all
> vgic types, and let the normal control flow reach global interrupt
> handling without any v5-specific path.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 3ac6d49bc4876..b697678d68b01 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -106,24 +106,23 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
>  
>  struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
>  {
> +	enum kvm_device_type type;
> +
>  	if (WARN_ON(!vcpu))
>  		return NULL;
>  
> -	if (vgic_is_v5(vcpu->kvm)) {
> -		u32 int_num, hwirq_id;
> -
> -		if (!__irq_is_ppi(KVM_DEV_TYPE_ARM_VGIC_V5, intid))
> -			return NULL;
> -
> -		hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, intid);
> -		int_num = array_index_nospec(hwirq_id, VGIC_V5_NR_PRIVATE_IRQS);
> +	type = vcpu->kvm->arch.vgic.vgic_model;
>  
> -		return &vcpu->arch.vgic_cpu.private_irqs[int_num];
> -	}
> +	if (__irq_is_sgi(type, intid) || __irq_is_ppi(type, intid)) {
> +		switch (type) {
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:
> +			intid = vgic_v5_get_hwirq_id(intid);
> +			intid = array_index_nospec(intid, VGIC_V5_NR_PRIVATE_IRQS);
> +			break;
> +		default:
> +			intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
> +		}
>  
> -	/* SGIs and PPIs */
> -	if (intid < VGIC_NR_PRIVATE_IRQS) {
> -		intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
>  		return &vcpu->arch.vgic_cpu.private_irqs[intid];
>  	}
>  

It preserves the behaviour of returning NULL for anything other than PPI on
gic-v5, because the fallthrough to vgic_get_irq() returns NULL for gic-v5 and
__irq_is_sgi() is always false for gic-v5.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

