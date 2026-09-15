Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdO+/SNNk6e06hTiAWdlsYUdfBsW7HBFr9q5GgWCoW0=; b=zWuWRzK/EcnotgixXcyZYPGss9
	FEQftTYLrGS6woLAxQda/dqYA0sHiJ5T4Mrf90pOcVRvRstIJi3pLhfXqfCf71PJQJTanGPp0vEL1
	wyhuBpmSjMhGxjDqiXjs5p0HnzjJvo4XpfgaIbsyK0zTwDYA5/0VlEk2jTPbNUxRDa6/gSf+KEO3j
	RdywIMUz9gIhUmDRE51P7vJrqS6lE6bBjF11qzWu63dE4kXN4TXY6S7Ze9LABtOQHfv2paU5B/EnH
	QAAmq+6KLg9aVMWcwGitxEFQv2ZAPPoNCqLMBnymY7e/4+azzYis+UF+eXMMiEZxqjD3W8sxDtorO
	HQrturlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QEl-00000005t9R-08Gr;
	Tue, 15 Sep 2026 10:18:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QEh-00000005t8j-2tfh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:18:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F011570;
	Tue, 15 Sep 2026 03:17:52 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70FB13F7B4;
	Tue, 15 Sep 2026 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789467475; bh=P4PqmTwHRDzYg7hMT1E2FJIJY8F1LWd3zY+fMsfPU7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/hml+qLVnuLeH/JBLdhCpUUwqMM+oYk4IvEwrtZfj4AgvWOtNRZ2Ax30mwEwVj2z
	 1FWGSE7jMgPg/AoG53rg+phueBRKiPf8uF7Cr4xRN1L65L15Qsuu5GODmGiMnBbn7o
	 +X+/czrB57fCcCQgKPPEpQvPqOXiqYaTSsbBHfgo=
Date: Tue, 15 Sep 2026 11:17:47 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
Message-ID: <aqkbS810aDLyfS7D@e143914.arm.com>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915070418.3209779-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_031759_770889_61B2373D 
X-CRM114-Status: GOOD (  20.86  )
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

Hi,

On Tue, Sep 15, 2026 at 08:04:17AM +0100, Fuad Tabba wrote:
> On an MTE-capable host under pKVM, enter_exception64() reads the VM's
> MTE flag through vcpu->kvm, which for a host vCPU is a host-writable
> pointer nothing validates. The host can point it at any address in the
> hyp linear map and read back bit 1 of that word through PSR_TCO in the
> vCPU's CPSR, or panic the hypervisor with an unmapped one.
> 
> Get the VM through a get/put pair around the read: a loaded vCPU's is
> the hyp VM, an unloaded host vCPU's is read once and pinned, and a
> pointer the host never shared leaves TCO clear.
> 
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260914070536.877D91F000FF@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/exception.c             |  5 ++-
>  arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 18 ++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             | 39 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index 754e2dc1df54a..6e60d890afa4a 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -70,6 +70,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  			      enum exception_type type)
>  {
>  	unsigned long sctlr, vbar, old, new, mode;
> +	struct kvm *kvm;
>  	u64 exc_offset;
>  
>  	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
> @@ -109,8 +110,10 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  	new |= (old & PSR_C_BIT);
>  	new |= (old & PSR_V_BIT);
>  
> -	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
> +	kvm = vcpu_get_kvm(vcpu);
> +	if (kvm && kvm_has_mte(kvm))

It's fine to use the "host->kvm" here because even if sets this bit on
the host vCPU, the per-entry handlers in the other series won't copy
across the TCO bit.
Right?

>  		new |= PSR_TCO_BIT;
> +	vcpu_put_kvm(vcpu, kvm);
>  
>  	new |= (old & PSR_DIT_BIT);
>  

[snip]

Agree with the nits that Vincent suggested!

Let's see if this sticks this time:
Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

