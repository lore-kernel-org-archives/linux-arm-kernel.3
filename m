Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E7CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 05:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBECq8hGxMiV5GYg2WTDDiWKh1Mo7xpX+0dBxRDeeog=; b=VFGESxMqxWRdeF9680JWWFWVk+
	+zSso6RfNIdvWn82e47f6iddnb44ZO0233jYt5TdKUojJC0jW565uL8n3O2ENQ0WmPbVMAdX52lsg
	v5y90iHy/Fc94ERgBM+W2Xc+BrA+Hrym8feE0aU93hHS1O7No7eWsl6IuMFur4WPiPKQ+3+ILrUud
	C6eN0ECJ1Wes2RVZWBKJgPFo2mxba9hSesVf6DEN4F2Ad06un+44C6gYGKrZXOOlSSftveh1XIA6k
	+c7A/DjHK4OlinJ/bqLGJRhsjstWed2AR85KShjbRbKodOyBT0N5sNtupSESY51mY22P6OB51sfJW
	Tw6cMbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNOq-000000007bL-3rlC;
	Fri, 05 Jun 2026 05:47:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNOp-000000007az-1DLX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 05:47:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E6D9416A5;
	Fri,  5 Jun 2026 05:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8E51F00893;
	Fri,  5 Jun 2026 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780638438;
	bh=YBECq8hGxMiV5GYg2WTDDiWKh1Mo7xpX+0dBxRDeeog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuFBoRhvZTNxqylPupLSly+NZx6fTXPJhZtnYyqt5unN6Ce0v/3LWIW0q04ulhi0q
	 Dt32z6uFfQFoMfrQ6YNixc1QPXkLoquxLizfYsJLfY2OvKNXaj5WTxPfTM5wOZGZjp
	 qAMHdCXPo4BEMbnyDT3S95IhLjJQpojvXKKlHPdVz7B0DDdh8/etQtKZU65bcmw4RO
	 HcTbcnTPzE0Mrs5I1JdJHXFn9i0nx8cpAAt+gHRwYpjOuRUTEBAUYsaYitFsPvTzAG
	 F8uwlHktChpsWXICPZcv4wKuIblID/krLGGqZmFdmUrGy1eHTxzUU0N1LCzuZy2Rb4
	 yC/P/HHg1lJWQ==
Date: Thu, 4 Jun 2026 22:47:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: vgic: Use list_del_rcu() when flushing
 pending LPIs
Message-ID: <aiJi5a3JJ-TbWL-s@kernel.org>
References: <aiHrGM1f8czcUby4@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiHrGM1f8czcUby4@v4bel>
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

Hi Hyunwoo,

On Fri, Jun 05, 2026 at 06:16:08AM +0900, Hyunwoo Kim wrote:
> vgic_v3_fold_lr_state() walks the ap_list from last_lr_irq without holding
> the ap_list_lock, relying on vgic_irq being freed via kfree_rcu() and on
> interrupts being disabled. vgic_flush_pending_lpis() removes entries with
> list_del(), which clobbers a node's next pointer, so when another vCPU
> disables LPIs via GICR_CTLR the walk can follow the clobbered next pointer
> from a removed node, or from the node that last_lr_irq points to.
> 
> Remove entries with list_del_rcu() so that the next pointer stays valid
> until the walk completes.
> 
> Fixes: 3cfd59f81e0f ("KVM: arm64: GICv3: Handle LR overflow when EOImode==0")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Changing only one of the writer paths to use the rculist helpers does
not make the ap_list an rculist. Insertions are not RCU-safe, nor are
deleations from vgic_prune_ap_list().

And TBH, the real bug here is the fact that vgic_v3_fold_lr_state() isn't
taking the ap_list_lock.

Thanks,
Oliver

> ---
>  arch/arm64/kvm/vgic/vgic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 1e9fe8764584d..73efc0f95bfb1 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -204,7 +204,7 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
>  	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
>  		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
>  			raw_spin_lock(&irq->irq_lock);
> -			list_del(&irq->ap_list);
> +			list_del_rcu(&irq->ap_list);
>  			irq->vcpu = NULL;
>  			raw_spin_unlock(&irq->irq_lock);
>  			deleted |= vgic_put_irq_norelease(vcpu->kvm, irq);
> -- 
> 2.43.0
> 

