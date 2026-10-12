Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C0ECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9W8ZzVrjfGTsi/b8HwG45kOUss1n69Df+dHG94lAKag=; b=e458KYvgTF5AsilH7ptHUR18rq
	af9nFAwYlWQw4r5nd3TB2cxMAYmu/KkylTA9EZrzZSgYBEIEa6bYHGw/JS/jw2p1xQICd0isMs5zE
	E7fPl7qTKOt46rE28Nq2I8y8TsohB+ainzVydIoBF/14vgzpwfnnZHsKezTVRNkN9K2mC7/E52Wrv
	UCkfpv7QMc2QuBPr0Eq76A+kU8ENU7qm34EF2bT1gBoLFwz2zc57PanB0MVXvQME/4RyiHeEzUtUL
	gbcwxsMzKranLLjtXMuPQyAopSitX5SuX5xhgJpj5mWQBtxMDCFaRmkbkhjkbcRl+ltTwqR9iVj3O
	cH9tOLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEw1-0000000AQA9-38xG;
	Mon, 12 Oct 2026 12:15:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEvz-0000000AQ9l-3AlQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:15:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E417A1655;
	Mon, 12 Oct 2026 05:15:10 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4013F66F;
	Mon, 12 Oct 2026 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791807314; bh=DMfzaODv+X4rVAl4WF+kEEoPKgzLJ8k6qC5EAIV4KlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o1G7tYKAGZ8ZUOIwIMmHupcl8h8MbxdF5P7ZnXLQuJfQB61fuKwkwK3TZmO6C28+N
	 SbYuqfBg6rLwPYEE4bDpmIioMu2kDIHPUhQ9ZwHQlrvSnf+FbOofNqaEPjIQNkYSSX
	 T1ISHippehbYzUvxDUu/A6KZveqt9lew5OOG1nss=
Message-ID: <9cae3f68-1e6a-41e3-a092-39a662e26e6c@arm.com>
Date: Mon, 12 Oct 2026 13:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] KVM: arm64: Validate the host-provided vgic model
 in pKVM
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, oupton@kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
 vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com,
 steven.price@arm.com, tabba@google.com
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
 <20261011143648.211337-4-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261011143648.211337-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_051515_863681_13C76A85 
X-CRM114-Status: GOOD (  19.12  )
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

On 11/10/2026 15:36, Fuad Tabba wrote:
> EL2 copies vgic_model from the host's struct kvm unchecked, and the nVHE
> world switch dispatches on it with no cpucap guard. A host writing
> KVM_DEV_TYPE_ARM_VGIC_V5 makes EL2 access GICv5 CPU interface registers
> that are UNDEFINED without FEAT_GCIE, and panics the hypervisor on any
> GICv3 machine.
> 
> Accept only GICv3, the one model pKVM supports, and force anything else
> to 0, as for a VM with no in-kernel irqchip. EL2 reads the model only to
> pick the GICv5 world switch and to emulate GICv3 CPU interface accesses,
> and the host's own copy is left alone.
> 
> Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..a9d0e94709199 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -340,13 +340,19 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>   {
>   	struct kvm *kvm = &hyp_vm->kvm;
>   	unsigned long host_arch_flags = READ_ONCE(host_kvm->arch.flags);
> +	u32 vgic_model = READ_ONCE(host_kvm->arch.vgic.vgic_model);
>   	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
>   
>   	/* CTR_EL0 is always under host control, even for protected VMs. */
>   	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
>   
> -	/* Preserve the vgic model so that GICv3 emulation works */
> -	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
> +	/*
> +	 * pKVM runs only GICv3. Anything else becomes 0, the model of a VM
> +	 * with no in-kernel irqchip, which keeps EL2 off the GICv5 registers.
> +	 */
> +	if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		vgic_model = 0;



> +	hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;

0 is not a valid KVM_DEV_TYPE_*, so this looks good to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



