Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6CCCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qazMKrEPIANzA0Hr+jqkFVIEKH43kpNxpKV1/kh9j9c=; b=0tWBQjQZWdAITlzmJ9TGPbw7dt
	IZPEVudxg8QFv7hTMJseQJJGPvzM+MgLXs/T6VnrQGJTap6yCMnkArf9xlThRGBCjftLHLWlJQkfb
	qy/ueEvU0gOgsPXyPdvQJjSdgy7f6uO5KI1aJeWgKZasRd57pfJGsDWiFeJZ2CNqntqD722Gkw2Hv
	F7Nud8MblrbPO+fuLuGKhZ55+KpRL2monD8EF0tPH2541xMLOu5ts/sCTkAsg+jOgRojuW9n/CbkK
	6jse/8q7KDPkzdAaF0cf011ojVnLTHaYd2K24B4f7M0un/6duA3Mp6J9yok7uhfT3vI3QfbegL4Z6
	jQsJyeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiqt-000000038Ry-1BKV;
	Fri, 16 Oct 2026 14:24:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiqr-000000038Rf-16NL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:24:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A5A160018;
	Fri, 16 Oct 2026 14:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD651F000C4;
	Fri, 16 Oct 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160644;
	bh=qazMKrEPIANzA0Hr+jqkFVIEKH43kpNxpKV1/kh9j9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=juaGSKyBwTs2bP6tYsl9oIFfSfZObgztLPLGTStr8wmac+hQzrGAGGPf3ImkcmjrK
	 Ppop/waiaiBw/S8J7YTJbOM7xsuA4D3jGNCPZl2wTnMfxLpMRmgAuhHF9mFtx64zVZ
	 RtbMBkTgZzJPHG45nOM7/1YRxDq2if3drys6d+JBmnMIF0OX5rsi0hFw7BvEiOMkmW
	 +S0PyhASyeddu7vHZEUgskTLlrAMPAJ9O/Nm7D9hPKc74dh37TKd4JDlTSGzIIcRcj
	 XjtxzhQFJJdkwBN0iVmyp/qB0CyfJ3gg+yIMjybVzXWqcSzkbOq9g7tWDJeVvjSfIC
	 fUze/pAiaJ74Q==
Date: Fri, 16 Oct 2026 15:23:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 07/28] KVM: arm64: Add KVM_ARM_VCPU_SPE VCPU
 feature
Message-ID: <atIr8IWcXcrjQ0wF@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-8-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-8-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:06:02PM +0100, Alexandru Elisei wrote:
> Add a new VCPU feature that enables SPE virtualization when set by
> userspace. KVM_VCPU_MAX_FEATURE will be bumped and the feature will
> become selectable by userspace once SPE support in KVM is implemented.

I guess it's also limited currently at this point in the series by
KVM_CAP_ARM_SPE being unselectable as it stands I think?

Maybe worth mentioning here that you're adding KVM_ARM_VPCU_SPE to the uapi,
updating docs, etc.?

>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

I wonder if there are any dependencies that need expressing in
arch/arm64/kvm/config.c?

In any case all LGTM, with mega-nit below addressed :):

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/virt/kvm/api.rst    | 2 ++
>  arch/arm64/include/asm/kvm_spe.h  | 5 +++++
>  arch/arm64/include/uapi/asm/kvm.h | 1 +
>  arch/arm64/kvm/arm.c              | 7 +++++++
>  4 files changed, 15 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 1ed5c389c7a4..654736fac78c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3591,6 +3591,8 @@ Possible features:
>  	  Depends on KVM_CAP_ARM_EL2_E2H0.
>  	  KVM_ARM_VCPU_HAS_EL2 must also be set.
>
> +        - KVM_ARM_VCPU_SPE: Enable SPE for the CPU. Depends on KVM_CAP_ARM_SPE.

Super nitty, sorry, but it seems other parts of the docs use tabs, whereas this
uses spaces?

> +
>  4.83 KVM_ARM_PREFERRED_TARGET
>  -----------------------------
>
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index f05e6d3f5705..e452da82666d 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -8,11 +8,16 @@
>
>  #ifdef CONFIG_KVM_ARM_SPE
>  bool kvm_supports_spe(void);
> +
> +#define vcpu_has_spe(vcpu)					\
> +	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
>  #else
>  static __always_inline bool kvm_supports_spe(void)
>  {
>  	return false;
>  }
> +
> +#define vcpu_has_spe(vcpu)	false
>  #endif /* CONFIG_KVM_ARM_SPE */
>
>  #endif /* __ARM64_KVM_SPE_H__ */
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 019e5e3d892e..f7f751c00e6f 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -107,6 +107,7 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
>  #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
>  #define KVM_ARM_VCPU_PMU_V3_STRICT	9 /* No default PMU creation */
> +#define KVM_ARM_VCPU_SPE		10 /* Support SPE in guest */
>
>  struct kvm_vcpu_init {
>  	__u32 target;
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eca1184ef9dd..b9cee4cf293d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1604,6 +1604,9 @@ static unsigned long system_supported_vcpu_features(void)
>  	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
>  		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
>
> +	if (!kvm_supports_spe())
> +		clear_bit(KVM_ARM_VCPU_SPE, &features);
> +
>  	return features;
>  }
>
> @@ -1648,6 +1651,10 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
>  	if (test_bit(KVM_ARM_VCPU_HAS_EL2, &features))
>  		return -EINVAL;
>
> +	/* SPE is incompatible with AArch32 */
> +	if (test_bit(KVM_ARM_VCPU_SPE, &features))
> +		return -EINVAL;
> +
>  	return 0;
>  }
>
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

