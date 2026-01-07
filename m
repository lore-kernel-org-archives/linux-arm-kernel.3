Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B761CCF6C00
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/4bEhMAA/Lq621Ht53wLdkDnJEdjsOX6U7Ixyo4114=; b=ykKUz+JRnYMn7lTH1eBZ3TkiOy
	b9X0zk197wrB/AJSOgrlpn07ekKisFQUKvvVrrJLGy9cdPkO/y+Yrut7m4oRhc+apcJq9yX/FSl90
	Jsa4SbcEdiQJi5n2AUgryIV26qDWLqRBpOwmnXYqAmA1HN/hyVRwW3uWPm1qKe8tvkZMnA11nb4pg
	pw6k3Vio8+dqDRnWrr5v2pC3fOWB9DGhFRVNtI3Z726+a23VaoGerdDLVAkQH5802Kkg9L+ygpxnB
	TvpnWad2DSHS2OG3idvGjFvHVWDqrEQxWHANo/Zua2Fa4ntA1hZB+FJptPP+JIVEvo3BEqlEUW41j
	hG9TxEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOzG-0000000EQcZ-2aaC;
	Wed, 07 Jan 2026 08:33:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOzD-0000000EQbG-1F7m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:33:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 306A4497;
	Wed,  7 Jan 2026 00:33:36 -0800 (PST)
Received: from [10.57.95.107] (unknown [10.57.95.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5EEC3F6A8;
	Wed,  7 Jan 2026 00:33:41 -0800 (PST)
Message-ID: <d3579c85-8cac-4e83-94a7-b6dcab72b7a1@arm.com>
Date: Wed, 7 Jan 2026 08:33:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Assert NR_BM_PUD_TABLES for bm_pud[]
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
References: <20260107061606.3160088-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260107061606.3160088-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_003347_375875_F52B93DA 
X-CRM114-Status: GOOD (  13.34  )
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

On 07/01/2026 06:16, Anshuman Khandual wrote:
> There is an implicit assumption about bm_pud[] being single entry PUD table
> just like bp_pmd[] which is a single entry PMD table. Though only the later
> gets asserted via NR_BM_PMD_TABLES. Hence let's add a similar check for PUD
> table as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/fixmap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..e02594be8b8e 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -23,8 +23,11 @@ static_assert(FIXADDR_TOT_START > PCI_IO_END);
>  	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PMD_SHIFT)
>  #define NR_BM_PMD_TABLES \
>  	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, PUD_SHIFT)
> +#define NR_BM_PUD_TABLES \
> +	SPAN_NR_ENTRIES(FIXADDR_TOT_START, FIXADDR_TOP, P4D_SHIFT)
>  
>  static_assert(NR_BM_PMD_TABLES == 1);
> +static_assert(NR_BM_PUD_TABLES == 1);

But if there is only one PMD table, there must only be one PUD table (and one
P4D table, and one PGD table) by definition. So I don't think this is checking
anything that the existing PMD table check is not.

Thanks,
Ryan

>  
>  #define __BM_TABLE_IDX(addr, shift) \
>  	(((addr) >> (shift)) - (FIXADDR_TOT_START >> (shift)))


