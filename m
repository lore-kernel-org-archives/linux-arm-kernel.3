Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5535E7E0BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuHdmbMe8FhR6HcphPrJrW4PyN3G5yZpYJxJ7bkfPFc=; b=txlZh7DyBckTaaLK1WGqht5VqC
	fKu3bITxVWMy+UsNTwdx04EOZqki46/LDZWoASBX+yhO8kjPD9MWf5jhgjKhiLxrst5uIHEyAh+po
	wWvBhbbqeuK8adZiw2gigM/X3G48EhcCn2k7stsAqmNQ5npjdzZsS7EgaTCg1QasMNAdwpd979ZvT
	3fGfdc1P6T4LJ6c8rW+8MopY3f9S/vu8a/KOvwoI8wrmj2u/X84O28Au5go6vEMn+S6+WaiIRSYli
	42cFpw+1E0EnBVwS8ULNjLqFhzjZclbKjTGdC1Wj9c+0qZ0LL3+weV5yKQW2X8+bzMpzVNs7Zj742
	cpBZSFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOGx-0000000FE6o-2qAA;
	Mon, 09 Feb 2026 10:13:39 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOGt-0000000FE5z-2FkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770632005; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KuHdmbMe8FhR6HcphPrJrW4PyN3G5yZpYJxJ7bkfPFc=;
	b=POAR/kR+itr8r9JLpdwzPTAGBZ/kh2Q1FZ/90OmjUOVv4GTuryNWkayM+tW2eUYSh5tdKPnFktFa1jw9lBvLTVkpM7f+yEbC2yd4C1JGQJpJpbOD+ASKwjfubR/P95lqKWS1mrsrJ8KOb2YtgbSkYt/5+d9luTksSkFNmf3nkKc=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WyqmBGB_1770632001 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 18:13:21 +0800
Message-ID: <6817c7b9-e67c-46b6-b3b5-1bc3d9eed4a2@linux.alibaba.com>
Date: Mon, 9 Feb 2026 18:13:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: "David Hildenbrand (Arm)" <david@kernel.org>, Chris Mason <clm@meta.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260128114936.72280-1-clm@meta.com>
 <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
 <07d55759-a50a-457a-badd-85697174116f@kernel.org>
 <280ae63e-d66e-438f-8045-6c870420fe76@linux.alibaba.com>
 <16fb7985-ec0f-4b56-91e7-404c5114f899@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <16fb7985-ec0f-4b56-91e7-404c5114f899@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_021336_340006_CE89E0DF 
X-CRM114-Status: GOOD (  15.74  )
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



On 2/9/26 5:55 PM, David Hildenbrand (Arm) wrote:
> On 2/9/26 10:36, Baolin Wang wrote:
>>
>>
>> On 2/9/26 5:09 PM, David Hildenbrand (Arm) wrote:
>>> On 1/29/26 02:42, Baolin Wang wrote:
>>>>
>>>>
>>>>
>>>> Indeed. I previously discussed with Ryan whether using pte_cont() 
>>>> was enough, and we believed that invalid PTEs wouldn’t have the 
>>>> PTE_CONT bit set. But we clearly missed the device-folio cases. 
>>>> Thanks for reporting.
>>>>
>>>> Andrew, could you please squash the following fix into this patch? 
>>>> If you prefer a new version, please let me know. Thanks.
>>>
>>> Isn't the real problem that we should never ever ever ever, try 
>>> clearing the young bit on a non-present pte?
>>>
>>> See damon_ptep_mkold() how that is handled with the flushing/notify.
>>>
>>> There needs to be a pte_present() check in the caller.
>>
>> The handling of ZONE_DEVICE memory in check_pte() makes me me doubt my 
>> earlier understanding. And I think you are right.
>>
>>      } else if (pte_present(ptent)) {
>>          pfn = pte_pfn(ptent);
>>      } else {
>>          const softleaf_t entry = softleaf_from_pte(ptent);
>>
>>          /* Handle un-addressable ZONE_DEVICE memory */
>>          if (!softleaf_is_device_private(entry) &&
>>              !softleaf_is_device_exclusive(entry))
>>              return false;
>>
>>          pfn = softleaf_to_pfn(entry);
>>      }
>>
>>
>>> BUT
>>>
>>> I recall that folio_referenced() should never apply to ZONE_DEVICE 
>>> folios. folio_referenced() is only called from memory reclaim code, 
>>> and ZONE_DEVICE pages never get reclaimed through vmscan.c
>>
>> Thanks for clarifying. So I can drop the pte valid check.
> 
> We should probably add a safety check in folio_referenced(), warning
> if we would ever get a ZONE_DEVICE folio passed.
> 
> Can someone look into that ? :)

Sure, I can take a close look and address that in my follow-up patchset.

