Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCEDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=; b=mvMAyDAv6q6gO19RTlxOu5pcFj
	7rT/SYBrvSB6fJcSGU6/PCJaJI/GztNkjXKaiYUji5Jgaiqn0nxRb/IoSkxt1qo5dMyCM8XDrmMrM
	i1W4urCOcz+pSxb0j1uc5qHdgFvAAHio7i2ld6J9rwFiQShYEFllKFbfuTAefYJYoREijQ8ja/HaN
	y6RYVPKhL1MhjZzjuTAPRsCe/1aW7EQB4+gTdeAH5XGgZz37IBIe06PJ+dLxKrtMUyTzOCQVZ3S3c
	VNosivf2EFeD7aESgr0brabk/AP1TMSXJj3dX5mBQiFZc24N6HirUWCGxZDdCSqWXmIm1kdPwbW3k
	2r2jCINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1LN-0000000BGZF-2VCM;
	Mon, 04 Aug 2025 19:59:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0G3-0000000BBFg-4208
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 18:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754333402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=;
	b=aiKY5AaTebe96qUKti9EP+cEEp0/CPwS0KMp5IFHjcH6Plw9a2smwOB6744xE6ZKvpHNWX
	LVftDXXir3RMho9nJNyksZAHDFN9VBG6SGL42AOkLKhFr6EBpzGAyK/zbDNUMRvUbAMd4k
	Acw5/MaWutyt2eurfaTra/Whf+2LZ6Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-S-HrljeqP6mBTPNVpy8gAQ-1; Mon, 04 Aug 2025 14:50:00 -0400
X-MC-Unique: S-HrljeqP6mBTPNVpy8gAQ-1
X-Mimecast-MFC-AGG-ID: S-HrljeqP6mBTPNVpy8gAQ_1754333400
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-458a31421a3so17390375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 11:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754333399; x=1754938199;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T7UUfiKeOYlsuGZHT7CWAZbKMNooPk/lkfRZ63Id3bE=;
        b=eHxxPHQGqbpEhy3BSYifIos668EHmWV6bC7qb2dMCx2Kh5LO4uCPUaqkckkxLdV1Tr
         52hKVw1JC8LDppniZ6ShkxA8FiUMy+JjYgcSp9nb+iD3WVIEJMloo6mxP6vSLrITOAfz
         7sdSWgPFXYBPWF4wsSQs+K4pw/rwRuEmGnbSs6SGzLaD7QUlJmN1Cld1V3OHkTPvsOe8
         YNW377bIC06Ain9/gw7rLH+1tSd0heSqoX3lah0J08y5otJn7xEovvZzUg41GblN/auf
         uHXJazaMXkEiKc1DV59WuDIfmHRzpPWBG/COC1OyPEZTvktnAnIg+wsipJMZOtt6fjER
         ULXw==
X-Forwarded-Encrypted: i=1; AJvYcCWFx7DXlGJHvv5O6LFtGc5qbBx2cgeryBInGpZ2EYxcNAIvTZjeTJSpsLnkCqps9qagCx3d0hPbRphGkO4S6aLv@lists.infradead.org
X-Gm-Message-State: AOJu0YwkQ8t5qqXQ9v1wDsUJ67tr0WYDlgm4XSvDG7XDBS6RQQX5pi1a
	CZaQz+hmLzesE0zHWsiev2ChJESLCvluwAhtPwn47GXMk+gX+KBnDKX/mec3PaHdh9DyEZ6TUWW
	ZkJb9caK48W5lV5cXDGBW/rX5c8bpwJIjp6KIrbeRMbj/fQk2Lwv3Ysn7qKlVhf8iqjhLXzvlOP
	be
X-Gm-Gg: ASbGnctv+7PMtzF/XGl4ykCBc07mJRu1/uD6lttUw9Dn/bI+99ZAFRw4U52Pv2aWksl
	Qw3sjRvYG2rvY8m3gOMmpELJqzDb4EzcL8BtbM2y2goJZqh6rlop1Ga4ev1z4wllY4Y51gpTvWx
	lc96ts+CsAGDQ4v/Def5QSaqLv3HssEYgOb3nBifwmRrv+mVj4T6aoqwFnCGDZi9r2NWqgv3aD0
	i49n9mYhQXGr7vpRu2WpgRsJl6kHJ0/f0IgaJszz+whgFlFiWqi12RAefkLEDaBE8RMf9WJV+fi
	4v7JR45fT1Kcj7pYTkOVAGGUVCG6YrEzdvSYexx50/DtKeJ7WfrJVaF0666HRqztYlNhiuc=
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr58589195e9.8.1754333399552;
        Mon, 04 Aug 2025 11:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5GKxPERgMzvVb32ee5lNTwOD6PwhOAZJzd+FoxhfvfxFD7V+1+8Wo8Q6qFIfAKQ4FNeWAg==
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr58588875e9.8.1754333399118;
        Mon, 04 Aug 2025 11:49:59 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1f1eb.dip0.t-ipconnect.de. [79.241.241.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47b10asm16101568f8f.60.2025.08.04.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 11:49:58 -0700 (PDT)
Message-ID: <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
Date: Mon, 4 Aug 2025 20:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Juan Yescas <jyescas@google.com>
Cc: akash.tyagi@mediatek.com, Andrew Morton <akpm@linux-foundation.org>,
 angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org,
 Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com,
 Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com,
 Zi Yan <ziy@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Isaac Manjarres <isaacmanjarres@google.com>
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wzTTwLx75ObAwy_G9JTQhuIi_b_y85MGlTZoEBvGuJ0_1754333400
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_115004_082117_E42743E0 
X-CRM114-Status: GOOD (  18.21  )
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

On 04.08.25 20:20, Juan Yescas wrote:
> Hi David/Zi,
> 
> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
> 
> There are many devices that need fast allocation of MIGRATE_CMA pages,
> and they have to get them from the buddy allocator, which is a bit
> slower in comparison to the PCP lists.
> 
> We also have cases where the MIGRATE_CMA memory requirements are big.
> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
> These cases would benefit if we have THPs for CMAs.
> 
> Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?

Remember how CMA memory is used:

The owner allocates it through cma_alloc() and friends, where the CMA 
allocator will try allocating *specific physical memory regions* using 
alloc_contig_range(). It doesn't just go ahead and pick a random CMA 
page from the buddy (or PCP) lists. Doesn't work (just imagine having 
different CMA areas etc).

Anybody else is free to use CMA pages for MOVABLE allocations. So we 
treat them as being MOVABLE on the PCP.

Having a separate CMA PCP list doesn't solve or speedup anything, really.

I still have no clue what this patch here tried to solve: it doesn't 
make any sense.

-- 
Cheers,

David / dhildenb


