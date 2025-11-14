Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB98CE7AA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TEdvqZK5y1G8bHraWXh/YKhPgo+TLF6YFHcvls39nk=; b=bI4VmfKmpiuL8ENttLd8juDJ5R
	Z4EkzRkSKqxYbpVFGizPP27Wyvztvx/PZmMT2ebsl9c0RM93KrITXaI88o0Vm9cTRkhwiZI/82y9N
	KMfs2DPme18ionf7SBjDGrdljDccDBJgPwugaif9P9VMPTipYhSl4YJu5QRlL2X62iMQTRKEeCdk5
	Al/j/HYB27+gs4g/aezfcDD04HG8Rit7vrsx3sG/2nVCQ18k80Jz3T7xztFyUN7VEBgjk33I+jIIP
	S+vGY84pGhc4wkVXYZnk03y/05LIO+pPfDNwMkhfNCrX/srwxxhGgErwuQ3SrmIIPq/9sYbDgQWz2
	ki84vmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqWV-0000000BxVj-3sxj;
	Fri, 14 Nov 2025 09:55:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqWS-0000000BxUZ-3Cuc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:55:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 196D51063;
	Fri, 14 Nov 2025 01:55:06 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DFE53F5A1;
	Fri, 14 Nov 2025 01:55:12 -0800 (PST)
Date: Fri, 14 Nov 2025 09:55:07 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64/mm: TTBRx_EL1 related changes
Message-ID: <aRb8ezhQd0c0jp9G@J2N7QTR9R3>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
 <a1306c3a-5d2e-48e0-aaa8-4e19ea81bef3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1306c3a-5d2e-48e0-aaa8-4e19ea81bef3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_015516_932161_B37DBDBF 
X-CRM114-Status: GOOD (  21.20  )
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

On Thu, Nov 13, 2025 at 02:48:44PM +0530, Anshuman Khandual wrote:
> On 03/11/25 10:56 AM, Anshuman Khandual wrote:
> > This series contains some TTBRx_EL1 related changes, aimed at standardizing
> > TTBRx_EL1 register field accesses via tools sysreg format and also explains
> > 52 PA specific handling methods via a new macro along with in code comments
> > 
> > This series applies on v6.18-rc4
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > 
> > Anshuman Khandual (6):
> >   arm64/mm: Directly use TTBRx_EL1_ASID_MASK
> >   arm64/mm: Directly use TTBRx_EL1_CnP
> >   arm64/mm: Represent TTBR_BADDR_MASK_52 with TTBRx_EL1_BADDR_MASK
> >   arm64/mm: Ensure correct 48 bit PA gets into TTBRx_EL1
> >   arm64/mm: Describe 52 PA folding into TTBRx_EL1
> >   arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
> > 
> >  arch/arm64/include/asm/asm-uaccess.h   |  2 +-
> >  arch/arm64/include/asm/assembler.h     |  3 ++-
> >  arch/arm64/include/asm/mmu_context.h   |  2 +-
> >  arch/arm64/include/asm/pgtable-hwdef.h | 23 ++++++++++++++++++++---
> >  arch/arm64/include/asm/pgtable.h       |  5 +++--
> >  arch/arm64/include/asm/uaccess.h       |  6 +++---
> >  arch/arm64/kernel/entry.S              |  2 +-
> >  arch/arm64/kernel/mte.c                |  4 ++--
> >  arch/arm64/mm/context.c                |  8 ++++----
> >  arch/arm64/mm/mmu.c                    |  2 +-
> >  10 files changed, 38 insertions(+), 19 deletions(-)
> 
> Gentle ping. Beside [PATCH 4/6] (which can be dropped as indicated by Mark)
> any concerns regarding reset of these changes here ?

Overall I don;t think this series actually improves anything; it just
shuffles things around, and leaves conversions half-done. I don't think
we must take this as-is.

For patches 1 and 2, the changes would be fine if we were also getting
rid of TTBR_ASID_MASK and TTBR_CNP_BIT, but we don't, apparently because
those are still used by KVM. It feels like those two patches should be
split into a separate series that *only* moves code over to generate
sysreg definitions, also updates KVM, and removes the unused legacy
definitions.

For patch 3, I think the change makes the code harder to read, and
harder to understand, because there's no context to explain why we're
masking out a single bit. I don't think this is actually an improvement.
See below for related notes for patch 5.

For patch 4, as above, I think the patch can be dropped.

For patch 5, this could be OK, but we should define
TTBR_BADDR_52_PA_PIVOT as (51 - 5) and avoid the magic number entirely.
IMO it'd be nicer to just extract and re-insert the bits; I think our
current logic is unnecessarily micro-optimized so that this can be
implemented with a shifted-OR + AND, whereas I think we could burn a
temporary register and use BFX + BFI + AND, and that would be clearer as
to *which* bits we're trying to move.

For patch 6, I guess this is fine; I don't have a strong feeling either
way.

Mark.

