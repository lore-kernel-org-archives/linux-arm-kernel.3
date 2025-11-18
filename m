Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE5BCEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfrW3EP3oTNyLr5Dfyph5fZjMkDlGpINPOBqV9A9KO0=; b=3ZtullPiEH03GQy/pNQKkS8Fu/
	gmoDnQ5VAB2lqX1T0vOQsy2Lv4HAGfhUOXfyizX/SmdzbfNd7DLpsr8zmHYex2n9FcJ9ztvd/J9R9
	FnsPjejpGNfEiY1wTsvmqYSMR8LT5f3ndZkDFGmkMLp3F6JicyH4f9YZ96FymBVOr+PUDuv9GTR0F
	qffP8MaiMM9Cbo6q+ZXLxoGaPe/Shdw4EiIOV9e1CbmuLSZWNQW+lzN1ALxaew2okTb/l7KQQL+Jh
	eZK6yV2CRmUg7cCzWyzUrM7T7JV1Bea8lAHIFR3znEh/GIUnOCz70kI2IvjmpIDB/aR+eheQI1Na5
	NqQBCBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFxP-0000000HXpp-0EtB;
	Tue, 18 Nov 2025 07:16:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFxM-0000000HXpQ-1EMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFBD444580;
	Tue, 18 Nov 2025 07:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A8C4CEFB;
	Tue, 18 Nov 2025 07:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763450210;
	bh=o/KD4CFjTa5b+jI1V4WECs+Cr2gk3wDlEmLAaFnD4Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvQmVK3nMgoYR91ZphsqYWV0kU9oHzB14ClmsFfmVBjTSOEJMREcoW+bExW/4lYNB
	 qsBVlJgxcMYg3Q6lk3XVcGP7KbJvkswko9cpTr4M2DV1loH/L1yfLhyFkvL2CpQP0H
	 O8RO5eTZwqtyQ6b/SzifEjPeADuyZ/9PEIbXs7zU1910PfRnM55l2wRPm0S6yZiPAY
	 PRO4ACHkktfiw9ALsPokgf4lZBKVNJw8FGgiMWfIwG/nbEWC/kSOeIQisvvG2YXel/
	 CZP8j6YcWyD+pZC2j/JJwGyMBGJnaSr4vWwGfRl8Re9dqRN0zqOpLc85WI0GEDsYBe
	 nFQI6w5AU2jcg==
Date: Mon, 17 Nov 2025 23:16:49 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/5] KVM: arm64: GICv3: Force exit to sync
 ICH_HCR_EL2.En
Message-ID: <aRwdYZ98cwIeg-P3@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
 <20251117091527.1119213-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117091527.1119213-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_231652_356932_4C26C938 
X-CRM114-Status: GOOD (  23.83  )
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

Hey Marc,

On Mon, Nov 17, 2025 at 09:15:27AM +0000, Marc Zyngier wrote:
> FEAT_NV2 is pretty terrible for anything that tries to enforce immediate
> effects, and writing to ICH_HCR_EL2 in the hope to disable a maintenance
> interrupt is vain. This only hits memory, and the guest hasn't cleared
> anything -- the MI will fire.
> 
> For example, running the vgic_irq test under NV results in about 800
> maintenance interrupts being actually handled by the L1 guest,
> when none were expected.
> 
> As a cheap workaround, read back ICH_MISR_EL2 after writing 0 to
> ICH_HCR_EL2. This is very cheap on real HW, and causes a trap to
> the host in NV, giving it the opportunity to retire the pending
> MI. With this, the above test tuns to completion without any MI
> being actually handled.

Just to make sure I'm following, the scenario you're talking about is
we've already put the vgic into a non-nested state, populated an LR with
the pending MI at the time of that switch and L0 has no signal for when
it can drop the LR / pending state.

> Yes, this is really poor...

+1 :-/

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 7 +++++++
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 6 ++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index 99342c13e1794..f503cf01ac82c 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -244,6 +244,13 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
>  	}
>  
>  	write_gicreg(0, ICH_HCR_EL2);
> +
> +	/*
> +	 * Hack alert: On NV, this results in a trap so that the above
> +	 * write actually takes effect...
> +	 */
> +	isb();
> +	read_gicreg(ICH_MISR_EL2);

I'm all for writing correct code but since we don't actually care about
the value of MISR_EL2 do we need the ISB? There's no need for a CSE for
non-NV and you'd get it 'for free' by way of exception entry in the NV
case.

Thanks,
Oliver

