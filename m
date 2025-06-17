Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704A3C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 04:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfQt0Dij5bdaK/Ln/2PNF4m7CbwXt4vuxElA2oz6HGE=; b=XFxq2dqEUMwYUFQ0Nvq+fldWUH
	rmuTf01GOaLCUrMv/x56xnLx5i8RU1DGPF7od8A7KMpW8AZUmuhIT/jlK8EoCaM4QOcneQF1b3Rin
	E8tApXMEER9/tN2YisfxScLAZFDsCPuPFKorJkY0wYJHkUf1oWVao+nplnEE5Ir66kMNeFOAEjdHe
	dGXuk2ueyNF8oN0UxaVd9vnmsLA4nw7QTnH7cJOzRKOLLYjFgO+ETx2o8W9MgMAqg3WcesblrJ4G0
	6gHMZKpMNOPUNWHUtzxlnTjOWFXsRaZfCpWHPYIRLMqBjjOrobroIXXCD08iosbWbhqB5KHeYibwO
	bAz7IxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROMb-00000006Cvb-0Uny;
	Tue, 17 Jun 2025 04:56:01 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROKF-00000006CXD-0zhD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 04:53:37 +0000
Date: Mon, 16 Jun 2025 21:53:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750136012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jfQt0Dij5bdaK/Ln/2PNF4m7CbwXt4vuxElA2oz6HGE=;
	b=GdWv6waq8gMoqhYgz1Ox/03WCWiGI51+/Ufw5GcNEbiisvJWm8mRugwaxcDZounToMDDPO
	yRTK/Iq9nqK78oyXKeFWMAwyFt9CV5twVoyjraVwgBOP8nK5rMbD8WWLq/1Va/y3ETkJzg
	2vmmdVlb9wF9ptv8EwI9Rhl6liwRyRs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <aFD0wHqZ-8CRWIW-@linux.dev>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
 <86qzzkc5xa.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzzkc5xa.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_215335_816911_4571C46C 
X-CRM114-Status: GOOD (  32.05  )
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

On Mon, Jun 16, 2025 at 11:54:57AM +0100, Marc Zyngier wrote:
> On Sat, 14 Jun 2025 15:57:21 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> > s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> > the positions of the set bits in shadow_if->lr_map. So correct it.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > index 4f6954c30674..29741e3f077b 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > @@ -343,7 +343,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  	struct shadow_if *shadow_if = get_shadow_if();
> >  	struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
> >  	u64 val;
> > -	int i;
> > +	int i, index = 0;
> >  
> >  	__vgic_v3_save_vmcr_aprs(s_cpu_if);
> >  	__vgic_v3_deactivate_traps(s_cpu_if);
> > @@ -368,10 +368,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> >  
> >  		val &= ~ICH_LR_STATE;
> > -		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
> > +		val |= s_cpu_if->vgic_lr[index] & ICH_LR_STATE;
> >  
> >  		__vcpu_sys_reg(vcpu, ICH_LRN(i)) = val;
> > -		s_cpu_if->vgic_lr[i] = 0;
> > +		s_cpu_if->vgic_lr[index] = 0;
> > +		index++;
> >  	}
> >  
> >  	shadow_if->lr_map = 0;
> 
> Nice catch, thanks a lot for tracking it down.
> 
> However, I think we should get rid of this double-indexing altogether,
> or at least make it less error-prone. This thing is extremely fragile,
> and it isn't the first time we are getting bitten with it.
> 
> Looking at the code, it becomes pretty obvious that the shadow index
> is always the number of bits set in lr_map, and that we could
> completely drop the 'index' thing if we simply counted these bits
> (which isn't that expensive).
> 
> I came up with the (admittedly much bigger) following fix.
> 
> Thoughts?
> 
> 	M.
> 
> From 2484950b8fc3b36cca32bf5e86ffe7975a43e0e7 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Sun, 15 Jun 2025 16:11:38 +0100
> Subject: [PATCH] KVM: arm64: nv: Fix tracking of shadow list registers
> 
> Wei-Lin reports that the tracking of shadow list registers is
> majorly broken when resync'ing the L2 state after a run, as
> we confuse the guest's LR index with the host's, potentially
> losing the interrupt state.
> 
> While this could be fixed by adding yet another side index to
> track it (Wei-Lin's fix), it may be better to refactor this
> code to avoid having a side index altogether, limiting the
> risk to introduce this class of bugs.
> 
> A key observation is that the shadow index is always the number
> of bits in the lr_map bitmap. With that, the parallel indexing
> scheme can be completely dropped.
> 
> While doing this, introduce a couple of helpers that abstract
> the index conversion and some of the LR repainting, making the
> whole exercise much simpler.
> 
> Reported-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20250614145721.2504524-1-r09922117@csie.ntu.edu.tw

Besides Wei-Lin's comments, LGTM.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

