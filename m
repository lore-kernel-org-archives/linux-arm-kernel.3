Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1627810775FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxJOEByN7ewymw6pSPuQ+ZeMEdYJd/uAxLsc0uqyQBc=; b=Jt2bvQkckYxK+rdAfYSbAHMhAh
	cG5Rb25gWyBrBsxYDtGRJe8YoaEJCCcgfeHvzXfX7WBz54M6dM6T2+kUSRp0WKWUKZrTga3eh/ifx
	A2ZpZMMyfs7nNlExaUwoVCcSI0LbCqWJPkTWHzX9IUMhvlZewW8+TtGHzT75e3qJXQURwy0SoXfZx
	CChmtJIooG2U5CAp9IZ24OGr3rt6ElC9TNti/9GY/AbCGhD/2QAB8yH80pCe25+j7YrjvKmZnWCEd
	uKsuM5fd568ydlEdWmkdC5hLjG18WP1+55rrzNwcRDKHe2WbanXBw96A3JiHuuK9O5fZmj5NoWhgF
	IQWFnnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v4t-000000097ns-2mNr;
	Wed, 18 Mar 2026 17:53:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v4r-000000097n4-3mMV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D1874445B;
	Wed, 18 Mar 2026 17:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C93C2BC87;
	Wed, 18 Mar 2026 17:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856385;
	bh=/FtksUb0vQYznzFRIPfR9MewstAW7yg/M3ruCi0rssc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFWnYb+fmbVaJ6RkkS/aTh8s2lU9oOFpaeQZ8BFoIRf61pruYIez+L5kWVn82fD4c
	 m1Dvg328rpKYz904q8wlIixVX9HUcOHsSJ/yNYHMX4C1Ff5PJV1RO/pEvAjPC4l6WF
	 YEuwqNGBNMnlCFsngSIdRbtRbFl8PibcCthdbQoVTsQyEX1xN/jRp885JJ7zak7nW+
	 oO6c0EulR8vnOjapPCBk0x9+abuzMvfbVh1PEXlBNK1qlXAtkg/X6nppcuPO4D77y7
	 8Rpd4E4QZMUpIPDVAUUv/qDkQhEcYQ4rNT6lvrYvG0pC3wckBK8N2NDEuyZrm83Qy7
	 jIXri9couDKNA==
Date: Wed, 18 Mar 2026 17:53:17 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 14/30] KVM: arm64: Implement SME vector length
 configuration
Message-ID: <20260318175317.GL2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-14-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-14-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_105305_963870_7789FCC4 
X-CRM114-Status: GOOD (  14.26  )
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

On Fri, Mar 06, 2026 at 05:01:06PM +0000, Mark Brown wrote:
> +#define vcpu_max_vl(vcpu) max(vcpu_sve_max_vl(vcpu), vcpu_sme_max_vl(vcpu))
> +#define vcpu_max_vq(vcpu) sve_vq_from_vl(vcpu_max_vl(vcpu))
> +
> +/* Current for the hypervisor */

Not sure what this means, isn't it also current for the guest?

> +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> +			       vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))
> +
> +/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> +#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
> +			     sve_ffr_offset(vcpu_cur_sve_vl(vcpu)))
>  
>  #define vcpu_sve_zcr_elx(vcpu)						\
>  	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index c67564f02981..498a49a61487 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -354,6 +354,15 @@ struct kvm_arm_counter_offset {
>  #define KVM_ARM64_SVE_VLS_WORDS	\
>  	((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
>  
> +/* SME registers */
> +#define KVM_REG_ARM64_SME		(0x17 << KVM_REG_ARM_COPROC_SHIFT)
> +
> +/* Vector lengths pseudo-register: */
> +#define KVM_REG_ARM64_SME_VLS		(KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
> +					 KVM_REG_SIZE_U512 | 0xfffe)
> +#define KVM_ARM64_SME_VLS_WORDS	\
> +	((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)

I think this could be removed: it's never used and the doc describes only
SVE_VLS_WORDS for both SME and SVE. Maybe we could have a "VEC_VLS_WORDS"
alias but using the SVE one seems fine to me.

Rest looks good

Thanks,
Jean`

