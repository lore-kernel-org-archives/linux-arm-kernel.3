Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B51CCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XSSTLCS1TZ0ZhjGf5BQOvNt71mRr5p/Fed2+JopWuw=; b=mT/Srj9Gx5LsYMzE6Ny/gn3nRW
	+Jlr55yk4J28/Cc8e6++ma1KErFMb0PPqC3rRUbU14j0IUlRWlymQTh1VUzhk8n45PMqNrbVKxFyS
	V+ZpVEARfa973PNAt4rRUOtMRrhWDPLKIuORW6P26YVIbZXzcij1BfBq70C2IS32djjcF5x+WTLzb
	8d7ddK+FDBKZC9w96JsvA0kivX98nZP38hX0fgXmmLuEDsbtfJRfV/tfn05O6bSVrIXLCZ21tfwdE
	QrtRayg9SvAr2yPeGYWssfEC1+rSCwch+XEtYKTdb0LSgEqJoh+23g3ZLr54bsE2l1Gni+pZFG3UZ
	m+9QfTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSu9-00000001mzb-2D55;
	Wed, 22 Oct 2025 07:05:05 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSu6-00000001myp-40jD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:05:04 +0000
Date: Wed, 22 Oct 2025 00:04:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761116700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XSSTLCS1TZ0ZhjGf5BQOvNt71mRr5p/Fed2+JopWuw=;
	b=o/ARPoIjdXq6DC7H4kMGg4IR7zH3Hgd+Sg9m5PjudMvw7zpP2FrsbHRwuTGQIg9fo+7VjT
	WTVtZRRdybkM+TAP2GoWyEkmZyzF7wMMWGEHT7FSeIB/zIXpG0/IfptMg2Xu+vv86JonuS
	E3DxBLhe4VLPTAuSc4NwP7tpk1EzbC0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when
 GICv3 is configured
Message-ID: <aPiCF97QlTHAo6Jo@linux.dev>
References: <20251013083207.518998-1-maz@kernel.org>
 <20251013083207.518998-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013083207.518998-3-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_000503_162888_7AE748BF 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Oct 13, 2025 at 09:32:06AM +0100, Marc Zyngier wrote:
> Drive the idreg fields indicating the presence of GICv3 directly from
> the vgic code. This avoids having to do any sort of runtime clearing
> of the idreg.
> 
> Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 4c3c0d82e4760..2c518b0a4d81b 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -161,10 +161,16 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>  
>  	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
>  
> -	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
> +	*__vm_id_reg(&kvm->arch, SYS_ID_AA64PFR0_EL1) &= ~ID_AA64PFR0_EL1_GIC;
> +	*__vm_id_reg(&kvm->arch, SYS_ID_PFR1_EL1) &= ~ID_PFR1_EL1_GIC;

I'd prefer this to be done as a kvm_read_vm_id_reg() / kvm_set_vm_id_reg(),
if only to ensure this flow hits the config_lock lockdep assertion like
other writers of the ID registers.

Thanks,
Oliver

