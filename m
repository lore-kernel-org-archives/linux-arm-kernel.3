Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92808C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xS1iz9mM6zwGCInXQ6jHCS0iHrRwcIDwZ+4MfqyaPac=; b=Q+hmfFojhKClZn3C8gomzMAOQj
	Hc64Snr2GOHlj8ROXFUs2MSfVE9zTuGV/FrI6pEc9kVLK5AZFOwDUKisshHrchVQLIXJXcHh2D8MH
	Cg1IGI+bfqlfLQFKeCjauMLos9Zj32q2icEl6ZGUVSfO0l0VL65qnbEdLWJkUM2xRmJ0sgw/boL71
	rIbfKwu2Z8+kDy7HfaAEjm8GbQq2fV2zAdsleTKT1nMI6miQA4LJSgUOhDR6XmX4T6uqIs0b3fJKX
	M3+t5V8qEwdm8axEvbg0JtTr6a983JJ4jQrk043+1oVsiv1OyQR1qg48oVSN61IC6FGzxWTLGcFbj
	64xZtzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWTx-00000005j7p-2Wvm;
	Tue, 04 Mar 2025 17:55:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV1D-00000005PEK-0P17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:21:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24A0A2F;
	Tue,  4 Mar 2025 08:21:32 -0800 (PST)
Received: from [10.57.83.152] (unknown [10.57.83.152])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA73C3F5A1;
	Tue,  4 Mar 2025 08:21:16 -0800 (PST)
Message-ID: <0fe6f3b2-1011-4418-bc19-612a3b98c78d@arm.com>
Date: Tue, 4 Mar 2025 16:21:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Create level specific section mappings in
 map_range()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
References: <20250303041834.2796751-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250303041834.2796751-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_082119_235111_13C43A07 
X-CRM114-Status: GOOD (  21.28  )
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

On 03/03/2025 04:18, Anshuman Khandual wrote:
> Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
> section mapping at all page table levels except the last level. This works
> fine as the section mapping masks are exactly the same (0x1UL) for all page
> table levels.
> 
> This will change in the future with D128 page tables that have unique skip
> level values (SKL) required for creating section mapping at different page
> table levels. Hence use page table level specific section mapping macros
> instead of the common PMD_TYPE_SECT.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on 6.14-rc5
> 
> PGD_TYPE_SECT for level -1 section map handling has been added for 4K
> base pages with 52 bit VA configuration that has 5 page table levels.
> In such cases (CONFIG_PGTABLE_LEVELS = 5) early_map_kernel() can call
> map_range() eventually with -1 (i.e 4 - CONFIG_PGTABLE_LEVELS) as the
> root_level.

Table Table D8-16 on page D8-6459 of ARM DDI 0487 L.a says that block mappings
at level -1 are not permitted for 4K pages; only levels 0-3 support leaf
mappings. Similarly for 16K, table D8-26 says only levels 1-3 permit leaf
mappings. And for 64K, table D8-35 says only levels 1-3 permit leaf mappings.

So I don't think PGD_TYPE_SECT is the right solution. Perhaps we need to
explicitly force the unsupported levels to be table entries even if the
alignment is correct?

Thanks,
Ryan

> 
>  arch/arm64/include/asm/pgtable-hwdef.h |  1 +
>  arch/arm64/kernel/pi/map_range.c       | 23 +++++++++++++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index a9136cc551cc..fd0a82e8878c 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -99,6 +99,7 @@
>  #define PGD_TYPE_TABLE		(_AT(pgdval_t, 3) << 0)
>  #define PGD_TABLE_BIT		(_AT(pgdval_t, 1) << 1)
>  #define PGD_TYPE_MASK		(_AT(pgdval_t, 3) << 0)
> +#define PGD_TYPE_SECT		(_AT(pgdval_t, 1) << 0)
>  #define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
>  #define PGD_TABLE_PXN		(_AT(pgdval_t, 1) << 59)
>  #define PGD_TABLE_UXN		(_AT(pgdval_t, 1) << 60)
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 2b69e3beeef8..9ea869f5745f 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -44,8 +44,27 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>  	 * Set the right block/page bits for this level unless we are
>  	 * clearing the mapping
>  	 */
> -	if (protval)
> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
> +	if (protval) {
> +		switch (level) {
> +		case 3:
> +			protval |= PTE_TYPE_PAGE;
> +			break;
> +		case 2:
> +			protval |= PMD_TYPE_SECT;
> +			break;
> +		case 1:
> +			protval |= PUD_TYPE_SECT;
> +			break;
> +		case 0:
> +			protval |= P4D_TYPE_SECT;
> +			break;
> +		case -1:
> +			protval |= PGD_TYPE_SECT;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
>  
>  	while (start < end) {
>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));


