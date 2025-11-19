Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1015CF2564
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyt+jdqSlzQ8Z6mptZMOEJSdjjs557Q521PYU9uMh+I=; b=HLRpHwCN2++z0p5IiQquMiXMv6
	hVpv1/dRK1e6/MzNhgZhl92cxP99qjvnWLwpwUgE2XpsjQalbGL998stQkoY4ySJDPoUds3Y5+O8t
	o2k83VZCV9SF5mXTHDyoQ1fTMej5dYJ3BxNOhcdk1Pwkm37jLKJs2A/PWIHUeMsaRtQEzgIciTedL
	uoYp66ce7irSealWb17BEBgYXTny3KiQoCG/OxqJETArG9MPjNq4QJko/FJOpVJUp1S6AeJPxy2/b
	EavdKmuzFZ51wWQoBGTGhgwGGILPgHOxcBeVoNV3t8dy5phFxPDyQn0L25NEaQ0aXfRvpnemUJd0D
	Pp46ZpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWfA-00000001KdS-2rCi;
	Wed, 19 Nov 2025 01:07:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWf7-00000001Kd3-2rqm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 01:07:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1F72B;
	Tue, 18 Nov 2025 17:06:58 -0800 (PST)
Received: from [10.163.45.240] (unknown [10.163.45.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDBAD3F66E;
	Tue, 18 Nov 2025 17:07:03 -0800 (PST)
Message-ID: <80c7af9b-ac6a-42fe-981f-c4b6f2cc9d7f@arm.com>
Date: Wed, 19 Nov 2025 06:37:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64/mm: TTBRx_EL1 related changes
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
 <a1306c3a-5d2e-48e0-aaa8-4e19ea81bef3@arm.com> <aRb8ezhQd0c0jp9G@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aRb8ezhQd0c0jp9G@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_170709_802269_8BBD90B5 
X-CRM114-Status: GOOD (  27.67  )
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

On 14/11/25 3:25 PM, Mark Rutland wrote:
> On Thu, Nov 13, 2025 at 02:48:44PM +0530, Anshuman Khandual wrote:
>> On 03/11/25 10:56 AM, Anshuman Khandual wrote:
>>> This series contains some TTBRx_EL1 related changes, aimed at standardizing
>>> TTBRx_EL1 register field accesses via tools sysreg format and also explains
>>> 52 PA specific handling methods via a new macro along with in code comments
>>>
>>> This series applies on v6.18-rc4
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>> Anshuman Khandual (6):
>>>   arm64/mm: Directly use TTBRx_EL1_ASID_MASK
>>>   arm64/mm: Directly use TTBRx_EL1_CnP
>>>   arm64/mm: Represent TTBR_BADDR_MASK_52 with TTBRx_EL1_BADDR_MASK
>>>   arm64/mm: Ensure correct 48 bit PA gets into TTBRx_EL1
>>>   arm64/mm: Describe 52 PA folding into TTBRx_EL1
>>>   arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
>>>
>>>  arch/arm64/include/asm/asm-uaccess.h   |  2 +-
>>>  arch/arm64/include/asm/assembler.h     |  3 ++-
>>>  arch/arm64/include/asm/mmu_context.h   |  2 +-
>>>  arch/arm64/include/asm/pgtable-hwdef.h | 23 ++++++++++++++++++++---
>>>  arch/arm64/include/asm/pgtable.h       |  5 +++--
>>>  arch/arm64/include/asm/uaccess.h       |  6 +++---
>>>  arch/arm64/kernel/entry.S              |  2 +-
>>>  arch/arm64/kernel/mte.c                |  4 ++--
>>>  arch/arm64/mm/context.c                |  8 ++++----
>>>  arch/arm64/mm/mmu.c                    |  2 +-
>>>  10 files changed, 38 insertions(+), 19 deletions(-)
>>
>> Gentle ping. Beside [PATCH 4/6] (which can be dropped as indicated by Mark)
>> any concerns regarding reset of these changes here ?
> 
> Overall I don;t think this series actually improves anything; it just
> shuffles things around, and leaves conversions half-done. I don't think
> we must take this as-is.
> 
> For patches 1 and 2, the changes would be fine if we were also getting
> rid of TTBR_ASID_MASK and TTBR_CNP_BIT, but we don't, apparently because
> those are still used by KVM. It feels like those two patches should be
> split into a separate series that *only* moves code over to generate
> sysreg definitions, also updates KVM, and removes the unused legacy
> definitions.

Sure thing. I will spin out a separate series as suggested.
> 
> For patch 3, I think the change makes the code harder to read, and
> harder to understand, because there's no context to explain why we're
> masking out a single bit. I don't think this is actually an improvement.

We are masking out a single bit here as per the ARM DDI 0487
L.B in the page number D24-8540.

------------------------------------------------------------
When TTBR0_EL1.BADDR represents a 52-bit addresses, all of the following apply:
• Bits A[51:48] of the stage 1 translation table base address bits are in register bits[5:2].
• Register bit[1] is RES0.
• The smallest permitted value of x is 6.
• When x>6, register bits[(x-1):6] are RES0.
------------------------------------------------------------

Is not deriving the applicable address mask in the 52 bit PA
context from the original base address mask better than hard
coded mask GENMASK_ULL(47, 2) ? Just wondering - would it be
better to add some more context in the comment above it ?
> See below for related notes for patch 5.
> 
> For patch 4, as above, I think the patch can be dropped.

Agreed.
> 
> For patch 5, this could be OK, but we should define
> TTBR_BADDR_52_PA_PIVOT as (51 - 5) and avoid the magic number entirely.

Agreed.
> IMO it'd be nicer to just extract and re-insert the bits; I think our
> current logic is unnecessarily micro-optimized so that this can be
> implemented with a shifted-OR + AND, whereas I think we could burn a
> temporary register and use BFX + BFI + AND, and that would be clearer as
> to *which* bits we're trying to move.

Will that only be applicable for phys_to_ttbr()'s assembly variant
and the macro definition in <asm/pgtable.h> which does the right
shifted OR followed by AND still remains unchanged ?
> 
> For patch 6, I guess this is fine; I don't have a strong feeling either
> way.

IMHO it will be great to have this patch included.

