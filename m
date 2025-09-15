Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD07CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov854NrwUvH+oEreURQpPtuZXJiEgyq3gAFGLaM0O2A=; b=v8ACbKd2rMHGu9yxh7vF3Tlye+
	wpeOQggRuw+p0VEWqby+Gt12jtU0NXVQqpwVJyFiDVElGunChuyhnftY8NhBDJs54XlAOcKcNyL1X
	yzOlFFZ10Mbcp8NzmGFtfJKhBxQbvUJ+gsl6w1e+/XA7n7HU9jYIFHGLu4/EP9mgiSUMAlD/Hq0+D
	KgKZUPL9WL2XnHsMEqL+BZCeg4efCgQCqnD4ehttn5Cw7DoblgrQX9btLiUSSbiZ/UXIIlLXZA33i
	PG0CHbFNV+0CroGhUe5OsdsYLI/U/ZMACLkLFzlN96H03AncL7YM9n8Z8WgV63gT9KbULkRYXXI0f
	dy0Ohumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxytJ-00000002Z7x-1hYW;
	Mon, 15 Sep 2025 02:24:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxytF-00000002Z3m-0eEx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 02:24:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D2BF1424;
	Sun, 14 Sep 2025 19:24:14 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82393F66E;
	Sun, 14 Sep 2025 19:24:19 -0700 (PDT)
Message-ID: <e1d9c9a9-7ab0-44e0-b293-7655f18638b5@arm.com>
Date: Mon, 15 Sep 2025 07:54:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 0/2] arm64/sysreg: Clean up TCR_EL1 field macros
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250907123000.414181-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_192425_289319_8FE84507 
X-CRM114-Status: GOOD (  13.13  )
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



On 07/09/25 5:59 PM, Anshuman Khandual wrote:
> Currently TCR_EL1 field macros are sprinkled across the arm64 platform code
> including KVM implementation. Clean these up via updating required register
> filed definitions in tools sysreg format and then subsequently doing all
> necessary replacements. All required TCR_XXX macros have been moved from
> (asm/pgtable-hwdef.h) into KVM header (asm/kvm_arm.h) for their continued
> usage in KVM.
> 
> The cleanup does not cause any functional change.
> 
> This applies on v6.17-rc4

Gentle ping.

Any updates on this ?
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: kvmarm@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> Changes in V4:
> 
> - Dropped all unused TCR_XXX macros while moving into KVM header
> 
> Changes in V3:
> 
> https://lore.kernel.org/all/20250901072037.743380-1-anshuman.khandual@arm.com/
> 
> - KVM TCR_XXX flags are expressed via TCR_EL1_XXX flags per Marc
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20250829060215.1086792-1-anshuman.khandual@arm.com/
> 
> - Fixed ARM ARM version from 7.B to L.B
> - Changed UnsignedEnum into Enum per Mark
> - Dropped all TCR_EL1 replacements from KVM code
> - Moved existing TCR_XXX macros from (asm/pgtable-hwdef.h) into KVM header
>   (asm/kvm_arm.h) for their continued usage
> - Dropped patches 3 and 4 which could be done subsequently
> 
> Changes in V1:
> 
> https://lore.kernel.org/linux-arm-kernel/20250818045759.672408-1-anshuman.khandual@arm.com/
> 
> 
> Anshuman Khandual (2):
>   arm64/sysreg: Update TCR_EL1 register
>   arm64/sysreg: Replace TCR_EL1 field macros
> 
>  arch/arm64/include/asm/assembler.h     |  6 +-
>  arch/arm64/include/asm/cputype.h       |  2 +-
>  arch/arm64/include/asm/kvm_arm.h       | 43 +++++++++++
>  arch/arm64/include/asm/mmu_context.h   |  4 +-
>  arch/arm64/include/asm/pgtable-hwdef.h | 98 +-------------------------
>  arch/arm64/include/asm/pgtable-prot.h  |  2 +-
>  arch/arm64/include/asm/sysreg.h        |  2 -
>  arch/arm64/kernel/cpufeature.c         |  4 +-
>  arch/arm64/kernel/pi/map_kernel.c      |  8 +--
>  arch/arm64/kernel/vmcore_info.c        |  2 +-
>  arch/arm64/mm/proc.S                   | 36 ++++++----
>  arch/arm64/tools/sysreg                | 52 +++++++++++---
>  tools/arch/arm64/include/asm/cputype.h |  2 +-
>  13 files changed, 127 insertions(+), 134 deletions(-)
> 


