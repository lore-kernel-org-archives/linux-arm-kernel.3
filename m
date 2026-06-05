Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE34CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibrDkw4cplAxEvZj2EPWnYhxrc+tDX6PdpXQVAA6Xj4=; b=FByZv+4/Xxf3eQkRPoRuAXKvdJ
	ReBxX/TULhAh8HsQZmo/fW56SCQwfdc4HgonuY6Gx3NmnseTn8Ak+o52n29DkvjufpcIWVHybVl8L
	/tBwwDYeXyCYCfR76XRnB5EMWmhnQsq0fYqhUuE0x+lPa4cmdJpi3Q9clWSa4eY/XzEihOzfVXokm
	Wzl+gL1qKsyDU6p4C8TzYyRmzogXvNSlU3sUKp95mPP8LmI0LdUzLqbALs1VSUZepdgOJv76KVFJ2
	venAG+iI+53HepcHlyPcvS2JVo4xsRGciABvV8NNTWzYVXICx0T8MBMwXvIwOH0PbESQkgUqQ8OV+
	Qy7MzYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSeR-00000000XDS-1VHB;
	Fri, 05 Jun 2026 11:23:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSeQ-00000000XDH-2NhL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:23:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9C8C601DD;
	Fri,  5 Jun 2026 11:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE861F00893;
	Fri,  5 Jun 2026 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658625;
	bh=ibrDkw4cplAxEvZj2EPWnYhxrc+tDX6PdpXQVAA6Xj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nnOLGxRa1wovQ0EhFRYD9rILOeVIOgDCNz1pDQBWiyUv9YQf4O/m1N/AqS3j5OjNs
	 6tu+xfb7PtLKhiswywQIvQlu7stn6CpQ5vsc8qbtTngrIteqHgc3cdfx9e2N1Tr0iD
	 d1AGbeAG6pX+bJ7lNE4+NF0hE3WRR5Czb13ku0a5cLi5zJVAiubA2l4HYw9i0IDD/u
	 R+Nh/iK5epaZ09K1jdBBRnPfxVVIPCWA3/QAklV2xtfbBEp9Egq2Px2FL34e03ltFf
	 T9/vVO0dm60VeAMGVTOJIXV2D90LXu5j1Z2Rv0yhOzDbsrMOUYdjj8ABQLYoyBhRzf
	 R6sdU6RS0i+mg==
Date: Fri, 5 Jun 2026 12:23:40 +0100
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kernel-team@android.com, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Set a linux errno on SMCCC error in
 kvm_call_hyp_nvhe()
Message-ID: <aiKxvK8HXCac4SYU@willie-the-truck>
References: <20260603110312.2909844-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603110312.2909844-1-vdonnefort@google.com>
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

On Wed, Jun 03, 2026 at 12:03:12PM +0100, Vincent Donnefort wrote:
> If the HVC called in kvm_call_hyp_nvhe() fails with an SMCCC error code,
> we WARN. However, the returned value isn't initialized and the caller
> might get garbage or 0 which is likely to be interpreted as success.
> 
> Set a default -EPERM error value, ensuring all callers get the message
> when SMCCC calls fail.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> ---
> 
> I have encountered this issue while working on a follow-up contribution to the
> hypervisor tracing. In that case it completely crashed the kernel because
> IS_ERR() failed on that res.a1 value.
> 
> Now, if it makes that function more robust, I do not believe it is fixing any
> existing bug which is why I haven't added a "Fixes:" tag. 
> 
> In case we want to stick one, here it is:
> 
> Fixes: 054698316d87 ("KVM: arm64: nVHE: Migrate hyp interface to SMCCC")
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index a49042bfa801..6b8fd494792c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1273,13 +1273,14 @@ void kvm_arm_resume_guest(struct kvm *kvm);
>  #define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
>  
>  #ifndef __KVM_NVHE_HYPERVISOR__
> -#define kvm_call_hyp_nvhe(f, ...)						\
> +#define kvm_call_hyp_nvhe(f, ...)					\
>  	({								\
>  		struct arm_smccc_res res;				\
>  									\
>  		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
>  				  ##__VA_ARGS__, &res);			\
> -		WARN_ON(res.a0 != SMCCC_RET_SUCCESS);			\
> +		if (WARN_ON(res.a0 != SMCCC_RET_SUCCESS))		\
> +			res.a1 = -EPERM;				\
>  									\
>  		res.a1;							\
>  	})

Looks like the only error code we return to the host is
SMCCC_RET_NOT_SUPPORTED, so maybe -EOPNOTSUPP would be more appropriate?

Either way:

Acked-by: Will Deacon <will@kernel.org>

Will

