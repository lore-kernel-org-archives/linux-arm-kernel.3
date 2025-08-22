Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E347CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLjg8Y5myb/BfSTld+S05SbtufySosFInjHD1VZtzHU=; b=s9k01kqJAGmu7JmAKv56xk8CLq
	G2+5X/HZFqxdv58Ai+OFBPXrhxITYk/uH2SMDCsbSLblhJ3aLuMj4Eu5reIAwpGW4kRZBdEasStLg
	zLs1hVyuARCqgwOYdswIZXEvIi2e63pMrEPjgTuy4vURF5TqmPdBIsOUNzJN6ELt/uv9fJNNzPZer
	an+e+8/AAX4hikEro9zRTlVA26DqJTuwg1+HdhYilUe9PN7DV19lss4QQIIl4Fwz07ldEe+Wzd546
	P9NOFbi390SpXLxwBH6/zXsnCug2bQg+iULhRiqS5B8kxiWvrhM40TVdnflEemLPl77LoFWLd+T75
	0oUOu3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb9-00000003XHi-3lZi;
	Fri, 22 Aug 2025 21:47:00 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO24-000000022Ri-3PX0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:26:02 +0000
Date: Fri, 22 Aug 2025 02:25:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755854757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SLjg8Y5myb/BfSTld+S05SbtufySosFInjHD1VZtzHU=;
	b=I6gMCdUf8SOoxP9R+ovqkZBQ277HOocaX8dY7qeW8bj3T7YfmvoW4cJK2LJh5qGGjKu4hp
	iTY2B2a0tfbAr84wJ5ZkiPqszexiJyLfb6wqC6+NOG9sDP5plAeS8V86HMQVRHjI0IsNpG
	Cfc4/7w+XjmPGKZ2nS3NOPz8WDjM8VA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Allow shadow stage 2 read fault
Message-ID: <aKg3l23hheuQ1dJH@linux.dev>
References: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022601_431195_5922D7EA 
X-CRM114-Status: GOOD (  20.47  )
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

Hi Wei-Lin,

You've been finding some good stuff with nested, thank you :)

On Fri, Aug 22, 2025 at 11:18:53AM +0800, Wei-Lin Chang wrote:
> I am able to trigger this error with a modified L1 KVM, but I do realize
> this requires L1 to be very strange (or even just wrong) so I understand
> if we don't want to handle this kind of edge case. On the other hand,
> could there also be other ways to trigger this that I have not thought
> of?

The architecture is pretty unambiguous here that the stage-2 can
represent a translation w/o read permission.

> Another thing is that this change lets L1 get away with not flushing the
> TLB, but TLBs are ephemeral so it's fine in this aspect, however I'm not
> sure if there are other considerations.

FEAT_ETS3 is an interesting one since it provides software with ordering
expectations around MMU faults (including permission faults) and updates
to the translation tables. For KVM's shadow stage-2 to comply we need to
re-walk the guest's stage-2 before injecting the fault at L1.

> ---
>  arch/arm64/kvm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1c78864767c5c..41017ca579b19 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1508,8 +1508,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>  	VM_BUG_ON(write_fault && exec_fault);
>  
> -	if (fault_is_perm && !write_fault && !exec_fault) {
> -		kvm_err("Unexpected L2 read permission error\n");
> +	if (fault_is_perm && !write_fault && !exec_fault && !nested) {
> +		kvm_err("Unexpected S2 read permission error\n");
>  		return -EFAULT;
>  	}

Hmm... I'm also willing to just delete this check altogether. The
likelihood of KVM creating a stage-2 PTE w/o read permission is rather
low.

Thanks,
Oliver

