Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A320C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpZ01JGb1uA0C/KImKPXKegJpVLh/xFwg+tqlvz4CZo=; b=K0rSqMOGhu/pTutg4URpp0bJE5
	vD24s5VTwF1uT360ngpyI0bhhqt7mYGBOVlsbMswBaFVXJ3dZ5ED2Vszxz8W+kKysFLMlp+9nlGBF
	EdL/d6jw8oCBFtdS8psBgbMPJqmF70oUkbwwuNzgMHsoC55jAU7vP8Bw+7HRPrOfpM/cXW8rBeJKv
	dF+K9ZgEag/3b9o+DEJqpqsu2Z2XHyNuV358WVH75N0otfruYes4KuT5JKhRr4L+/56HgF4Jq6wW1
	DnCMNjUo/NHZtHnkX+FnGHOXW7Rgzh6L7bFGpdNq4cGwaTHwkR+LSF11hJIFekiMa0od6RBcD9xpj
	NyjLWjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU39C-00000005e18-26Fe;
	Tue, 24 Jun 2025 12:53:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU36q-00000005db5-1iEd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:50:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A03106F;
	Tue, 24 Jun 2025 05:50:23 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7073F66E;
	Tue, 24 Jun 2025 05:50:37 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:50:32 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: Re: [PATCH v9 28/43] arm64: RME: Allow checking SVE on VM instance
Message-ID: <20250624125032.GA111675@e124191.cambridge.arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-29-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611104844.245235-29-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_055044_494282_E52B3700 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Jun 11, 2025 at 11:48:25AM +0100, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Given we have different types of VMs supported, check the
> support for SVE for the given instance of the VM to accurately
> report the status.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/include/asm/kvm_rme.h | 2 ++
>  arch/arm64/kvm/arm.c             | 5 ++++-
>  arch/arm64/kvm/rme.c             | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 2d7d7233c525..af5150c084ce 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -94,6 +94,8 @@ void kvm_init_rme(void);
>  u32 kvm_realm_ipa_limit(void);
>  u32 kvm_realm_vgic_nr_lr(void);
>  
> +bool kvm_rme_supports_sve(void);
> +
>  int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>  int kvm_init_realm_vm(struct kvm *kvm);
>  void kvm_destroy_realm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 4eb229b6c315..d1ef12fe6176 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -426,7 +426,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = get_kvm_ipa_limit();
>  		break;
>  	case KVM_CAP_ARM_SVE:
> -		r = system_supports_sve();
> +		if (kvm_is_realm(kvm))
> +			r = kvm_rme_supports_sve();
> +		else
> +			r = system_supports_sve();
>  		break;
>  	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>  	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 5f1fdefc0364..6bd21223a8be 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -38,6 +38,11 @@ static bool rme_has_feature(unsigned long feature)
>  	return !!u64_get_bits(rmm_feat_reg0, feature);
>  }
>  
> +bool kvm_rme_supports_sve(void)
> +{
> +	return rme_has_feature(RMI_FEATURE_REGISTER_0_SVE_EN);
> +}
> +
>  static int rmi_check_version(void)
>  {
>  	struct arm_smccc_res res;
> -- 
> 2.43.0
> 

