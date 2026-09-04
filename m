Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB09DC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVzSSbg8XaitZU0IkO8eE2sTOp/ww7mlfLdDvjSnX2s=; b=HVCMJ1KRTV97ZFvnPeivrrgeXq
	4TAPGmvN8g0wkz7Wm7v98Svys9Qe7Vg0ap7mY8L886N0N/ovWYTYd3iQKHDlZZREQ2s+ybneLvCfo
	UCSqWZZUdrknbvUilNa76+i9xh0p2zgzDvG3Oq5qeldbxXN6QOrm9CL3KxgPen3sGSTovb+vBwxde
	vBI0UEzit/zPReWJvithJVrn4XIcsfD0024qdUSwbtN5LEMQuiwrEVR1tRB/raBJ92ePVZnSYxxaY
	BhtyPbIIz1CePFnEgB5Xek9UIWlOBWT1OKYRlFoAMJ8UfSnyqNb6Q568uN2/R3784hTJqdycV2Hss
	o59pkpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sqd-000000020In-0tyR;
	Fri, 04 Sep 2026 12:16:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Sqc-000000020IT-16QB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:16:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7648A600C8;
	Fri,  4 Sep 2026 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0B61F00A3E;
	Fri,  4 Sep 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788524205;
	bh=CVzSSbg8XaitZU0IkO8eE2sTOp/ww7mlfLdDvjSnX2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mu+FEditeFfFWeBQsjsOVdiyitKk6CkH6ibVFyfuaecAV4bM4QIW02DQV3LDNYkdB
	 DYqIG+n415agvw+nw4fukOIh+OkXSoGaug+j4bw25BpQigNpuS7Pp7C6xKlEUMbIEE
	 x6IsSYwP7vu6jDRi0CmIJhPs2xbLuhPXQeH+2dKjzpeogLjmJQkZtaq8HiSn5O4qdY
	 hk2TTGga7vCGp050/nBj7gqyFsjBrW1RyMzCye7S1p5KCzXDEqpo8sZP9jUgAk68Oi
	 rSPum/esWrV6+bQQ4qq0Kd7NB9fSh8LKdchZlUF4iP4hMzQIxxv9J4J/c5Is3a2tQv
	 ZBovheJJhygbQ==
Date: Fri, 4 Sep 2026 13:16:38 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
Message-ID: <apqyNz7cKC8thMfN@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-4-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-gcs-v20-4-f31750bdfadb@kernel.org>
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

On Tue, Sep 01, 2026 at 10:47:02PM +0100, Mark Brown wrote:
> In order to allow efficient implementation of GCS implementations are
> permitted to do GCS specific caching, with barriers implicit in stack
> switch operations and GCSB DSYNC as an explicit barrier.  Since we do
> not use GCS in the hypervisor or host kernel the hypervisor cannot rely
> on any barriers being present in vCPU context switches other than those
> it explicitly inserts.  Add explicit barriers when loading and saving
> vCPU state.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> ---
>  arch/arm64/kvm/arm.c               | 7 +++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8b080804bc90..52f53f682e6a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -755,6 +755,13 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)

So this seems to be where -> vCPU unscheduled so the right place to do it.

>  			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>  	}
>
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere.
> +	 */
> +	if (kvm_has_gcs(vcpu->kvm))
> +		gcsb_dsync();

Makes sense.

I did notice the curious:

static inline void gcsb_dsync(void)
{
	asm volatile(".inst 0xd503227f" : : : "memory");
}

And various sludging around suggests this is HINT #19 and guaranteed to be a nop
on arches that don't implement the feature :)

> +
>  	kvm_vcpu_put_debug(vcpu);
>  	kvm_arch_vcpu_put_fp(vcpu);
>  	if (has_vhe())
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 9a3b92e626ad..534db037c5f6 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -261,6 +261,13 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)

And here similar for pKVM.

>  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
>  	sync_debug_state(hyp_vcpu);
>
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere even if the host skips syncing.
> +	 */
> +	if (kvm_has_gcs(hyp_vcpu->vcpu.kvm))
> +		gcsb_dsync();
> +
>  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
>  	} else {
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

