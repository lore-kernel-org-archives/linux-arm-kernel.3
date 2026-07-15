Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A17FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 00:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oViBGLJ4tg1nMndV2WceJKmMWbQp7NZXBPBVg5InRE=; b=pxGPArg0mje3+b3NLW2g1TCYHo
	GCi2e0xHHUW4gknePuTYTROA/Q+mueNu65nxU9oF1Ou5HtOb2tqmF8nTcl2qcmF4PeesTA7ATtptl
	01VXTnmE1BpZ2dDtx/qQh4MoS0dCEGsug5GNVQ7ZEwztIvdjv6mNnoLBCI1dwo8BhSl6CecxgmqfB
	nK0Y4eWDq/Z2IQ5vlfIz2Ua5QpJV+L5Q8W9ZtzFKKuKGEAaE1J43RAMf4gtuzHM4vXjNj/P+a5Nzn
	C0YROxaDr4aDb79X6sqzOBdTK74zEZuJ+caxA3iKa3vlWFDdvkM1CGZC6XvxUuUVGc7W6PQJsz6bp
	Mo6IEMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnJP-0000000DURi-1x9s;
	Wed, 15 Jul 2026 00:17:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnJM-0000000DURM-12si
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 00:17:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1BE339;
	Tue, 14 Jul 2026 17:17:09 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C67573F7D8;
	Tue, 14 Jul 2026 17:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784074633; bh=yKfQ0GflKniKbcTiQEcokqqiBLZSSKEnGRM/ps+7LEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRua4iHZvThGUR/J15sDSpBSVZDSq6MoZM6eoRmjBJ/YIJW0HpdFfris79gLUuOcR
	 HE43sySB5EsjwfP/Q3jUaSMJgqZwaUahQJAFu2eNtvT60+DnwWfLtA8L3x7bA8oUYW
	 EXfqwaFXdu3vj+FUWVM1qh3SEn8n+cPYopQ8l2cw=
Date: Wed, 15 Jul 2026 01:16:44 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 25/28] KVM: arm64: Engage NV3 TLBI trap elision
Message-ID: <nre6kiamcmf4azxni5def5kd5p74ia7rp7ynenpyczqticjcof@4inxwalqfyth>
References: <20260714091641.1970822-1-maz@kernel.org>
 <20260714091641.1970822-26-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714091641.1970822-26-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_171716_508063_DBC265E3 
X-CRM114-Status: GOOD (  19.18  )
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

On Tue, Jul 14, 2026 at 10:16:38AM +0100, Marc Zyngier wrote:
> Similarly to the ERET elision mechanism, FEAT_NV3 can elide TLBIs
> that only affects the guest's S1 translation. Enable this, with the
> express condition that the guest isn't NV2 aware, as we otherwise
> need to trap these TLBIs to deal with VNCR mappings.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index b32870a5e1236..d17b161d4ba3a 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -715,6 +715,19 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
>  		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
> +
> +			/*
> +			 * If the guest is NV2-capable, then we need to see
> +			 * all the TLBIs, as configured in HCR_EL2.
> +			 * Otherwise, relax the TLBI traps to only TGE=0.
> +			 */
> +			if (!kvm_has_nv2(vcpu->kvm)) {
> +				vcpu->arch.hcrx_el2 |= (HCRX_EL2_NVnTTLB   |
> +							HCRX_EL2_NVnTTLBIS);
> +
> +				if (kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
> +					vcpu->arch.hcrx_el2 |= HCRX_EL2_NVnTTLBOS;;
> +			}

I also suspected if this is dead code, but Sashiko had beat me to it :P
So from your response in v1, is this code here just for completeness?

It's amusing that we're not able to take advantage of this feature at
all!

Thanks,
Wei-Lin Chang

>  		}
>  	}
>  }
> -- 
> 2.47.3
> 

