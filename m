Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 07:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdeN2n4VKdFFKUCNlYiuhpanjzxWJTUGgsr1PQAr0G8=; b=ulTcffbfUS1I/lx9WVKfUHj9kS
	g/pYCHk+cRP83XoLcKCAV0B/A1d6exA7Y69YSu8nGo4aM+t5MKteIDCchLVJjxSRldhTnvzRM2u1H
	nTVpzhGsuXNtRvUwnWYyCnnWOzvzIYrnTp6Mk1RbH89m0QWD6tkk3kP/zdHA8p2u/Ji+G2q4KKOyV
	J3O1U73YEiImSUoK/kwjMk/joCN0y96+4Y+eVgPTlYbW7XHdVdLYFJgn3qFp8M9Luvao48mzmibXP
	I1aK/2oR69LXY3Dc+p8lItNo5yYnH+EhMa1bkazUHzV74x7w6MUL7hamARO3KAw+no15h5M1GcOu1
	uO0QGUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbms-0000000CIUl-1lSE;
	Fri, 03 Jan 2025 07:08:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTblh-0000000CIQD-1yrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 07:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D64A1516;
	Thu,  2 Jan 2025 23:07:14 -0800 (PST)
Received: from [10.163.53.221] (unknown [10.163.53.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C91433F6A8;
	Thu,  2 Jan 2025 23:06:39 -0800 (PST)
Message-ID: <3aed8d7d-568c-43fc-a157-cb13d6259ebe@arm.com>
Date: Fri, 3 Jan 2025 12:36:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: mm: Test for pmd_sect() in vmemmap_check_pmd()
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, catalin.marinas@arm.com
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20250102074047.674156-1-quic_zhenhuah@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250102074047.674156-1-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_230649_556719_0DAE2A0B 
X-CRM114-Status: GOOD (  14.06  )
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



On 1/2/25 13:10, Zhenhua Huang wrote:
> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
> introduces the vmemmap_check_pmd() while does not verify if the entry is a
> section mapping, as is already done for Loongarch & X86.
> The update includes a check for pmd_sect(). Only if pmd_sect() returns true,
> further vmemmap population for the addr is skipped.
> 
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
> Separate the patch out based on the discussion:
> https://lore.kernel.org/linux-arm-kernel/20241209094227.1529977-3-quic_zhenhuah@quicinc.com/T/#m41d49cd91b348ecfe2c37c4b3c0911180426934e

LGTM, regardless whether this patch goes on its own or via the series.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9afeb35673a3..50a22c63f450 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1172,7 +1172,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>  				unsigned long addr, unsigned long next)
>  {
>  	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -	return 1;
> +
> +	return pmd_sect(READ_ONCE(*pmdp));
>  }
>  
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,

