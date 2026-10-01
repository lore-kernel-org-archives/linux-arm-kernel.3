Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49740CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrZF9htcgFwurGelubRw2y+vGDbhNqUEY9ht2zIj3A4=; b=nlHYF1mthlaK0j+F7pxzaL14Dc
	G+8g5twAhS/gJWvBHgr20l84M2gSKHZiq3D/C3aC3xSOTdZ1L+r2ORTrfO4gZ0RuP2vY+9mcmv3Pm
	NIbR6Kj1yUJJTbYw9HrG8vRu/pv4n85aL+JE66QaxFLWxV/MRVXvjCSN5gQYunTPfNTuEDjFRpFvm
	q7t+JPD689XpVC/Qx/wBwm0HZN5MFNMOc73UeI2jvE1TXwTAdztinRPCPYaV4l7sngseJDhZUeitk
	qHWk53UhURi1JuTcJsch04mnh6dx/cmh+MUEWLeXoJLGpSJSWpFo511X4BGjHE+rUyGu36F+HMp+m
	zWfqbq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHwv-00000009Q4r-3hNC;
	Thu, 01 Oct 2026 14:39:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHwv-00000009Q4e-1X7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:39:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 701AC60A52;
	Thu,  1 Oct 2026 14:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0887B1F000FF;
	Thu,  1 Oct 2026 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865592;
	bh=zrZF9htcgFwurGelubRw2y+vGDbhNqUEY9ht2zIj3A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V2Z+ehITLzlytS6ExkwFAUw1ZyPlXGHmYqb/Cog99vNuqHH7pQPa327No2IEMqHlC
	 m5E+c1ikFUeLWiWJ9GPG/AXvfcFSfre/22sIJj4SCBEQkP6NFamqaySD/BcG6hmUH3
	 GiapTECNf1vZjqORXdj3e/tOeqC8HWTrCg5OV6lNYZno68RjPomjOqezvBIqn8lBLX
	 yJtHwR0QH7GZnmdHgm0tVsWrHyfxWr1jmRMbYNSCaxLBpAGAr7ApLvdzr5ztjoEUGs
	 bMKobLfCan0nCpOaFh1cgBQGqhZuGQXRpW3QVA/6vnSBcJtAiUNfvuxHK90BkTjZLD
	 ECbfNxiA3pAFw==
Date: Thu, 1 Oct 2026 15:39:41 +0100
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
Message-ID: <ar5wJRdtp6dogT6u@gremlin>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <20260930173441.66762-24-seiden@linux.ibm.com>
 <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
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

On Thu, Oct 01, 2026 at 02:10:06PM +0200, Arnd Bergmann wrote:
> Hi Steffen,
>
> [Adding Lorenzo Stoakes to Cc]
>
> I see this function fails to build on top of linux-next, as the
> kvm_vcpu_dabt_is_cm() function was removed by commit 18b94675b1fb
> ("KVM: arm64: Use ESR helpers in guest abort handling").
>
> I used this patch to make it build, but I'm not sure if this is
> the correct fix:
>
> diff --git a/arch/s390/kvm/arm64/mmu.c b/arch/s390/kvm/arm64/mmu.c
> index 3c1c8a2def73..7ee157c61d70 100644
> --- a/arch/s390/kvm/arm64/mmu.c
> +++ b/arch/s390/kvm/arm64/mmu.c
> @@ -119,6 +119,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>  	write_fault = kvm_s390_cur_gmap_fault_is_write(vcpu);
>  	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
> +		unsigned long esr = kvm_vcpu_get_esr(vcpu);
>  		ret = -ENOEXEC;
>  		/*
>  		 * The guest has put either its instructions or its page-tables
> @@ -143,7 +144,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		 * Check for a cache maintenance operation. Assume the guest is
>  		 * cautious and skip instruction
>  		 */
> -		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
> +		if (kvm_is_error_hva(hva) && esr_dabt_is_cm(esr)) {
>  			kvm_incr_pc(vcpu);
>  			ret = 1;
>  			goto out_unlock;

Thanks for the report!

The original function was:

static inline bool kvm_vcpu_dabt_is_cm(const struct kvm_vcpu *vcpu)
{
	return !!(kvm_vcpu_get_esr(vcpu) & ESR_ELx_CM);
}

And esr_dabt_is_cm() is:

static __always_inline bool esr_dabt_is_cm(unsigned long esr)
{
	return esr & ESR_ELx_CM;
}

So looks good to me at a glance!

--
Cheers, Lorenzo

