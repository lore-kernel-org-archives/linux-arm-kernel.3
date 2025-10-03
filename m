Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2025CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkFgpezMQKS/gQLXn3AyZkGxBPfCkQ1RwNxBP22utPM=; b=dC7oMKb7J7cgvrJNwC6T9xb7yJ
	mlvOn8wLQVJsf9Yqsvs8e49hXBcOhboZndkoKx5raxVx7QTxLNerz8IpgPFLdiNFiXZvJnSlLiHtc
	ookp5PkEViDYiov/jjym1+bWXdZPxlVoTxI+H2inWVsPJXVaGuVrDxU56G5iuBQW/Mztg5GkUiXqr
	lJ1ifFyWCNc8axgHeQzhYJwN3Q7ybGterzRMd5nX9PSrNljbYWrgdPx2miw6wCjuj7ALYGLy0D09g
	hbR8xEtlK6Gz6GSA8tcEy9KknJEcdevxBJ66vj8ol4pUDS5edFmT7IRTzqX4bzoHogmGLuHV1olr5
	IlDSZ5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4THh-0000000BQmW-2QKI;
	Fri, 03 Oct 2025 00:04:29 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4THe-0000000BQld-0Ykw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 00:04:27 +0000
Date: Thu, 2 Oct 2025 17:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759449861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kkFgpezMQKS/gQLXn3AyZkGxBPfCkQ1RwNxBP22utPM=;
	b=qg4zTlvUUnUwY8urfG2Q95TBycGvvpK1Cdx3XhQ7mPJesKFOtu62Az3Ad8+VzmqKFyYLNB
	XSmjjuDXsUQAkoO6YZuHaXhLtGg23SF78swtq3aPOQv0uEqIAWFSLfGnucRINVvtS5aE6R
	fGBZW4/o9mH5RNv2EUQSLOGGkSzefJg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] KVM: arm64: nv: do not inject L2-bound IRQs to L1
 hypervisor
Message-ID: <aN8S-8HJFLjq6i2M@linux.dev>
References: <20251002205939.1219901-1-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002205939.1219901-1-volodymyr_babchuk@epam.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_170426_551216_06FDB34B 
X-CRM114-Status: GOOD (  22.07  )
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

Hi Volodymyr,

On Thu, Oct 02, 2025 at 09:00:11PM +0000, Volodymyr Babchuk wrote:
> Difference between nested virtualization and "baremetal" case is that
> real GIC can track lots of active interrupts simultaneously, but vGIC
> is limited only to 4..16 LRs.

There isn't an architectural limitation here. Nothing prevents a
virtualized GIC from representing more active IRQs than there are LRs in
hardware.

ICH_HCR_EL2.LRENPIE allows you to take a trap when an EOI is received
for an IRQ that exists outside of teh list registers which would allow
the deactivation of the SW view of that IRQ.

As Marc suggested, the correct thing to do is adjust the sorting of IRQs
such that pending IRQs fill LRs before those in an active state.

> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index 7f1259b49c505..bdd1fb78e3682 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -286,9 +286,13 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  		if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
>  			continue;
>  
> +		irq->targets_l2 = true;
> +
>  		lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
> -		if (!(lr & ICH_LR_STATE))
> +		if (!(lr & ICH_LR_STATE)) {
>  			irq->active = false;
> +			irq->targets_l2 = false;
> +		}
>  
>  		vgic_put_irq(vcpu->kvm, irq);
>  	}
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 6dd5a10081e27..6f6759a74569a 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -858,6 +858,17 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
>  			break;
>  		}
>  
> +		/*
> +		 * If we are switching to L1 Hypervisor - populate LR with
> +		 * IRQs that targeting it especially and are not targeting
> +		 * its L2 guest
> +		 */
> +		if (vcpu_has_nv(vcpu) && !vgic_state_is_nested(vcpu) &&
> +		    irq->targets_l2) {
> +			raw_spin_unlock(&irq->irq_lock);
> +			continue;
> +		}
> +
>  		if (likely(vgic_target_oracle(irq) == vcpu)) {
>  			vgic_populate_lr(vcpu, irq, count++);

This has some serious issues as it violates our architectural model of
the GIC.

The existence of an LR associating a vIRQ to a pIRQ only has relevance
when in a nested state, specifically when handling vIRQ deactivation.
Besides that it is just a number...

For example, imagine the guest hypervisor associated an EL1 timer IRQ
with an LR and later tried to clear the active state and re-arm the
timer. Seems like we would miss the IRQ entirely.

I'd really like to see a solution similar to Marc's proposal which
addresses the fundamental problem of active IRQs overflowing the list
registers. 

Thanks,
Oliver

