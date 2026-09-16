Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E0CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpupaYPnuoNq1+oiQvi9YAVwDplDQohdEFd2S9+cj6U=; b=rvvgFsvsk8MzMA3I76dP1tS5wV
	ddWaUik3THnYzdah6AI7S3HxH54Ca13Sbad+nV+H0N6Uo15Wz4IagitD8IbDEKHRrpBe1hL9FkTeZ
	4vwDvB3pHpHcuni8PQtvYcz2z223vZadI5xqPD0Pjez7rRW9LsAz/bRlOLQ1ccYdmKWn8jG8TFP74
	iF2O6BeUqrjFvaBpl6V9h1RcPs1Vggz4L3PpCOgG80UsSFBjuKgz6kv6BrYn9gIhQNX9SSvYqx8NE
	YR/tC4XWYIHKyfkGaRyd/QNIsXWmpyVn+2OSKcGa7RhfkGkSJYxf18J1G63qlCg9izLApHiH9gJWn
	cKxM+MzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nNx-000000091rg-0jxk;
	Wed, 16 Sep 2026 11:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nNu-000000091qS-3uN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:01:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45062152B;
	Wed, 16 Sep 2026 04:00:56 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C886E3F882;
	Wed, 16 Sep 2026 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789556459; bh=le64yFWu89IwQTgKsaA74r4GubOSVodhBlaIxBJsy1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeHro92U0oRR3vwxd1JwJpCnnmvxSmWT5qbm9wVCD7uvApw8F7Ka2crYiiXwI/uTp
	 vYgQG5zxs0l8zCLSiKde0WIau2Hjc31y+np0XjwrxTCwkutglwEtnOahfk5+ISkDxT
	 ywM/0JFHlDAknHew+79UxH+X+H1IL6vXMKYOgB44=
Date: Wed, 16 Sep 2026 12:00:52 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com,
	steven.price@arm.com, tabba@google.com
Subject: Re: [PATCH 3/7] KVM: arm64: Validate the host-provided vgic model in
 pKVM
Message-ID: <aqp25JLeqyCKtCQH@e143914.arm.com>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
 <20260915123846.2317931-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915123846.2317931-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_040103_013012_EBA94322 
X-CRM114-Status: GOOD (  21.61  )
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

Question(s)
   |
   |
   v

On Tue, Sep 15, 2026 at 01:38:42PM +0100, Fuad Tabba wrote:
> EL2 copies vgic_model from the host's struct kvm unchecked, and the nVHE
> world switch dispatches on it with no cpucap guard. A host writing
> KVM_DEV_TYPE_ARM_VGIC_V5 makes EL2 access GICv5 CPU interface registers
> that are UNDEFINED without FEAT_GCIE, and panics the hypervisor on any
> GICv3 machine.
> 
> Accept only GICv3, the one model pKVM supports, forcing anything else
> to 0.
> 
> Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..4c33c863e90e1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -340,13 +340,19 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  {
>  	struct kvm *kvm = &hyp_vm->kvm;
>  	unsigned long host_arch_flags = READ_ONCE(host_kvm->arch.flags);
> +	u32 vgic_model = READ_ONCE(host_kvm->arch.vgic.vgic_model);
>  	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
>  
>  	/* CTR_EL0 is always under host control, even for protected VMs. */
>  	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
>  
> -	/* Preserve the vgic model so that GICv3 emulation works */
> -	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
> +	/*
> +	 * GICv3 is the only model pKVM runs, and the GICv5 world switch
> +	 * touches registers UNDEFINED at EL2 without FEAT_GCIE.
> +	 */
> +	if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		vgic_model = 0;
> +	hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;

A bit confused by what is expected by writing 0 here? I would have maybe
expected to refuse running this VM? What happens if the host writes some
garbage here, so vgic_model=0, but then tries to access gic-v3
registers?

Thanks,
Joey

>  
>  	/* No restrictions for non-protected VMs. */
>  	if (!kvm_vm_is_protected(kvm)) {
> -- 
> 2.39.5
> 

