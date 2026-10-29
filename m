Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F47606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhtt/eNn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYJwYCEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+BSfrJ0Fvk6pE1EEg+dZVSHnO3k4S6/t9PQDyacXF7o=; b=yhtt/eNnxJhvvlsLoz8tJw9JrF
	pJTTQxRfWiF2ZIZHFwZnH923kj9bD+vGb4RldtkF4PB3CxOQBgdycMJvqi7g41nwEL4y7BBV/cfn/
	6noCr60XxZOmTg+1CUwSb6Z8zd0wn9Q3rM7Sxxx7pi2ENS7KMQgI8zRDskm28QXcu6O0hamcaUuvB
	z9inzPEDh+PbQ6ujzChL29MIdJBDN6s9owOn6S1YIQZcwEo5OgSCMxEM+3ekx6DceM1dRAJP46HK7
	tck9WERiLsCFSJGOPMD1OqMAuFxKYx0yvGrUmQCO4i0sUFq3PHsMb0TgA2vT/Ci3hDbTMt5KVAr8v
	9Gqh6gUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUT8-0000000A2jF-3TZi;
	Thu, 29 Oct 2026 18:03:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUT7-0000000A2is-16Ra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:03:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6287543D59;
	Thu, 29 Oct 2026 18:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3441F01824;
	Thu, 29 Oct 2026 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793296996;
	bh=+BSfrJ0Fvk6pE1EEg+dZVSHnO3k4S6/t9PQDyacXF7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYJwYCElxdxWS679xOjC48/NIm/L2CqIDBLv8s8E+xU+vA+JqOfQHYixNUrQ0LzSY
	 ItBepWZ6kKBBsr4E4tqXhGlEN/SnGuJgbAu0MTHIZ5BpcmzAlyzCL5huyegq4rEgh4
	 ynKngZe7bRWzBHriiddEXebJEzThkroDmdl/3RzHf92eoIXv/D/ziF6MZxsJ+nyZbs
	 6viFG1bK85EegdzHqSzwVNmESgMVIh77mXg9zSpnGNYnZlGph1vSpyWFhzQ3es0EOp
	 LojqonfL/BvpvedyLH+EnNpRxqj+05ddEKLbEvZpMxUDI5sGb+uKqr2pnv0j6zjVec
	 Qqu9+5Uyd4P5A==
Date: Thu, 29 Oct 2026 18:03:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 14/28] KVM: arm64: Add SPE VCPU device attribute
 to initialize SPE
Message-ID: <auOG5W5hxDVYL-hh@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-15-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-15-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:09PM +0100, Alexandru Elisei wrote:
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 8ffa3e89d38c..c695aae484d3 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -449,6 +449,7 @@ enum {
>  #define KVM_ARM_VCPU_SPE_CTRL		3
>  #define   KVM_ARM_VCPU_SPE_IRQ		0
>  #define   KVM_ARM_VCPU_SPE_ID		1
> +#define   KVM_ARM_VCPU_SPE_INIT		2
>
>  /* KVM_IRQ_LINE irq field index values */
>  #define KVM_ARM_IRQ_VCPU2_SHIFT		28
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 132df44c3088..c9a026c61ce7 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1026,6 +1026,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>  			return ret;
>  	}
>
> +	if (vcpu_has_spe(vcpu)) {
> +		ret = kvm_spe_vcpu_first_run_init(vcpu);
> +		if (ret)
> +			return ret;
> +	}
> +

So, staring at patch 18 made me think about ordering again, which seems to be
_super_ sensitive in KVM :)

The next patch in the series (15) makes PMSVer depend on the SPE instance having
been assigned via KVM_ARM_VCPU_SPE_ID.

But you can still KVM_RUN before KVM_ARM_VCPU_SPE_INIT, which means this will
return -EINVAL:

int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
{
	...
	if (!kvm_vcpu_spe_initialized(vcpu))
		return -EINVAL;
	...
}

And this is quite far down the function:

int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
{
	struct kvm *kvm = vcpu->kvm;
	int ret;

	if (!kvm_vcpu_initialized(vcpu))
		return -ENOEXEC;

	if (!kvm_arm_vcpu_is_finalized(vcpu))
		return -EPERM;

	if (likely(vcpu_has_run_once(vcpu)))
		return 0;

	...

	ret = kvm_vcpu_finalize_sys_regs(vcpu);
	if (ret)
		return ret;

	...

	/*
	 * This needs to happen after any restriction has been applied
	 * to the feature set.
	 */
	kvm_calculate_traps(vcpu);

	...

	if (vcpu_has_spe(vcpu)) {
		ret = kvm_spe_vcpu_first_run_init(vcpu);
		if (ret)
			return ret;
	}

	...
}

patch 18 made me think of this as kvm_calculate_traps() does the FGU
initialisation (which derives from SPE state), and once done sets
KVM_ARCH_FLAG_FGU_INITIALIZED, meaning this state is incorrectly setup.

This is a real problem as HAS_RAN_ONCE isn't set on that failed path,
userland can finish the SPE setup, set KVM_ARCH_FLAG_FGU_INITIALIZED, and
that state is never recomputed.

Also kvm_vcpu_finalize_sys_regs() calls kvm_spe_finalize_idregs() (via
kvm_vm_finalize_sys_regs()) which writes PMSVer in the first place.

So it seems you should put this check _before_ these, e.g.:

int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
{
	struct kvm *kvm = vcpu->kvm;
	int ret;

	if (!kvm_vcpu_initialized(vcpu))
		return -ENOEXEC;

	if (!kvm_arm_vcpu_is_finalized(vcpu))
		return -EPERM;

	if (likely(vcpu_has_run_once(vcpu)))
		return 0;

	...

>>>>
	if (vcpu_has_spe(vcpu)) {
		ret = kvm_spe_vcpu_first_run_init(vcpu);
		if (ret)
			return ret;
	}
>>>

	ret = kvm_vcpu_finalize_sys_regs(vcpu);
	if (ret)
		return ret;

	...

	/*
	 * This needs to happen after any restriction has been applied
	 * to the feature set.
	 */
	kvm_calculate_traps(vcpu);

	...

}

--
Cheers, Lorenzo

