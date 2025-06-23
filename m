Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C18C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z46EB7tAB6uXHPgyBwtVJdsA76sFg0lSYdtu6EVWknE=; b=PIwPUdxSI5IbwicMRR4jNn+m5M
	oTWINCNCuB82g+gXxRYkA46v6PQUcYAb2SNRPJ9Fu5zWBVS3lmFuBV8AluuXnWLpQy7wQvnbMi35y
	hqZ5f4XfivPW1p43Qh0bXEfG2CFedn4lhkSWkjNUkpBwhhVotROFFDwMkSaLxnNV/tYG4DeP9/1Iu
	pdQo3PjRPHO7/4xVFZ6IzsR7Ja7BlPaLrEjKQWP4xMQrRD+sfzJxNJceiBi1VokHrD7+DA7TK1fxh
	8XUxwBcL0DaHnkz+gwnxQIDANBygsq5u9oXBW3muArJt052W5iyasIgR6qcdsiGkZnN55nQN1xL7S
	9/EksS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToI4-00000003yEC-1Zrp;
	Mon, 23 Jun 2025 21:01:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjZ8-00000003KYa-12at
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F90F5C5F8B;
	Mon, 23 Jun 2025 15:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81277C4CEEA;
	Mon, 23 Jun 2025 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694317;
	bh=MBmtOH9m6zr81wji+yIuMSpqTbR3C3+WuqdmMBu0WVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/hdkmmf37JuuBRRIQqHxENDG6LmCaTmsJp2DHu7KCr0mZRs4pMvtzIzwaJWRy3Xa
	 4fYQWPNVfpITMNEkZLGMafBo6GVgCwxjW8sW0YsiqKG/unwlNXMPR4GpPrZy6AwCzZ
	 vvAWz50fwIGN7BHS5wK8ouR+ISNxq8yd16oS8fYckmhD5hAvz0hvTy7muPjfc4kxbg
	 QyicczYhD/4fzwCShSSpTX4eWkVEvInZKE5MBwmC2xDCqWQUWSqTN5dHU18wYrSTHG
	 QLZyUBoHa9ZkMEWNMJZV0ebpOq8Q6Z89vV3uYkr98l4tGodaCeAaa0iiLEfybrQRRd
	 1nRuvP660Ry6w==
Date: Mon, 23 Jun 2025 21:24:37 +0530
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
Subject: Re: [PATCH v3 20/62] KVM: SVM: Add a comment to explain why
 avic_vcpu_blocking() ignores IRQ blocking
Message-ID: <pxtvegopzsyhn7lelksclxiiee7tumppu76553rax7octqpy7i@giclgo667htf>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-22-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-22-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_085838_372469_E2901FFD 
X-CRM114-Status: GOOD (  25.89  )
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

On Wed, Jun 11, 2025 at 03:45:23PM -0700, Sean Christopherson wrote:
> Add a comment to explain why KVM clears IsRunning when putting a vCPU,
> even though leaving IsRunning=1 would be ok from a functional perspective.
> Per Maxim's experiments, a misbehaving VM could spam the AVIC doorbell so
> fast as to induce a 50%+ loss in performance.
> 
> Link: https://lore.kernel.org/all/8d7e0d0391df4efc7cb28557297eb2ec9904f1e5.camel@redhat.com
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index bf8b59556373..3cf929ac117f 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -1121,19 +1121,24 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
>  	if (!kvm_vcpu_apicv_active(vcpu))
>  		return;
>  
> -       /*
> -        * Unload the AVIC when the vCPU is about to block, _before_
> -        * the vCPU actually blocks.
> -        *
> -        * Any IRQs that arrive before IsRunning=0 will not cause an
> -        * incomplete IPI vmexit on the source, therefore vIRR will also
> -        * be checked by kvm_vcpu_check_block() before blocking.  The
> -        * memory barrier implicit in set_current_state orders writing
> -        * IsRunning=0 before reading the vIRR.  The processor needs a
> -        * matching memory barrier on interrupt delivery between writing
> -        * IRR and reading IsRunning; the lack of this barrier might be
> -        * the cause of errata #1235).
> -        */
> +	/*
> +	 * Unload the AVIC when the vCPU is about to block, _before_ the vCPU
> +	 * actually blocks.
> +	 *
> +	 * Note, any IRQs that arrive before IsRunning=0 will not cause an
> +	 * incomplete IPI vmexit on the source; kvm_vcpu_check_block() handles
> +	 * this by checking vIRR one last time before blocking.  The memory
> +	 * barrier implicit in set_current_state orders writing IsRunning=0
> +	 * before reading the vIRR.  The processor needs a matching memory
> +	 * barrier on interrupt delivery between writing IRR and reading
> +	 * IsRunning; the lack of this barrier might be the cause of errata #1235).
> +	 *
> +	 * Clear IsRunning=0 even if guest IRQs are disabled, i.e. even if KVM
> +	 * doesn't need to detect events for scheduling purposes.  The doorbell

Nit: just IsRunning (you can drop the =0 part).

Trying to understand the significance of IRQs being disabled here. Is 
that a path KVM tries to optimize? Theoretically, it looks like we want 
to clear IsRunning regardless of whether the vCPU is blocked so as to 
prevent the guest from spamming the host with AVIC doorbells -- compared 
to always keeping IsRunning set so as to speed up VM entry/exit.

> +	 * used to signal running vCPUs cannot be blocked, i.e. will perturb the
> +	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
> +	 * to the vCPU while it's scheduled out.
> +	 */
>  	avic_vcpu_put(vcpu);
>  }

Otherwise, this LGTM.
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


Thanks,
Naveen


