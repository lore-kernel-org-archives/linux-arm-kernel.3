Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFDC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhlxUmbtGrN/Fi/8JB02PdHGCtyrMcpQVPsHqrJvREk=; b=rpkUick3Q8mRGsvMwRJkSECwgW
	GElf+8h0q9MnF5XfP9TMx6P2aiAxwH5++eKVJn1J2eToYK52VEs9H4+LQlNlW3I2uDfo34SZ7JCH7
	Acz1CPIZRROzMvMhFd6lDR3QmqhmqfwzlPiEFFeC0ZYZISLn/qcItj/M1YTNSRmfQV0D8Og+83VUK
	hyYCU5i5VtDNgpfZdEGnS7uX1xIgxCPvxhqCoJVq416yga1R2nIo4B9N01Jws+uKU7ciitV2e236d
	sRTPuVWi9Bz8rAtuBw0FDcu8OWbzgOrSmGTynqa6XazHhyPuv60z1j831uuPQ9g+Rm18kztdJXgFe
	CArD4pLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwhR-0000000FLue-0Usb;
	Fri, 13 Jun 2025 05:11:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwf9-0000000FLmY-1nA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 05:09:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 290A31D14;
	Thu, 12 Jun 2025 22:08:48 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEB693F66E;
	Thu, 12 Jun 2025 22:09:05 -0700 (PDT)
Message-ID: <5c22c792-0648-4ced-b0ed-86882610b4be@arm.com>
Date: Fri, 13 Jun 2025 10:39:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during
 ptdump_check_wx()
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250609041214.285664-1-anshuman.khandual@arm.com>
 <20250612145808.GA12912@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250612145808.GA12912@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_220911_561599_D13D5281 
X-CRM114-Status: GOOD (  13.88  )
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



On 12/06/25 8:28 PM, Will Deacon wrote:
> On Mon, Jun 09, 2025 at 05:12:14AM +0100, Anshuman Khandual wrote:
>> The arm64 page table dump code can race with concurrent modification of the
>> kernel page tables. When a leaf entries are modified concurrently, the dump
>> code may log stale or inconsistent information for a VA range, but this is
>> otherwise not harmful.
>>
>> When intermediate levels of table are freed, the dump code will continue to
>> use memory which has been freed and potentially reallocated for another
>> purpose. In such cases, the dump code may dereference bogus addresses,
>> leading to a number of potential problems.
>>
>> This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
>> ("arm64/mm: Hold memory hotplug lock while walking for kernel page table
>> dump")' but a same was missed for ptdump_check_wx() which faced the race
>> condition as well. Let's just take the memory hotplug lock while executing
>> ptdump_check_wx().
> 
> How do other architectures (e.g. x86) handle this? I don't see any usage
> of {get,put}_online_mems() over there. Should this be moved into the core
> code?

Memory hot remove on arm64 unmaps kernel linear and vmemmap mapping while
also freeing page table pages if those become empty. Although this might
not be true for all other architectures, which might just unmap affected
kernel regions but does not tear down the kernel page table.

