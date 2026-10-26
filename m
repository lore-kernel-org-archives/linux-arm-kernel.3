Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D1606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A1qxBmI1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gvl/U9ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/xdSDdeNwO4oLUk3isMtVnIVH6TEXIfV4gp7YgJ8B1k=; b=A1qxBmI1gzjNa02SLF9lxqWDM0
	70sm5788E9GBYdveVdlObyZtpXKUpqCdYLDaQrSUy9rGZrPsCcz4sxS4iRawZvA4LD20IV0IDSyea
	ZnsnpUfzjs31jyE+H389sGPaaYhN0BmWpdsqBm97mbwsuXCGKJgNH05JAIOzHpt3k15+wblJyZlw/
	7kzuCO6ApaHkniyJpNuCvGEflYBz7JTZY5wigD3diDrafwYqhf3RWPleKyZRyyiFXA8sEFJ5VNR1V
	HjJCcgeCrqRrqFC6/hLYbir4B5XEWD7hTIjQzgl5Es/2amcggjjfEiHjiX8Bn2BUGYanAoiWeCPTR
	NUMTPySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ7P-0000000391u-1oFi;
	Mon, 26 Oct 2026 19:12:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ7O-0000000391c-0YqI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:12:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42E4460A6B;
	Mon, 26 Oct 2026 19:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A191F01825;
	Mon, 26 Oct 2026 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041945;
	bh=/xdSDdeNwO4oLUk3isMtVnIVH6TEXIfV4gp7YgJ8B1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gvl/U9ymGmD76EDO8gM1idS4m2xm2nI+zYFCJ02a5UHiKYkdMkYM89OkW7lpaQ7zI
	 kOjq7yrAq+hFHOVpyuqNGqTkvCTKIJGt55YdMDWL1LX3T6SUwB0clNHjiAXtbefSA6
	 wVZMhfp4HvGIbtEYIpajRqW5OGW4vf/JJyTNLQ6Nc3W7Jps1ujwvQIf/dULCm63oJK
	 om0DQbzTvw2LiMx2QuidllGglTAbWkrVI2d/pJkCrmBt+slX6elHe1Cr1NewXJ++5X
	 BjyTwYkAsKqdRi6sCPJ3kkzYhoNGnlYTIpwCe8dL4DKo+6Kn14Bqikqh9mL6vusfJf
	 HKH0VAw9U0y8w==
Date: Mon, 26 Oct 2026 12:12:23 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2
 VM
Message-ID: <at-mF3Qvq67Nh_v5@kernel.org>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
 <20261026152639.3926498-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026152639.3926498-2-fuad.tabba@linux.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 03:26:38PM +0000, Fuad Tabba wrote:
> KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
> legacy operation.

I'm pretty sure there's no IP out there that has GICv4.0 and legacy
mode...

> Such a VM has no LPIs and never uses vPEs, so
> vgic_supports_direct_irqs() is false for it and kvm_vgic_dist_destroy()
> never tears them down. However, userspace can still create an ITS for
> it. Once the vgic is initialised, vgic_its_create() calls
> vgic_v4_init(), which allocates the vPEs and requests a doorbell IRQ for
> each vCPU. They're then never freed, and each doorbell handler stays
> registered with a vCPU that's freed with the VM.
> 
> Only allocate vPEs for a GICv3 VM.
> 
> Fixes: 74fe55dc9ab77 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-v4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
> index ed236f083f0d7..a01de4de608a6 100644
> --- a/arch/arm64/kvm/vgic/vgic-v4.c
> +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> @@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
>  
>  	lockdep_assert_held(&kvm->arch.config_lock);
>  
> -	if (!kvm_vgic_global_state.has_gicv4)
> +	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)

use vgic_is_v3() instead

Thanks,
Oliver

>  		return 0; /* Nothing to see here... move along. */
>  
>  	if (dist->its_vm.vpes)
> -- 
> 2.47.3
> 
> 

