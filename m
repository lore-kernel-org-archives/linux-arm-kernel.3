Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951DCD2D8DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9BRXD6u102i8KmtBGdD6Hf/CV2DiVu2ws9RdFo07z0=; b=aORTMatnia7jdzTVf6qvnEy46m
	MMXJguqV65yaZ3HR+Thv94ff6DgLbNUjoDVC27j8m0KDaqm3iFDruszM69QFx6jJqalGYbAPWHOyr
	NYwtnf1rmo3r3zTp+gPrChNYQLXd0FLmn7U8u9/Qux4us69c+PPRtir1jEO96tp2U8YExpqk1zR1Z
	W0z2uyHkSllJ1cI7hNVcybWlgzZnmIAfzgUChkLuNnQihIc98v408LtRaxMJQf2YO8HU2ZxUSdHcz
	zimJopKfOXV7QY/EKRFNvV4L2Mz2N094GDhC7JjW7iFFAebf9g8nc+lg66PA8IdN62xOWRTRjeC4/
	PDiqtWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfe3-0000000DzK0-2gS6;
	Tue, 27 Jan 2026 09:45:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfe0-0000000DzJ1-2t4D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:45:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71EA51595;
	Tue, 27 Jan 2026 01:45:49 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 283343F632;
	Tue, 27 Jan 2026 01:45:54 -0800 (PST)
Message-ID: <4965fa08-ce01-4848-bc30-5cc1b745683f@arm.com>
Date: Tue, 27 Jan 2026 09:45:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: mm: Permit contiguous descriptors to be
 rewritten
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-15-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-15-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014556_775590_7A3ACC70 
X-CRM114-Status: GOOD (  19.92  )
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
> Currently, pgattr_change_is_safe() is overly pedantic when it comes to
> descriptors with the contiguous hint attribute set, as it rejects
> assignments even if the old and the new value are the same.
> 
> So relax the check to allow that.

But why do we require the relaxation? Why are we re-writing a PTE in the first
place? Either the caller already knows it's the same in which case it can be
avoided, or it doesn't know in which case it is accidentally the same and couple
probably just as easily been accidentally different? So it's better to warn
regardless I would think?

I'm sure I'll get to the patch where this matters and change my mind :)

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index c36422a3fae2..9d39de3cfe67 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -141,7 +141,7 @@ bool pgattr_change_is_safe(pteval_t old, pteval_t new)
>  		return false;
>  
>  	/* live contiguous mappings may not be manipulated at all */
> -	if ((old | new) & PTE_CONT)
> +	if ((old | new) & PTE_CONT && old != new)
>  		return false;
>  
>  	/* Transitioning from Non-Global to Global is unsafe */


