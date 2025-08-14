Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29B1CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZL3XpVoY04RyrQLqVr/nyuPpFoMmc9mWgN5zKAgrsk=; b=XIbPCjUCSuvr1lzzBQ9XOIsi2J
	tEEfWqgKL3LyzFLEo+Md6WpWieMgfRdzRGxEr/O3HyGOQkuzAEpsqwUQklkqPuUay6fJiOtRPXmik
	yWJ4YbcRkn2AKQ/trSjtvTRmCatVlES9q2s1cSzKPvAv3LzciQQ6qCLhTFNCoqMbwdz563wHKET/5
	pM2Q6HFTMpnuW0HZCjVM1xJDIMAUiLnXLqZR31u95wT0fkRrrnuLA2FbAI7B0jH6V3OM8Gm2ggP7w
	ign0elcee/ThRjTs189d6U251Isfk1e8n4Wj4EI2vbLNy3+3GV6YZDxcKcAJPVSZKXByeqX4KDaTu
	FsnDusVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ5p-0000000FnCF-2oJa;
	Thu, 14 Aug 2025 05:01:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ3F-0000000FmqO-2ttC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 04:58:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206DA1691;
	Wed, 13 Aug 2025 21:58:47 -0700 (PDT)
Received: from [10.163.65.190] (unknown [10.163.65.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F0D3F63F;
	Wed, 13 Aug 2025 21:58:50 -0700 (PDT)
Message-ID: <8683495e-da79-4746-b6da-52164cdc031d@arm.com>
Date: Thu, 14 Aug 2025 10:28:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: arm64: ptdump: Don't test PTE_VALID alongside
 other attributes
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Sebastian Ene <sebastianene@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_215857_782416_A1C1370E 
X-CRM114-Status: GOOD (  17.55  )
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



On 09/08/25 7:23 PM, Wei-Lin Chang wrote:
> The attribute masks and test values in the ptdump code are meant for
> individual attributes, however for stage-2 ptdump we included PTE_VALID
> while testing for R, W, X, and AF. This led to some confusion and the
> flipped output for the executable attribute.
> 
> Remove PTE_VALID from all attribute masks and values so that each test
> matches only the relevant bits.
> 
> Additionally, the executable attribute printing is updated to align with
> stage-1 ptdump, printing "NX" for non-executable regions and "x " for
> executable ones.
> 
> Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> ---
> Tested on QEMU.
> 
> Changes in v2, thanks to those listed in the Suggested-by tags:
>   - remove PTE_VALID from .mask and .val
>   - make executable attribute output format identical to stage-1 ptdump
>   - Link to v1: https://lore.kernel.org/kvmarm/20250802104021.3076621-1-r09922117@csie.ntu.edu.tw/
> ---
>  arch/arm64/kvm/ptdump.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 098416d7e5c25..dc5acfb00af91 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -32,23 +32,23 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
>  		.set	= " ",
>  		.clear	= "F",
>  	}, {
> -		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | PTE_VALID,
> -		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | PTE_VALID,
> +		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
> +		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
>  		.set	= "R",
>  		.clear	= " ",
>  	}, {
> -		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | PTE_VALID,
> -		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | PTE_VALID,
> +		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
> +		.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
>  		.set	= "W",
>  		.clear	= " ",
>  	}, {
> -		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
> -		.val	= PTE_VALID,
> -		.set	= " ",
> -		.clear	= "X",
> +		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
> +		.val	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
> +		.set	= "NX",
> +		.clear	= "x ",
>  	}, {
> -		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> -		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
> +		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
> +		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
>  		.set	= "AF",
>  		.clear	= "  ",
>  	}, {

LGTM and consistent with Stage-1.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

