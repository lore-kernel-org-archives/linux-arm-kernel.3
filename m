Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A70EF36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQDW5xqJ5IwYwi5+zyJntrBe02BOIbYzeFaYDOjGuzs=; b=ZvkdwXHJG/dsQzK/45fyKtwBBt
	f0YE0mPb3ikwlc6LmH0ALbWEquhuQXu7ha1CTKUXrLY82qZa4Q3oIQgOxhgrV4aBolUXaMdYlmwzM
	40M4VFIyNhX8Tqe8vd6OaWFSaMPnPMF5LR09FaPWD5SPCL5rqBkSoZiLAQljUxy75BcqmXnSoYUG2
	yCVyCO+ewWtxFAiuLwpsqXVtx7iJRPTnPezHxOSGZnLRhQu3xvwKhF/nVy6f2guNstYOyLUzILcwR
	XP0w9svircnm5A6VmbJp5cTSUAJ3wl062v3fOjgKcJnxxHlOfqYKNexa5gvuHKLJGHTRYC28tlRF6
	oUf5SCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB37g-0000000BZSe-1qeg;
	Fri, 10 Apr 2026 04:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB37e-0000000BZSI-0ltZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:05:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895F01D13;
	Thu,  9 Apr 2026 21:05:26 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3FD3FAF5;
	Thu,  9 Apr 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775793932; bh=SjXrSZIRMlWw97Vew6gKz6aH0jyeVoWF6t4/svTR9bY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EjrrBxhN665F8irlIMDsY0dG93Jgc6VH7vWs/gyaNgmOyb5HuyJOdMdEZIIKcE+PR
	 ijF67rpbvOYU1x33AOs7xnIc7mP5eomADBOnauQeabGXX3ZSFgc8o3XaRvU1vYzt/r
	 HCar42SpfCitlvPMFKSVjb57S4OR3WD3UAvD2G80=
Message-ID: <e4a36f3d-abc3-411d-9fe9-93b6cdf7465c@arm.com>
Date: Fri, 10 Apr 2026 09:35:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 12/16] arm64/mm: Abstract printing of pxd_val()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-13-anshuman.khandual@arm.com>
 <4290fcdb-47d1-4f74-97f3-51ac581efeaf@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4290fcdb-47d1-4f74-97f3-51ac581efeaf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_210534_271071_088C536A 
X-CRM114-Status: GOOD (  12.78  )
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

On 08/04/26 5:58 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
> 
> Subject: you probably mean "pxx_val()" ?

Yes - sounds better will change.

> 
>> Ahead of adding support for D128 pgtables, refactor places that print
>> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
>> macro to prepare the argument(s). When using D128 pgtables in future,
>> we can simply redefine __PRIpte and __PTIpte_args().
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable-types.h |  3 +++
>>  arch/arm64/include/asm/pgtable.h       | 22 +++++++++++-----------
>>  arch/arm64/mm/fault.c                  | 10 +++++-----
>>  3 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
>> index 265e8301d7ba..dc3791dc9f14 100644
>> --- a/arch/arm64/include/asm/pgtable-types.h
>> +++ b/arch/arm64/include/asm/pgtable-types.h
>> @@ -11,6 +11,9 @@
>>  
>>  #include <asm/types.h>
>>  
>> +#define __PRIpte		"016llx"
>> +#define __PRIpte_args(val)	((u64)val)
> 
> Same comment regarding "pte" being misleading.

Sure - will rename __PRIpte as PRIpxx instead.

> 
> 


