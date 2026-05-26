Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8649CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDpo1CN0RJTEn2WPF2oB4CNFhnk25tcXiAZ3ssn8QRk=; b=ESUOvQ8mBhsTDbIfjtrFJHQkUp
	uC1pVbZhedlf6oPSsLDqOeRlSynyJiErsMmOZIeqlWKIp72SYCIOE1g2isrDrgM+p/hp75pTFSzsM
	58dsnPq8Ar0FQVymegAviMSTUEbKrqwactVk9+WWovV+bcRpYhOUiC0scLXasUWBUgKT5cT5mgSDk
	3ttrY/IAhqJSdKQKy7o1sQAgqibKetvHNsPzKt2oaolTj8Wv41rjxH/+Q4eVUlnNbpF7KH5FIH6uM
	sTelzRQROyvmuPH+N6NIAReBC385AyUifip72S2q79kRczlLSOvzhPcCmpNoSN93w+1vgvX1TDBWJ
	Cn+LXLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqMP-00000001r3f-1qV6;
	Tue, 26 May 2026 11:54:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqML-00000001r2z-1XmH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:54:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C1E169C;
	Tue, 26 May 2026 04:54:02 -0700 (PDT)
Received: from [10.43.20.71] (e126510-lin.lund.arm.com [10.43.20.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F78B3F7D8;
	Tue, 26 May 2026 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779796446; bh=HhcY4TG/6pLCS5ZpzHLBZkS5pauDzOZDzxzLR0+SqjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLe2m3YcfahXbF6L9I64v0GrkoUwaoSfBtFJPZh1Es69i5BTm8ud5+HoppYSxqF8x
	 xLrCWMqIkpVaBF4B1n5RlLbhQzwDaIwvIOQUNmMRZSZ37egc8hXFdCi7nuyyQJ/M52
	 IpRd39A1PTh7+YKNFNiYx9CT1/TsMBBprazNAgFk=
Message-ID: <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
Date: Tue, 26 May 2026 13:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
To: Vishal Moola <vishal.moola@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org,
 david@kernel.org
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com> <ahAjudlB32VbkKbG@fedora>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ahAjudlB32VbkKbG@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_045409_581489_18C6AC07 
X-CRM114-Status: GOOD (  14.85  )
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

On 22/05/2026 11:36, Vishal Moola wrote:
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 4c8959153ac4..9d42cbddce27 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>>  
>>  static void free_hotplug_pgtable_page(struct page *page)
>>  {
>> +	if (folio_test_pgtable(page_folio(page)))
> This should work.
>
>> +		pagetable_dtor(page_ptdesc(page));
>> +
>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> In the case we presumably have a page table page (ptdesc) at this
> point, we should really be freeing it with pagetable_free() as well.

Agreed, I think this is the right thing to do, something like:

if (folio_test_pgtable(page_folio(page)))
pagetable_dtor_free(page_ptdesc(page)); else
free_hotplug_page_range(page, PAGE_SIZE, NULL);


Strangely enough x86 calls pagetable_free() in both cases.

My series protecting page tables with pkeys has a patch [1] to get
vmemmap to allocate page tables with pagetable_alloc(). The diff above
will require pagetable_*_ctor() to be called as well, but I think that's
the right thing to do anyway. That could be posted as a separate series,
but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().

- Kevin

[1] https://lore.kernel.org/all/20260526-kpkeys-v8-14-eaaacdacc67c@arm.com/

> Its not a big deal that we don't right now, but losing track of the
> matching allocation/free sites will become a headache when separately
> allocating from struct page.
>
>>  }

