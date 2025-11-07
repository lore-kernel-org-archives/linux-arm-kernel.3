Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l/4R9AeIFjFLg4UFEUqy71Ghx+BsyN2XmcR0yutaM0=; b=fxlcvFvttLertfFaKRDs0dYeWB
	7CUeqyi2gLne43lTWrssSD4d9URdS0J02TJuqawYM34g8BrrTFRiH26qhp/tvJamBtcgzp9Ad8VYF
	2sYWdJ180yAOLCiAbrjcSHMV/tv4DJEM75VJD4P73x6vEd4JeHgiUAvgdDLWUUxQgZjMb/TJvEDA6
	rBYA19h3EQQqMHwHLz3iBWuRtYpc5DbNuEadgZzO91ahnj0kmtb30jTMLxoM/uJSBJYuxINzV/Qo0
	U8byGOxcOcj/HOaGq+HxkIWI2ktBIIlGQ+8X2WrBj4Xku/SI7ys4e34z+gAKLD+G9rOPg4Oklh8aI
	gF6mXuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJMU-0000000H2aJ-2osD;
	Fri, 07 Nov 2025 10:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJMS-0000000H2ZU-0GJv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:06:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C75E14BF;
	Fri,  7 Nov 2025 02:06:18 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 496A53F66E;
	Fri,  7 Nov 2025 02:06:25 -0800 (PST)
Message-ID: <264b9f2d-5fca-4fda-a0ce-1b0223906560@arm.com>
Date: Fri, 7 Nov 2025 10:06:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fix handling of ID_PFR1_EL1.GIC
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20251030122707.2033690-1-maz@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251030122707.2033690-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_020628_153348_DABE4ABA 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Marc

On 30/10/2025 12:27, Marc Zyngier wrote:
> Peter reported[0] that restoring a GICv2 VM fails badly, and correctly
> points out that ID_PFR1_EL1.GIC isn't writable, while its 64bit
> equivalent is. I broke that in 6.12.
> 
> The other thing is that fixing the ID regs at runtime isn't great.
> specially when we could adjust them at the point where the GIC gets
> created.
> 
> This small series aims at fixing these issues. I've only tagged the
> first one as a stable candidate. 

But, all 3 patches have the same Fixes tag, was that intentional ?

Otherwise looks good.

Suzuki


With these fixes, I can happily



> save/restore a GICv2 VM (both 32 and 64bit) on my trusty Synquacer.
> 
> * From v1 [1]:
> 
>    - Make all 32bit ID regs writable
> 
>    - Use official accessors to manipulate ID regs
> 
>    - Rebased on 6.18-rc3
> 
> [0] https://lore.kernel.org/r/CAFEAcA8TpQduexT=8rdRYC=yxm_073COjzgWJAvc26_T+-F5vA@mail.gmail.com
> [3] https://lore.kernel.org/r/20251013083207.518998-1-maz@kernel.org
> 
> Marc Zyngier (3):
>    KVM: arm64: Make all 32bit ID registers fully writable
>    KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
>    KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace
>      irqchip
> 
>   arch/arm64/kvm/sys_regs.c       | 71 ++++++++++++++++++---------------
>   arch/arm64/kvm/vgic/vgic-init.c | 14 ++++++-
>   2 files changed, 50 insertions(+), 35 deletions(-)
> 


