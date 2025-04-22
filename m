Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m24ONKhY7eYbb6VAMOv0y9Q6itfbNHWCMNaUbFsOma8=; b=NBkssBlW2p9uWtI57jOV3TK1a7
	CP9RRCNOI5KQUkB7GL4vgggt6462okN5Jt6XBeg7Z+nkAMjU0dCyIgnRVzZeZ3uBwHJilt303gsBP
	A25FL1oD5dSQAZpTEkHHNePxXnScpdzCmKwQVn2eR5O6I053+vDuKaZt8wEXyCoMRw6IphjiQcXNw
	DYJigOBZbN0W85RfjbwtFeiJx9O8BpjOVnvmJaTvUaadeDFTOpa3bVv6qtfX9SmrMNOf3MegXGsaj
	atAJ3Db3i1u96b242BIyh6l9MhXRcs0bKCACPju5ZOo7gPpZqSK5OSzyuzPofMM6Im3Bt5v9xPaZc
	4NPNIrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GMs-00000007smy-1hBm;
	Tue, 22 Apr 2025 16:21:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E0w-00000007N4u-1au9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:50:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CD1E152B;
	Tue, 22 Apr 2025 06:50:11 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0A03F5A1;
	Tue, 22 Apr 2025 06:50:14 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:50:08 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Teach address translation about access
 faults
Message-ID: <20250422135008.GA747658@e124191.cambridge.arm.com>
References: <20250422122612.2675672-1-maz@kernel.org>
 <20250422122612.2675672-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422122612.2675672-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065018_464038_0A85271B 
X-CRM114-Status: GOOD (  22.73  )
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

On Tue, Apr 22, 2025 at 01:26:11PM +0100, Marc Zyngier wrote:
> It appears that our S1 PTW is completely oblivious of access faults.
> Teach the S1 translation code about it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/at.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 3a4568e2de910..c40583edebc4f 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -456,6 +456,11 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  	if (check_output_size(desc & GENMASK(47, va_bottom), wi))
>  		goto addrsz;
>  
> +	if (!(desc & PTE_AF)) {
> +		fail_s1_walk(wr, ESR_ELx_FSC_ACCESS_L(level), false);
> +		return -EACCES;
> +	}
> +
>  	va_bottom += contiguous_bit_shift(desc, wi, level);
>  
>  	wr->failed = false;
> @@ -1209,7 +1214,8 @@ static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>   * If the translation is unsuccessful, the value may only contain
>   * PAR_EL1.F, and cannot be taken at face value. It isn't an
>   * indication of the translation having failed, only that the fast
> - * path did not succeed, *unless* it indicates a S1 permission fault.
> + * path did not succeed, *unless* it indicates a S1 permission or
> + * access fault.
>   */
>  static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  {
> @@ -1312,19 +1318,29 @@ static bool par_check_s1_perm_fault(u64 par)
>  		 !(par & SYS_PAR_EL1_S));
>  }
>  
> +static bool par_check_s1_access_fault(u64 par)
> +{
> +	u8 fst = FIELD_GET(SYS_PAR_EL1_FST, par);
> +
> +	return  ((fst & ESR_ELx_FSC_TYPE) == ESR_ELx_FSC_ACCESS &&
> +		 !(par & SYS_PAR_EL1_S));
> +}
> +
>  void __kvm_at_s1e01(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  {
>  	u64 par = __kvm_at_s1e01_fast(vcpu, op, vaddr);
>  
>  	/*
> -	 * If PAR_EL1 reports that AT failed on a S1 permission fault, we
> -	 * know for sure that the PTW was able to walk the S1 tables and
> -	 * there's nothing else to do.
> +	 * If PAR_EL1 reports that AT failed on a S1 permission or access
> +	 * fault, we know for sure that the PTW was able to walk the S1
> +	 * tables and there's nothing else to do.
>  	 *
>  	 * If AT failed for any other reason, then we must walk the guest S1
>  	 * to emulate the instruction.
>  	 */
> -	if ((par & SYS_PAR_EL1_F) && !par_check_s1_perm_fault(par))
> +	if ((par & SYS_PAR_EL1_F) &&
> +	    !par_check_s1_perm_fault(par) &&
> +	    !par_check_s1_access_fault(par))
>  		par = handle_at_slow(vcpu, op, vaddr);
>  
>  	vcpu_write_sys_reg(vcpu, par, PAR_EL1);

Reviewed-by: Joey Gouly <joey.gouly@arm.com>


