Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903B7C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VECWiFAyFOggf7e+Lq/qiQ5l0dpIS0cLahZq9wOssC0=; b=u9U2Dar3uPuVKbptCzHdA0ER3q
	C9xm+g/EbudBPi2BEqGCKf8rzD47TZrvmJn3LClWaSbx8H4DUWNBLJiisFlK8qCULjK+Y3QuceiJ5
	9bPrdVR7F9T7lGA4xRWBR0y+z5ZO4n0HPA8VcyeqcQXVLjVUDkDm0M4Hj7Iy7mXp2/+PNODd5V2IL
	w7XrCqMpvGG8+PoJkwuinr1Z1nKjBf1FODg63eECyuKrRkJlTwh7lgV3sIU5gJHDsWcFZ7hKKvm54
	68HmDAYoOJtNntjXwtT7aTFjA8wTtsbb/pVg9PFsC2wAk+QwobhAEExzbq3y6Ecp61qKWsvRGRNOR
	MUQgjE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOabX-000000041DH-0we5;
	Mon, 09 Jun 2025 11:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaOp-00000003zNv-3FYB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:10:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83909113E;
	Mon,  9 Jun 2025 04:10:13 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AB223F59E;
	Mon,  9 Jun 2025 04:10:31 -0700 (PDT)
Message-ID: <5f6085d9-0ceb-489c-89a6-3666be994549@arm.com>
Date: Mon, 9 Jun 2025 12:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during
 ptdump_check_wx()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250609041214.285664-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250609041214.285664-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_041043_851578_37830E5A 
X-CRM114-Status: GOOD (  23.15  )
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

On 09/06/2025 05:12, Anshuman Khandual wrote:
> The arm64 page table dump code can race with concurrent modification of the
> kernel page tables. When a leaf entries are modified concurrently, the dump
> code may log stale or inconsistent information for a VA range, but this is
> otherwise not harmful.
> 
> When intermediate levels of table are freed, the dump code will continue to
> use memory which has been freed and potentially reallocated for another
> purpose. In such cases, the dump code may dereference bogus addresses,
> leading to a number of potential problems.
> 
> This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
> ("arm64/mm: Hold memory hotplug lock while walking for kernel page table
> dump")' but a same was missed for ptdump_check_wx() which faced the race
> condition as well. Let's just take the memory hotplug lock while executing
> ptdump_check_wx().
> 
> Cc: stable@vger.kernel.org
> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> This patch applies on v6.16-rc1
> 
> Dev Jain found this via code inspection.
> 
>  arch/arm64/mm/ptdump.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 421a5de806c62..551f80d41e8d2 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -328,7 +328,7 @@ static struct ptdump_info kernel_ptdump_info __ro_after_init = {
>  	.mm		= &init_mm,
>  };
>  
> -bool ptdump_check_wx(void)
> +static bool __ptdump_check_wx(void)
>  {
>  	struct ptdump_pg_state st = {
>  		.seq = NULL,
> @@ -367,6 +367,16 @@ bool ptdump_check_wx(void)
>  	}
>  }
>  
> +bool ptdump_check_wx(void)
> +{
> +	bool ret;
> +
> +	get_online_mems();
> +	ret = __ptdump_check_wx();
> +	put_online_mems();
> +	return ret;
> +}
> +
>  static int __init ptdump_init(void)
>  {
>  	u64 page_offset = _PAGE_OFFSET(vabits_actual);


