Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E749C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PC6bhLH8pGxTE/uEaaqQi6ZuN4ikBV/SxSG1FBisfbk=; b=z7PAgvi/pr788glXV4TuEQ/n4w
	iwjCyTAv7IDzUvzcbgrHrF4vzfBynJygEjYdgr2bX9h3nSWuBAzAJt53SICUzJDqKIKufmniccwHj
	TgbGMfFyOjnRkNJxDyJWyTkgFYw4SoS5ENCVxjEF7Vccw1p6wFYumHiqPzck2Z20RLwz/yd7I9H9T
	sKtW6v+cNqWIxn+AWXtEHYYbHVgBZwxd3HyWKaUQOxOe0agmFOQLJuF0ARmh7Ihv8ggQnroCvLlfI
	ct+HmGxLfmYaXAQUGhXuPFsZBAj141TTBOO2VHHSeDcFrXR+9OC5CIGcoA6cOyEdSgvNhhHJxxSZU
	N4iBY+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZA-00000004EyO-17DE;
	Tue, 24 Jun 2025 00:31:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThr7-00000002z3f-192b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CE325C4B00;
	Mon, 23 Jun 2025 14:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9D1C4CEEA;
	Mon, 23 Jun 2025 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750687744;
	bh=sIqaqHwoR/cVtxIhgcxx2ZVcUkiubyrehXo3GcWtKOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHdsPhymHpCpP1L1rpiiuVh9anWKDbUGp+dOsOPmO4OQHE+kU+Zi18fE4bLaexYrK
	 gUoN90qEMebw6mZqVEPlvabq2eThh8jpVLRCedMrM9eSnmX3GOFuVtEOseL+YdN3wn
	 X8qzapUuQcmNdjX6GIaf4OcqNHI+q8NPq1HMYd9eexsJ6bIMOSDISjUzkr6ThA2YxS
	 ISPmeyDa0Yn46UlCpcxQuo8fPxQ1748dOTKvenwn7VFifTenNUleH0JxjjCZ6KgFWh
	 1JCXZsmFMs7pcYZDFQqjcAOKf3JPAOwPWPTW1qjaoHn3i8f4SdJWqCkjKdFaxTYuQu
	 SKrtpjjYZZkKA==
Date: Mon, 23 Jun 2025 19:35:32 +0530
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
Subject: Re: [PATCH v3 18/62] KVM: SVM: Disable (x2)AVIC IPI virtualization
 if CPU has erratum #1235
Message-ID: <jskiyda3defofthrtniugcdbcoftx4o5yvgt47koswq64qf7d7@2pzrr5v5yssy>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-20-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611224604.313496-20-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_070905_391726_DE9AA932 
X-CRM114-Status: GOOD (  23.98  )
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

On Wed, Jun 11, 2025 at 03:45:21PM -0700, Sean Christopherson wrote:
> From: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Disable IPI virtualization on AMD Family 17h CPUs (Zen2 and Zen1), as
> hardware doesn't reliably detect changes to the 'IsRunning' bit during ICR
> write emulation, and might fail to VM-Exit on the sending vCPU, if
> IsRunning was recently cleared.
> 
> The absence of the VM-Exit leads to KVM not waking (or triggering nested
> VM-Exit) of the target vCPU(s) of the IPI, which can lead to hung vCPUs,
  ^^^^^^^^^^^
  VM-Exit of)

> unbounded delays in L2 execution, etc.
> 
> To workaround the erratum, simply disable IPI virtualization, which
> prevents KVM from setting IsRunning and thus eliminates the race where
> hardware sees a stale IsRunning=1.  As a result, all ICR writes (except
> when "Self" shorthand is used) will VM-Exit and therefore be correctly
> emulated by KVM.
> 
> Disabling IPI virtualization does carry a performance penalty, but
> benchmarkng shows that enabling AVIC without IPI virtualization is still
> much better than not using AVIC at all, because AVIC still accelerates
> posted interrupts and the receiving end of the IPIs.
> 
> Note, when virtualizaing Self-IPIs, the CPU skips reading the physical ID
	     ^^^^^^^^^^^^^
	     virtualizing

> table and updates the vIRR directly (because the vCPU is by definition
> actively running), i.e. Self-IPI isn't susceptible to the erratum *and*
> is still accelerated by hardware.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [sean: rebase, massage changelog, disallow user override]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 48c737e1200a..bf8b59556373 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -1187,6 +1187,14 @@ bool avic_hardware_setup(void)
>  	if (x2avic_enabled)
>  		pr_info("x2AVIC enabled\n");
>  
> +	/*
> +	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
> +	 * due to erratum 1235, which results in missed GA log events and thus
							^^^^^^^^^^^^^
Not sure I understand the reference to GA log events here -- those are 
only for device interrupts and not IPIs.

> +	 * missed wake events for blocking vCPUs due to the CPU failing to see
> +	 * a software update to clear IsRunning.
> +	 */
> +	enable_ipiv = enable_ipiv && boot_cpu_data.x86 != 0x17;
> +

Apart from the above, this LGTM.
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen


