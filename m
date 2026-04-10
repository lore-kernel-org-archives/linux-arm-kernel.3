Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37858F36BA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6uHJXCSUTxlOlhJ1YH5vcsGK/++2J1B0XW1TG+HJgk=; b=0K6MEzLT2sxIQBPwve63x4Xip8
	VZqRHozy/TVrzmddB3u7QHuor+23LDgGRtEzQykvWRQUTpIL21WD8hzCJljBFEE3gNhkUZenwY6mQ
	fPemZQ090jNx121HQYZnBzWJBZPJH6zxSBc+wBAEtlWv7nCVzlpiQ144dRXJEmJJWW25mOEmaDwRF
	BQsjUgQG0Zp+A5QZYoKIMq3/GBQOw0s6JK8QonZ6RiW6w9ryhIW9SM2Q0pB8EefAqDdbOT9OJ+9Jj
	3bH8uNGjc3o+HTtEc/AKCsapQRoCX9Uk6g0apKvjHCAEDdVZcfHDJl3yKq4CcmEXheyOpxqEmNB6+
	gLGR5eDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3NX-0000000BaEY-3sCr;
	Fri, 10 Apr 2026 04:21:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3NU-0000000BaEC-38Mv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:21:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845DC2008;
	Thu,  9 Apr 2026 21:21:48 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668AD3FAF5;
	Thu,  9 Apr 2026 21:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775794914; bh=yNYtRWemxBehsStI8lS7zwbuvuaTycWq8O+12cp0kh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V7lLGyCRjzBFKUjJy+Tws9lDROrQyWlkUAfTsMgWOPjwWM4bQpWwJ7us2nynvVNU+
	 /HHMG0BJUWIRBfYoH5pUaQ5zBK9mvngorFK4TzUQjF2xigTG21/X0vRfbEMRa5pvIA
	 tE5gLPUsBiB3zI+Vp6r3xRWJKI42w0c3dDz1YYsU=
Message-ID: <18173611-b233-42a4-867d-1e474feee534@arm.com>
Date: Fri, 10 Apr 2026 09:51:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 01/16] mm: Abstract printing of pxd_val()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-2-anshuman.khandual@arm.com>
 <adeAhYW-hJ7-6-Xy@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <adeAhYW-hJ7-6-Xy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_212156_938344_3E4AF183 
X-CRM114-Status: GOOD (  16.31  )
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

On 09/04/26 4:03 PM, Mike Rapoport wrote:
> Hi Anshuman,
> 
> On Tue, Feb 24, 2026 at 10:41:38AM +0530, Anshuman Khandual wrote:
>> Ahead of adding support for D128 pgtables, refactor places that print
>> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
>> macro to prepare the argument(s). When using D128 pgtables in future,
>> we can simply redefine __PRIpte and __PTIpte_args().
>>
>> Besides there is also an assumption about pxd_val() being always capped
>> at 'unsigned long long' size but that will not work for D128 pgtables.
>> Just increase its size to u128 if the compiler supports via a separate
>> data type pxdval_t which also defaults to existing 'unsigned long long'.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  include/linux/pgtable.h |  5 +++++
>>  mm/memory.c             | 29 +++++++++++++++++++----------
>>  2 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index a50df42a893f..da17139a1279 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -17,6 +17,11 @@
>>  #include <asm-generic/pgtable_uffd.h>
>>  #include <linux/page_table_check.h>
>>  
>> +#ifndef __PRIpte
>> +#define __PRIpte		"016llx"
>> +#define __PRIpte_args(val)	((u64)val)
>> +#endif
>> +
>>  #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
>>  	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
>>  #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 07778814b4a8..cfc3077fc52f 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -532,9 +532,15 @@ static bool is_bad_page_map_ratelimited(void)
>>  	return false;
>>  }
>>  
>> +#ifdef __SIZEOF_INT128__
>> +	typedef u128 pxdval_t;
> 
> I don't think the typedef should be indented.

Sure will drop the indent from pxdval_t.

> 
>> +#else
>> +	typedef unsigned long long pxdval_t;
>> +#endif
> 
> Don't we want this in, say, include/linux/pgtable.h?
> 

Sure will move the typedef into the above header.

