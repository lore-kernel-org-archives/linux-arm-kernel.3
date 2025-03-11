Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ACAC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J4+mP7IhovXymLL8fBOaLnNlEGVzd1qN+RYsBXjsvo=; b=l43coboCkoXUKMrpzY8RMsCZn/
	KK1QI1Fr/tJMHuQLZSrCPjbaj6ZruKcEZrVx0MV4MnN3pci5Ix/hF73IhiDiLNIHpq8YYb5uL3OCh
	xERT8T/g/zztH26u0gqga0vQKdCjW1jMh2HAw4qrVgtmWy7Dcn1Aard4sA2CrS0UGCRADnQ9SZxF/
	FgbcDw42yn6wljCLHVAy8bshJXPt37sLShDNgHCKTSNEiamuiJ5ePn+0K1NO2eWA2rFxV34dYzfg7
	xhe0gEB2FPbCqJuj+0Jkmfj6V3VBvy0ZXkLshOlFDJyuGki729HN4trGGKPwcNttfHaBb5UhNjWnf
	X9CuCa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxsu-00000005ULr-1HnA;
	Tue, 11 Mar 2025 11:34:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxpn-00000005TYF-2at3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:31:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0127B152B;
	Tue, 11 Mar 2025 04:31:54 -0700 (PDT)
Received: from [10.1.30.125] (XHFQ2J9959.cambridge.arm.com [10.1.30.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8543F673;
	Tue, 11 Mar 2025 04:31:41 -0700 (PDT)
Message-ID: <f6d48d04-fd3c-493e-b7a0-020b912f6f10@arm.com>
Date: Tue, 11 Mar 2025 11:31:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64/kernel: Always use level 2 or higher for early
 mappings
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250311073043.96795-2-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250311073043.96795-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_043143_709533_5DA23476 
X-CRM114-Status: GOOD (  24.68  )
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

On 11/03/2025 07:30, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The page table population code in map_range() uses a recursive algorithm
> to create the early mappings of the kernel, the DTB and the ID mapped
> text and data pages, and this fails to take into account that the way
> these page tables may be constructed is not precisely the same at each
> level. In particular, block mappings are not permitted at each level,
> and the code as it exists today might inadvertently create such a
> forbidden block mapping if it were used to map a region of the
> appropriate size and alignment.
> 
> This never happens in practice, given the limited size of the assets
> being mapped by the early boot code. Nonetheless, it would be better if
> this code would behave correctly in all circumstances.
> 
> So only permit block mappings at level 2, and page mappings at level 3,
> for any page size, and use table mappings exclusively at all other
> levels. This change should have no impact in practice, but it makes the
> code more robust.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: take the assignment of protval out of the loop again, so that
>     clearing a mapping works as expected wrt the PTE_CONT bit

Ouch, totally missed that. Now that I've looked at the code properly, I wonder
if it is worth supporting CONT_PMD mappings at level 2? That would be 32M for 4K
pages, so is likely to actaually get used. I think it would just be something like:

u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 :
	   ((level == 2) ? CONT_PMD_SIZE - 1 : U64_MAX) : U64_MAX;

Anyway, probably not worth the complexity for these boot-time tables, so regardless:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
>  arch/arm64/kernel/pi/map_range.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 2b69e3beeef8..5778697f3062 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -45,12 +45,12 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>  	 * clearing the mapping
>  	 */
>  	if (protval)
> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
> +		protval |= (level == 2) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
>  
>  	while (start < end) {
>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
>  
> -		if (level < 3 && (start | next | pa) & lmask) {
> +		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
>  			/*
>  			 * This chunk needs a finer grained mapping. Create a
>  			 * table mapping if necessary and recurse.


