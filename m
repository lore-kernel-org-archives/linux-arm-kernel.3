Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDADCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww3MgvoKXBDrHgnorb3FWeSCZJO6ATl+G8SETSPUBWo=; b=1tV6b8PR/qL9nkY56YxlbVN0Ts
	/xXkQVo8+ANFFZyxkmCyUT8c+92NGiqeFf61fS57JhUeKv17HMN+hd1gTBnB4krmhStnvyLnzc+sC
	LURcb3h5d+6cnzK2/mn/gbnDI2EpZfR4uFg0t/Fllt+DMcz37YBguzzAPbWyG/rrXo6dILqjfsihL
	Ku0mkjixmKcrKyCC89f75m4kAubDET/M/hb/mI5pN5DgtPS8wAelSupUDdBl7hUlYCW386koilCJi
	HBpwvDfrHpm/mpskc9GDXdy8+KmKa6wKmFbDEMDRqn1c7rVxYE4/QaP7LCAlbx+ltp9qONddD9oHt
	fSW69DGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh0L-00000004OpU-1RPX;
	Mon, 08 Jun 2026 20:55:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh0J-00000004OpI-3fTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:55:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5382E400F0;
	Mon,  8 Jun 2026 20:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40F31F00893;
	Mon,  8 Jun 2026 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780952127;
	bh=Ww3MgvoKXBDrHgnorb3FWeSCZJO6ATl+G8SETSPUBWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EFipMoevJToto3v2ysvCUrVS+ZNcPWf2WkIrdRmxt6ajG+mXOU7ZP7q3TcvhOXUNC
	 qDfIs4f6CVWVFDfukXhxcsi/z9+8I8fEfyFVJnAeINqz3tyQMRRFDbbbKp/nRssbgA
	 earCd0m4XpdT4x8esC01HGbXgpiz6mh4mF3UOURLcb8ccWt9Y5LeMFE82GAF4h587o
	 g8vcrJMcuWtAqheTqHipclyaiAj3LetvPhcdqHqhdA/aU+XDY07vfcLivY4PLDfrlX
	 CiMKzToPz8DcjfRwSAhGFz14sWZ+TkdYlvucSh/vYWnhrYREtBF9Fb2cHsVBOs8V1R
	 uoL19+LlBq3JQ==
Date: Mon, 8 Jun 2026 20:55:25 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Hold kvm->mmu_lock while initialising
 vcpu->arch.vncr_tlb
Message-ID: <aicqzM4W4NN-GndT@google.com>
References: <20260608081108.2244133-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608081108.2244133-1-maz@kernel.org>
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

On Mon, Jun 08, 2026 at 09:11:08AM +0100, Marc Zyngier wrote:
> Sashiko reports that there is a race between initialising vncr_tlb
> and making use of it, as we don't hold the mmu_lock at this point.
> 
> Additionally, it identifies a memory leak, should userspace repeatedly
> invokes the KVM_RUN ioctl after a failure of kvm_arch_vcpu_run_pid_change(),
> as we assign vncr_tlb blindly on first run, irrespective of prior
> allocations.
> 
> Slap the two bugs in one go by taking the kvm->mmu_lock on assigning
> vncr_tlb, preventing the race for good, and by checking that vncr_tlb
> is indeed NULL prior to allocation.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20260607180815.85FBC1F00893@smtp.kernel.org
> ---
>  arch/arm64/kvm/nested.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 690b8e8564166..d11e36b3cfcc2 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1253,8 +1253,14 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
>  	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
>  		return 0;
>  
> -	vcpu->arch.vncr_tlb = kzalloc_obj(*vcpu->arch.vncr_tlb,
> -					  GFP_KERNEL_ACCOUNT);
> +	if (!vcpu->arch.vncr_tlb) {
> +		struct vncr_tlb *vt = kzalloc_obj(*vcpu->arch.vncr_tlb,
> +						  GFP_KERNEL_ACCOUNT);
> +
> +		scoped_guard(write_lock, &vcpu->kvm->mmu_lock)
> +			vcpu->arch.vncr_tlb = vt;
> +	}

(I am not familiar with this code at all, so apologies in advance if I
am making an idiot out of myself here)

IIUC, the point of holding the lock here is *not* to protect against
concurrent initialization, as in this case the NULL check needs to be
done under the lock.

Rather, the goal is to prevent re-ordering of zeroing from kzalloc and
the assignment to vcpu->arch.vncr_tlb, by depending on the barriers
provided by the lock. The lock is held by the readers so holding it here
conviently means we do not need to add any barriers to the readers.

Is my understanding correct?

If yes, I think the code looks confusing, at least to a layman like
myself. It initially seems like the lock protects against concurrent
initializations, but then the NULL check is not done again under the
lock. The goal of the lock is not clear without the original report.

Mayeb it's clearer to explicitly use barriers if the goal is preventing
reordering?

