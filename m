Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2E3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcDnn7sOOkOLxR4qwzDfjUxXe2RbPThH0+gsj2ptS5Q=; b=AJQ8yHLx6y7mTfTlp9w4vByUOH
	EqyJ7lsSlYcR/ibJeUTJB2q1fmqnO5lqxkevfDDw2oIvQaPJljVV/0OZthpFSjERcLkTvhW+B6Y3y
	hD3uxNcpmWy2lm8o7Klkl4Rqifdmt/mQd/k4xLFnWOIvcEyMIjJTbkJZBxFaOj73390VqQq6dgANF
	TAOMm8NFfH7RapKNZX9UtwedsFEu6ujbIatKJ8JEsikDpgOQYqaqv7LXhE4/K3AlYHPaNspry9arK
	GkVJRefag/RVatzUwJ7JuaWpURdLWCxOghT72cxTx/KHvdovZndTf2Pal08p4G/31cQniogPZhx6D
	rr9xBpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYRm-00000007l0R-3O4O;
	Tue, 17 Jun 2025 15:42:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXKN-00000007Z13-29oP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95E2F43BD1;
	Tue, 17 Jun 2025 14:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9838C4CEE7;
	Tue, 17 Jun 2025 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170618;
	bh=fr2XMAsOts3e2z91VRBihiSkUtLYOX60usFN8g0EWAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDe3FgWKdRYt+BIzMKBQF3t5wcdsgovRo8kcvLAZPRvtxyXl1IvJ1uNlEJh8U4szk
	 WfnBWWcVDZzqXI61sDtZK990vZVY38xyHXdM8ZsdmGlYrWlwx9hSAd5jzQh+JAMcXz
	 4UEuHs04KEVpn53uSj9FF9SyIfJ2TnYQ0oGXkwZw7S2c7eR/8u3FrqK1UJ/EVyn7J2
	 FFrE/9UrKWA1xYiEFfIF+1CF254i3hvfP53fi2s9JlXyyKs/yG9t+uET8HDMiY7EM9
	 lWYelt+tdc7MIPGZhMbltC42Afg6OnmSi0RmZVMPObkuYfe1NmfQf1XhBBxdk4SbUw
	 0Rrk2MzTfwCJA==
Date: Tue, 17 Jun 2025 19:55:01 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead
 of rejecting vCPU creation
Message-ID: <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-14-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-14-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_073019_591680_9B226643 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Jun 11, 2025 at 03:45:15PM -0700, Sean Christopherson wrote:
> Inhibit AVIC with a new "ID too big" flag if userspace creates a vCPU with
> an ID that is too big, but otherwise allow vCPU creation to succeed.
> Rejecting KVM_CREATE_VCPU with EINVAL violates KVM's ABI as KVM advertises
> that the max vCPU ID is 4095, but disallows creating vCPUs with IDs bigger
> than 254 (AVIC) or 511 (x2AVIC).
> 
> Alternatively, KVM could advertise an accurate value depending on which
> AVIC mode is in use, but that wouldn't really solve the underlying problem,
> e.g. would be a breaking change if KVM were to ever try and enable AVIC or
> x2AVIC by default.
> 
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  9 ++++++++-
>  arch/x86/kvm/svm/avic.c         | 14 ++++++++++++--
>  arch/x86/kvm/svm/svm.h          |  3 ++-
>  3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 2a6ef1398da7..a9b709db7c59 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1314,6 +1314,12 @@ enum kvm_apicv_inhibit {
>  	 */
>  	APICV_INHIBIT_REASON_LOGICAL_ID_ALIASED,
>  
> +	/*
> +	 * AVIC is disabled because the vCPU's APIC ID is beyond the max
> +	 * supported by AVIC/x2AVIC, i.e. the vCPU is unaddressable.
> +	 */
> +	APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG,
> +
>  	NR_APICV_INHIBIT_REASONS,
>  };
>  
> @@ -1332,7 +1338,8 @@ enum kvm_apicv_inhibit {
>  	__APICV_INHIBIT_REASON(IRQWIN),			\
>  	__APICV_INHIBIT_REASON(PIT_REINJ),		\
>  	__APICV_INHIBIT_REASON(SEV),			\
> -	__APICV_INHIBIT_REASON(LOGICAL_ID_ALIASED)
> +	__APICV_INHIBIT_REASON(LOGICAL_ID_ALIASED),	\
> +	__APICV_INHIBIT_REASON(PHYSICAL_ID_TOO_BIG)
>  
>  struct kvm_arch {
>  	unsigned long n_used_mmu_pages;
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index ab228872a19b..f0a74b102c57 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -277,9 +277,19 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
>  	int id = vcpu->vcpu_id;
>  	struct vcpu_svm *svm = to_svm(vcpu);
>  
> +	/*
> +	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
> +	 * hardware.  Immediately clear apicv_active, i.e. don't wait until the
> +	 * KVM_REQ_APICV_UPDATE request is processed on the first KVM_RUN, as
> +	 * avic_vcpu_load() expects to be called if and only if the vCPU has
> +	 * fully initialized AVIC.
> +	 */
>  	if ((!x2avic_enabled && id > AVIC_MAX_PHYSICAL_ID) ||
> -	    (id > X2AVIC_MAX_PHYSICAL_ID))
> -		return -EINVAL;
> +	    (id > X2AVIC_MAX_PHYSICAL_ID)) {
> +		kvm_set_apicv_inhibit(vcpu->kvm, APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG);
> +		vcpu->arch.apic->apicv_active = false;

This bothers me a bit. kvm_create_lapic() does this:
          if (enable_apicv) {
                  apic->apicv_active = true;
                  kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
	  }

But, setting apic->apicv_active to false here means KVM_REQ_APICV_UPDATE 
is going to be a no-op.

This does not look to be a big deal given that kvm_create_lapic() itself 
is called just a bit before svm_vcpu_create() (which calls the above 
function through avic_init_vcpu()) in kvm_arch_vcpu_create(), so there 
isn't that much done before apicv_active is toggled.

But, this made me wonder if introducing a kvm_x86_op to check and 
enable/disable apic->apicv_active in kvm_create_lapic() might be cleaner 
overall. Maybe even have it be the initialization point for APICv: 
apicv_init(), so we can invoke avic_init_vcpu() right away?


- Naveen


