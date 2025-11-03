Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ADCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/j9sJIttkIiOAfR3xk+6dQ3+vzOL5D3trL6FueYV0Z0=; b=gHep2xhuTMzDHwrikUEcHFgCiN
	HdgOCWe3WyfZ4e5+8mkxYOWS2OID4rr+wIdT34D/foXad1qeZY6OJNhrWCn3fGP6GMY3vndfpSOPQ
	A6k4aJWrhEf26t+SRxlyWnJ1eiE5PUi80Y9i5BJKYBvft1dqDBNcXbmdqu5uzPbPuhXivMQQ5WQlM
	P71E6igZeVEGfEuTyl4vBGBgDUjn8IavnIvcJ5/TuwlxjcC9ciV2wjGSHpSXv0HiXoLmMlB1RKoLc
	R9LkIK7pNnFghQxhelVA9Et4/fk2zJhLy8dspyV/X/mWCYZXotV2oJYqTls+isbPAAuuWlTBjkhKf
	iuJJGFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpIb-00000009OCh-1B98;
	Mon, 03 Nov 2025 07:48:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpIX-00000009OBw-3UT4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:48:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 180A228FA;
	Sun,  2 Nov 2025 23:48:09 -0800 (PST)
Received: from [10.164.146.19] (J09HK2D2RT.blr.arm.com [10.164.146.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB9DC3F63F;
	Sun,  2 Nov 2025 23:48:13 -0800 (PST)
Message-ID: <7d4d0d6a-390d-48d6-ba2a-7adfac2e30ca@arm.com>
Date: Mon, 3 Nov 2025 13:18:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/pageattr: Propagate return value from
 __change_memory_common
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: ryan.roberts@arm.com, rppt@kernel.org, shijie@os.amperecomputing.com,
 yang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251103061306.82034-1-dev.jain@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251103061306.82034-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_234817_921137_6C2B7D67 
X-CRM114-Status: GOOD (  18.50  )
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

On 03/11/25 11:43 AM, Dev Jain wrote:
> Post a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full"),
> __change_memory_common has a real chance of failing due to split failure.
> Before that commit, this line was introduced in c55191e96caa, still having

A small nit:

Commit description needs to follow after the SHA ID ^^^^^^^^^^
> a chance of failing if it needs to allocate pagetable memory in
> apply_to_page_range, although that has never been observed to be true.
> In general, we should always propagate the return value to the caller.
> 
> Cc: stable@vger.kernel.org
> Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM areas to its linear alias as well")

Does is really need a Fixes: ? There is no problem which is being fixed.
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> Based on Linux 6.18-rc4.
> 
>  arch/arm64/mm/pageattr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..b4ea86cd3a71 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -148,6 +148,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	unsigned long size = PAGE_SIZE * numpages;
>  	unsigned long end = start + size;
>  	struct vm_struct *area;
> +	int ret;
>  	int i;
>  
>  	if (!PAGE_ALIGNED(addr)) {
> @@ -185,8 +186,10 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>  		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +			ret = __change_memory_common((u64)page_address(area->pages[i]),
>  					       PAGE_SIZE, set_mask, clear_mask);
> +			if (ret)
> +				return ret;
>  		}
>  	}

Although the change does make sense.

