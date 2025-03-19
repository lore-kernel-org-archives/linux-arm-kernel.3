Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D6C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwbDDdrKmVufwkLsG5ZFXt6hDLhwPdGgwK2HRLxnZp8=; b=3XKMIskZBDBSmSKgl5znndhRND
	NJrkLotHEGVmGhpMYBGar6VzkSgkF2CYv2qN+8CS5DQ0jV/dLJBuKksIWDgVsvX4Zejkt/2F9cVEv
	JPjUk5Ebou4Xi9F/DTGwgWzI1+QJ5gQCT7kV8I6WXcfYP9nEp8pGbAFG/fmjgFe1+ly911N7Yz0tv
	aMfb2HuEEyntse2wYV1CrplnFOuqXY6SIO9MWv7Ks6/LLJSM5vmnI69omo2F7CtoONXy4D+NKellg
	ut5ZlA2aNmje8v8Z17KL2F3mYzZPA5orecWI50XTOdHtmUxIlK1sY8r0o6/dchC99GzATed02CU96
	gWBWlViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumXM-000000085rv-0qk4;
	Wed, 19 Mar 2025 06:04:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumVd-000000085iE-46gY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 06:02:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 603D312FC;
	Tue, 18 Mar 2025 23:02:39 -0700 (PDT)
Received: from [10.162.16.153] (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9D983F694;
	Tue, 18 Mar 2025 23:02:28 -0700 (PDT)
Message-ID: <1c35a8c5-324b-4c60-9bf1-a5414481e5ad@arm.com>
Date: Wed, 19 Mar 2025 11:32:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-kernel@vger.kernel.org
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
 <20250221094449.1188427-2-anshuman.khandual@arm.com>
 <Z9lWJsA2hg2UKZ0T@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z9lWJsA2hg2UKZ0T@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_230234_107642_CA7315EF 
X-CRM114-Status: GOOD (  16.05  )
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

On 3/18/25 16:46, Mark Rutland wrote:
> On Fri, Feb 21, 2025 at 03:14:48PM +0530, Anshuman Khandual wrote:
>> [pgd|p4d]_present() are inverse to their corresponding [pgd|p4d]_none().
> 
> Maybe their implementations happen to be inverse today, but the semantic
> of pXX_present() is not the inverse of the semantic of pXX_none(). In
> general, !pXX_none() does not imply pXX_present().

Agreed.

> 
>> So [pgd|p4d]_present() test right after corresponding [pgd|p4d]_none()
>> inverse test does not make sense. Hence just drop these redundant
>> checks.
> 
> I think the checks make sense in abstract, even if they're redundant
> today

Okay.

> 
> Is there any reason to remove these specific case?

Just for optimization.

> 
> Surely the compiler optimizes these out when they're redundant?

Agreed. Although wondering if p4d_present() is the right thing to test.
Should it be replaced with a p4d_bad() check instead because subsequent
calls into either unmap_hotplug_pud_range() or free_empty_pud_table() 
requires given entry to be a table to proceed further successfully.

> 
> Mark.
> 
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/mm/mmu.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b4df5bc5b1b8..66906c45c7f6 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -952,7 +952,6 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
>>  		if (p4d_none(p4d))
>>  			continue;
>>  
>> -		WARN_ON(!p4d_present(p4d));
>>  		unmap_hotplug_pud_range(p4dp, addr, next, free_mapped, altmap);
>>  	} while (addr = next, addr < end);
>>  }
>> @@ -978,7 +977,6 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
>>  		if (pgd_none(pgd))
>>  			continue;
>>  
>> -		WARN_ON(!pgd_present(pgd));
>>  		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
>>  	} while (addr = next, addr < end);
>>  }
>> @@ -1114,7 +1112,6 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>>  		if (p4d_none(p4d))
>>  			continue;
>>  
>> -		WARN_ON(!p4d_present(p4d));
>>  		free_empty_pud_table(p4dp, addr, next, floor, ceiling);
>>  	} while (addr = next, addr < end);
>>  
>> @@ -1153,7 +1150,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>>  		if (pgd_none(pgd))
>>  			continue;
>>  
>> -		WARN_ON(!pgd_present(pgd));
>>  		free_empty_p4d_table(pgdp, addr, next, floor, ceiling);
>>  	} while (addr = next, addr < end);
>>  }
>> -- 
>> 2.30.2
>>

