Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4661C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6372JEEZ7siNM2rDDA9jkfJcw0t4wmUTZbohTnpUyzU=; b=TJGYipkCXg+wuBdk8hKpUkzkWT
	QiP7v+3KMXlswsIskPZiTxb7P+VqiwXkk7KNG5YdOnOeWZEICIs4LF7UdGpYFE4mWWdJndOCjhN5o
	NbzFhCwPctKb4W0TSsCQ4U1pfpdGokIDbF+7FkjVD1Q0yJ9ynKhfPdxnTHTNa/ILtRd+oz6PRA2gP
	8BXaws4JEiRUoF9LtAJA2vD1EukeCOPrBARS4z7MN1yXqvzZGZZUxzMbDxFC2DxALEE66UhkKX3MG
	yeKo5BxF7oJJy9KXG6nMmB7X1GVUPn9MIOfWyeSEn1uEHb7ODeMoWp42LeUx6KTC0aBEXX/MUaPoU
	lxRiZFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTy8-0000000HRnA-1CMR;
	Wed, 08 Jul 2026 15:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTy4-0000000HRmk-3UqB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:13:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CE9E152B;
	Wed,  8 Jul 2026 08:13:39 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E09DD3F66F;
	Wed,  8 Jul 2026 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783523623; bh=KsPnCN5iKtR3Tyf39tnbed0nBIUgL2+cHyPoFgvOS+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc3j9izUpviX6IatkwKRU96CeLl6uZh+YJkdbarL3THb7zXIVe/Emj1TyPom5OXfB
	 x5DD6cjTp2lNyx5Gt+tswereaoWfbfc/MILAc1PTljO0ECmMsXO4G7/OISlMis8Jtb
	 ykZpwidCAERTAn1hhSvDXDK+PS/zTlKeAIafe/b4=
Date: Wed, 8 Jul 2026 16:13:39 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 24/28] KVM: arm64: Engage NV3 ERET trap elision
Message-ID: <20260708151339.GB12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-25-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-25-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_081344_915115_9B282F9D 
X-CRM114-Status: GOOD (  22.04  )
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

On Thu, Jul 02, 2026 at 05:02:44PM +0100, Marc Zyngier wrote:
> When running on NV3 HW, always engage ERET trap elision when running
> the L1 context, as there is no benefit in not doing so.
> 
> An L1 can itself engage trap elision by setting its own view of
> HCRX_EL2.NVTGE==1, which will subsequently be honored.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
>  arch/arm64/kvm/hyp/vhe/switch.c      |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index c562d8171d5e1..b32870a5e1236 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -706,6 +706,16 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  
>  		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
> +
> +		/*
> +		 * NV3 is a host-specific extension, and we always use it
> +		 * when present and that the guest uses NV. It may be be
> +		 * hidden from the guest though.
> +		 */
> +		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
> +		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
> +		}
>  	}
>  }
>  #endif /* __ARM64_KVM_EMULATE_H__ */
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index c5c06ae41b229..f129f22f15618 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -345,6 +345,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	u64 esr = kvm_vcpu_get_esr(vcpu);
>  	u64 spsr, elr, mode;
>  
> +	/* With NV3, the fast path is handled in HW */
> +	if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
> +		return false;
> +
>  	/*
>  	 * Going through the whole put/load motions is a waste of time
>  	 * if this is a VHE guest hypervisor returning to its own
> -- 
> 2.47.3
> 

