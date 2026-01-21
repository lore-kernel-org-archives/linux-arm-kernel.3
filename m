Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1012C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=179vDKILIK9dUbmchpZJWt5jQoh6AaL5+pyZm7mUuHg=; b=XlkFd7a4fSdvjZr8iO4+kEij/x
	ORejsG8pX5XDBhWDwhcLyzBMTOWJXWWxLgILRmuuHJ9UZTo8z6IyxaMOHCwQxq9bSXIU0tpgNx64o
	ph5BTF40Zsv+xvO2Fb+NSdDb0c1Uy/zh5MrAAM6Hc3bbCdkXX2AkkRF51L3IhvA39hm0iR7HfTnPw
	F2qNzEoADJmR/ohv2wYCLTh/LQhXCiyZkdUowOtguku22/Sg7mH2CnnVMUHzs5dlpzAyC4kXPI87K
	ojgN9BDPRnH5UngOaU09fVBtptZY9Skiwat5/glyoXGAIQ4t2/mjGUxr1FReBgeXnUilIw6W2YBpt
	+MGYwTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viazx-00000005nBL-03XR;
	Wed, 21 Jan 2026 16:24:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viazu-00000005n8a-48kH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:24:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ACDE1476;
	Wed, 21 Jan 2026 08:23:39 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6D23F694;
	Wed, 21 Jan 2026 08:23:44 -0800 (PST)
Date: Wed, 21 Jan 2026 16:23:39 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 0/6] KVM: arm64: ... and FWB for all
Message-ID: <20260121162339.GA1846642@e124191.cambridge.arm.com>
References: <20260119105651.255693-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119105651.255693-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_082359_142420_11801642 
X-CRM114-Status: GOOD (  20.62  )
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

After a crash course in FWB,

On Mon, Jan 19, 2026 at 10:56:45AM +0000, Marc Zyngier wrote:
> [Yes, you can tell what I was listening to]
> 
> Today, running in protected mode puts the host under it's own S2 with
> FWB=0, even if the rest of the guests are running with FWB=1. The
> rationale for this special-casing of the host is that we want the
> combined attributes to actually reflect the ones exposed by S1.
> 
> We therefore use NormalCacheable (which is the weakest memory type) as
> the default attributes at S2 so that S1 can only strengthen the final
> memory type.
> 
> But there is no reason why we cannot achieve the same effect with
> FWB. We normally use FWB to enforce cacheable memory from S2,
> irrespective of S1. But it is possible to configure the S2 attributes
> as "pass-through", so that the S1 attributes are always used.
> 
> This small series implements that change, adding a flag that actually
> describes what we are trying to do (instead of the NOFWB flag which is
> pretty obscure), and fixes an interesting gotcha with CMOs.
> Interestingly, CMOs never actually worked with NOFWB on an FWB-aware
> platform...

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey
> 
> Patches on top of 6.19-rc5.
> 
> Marc Zyngier (6):
>   arm64: Add MT_S2{,_FWB}_AS_S1 encodings
>   KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
>   KVM: arm64: Make stage2_pte_cacheable() return false when S2_AS_S1 is
>     set
>   KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
>   KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
>   KVM: arm64: Simplify PAGE_S2_MEMATTR
> 
>  arch/arm64/include/asm/kvm_pgtable.h  |  7 +++---
>  arch/arm64/include/asm/memory.h       | 11 ++++++---
>  arch/arm64/include/asm/pgtable-prot.h |  4 ++--
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 +++-
>  arch/arm64/kvm/hyp/pgtable.c          | 32 +++++++++++++++++++--------
>  5 files changed, 39 insertions(+), 19 deletions(-)
> 
> -- 
> 2.47.3
> 

