Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68102C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPG/8Wy7qwfW0AAFt5lnK4zEMhsSEXE/tPK/+hYgpok=; b=E0zfQ1r/mT5cKTX5kHybtipNv7
	c5396Ap0SF87HhKMr/uBd/ODrDVn9MQ/M7s5TfWOn3e01yX95zj/qjisDrDi3bMSuAcfZcziV72Bj
	sIjpfmGwmeWVIlmUwqSH1Y+WwJHCLSU9JvsjXTsf4JlYW5T95bEn6sGeMsb8Onn5nk3N3oT6QLeL/
	ddkno8l00LZkJp2LjWTURoFZdrHQn8dPPHjDieAzdLZApfX1s76WovQhV9RaUkThZweFfkXbQ68iJ
	28Lnb9bgNveaoVbFrT62f8ir/wa8XUp8TmHSVcDz5hzWYEgPyYURqC+UEYVEuBWwCbkQz1M7QqzIG
	Z7rvzY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trWoJ-00000001fWf-2zZT;
	Mon, 10 Mar 2025 06:40:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trWmf-00000001ezx-264Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 06:38:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A3DC15A1;
	Sun,  9 Mar 2025 23:38:52 -0700 (PDT)
Received: from [10.163.42.69] (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4AF43F673;
	Sun,  9 Mar 2025 23:38:36 -0700 (PDT)
Message-ID: <aae26951-3409-476c-b31d-1738cafe730a@arm.com>
Date: Mon, 10 Mar 2025 12:08:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/8] arm64/mm: Drop PXD_TABLE_BIT
To: arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250221044227.1145393-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_233841_591384_C6D2C1F9 
X-CRM114-Status: GOOD (  15.33  )
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

On 2/21/25 10:12, Anshuman Khandual wrote:
> Remove the PXX_TABLE_BIT definitions and instead rely on PXX_TYPE_MASK,
> PXX_TYPE_SECT and PXX_TYPE_TABLE. The latter versions are more abstract
> and also include the PTE_VALID bit.
> 
> This abstraction is valuable for the impending D128 page table support,
> which doesn't have a single page table bit to determine table vs block.
> Instead it has the skip level (SKL) field, where it will consider 0 to
> mean table and any other value to mean a block entry. So PXX_TABLE_BIT
> therefore doesn't fit into the D128 model well, but the type fields do.
> 
> This series applies on v6.14-rc3.
> 
> Changes in V2:
> 
> - Changed pmd_mkhuge() and pud_mkhuge() implementation
> - Changed pud_bad() implementation with an additional patch
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20241005123824.1366397-1-anshuman.khandual@arm.com/
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: James Morse <james.morse@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: kvmarm@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (6):
>   KVM: arm64: ptdump: Test PMD_TYPE_MASK for block mapping
>   arm64/ptdump: Test PMD_TYPE_MASK for block mapping
>   arm64/mm: Clear PXX_TYPE_MASK in mk_[pmd|pud]_sect_prot()
>   arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in [pmd|pud]_mkhuge()
>   arm64/mm: Check PXD_TYPE_TABLE in [p4d|pgd]_bad()
>   arm64/mm: Drop PXD_TABLE_BIT
> 
> Ryan Roberts (2):
>   arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
>   arm64/mm: Check pmd_table() in pmd_trans_huge()
> 
>  arch/arm64/include/asm/pgtable-hwdef.h |  5 --
>  arch/arm64/include/asm/pgtable.h       | 65 ++++++++++++++++++--------
>  arch/arm64/kvm/ptdump.c                |  4 +-
>  arch/arm64/mm/ptdump.c                 |  4 +-
>  4 files changed, 50 insertions(+), 28 deletions(-)
>

Gentle ping again. Does this series look okay or is there any objection ?

