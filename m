Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466B1FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTmZ8pGGZ/hzLoGbHSM67x+yk0ufm7YBi5T4IeB0FBA=; b=o5wYyLiTpBh0mTKPQjVqVEmiJF
	6NPFZU1PRz1tTt/G+1+LR/uODVio0cbzQuGsKcqG7fQeJi54pRnk6QlUUSwnJuJbRhtjRM7SoRUTu
	RiTJD+GUZXMsgmpnjH/4qoX/6PBBJX0wS0ZIbJCedKVwMFwO/L7+D4BKcY2pJFL3+dLYWM3RAER8k
	iy8NewtV3KmVM/d1R+7uNPGJLQV7DJy/H9ckvITxyTnt64ZXDpTOeF5Pcff1oSfZuxj1i5VyagfFG
	XTQAWdsoskaU5MYtaMLeJb8N0Dpdt57zfh6dZA474W6PioD1HzavwLTtmGNGNhOfr6Wy5rRg6SpaG
	PEzLh1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHipb-00000001aY8-2pBH;
	Tue, 28 Apr 2026 13:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHipZ-00000001aXW-3D46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C31A543B9C;
	Tue, 28 Apr 2026 13:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25837C2BCAF;
	Tue, 28 Apr 2026 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777384228;
	bh=C5KSRh53zUUnHlfowXZ4LbxgWa/gXflfi32aQpqJdG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCBmAicRsBEGMMPKnS6mfeRIsjZM73pool8RdEf0m7TaJhDQrMg9QCfOXrqATsCKn
	 44me2Coqd+8h7Yg0OG1VpbvysEn9YkkzxGVM/d5GOlTADW0io+Jrv7AAn86R5b4q4o
	 7n1UCPxhTWKr0ZUNuAn6fKDM6e7OBRYBx2/GAv2IW804DZyXN81aEfbnYLZQRD068d
	 fqnWuMsPuZx0jLLcErSl++pqobVk14f+edlUxYz32ybKhVmICFjxecWaMO9DFYAoFy
	 Wkz0SyJkruKD17nDeJ7aYrPIe/KzidwX7/CNNX1LJlihv/AFGGhOnraH4dZlMu1F3V
	 85cgj+ud9i79A==
Date: Tue, 28 Apr 2026 14:50:23 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
	vdonnefort@google.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/8] KVM: arm64: Synchronise HCR_EL2 writes on the guest
 exit path
Message-ID: <afC7H1fu4vFzTRTt@willie-the-truck>
References: <20260428103008.696141-1-tabba@google.com>
 <20260428103008.696141-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428103008.696141-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_065029_853062_51C9C2E6 
X-CRM114-Status: GOOD (  27.12  )
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

On Tue, Apr 28, 2026 at 11:30:02AM +0100, Fuad Tabba wrote:
> MSR HCR_EL2 is not self-synchronising. Per ARM DDI 0487 M.b K1.2.4
> (p.K1-16823) and B2.6.1 (p.B2-297), a Context Synchronisation Event
> is required between an HCR_EL2 write and any subsequent direct
> register access at the same EL that depends on the new value being
> in effect.
> 
> On the entry path, the HCR_EL2 write in __activate_traps is followed
> by further EL2 sysreg work (MDCR_EL2, CPTR_EL2, VBAR_EL2, and on the
> speculative-AT errata path SCTLR_EL1/TCR_EL1) before ERET into the
> guest. None of those intervening accesses depend on the new HCR_EL2
> value, and ERET is a CSE per ARM DDI 0487 M.b D1.4.4.1 rule RBWCFK
> (p. D1-7209) conditional on SCTLR_EL2.EOS=1, which is set
> unconditionally by INIT_SCTLR_EL2_MMU_ON (see the prerequisite patch
> in this series). The requirement is therefore satisfied implicitly
> on the activate path.
> 
> The deactivate path is different: after write_sysreg_hcr() in
> __deactivate_traps() further EL2 sysreg work runs before any natural
> CSE - on nVHE, __deactivate_cptr_traps and the VBAR_EL2 write; on
> VHE, the timer context save which reads CNTP_CVAL_EL0 under the new
> TGE/E2H, and the EL1 sysreg restore. Add an explicit isb() at each
> of the two deactivate sites.
> 
> The practical impact today is bounded: HCR_EL2.E2H does not toggle
> in either path, and the trap bits being changed primarily affect
> EL1&0 behaviour. But the architectural rule should be honoured.
> Note that write_sysreg_hcr() itself already issues isb() on the
> Ampere errata path (sysreg.h), confirming the architectural
> expectation; the fast path optimises that away.
> 
> The fix is at the call sites rather than inside write_sysreg_hcr()
> because the macro has many users (e.g. the activate path, at.c,
> hardirq.h, ptrauth alternatives) where the immediately-following
> code either reaches ERET or has another CSE; making the macro emit
> an unconditional ISB would impose unnecessary cost on those
> well-formed users.
> 
> Fixes: 9404673293b0 ("KVM: arm64: timers: Correctly handle TGE flip with CNTPOFF_EL2")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/switch.c | 11 +++++++++++
>  arch/arm64/kvm/hyp/vhe/switch.c  | 11 +++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index 8d1df3d33595..9d7ead5a5503 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -105,6 +105,17 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
>  	__deactivate_traps_common(vcpu);
>  
>  	write_sysreg_hcr(this_cpu_ptr(&kvm_init_params)->hcr_el2);
> +	/*
> +	 * MSR HCR_EL2 is not self-synchronising. Per ARM ARM K1.2.4 p.K1-16823
> +	 * and B2.6.1 p.B2-297, a Context Synchronisation Event is required
> +	 * between an HCR_EL2 write and any subsequent direct register access at
> +	 * the same EL that depends on the new value being in effect.
> +	 * The activate_traps path falls through to ERET (a CSE), but the
> +	 * deactivate path still executes further EL2 sysreg work (CPTR/VBAR
> +	 * writes below) before any natural CSE, so make the synchronisation
> +	 * explicit.
> +	 */
> +	isb();

Sorry, but I don't understand this. Please can you explain why you think
that CPTR and VBAR have an ordering dependency on HCR_EL2? Preferably,
the comment would talk about the specific fields that are relevant.

Will

