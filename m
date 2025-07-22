Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B5C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poYuBLo+FyteJvotbUIRXGnKl0U6/ba9ipHaVlY2UUk=; b=QU2kb7KbOu/5dnERrcNLJM8NNN
	AvDG0WTan2cK8GfoDEdCXdUwLmkxiDlgBa4wgK7BPJhnvsl5AkpnucQnN72w3LBx493MUjgzlJbNt
	TNuE5FdcUp/MJZdLlVr4JtlsMqmkmFaEw8AH+p1kdQ6NVG7S1jm4K8IXyNq8+b+Qkubzi51ciZmvz
	L6WmOErNOF2WNQla0G40YufWPrHIY47jTpsskoPNjFbV1m3FPQkbCqrHMa/zB+ZQyQhn22fhYx5bc
	9bi4EoqByT0FD2eiiSv/BVSPlCrYNDSS8cAomkZRPL9y4UkLeQBoWZmK1SA3sVA3kTIfIzcLdT63G
	fErs/8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLnP-00000003cgk-2R5P;
	Tue, 22 Jul 2025 22:49:15 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLkt-00000003cVg-1urR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 22:46:40 +0000
Date: Tue, 22 Jul 2025 15:46:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753224395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=poYuBLo+FyteJvotbUIRXGnKl0U6/ba9ipHaVlY2UUk=;
	b=PtSYDgQFY+/+9zqYqgARX+ymZRw3lpYC9Glbw49QLvz3LG4D9WkGmnMOXQG1/coRucFm4z
	NEJB45btLP54Mqum3AV4BNAef/AKdNP+37zPFzRu7Pz1JHBWUSHktsWuZ1iDymyinECMnF
	iYOUj29fbNw1VimnSv879a6LwYWQU8k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] KVM: arm64: vgic-its: Unmap all vPEs on shutdown
Message-ID: <aIAUxarULx3vC2MO@linux.dev>
References: <20250623132714.965474-1-dwmw2@infradead.org>
 <20250623132714.965474-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623132714.965474-2-dwmw2@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_154639_697607_C641F7F0 
X-CRM114-Status: GOOD (  22.50  )
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

On Mon, Jun 23, 2025 at 02:27:14PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> We observed systems going dark on kexec, due to corruption of the new
> kernel's text (and sometimes the initrd). This was eventually determined
> to be caused by the vLPI pending tables used by the GIC in the previous
> kernel, which were not being quiesced properly.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/arm64/kvm/arm.c          |  5 +++++
>  arch/arm64/kvm/vgic/vgic-v3.c | 14 ++++++++++++++
>  include/kvm/arm_vgic.h        |  2 ++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 38a91bb5d4c7..2b76f506bc2d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2164,6 +2164,11 @@ void kvm_arch_disable_virtualization_cpu(void)
>  		cpu_hyp_uninit(NULL);
>  }
>  
> +void kvm_arch_shutdown(void)
> +{
> +	kvm_vgic_v3_shutdown();
> +}
> +
>  #ifdef CONFIG_CPU_PM
>  static int hyp_init_cpu_pm_notifier(struct notifier_block *self,
>  				    unsigned long cmd,
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index b9ad7c42c5b0..6591e8d84855 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -382,6 +382,20 @@ static void map_all_vpes(struct kvm *kvm)
>  						dist->its_vm.vpes[i]->irq));
>  }
>  
> +void kvm_vgic_v3_shutdown(void)
> +{
> +	struct kvm *kvm;
> +
> +	if (!kvm_vgic_global_state.has_gicv4_1)
> +		return;
> +
> +	mutex_lock(&kvm_lock);
> +	list_for_each_entry(kvm, &vm_list, vm_list) {
> +		unmap_all_vpes(kvm);
> +	}
> +	mutex_unlock(&kvm_lock);
> +}
> +

This presumes the vCPUs have already been quiesced which I'm guessing
is the case for you. The vPEs need to be made nonresident from the
redistributors prior to unmapping from the ITS to avoid consuming
unknown vPE state (IHI0069H.b 8.6.2).

So we'd probably need to deschedule the vPE in
kvm_arch_disable_virtualization_cpu() along with some awareness of
'kvm_rebooting'.

Thanks,
Oliver

