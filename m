Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF0CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kS2/t4WMcop90OBAdv6xyzgwcxg8jB4J+AFsz/icfk=; b=gYxTFEui1dhQvT5dencajW7gd9
	8bGf1xuGPTZMkoaCyqVh5o2fHMiupvx9peNN5MV9a7m6sb8YsoZHXKzYaDf8hx2JNoOpYXbNJhh78
	8yVv+wzb+Xab+F0YxuMGorTQwOZ3XjOXOU7QtoFZsYJgEuKR7P4K6pa3UMlY1anY0htJiAbQwP6bZ
	E1LtEGw3b14Vf3mhxmxtw4tAC8ZZ4bCyjJLuXV/xCKJqq5ytUJHq92HgYGI95oygbyPXwd1WlMfAz
	NQqdtWujqlyEl97U9epjixA9RpqnQYp4Hsku3xVRqUGqhk6vJOf9kncj7/E73z2NbPhslrmMVbiGV
	L/uGxE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCWN-00000009E5u-3ag1;
	Fri, 25 Jul 2025 07:07:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCTY-00000009Dk8-1dmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753427054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4kS2/t4WMcop90OBAdv6xyzgwcxg8jB4J+AFsz/icfk=;
	b=DFjcT8PpzKJk891fC6vZ76tkol8Ug3YqzlpdJfC2/7bYmXF9XfiCgvPZnzSr9QQTawRN2N
	le+ftFIGr+9ZNbTLOtw0MFndFwb+9tJ89IkNYLRa1cFUlYxopadRKveTzW3t07GZ19Os6Z
	L5lWfK+V/LDOnGMVDeRPZfC7cCjzQDc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-elWnYebINPWed0DZCBH7Jg-1; Fri, 25 Jul 2025 03:04:13 -0400
X-MC-Unique: elWnYebINPWed0DZCBH7Jg-1
X-Mimecast-MFC-AGG-ID: elWnYebINPWed0DZCBH7Jg_1753427052
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a58939191eso728590f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 00:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753427052; x=1754031852;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4kS2/t4WMcop90OBAdv6xyzgwcxg8jB4J+AFsz/icfk=;
        b=FVJGuj8iw+0TXQXKpCygfKMz5OS5TrMDWvljxfWWwL550ENgH7QMgOVIg/kZCWF+RM
         uHrpWNhfoYUpNOKyQLaH9lQA/fondXgR9iMeG/Sua5qsZcO14zDrhpIhwkrCN5QUJxIL
         2+kvhA8ZivX9+Q1k4fvF5WLAtwTYGqaD1xfITSscJ8CJ81j4D8e4AHmo/JP3sdDsF+IK
         F2QdvePWyV/Tyw6jSJjI93VBG0p+m4m2aNNtDR3gDLzf4z4LqMEr0iu1HsoG8NExV6cn
         ONvHTzXKaoMb8tOmTbozm4SyXqhySf8dCpDmbmBTD8M9e7eiZ88Xn8Lr9h+ozFRnACnU
         c+rg==
X-Forwarded-Encrypted: i=1; AJvYcCW4BUMIKDL8HImwUSCrL7LUKXxQJRV+UgUCvsnHNgB3rZ4Uk5Rp4sMsAsyjC/RHHhYpkEv6pcjgvjshnlVMaFHy@lists.infradead.org
X-Gm-Message-State: AOJu0YxFtluo7ryJLbjRiTN/tUuDdHNPfsV419tuGCqpy/sZp3I6kqhI
	s2EYINhnVGBN16SSqkFkKHS4oP0tXQrTOylhEfgdLDrxbaXaPci5dZIOUokN79hAz9HhVm5SmVk
	pkWs+d3mdRBNp1RF9L4SSLUKr4g1ytQe8OscCpe7Mm2GgNMTFJOg30K8LIfpdL3g8rBMy7dkLZc
	3J
X-Gm-Gg: ASbGncvXvam7+sCgYqkxfMqROj8pWWdE33QYUFDBrF5AcDUCsCnPnax9HbpIGFH1DBe
	niYF36X1jN6sE2ulOevHC85ubOhIxGHORoK6w4MlxGQyAd8/0wGmnVasw1uTAvDA/9lTarJIbKC
	WN73MShmCQgtHnTBMtUJeKvS0t7Qx37uEKwifmWhRBT9TQne3ugDGYFEA/UuYKUP8YJmSVD0xxh
	qDHeSGgQj0d698f8vpg5akPCQLdQ5HYT1UJOb/UBFry/SnLu54ZKPLlWRZ7L65PTSunsunolmud
	mJLFYPkUfRf4tKC/yTzXuV0gDTtkmITOya2WkUZ8NLuC11KLEMmlD1YS12rf2UAGBmSAjQ==
X-Received: by 2002:a05:6000:2585:b0:3b6:1a5a:a64f with SMTP id ffacd0b85a97d-3b7765ede34mr717069f8f.17.1753427051917;
        Fri, 25 Jul 2025 00:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPMmiOSrgMj31SBrK8QNvmBgBxAu5I2pasvIE6YWJSNABwM8LEBf/FFALfw+SN8Yg7nqPpSA==
X-Received: by 2002:a05:6000:2585:b0:3b6:1a5a:a64f with SMTP id ffacd0b85a97d-3b7765ede34mr717026f8f.17.1753427051321;
        Fri, 25 Jul 2025 00:04:11 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0fd5a.dip0.t-ipconnect.de. [79.224.253.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587272b405sm22756835e9.19.2025.07.25.00.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 00:04:10 -0700 (PDT)
Message-ID: <c678789a-4fe3-46f0-9cba-9298b55b328a@redhat.com>
Date: Fri, 25 Jul 2025 09:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: "akash.tyagi" <akash.tyagi@mediatek.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, surenb@google.com, mhocko@suse.com,
 jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 chinwen.chang@mediatek.com
References: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
 <20250725050810.1164957-1-akash.tyagi@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250725050810.1164957-1-akash.tyagi@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ItYjWvqEKQMUq78Z9LB0se6-ukoWoVx54RGHEr8zUg_1753427052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000416_510290_A090CE30 
X-CRM114-Status: GOOD (  17.32  )
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

On 25.07.25 07:08, akash.tyagi wrote:
> Hi David,
> 
> Thank you for your feedback.
> 
> We encountered this issue in the Android Common Kernel (version 6.12), which uses PCP lists for CMA pages.
> 
> page_owner trace-
> Page allocated via order 9, mask 0x52dc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_ZERO), pid 1, tgid 1 (swapper/0), ts 1065952310 ns
> PFN 0x23d200 type Unmovable Block 4585 type CMA Flags 0x4000000000000040(head|zone=1|kasantag=0x0)
>   post_alloc_hook+0x228/0x230
>   prep_new_page+0x28/0x148
>   get_page_from_freelist+0x19d0/0x1a38
>   __alloc_pages_noprof+0x1b0/0x440
>   ___kmalloc_large_node+0xb4/0x1ec
>   __kmalloc_large_node_noprof+0x2c/0xec
>   __kmalloc_node_noprof+0x39c/0x548
>   __kvmalloc_node_noprof+0xd8/0x18c
>   nf_ct_alloc_hashtable+0x64/0x108
>   nf_nat_init+0x3c/0xf8
>   do_one_initcall+0x150/0x3c0
>   do_initcall_level+0xa4/0x15c
>   do_initcalls+0x70/0xc0
>   do_basic_setup+0x1c/0x28
>   kernel_init_freeable+0xcc/0x130
>   kernel_init+0x20/0x1ac
>   
> This UNMOVABLE page was allocated from CMA, but it could not be migrated - so CMA alloc failed
> At first, we fixed this by adding CMA THP pages to the movable THP PCP list.
> This fixed the issue of CMA pages being put in the wrong list, but now any movable allocation can use these CMA pages.
> 
> Later, we saw that a movable allocation used a CMA page and was pinned by __filemap_get_folio(). This page was pinned for too long, and eventually, CMA allocation failed
> 
> page_owner trace-
> Page allocated via order 0, mask 0x140c48(GFP_NOFS|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE), pid 1198, tgid 1194 (ccci_mdinit), ts 17918751965 ns
> PFN 0x207233 type Movable Block 4153 type CMA Flags 0x4020000000008224(referenced|lru|workingset|private|zone=1|kasantag=0x0)
>   post_alloc_hook+0x23c/0x254
>   prep_new_page+0x28/0x148
>   get_page_from_freelist+0x19d8/0x1a40
>   __alloc_pages_noprof+0x1a8/0x430
>   __folio_alloc_noprof+0x14/0x5c
>   __filemap_get_folio+0x1bc/0x430
>   bdev_getblk+0xd4/0x294
>   __read_extent_tree_block+0x6c/0x260
>   ext4_find_extent+0x22c/0x3dc
>   ext4_ext_map_blocks+0x88/0x173c
>   ext4_map_query_blocks+0x54/0xe0
>   ext4_map_blocks+0xf8/0x518
>   _ext4_get_block+0x70/0x188
>   ext4_get_block+0x18/0x24
>   ext4_block_write_begin+0x154/0x62c
>   ext4_write_begin+0x20c/0x630
> Page has been migrated, last migrate reason: compaction
> Charged to memcg /
> 
> 
> Currently, free_unref_page treats CMA pages as movable. So, some MOVABLE allocations may use these CMA pages and pinned them. Later, when CMA needs these pages, these pages failed to migrate.


MOVABLE allocations commonly fallback to CMA allocations, independent of pcp.

Long-term pinning is forbidden on MIGRATE_CMA pages. We had a bug recently fixed,
maybe you ran into that?

See

commit 517f496e1e61bd169d585dab4dd77e7147506322
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Jun 11 15:13:14 2025 +0200

     mm/gup: revert "mm: gup: fix infinite loop within __get_longterm_locked"
     
     After commit 1aaf8c122918 ("mm: gup: fix infinite loop within
     __get_longterm_locked") we are able to longterm pin folios that are not
     supposed to get longterm pinned, simply because they temporarily have the
     LRU flag cleared (esp.  temporarily isolated).
     
     For example, two __get_longterm_locked() callers can race, or
     __get_longterm_locked() can race with anything else that temporarily
     isolates folios.

But there is this known problem that CMA can fail temporarily due to
short-term pinnings. See the "reliable CMA" work (don't remember the exact name).

So what you proposed in the patch at least does not apply I think.

-- 
Cheers,

David / dhildenb


