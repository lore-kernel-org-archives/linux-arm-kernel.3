Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C6FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCeRU6cOGKNVeE/AiCfrrcl2X3vWG3pW8J9VodBpu8w=; b=DlaqEYQpLQpjLdakBdtZxdWO1K
	QXnb8JDs5aHLiTuZ1ZDmmYReSe8ooe9pcOlEnRxKjVW26nYU2jimnT1uPXkBO+QUbkFj3OY1kKQJG
	m2FEAo7rUZ8T9K6CJMMi0K17DxwDU8/7iFG4TR6dNbv9aGrwGDOJVOqXVN6/vOe7FQwgw0EdsrdGo
	Sk89U/uwNBWdL6ohSRXXnqyuQ68H1AluqCTjG7dHh5mws+Kp9vomOhKGEuKzuBdStHX+0OrFrsA0M
	N4rdhYTh+0Q9iQpjcpDAfdhFKwR2/Gaf2nExhdn5kO8EXB35QyLs7vhu7U4wB6TuxgRERfZEacTM9
	Sbmg6m2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjV8-00000001fBv-0aaP;
	Tue, 28 Apr 2026 14:33:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjV5-00000001fBa-407a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:33:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5107D1C2B;
	Tue, 28 Apr 2026 07:33:15 -0700 (PDT)
Received: from [10.57.63.26] (unknown [10.57.63.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63F283F763;
	Tue, 28 Apr 2026 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777386800; bh=JDB0ysfCc3O+HZNjVWKQweokOG4BHmdvpSRYZ50uqik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbU42jReibYsWd6NKeLPLPky/aF1mB/E/5caW6uLbtydQSXInHIvalDj+UTrucmln
	 IVac9HVMny8XP6YKuQG1qxX4EIUfT4ejmLXHbaPXPbN+XCqX2KeCsSs/4yxZDqGWlA
	 F3yTplVvLLv/4Zfv7lahY9A4k269KL0yro8NgtDo=
Message-ID: <e6bf70de-5d3e-412c-8585-677706a6dce9@arm.com>
Date: Tue, 28 Apr 2026 16:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] arm64: mm: Remove bogus stop condition from
 map_mem() loop
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-22-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-22-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_073324_069771_4272B878 
X-CRM114-Status: GOOD (  16.32  )
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

On 27/04/2026 17:34, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The memblock API guarantees that start is not greater than or equal to
> end, so there is no need to test it. And if it were, it is doubtful that
> breaking out of the loop would be a reasonable course of action here
> (rather than attempting to map the remaining regions)
>
> So let's drop this check.
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 005844e521bd..bfbf3fe0d1be 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1177,8 +1177,6 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	/* map all the memory banks */
>  	for_each_mem_range(i, &start, &end) {
> -		if (start >= end)
> -			break;
>  		/*
>  		 * The linear map must allow allocation tags reading/writing
>  		 * if MTE is present. Otherwise, it has the same attributes as

