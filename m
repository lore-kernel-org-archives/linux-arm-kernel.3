Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D7ECFA452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4HMCU5qp8oStHGSj+wqjDqqsvFwav2OV50hFumMiu0=; b=S78KErG6pxSh5l6lCe/ydKE8Ao
	x+N9NDxepGRdXEoEwqGKW71/tJ+1ulStxRM6Ix8bDyrXYSLXxS1o+ruHDp+hm0EzRfKlDv5zrlnz/
	R/LMj0GfCyHpMK0Khu0khRp4ozLZHqTAgc1WsdbhnzzehXlJEEdIfwuwaX6/+pakhCEZeIv7o1Tuz
	okv7YHOr45UYHu9HhWsiWxJA3OZU6Xo/yYFCudDEdJtmjZQjWWvNqevJOpPxATD135D95JDi0T90h
	BgwYuASTDQF27SwJh4vP/VyWsFZlgdupMA6eSeFpemGOAwgCscnT0MCn7qHU6095xdaXGbQPA3dQk
	Ckk0H8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f3I-0000000FM1E-28lE;
	Wed, 23 Oct 2024 17:21:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eO9-0000000FC3F-1O6A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47C825C4B2A;
	Wed, 23 Oct 2024 16:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C27BC4CEC6;
	Wed, 23 Oct 2024 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701552;
	bh=gHkjsIBl2zCdBHabptiDZ7pNg52KgG/kROIPc6mU2+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pztSQ2CuekR85kezundgpCWe8ZdHIWxiO+YK3jULQx5DPzZvq/Ou3DmUS9fjUpAqf
	 +f/9BxxkaxsAfnrdXqAc6EIN33Yo7WGsOOyRAXDHL6MelgurG/x9HAGfapE6j5Co18
	 dlxpDBmYn9LrhsWksBld1ZnSboYMSm9ZWJtDvZdeXJYzq4pn0ZaL5prsfbHSJi1phf
	 e0z/UzzPjfltFYS7LYJcH180ZM8sZU5D5BAwZXfdQ3nOPqh6kCwFJeI0mw3LqAg7Ip
	 St4K8pkkOk7l7FXgIjzzooR7/y49VQ4WBkcVn+AbU8gEaibFLYNIWBoCGPimmJfEmQ
	 A9f3dB0Q9q6fQ==
Date: Wed, 23 Oct 2024 17:39:08 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/2] KVM: arm64: Don't map 'kvm_vgic_global_state' at EL2
 with pKVM
Message-ID: <20241023163907.GD29251@willie-the-truck>
References: <20241022144016.27350-1-will@kernel.org>
 <20241022144016.27350-3-will@kernel.org>
 <865xpk3wde.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xpk3wde.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_093913_435820_3774E8E4 
X-CRM114-Status: GOOD (  23.91  )
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

On Tue, Oct 22, 2024 at 06:01:17PM +0100, Marc Zyngier wrote:
> On Tue, 22 Oct 2024 15:40:16 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > Now that 'kvm_vgic_global_state' is no longer needed for ICC_CTLR_EL1
> > emulation on machines with a broken SEIS implementation, drop the
> > pKVM hypervisor mapping of the page.
> > 
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/setup.c | 17 -----------------
> >  1 file changed, 17 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 174007f3fadd..8fec099c2775 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -95,7 +95,6 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
> >  {
> >  	void *start, *end, *virt = hyp_phys_to_virt(phys);
> >  	unsigned long pgt_size = hyp_s1_pgtable_pages() << PAGE_SHIFT;
> > -	enum kvm_pgtable_prot prot;
> >  	int ret, i;
> >  
> >  	/* Recreate the hyp page-table using the early page allocator */
> > @@ -148,22 +147,6 @@ static int recreate_hyp_mappings(phys_addr_t phys, unsigned long size,
> >  	}
> >  
> >  	pkvm_create_host_sve_mappings();
> > -
> > -	/*
> > -	 * Map the host sections RO in the hypervisor, but transfer the
> > -	 * ownership from the host to the hypervisor itself to make sure they
> > -	 * can't be donated or shared with another entity.
> > -	 *
> > -	 * The ownership transition requires matching changes in the host
> > -	 * stage-2. This will be done later (see finalize_host_mappings()) once
> > -	 * the hyp_vmemmap is addressable.
> > -	 */
> > -	prot = pkvm_mkstate(PAGE_HYP_RO, PKVM_PAGE_SHARED_OWNED);
> > -	ret = pkvm_create_mappings(&kvm_vgic_global_state,
> > -				   &kvm_vgic_global_state + 1, prot);
> > -	if (ret)
> > -		return ret;
> > -
> >  	return 0;
> >  }
> 
> Maybe add a note indicating that nVHE/hVHE still have that particular
> mapping via the rodata section?

I can add something to the commit message, is that what you had in mind?

> Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks!

Will

