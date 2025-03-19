Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629DCC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAXcOOp8nlW8Hi8rUnVBNyubJyC2YHD9wvZK7EXR6rY=; b=bm7Iywm0+ClfhE4y46+eSTBmtg
	OUm7Tr05krl95xFMEitMNzIz9bJrgzzngyorLjyb1am/7nQh8hLFHelKqbS+dhfuFX6of4Jm+Khci
	aY8EZmJ29UoxN9NC9IjOr0FbdH7qDeL4g5hMGZvF+LVVo4zNNGGlaNeU5QqQenxkeA8WaKgIOw7bg
	oVnQO9YmLnwrGEVxWAbfxvBxLradTv6NWbezZRabIfUdZ5t52UffizwxspV+PpU77/D6ZSWcD2H7D
	zbuMCKl3wGFKBetoRXmcdBRe9GtPofMKswKnMmNJlDdmmZLdpsZNmgil++52pDqF7EUO3VKWzr35K
	1Tppib8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqaU-00000008eSx-156w;
	Wed, 19 Mar 2025 10:23:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqX7-00000008dl0-31ex
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:20:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4136512FC;
	Wed, 19 Mar 2025 03:20:27 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BD103F694;
	Wed, 19 Mar 2025 03:20:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:20:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, Gavin Shan <gshan@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <Z9qaW_H9UFqdc1bI@J2N7QTR9R3>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-8-ddc16609d9ba@kernel.org>
 <019afc2d-b047-4e33-971c-7debbbaec84d@redhat.com>
 <86r02tmldh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86r02tmldh.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032021_858565_8D3D15F7 
X-CRM114-Status: GOOD (  27.16  )
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

On Wed, Mar 19, 2025 at 09:15:54AM +0000, Marc Zyngier wrote:
> On Wed, 19 Mar 2025 00:26:14 +0000,
> Gavin Shan <gshan@redhat.com> wrote:
> > On 3/14/25 10:35 AM, Mark Brown wrote:

> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index 4e757a77322c9efc59cdff501745f7c80d452358..1c8e2ad32e8c396fc4b11d5fec2e86728f2829d9 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -5,6 +5,7 @@
> > >    */
> > >     #include <hyp/adjust_pc.h>
> > > +#include <hyp/switch.h>
> > >     #include <asm/pgtable-types.h>
> > >   #include <asm/kvm_asm.h>
> > > @@ -176,8 +177,12 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> > >   		sync_hyp_vcpu(hyp_vcpu);
> > >   		pkvm_put_hyp_vcpu(hyp_vcpu);
> > >   	} else {
> > > +		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
> > > +
> > >   		/* The host is fully trusted, run its vCPU directly. */
> > > -		ret = __kvm_vcpu_run(host_vcpu);
> > > +		fpsimd_lazy_switch_to_guest(vcpu);
> > > +		ret = __kvm_vcpu_run(vcpu);
> > > +		fpsimd_lazy_switch_to_host(vcpu);
> > >   	}
> > >   
> > 
> > @host_vcpu should have been hypervisor's linear mapping address in v6.12. It looks
> > incorrect to assume it's a kernel's linear mapping address and convert it (@host_vcpu)
> > to the hypervisor's linear address agin, if I don't miss anything.
> 
> host_vcpu is passed as a parameter to the hypercall, and is definitely
> a kernel address.
> 
> However, at this stage, we have *already* converted it to a HYP VA:
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/kvm/hyp/nvhe/hyp-main.c?h=linux-6.12.y#n147

That's also the case in v6.13; the earlier conversion was removed in
v6.14-rc1 in commit:

  f7d03fcbf1f48206 ("KVM: arm64: Introduce __pkvm_vcpu_{load,put}()")

... where the code in the 'else' block changed from:

|	ret = __kvm_vcpu_run(host_vcpu);

... to:

	ret = __kvm_vcpu_run(kern_hyp_va(host_vcpu));
|

In the upstream version of this patch, the code here changed from

|	/* The host is fully trusted, run its vCPU directly. */
|	ret = __kvm_vcpu_run(kern_hyp_va(host_vcpu));

... to:

|	struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
|
|	/* The host is fully trusted, run its vCPU directly. */
|	fpsimd_lazy_switch_to_guest(vcpu);
|	ret = __kvm_vcpu_run(vcpu);
|	fpsimd_lazy_switch_to_host(vcpu);

> The result is that this change is turning a perfectly valid HYP VA
> into... something. Odds are that the masking/patching will not mess up
> the address, but this is completely buggy anyway. In general,
> kern_hyp_va() is not an idempotent operation.

IIUC today it *happens* to be idempotent, but as you say that is not
guaranteed to remain the case, and this is definitely a logical bug.

> Thanks for noticing that something was wrong.
> 
> Broonie, can you please look into this?
> 
> Greg, it may be more prudent to unstage this series from 6.12-stable
> until we know for sure this is the only problem.

As above, likewise with the v6.13 version.

I'll go reply there linking to this thread.

Mark.

