Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC57CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oujTjuUbBnzxFvoPRkm5vktMDYZXjKawZfKYSeTKjOg=; b=QaMZI8my95otZ0kDp0azBWaeMR
	yJcFUWu9wya/K3EnIFWvkV5GjyGkNvuJ6Cpi2yXjCXUW6+VGMmMETl4P+HLLFa85Dt8ZdCfUEI1FD
	7UkmHYY8ctEjSRLcrcn3RGfdop9D2nr8v8mfN/ZQuPRHZNsbvL5I9F06PQ0jq5NhrJUgQ5zqbZvU4
	zqIc+JmnIuFX+4VCxdaN8R+fwxyh7NR4Wgb8USJVdgMv/x7VvfOWge3/mXMwGQeVijMC09A4w5kQI
	lMZgtdVmgSkcLPu6EUGVtdadX17mEVAFsKSLXh9OvvFUwC65UgHxZ5YTthHNI4KBEmkYZONjTml3a
	cCd1Mz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9FZ-0000000Bcty-0BDk;
	Thu, 04 Sep 2025 12:39:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7q1-0000000B7Iv-10Qk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:09:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9691756;
	Thu,  4 Sep 2025 04:09:00 -0700 (PDT)
Received: from [10.1.37.179] (XHFQ2J9959.cambridge.arm.com [10.1.37.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669B33F6A8;
	Thu,  4 Sep 2025 04:09:06 -0700 (PDT)
Message-ID: <d6e6b96e-1bee-4af0-9343-9fb365beb4b3@arm.com>
Date: Thu, 4 Sep 2025 12:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-4-ryan.roberts@arm.com> <aLiTzJ6E-YBIYuGo@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLiTzJ6E-YBIYuGo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040909_333332_DC5EE343 
X-CRM114-Status: GOOD (  10.56  )
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

On 03/09/2025 20:15, Catalin Marinas wrote:
> On Fri, Aug 29, 2025 at 12:52:44PM +0100, Ryan Roberts wrote:
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 34e5d78af076..114b88216b0c 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -481,6 +481,8 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>>  			     int flags);
>>  #endif
>>  
>> +#define INVALID_PHYS_ADDR	-1
> 
> Nitpick: (-1UL) (or (-1ULL), KVM_PHYS_INVALID is defined as the latter).

Fair. Will fix.

> 
> Otherwise the patch looks fine.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Cheers! But I think we need to solve the issue where code is ignoring the error
code problem that Dev raised before merging this.

