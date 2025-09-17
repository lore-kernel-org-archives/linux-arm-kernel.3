Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3F3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SO80njLlKaFV9bGiNepABSN5e/ENohRhcDTngz1Wxk=; b=vxXijtT18R+2fgL9RuFichVEW/
	uZNHqDH2gkkMkVK6/cCWU9YkLBVVPhQ3t8rSmQdU8fDo1Pf79TBijwZ0tlAJc2U2809CKBl02eLHx
	v4Z3NOqBMXogbffnf9S45x1x3PdSQyBqmgqR8m6L/C72Gt/uOHX5cpY3KN7EXneKEz3jpzeXcUSKD
	E/Dssa+j8TUz1muOXfoT1K2DuzSg8eYbpV3F2Cx+o3w6kp646WfKVvHZ07oj+MGubmNVWr5WgXHwI
	CYDCXSniIXu/MJRMX22Y6waoeRCWpyULfeSbok6htlJJku2I4wk2ggqXKvnumadwRnvZ3ZhrB+kUP
	r1Jolpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Dl-0000000F70u-1NXo;
	Wed, 17 Sep 2025 22:01:49 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0Cq-0000000F6V8-2LXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:00:54 +0000
Date: Wed, 17 Sep 2025 15:00:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758146449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2SO80njLlKaFV9bGiNepABSN5e/ENohRhcDTngz1Wxk=;
	b=keainyuXp8ltIREWM43kEcd6qu4WeUgGSQ1BWxBnrGSTk6sBjOZ6+v0hskEpv+s/qgunLl
	TNWSfyFNndbrPhoxaAX5upovftUs+kjSgPDABPGXXUnK7jqhkKWu1cjVa6nFt1l6aBsb6u
	PUp1FWdJuq0eS8TSppAJ6lZ9e0AVnOY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Subject: Re: [PATCH 07/13] KVM: arm64: selftests: Provide helper for getting
 default vCPU target
Message-ID: <aMsviTd4TGoocUGI@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
 <20250917212044.294760-8-oliver.upton@linux.dev>
 <aMsui6JZ0q1z4pSc@vm4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMsui6JZ0q1z4pSc@vm4>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150053_720744_69236CB9 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Itaru,

Appreciate the review.

On Thu, Sep 18, 2025 at 06:56:27AM +0900, Itaru Kitayama wrote:
> On Wed, Sep 17, 2025 at 02:20:37PM -0700, Oliver Upton wrote:
> > The default vCPU target in KVM selftests is pretty boring in that it
> > doesn't enable any vCPU features. Expose a helper for getting the
> > default target to prepare for cramming in more features. Call
> > KVM_ARM_PREFERRED_TARGET directly from get-reg-list as it needs
> > fine-grained control over feature flags.
> > 
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >  tools/testing/selftests/kvm/arm64/psci_test.c   |  2 +-
> >  .../testing/selftests/kvm/arm64/smccc_filter.c  |  2 +-
> >  .../selftests/kvm/arm64/vpmu_counter_access.c   |  4 ++--
> >  tools/testing/selftests/kvm/get-reg-list.c      |  9 ++++++---
> >  .../selftests/kvm/include/arm64/processor.h     |  2 ++
> >  .../testing/selftests/kvm/lib/arm64/processor.c | 17 +++++++++++------
> >  6 files changed, 23 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/arm64/psci_test.c b/tools/testing/selftests/kvm/arm64/psci_test.c
> > index cf208390fd0e..0d4680da66d1 100644
> > --- a/tools/testing/selftests/kvm/arm64/psci_test.c
> > +++ b/tools/testing/selftests/kvm/arm64/psci_test.c
> > @@ -89,7 +89,7 @@ static struct kvm_vm *setup_vm(void *guest_code, struct kvm_vcpu **source,
> >  
> >  	vm = vm_create(2);
> >  
> > -	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> > +	kvm_get_default_vcpu_target(vm, &init);
> >  	init.features[0] |= (1 << KVM_ARM_VCPU_PSCI_0_2);
> >  
> >  	*source = aarch64_vcpu_add(vm, 0, &init, guest_code);
> 
> I wonder if the ioctl() can be called unconditionally in the 
> aarch64_vcpu_add() function. If the intention is that the kvm selftest
> code needs to write this way I am fine with that.

I had a similar thought but decided against it as tests may need
fine-grained control over the feature flags (like above). I would hope
that most users will use the 'default' VM infrastructure if they do not
need this sort of control.

> Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks!

Best,
Oliver

