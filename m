Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E398C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP2BhWYoCVh6Y4xrZ+Cu/j1reonrV0/4iquFMhIpf4I=; b=t1q0BeyxGnc5Sbd3KXuBEFXxPW
	oK7kX7WxBlfiWdU/1iKVk1BtoPJKS7nT2YIgnVllnMClbeX2P34tYlZRra0L4cjOuUfY/xOxxQ3Ap
	jitswPccZsS0OBsAtqgr8jU+WpT8rKb/y2Zbb5kPvrqutZFmwvfZ8aYTPIT7VP6VUFQhmLa7ZSNLn
	+4c+g/kpS223hXAqWasK3wXBzVsi6dmAwRLegBHOt8O+DGy+E+WcQMP99aQVKKpMHQqKApE+Sd+c8
	sbicO7dWql+Xqbcypz35yH7qEa20j8dYBA/ZKCFLpNFoJB5pJzzFlzesgHyi5BNwStZTDmOAxwnyV
	sLsAoJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8Sy-0000000GEHy-1FkE;
	Wed, 12 Aug 2026 12:53:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8Su-0000000GEHP-3LCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:53:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE401596;
	Wed, 12 Aug 2026 05:53:46 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC3303F632;
	Wed, 12 Aug 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786539230; bh=Nsey5we6rIhYyiJ87M7AhJFBPy6Qd1JEoFQxTIJhaY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QS9svdABJ7Q7clDrd//faRMSGmsQiRrjhxaocMz0cbDDTn+rOE7PwoHvcJWprFwrs
	 AG+ifvva752QB+fPVJ8NZacgBX+ptPGpcXZr9lBUZC3fklqmfezltGCVDkxxI+pzTq
	 TEC8QvpfAOaf1zEqKg+SQf6ra0gPAitmbunC927Y=
Date: Wed, 12 Aug 2026 13:53:43 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Validate GICv5 timer PPIs before
 claiming ownership
Message-ID: <anxs1yj3Qbv2JkTf@e143914.arm.com>
References: <20260811150941.941295-1-sascha.bischoff@arm.com>
 <20260811150941.941295-5-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811150941.941295-5-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_055352_904050_7865D94E 
X-CRM114-Status: GOOD (  20.50  )
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

On Tue, Aug 11, 2026 at 03:11:48PM +0000, Sascha Bischoff wrote:
> With GICv5, timer PPIs use architecturally defined IDs, and therefore
> we require userspace to use the architected IDs too. We perform this
> validation in timer_irqs_are_valid(), which validates the configured
> PPI after claiming it with kvm_vgic_set_owner(). This is obviously the
> wrong order, and could both result in a NULL pointer dereference for
> an ID >= 64 and in an incorrect ownership claim.
> 
> Switch the order to first validate the PPI before setting the
> owner. This both prevents an invalid GICv5 timer PPI from reaching the
> IRQ lookup, and avoids claiming an IRQ for a timer configuration that
> will be rejected.
> 
> Fixes: 06c85b58e0b1 ("KVM: arm64: Move GICv5 timer PPI validation into timer_irqs_are_valid()")
> Link: https://sashiko.dev/#/message/20260810111614.DDC731F000E9%40smtp.kernel.org
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/arch_timer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 4155fe89b58a1..af7e2894cd690 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1529,13 +1529,14 @@ static bool timer_irqs_are_valid(struct kvm_vcpu *vcpu)
>  
>  		ctx = vcpu_get_timer(vcpu, i);
>  		irq = timer_irq(ctx);
> -		if (kvm_vgic_set_owner(vcpu, irq, ctx))
> -			break;
>  
>  		/* With GICv5, the default PPI is what you get -- nothing else */
>  		if (vgic_is_v5(vcpu->kvm) && irq != get_vgic_ppi(vcpu->kvm, default_ppi[i]))
>  			break;
>  
> +		if (kvm_vgic_set_owner(vcpu, irq, ctx))
> +			break;
> +
>  		/*
>  		 * We know by construction that we only have PPIs, so all values
>  		 * are less than 32 for non-GICv5 VGICs. On GICv5, they are

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

