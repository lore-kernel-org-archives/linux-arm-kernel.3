Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F7BCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGsNvB3fuNc9H1D7trF0TK1admzTZ+TbGNNWBjF/RHw=; b=2olWWHprH2UtZ28960qqh4KHEL
	B+j00QQdrF/saQQ15AshNRvAKimFFvow3BFUq/dEHctOgc5bJCFvoQxe20x2nWj4iUSwCyfZkoy38
	jlo9IuJDlkHPnpxTq04QPhlZCa4Oruq8aHw+O+NLoxHZ8A7qA0Nw6D28F/6oi9kc/AhfcYi1BuFIC
	YR5Ubyqgj/V4orf00J5GgLeGnnsIxuVXYXHaYOtWkId1Wwof4vZMMErqZ4PsmKPtfc7Yb2PUfd16w
	FWF3H/geNBjbafrHVFJi6b9kEnuuZ7OxHCopLS8nrggbteqvhX5I1xTLjZtpUfRT2xgeId5HfRWSN
	SzO1rfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1Vu-00000007asT-1hzB;
	Thu, 21 May 2026 11:24:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1Vr-00000007arU-1UlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:24:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727763D76;
	Thu, 21 May 2026 04:24:20 -0700 (PDT)
Received: from [10.57.91.212] (unknown [10.57.91.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2C53F7B4;
	Thu, 21 May 2026 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779362665; bh=YUoIKZ6fjqCMA7Nsur2Z6SraVqMh2aFofJ9GzDnYzjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jp808FfHIf2INAyNUKjyzFUDdoLUap7tdKuaWXl/u4wTfkRyOswfekFS1kCxGiUyH
	 wnDgqh7JHFp2HxVALetvKZYV93X1ts82Px1WEYektmnKkpF1jkJWcRv/b2OsfAUkpF
	 9Q3XkDfhEXL6TjeFsp5oAm5RuO2Loah1MmBnB0QU=
Message-ID: <60542cd7-d01c-4247-8957-8423b54ae99d@arm.com>
Date: Thu, 21 May 2026 12:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] arm64: mmu: use range based TLB flushing when hot
 unplugging memory
Content-Language: en-GB
To: Balbir Singh <balbirs@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
 david@kernel.org, anshuman.khandual@arm.com, dev.jain@arm.com,
 jhubbard@nvidia.com
References: <20260521042426.2128731-1-apopple@nvidia.com>
 <bc96d822-bb68-4945-9f74-68f77e389ac6@arm.com> <ag7fy4Q9foBBlUcd@parvat>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ag7fy4Q9foBBlUcd@parvat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_042427_479994_574C9817 
X-CRM114-Status: GOOD (  22.14  )
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

On 21/05/2026 11:46, Balbir Singh wrote:
> On Thu, May 21, 2026 at 09:50:04AM +0100, Ryan Roberts wrote:
>> On 21/05/2026 05:24, Alistair Popple wrote:
>>> Hot unplugging memory on ARM64 requires a TLB invalidate after unmapping
>>> the page to be hot unplugged from the direct map. Currently that happens
>>> one page at a time, meaning range based invalidates cannot be used. The
>>> result of this is that removing large amounts of memory takes a long
>>> time and in some cases can trigger an RCU stall warning.
>>>
>>> For example on one system hot unplugging 480GB of memory takes ~1
>>> minute. With this change the same operation took ~1 second, a 60x
>>> improvement.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>
>>> ---
>>>
>>> This is an RFC, because I'm not sure the change is correct as it frees
>>> the PTE page before flushing the TLB. I'm not familiar enough with ARM64
>>> architecture to be sure this is safe, for example I don't know if HW
>>> can update PTE bits such as access/dirty in the page through a stale
>>> TLB entry.
>>>
>>> If so this would open a window during which the page is free but could
>>> still be written to. Likely the safe option would be to collect all the
>>> pages to be free on a list and free them after doing the range based TLB
>>> flush, but wanted to get feedback on the approach before implementing it
>>> which is the goal of this RFC.
>>
>> Hi Alistair,
>>
>> This patch doesn't apply on v7.1-rc4 because it conflicts with this patch:
>>
>> Commit 48478b9f79137 ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()")
>>
>> which has a very similar performance improvement, so hopefully it solves your
>> problem?
>>
>> There are two paths which use this logic; unmapping the linear map and unmapping
>> the corresponding vmemmap. In the latter case, the memory is also freed, so we
>> can't safely do the range optimizaiton there since the TLB needs to be flushed
>> before freeing the memory. But the linear map is the big, slow bit so hopefully
>> it's sufficent for you?
>>
> 
> I assume vmemmap path is for tearing down the struct pages corresponding
> to the physical memory and vmemmap teardowns taking a flush should be
> OK. It is worth checking if the issue is already fixed.

Yes, exactly. Assuming you're using 64K pages, I think vmemmap is mapped using
base pages. So you'd get 1024 struct pages on a page, so 1 TLBI per 64M of
memory that is being unplugged on the vmemmap path.

On the linear map path, it's a single range tlbi operation to over the entire range.

Alistair's patch is doing it per 512M in both cases, but is unsafe for vmemmap
as currently written.

> 
> Balbir
> <snip>


