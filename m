Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9F5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbwuurgTDZ+BaZBkyMf18Zq8IPSFXnHhnJxSaiCg6gM=; b=KY39ITL/O6S85g6LLdeH/LV3JS
	ce6U0Do4i/V2TEiMOkscZoHxcLn/ZWhjzOtW2CQX5wURYx3gJLgGFM2Ev9i4wDC/DRAzcKu3fWMUZ
	mYnt653YzK9yrZ9pgz5rOO6o1xN7OUDDBOhDLcpPKbAEwfniYkEHRoXoxT5nsHtXbLEirPmA3ZACa
	mWc/H5YITl6CQC3SHuTv7tm9SkJ7imIRhEYOK/uBZbL4CH5KEaN/ZxGtQDfi8LLZvoCP/XY/BXr20
	uwjDRtR/3KmWErEJgZWmKtYyucuUiSemrGLZbkLVVPFcnwt5kTpDH5SCaLHD+rEduOeoufDLuVWqa
	E8VYJlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdPR-00000005xZR-0ZRu;
	Tue, 01 Jul 2025 16:00:37 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbm2-00000005f6W-3ZyU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:15:53 +0000
Message-ID: <0a96ce38-163e-4566-b666-b074bd82c75a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751379345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbwuurgTDZ+BaZBkyMf18Zq8IPSFXnHhnJxSaiCg6gM=;
	b=rwerCEIAJb39fesv0EF8pOU/ob/YjbEMZ4v0sWNU2xHq0OxhcXljvBD2n5VH+/cKs1v5qS
	GEq/jLdRP4QJopKUgt18uPvXuzdrO+Gw3KUgU3FysEGlvfuCeVyGbBJd7yShJDeT+1GSXC
	8ObslLOB3iUPbBIQR6Kfi8w4SylwS7k=
Date: Tue, 1 Jul 2025 22:15:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Barry Song <baohua@kernel.org>, Lance Yang <ioworker0@gmail.com>
References: <20250630011305.23754-1-lance.yang@linux.dev>
 <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071551_281549_BB466156 
X-CRM114-Status: GOOD (  12.07  )
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



On 2025/7/1 22:03, David Hildenbrand wrote:
> On 30.06.25 03:13, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio's PTE mappings
>> are not fully contained within a single page table.
>>
>> While this scenario might be rare, an issue triggerable from userspace 
>> must
>> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
>> access by refactoring the logic into a new helper, 
>> folio_unmap_pte_batch().
>>
>> The new helper correctly calculates the safe batch size by capping the 
>> scan
>> at both the VMA and PMD boundaries. To simplify the code, it also 
>> supports
>> partial batching (i.e., any number of pages from 1 up to the calculated
>> safe maximum), as there is no strong reason to special-case for fully
>> mapped folios.
>>
>> [1] https://lore.kernel.org/linux-mm/ 
>> a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large 
>> folios during reclamation")
>> Cc: <stable@vger.kernel.org>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Suggested-by: David Hildenbrand <david@redhat.com>
> 
> Realized this now: This should probably be a "Reported-by:" with the 
> "Closes:" and and a link to my mail.

Got it. Both tags (Reported-by/Closes) will be in the next commit ;)


