Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A12CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7djlgJKB5AbdLDRTA3sa6y8E/p7KUfRcePniXyQOCw=; b=aUsUana/q3YahAuua0LoB/PxTA
	vWEGwfnjSO8bbqCKuXhivuIVR0VdTgWu5aIrX6cKHaVUKkfZwOJTMShqiFbE86nnklDcntZxwfbZl
	jmbcWnV+qOGlpbaDGjbJvSzanOwq2+BEuFIcCHPHHIrtGguqGlkMVQyorUCbhn7JxDJXdiX4OCjab
	naAC25xp4u3c5vwwEGhuz0raAIP9HJynuj4XiavDrO+ZQcfT6yH+W1MYUx7xw/uH9PZwB1Gg+v7qH
	8oar/mMLItfcv1m127VVnB0Mw4P/im/cLnmblx5lmVjQf90IGFn6d0FyzvFNdJQjmSvKQZbdx23LH
	/YM2Q9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvfA-00000002kuP-0QYy;
	Fri, 15 Aug 2025 14:44:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtI2-00000002R1E-2lSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 12:12:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C3731691;
	Fri, 15 Aug 2025 05:12:01 -0700 (PDT)
Received: from [10.57.56.228] (unknown [10.57.56.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD4A3F738;
	Fri, 15 Aug 2025 05:12:06 -0700 (PDT)
Message-ID: <f53dd685-4e05-4fd3-a49d-0074b69a8ce1@arm.com>
Date: Fri, 15 Aug 2025 14:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/mm: Allow __create_pgd_mapping() to propagate
 pgtable_alloc() errors
To: Dev Jain <dev.jain@arm.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
 <20250813145607.1612234-2-chaitanyas.prakash@arm.com>
 <683f9f4e-c027-4165-a8aa-b561e304e132@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <683f9f4e-c027-4165-a8aa-b561e304e132@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_051210_739555_F4E14375 
X-CRM114-Status: GOOD (  12.47  )
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

On 15/08/2025 09:30, Dev Jain wrote:
>
> On 13/08/25 8:26 pm, Chaitanya S Prakash wrote:
>> [-------snip-------------]
>>   -static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>> +static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>                    unsigned long virt, phys_addr_t size,
>>                    pgprot_t prot,
>>                    phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>>                    int flags)
>>   {
>> +    int ret = 0;
>> +
>>       mutex_lock(&fixmap_lock);
>> -    __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>> -                    pgtable_alloc, flags);
>> +    ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>> +                      pgtable_alloc, flags);
>>       mutex_unlock(&fixmap_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static void ___create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>> +                  unsigned long virt, phys_addr_t size,
>> +                  pgprot_t prot,
>> +                  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
>> +                  int flags)
>> +{
>> +    int ret = 0;
>> +
>> +    ret = __create_pgd_mapping(pgdir, phys, virt, size, prot,
>> pgtable_alloc,
>> +                   flags);
>> +    BUG_ON(ret);
>>   }
>
> A triple underscore calling a double underscore isn't natural to
> reason about.

Also not the most readable (easy to confuse the two).

> Since this is the function which must succeed, how does
> "must_create_pgd_mapping()"
> sound?

"must" isn't a prefix that is commonly used in that sense, not sure this
is very clear.

Another idea that comes to mind is early_create_pgd_mapping() - the
BUG_ON() being justified by the fact that early errors are not recoverable.

On a related note, it would be possible to return an error from
create_pgd_mapping() and create_mapping_noalloc() as their callers
already have error paths. That would be a bit cleaner but I don't know
if it's worth the hassle.

- Kevin

