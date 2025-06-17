Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B4C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DB4r4vbaZoIdN72R7Ts9HATakBZk9JghjOMQJQbnr/I=; b=Kz7I4SfK1G/Yz63m8otW3PiveJ
	C4wnHxcSIjvbmb8+rlwPc6ii+ZcYO1Nj2VuFlrK8RWUNWp0a2eUpjEOJfmaNiqtEzNLdPe8i4HORX
	qU+pFGy51ltVj+Z5OCzCxfOb50I3T5+n5PUov1ZMQjqV6c1XKpUucSvYpn+eDZjmh6OyXR7Y+0npn
	3m0pOmhsF2zWcw/NVRDGY+RtRDJ4VALPEZ+2xxPm5oWC/gpnn+Kae/wpet9fVRI0WGZpv5Hjurnl9
	vSyUWEXyf284u1Whe2MNzQKgeVUuVWxYXwuZOwc6pVLXYjQjvpQdtGjPcHA+j8neuKQuffqMtpSNF
	TbzYVAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZql-00000007zFB-2d1z;
	Tue, 17 Jun 2025 17:11:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYZo-00000007nJ5-2Ndc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 15:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B52C6A51050;
	Tue, 17 Jun 2025 15:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B85CC4CEE3;
	Tue, 17 Jun 2025 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175419;
	bh=LNC2w8LSdPeWSFo7aYqjVJu6bohSIps4pbr6GI4K0BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8ybcfpxWV2OtWW99thzTjWTfLwKsYYyaqcTvP7aHzalyqXMXPorjLvVi6xHimaHF
	 eJsTaSqfWINmIeb2EWU2+/1+1jmxVvUKxnQVRhZUALS1HDkfjHe1OCSVKeKD6cMpT1
	 jD8uwP4U1MtAJpojwUNjP8SJAr9bp+FteCTVASwSS77HmIqjK1cEtysYmef1wfU7Um
	 EURHWiaOCN3HV7rbcHdsJDcgHHmGnmyc9SHUZ/5P92AhI2AZ2xt4gPLhtJUX1WHsCu
	 TGiAuinoczfD8wisKatLD5XmFhJtiY/HaD0eXCqDoVmrX4+TYH5y5xXYeQNZ+BGEeO
	 3mSt/BnDa6lwA==
Date: Tue, 17 Jun 2025 21:12:58 +0530
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
Subject: Re: [PATCH v3 38/62] KVM: SVM: Take and hold ir_list_lock across
 IRTE updates in IOMMU
Message-ID: <qhvns5twcxwzrz2fhp7njmyqb5x5icgiz4iszwvwmeoxhw7ycv@3we3xqqaqeib>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-40-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-40-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_085020_742166_DF70444F 
X-CRM114-Status: GOOD (  19.04  )
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

On Wed, Jun 11, 2025 at 03:45:41PM -0700, Sean Christopherson wrote:
> Now that svm_ir_list_add() isn't overloaded with all manner of weird
> things, fold it into avic_pi_update_irte(), and more importantly take
> ir_list_lock across the irq_set_vcpu_affinity() calls to ensure the info
> that's shoved into the IRTE is fresh.  While preemption (and IRQs) is
> disabled on the task performing the IRTE update, thanks to irqfds.lock,
> that task doesn't hold the vCPU's mutex, i.e. preemption being disabled
> is irrelevant.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 55 +++++++++++++++++------------------------
>  1 file changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index f1e9f0dd43e8..4747fb09aca4 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -769,32 +769,6 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
>  	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
>  }
>  
> -static void svm_ir_list_add(struct vcpu_svm *svm,
> -			    struct kvm_kernel_irqfd *irqfd,
> -			    struct amd_iommu_pi_data *pi)
> -{
> -	unsigned long flags;
> -	u64 entry;
> -
> -	irqfd->irq_bypass_data = pi->ir_data;
> -
> -	spin_lock_irqsave(&svm->ir_list_lock, flags);
> -
> -	/*
> -	 * Update the target pCPU for IOMMU doorbells if the vCPU is running.
> -	 * If the vCPU is NOT running, i.e. is blocking or scheduled out, KVM
> -	 * will update the pCPU info when the vCPU awkened and/or scheduled in.
> -	 * See also avic_vcpu_load().
> -	 */
> -	entry = svm->avic_physical_id_entry;
> -	if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
> -		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
> -				    true, pi->ir_data);
> -
> -	list_add(&irqfd->vcpu_list, &svm->ir_list);
> -	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
> -}
> -

There are a few comments in avic_vcpu_load() and avic_vcpu_put() which 
still refer to svm_ir_list_add(). Would be good to update those.

- Naveen


