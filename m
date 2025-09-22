Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79EDCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dq7+iioGGBjdY4sZUiiwAdtrKxyUAcd9xWPR2FHx19w=; b=1CZiJrePNIzqo0XYacKYvoA6Uk
	xi5MCrI7p4Wwjt/1Yl0salEM2yQ/gpr4nENBkofLdXu3hB5e8LbvgLu935T9pL8acH01PKQfI7rEp
	ysdnosBGiF7O6xn2+WG0NT8y28PSad14qZWlRsvxFMQH2z3GsR76vJN63BK6LAtAppNmpzUzoij0d
	7i7yoqyS2G9nQBbzKV0Iadn9PwrFsg7FdzmZDV69Eb3gILubBx6347g8pok1nSlRzhFA+UvN179Xj
	0ZACdg3MZatBIbggaOhyxQRiVJ9GS1g3MtWupTkNIHawHOGqw5AdVHCH/M1lFMwFTk+3ydnlzKU+k
	kDaLetBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pwT-0000000BlBA-2DyI;
	Mon, 22 Sep 2025 23:27:33 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pwQ-0000000Bl9j-11mt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:27:32 +0000
Date: Mon, 22 Sep 2025 16:27:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758583644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq7+iioGGBjdY4sZUiiwAdtrKxyUAcd9xWPR2FHx19w=;
	b=L2GvIUiiyYrNMbg/rAqi2PZY32HhmJC1v8/9oNKOpk0DSAxUJSxTSE5F/EiqZfPx4CpGmh
	bl0OxUFnk/j4FYgOmLza+Znwlrh0zg1DjJN5firsACIogIVIu1CTxTC1d322T7mC/krIOI
	ChBHzIZcP7FoSBkjhM/EkTC97tUUGQE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Priscilla Lam <prl@amazon.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, dwmw@amazon.co.uk, gurugubs@amazon.com,
	christoffer.dall@arm.com, graf@amazon.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Implement KVM_TRANSLATE ioctl for arm64
Message-ID: <aNHbUqTi4nOK_w5I@linux.dev>
References: <20250922202452.45810-1-prl@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922202452.45810-1-prl@amazon.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_162730_428557_547889C9 
X-CRM114-Status: GOOD (  23.48  )
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

Hi Priscilla,

On Mon, Sep 22, 2025 at 01:24:52PM -0700, Priscilla Lam wrote:
> There is a KVM_TRANSLATE ioctl for x86 to translate a GVA
> (guest virtual address) to a GPA (guest physical address) in EL1
> which is not yet implemented for arm64.
> 
> Implement KVM_TRANSLATE on arm64 for both configurations that
> support and do not support VHE. The VHE path uses the AT
> instruction directly while the non-VHE implementation wraps the
> AT call in a hypercall to allow for its execution in EL2. Add
> selftest that tests the ioctl in both configurations.
> 
> Signed-off-by: Priscilla Lam <prl@amazon.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |   2 +
>  arch/arm64/kvm/guest.c                        |  89 ++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  10 ++
>  arch/arm64/kvm/hyp/nvhe/translate.c           |  84 ++++++++++++++
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  tools/testing/selftests/kvm/arm64/translate.c | 107 ++++++++++++++++++

Please do selftests changes in a separate patch.

> +static int kvm_translate_vhe(struct kvm_vcpu *vcpu, struct kvm_translation *tr)

So arch/arm64/kvm/at.c exists for this exact purpose: walking guest page
tables. While it was previously constrained to handling NV-enabled VMs,
Marc's SEA TTW series opens up the stage-1 walker for general use.

I am not keen on adding yet another page-table walker implementation for
the sole purpose of servicing this ioctl.

https://lore.kernel.org/kvmarm/175845226586.1792635.11249464012956393475.b4-ty@kernel.org

> +{
> +	unsigned long flags;
> +	uint64_t hcr_old, hcr_new, par;
> +	const uint64_t gva = tr->linear_address;

"linear_address" is a delightful x86-ism. I'd prefer naming that was
either architecture-generic -or- an arm64-specific struct that used our
architectural terms.

> +	preempt_disable();
> +	local_irq_save(flags);
> +
> +	/* Ensure we're in the expected VHE regime and enable S2 so PAR returns IPA. */
> +	hcr_old = read_sysreg(hcr_el2);
> +	hcr_new = hcr_old | HCR_E2H | HCR_VM;
> +	hcr_new &= ~HCR_TGE;
> +	write_sysreg(hcr_new, hcr_el2);
> +	isb();

Thanks to borken hardware, this needs to go through the write_sysreg_hcr()
accessor.

> +
> +	/* Load guest EL1 S1 context into *_EL12 (do not write into _EL1). */
> +	write_sysreg_s(vcpu_read_sys_reg(vcpu, TTBR0_EL1), SYS_TTBR0_EL12);
> +	write_sysreg_s(vcpu_read_sys_reg(vcpu, TTBR1_EL1), SYS_TTBR1_EL12);
> +	write_sysreg_s(vcpu_read_sys_reg(vcpu, TCR_EL1), SYS_TCR_EL12);
> +	write_sysreg_s(vcpu_read_sys_reg(vcpu, MAIR_EL1), SYS_MAIR_EL12);
> +	write_sysreg_s(vcpu_read_sys_reg(vcpu, SCTLR_EL1), SYS_SCTLR_EL12);

KVM supports both FEAT_S1PIE and FEAT_S1POE, so this is not a complete
MMU context.

> +	/* Check address read */
> +	asm volatile("at s1e1r, %0" :: "r"(gva));
> +	isb();

The AT instruction can generate an exception, which is why __kvm_at()
exists.

And this is where reusing the existing translation infrastructure is
really important. The AT instruction *will* fail if the stage-1
translation tables are unmapped at stage-2. The only option at that
point is falling back to a software table walker that potentially faults
in the missing translation tables.

> +
> +	par = read_sysreg(par_el1);
> +	if (!(par & 1)) {
> +		tr->valid = true;
> +		tr->physical_address = par_to_ipa(par, gva);

What about permissions besides RW?

> +int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu, struct kvm_translation *tr)
> +{
> +	if (has_vhe())
> +		return kvm_translate_vhe(vcpu, tr);
> +	else
> +		return kvm_translate_nvhe(vcpu, tr);
>  }

Yet another interesting consideration around this entire infrastructure
is the guest's view of the translation that the VMM will now use. KVM uses a
pseudo-TLB for the guest's VNCR page and maintains it just like a literal
TLB.

How would the guest invalidate the translation fetched by the VMM when
unmapping/remapping the VA? Doesn't the stage-1 PTW need to set the
Access flag as this amounts to a TLB fill?

Understanding what it is you're trying to accomplish would be quite
helpful. I'm concerned this trivializes some of the gory details of
participating in the guest's virtual memory.

Thanks,
Oliver

