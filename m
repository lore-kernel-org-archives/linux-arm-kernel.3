Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACFCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zat05qqxvwp6PrsaOLc8teu3wR1nzZI50WFld5IE94E=; b=eHIxDsicxqgdCm2fozDVzWvInj
	7dQIpGcl4oynTC2oT6XXW0i81oWBYnTXHeFAeZwLw//LkLCXzUU2xeZgC9vr6XHRINzmG3hmqLePJ
	tZdbEoLIyO7ls/m4TLC/UhouOdep/m2QjEE8q8o53PbzFQEdAXo3/66sDrDLnOfklKDyo5AUkY38R
	oWpy13zWKvMxm07rQZ68F/ndWPblkwxvFrvMYknv+fDfkUSJmheaCu5FE/I3Mv++rpGpPSGI1YDeY
	5ILwihAdKS96rYSQcrJ+bwtHJf89vT1GB1qdenIEwiIReVri3hScNj7dU/0U+qBW7/XM+6d4wKWWN
	aY6S4ikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjb8w-0000000Beqc-1hSK;
	Tue, 14 Jul 2026 11:17:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjb8u-0000000BepX-0gVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:17:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60221497;
	Tue, 14 Jul 2026 04:17:35 -0700 (PDT)
Received: from [10.164.19.52] (unknown [10.164.19.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C36883F93E;
	Tue, 14 Jul 2026 04:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784027859; bh=R2SemUfGDaxIvvuhVsUSqWTCbeV4a24xddbL8Y2wUhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=evQYv6xufZcgX7C01IfbaWPF1KL5BXIRm6RemT40GvFByo89ShBnyYxaRdbWtgdR4
	 6uwMLKuHrePOTAGGp16GO0SYsIj2itt6cgaLOmrIB935g9LczD611XLlLKDioQB509
	 0k+am8MDEo3T9w7WyLpdalRhKIQAUOmt0DWnvppE=
Message-ID: <a08e2a7b-2ab8-4429-8d4d-9c13b6a2a77b@arm.com>
Date: Tue, 14 Jul 2026 16:47:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Wen Jiang <jiangwenxiaomi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 david@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com,
 Wen Jiang <jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
 <929dedc2-eea3-4153-be6d-d2dd727fed89@arm.com>
From: Dev Jain <dev.jain@arm.com>
Content-Language: en-US
In-Reply-To: <929dedc2-eea3-4153-be6d-d2dd727fed89@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_041740_247780_948CBC3B 
X-CRM114-Status: GOOD (  15.94  )
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



On 14/07/26 2:06 pm, Anshuman Khandual wrote:
> 
> 
> On 10/07/26 2:24 PM, Wen Jiang wrote:
>> On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>>>
>>> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>>
>>>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
>>>> is physically fully or partially contiguous.
>>>
>>> Thanks, I added this to mm.git's mm-new branch for wider testing.
>>>
>>> AI review asked some questions, and some of them are new since the v5
>>> series:
>>>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
>>
>> Hi Andrew,
>>
>> I've gone through the Sashiko findings:
>>
>> - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
>>   is added. The extra sizes are only used by init_mm kernel mappings via.
> 
> But not sure if that is a right approach. If these multi CONT_PTE
> sized mappings need to be supported in vmalloc() but without adding
> corresponding HugeTLB sizes, probably these required helpers could
> just be factored outside HugeTLB.

The problem is that the existing vmalloc-huge code reuses the hugetlb helpers
because it is easier that way.

If you really look at it, num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte()
do not have anything to do with hugetlbfs, but with huge mappings. It is unfortunate
that these helpers are sitting in hugetlbpage.c . Really these functions should be
pulled out of CONFIG_HUGETLBFS and put into some common header - but I can't think
of a clean solution to this.

So I think for this series, the least we can do is add a comment to clarify that these
helpers can be used by non-hugetlbfs mm code to set multiple huge mappings at the PTE level.


>>
>> - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
>>     array of valid struct page pointers.
>>
>> - Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
>>     already discussed in the V3 thread, and a separate fix was proposed
>>     there.
>>
>> Thanks,
>> Wen
> 


