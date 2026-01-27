Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A15D2D8E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Wole5ho7651JplGDv9D5i9KHGrs6q2yQQ7MphUqJ9I=; b=WeziC4ArfCJrK+T1uI3VqKfR6D
	gzRSwnaTty2aK2doL2f4pthWpkq2aXiNklhCNtUl3T2TA75c6U5iykxhlR09iKp5qRU2hrhIyAyx9
	bgbQIPyhd9eBrJKzINjgfBBNr+s33qBOE0AwxY2jLpwIs8UdSlEeyjBnWADLCoC5SxWMpy5WQPzn5
	X/sWOLlSjplKG8opbijEaKohJxDp/na1Z+Ur1fzOx/9cLnnaSs2usAzNNnq/HYr0qnuW8uzTLf2kK
	Q8Hsiw5WHM7O75CrYIrgiOOPDfiqtQmzAdOWvN3G6BIadC8gwQtTrdrpTg8fzRHNZW1N8NXRgEhhf
	+niBjX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfxz-0000000E1F5-2Nx4;
	Tue, 27 Jan 2026 10:06:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfxu-0000000E1Dj-1deD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:06:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF801595;
	Tue, 27 Jan 2026 02:06:22 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFB193F73F;
	Tue, 27 Jan 2026 02:06:26 -0800 (PST)
Message-ID: <005012a8-bfcc-4049-9ff2-adecf3a89c53@arm.com>
Date: Tue, 27 Jan 2026 10:06:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] arm64: mm: Remove bogus stop condition from
 map_mem() loop
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-18-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-18-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_020630_471331_5E718DEE 
X-CRM114-Status: GOOD (  16.13  )
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
> The memblock API guarantees that start is not greater than or equal to
> end, so there is no need to test it. And if were, it is doubtful that
> breaking out of the loop would be a reasonable course of action here
> (rather than attempting to map the remaining regions)
> 
> So let's drop this check.

If start were greater than end, I think it's a pretty safe bet that
__map_memblock() would do something horrible.

But if memblock makes the guarantee you claim I agree it's preferable to
declutter the code:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index d7faa98f427c..377bdc4d84a1 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1158,8 +1158,6 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	/* map all the memory banks */
>  	for_each_mem_range(i, &start, &end) {
> -		if (start >= end)
> -			break;
>  		/*
>  		 * The linear map must allow allocation tags reading/writing
>  		 * if MTE is present. Otherwise, it has the same attributes as


