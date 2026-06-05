Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA17CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaVHoAOUI9LUISZtbViLuvlWXQydHijJv4Tcvcf97rw=; b=L2v8S0WdnKp6s9be1+kJyYWx6f
	WbM2YLFXDAOUqlUS9UGM6gp8BoNleQfCdSZZf0O3nJfDhZF0D30b15l3XH//SyqfxCOanlG6G7xHI
	gLcq9llVdJm08gSJNpSvJF7NKS1ugxECLFCqbohXq95P5YpKtad6pd5C0/r6WNgzJRCcvYAVMEeFn
	ER+xEEwqNEyXBNdbCZEo2AxJPtSAZ3zBELAN4C5zcG0utg6UvvKOAgQQgGxXZz3Gj8/rqL0fm1S1J
	jWwB9eVNbLC2RpkM5H8Ie348KSh03gteehVqd1MlOlJ8x71CgZ/J9DlEqfAVQJb/wcIuNPFoZf/jJ
	ts+YAWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNbl-0000000085g-17TY;
	Fri, 05 Jun 2026 06:00:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNbj-0000000085X-3uUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:00:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E24BF600AA;
	Fri,  5 Jun 2026 06:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6386D1F00893;
	Fri,  5 Jun 2026 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780639238;
	bh=gaVHoAOUI9LUISZtbViLuvlWXQydHijJv4Tcvcf97rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nKSoFLFzxN7azm4Cn4DB97IsmJ329/dL9s6fwzI/OROBryOO4b9sSxhniPBS+r3tH
	 FI6ruK1wwV90ZNmCPSgMIO4Yj5fjDAGj+pAN/mJ6pWU7Chtn7WS8D6P9lkxoqryFfn
	 16KL+uGoht8P9hNHncLU28eYrctOiWHlnkC1WfHeJS4yEgePP/dy4h//500BKoTXKR
	 pOTx3HWlNXlQJj7dbcD9eDeubitAzbja40z4eU7arQJ37v6YdEYv7/rfbwNd/ywVCx
	 n6aOxaIsv+eW4Cl11ECaTz0FqA1PIdKj5EZgm+hibSgpWllBzu/EmfgKGhmkkMM1b7
	 LlRcJyf1o1N2w==
Date: Thu, 4 Jun 2026 23:00:37 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, eric.auger@linaro.org,
	christoffer.dall@linaro.org, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours
 before migrating it
Message-ID: <aiJmBfXAxcytfGha@kernel.org>
References: <aiHnI1mu6SGQrgnz@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiHnI1mu6SGQrgnz@v4bel>
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

On Fri, Jun 05, 2026 at 05:59:15AM +0900, Hyunwoo Kim wrote:
> vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
> an interrupt to another vCPU. After reacquiring the locks it only checks
> that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
> before moving the interrupt, which assumes that an interrupt whose affinity
> is preserved is still queued on this vCPU's ap_list.
> 
> That assumption no longer holds if the interrupt is taken off the ap_list
> while the locks are dropped. vgic_flush_pending_lpis() removes the
> interrupt from the list and sets irq->vcpu to NULL, but leaves
> enabled/pending/target_vcpu untouched. As the interrupt is still enabled
> and pending, vgic_target_oracle() returns the same target_vcpu, so the
> affinity check passes and list_del() is run a second time on an entry that
> has already been removed.
> 
> Also check that the interrupt is still assigned to this vCPU
> (irq->vcpu == vcpu) before moving it.
> 
> Fixes: 0919e84c0fc1 ("KVM: arm/arm64: vgic-new: Add IRQ sync/flush framework")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Looking at this and the other VGIC patch you sent (which should've been
a combined series), are you trying to deal with a vCPU writing to
another vCPU's redistributor? I.e. vCPU B setting GICR_CTLR.EnableLPIs=0
behind the back of vCPU A?

That is extremely relevant information as the off-the-cuff reaction is
that no race exists. But since the GIC architecture is awesome and
allows for this sort of insanity, it obviously does....

Anyway, for LPIs resident on a particular RD, there's zero expectation
that the pending state is preserved when EnableLPIs=0. So I'd rather
vgic_flush_pending_lpis() just invalidate the pending state.

Beyond that, I see two other fixes for lifetime issues around the
vgic_irq in the middle of migration. I'd like to see explicit RCU
protection around the release && reacquire of the ap_list_lock rather
than depending on the precondition that IRQs are disabled.

Then vgic_flush_pending_lpis() should leave IRQs intact that are pending
a migration (e.g. irq->vcpu != vgic_target_oracle()) as the only expectation
we need to uphold is that LPIs resident on the RD have the pending state cleared.

Although I think we could benefit from the wetware implementation of the
GIC giving this a once over too. Any thoughts Marc?

Thanks,
Oliver

> ---
>  arch/arm64/kvm/vgic/vgic.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 1e9fe8764584..18b280de9a29 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -818,15 +818,16 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
>  		raw_spin_lock(&irq->irq_lock);
>  
>  		/*
> -		 * If the affinity has been preserved, move the
> -		 * interrupt around. Otherwise, it means things have
> -		 * changed while the interrupt was unlocked, and we
> -		 * need to replay this.
> +		 * If the interrupt is still ours and its affinity has
> +		 * been preserved, move it around. Otherwise, it means
> +		 * things have changed while the interrupt was unlocked
> +		 * (it may even have been taken off the list with its
> +		 * affinity left untouched), and we need to replay this.
>  		 *
>  		 * In all cases, we cannot trust the list not to have
>  		 * changed, so we restart from the beginning.
>  		 */
> -		if (target_vcpu == vgic_target_oracle(irq)) {
> +		if (irq->vcpu == vcpu && target_vcpu == vgic_target_oracle(irq)) {
>  			struct vgic_cpu *new_cpu = &target_vcpu->arch.vgic_cpu;
>  
>  			list_del(&irq->ap_list);
> -- 
> 2.43.0
> 

