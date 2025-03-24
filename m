Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A6C36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 04:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpTdHSPwEvsmWZsMfi/H0HyWwf1LgIbYpVQaMZ5mFv0=; b=LaybXJsmaM4AGJvGSTblwNuW9a
	AeKU+ihSY8FY2i6jYhgIlgum/ISVkJZMxv20T7GAJVl3gkM63s1jknR80EewLeIncmxU0oWa5TOZW
	CED7U6hcmZYOdnWPQno4+fVtiQ87/RxM3Ni1tuJYpdMDhMNqDbpRmnBzEn7uL6MfuAxbeIXPA0Fk1
	jF77EPGSAgHhFFvYXmwozpm3cF4bgPIoUV8FPhJGZmXg4sNK4odid5f+mi1UoodZRVLbDAWnmh4Ze
	rkZKxP5jdk5ycR/Kkqud7WSzqGSYs/rKd8onaPkW8DE/iCGyAfNKINrggUQeRg+ck9Vmstu/5e52r
	Y7XeobaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twZJm-00000002AhE-2knx;
	Mon, 24 Mar 2025 04:21:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twZHz-00000002AWw-11fw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 04:19:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 061741A2D;
	Sun, 23 Mar 2025 21:19:53 -0700 (PDT)
Received: from [10.162.16.153] (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1B843F58B;
	Sun, 23 Mar 2025 21:19:41 -0700 (PDT)
Message-ID: <48f15771-ed1a-4e30-b825-70ee3c323d37@arm.com>
Date: Mon, 24 Mar 2025 09:49:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Correct the update of max_pfn
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, catalin.marinas@arm.com,
 david@redhat.com, will@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, ardb@kernel.org, yangyicong@hisilicon.com,
 joey.gouly@arm.com, quic_cgoldswo@quicinc.com, quic_sudaraja@quicinc.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_211951_349962_CF7E7376 
X-CRM114-Status: GOOD (  14.09  )
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

On 3/21/25 12:30, Zhenhua Huang wrote:
> Hotplugged memory can be smaller than the original memory. For example,
> on my target:
> 
> root@genericarmv8:~# cat /sys/kernel/debug/memblock/memory
>    0: 0x0000000064005000..0x0000000064023fff    0 NOMAP
>    1: 0x0000000064400000..0x00000000647fffff    0 NOMAP
>    2: 0x0000000068000000..0x000000006fffffff    0 DRV_MNG
>    3: 0x0000000088800000..0x0000000094ffefff    0 NONE
>    4: 0x0000000094fff000..0x0000000094ffffff    0 NOMAP
> max_pfn will affect read_page_owner. Therefore, it should first compare and
> then select the larger value for max_pfn.
> 
> Fixes: 8fac67ca236b ("arm64: mm: update max_pfn after memory hotplug")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1dfe1a8efdbe..310ff75891ef 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1361,7 +1361,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  		__remove_pgd_mapping(swapper_pg_dir,
>  				     __phys_to_virt(start), size);
>  	else {
> -		max_pfn = PFN_UP(start + size);
> +		/* Address of hotplugged memory can be smaller */
> +		max_pfn = max(max_pfn, PFN_UP(start + size));
>  		max_low_pfn = max_pfn;
>  	}
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

