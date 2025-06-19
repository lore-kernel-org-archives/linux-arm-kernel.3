Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D7C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg3qOYHipyak10iJRGmz9sDacycRCqWs6w1HL0CsQao=; b=RJybVwQuOtC8Mc+bjDjJX0iVoX
	8etciQ41hQ+dxhLMtz23R/ktJQ7tafeUbZc4CY5zBHrNkabWIxlLbOz4ynl7RTCiJL7sCUiGz9ciN
	VCBecuzr6lRROWXF1B8V7UnaWK94ijTUYJYXcEUzLRXEolsjQdCRbj/WHSAOkdyntZU2ekI6nUNyX
	ivlcgCCUzIr1zcM9Hbs2laVqQB8yPKszvxctXwxsnyaT5U9WhVRquAiIbR9c7dqPf9TRVW+tfUvMH
	yS5ehnyQvDNoBEr3kEsmHopN2xEADiMT+FAfZhD5otMZTUBN/O2RlYmsS5AnwC60ZWjgRpvbWjO1X
	pIO/gA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeY-0000000Degv-36XA;
	Thu, 19 Jun 2025 17:02:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSE13-0000000CzbI-2THE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5D666115D;
	Thu, 19 Jun 2025 12:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9235EC4CEEA;
	Thu, 19 Jun 2025 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750334712;
	bh=MunQ7b3vU7ftVz8YaGhqxMkxEggblwQtVf1vjF4zllU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1Q3A8RCpduNXFnV1EPgCHLC9lFs/gD7zgVnx+w5hK9aQCHLcxE/5v5kKlafYvKOR
	 fv11q1LKEieqxfDcNuftuxAJyk26/kCIlycJcf0bKS8u2uycArEG2sSyc6rtuwYoe3
	 pi4j2i2NqKO/EsSQs1IkvdpDAIHT7B+gtxnX+hOCoJ4P0iX82AY4Gwq5IsvNCU48/H
	 V1T287pkyxSnVzPkzrONol9U9ParA/pnUU+HRSpRVdsv8wfbYj7RR4Guf7fAnmdFOp
	 eZTEzn6COjyNsbq8c7qE6VbyhnYRbr1DispP+jA8oO2nM7/7lGuuC58AfTMN8DvxCM
	 +WMTvjs3CWfYw==
Date: Thu, 19 Jun 2025 17:31:04 +0530
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
Subject: Re: [PATCH v3 17/62] KVM: SVM: Add enable_ipiv param, never set
 IsRunning if disabled
Message-ID: <fpb6l3xwyksd7s5izmrhr4hfrkmfeavbgfatokgl5sdeh75mtx@f6gcad774zeh>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-19-seanjc@google.com>
 <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
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

On Thu, Jun 19, 2025 at 05:01:30PM +0530, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:20PM -0700, Sean Christopherson wrote:
> > @@ -1030,7 +1047,7 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
> >  	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
> >  	 * recursively.
> >  	 */
> > -	entry = READ_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id]);
> > +	entry = svm->avic_physical_id_entry;
> >  
> >  	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
> >  	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
> > @@ -1049,7 +1066,10 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
> >  	avic_update_iommu_vcpu_affinity(vcpu, -1, 0);
> >  
> >  	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
> > -	WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
> > +	svm->avic_physical_id_entry = entry;
> > +
> > +	if (enable_ipiv)
> > +		WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
> 
> If enable_ipiv is false, then isRunning bit will never be set and we 
> would have bailed out earlier. So, the check for enable_ipiv can be 
> dropped here (or converted into an assert).

Ignore this, I got this wrong, sorry. The earlier check is against the 
local copy of the physical ID table entry, which will indeed have 
isRunning set so this is all good.

- Naveen


