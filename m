Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8607CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Py+hXu1RT6jBoYKS4W+9qHiEMV6Utt4FtLuxKrveNs=; b=WqVdqIirtxeXDBQ6JO5xn47tRg
	yKywzhhJCs6V0EsBZ9PDkjyNSXDcEaZasl/LwU4q1BOTtJ4cOODzJ4lquODS47oOF3llu/N2ygbKy
	34vyLkSc4Qb1SqFNURVXLPSV2LJKPzpB0Sp5I3cnumSSMuxlV71ynjhXh09dTWTzxrkp5Z/NG7Ao0
	k0Pw4E8OWyMchl8VzhHjq2YEpEfdnH/6jVN2f9HnWr86gBEQhJ07pbm13Rj7nHzn3NPm8sNHaXHw3
	xc8EwPC1kNWmQwiC3l3Tt9xKGoK/6bzaxtv8pR24t547HXkod14YnmLp7u8Bi3rzgXsCXlW5gkaum
	f8fK2NRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU87Z-0000000BhmM-04eT;
	Mon, 01 Jun 2026 19:16:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU87W-0000000Bhlz-2AiR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE5B5438A5;
	Mon,  1 Jun 2026 19:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D951F00893;
	Mon,  1 Jun 2026 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780341377;
	bh=3Py+hXu1RT6jBoYKS4W+9qHiEMV6Utt4FtLuxKrveNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=erERrhzwbrBFn4Q6+juSPsSdsefRY/T0KH39K7jN9NHt1RIMTWFGqzmulVPhAbAzm
	 hZ/yPZivbJgaJwBPKGoqxmAm2F6eFiW0XBaciJfyRMiVF5+SkgJZpY2+9YsJbbCqoo
	 TiuiKT5L/ImCZM/GNai0IjM25SGU/o/1IwMOCpxjqWQW6cDnjgb74FfidHZ95Zf6hb
	 skqPiA91AoESwFEWnujFugJECfLJqKM5U93A/v+M9h58S5w3mUWEFsj/TwrX19GxNo
	 XG0DLAJ7Yzd4KsiVeBgooMeodrhIA+e1gup3TTSdpM/BRokj3De0SN45Cb+WZomn93
	 4RJzKRCwrHKMg==
Date: Mon, 1 Jun 2026 12:16:16 -0700
From: Oliver Upton <oupton@kernel.org>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Flush HCR_EL2.VSE to deliver SErrors to pKVM
 guests
Message-ID: <ah3agGh1s61HKiPG@kernel.org>
References: <20260531154548.1505799-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531154548.1505799-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_121618_578009_2D238A47 
X-CRM114-Status: GOOD (  19.62  )
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

On Sun, May 31, 2026 at 04:45:48PM +0100, tabba@google.com wrote:
> With pKVM enabled, the host injects a virtual SError by setting
> HCR_EL2.VSE on its vCPU copy, but flush_hyp_vcpu() only flows TWI/TWE
> into the hyp vCPU that runs, so VSE never reaches it and a deferred
> (masked) SError is never delivered. VSE is a host-owned injection
> control, not a trap-configuration bit, so restricting the host's
> trap-register values should not have dropped it. Flow it on entry;
> sync_hyp_vcpu() already copies hcr_el2 back, so delivery is reflected
> to the host.

Might be worth mentioning that flush_hyp_vcpu() also forwards VSESR_EL2
from the host since that bit is _just_ out of context of this diff :)

> Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
> Reported-by: Sashiko (local):gemini-3.1-pro
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
> Not an urgent fix. I should stop running Sashiko...
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 06db299c37a8..9e4a20df6409 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -129,9 +129,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
>  
>  	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
> -	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> +	/*
> +	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> +	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> +	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> +	 */
> +	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
>  	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> -						 (HCR_TWI | HCR_TWE);
> +						 (HCR_TWI | HCR_TWE | HCR_VSE);
>  
>  	hyp_vcpu->vcpu.arch.iflags	= host_vcpu->arch.iflags;
>  
> -- 
> 2.54.0.929.g9b7fa37559-goog
> 

