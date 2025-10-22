Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34893CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU1PzAZ1BNV26YpxLxNOHYihlxsG75VaTbtBXC0551E=; b=OL5CrZi02NoNxBNwai+Ppg1QT5
	RBzEnXMwigh7p9J38G2/9QHuP72C18ki37FKJQd2Fcn+2JcXnFmg92mYIMya2bkQQFAfnRn34Qhn8
	0Ws3CZtF/oYWf26IFUrQd1IbEOpynrZCl+5IpGA/TN8Wzp0ALlwszBqyOV7puBe4cGj9QREfvBxpe
	cVtRWpR3cAgrVAPEsTtsUbq4O16GOtoX/ybrWVtd36MMVfH1HriK/nYTKG8vt77OJfcGbueAMnl2p
	2f2wQrTqMvTtkViDVJb/th6I2q/kwdzhSbsAMP7br9bm5EBr6UgAbBKHu8Fju3Xq2kAEIRYOzk6SL
	JbEHeJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSxb-00000001oAg-3yAH;
	Wed, 22 Oct 2025 07:08:40 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSxY-00000001o9l-3CHB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:08:38 +0000
Date: Wed, 22 Oct 2025 00:08:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761116910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mU1PzAZ1BNV26YpxLxNOHYihlxsG75VaTbtBXC0551E=;
	b=sgn4JcuBKRbZ9ae67O0U5ghHOKcyKfbwWuz5hcPwtARVGDEHH6RES+XCYIzpKBwCm7E/7p
	j65wKvesFRXwarjIcFP4aDZbysyOi0biVw/hQEExKmEnHfFd5t+vAdAsqxqp5aQSnHdUH2
	fdGmS+qMSB/aT3Xu8ACduhCLI8Gybks=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] KVM: arm64: Limit clearing of
 ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
Message-ID: <aPiCmpn-Qhysv6Dn@linux.dev>
References: <20251013083207.518998-1-maz@kernel.org>
 <20251013083207.518998-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013083207.518998-4-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_000836_960415_9F218ADB 
X-CRM114-Status: GOOD (  16.74  )
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

On Mon, Oct 13, 2025 at 09:32:07AM +0100, Marc Zyngier wrote:
> Now that the idreg's GIC field is in sync with the irqchip, limit
> the runtime clearing of these fields to the pathological case where
> we do not have an in-kernel GIC.
> 
> Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 73dcefe51a3e7..25cfd0f9541f5 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5494,9 +5494,7 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
>  
>  	guard(mutex)(&kvm->arch.config_lock);
>  
> -	if (!(static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) &&
> -	      irqchip_in_kernel(kvm) &&
> -	      kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)) {
> +	if (!irqchip_in_kernel(kvm)) {
>  		kvm->arch.id_regs[IDREG_IDX(SYS_ID_AA64PFR0_EL1)] &= ~ID_AA64PFR0_EL1_GIC_MASK;
>  		kvm->arch.id_regs[IDREG_IDX(SYS_ID_PFR1_EL1)] &= ~ID_PFR1_EL1_GIC_MASK;

Pre-existing, but converting this to the accessors would be a good idea.

Thanks,
Oliver

