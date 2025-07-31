Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8005C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev5rHqALN6A/x3FOMzKTRiRLrvLAYmOKOf4VhtcyGo0=; b=RaT9zzAFXfpLK1LBQ+HIjyrGIs
	hZC+KE6f4Do4gXTZhcj8rlmBxAX3ucjpHTeHqEkIqKBtBRJgQl7VWD7r/LUTHIbhA+fOmoDKXm2El
	FZNuO0bFZTdMscVmM1u3HawZhA8+OhCwGCmbrt0yFVv1Y63kaAtVFSRxvIMkv4Rqhaf8OaMy+w4ge
	MsiHC9r+mg1ndsBZc1XKFcR89RKUU5yN+QUTeVYWgZhMhNngCQuG+lBgtLCCVGnOAuNlNdq8nnLeP
	qYYP+78uwcCgaUmM2nKsu/8qLo6hO5TGweakGbr51kdFMeukd5CnlxhdckbTS9/tPUX53EarPa6nG
	wdPQ+JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQFM-00000003LCV-34Z7;
	Thu, 31 Jul 2025 10:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQCh-00000003KzC-2EeT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 10:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBFE71D13;
	Thu, 31 Jul 2025 03:07:52 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77DC03F673;
	Thu, 31 Jul 2025 03:07:59 -0700 (PDT)
Date: Thu, 31 Jul 2025 11:07:54 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Properly check ESR_EL2.VNCR on taking a
 VNCR_EL2 related fault
Message-ID: <20250731100754.GA1470634@e124191.cambridge.arm.com>
References: <20250730101828.1168707-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730101828.1168707-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_030803_617242_75E203AE 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, Jul 30, 2025 at 11:18:28AM +0100, Marc Zyngier wrote:
> Instead of checking for the ESR_EL2.VNCR bit being set (the only case
> we should be here), we are actually testing random bits in ESR_EL2.DFSC.
> 
> 13 obviously being a lucky number, it matches both permission and
> translation fault status codes, which explains why we never saw it
> failing. This was found by inspection, while reviewing a vaguely
> related patch.
> 
> Whilst we're at it, turn the BUG_ON() into a WARN_ON_ONCE(), as
> exploding here is just silly.
> 
> Fixes: 069a05e535496 ("KVM: arm64: nv: Handle VNCR_EL2-triggered faults")
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Good spot!

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index c6a4e8f384ac6..046dcfc8bf76b 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1287,7 +1287,7 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
>  	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
>  	u64 esr = kvm_vcpu_get_esr(vcpu);
>  
> -	BUG_ON(!(esr & ESR_ELx_VNCR_SHIFT));
> +	WARN_ON_ONCE(!(esr & ESR_ELx_VNCR));
>  
>  	if (esr_fsc_is_permission_fault(esr)) {
>  		inject_vncr_perm(vcpu);
> -- 
> 2.39.2
> 

