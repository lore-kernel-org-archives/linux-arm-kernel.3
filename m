Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F184CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqppwbTyT6zkR1AvrZPfMSRvNskOl/Jz4/VeCTg9S+8=; b=wxQn+yxGD1hU2/T38Un7ZH+UoJ
	Wp3NELKwQpKqBZSmQzEKzlVx0tprTytQT3lGNMKgBdslAZXSM5hHF1yb2o3VVK4OWXZpQ8P9fMryi
	YuzW8kWFgG1E51TB2NmAVC3Rm4bQxIoDwgSdWUpeFNg7KOnlrHkVtIds1Hhm5d8qT1UpU2u6GaZ31
	kv3Uq503mkkTmDFhyilFghE5Qb1IHG1EDPgtPO3d1KpVpdJsF4I4k3BjmwWJ1kRcfo8wtKr85dK3P
	a457m+nmcQoJXw48ZKHsiUCOkF656Ug7mBJpnLtCxyLamWMQ+my+Em+26sEyB+BMreFCWVZ5dg+fs
	uDCdfg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHtn-00000009Ppg-1hdo;
	Thu, 01 Oct 2026 14:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHtm-00000009PpT-1QfU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6539406FC;
	Thu,  1 Oct 2026 14:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731E11F000FF;
	Thu,  1 Oct 2026 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865397;
	bh=KqppwbTyT6zkR1AvrZPfMSRvNskOl/Jz4/VeCTg9S+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oRA3ndmuic8x5tRK8Thog7048p9/0q1/4fqTgxaNdxfq2ksuOlOiYGYor6Edw5mFh
	 gbvysr6lqUVRtSROKKKFcydrUR4RABYSu2qIUBBNEEbKqM1p2z4uKUQHArX06X3jJ6
	 MFbDk23qOyANQ6TQq68cZYSKJCPBFnzLFV0R9ES5BRxzev1bjVfOz5tZBV3AqnGJ37
	 AkHkZPtEfhJU+WU+tWgk2Ug6+d9PXdoDBnZtKaMRNnQvgc6gOh6WzgQGIsnMGG8vih
	 oR/uj2xdHGU8jqPDFk+wEZo3O+KuG2Q9D4/q3JeXQmQSYTJfy5KRO6vlq6A7UTzpMB
	 O/3vpWAUJQPVQ==
Date: Thu, 1 Oct 2026 15:36:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Grapentin <gra@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "David Hildenbrand (Red Hat)" <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>, 
	Hariharan Mari <hari55@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Hendrik Brueckner <brueckner@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Nico Boehr <nrb@linux.ibm.com>, Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, 
	Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v9 23/24] KVM: s390: arm64: Implement basic page fault
 handler
Message-ID: <ar5udQI9qDAtYrGi@gremlin>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <20260930173441.66762-24-seiden@linux.ibm.com>
 <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
 <e1569c6e-94df-4609-8d94-d6319b4171cf@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1569c6e-94df-4609-8d94-d6319b4171cf@app.fastmail.com>
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

On Thu, Oct 01, 2026 at 03:35:37PM +0200, Arnd Bergmann wrote:
> Another ones: after 34cfa9b3af17 ("KVM: arm64: Implement
> KVM_PRE_FAULT_MEMORY"), we are now missing a kvm_arch_pre_fault_allowed()
> definition in arch/s390/kvm/arm64/mmu.c:
>
> ERROR: modpost: arch/s390/kvm/arm64/kvm-arm64.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!
>
> I copied the arm64 version without the pkvm reference to make it
> build for me.
>
>      Arnd
>
> diff --git a/arch/s390/kvm/arm64/mmu.c b/arch/s390/kvm/arm64/mmu.c
> index 7ee157c61d70..be16351acaae 100644
> --- a/arch/s390/kvm/arm64/mmu.c
> +++ b/arch/s390/kvm/arm64/mmu.c
> @@ -179,6 +179,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  	return ret;
>  }
>
> +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> +{
> +	if (!kvm_vcpu_initialized(vcpu))
> +		return -ENOEXEC;
> +
> +	return 0;
> +}
> +

Ah the s390 <-> kvm emulation stuff.

Yep if it's meant to behave like arm64 then that should be correct.

It's odd to me that pre-faulting was not previously implemented for actual-arm64
but was added as part of the virtualised s390/arm64 thing automatically :)

Not sure if this implementation requires what s390 does with:

+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+       if (kvm_is_ucontrol(vcpu->kvm))
+               return -EINVAL;
+
+       return 0;
+}

Or both conditions? One for the s390 guys.

--
Cheers, Lorenzo

