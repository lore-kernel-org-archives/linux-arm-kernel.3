Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E150DF36BA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHebwTdaLWNAvs0/4wxR9L58v575xxVmSaA4yoh/ZUo=; b=o5f0Ub/n9IZ4XPv+1OOzlxBXm3
	kbzMOE4TGCL+3kGHJfwY1bNnKvIPi2uaa1w28MqmR+wSmArqTBKbnneKx2uCtudFkukRNMEMzePSG
	vQeEQCfipjQk8IjulxysSWUoikKDXkQ2gSZQQq6sKZ/RFO4QuBhLjs001AdmBnGgBz1G1k3sN12El
	V5yRRT2ppbRHZWPDqGop1mFtp0yVvqFA/YVmA0gUtmzLjeNdz8526vekP41/edc7PQczbJA8TryjE
	ZhEHleSpZrgcGQx4C/GfGoYWH5jMfPU8iNbVNG+BTVYZXJKDBkoa+9mTbTPPNJCiIO8oW1oR7msxj
	t2GESsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3Ue-0000000BaUw-1SKz;
	Fri, 10 Apr 2026 04:29:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3Ub-0000000BaUZ-0UmK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:29:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B4522008;
	Thu,  9 Apr 2026 21:29:08 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E5A3FAF5;
	Thu,  9 Apr 2026 21:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775795354; bh=BSdQ3Ls3b2H01n0rpr+1N/SbRJC1dCvd44chWo22Nbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bjxI+aQ8zFM9SyTQFzyGuKMzJg2y75xsC8VOiuWuEm99z0f5vvZn0tIA7wR7+h4Iy
	 CzNTVCPduKNC02eWJmFtnGR1w9MZ9FUvS9hdN6XbJhkRIfwFDfcxyUx3QXbrABvHxb
	 FKKbokiyNtbnCQKEVUV+bW6T2cZvHRUFw5fAnldY=
Message-ID: <8ae905bd-fb1c-408d-bf50-77667a51e3a1@arm.com>
Date: Fri, 10 Apr 2026 09:59:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 02/16] mm: Add read-write accessors for vm_page_prot
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-3-anshuman.khandual@arm.com>
 <adeBg_eZvmz-ST67@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <adeBg_eZvmz-ST67@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_212917_291112_C82E48F2 
X-CRM114-Status: GOOD (  16.46  )
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



On 09/04/26 4:07 PM, Mike Rapoport wrote:
> Hi Anshuman,
> 
> On Tue, Feb 24, 2026 at 10:41:39AM +0530, Anshuman Khandual wrote:
>> Currently vma->vm_page_prot is safely read from and written to, without any
>> locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
>> tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
>> be handled with READ_ONCE() and WRITE_ONCE().
>>
>> Add read and write accessors for vm_page_prot like pgprot_read/write_once()
>> which any platform can override when required, although still defaulting as
>> READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  include/linux/pgtable.h | 14 ++++++++++++++
>>  mm/huge_memory.c        |  4 ++--
>>  mm/memory.c             |  2 +-
>>  mm/migrate.c            |  2 +-
>>  mm/mmap.c               |  2 +-
>>  5 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index da17139a1279..8858b8b03a02 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -495,6 +495,20 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>  }
>>  #endif
>>  
>> +#ifndef pgprot_read_once
>> +static inline pgprot_t pgprot_read_once(pgprot_t *prot)
> 
> I don't think we need _once in the helper name. Presence of the helper
> already implies that pointer should not be just dereferenced from one side
> and that using the helper will do The Right Thing from the other side.


Makes sense - will drop __once from the helper name.


