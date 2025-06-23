Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C5AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOkpzMlhlXRiMCNdOIvauV/qFub0T/UowmpNSsYnBL4=; b=b0VAXD+J4L/lCyn8ag+cQDW9GZ
	rfUADc/3frh6M8y+PobOFDk0ohwBPHp04kt+vuL9R/nwKfwOYVwEZzJo9MchfJoedV+uZ/8mxZNSh
	ZtcvMv0ZJ+KY5eAlgcV+vwVSqR4ZfrLOQ6v9k21D9aK+pVH/T/V0GMwU4Sl/wRCZbjF8mHn87VxGe
	bEv+UWnfLzbchtQnjlWWWerzNun41Vzwr0pysECj3jKnDacLuJyIm/2XtV312YZRMhOKOM18Q+ku/
	Gozu+59NukwlQHppTNtjQmJ09R7m9dCW0/O0cDP3LJyCa6ihZvaHfheZpXBl7JVnVj1prdTgQXzQv
	SAgJOFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToVp-00000003zR5-3E8j;
	Mon, 23 Jun 2025 21:15:33 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjse-00000003OK0-2Gyh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:18:50 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2eeff19115so5592110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750695527; x=1751300327; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOkpzMlhlXRiMCNdOIvauV/qFub0T/UowmpNSsYnBL4=;
        b=OhdNQOAnhaqsKO8k4chzzAe50kzIEWOaiX04vgxG2/vatIblZA4ZWGNuReAEpflHeC
         B1V9SiEohEjpSBJDoBRRfzTizNIxUj1k2Qw0K2TulL0JhBj+hgQTMC5gRs9u2OKvcMsY
         nKH5tx4y1V1O/IJ7j4DNR2OWKgjRrgttQDJXMONUB2yC4kuVB9l9DSuwKyEFQqkwK9aT
         06hSaEKwkbR3ZML+sZTVjLmqcAr198fkwqzk1n/8U6codS2W5fljK2IeLzTYxtP7tuLe
         M+1PXi18tbcdiPHiazJ9t5R5n7wTz/pR2M1ojEgukz6KJLL1aLaHLEtCDy9HnmFBXfpj
         OSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695527; x=1751300327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOkpzMlhlXRiMCNdOIvauV/qFub0T/UowmpNSsYnBL4=;
        b=Vz7aGatQDQWSSfRqJocOPoQJe3Hti1Zw6Cmc+lUJ57bd3PZhEhEs1LB7MJwleXdOre
         T0HhNiX8p7HbzAe0LNIEKLp7Jnl6OvKlTgEPDx14vyFo3SIDmP4dEMtjWCC+6pIcCt1U
         RyZTnd+NTnMlUsBgNc8XdgNGQmLseC7rkpbxJJjNwMkQyJ32F10z8+c0/Ckact3yzU5l
         DIDChuBga6E3U+NmONa/pxjaP64ypxh5//zQ/LP04oaqdYFyuGEwbCIVZJaGlTeheQbR
         EPa2AExWm1aoslIkAglDFL2pjaFBDDVcY16JwhIaAaMckxToayHlChkptg2v9+1aJA2M
         rUng==
X-Forwarded-Encrypted: i=1; AJvYcCUlUkFFoqqutKxWLFza3oQ5LFHSOrwLnHQKuY+0W70hD2NQqDaD1UTAx6KJ0DNpLKhrRHsYxolaX5QQKj2dRquo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg8LxCCd4IxQG5WrIPs1i1DoM/OTlHcFJFLX3srheXyXXlNLCk
	zrgzf0b46JpjW8jsnejtFgf/o1XVKWZWe/ht6704cJQQI+n3clY96G9MZELtnlmkQgSyKzdCxjs
	Zpg/EhQ==
X-Google-Smtp-Source: AGHT+IENQipggL2SOcRyFklB3/6faa8uHHLu36CbWgSZEypv6kRSEUBRnwpSzpoNeCEIYgBhsThVyFLxqUA=
X-Received: from pfug19.prod.google.com ([2002:a05:6a00:793:b0:749:8f7:e14e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c992:b0:21f:5c9d:498e
 with SMTP id adf61e73a8af0-22026d32fe2mr19839452637.7.1750695527173; Mon, 23
 Jun 2025 09:18:47 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:18:45 -0700
In-Reply-To: <pxtvegopzsyhn7lelksclxiiee7tumppu76553rax7octqpy7i@giclgo667htf>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-22-seanjc@google.com>
 <pxtvegopzsyhn7lelksclxiiee7tumppu76553rax7octqpy7i@giclgo667htf>
Message-ID: <aFl-ZYyf9guxSkHE@google.com>
Subject: Re: [PATCH v3 20/62] KVM: SVM: Add a comment to explain why
 avic_vcpu_blocking() ignores IRQ blocking
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_091848_616923_15299E26 
X-CRM114-Status: GOOD (  33.40  )
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

On Mon, Jun 23, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:23PM -0700, Sean Christopherson wrote:
> > Add a comment to explain why KVM clears IsRunning when putting a vCPU,
> > even though leaving IsRunning=1 would be ok from a functional perspective.
> > Per Maxim's experiments, a misbehaving VM could spam the AVIC doorbell so
> > fast as to induce a 50%+ loss in performance.
> > 
> > Link: https://lore.kernel.org/all/8d7e0d0391df4efc7cb28557297eb2ec9904f1e5.camel@redhat.com
> > Cc: Maxim Levitsky <mlevitsk@redhat.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/svm/avic.c | 31 ++++++++++++++++++-------------
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index bf8b59556373..3cf929ac117f 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -1121,19 +1121,24 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
> >  	if (!kvm_vcpu_apicv_active(vcpu))
> >  		return;
> >  
> > -       /*
> > -        * Unload the AVIC when the vCPU is about to block, _before_
> > -        * the vCPU actually blocks.
> > -        *
> > -        * Any IRQs that arrive before IsRunning=0 will not cause an
> > -        * incomplete IPI vmexit on the source, therefore vIRR will also
> > -        * be checked by kvm_vcpu_check_block() before blocking.  The
> > -        * memory barrier implicit in set_current_state orders writing
> > -        * IsRunning=0 before reading the vIRR.  The processor needs a
> > -        * matching memory barrier on interrupt delivery between writing
> > -        * IRR and reading IsRunning; the lack of this barrier might be
> > -        * the cause of errata #1235).
> > -        */
> > +	/*
> > +	 * Unload the AVIC when the vCPU is about to block, _before_ the vCPU
> > +	 * actually blocks.
> > +	 *
> > +	 * Note, any IRQs that arrive before IsRunning=0 will not cause an
> > +	 * incomplete IPI vmexit on the source; kvm_vcpu_check_block() handles
> > +	 * this by checking vIRR one last time before blocking.  The memory
> > +	 * barrier implicit in set_current_state orders writing IsRunning=0
> > +	 * before reading the vIRR.  The processor needs a matching memory
> > +	 * barrier on interrupt delivery between writing IRR and reading
> > +	 * IsRunning; the lack of this barrier might be the cause of errata #1235).
> > +	 *
> > +	 * Clear IsRunning=0 even if guest IRQs are disabled, i.e. even if KVM
> > +	 * doesn't need to detect events for scheduling purposes.  The doorbell
> 
> Nit: just IsRunning (you can drop the =0 part).

Hmm, not really.  It could be:

	/* Note, any IRQs that arrive while IsRunning is set will not cause an

or

	/* Note, any IRQs that arrive while IsRunning=1 will not cause an

but that's just regurgitating the spec.  The slightly more interesting scenario
that's being described here is what will happen if an IRQ arrives _just_ before
the below code toggle IsRunning from 1 => 0.

> Trying to understand the significance of IRQs being disabled here. Is 
> that a path KVM tries to optimize?

Yep.  KVM doesn't need a notification for the undelivered (virtual) IRQ, because
it won't be handled by the vCPU until the vCPU enables IRQs, and thus it's not a
valid wake event for the vCPU.

So, *if* spurious doorbells didn't affect performance or functionality, then
ideally KVM would leave IsRunning=1, e.g. so that the IOMMU doesn't need to
generate GA log events, and so that other vCPUs aren't forced to VM-Exit when
sending an IPI.  Unfortunately, spurious doorbells are quite intrusive, and so
KVM "needs" to clear IsRunning.

> Theoretically, it looks like we want to clear IsRunning regardless of whether
> the vCPU is blocked so as to prevent the guest from spamming the host with
> AVIC doorbells -- compared to always keeping IsRunning set so as to speed up
> VM entry/exit.

Yep, exactly.

> > +	 * used to signal running vCPUs cannot be blocked, i.e. will perturb the
> > +	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
> > +	 * to the vCPU while it's scheduled out.
> > +	 */
> >  	avic_vcpu_put(vcpu);
> >  }
> 
> Otherwise, this LGTM.
> Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
> 
> 
> Thanks,
> Naveen
> 

