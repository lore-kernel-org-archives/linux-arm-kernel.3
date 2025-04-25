Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78927C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b29eryv/5AAWJSs47U1xXSbFp20tCYH/BD5vHiB/9Ko=; b=Pjj7h8i2/on3vfNjFa/wGiiMv9
	3Wzhq7D9yYzUdRc4cYMNKYlRZ9NBpBZfN6L88tXOUel7TT0CDAg93gO+ORustb9045XxKAmUAdLbe
	MiJKe5xTdD+kclPM9eT+zxASi4zyZlgv1se8kRB7644yMtue9JYJOQRZLKK75eeo6vYqcbdB5gUtk
	cI9zggBb8VzlmHbcEfAtNTg6yjbUWAgL2GHYUQw7YuIZuQMbEzlPZgfEHWyxoW0Svf+E3pjD+n9ZG
	J9Og7VOE42Vby77SajQPV8EXHrI25EbmY4Tpls+Zjkh147B/E04NqtCKQJWeMQXTihF5M991sS6m3
	UbGZ4KmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MZq-00000000LhB-1oe3;
	Fri, 25 Apr 2025 17:11:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lk3-00000000B5r-18LV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745597850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b29eryv/5AAWJSs47U1xXSbFp20tCYH/BD5vHiB/9Ko=;
	b=C5NA4jM4j3Iho/kG80Cy/682WHArTrhxF9z1gcT1ofUHTztYnHgru88qYZf4y/2YZgKNx7
	ctgOrJhVzzORAK/XBWi0JZyVXN/9gI6DHM+MrZeWytgpwuntJvlVSSYGN0E4k5jXvzg1ws
	LLTM+rfbs5doAIzKu0Djs+1x/xqf2G0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-S-Q7BqWJPaWDnyv7Y-1UxQ-1; Fri, 25 Apr 2025 12:17:28 -0400
X-MC-Unique: S-Q7BqWJPaWDnyv7Y-1UxQ-1
X-Mimecast-MFC-AGG-ID: S-Q7BqWJPaWDnyv7Y-1UxQ_1745597847
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-440667e7f92so12421035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597847; x=1746202647;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b29eryv/5AAWJSs47U1xXSbFp20tCYH/BD5vHiB/9Ko=;
        b=e8nsMj9Uv5y0Dt41gle+QayUeUMu8mPeWXOF9Bk0yBqmiiHAZq9LXkTfmfDAb+sXXe
         yERsdU74X6DvLxtynsTuCGFly3X5DIxQdAXfvGnIU6lR/fiFpMd0guq3xEEgDYd4nwXE
         2/xpRmSgT/9/IrZHcPocMnm/+EFZhAF7PSwfD+AIjyUZ38TLRr05b7IXzam8uyoMXuQX
         lH2cNBGpfNAl1kcUD0Hq7s6V0C9xy8f40l3NusfaTmNvfGMilx2WSwX6L4gEZExyVwN+
         hipFMBP0iIaMtdSEYW25f+TyZbIw7BAIOpyJNrAWXmTfR/u65yrDU0y7fcHaVhlzn4wP
         Ytqw==
X-Forwarded-Encrypted: i=1; AJvYcCUcHR0unItGka6jkZCmFLYM6ObOo4Bh6BGNyi+UbqKTog7N5J1Fj2GqbZaKgVwWw8cSDcdLFKvMAV/6+7FHH0zB@lists.infradead.org
X-Gm-Message-State: AOJu0YwrLTJsq/0ts6/eKaDmueGNskEC1Wnlro2avmSkGR8ZbGlcmeUk
	wzfqZxePEmoxYzLP6XbeK68i0q3e9vhnU4CTiLRCao734ZADUWDa0qIAJ9KpEaEuyGDPfhHvHF5
	NLzKRD5GbrkBj+dCGwWtQtncdL43lHmPm+KtMwl2v8F8HEkYai6zqGIJh9FE8hyNrflZu6NtW
X-Gm-Gg: ASbGncuKjhQnV5eD7uOgXxJ2faxq1zd+8RsCqJxvWHYsj15rux9ABGKYZIKx0Se7xGb
	kEvI3rL93d9xf07plaNdUzc0JUk+xQFMpNtY9FF7ZwB4ZmOFcgekJsniObyV4o8ULDucHxeJgFa
	mw+xYzJ32XDqggP15p/mOihvgC2M4E2laLFJpo9pzV1sGeuq8uK/pw5TbMCk5t0+DZEIXWEuicJ
	pK2hdwGTxkaj0ZMFGR+6LGAIzbiHsoYYpN49vWcrTfoIKDzFkpnoDxk1bQ86pxboc5OU6KLevME
	EaOJfEreSUE3f7YQHZpgW1Wz+DMmTHkktxDMWoWO7awI5iKbSY+xoiLSmp4TtZho4qZoMsBmXvo
	FtHc5RkZRRzL8uDXD2LgaU1TZ+dp/iS3SNwcC
X-Received: by 2002:a05:600c:1c0a:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-440a66aba2emr31976915e9.31.1745597847128;
        Fri, 25 Apr 2025 09:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUpSeFkaLb/Bim7f0WUY/4VwJzME7Xo2p8Q6+jlFDBeIyS8dvjIoW4jh0ONrBl6RD4okp4iA==
X-Received: by 2002:a05:600c:1c0a:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-440a66aba2emr31976615e9.31.1745597846752;
        Fri, 25 Apr 2025 09:17:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm2788208f8f.99.2025.04.25.09.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:17:26 -0700 (PDT)
Message-ID: <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
Date: Fri, 25 Apr 2025 18:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-8-dwmw2@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-8-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 15aYfjCr-5Jil44BdPvhzcHQvEtuC9hQI61IWzabMH4_1745597847
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_091731_381530_901BA9EF 
X-CRM114-Status: GOOD (  24.59  )
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

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> Use for_each_valid_pfn() to skip the pointless iterations.
> 
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
>   mm/mm_init.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 41884f2155c4..0d1a4546825c 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>   	unsigned long pfn;
>   	u64 pgcnt = 0;
>   
> -	for (pfn = spfn; pfn < epfn; pfn++) {
> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
> -			pfn = pageblock_end_pfn(pfn) - 1;
> -			continue;
> -		}

So, if the first pfn in a pageblock is not valid, we skip the whole 
pageblock ...

> +	for_each_valid_pfn(pfn, spfn, epfn) {
>   		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>   		__SetPageReserved(pfn_to_page(pfn));
>   		pgcnt++;

but here, we would process further pfns inside such a pageblock?

-- 
Cheers,

David / dhildenb


