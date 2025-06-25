Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D20C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6YCRkZ7c71yqaNVRPRY9md/LoMAC76FaEwt8H/+H/w=; b=FibGpGqI/jIqyGgKRLgVj2Kj6f
	9F4zjkdBsCdzZ/3L64g8nk/9AvdgoTmMZrYAbjVRRgzO6JqqHpzSi+ewTNLbusjVRE9VjNBToXlNi
	MhZv9im0aIWHcKVdsdK2baApiQz0l8CMvt6n8Bnrt0bSSOkE7r3zj5D9352m2filBhUeNdz0JTf8S
	VG0KxHihiXbUpILYI9yXRpJHSAbfbc2jWJTTWPMK8F6iUpNC5vGejNz0aij+oRqlosqn7E9rzfunf
	uX+l9h3kPg6Uacdee4nk4Nskq9ftlL15qcT4kxkH0yH2TgN6Do08RLOnIGAvhW2M0Cu9ubPY6pTje
	4CEAStcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW70-00000009meu-2PgM;
	Wed, 25 Jun 2025 19:48:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSCX-000000098z0-3TnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AF9AA523A0;
	Wed, 25 Jun 2025 15:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CC2C4CEEA;
	Wed, 25 Jun 2025 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750865895;
	bh=DdxS8fK+k+4jJXT/e+VE5Z7hLWA+bNaknSmckFwX8wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv2z/It31S17vagV0qD/YG5Cs2xuaGCisG/MbnWq93zzaUaUrXfiITmuJmPyJHwj2
	 nuYNJ9rGhpx/rmwcVlVvK8JVPDARGPgUOiSjlIwptVSwOUXYz20nLXVgoGzjl4GnvY
	 LPtfY5IWEoNiJ/TJy+BqTqea3mtmXtFONVvBzy5/xqT4jDN2G40iQOremK7E9wCqTi
	 DBbEfJsTzL8nVPUCssNUtOU8I2AXv63MDwg9llG0CBQd5uCbM7k5iAmGPdjPLhACi3
	 r9Pk4sC1SWmvJqzefP6200Jp81E1uqxJnpuzPsYH+VL/KdRMihIBWKc8gyvuQ25wFq
	 alh8oPqaYSR9w==
Date: Wed, 25 Jun 2025 20:58:16 +0530
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
Message-ID: <ha3rq3ybk4c63bov2ix6yyajggep6zdulsd2e44vqw4ctufeiq@env4pl5m3wz6>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-22-seanjc@google.com>
 <pxtvegopzsyhn7lelksclxiiee7tumppu76553rax7octqpy7i@giclgo667htf>
 <aFl-ZYyf9guxSkHE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFl-ZYyf9guxSkHE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_083817_997469_0D1B176E 
X-CRM114-Status: GOOD (  32.56  )
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

On Mon, Jun 23, 2025 at 09:18:45AM -0700, Sean Christopherson wrote:
> On Mon, Jun 23, 2025, Naveen N Rao wrote:
> > On Wed, Jun 11, 2025 at 03:45:23PM -0700, Sean Christopherson wrote:
> > > Add a comment to explain why KVM clears IsRunning when putting a vCPU,
> > > even though leaving IsRunning=1 would be ok from a functional perspective.
> > > Per Maxim's experiments, a misbehaving VM could spam the AVIC doorbell so
> > > fast as to induce a 50%+ loss in performance.
> > > 
> > > Link: https://lore.kernel.org/all/8d7e0d0391df4efc7cb28557297eb2ec9904f1e5.camel@redhat.com
> > > Cc: Maxim Levitsky <mlevitsk@redhat.com>
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/svm/avic.c | 31 ++++++++++++++++++-------------
> > >  1 file changed, 18 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > > index bf8b59556373..3cf929ac117f 100644
> > > --- a/arch/x86/kvm/svm/avic.c
> > > +++ b/arch/x86/kvm/svm/avic.c
> > > @@ -1121,19 +1121,24 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
> > >  	if (!kvm_vcpu_apicv_active(vcpu))
> > >  		return;
> > >  
> > > -       /*
> > > -        * Unload the AVIC when the vCPU is about to block, _before_
> > > -        * the vCPU actually blocks.
> > > -        *
> > > -        * Any IRQs that arrive before IsRunning=0 will not cause an
> > > -        * incomplete IPI vmexit on the source, therefore vIRR will also
> > > -        * be checked by kvm_vcpu_check_block() before blocking.  The
> > > -        * memory barrier implicit in set_current_state orders writing
> > > -        * IsRunning=0 before reading the vIRR.  The processor needs a
> > > -        * matching memory barrier on interrupt delivery between writing
> > > -        * IRR and reading IsRunning; the lack of this barrier might be
> > > -        * the cause of errata #1235).
> > > -        */
> > > +	/*
> > > +	 * Unload the AVIC when the vCPU is about to block, _before_ the vCPU
> > > +	 * actually blocks.
> > > +	 *
> > > +	 * Note, any IRQs that arrive before IsRunning=0 will not cause an
> > > +	 * incomplete IPI vmexit on the source; kvm_vcpu_check_block() handles
> > > +	 * this by checking vIRR one last time before blocking.  The memory
> > > +	 * barrier implicit in set_current_state orders writing IsRunning=0
> > > +	 * before reading the vIRR.  The processor needs a matching memory
> > > +	 * barrier on interrupt delivery between writing IRR and reading
> > > +	 * IsRunning; the lack of this barrier might be the cause of errata #1235).
> > > +	 *
> > > +	 * Clear IsRunning=0 even if guest IRQs are disabled, i.e. even if KVM
> > > +	 * doesn't need to detect events for scheduling purposes.  The doorbell
> > 
> > Nit: just IsRunning (you can drop the =0 part).
> 
> Hmm, not really.  It could be:
> 
> 	/* Note, any IRQs that arrive while IsRunning is set will not cause an
> 
> or
> 
> 	/* Note, any IRQs that arrive while IsRunning=1 will not cause an
> 
> but that's just regurgitating the spec.  The slightly more interesting scenario
> that's being described here is what will happen if an IRQ arrives _just_ before
> the below code toggle IsRunning from 1 => 0.

Oh, you're right. I was referring to the last paragraph starting with 
"Clear IsRunning=0 even if", which to me feels like a double negation. 
It reads better if it is "Clear IsRunning even if ..."

> 
> > Trying to understand the significance of IRQs being disabled here. Is 
> > that a path KVM tries to optimize?
> 
> Yep.  KVM doesn't need a notification for the undelivered (virtual) IRQ, because
> it won't be handled by the vCPU until the vCPU enables IRQs, and thus it's not a
> valid wake event for the vCPU.
> 
> So, *if* spurious doorbells didn't affect performance or functionality, then
> ideally KVM would leave IsRunning=1, e.g. so that the IOMMU doesn't need to
> generate GA log events, and so that other vCPUs aren't forced to VM-Exit when
> sending an IPI.  Unfortunately, spurious doorbells are quite intrusive, and so
> KVM "needs" to clear IsRunning.

Ok, got that. kvm_arch_vcpu_blocking() looks like it exists precisely 
for this reason.

Thanks,
Naveen


