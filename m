Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666E3FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 04:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=surCf8gO3wT8Pdul782oJaTtr+PBu6+mjAu4GEjX9Ao=; b=bPwclYsQpa8e6ZPgSK/p4i2Pc4
	OWLcBGrEhJIrpxNgwdG33DTlVtZlXYCXx7zfE4Nfl3TSHRpgenb/SAmf9Czz+hztvUTRP6Nh2HiBK
	2DTMcPyGPw9fy80tVbtwY2SaYpmuoIMFsLaf3xLFV1oAmTwh9TpWOXve9xOxZc+j4/gSxF09QB0dS
	gcRD4/A+ZibRQAPAP1rhp5ZQgXipUbAVmfLsrCWEiJUvSprjtzXkdwAgfQnHNO7OwL8aMIkc0oFha
	LywWa2oV3oSPgWcH2Wg1YXsXSOs0NyMGuYJ98QCwa6284wFaTp7BjeB3WwGSm0c3Sm0Ci9pjY1d4e
	TE0rTHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZqY-00000000X30-1wBD;
	Tue, 28 Apr 2026 04:14:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZqV-00000000X1v-0Eba
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 04:14:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB6A1655;
	Mon, 27 Apr 2026 21:14:43 -0700 (PDT)
Received: from [10.164.148.44] (MacBook-Pro.blr.arm.com [10.164.148.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99A13F763;
	Mon, 27 Apr 2026 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777349688; bh=BH42mJ/E+CpYMtpyTCO/zmkPXMLKWODEQUI0JcxIdvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tFdJ1tlIf3LWIhKGhokgfq4Gat6MNCY05DT/Bs9YVeTEKtwY2/bCNo7vXFp6QTOBF
	 5KGg0Ivd4wqodleKXy9afHInJktGdlMqU+ny/5G3OGcWJCGRP7dJh3F/l17OLPNur1
	 apJCdv16ShVX1zzgZz3eJm6jDUCMN8AGBHZp4Psg=
Message-ID: <97bf11a0-0e0a-423f-81f0-91fc1ed9ad24@arm.com>
Date: Tue, 28 Apr 2026 09:44:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com, jiangwenxiaomi@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <fb022a6f-0faf-4742-8934-8a7ffae806f6@arm.com>
 <CAGsJ_4zwrsrKt5NiuN-rYCqJiyjNdv=UssLuf8VCu8xZ+5sohA@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4zwrsrKt5NiuN-rYCqJiyjNdv=UssLuf8VCu8xZ+5sohA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_211451_218706_F6C4AE4E 
X-CRM114-Status: GOOD (  10.51  )
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



On 28/04/26 8:46 am, Barry Song wrote:
> On Mon, Apr 27, 2026 at 11:05 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> [...]
>>>
>>> Barry Song (Xiaomi) (8):
>>>   arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
>>>     setup
>>>   arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
>>>     CONT_PTE
>>>   mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger
>>>     page_shift sizes
>>>   mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
>>>   mm/vmalloc: map contiguous pages in batches for vmap() if possible
>>>   mm/vmalloc: align vm_area so vmap() can batch mappings
>>>   mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtable
>>>     zigzag
>>>   mm/vmalloc: Stop scanning for compound pages after encountering small
>>>     pages in vmap
>>>
>>>  arch/arm64/include/asm/vmalloc.h |   6 +-
>>>  arch/arm64/mm/hugetlbpage.c      |  10 ++
>>>  mm/vmalloc.c                     | 178 +++++++++++++++++++++++++------
>>>  3 files changed, 161 insertions(+), 33 deletions(-)
>>>
>>
>> Hi Barry, have you got the chance to work on v2?
> 
> Hi Dev, thanks for the ping.
> 
> Yes, I’m getting Wen Jiang (cc’d) to send v2 within the next few days.
> The patchset is basically ready, but still under testing.

Thanks!


