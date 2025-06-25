Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7B7C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqF4hhowZcujiHY+iHQl6x5APphUIOsbur9usB3fHMI=; b=1N0c814zPrAfU+vfapg7wjPegJ
	1oX2zo3AJr5p0BU3E3CwCNn57Z71JMdCsmEibB6pFXhNF/zuGokdgwvbPdoWtMfOEZAYSWFSrNJFo
	qjY1ee+EQ5xDjvQo8R+/1qS+XzBgnC1m2fSzfeZgRdQBXBXscmfDYeiXhSsp5mZfnfn2+o34Smrbr
	1Lq+2sYno08S0fQ3tP5g+GHoYHodGhEQRZ4Db/fi7LDXli7bjjcld4z3yhpOgdDf4Eou4xWiMbHqy
	CZG/SZ3MkjTXG3lpVyKZdEpwLXAQ/IdqoG5IJzlrRnUVbXX0y5FfJ3Pxp3piFmpmZ/njSesqDg5tX
	Isfrmipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTK9-00000009NQL-0am5;
	Wed, 25 Jun 2025 16:50:13 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP7z-00000008bcx-48qi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:21:25 +0000
Message-ID: <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqF4hhowZcujiHY+iHQl6x5APphUIOsbur9usB3fHMI=;
	b=dbqPp1zP9dlPKWTDlI3t3zLN5/ONrptH3RYgCcrl9omGqZ7+bmrO3bJa0JRrkvhXraycoV
	elWuByVDPJUxyjtr6uiYD7om3L3B+0RvEw5odBoxkKBn51UWDL3LIG2VCW5LCytZ2sryAb
	zKos2fVOnRiQvX68sWQjMUop6cK7z4g=
Date: Wed, 25 Jun 2025 20:20:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>, Barry Song <21cnbao@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052124_170629_CC4ACE8C 
X-CRM114-Status: GOOD (  18.15  )
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



On 2025/6/25 20:09, David Hildenbrand wrote:
>>
>> Somehow, I feel we could combine your cleanup code—which handles a batch
>> size of "nr" between 1 and nr_pages—with the
>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
> 
> Yeah, that's what I was suggesting. It would have to be part of the 
> cleanup I think.
> 
> I'm still wondering if there is a case where
> 
> if (nr_pages == folio_nr_pages(folio))
>      goto walk_done;
> 
> would be wrong when dealing with small folios.
> 
>> In practice, this would let us skip almost all unnecessary checks,
>> except for a few rare corner cases.
>>
>> For those corner cases where "nr" truly falls between 1 and nr_pages,
>> we can just leave them as-is—performing the redundant check inside
>> page_vma_mapped_walk().
> 
> I mean, batching mapcount+refcount updates etc. is always a win. If we 
> end up doing some unnecessary pte_none() checks, that might be 
> suboptimal but mostly noise in contrast to the other stuff we will 
> optimize out 🙂
> 
> Agreed that if we can easily avoid these pte_none() checks, we should do 
> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes sense.

Hmm... I have a question about the reference counting here ...

		if (vma->vm_flags & VM_LOCKED)
			mlock_drain_local();
		folio_put(folio);
		/* We have already batched the entire folio */

Does anyone else still hold a reference to this folio after folio_put()?

		if (nr_pages == folio_nr_pages(folio))
			goto walk_done;
		continue;
walk_abort:
		ret = false;
walk_done:
		page_vma_mapped_walk_done(&pvmw);
		break;
	}

Thanks,
Lance


