Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB22CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 05:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBJJqTsK6OR0NVSYEEqLg25vZSFAVXL/THfeZ/uRZK8=; b=tqIv8iw0SYuvrYb23bO/438nkD
	JcGQnmGYbgv6P6PjqmTk4j3kmw7dsCY0PEwGFrAwoVkV/+WBwsAVfKi/vpDdGqEwWbaL64u4q4oJg
	UnIpyoxusWKa+BnoEw15HsmjbIOjYFdFG4OWB7s9vw4i3XNBV7DCpgjRnueBfbpmEPdjCk2fbCFdx
	X9F0T0TVhewoceGh03Rbx5+OeOgNPMVmuS3LdKjM7vQUvtYISht56oNAXS4nrFWVSux5VZviP6RJ8
	p69DExm7c2HnBhyudjA3+XT6XdSA9OeL23mK9nFWA28+U6UkFOaYKjnsqGGQaBG9vSTavEftuKwF1
	UlM0qsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHSs-00000009EWJ-0tBD;
	Thu, 17 Jul 2025 05:47:30 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHQQ-00000009EPl-2ymZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 05:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752731092; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=kBJJqTsK6OR0NVSYEEqLg25vZSFAVXL/THfeZ/uRZK8=;
	b=LvIRZZwbEJb4MCgWZQpLTnWQeV0fBIzUqX8zdu1BmId485IQ2pDGknVC2LLpRFs2BaxLp4V4XirjL6/H77JGRo9R/tWHMWQtuVfpm10MJfEMcqd9gRXaK6+WmOG7LFpgaTgrBRTyIGJeK3QU4M5Im85xMV1EECPX5NG1Itl4mR0=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wj6rlc._1752731088 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 17 Jul 2025 13:44:49 +0800
Date: Thu, 17 Jul 2025 13:44:48 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716110737.2513665-3-keirf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_224459_225758_B291AD7F 
X-CRM114-Status: GOOD (  15.63  )
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

On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> In preparation to remove synchronize_srcu() from MMIO registration,
> remove the distributor's dependency on this implicit barrier by
> direct acquire-release synchronization on the flag write and its
> lock-free check.
>
> Signed-off-by: Keir Fraser <keirf@google.com>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index 502b65049703..bc83672e461b 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
>  	gpa_t dist_base;
>  	int ret = 0;
>
> -	if (likely(dist->ready))
> +	if (likely(smp_load_acquire(&dist->ready)))
>  		return 0;
>
>  	mutex_lock(&kvm->slots_lock);
> @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
>  		goto out_slots;
>  	}
>
> -	/*
> -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> -	 * registration before returning through synchronize_srcu(), which also
> -	 * implies a full memory barrier. As such, marking the distributor as
> -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> -	 * a completely configured distributor.
> -	 */
> -	dist->ready = true;
> +	smp_store_release(&dist->ready, true);

No need the store-release and load-acquire for replacing
synchronize_srcu_expedited() w/ call_srcu() IIUC:

Tree SRCU on SMP:
call_srcu()
 __call_srcu()
  srcu_gp_start_if_needed()
    __srcu_read_unlock_nmisafe()
	 #ifdef	CONFIG_NEED_SRCU_NMI_SAFE
	   	  smp_mb__before_atomic() // __smp_mb() on ARM64, do nothing on x86.
	 #else
          __srcu_read_unlock()
		   smp_mb()
	 #endif

TINY SRCY on UP:
Should have no memory ordering issue on UP.

>  	goto out_slots;
>  out:
>  	mutex_unlock(&kvm->arch.config_lock);
> --
> 2.50.0.727.gbf7dc18ff4-goog
>

