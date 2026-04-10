Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27AFF44846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UciXY4UpwF/PVQ55Oa+nceO1l3r0LRhzvlDseaImpoY=; b=KKOpDMP3uGFQ0HUfeJS/rclTi7
	EQXxfB4KFmA9czi8Vv3sDn+gdblOV1ron/4eINCoAQ2Yki2l25nLOi9Zqm64LY60xl2G9DmsCbM/t
	AF2Bzrv0VOt6PgRMK/lj6uxws+ehIG5FE0RaPXseufvsngHIuXRbNol2paSxgTwYmLTRsNdCXldKm
	NAb7jl8jS6fULn2F71Gole0ZMgUggsviF38anXiTYcyjs8Ai8EeFaN8zBARKHtXvaWZT6A+AcyL2V
	zjN7X1YD1U1tRZEARoqbEIRk8+eMVqmLqnfAr/7Luvqfit5dAgVTGGJ16mM6nK8/Zl73xHYqB1dL2
	2yxkE76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAcj-0000000C7lj-2VgR;
	Fri, 10 Apr 2026 12:06:09 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAcg-0000000C7kd-1kU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:06:08 +0000
Message-ID: <262a41db-a425-4362-bb67-df61119625d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775822752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UciXY4UpwF/PVQ55Oa+nceO1l3r0LRhzvlDseaImpoY=;
	b=S1IPhLac5GLe8aWkzUNhPX1PlP9fq5z3WRAjL+vGJS6PRIGTZh7B7rKGP6zR510zSkjeYf
	K2QNdKANEbpRs7f7uwGklMZu8fyrnR1UsL3rCWPzJNLUoi6SJAO92EUU22rkQ1qumaPnr5
	nnM4xvZ//KZw8+pWbEggmfs0orX141o=
Date: Fri, 10 Apr 2026 13:05:40 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Content-Language: en-GB
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc,
 jack@suse.cz, ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, mhocko@suse.com, npache@redhat.com,
 pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
 surenb@google.com, vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 leitao@debian.org, kernel-team@meta.com
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev> <adjkCOiLgZ_-zovg@lucifer>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <adjkCOiLgZ_-zovg@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_050606_607705_6AD3210C 
X-CRM114-Status: GOOD (  17.63  )
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



On 10/04/2026 12:55, Lorenzo Stoakes wrote:
> On Fri, Apr 10, 2026 at 12:03:03PM +0100, Usama Arif wrote:
>>
>>
>> On 02/04/2026 19:08, Usama Arif wrote:
>>> v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
>>> - Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
>>>   to HPAGE_PMD_SIZE limited to 2M (Rui)
>>> - Reviewed-by tags for patch 1 from Kiryl and Jan
>>> - Remove preferred_exec_order() (Jan)
>>> - Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
>>>   otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
>>>   do_sync_mmap_readahead().
>>> - Change exec_folio_order() to return 2M (cont-pte size) for 64K base
>>>   page size for arm64.
>>> - remove bprm->file NULL check (Matthew)
>>> - Change filp to file (Matthew)
>>> - Improve checking of p_vaddr and p_vaddr (Rui and Matthew)
>>>
>>
>> Hello!
>>
>> Just wanted to check if there was any feedback/review on the latest
>> revision?
> 
> It's -rc7, this is definitely something for next cycle :)
> 

Yeah no worries! Just wanted to check what people thought about it!

> On my part, my upstream bandwidth has drastically reduced, and review is
> probably going to have to be a hobbyist thing at least for now.
> 
> Also, not to be mean but:
> 
> $ git log -E -i --grep "(Reviewed|Acked)-by: Usama Arif" --oneline | wc -l
> 21
> 
> So... :)
> 
> Review in mm is very lop-sided, let's try to balance it out a bit!
> 

Ah yeah actually I have been reviewing a lot over the last few months.
I dont ack patches that have already been acked-by/reviewed-by maintainers.
as I am not sure if it adds anything. I never really cared about Reviewed/Acked
by/patch count but I can start adding tags if it helps in stats.

The reviews I have done over the last week alone:
https://lore.kernel.org/all/20260408122307.1360475-1-usama.arif@linux.dev/ 
https://lore.kernel.org/all/20260408123700.1596800-1-usama.arif@linux.dev/ 
https://lore.kernel.org/all/20260409142256.131676-1-usama.arif@linux.dev/ 
https://lore.kernel.org/all/20260410114809.3592720-1-usama.arif@linux.dev/ 
https://lore.kernel.org/all/20260410112433.3248586-1-usama.arif@linux.dev/ 
https://lore.kernel.org/all/20260331103451.1070175-1-usama.arif@linux.dev/T/#t 
https://lore.kernel.org/all/20260401152343.3294686-1-usama.arif@linux.dev/ 






