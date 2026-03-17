Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30FEFD8761
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiFrO+qdzRBS30UpjlcTyT9sGWUvl9N5cpLb/NIGpgU=; b=i7fEJq/we9SB5PG2Cnjl8zFtSm
	n/WN4ovDwi5YYpxaiadXnXn+NYEhgb7nqm+4Urv34vcmpMMOoSIAcfwDN5z/XGeKfE4YdIBcMDyoP
	tqbZ88lZs4C2bWmLvTTlOP0LDbJg5s7vFc6CZ6duoPs7MFNsqY95uEke5yWdPxHKZw8TpzhVNWXw9
	mIX6tlDLskOlKHh62Ty7ODwdv/WxzzuX+xJiFJx/yMeZuEoV3L7gm0xnsO2ryzYjvc3hFV8YlAdOt
	WiFZLNc/EyQlg1mIutHVf01Z+zrdSN2/2fixY/F5cz1y5UBu8isg76U/qjv0owpCFcgch6cZQMDJO
	Zv8WUa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TlU-00000006K1w-3xkI;
	Tue, 17 Mar 2026 12:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TlR-00000006K11-3pEO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:43:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2B716F2;
	Tue, 17 Mar 2026 05:43:05 -0700 (PDT)
Received: from [10.57.60.143] (unknown [10.57.60.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C9473F7BD;
	Tue, 17 Mar 2026 05:43:08 -0700 (PDT)
Message-ID: <3d2e8e41-8b41-4d1d-9292-de90425708ec@arm.com>
Date: Tue, 17 Mar 2026 13:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Jinjiang Tu <tujinjiang@huawei.com>,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 david@redhat.com, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <0b2a4ae5-fc51-4d77-b177-b2e9db74f11d@huawei.com>
 <de0b06cf-15a5-4109-b339-75c10d9b8a18@arm.com>
 <0a740020-4780-4156-a9c5-f8b4ada9c8c0@os.amperecomputing.com>
 <4ad2ea40-b23b-4231-a0de-585b205865c5@arm.com>
 <9dded616-989b-4846-8596-1c45a6304d36@arm.com>
 <6c0ed052-5f3c-405a-b53f-4ea21a24479d@arm.com>
 <a76e2d63-7217-407f-bf6c-98cf58dd70c5@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <a76e2d63-7217-407f-bf6c-98cf58dd70c5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_054314_074335_C3CACFCC 
X-CRM114-Status: GOOD (  15.05  )
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

On 17/03/2026 12:45, Ryan Roberts wrote:
> On 17/03/2026 09:29, Kevin Brodsky wrote:
>> On 17/03/2026 10:13, Ryan Roberts wrote:
>>>>>> Another option would be to initially map by pte then collapse to
>>>>>> block mappings
>>>>>> once we have determined that all cpus support BBML2_NOABORT. We
>>>>>> originally opted
>>>>>> not to do that because it's a tax on symetric systems. But we could
>>>>>> throw in the
>>>>>> towel if it's the least bad solution we can come up with for solving
>>>>>> this. I
>>>>>> think it might help some of Kevin's use cases too?
>>>>> May be an option too. When we discussed this there was no usecase for
>>>>> direct mapping collapse. But if we can have multiple usecases, it may
>>>>> be worth it. 
>>> I could imagine that if user space creates and destroys lots of secretmem areas,
>>> then it will completely split the linear map to ptes and that will never recover
>>> currently. So I think in the long term, having the ability to collapse would be
>>> useful. I just don't particularly like forcing symetric systems to map by pte
>>> initially (which is slow) only to collapse later (which will cost even more
>>> time). But it does feel inherrently more robust.
>> Now that you spell it out, I'm realising this would actually make things
>> pretty complicated for protected page tables. In that series, page
>> tables for the linear map are allocated by a separate memblock-based
>> allocator [1], tracking the allocated ranges to set their pkey later.
>> There's a strong assumption that these page tables are never freed.
>>
>> If we initially PTE-mapped the linear map and then later collapsed it,
>> that assumption clearly wouldn't hold. 
> Sorry I don't understand why the assumptions change? All I'm proposing is walkng
> the linear map to find compatible PTEs and collapsing them into the biggest
> possible blocks. The pages aren't being freed, they are just being mapped
> differently (which can be done live for BBML2_NOABORT). PTEs with different
> pkeys would be considered incompatible, so we would end up with a boundary in
> the leaf mappings at that point.

I'm not sure I'm following, if all entries in a PTE page are compatible,
then surely we just convert the parent PMD entry to become a leaf and
then free the PTE page? And same idea one level above.

>
>> It could be handled by poking
>> holes in the tracked ranges, but it gets ugly and increases fragmentation.
> You'd still want page tables to be allocated from contiguous physical (and
> virtual) memory so that the boundaries where pkeys change are minimized.

Yes that's for sure, that's why I'm concerned with individual pages
being freed in a middle of a block.

> I guess I've misunderstood something...

I might have too :/

- Kevin

