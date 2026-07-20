Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FBAC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVuJ19qCX9x3MniEK3yhTad3eaC+4o0Rjt1+dLJVWW8=; b=BnRitef4OL2vsGFCygaZxhbQnD
	C3/v7pzBVo4sB6Y/SNMYrmlbBLgAyBmsB3Dl/ND7dMhes+R+HVG2I9cdJkWKJQDyYCtxNgVihduln
	cWAqZ0U+JQsa3/QKXDsqerbX5K4x8JSo8VSt+fkpUb9kidOixNkA2R3bt9vVzH6AlmHZUC6Q1cWuo
	DEUMz6zg0OtAz5jlSQ2ttlQMs/WsgjGKfrp7kuOxG68kWCLp00QyjsFCQSYyHH0JZh8UnAfc+ml7z
	vOIOP3wksabvqkejKZSFysLOoTBad83INpDwjjICYsEide3M5aEaO3GVGpNxW0JwCs46GbdNmYvhs
	IkpJiKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlf7x-00000005o3A-3UJD;
	Mon, 20 Jul 2026 03:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlf7u-00000005o2K-2eK5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BDEF1476;
	Sun, 19 Jul 2026 20:57:02 -0700 (PDT)
Received: from [10.164.18.31] (unknown [10.164.18.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704733F86F;
	Sun, 19 Jul 2026 20:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784519826; bh=FGNZk1B/g4lSat+TD26du1p5U+sjvBqH3Ks8aOh02zY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0VSyJYMiKo7Ps1MrSM5R8ut41wweptSyPHSMZAEhYOtEB6Cs+vGlWMrR/jYAVHSj
	 6UyedudCsLMg6q3dfLnWV+ZqC8ohsH0H2iGS7C8qCUD77Tl5BL0tLY95j6VBl8nvVd
	 RGB1Lgqyp/kJkNIhIcKY6sLhZoLrGf6ypVdie34o=
Message-ID: <153f7a44-b995-4001-a2af-b576656963a1@arm.com>
Date: Mon, 20 Jul 2026 09:26:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Check the requested PFN range during memoroy
 removal
To: Richard Cheng <icheng@nvidia.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: ryan.roberts@arm.com, ardb@kernel.org, kevin.brodsky@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, newtonl@nvidia.com, kristinc@nvidia.com,
 mochs@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
References: <20260720020655.9607-1-icheng@nvidia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260720020655.9607-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_205710_844860_752C1BB2 
X-CRM114-Status: GOOD (  22.65  )
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



On 20/07/26 7:36 AM, Richard Cheng wrote:
> prevent_memory_remove_notifier() advances pfn while checking whether the
> range contains early memory. After the loop, pfn points to end_pfn, but
> it is passed to can_unmap_without_split(). This checks the range
> immediately after the requested memory instead of the range being
> offlined.

can_unmap_without_split() ends up checking 'a memory range' after
the actual range being offlined, because pfn could have gone past
end_pfn by the time it exists the loop. This is wrong and was not
intended.

> 
> Consequently, valid requests can be rejected with shifted address range,
> while an unsafe request can be accepted when the following range is
> unmapped. This was observed with CXL DAX memory, where the final memory
> block was incorrectly allowed offline.

Agreed.
> 
> Pass arg->start_pfn so the leaf-split check examines the requested

Pass arg->start_pfn into can_unmap_without_split().
> range.

Although the explanations above are correct, the wording in the
commit message could have been better.
> 
> Fixes: 95a58852b0e5 ("arm64/mm: Reject memory removal that splits a kernel leaf mapping")

Correct commit ID for attribution.

> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
> The bug occurred on a machine with CXL Type-3 device.
> Branch: cxl-next
> 
> Before 95a58852b0e5:
> 
> """
> $ sudo echo offline > memory557056/state
> write error: Operation not permitted
> $ sudo dmesg
> ---[snip]---
> [440008000000 440010000000] splits a leaf entry in linear map
> 
> $ sudo echo offline > memory558079/state
> $ cat memory558079/state
> offline
> """
> 
> After:
> """
> $ sudo echo offline > memory557056/state
> write error: Operation not permitted
> [440000000000 440008000000] splits a leaf entry in linear map
> 
> $ sudo echo offline > memory558079/state
> write error: Operation not permitted
> [441ff8000000 442000000000] splits a leaf entry in linear map

Seems exactly as would have been expected.
> 
> My fix corrects the checked range and prevents the false acceptance.

> 
> Best regards,
> Richard Cheng.
> ---
>  arch/arm64/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a25d8beacc83..18a8b0d3714e 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2194,7 +2194,7 @@ static int prevent_memory_remove_notifier(struct notifier_block *nb,
>  		}
>  	}
>  
> -	if (!can_unmap_without_split(pfn, arg->nr_pages))
> +	if (!can_unmap_without_split(arg->start_pfn, arg->nr_pages))
>  		return NOTIFY_BAD;
>  
>  	return NOTIFY_OK;
> 
> base-commit: 5ca04f3ba91f1773bbd5da6d9c654ccc1ba7831d

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

