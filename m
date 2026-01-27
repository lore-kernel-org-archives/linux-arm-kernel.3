Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572FED2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcsHZFAu0ruyjtxsuBTXQCz1MdWpYlqV17zI9goy66g=; b=oVEUwZCCbVrhNJ3W4XazQcFQ+E
	lLBMhXZRgZEN5RTLWIZRA5pfFB5rxuKCVc+ZPi94xD47RS3IOh4D0to0mTSE7c3RJkC6nrh+7ZBsk
	jkA8lRHnafyxBN67/RP2Vwo6+i95gLdEzClChFvqw0RjcqitMtQihhZekVKkXu+5YvqjqXrzfgQEq
	1rJ0915MZfsQtA3ihjUkY7u03JC3FjJn+jWdllXeH/fNfjZWpNkpzURt3lUI4+vKAJf0trACeKLnj
	BgWbxnWgzpjUSShhLEFy2AiOLZRUvSDPJLohfyex09IhT5fDRYqIcdulvsXjoUXjjaH2gBTfq7shG
	0SmzVQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfqE-0000000E0Rx-3cxz;
	Tue, 27 Jan 2026 09:58:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfqC-0000000E0Ra-2xAA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A26B1595;
	Tue, 27 Jan 2026 01:58:24 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0048B3F73F;
	Tue, 27 Jan 2026 01:58:28 -0800 (PST)
Message-ID: <487034a1-817b-4fc4-a1ff-3ab028dc80bf@arm.com>
Date: Tue, 27 Jan 2026 09:58:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] arm64: mm: Preserve existing table mappings when
 mapping DRAM
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-16-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-16-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_015832_791389_8209DA97 
X-CRM114-Status: GOOD (  14.50  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Instead of blindly overwriting an existing table entry when mapping DRAM
> regions, take care not to replace a pre-existing table entry with a
> block entry. This permits the logic of mapping the kernel's linear alias
> to be simplified in a subsequent patch.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9d39de3cfe67..28cc3cda042c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -262,7 +262,8 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  
>  		/* try section mapping first */
>  		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
> +		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
> +		    !pmd_table(old_pmd)) {
>  			pmd_set_huge(pmdp, phys, prot);
>  
>  			/*
> @@ -385,7 +386,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  		 */
>  		if (pud_sect_supported() &&
>  		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
> +		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
> +		    !pud_table(old_pud)) {
>  			pud_set_huge(pudp, phys, prot);
>  
>  			/*


