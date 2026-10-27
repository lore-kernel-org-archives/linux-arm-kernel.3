Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfGn7B5U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZyPwHfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=04q4u1JObS7tfcOZudjA/sgn19SAKGmJTGwcBE/ecfU=; b=lfGn7B5ULc/vr2OaNxwO3+QGme
	iqMKmDyBuhUt/scadma8AFZj+5GsjoxCAUg7Y9A5c6fHJxCtLBHf1CQc8Gp3gUdrrn0NuCQK4eg8X
	LbOO6qAW+lLzN8sYICBq9/u7rPV0XFf5iJx+4JcAPs3QnSYDfVAYbhW2Cecs3rE9pcOiTfqSQ9Q93
	NcHc79JN+l5pLvSq50yp8tgkzjUscssQsGuCTlzl6wPCcGoU/0xb10Q++u6CLzyAxxgqjXtu23h5/
	6sIQ/i85DHT0R5CfC9KAlbeZ8a9+jynP+jZ0BGMz1qi7tzkdzcR0MDNXBNizGZEnBre+fkvOsrYxW
	AoV2LIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLq2c-00000005sq3-3Fyy;
	Tue, 27 Oct 2026 22:53:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLq2c-00000005spw-0ONQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:53:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CF0D60136;
	Tue, 27 Oct 2026 22:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0BE1F01825;
	Tue, 27 Oct 2026 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793141592;
	bh=04q4u1JObS7tfcOZudjA/sgn19SAKGmJTGwcBE/ecfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LZyPwHfJlZOQqN7z+uCWJxqmk/WseCQmRIEWIZieJinlbPG0BxcFttrx6TYYvowhQ
	 4NpdFkbWNvv206a/5UWnPBgvabhA16HufdbzlxGZJVzw1kQm1SnPl0jeRbh1eBKgHi
	 KC6K3mmbsR8uVx4AWC2hIkwKTYvddDDns2oMfHxQFbGIfdp+Nn0c5UhsronIwDbWjO
	 WuOKZ2VE8KhJo3JinG7Hv+74NABgd7NkYgXG9k6fWTdez5HSaC4bCe0kt53br1xErF
	 KpGBOYO1TXdEbxHCp8nAjYtUG5obptbAS/quITDHlJU1y2KIiSosxCIaplULhaidJ1
	 h1hiBEtteGksw==
Date: Tue, 27 Oct 2026 15:53:11 -0700
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
Subject: Re: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when
 userspace clears nASSGIcap
Message-ID: <auErVwVAwtT-y9Hf@kernel.org>
References: <at-saZT_ixQxsZIr@kernel.org>
 <20261027073634.440288-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027073634.440288-1-fuad.tabba@linux.dev>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 07:36:34AM +0000, Fuad Tabba wrote:
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> index 5913a20d83019..a60697238a7a7 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> @@ -48,7 +48,7 @@ bool vgic_has_its(struct kvm *kvm)
>  	return dist->has_its;
>  }
>  
> -bool vgic_supports_direct_msis(struct kvm *kvm)
> +bool vgic_supports_vpes(struct kvm *kvm)
>  {
>  	/*
>  	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
> @@ -58,7 +58,12 @@ bool vgic_supports_direct_msis(struct kvm *kvm)
>  	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
>  		return false;
>  
> -	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
> +	return kvm_vgic_global_state.has_gicv4 && vgic_is_v3(kvm);
> +}
> +
> +bool vgic_supports_direct_msis(struct kvm *kvm)
> +{
> +	return vgic_supports_vpes(kvm) && vgic_has_its(kvm);
>  }
>  
>  bool system_supports_direct_sgis(void)
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
> index ed236f083f0d7..0a4b9a74425b4 100644
> --- a/arch/arm64/kvm/vgic/vgic-v4.c
> +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> @@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
>  
>  	lockdep_assert_held(&kvm->arch.config_lock);
>  
> -	if (!kvm_vgic_global_state.has_gicv4)
> +	if (!vgic_supports_vpes(kvm))
>  		return 0; /* Nothing to see here... move along. */
>  
>  	if (dist->its_vm.vpes)
> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index b71d486ae5145..7fc29a395a7db 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -500,6 +500,7 @@ static inline bool vgic_host_has_gicv5(void)
>  }
>  
>  bool system_supports_direct_sgis(void);
> +bool vgic_supports_vpes(struct kvm *kvm);
>  bool vgic_supports_direct_msis(struct kvm *kvm);
>  bool vgic_supports_direct_sgis(struct kvm *kvm);
>  
> 
> Tested on the FVP (GICv4.0 and GICv4.1): KVM doesn't leak doorbells in
> either patch's case, a GICv3 VM still gets its vPEs when the ITS is
> created, and the reproducer above doesn't hit the WARN. Does that work
> for you? If so, I'll send it as v2.

Bugh... Thanks for de-crapifying my request.

Yes, this works perfectly for me.

Thanks,
Oliver

