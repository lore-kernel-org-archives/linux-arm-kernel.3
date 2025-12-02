Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7FCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 05:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmlGapgAOn6oKILJUALF6nuonOKxFzrwkGnc3n/c30M=; b=RsNCIsO2SrcmY+xqB0/e8BLAA+
	EaxM1V9qGaJa5rLvGS9CFdXXMiC2IklswAZKVMIthniz5agqTU109ghtqqSuB4KVHtebE2J1vhcWv
	7sa8XWsMMtFGVgByLI7DMls1Ivo9+sSxfBedDRkZjx1v473GAjsuTGB6/WgU+sLlGREWJWeSc7jqa
	hlZBVfECPSef/eQnOgO0v2zyTsHiXYBAVR5b+Q5ECO7xtXw5LkqWzTtE47Ume92n1RHRmUqlRruI7
	IPLpVHQ7gzDLJlK9qTfZUYk0IMnYE4ii2Yb4fbGvnrKHrnpKVs1g+fHzcOI41LolIc1ww99L50KVN
	xdnwcoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ5Y-00000004qhv-2fmc;
	Tue, 02 Dec 2025 05:38:12 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ5V-00000004qhT-1zuy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 05:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764653884; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=wmlGapgAOn6oKILJUALF6nuonOKxFzrwkGnc3n/c30M=;
	b=cvwevcK3RuU81qV3xahjstzqcv+hGcePExwV0HMP1nfa8FDLabjJNZNNKg3HE9eIGw/bZIysKKenep8pipySv0WPvq74xA7ls32+ZqZ99cMUIZB16ReCPL97gfnLiT69tq4tGMyLn1xXe4N/X9P5SnNcvDu8N5zxu8USvHWd9fk=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wtv94AB_1764653879 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Dec 2025 13:38:00 +0800
Message-ID: <a2b43faf-cf33-41e5-8997-e4a0471ec3ec@linux.alibaba.com>
Date: Tue, 2 Dec 2025 13:37:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] support batched checks of the references for large
 folios
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1763976541.git.baolin.wang@linux.alibaba.com>
 <341d1aed-13ad-41ee-ad30-487c5baec399@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <341d1aed-13ad-41ee-ad30-487c5baec399@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_213809_720451_24845F19 
X-CRM114-Status: GOOD (  10.35  )
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



On 2025/12/2 00:23, David Hildenbrand (Red Hat) wrote:
> On 11/25/25 01:56, Baolin Wang wrote:
>> Currently, folio_referenced_one() always checks the young flag for 
>> each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, 
>> where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm architecture, which supports contiguous PTEs, there 
>> is already
>> an optimization to clear the young flags for PTEs within a contiguous 
>> range.
>> However, this is not sufficient. We can extend this to perform batched 
>> operations
>> for the entire large folio (which might exceed the contiguous range: 
>> CONT_PTE_SIZE).
>>
>> By supporting batched checking of the young flags and flushing TLB 
>> entries,
>> I observed a 33% performance improvement in my file-backed folios 
>> reclaim tests.
> 
> Can you point at the benchmark or briefly explain what it does? What 
> exactly are we measuring that improves by 33%?

Sorry for not being clear. I've described the performance test in patch 
2, and I should have copied it to the cover letter:

"
Performance testing:
Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and 
try to reclaim 8G file-backed folios via the memory.reclaim interface. I 
can observe 33% performance improvement on my Arm64 32-core server (and 
10%+ improvement on my X86 machine). Meanwhile, the hotspot 
folio_check_references() dropped from approximately 35% to around 5%.

W/o patchset:
real	0m1.518s
user	0m0.000s
sys	0m1.518s

W/ patchset:
real	0m1.018s
user	0m0.000s
sys	0m1.018s
"

