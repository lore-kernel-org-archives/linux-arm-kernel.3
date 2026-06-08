Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDD8CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ/DKIjQTR/mHpvMcZ8ruGCqc0pKfen5cUvVayJUDP4=; b=D6cP0kcLxVCOYbfNx2VAmiky1J
	ucVPQUtPuxzwa/k2ZY1aie6YSwjL/IC3ASs2kJVzinMU6+b7s5YJ7+rKa4yDTjGy8f3lvVcgjTcgo
	cjDonW4qmCPpzMwmSsGQUloGaPwWh7TIGJHhn1TwDpb4QR2iKL6ERm9WRingQTZvG9R67MOmQU8MI
	qwHvhRQQblUy6fbfo+rhTgTApdO41s0sG4m+79tadiK5Mfn9QE/3doDSwaqTln0VbjlL9P6nV2YS3
	OQES6N0KetWkx0Zw5e/dPsC/QCXRPc108/d6vyv0146kRFw/uCPkiMo7YAQOekonQMXZFXfBEwP2y
	yZub7dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcvz-000000045Ni-1Kvd;
	Mon, 08 Jun 2026 16:34:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcvy-000000045NN-30Uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0639D42D7F;
	Mon,  8 Jun 2026 16:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C459F1F00893;
	Mon,  8 Jun 2026 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780936481;
	bh=OQ/DKIjQTR/mHpvMcZ8ruGCqc0pKfen5cUvVayJUDP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KBHtPgxU6DA3m+t/qfjHS3nawDmc+4r6YTzCCMBYT5rtw3yoVBsda6CPjBJ++CpeO
	 aLUYPukZ19n04nmeT5MSKCn4y7LgnjqNZZRgw9f3UVl4InzLI96vqDBR+DD16ybG96
	 Lx6CEf9M5gQ7YtawbDbJEqJc40EyZpF4UmlJRNjF4Ugw4O7UEbZItrhLqOuQezE4kj
	 iVkcZeYkLTqRzu7i6dGEE3eOW7ljJITenX+2+T8PAbAivmOdXQ0VNGXCh61Z/Xit0N
	 ESQR/jztm0tNg9NqH0dM57M7C+mCSSk5tZdLJXLYsXC33s6lz6eejk5FgiCW7U6lLZ
	 q4WFXw0spz3/w==
Date: Mon, 8 Jun 2026 09:34:40 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Hold kvm->mmu_lock while initialising
 vcpu->arch.vncr_tlb
Message-ID: <aibvIDkOjCLkwkoW@kernel.org>
References: <20260608081108.2244133-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608081108.2244133-1-maz@kernel.org>
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

On Mon, Jun 08, 2026 at 09:11:08AM +0100, Marc Zyngier wrote:
> Sashiko reports that there is a race between initialising vncr_tlb
> and making use of it, as we don't hold the mmu_lock at this point.
> 
> Additionally, it identifies a memory leak, should userspace repeatedly
> invokes the KVM_RUN ioctl after a failure of kvm_arch_vcpu_run_pid_change(),
> as we assign vncr_tlb blindly on first run, irrespective of prior
> allocations.
> 
> Slap the two bugs in one go by taking the kvm->mmu_lock on assigning
> vncr_tlb, preventing the race for good, and by checking that vncr_tlb
> is indeed NULL prior to allocation.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20260607180815.85FBC1F00893@smtp.kernel.org

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  arch/arm64/kvm/nested.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 690b8e8564166..d11e36b3cfcc2 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1253,8 +1253,14 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
>  	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
>  		return 0;
>  
> -	vcpu->arch.vncr_tlb = kzalloc_obj(*vcpu->arch.vncr_tlb,
> -					  GFP_KERNEL_ACCOUNT);
> +	if (!vcpu->arch.vncr_tlb) {
> +		struct vncr_tlb *vt = kzalloc_obj(*vcpu->arch.vncr_tlb,
> +						  GFP_KERNEL_ACCOUNT);
> +
> +		scoped_guard(write_lock, &vcpu->kvm->mmu_lock)
> +			vcpu->arch.vncr_tlb = vt;
> +	}
> +
>  	if (!vcpu->arch.vncr_tlb)
>  		return -ENOMEM;
>  
> -- 
> 2.47.3
> 

