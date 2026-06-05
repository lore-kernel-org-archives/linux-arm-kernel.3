Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7464CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xomH7vFXWWtjI+devX73Or32J/jQoae12DQTVZVqU6c=; b=V0y7vZZ2rAzlagawC8xz1prfT9
	ahawyCbo72Hd/dcdzKJy9SMMI9e3bXCMo095c/1MecL0Qp+Lr+Mkm2HyT603euItQsP0FKEUYzB13
	4ohxIUy6iaV2gLdMPvChUsF4cUVU+fccOme8VEPX2mrVCfvByGbR+PrBPtvg246/VF58MfhnlL2OA
	ap5c+pK4w2Q/WLsrOkcr9Ql8Z5KlxHHwSVH5utk8SMy6dXovNxlfBXfy8fV8jYnl58UbqkUyV/IxE
	ga8hu4phDjGnZBqiTDYAqifr1534hEns4m5En5EkKYydDPtjz8XbApa1NuHL+QWkW5nY/GMIvjJRv
	Md2uDTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQ9P-00000000Kn4-3hJP;
	Fri, 05 Jun 2026 08:43:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQ9O-00000000Kmw-3Hu8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA9186012B;
	Fri,  5 Jun 2026 08:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5930A1F008A7;
	Fri,  5 Jun 2026 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780649013;
	bh=xomH7vFXWWtjI+devX73Or32J/jQoae12DQTVZVqU6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxSEptM2U7b3TTvsRGnvsifV7/2mvhUon8g+ClkaM3W3XTRJlMSyNNELzD6lEOGuR
	 8ms6RqLA8oJtaUJRIxlfVa7Ajpecpkm5C0qLki/zwwVPY4xnVsFB6hj3oHYJ0v5QGF
	 /ljPAV+X1LdB+UoULpHhNqCIdeCg1YhEF7+2Hczm4flYNIjzKyTIsfD78NieftTSh8
	 6XbmJDFnv55i1GzKK8i6YwOZPWUz6NOAyWoxVWkqZMvGWt2NqJ5uR3FQN4QyXO+3KQ
	 15GMRsCJ6WZe9BgoDPhmZHsEhFCVrVF9lFHWZ3HQV5lEQpaR6RkjNyNdbnm8WjBvmK
	 jw10Oqk5rBf7Q==
Date: Fri, 5 Jun 2026 01:43:32 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, eric.auger@linaro.org,
	christoffer.dall@linaro.org, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours
 before migrating it
Message-ID: <aiKMNIUMv9GQiIbD@kernel.org>
References: <aiHnI1mu6SGQrgnz@v4bel>
 <aiJmBfXAxcytfGha@kernel.org>
 <87ecila0w3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecila0w3.wl-maz@kernel.org>
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

On Fri, Jun 05, 2026 at 08:42:52AM +0100, Marc Zyngier wrote:
> On Fri, 05 Jun 2026 07:00:37 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > On Fri, Jun 05, 2026 at 05:59:15AM +0900, Hyunwoo Kim wrote:
> > > vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
> > > an interrupt to another vCPU. After reacquiring the locks it only checks
> > > that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
> > > before moving the interrupt, which assumes that an interrupt whose affinity
> > > is preserved is still queued on this vCPU's ap_list.
> > > 
> > > That assumption no longer holds if the interrupt is taken off the ap_list
> > > while the locks are dropped. vgic_flush_pending_lpis() removes the
> > > interrupt from the list and sets irq->vcpu to NULL, but leaves
> > > enabled/pending/target_vcpu untouched. As the interrupt is still enabled
> > > and pending, vgic_target_oracle() returns the same target_vcpu, so the
> > > affinity check passes and list_del() is run a second time on an entry that
> > > has already been removed.
> > > 
> > > Also check that the interrupt is still assigned to this vCPU
> > > (irq->vcpu == vcpu) before moving it.
> > > 
> > > Fixes: 0919e84c0fc1 ("KVM: arm/arm64: vgic-new: Add IRQ sync/flush framework")
> > > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > 
> > Looking at this and the other VGIC patch you sent (which should've been
> > a combined series), are you trying to deal with a vCPU writing to
> > another vCPU's redistributor? I.e. vCPU B setting GICR_CTLR.EnableLPIs=0
> > behind the back of vCPU A?
> > 
> > That is extremely relevant information as the off-the-cuff reaction is
> > that no race exists. But since the GIC architecture is awesome and
> > allows for this sort of insanity, it obviously does....
> > 
> > Anyway, for LPIs resident on a particular RD, there's zero expectation
> > that the pending state is preserved when EnableLPIs=0. So I'd rather
> > vgic_flush_pending_lpis() just invalidate the pending state.
> 
> Just clearing the pending state introduces a potential problem as we
> now have an interrupt that is neither active nor pending on the AP
> list. It is not impossible to solve (we now have similar behaviours
> with SPI deactivation from another vcpu), but that requires posting a
> KVM_REQ_VGIC_PROCESS_UPDATE to the target vcpu.

Right, I was suggesting that in addition to deleting the LPI from the AP
list we actually invalidate the pending state so that someone sitting on
a pointer to a to-be-freed LPI sees vgic_target_oracle() returning
NULL

> > Beyond that, I see two other fixes for lifetime issues around the
> > vgic_irq in the middle of migration. I'd like to see explicit RCU
> > protection around the release && reacquire of the ap_list_lock rather
> > than depending on the precondition that IRQs are disabled.
> 
> I'm not sure I follow. Are you suggesting turning the AP list into an
> RCU protected list?

No, sorry, I should expand a little.

We store a reference on the vgic_irq struct in the AP list, which is
stable so long as the ap_list_lock is held. It should be possible for
the refcount to drop to 0 between releasing the ap_list_lock and
reacquiring it.

So either vgic_prune_ap_list() takes an additional reference on the
vgic_irq before dropping the ap_list_lock or rely on RCU to protect
vgic_irq structs observed with a non-zero refcount.

Thanks,
Oliver

