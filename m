Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2655EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI3bP1pJP5lXGvuH/tu6LPGzy5TtHs12zQN3J0e7an8=; b=ksX/pedJSGBpFMnhFKfR8/nnCT
	xAKw/lvd+y9R+g9ykYrOGT3dTnLZJIBuEtDwiPQU3TrgToapSmUz6V1kk5mHtjIN+jiQtSY8Uf925
	HJmGuujKVd63cAD6pNKOE/gHmlZ6VZue39IeyDMPh8bvzZwRRebUptx4anGItM3FnSCPbkTWKvScv
	Q7FEA2YsCMTzy15fbrgvPzrB43nWuruPjXVIT76xmatPf2SZFkY72aVfbUxZ90ll2jvoTpGX0MLUH
	nrqWjuYPeHrI8/bG7ChE3Amwj+0JheHtqa7r9wBAVS3/VH48JBoVRQ3jGJhxxEw0NPe9JUXQXqYNT
	9S3tC6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8sD-0000000Dwhi-3r1O;
	Fri, 25 Sep 2026 16:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8sB-0000000DwgG-1Qsj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:34:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1EA169C;
	Fri, 25 Sep 2026 09:34:01 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135E43F86F;
	Fri, 25 Sep 2026 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790354044; bh=z1MMBW/k+eb49Qcp/2rEAdku+hrMenCSSpsg1SGiR6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAfsBFPJw7gPQ3SEOl4sjuq+C4NIG+QvCaZyg5xh4qIysSIbcRSEWQXPZRw7Fochj
	 QgIzag8v8ZZWI5/+gZdT244vkTar1eEHFB7IiJDATTpjYHuxBDiRhIAozS9FgV9+vC
	 DxiQY9F6qIxqeuSBpJwiOlUSIdCnvf77/QH7Af/Q=
Date: Fri, 25 Sep 2026 17:33:47 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Fuad Tabba <tabba@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS
 from vEL1
Message-ID: <qn2q3e3hagurkljew23gnpbf5xg5dwagzzujw4z5c7vutyic3x@fvhragb3jlz6>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
 <20260925090619.852995-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925090619.852995-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_093407_674023_ABE665C4 
X-CRM114-Status: GOOD (  19.31  )
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

On Fri, Sep 25, 2026 at 10:06:16AM +0100, Fuad Tabba wrote:
> A VMM can trigger the WARN_ON(!vcpu_is_el2()) in handle_tlbi_el1() on a
> CPU with FEAT_EVT2 and FEAT_TLBIOS but no FEAT_FGT, by setting
> ID_AA64ISAR0_EL1.TLB to NI and having the guest execute TLBI VMALLE1OS.
> 
> Without FGT, HCR_EL2.TTLBOS traps the instruction. KVM records no FGT
> trap information on such a host, so triage_sysreg_trap() doesn't UNDEF
> it. The instruction reaches handle_tlbi_el1(), which warns before
> checking whether the guest supports it.
> 
> Check support before the warning.
> 
> Fixes: 0cb8aae226768 ("KVM: arm64: nv: Add handling of outer-shareable TLBI operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Looks correct to me:

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d7..0ce29ce678b08 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -4257,6 +4257,10 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  {
>  	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
>  
> +	/* Without FGT, HCR_EL2.TTLBOS also traps a hidden TLBI OS from vEL1 */
> +	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
> +		return undef_access(vcpu, p, r);
> +
>  	/*
>  	 * If we're here, this is because we've trapped on a EL1 TLBI
>  	 * instruction that affects the EL1 translation regime while
> @@ -4279,9 +4283,6 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  
>  	WARN_ON(!vcpu_is_el2(vcpu));
>  
> -	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
> -		return undef_access(vcpu, p, r);
> -
>  	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)) {
>  		kvm_handle_s1e2_tlbi(vcpu, sys_encoding, p->regval);
>  		return true;
> -- 
> 2.39.5
> 

