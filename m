Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A5C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SkkcDNglAXfu0FPaIefArcN3O7d7Q9M6mkwEnU1wYQ=; b=OIfUZA1eCiz/H/DrM1Cu/CihVP
	oYHel+QgEzQztCz0KCgyh+jn3RvIR2zo4WqUio4gUaeXuifCSg/N/AzjiOFOtMR7PA2ONZl1NkJcN
	b1vgKtQX3A6yKkMHy2HAZ9eTTyedBP6cpW6dj2/HwH1qoml5tg1uYqhWVuLZBUgdePUX+YzMZYKcS
	HGHyIuqwoGqoVpfyRtD5NJTL8gPCzF5ZKTWJifRX9RbP5XgelyZAZ7iLwzTunhl5zynwIio0B7ImE
	tSCUJhQUtLPE6yGw3Hy9sxCHFvwgyjT50OHjD0bV0X/o+C9+XYy5WaR2K837HfATZqh8+8sXAkq+S
	5xSD88EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglUl-0000000GvlR-0Zxe;
	Tue, 29 Jul 2025 14:39:59 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglSI-0000000GvVm-2ZIH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 14:37:28 +0000
Date: Tue, 29 Jul 2025 07:37:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753799842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SkkcDNglAXfu0FPaIefArcN3O7d7Q9M6mkwEnU1wYQ=;
	b=tgFHkjL1MUAkN7dMrvMKdcStfjJYcM4ebAA5sAdTDjfvIQEWiHLGWCSUsWvL0uV28S7XQ1
	eIgJ5E1Qt1cTbsiu7xjOB+1Is3P/keuM343viJH8dUcSreCBvbbf71iiZ15IFVZ4/ZwNAn
	N5QIg5/aQUhNFUpZfk3nhd91z6higeU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Set/unset vGIC v4 forwarding if direct IRQs
 are supported
Message-ID: <aIjcmquPNOdE5l4K@linux.dev>
References: <20250728223710.129440-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728223710.129440-1-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_073727_245553_B330B6A0 
X-CRM114-Status: GOOD (  16.39  )
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

Hi Raghu,

Thanks for reporting this so quickly :)

On Mon, Jul 28, 2025 at 10:37:10PM +0000, Raghavendra Rao Ananta wrote:
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
> index e7e284d47a77..873a190bcff7 100644
> --- a/arch/arm64/kvm/vgic/vgic-v4.c
> +++ b/arch/arm64/kvm/vgic/vgic-v4.c
> @@ -433,7 +433,7 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
>  	unsigned long flags;
>  	int ret = 0;
>  
> -	if (!vgic_supports_direct_msis(kvm))
> +	if (!vgic_supports_direct_irqs(kvm))
>  		return 0;
>  
>  	/*
> @@ -533,7 +533,7 @@ int kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq)
>  	unsigned long flags;
>  	int ret = 0;
>  
> -	if (!vgic_supports_direct_msis(kvm))
> +	if (!vgic_supports_direct_irqs(kvm))
>  		return 0;

I'm not sure this is what we want, since a precondition of actually
doing vLPI injection is the guest having an ITS. Could you try the
following?

Thanks,
Oliver

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index a3ef185209e9..70d50c77e5dc 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -50,6 +50,14 @@ bool vgic_has_its(struct kvm *kvm)
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
 {
+	/*
+	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
+	 * indirectly allowing userspace to control whether or not vPEs are
+	 * allocated for the VM.
+	 */
+	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
+		return false;
+
 	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 1384a04c0784..de1c1d3261c3 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -396,15 +396,7 @@ bool vgic_supports_direct_sgis(struct kvm *kvm);
 
 static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
 {
-	/*
-	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
-	 * indirectly allowing userspace to control whether or not vPEs are
-	 * allocated for the VM.
-	 */
-	if (system_supports_direct_sgis())
-		return vgic_supports_direct_sgis(kvm);
-
-	return vgic_supports_direct_msis(kvm);
+	return vgic_supports_direct_msis(kvm) || vgic_supports_direct_sgis(kvm);
 }
 
 int vgic_v4_init(struct kvm *kvm);

