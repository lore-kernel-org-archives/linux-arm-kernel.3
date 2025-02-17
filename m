Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F16C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENDJDElli/pmy/3RIeCIlmONiOJqHGK3G7DwV+qCb48=; b=vZDNw9R/l0EjYM2xuftdmyEwst
	bB0x1Cy0ncH3N5xqPxuPGXjdOb4JzirPoqC5XQZKCNMHABG4rOR8Oio2I4c+sUsV0tBbAUiTG6QBN
	T1aYIguuyJ0u6cCsPuVVvbSzTzDvHSow9eyx9gKnQqXYkLLbqvQrUNrqrUe1rizRBh65sJAhiCYch
	BtdO5D85U0qYNaGhjZ679OnRXcY+rHTINJDIrmZNc0PDv63/oQfBozGmGfnesxoCRYWj+KtNuk8uJ
	YA+lbiNOvXyJlsBYdWQEHChxrOtGVRbPBSIA8FdkARyX4o8aUnjcjxBngNZ7wqW6ZMlU2G8Q95pUe
	JVR4n/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk36o-000000052zN-3tG9;
	Mon, 17 Feb 2025 15:32:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk34x-000000052YS-039X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 989695C5815;
	Mon, 17 Feb 2025 15:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AAEC4CED1;
	Mon, 17 Feb 2025 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739806237;
	bh=aiiGfHlzYhLKBPI7T+oe19y05r9wkNreqH/OubXhk4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZq1COae0oQ//5zMRRtaXRd2PhYc0QB91P1UmS7tDTNizTkjKcC8gGQgzKYLogVNs
	 Vk+Yj9H8uRcr5db3ASGaN+CXyQ3x7dWSm/cXCcjrZ2tFSB8bxUqvT8kf282Gl8sTBg
	 C6RghwXLYsd0qesKbMEHgS/kCNhjsaWucSwy3IN7idsvxPGDe/CmutZeWe8qOSKrE9
	 dzCTMnnnjkIKa2/sQFWMvC6tjLel1wbF0YpABkjHmg4ajyNM0BUvAckHw6kancR1Q0
	 kGILqyCn+ktpt9CRKpSGDygLe5A1JXKWLZgUTxm3YCJRsedpNuMA/hplQgOQtmqgzu
	 E5+kwUUOCi2lQ==
Date: Mon, 17 Feb 2025 15:30:31 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v1 3/3] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
Message-ID: <20250217153031.GA16398@willie-the-truck>
References: <20250214150258.464798-1-tabba@google.com>
 <20250214150258.464798-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214150258.464798-4-tabba@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073039_139252_58D2BA49 
X-CRM114-Status: GOOD (  21.07  )
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

On Fri, Feb 14, 2025 at 03:02:58PM +0000, Fuad Tabba wrote:
> Instead of creating and initializing _all_ hyp vcpus in pKVM when
> the first host vcpu runs for the first time, initialize _each_
> hyp vcpu in conjunction with its corresponding host vcpu.
> 
> Some of the host vcpu state (e.g., system registers and traps
> values) are not initialized until the first time the host vcpu is
> run. Therefore, initializing a hyp vcpu before its corresponding
> host vcpu has run for the first time might not view the complete
> host state of these vcpus.
> 
> Additionally, this behavior is inline with non-protected modes.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h      |  2 +
>  arch/arm64/include/asm/kvm_pkvm.h      |  1 +
>  arch/arm64/kvm/arm.c                   |  4 ++
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 54 +++++++++++++++-----------
>  arch/arm64/kvm/pkvm.c                  | 28 ++++++-------
>  6 files changed, 53 insertions(+), 42 deletions(-)

[...]

>  static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
>  			      struct pkvm_hyp_vm *hyp_vm,
> -			      struct kvm_vcpu *host_vcpu,
> -			      unsigned int vcpu_idx)
> +			      struct kvm_vcpu *host_vcpu)
>  {
>  	int ret = 0;
>  
>  	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
>  		return -EBUSY;
>  
> -	if (host_vcpu->vcpu_idx != vcpu_idx) {
> -		ret = -EINVAL;
> -		goto done;
> -	}
> -
>  	hyp_vcpu->host_vcpu = host_vcpu;
>  
>  	hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
>  	hyp_vcpu->vcpu.vcpu_id = READ_ONCE(host_vcpu->vcpu_id);
> -	hyp_vcpu->vcpu.vcpu_idx = vcpu_idx;
> +	hyp_vcpu->vcpu.vcpu_idx = READ_ONCE(host_vcpu->vcpu_idx);
>  
>  	hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
>  	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> @@ -687,27 +689,28 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
>  		goto unlock;
>  	}
>  
> -	idx = hyp_vm->nr_vcpus;
> +	ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
> +	if (ret)
> +		goto unlock;
> +
> +	idx = hyp_vcpu->vcpu.vcpu_idx;
>  	if (idx >= hyp_vm->kvm.created_vcpus) {
>  		ret = -EINVAL;
>  		goto unlock;
>  	}
>  
> -	ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu, idx);
> -	if (ret)
> +	if (hyp_vm->vcpus[idx]) {
> +		ret = -EINVAL;
>  		goto unlock;
> +	}

I'm not sure how much we care at EL2, but it looks like there's a
potential spectre gadget here given that 'idx' is now untrusted.
Perhaps chuck something like:

	idx = array_index_nospec(idx, hyp_vm->kvm.created_vcpus);

before indexing into 'hyp_vm->vcpus[]'?

Either way:

Acked-by: Will Deacon <will@kernel.org>

Will

