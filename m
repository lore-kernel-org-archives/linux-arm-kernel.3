Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C8C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d1VaRL28+ml7CYd59gxcB8VWqpmtd7xKREjccFb968=; b=izZEpd02TyGKs68UynjhN8ZgSr
	bJGYceXrbX3ocQcsbelAFePMpSh2sDAXbeDAhwkiva97IgmFV7DMl3Bf98QTYPpbumSDaROTkjJJo
	zPVV/+hMoYVSxD8dBEwuo09C7OZqWSo584TmkYsTW27v3hQRk5DnyvrsV9f6mtwcTZKN9G8Q5nYTL
	V2GoQj50nc4bCIYwTCmx6/qr9W8lXgzAufdaxyQ85M4kPutA+8cx1NcRIc6U2F8vOuneenCIgZEmi
	hquS47n3q3w8ZuhiStG30U3CRVLawuodtgpQ7BN1TEsJYtYR7M8aBanUjpu3Pff4J8z7ep8oIYkc8
	OQG8mipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMd-00000007YTj-3MWI;
	Thu, 24 Jul 2025 13:52:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uescx-000000077rF-0vLl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753350758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3d1VaRL28+ml7CYd59gxcB8VWqpmtd7xKREjccFb968=;
	b=diPVYqJ8yQlQngdERW3d4TSLbaegavYyXN5fLHFRN/h7Dy3lhk3w7SyVbkYxyAhdUKSdAO
	F+Un/Xm1fz+L4ziBxAGh+q9mU8QwvlmLC6PH9oI6P+h/rcgWRecJFbSgBdnGf0yHsU0NoP
	fxsrO0tw/km1XBR4zO8XpHm/qqrMDh0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-vCl0btr3PSa8uXiuVKP1cg-1; Thu, 24 Jul 2025 05:52:34 -0400
X-MC-Unique: vCl0btr3PSa8uXiuVKP1cg-1
X-Mimecast-MFC-AGG-ID: vCl0btr3PSa8uXiuVKP1cg_1753350754
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-458709feac7so3147245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350753; x=1753955553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3d1VaRL28+ml7CYd59gxcB8VWqpmtd7xKREjccFb968=;
        b=epRna0mPeEaSKLDvhMNdJWI1siZc8gqXbO0lg7phS4xH65K1fU8TK8TCczzbghjG3f
         +mXHLney7TN1J9Q2RDyYgrU0U1oAdQDUntdcr8KUn6HMb9WRuFj9l0Tn61H529h6jqCi
         BZee+l0Q3F3IUPKy1bI2VBFee/0wujENdlb8SzhbM2C4QflrBZuPGRl45xA9/UZXfcA6
         qSQqlEfg24dkMpYww/Vts9gLXYC8/0C1fWz47hogeeQMwhbrIvwgwn0ObFZ8etpPTo/T
         2V1yBe/8BUmz7heenPxeJADjeS97b36asK2crs3cx8+VTlHakkKAI36ltMTRtcsAdqGL
         pHHA==
X-Forwarded-Encrypted: i=1; AJvYcCXPEI6bFznQxYpg0FssDzmG859eBWT8yAvuNZ+DuwYbpzvTvh1fwaCVr1pDlQddGNbdkLvAvY1eYcf0cPREYscp@lists.infradead.org
X-Gm-Message-State: AOJu0YxzPO2ei6Pf+jFBVYtRzOxeNoHIymVjGltSzsrP60tbjZI5RhZy
	PQEHWj9fujHjke5qrmo9qrv5DiqVQJef+fvL8JqhkVpeOoRZ7GgmXabWl3EieZdUBsgHChdyvFk
	6Ss/tdj8kZSRlAuvNgTT4yDaP0D62VW9xz+BGORnrOUFll/ZogaJtJyYhlYb7dfvhbDtDi4xG1Q
	wT
X-Gm-Gg: ASbGncu1yX8Rxuc5o9IGy4/FapkZEK0/ZGAEu2sTy/mHk1Rh6JCW4Q/2b1lMbjuE5Rf
	eNewRy9FqrcVA6HY8dLFuJnMUL97+phdwcVlTFwUgXMPLfCqw0cjnRWKe1BivUKDY6iTcdC0sKW
	8E1JSJ8slMa8fExToce0NeKffqPx7ZJAnrtZiFPCPpY16VniUq/c899ZzK/2mZAxGEMMeIHjZmS
	8gh9LD2O3DfNu91NZy2RLLOq81Hv7qBc8Oa5xABPBbPJoyn8Rb7GiXpIOBd4Qg9PWgrtnGkTZ0W
	pAPj+G6WV0dABzeF6AiFeSjcnRNbQHwwRvfGWB06aKOne/0cyA7gTaq0D7wGIOY6hW/I9IEGURj
	rT3C9hhff7Uaa7hz7fSHP5N3Bb5XG3LapWO+WYEmz1FVSwFyWJmLt3tuNnOYJA0xw
X-Received: by 2002:a05:600c:1e29:b0:456:1752:2b43 with SMTP id 5b1f17b1804b1-45868cfb59bmr48340455e9.21.1753350753339;
        Thu, 24 Jul 2025 02:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAUXrziIB8EzlJBAqClUneVHNyWDyc5yyca5B2bw+Sp4TnAaoK9coMye25IUT6mVqTfLJrw==
X-Received: by 2002:a05:600c:1e29:b0:456:1752:2b43 with SMTP id 5b1f17b1804b1-45868cfb59bmr48340085e9.21.1753350752846;
        Thu, 24 Jul 2025 02:52:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:5e00:c941:d6fb:3e30:b42? (p200300d82f1f5e00c941d6fb3e300b42.dip0.t-ipconnect.de. [2003:d8:2f1f:5e00:c941:d6fb:3e30:b42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870554457sm15018435e9.18.2025.07.24.02.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:52:32 -0700 (PDT)
Message-ID: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
Date: Thu, 24 Jul 2025 11:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: "akash.tyagi" <akash.tyagi@mediatek.com>, akpm@linux-foundation.org,
 vbabka@suse.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: surenb@google.com, mhocko@suse.com, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
References: <20250724075301.1151817-1-akash.tyagi@mediatek.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250724075301.1151817-1-akash.tyagi@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hj-YPXyU1SggbIyxypE6g1I9jIB8hQPaiG6rfGmcfIo_1753350754
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_025239_322537_4AA7070E 
X-CRM114-Status: GOOD (  21.57  )
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

On 24.07.25 09:53, akash.tyagi wrote:
> Currently, THP CMA pages share PCP lists with UNMOVABLE and RECLAIMABLE
> pages. This may result in CMA THP pages being allocated from the PCP
> list for other migratetypes. When this occurs, these pages may fail to
> be isolated, leading to CMA allocation failures when drivers request
> them.

Curious, did you run into that in practice?

Having MIGRATE_CMA pages allocated for unmovable allocations would 
indeed be broken.

But, MIGRATE_PCPTYPES does not include MIGRATE_CMA. So there is also no 
dedicated PCP list for VMA?


In free_unref_folios(), we have

"Non-isolated types over MIGRATE_PCPTYPES get added to the 
MIGRATE_MOVABLE pcp list."

	if (unlikely(migratetype >= MIGRATE_PCPTYPES))
		migratetype = MIGRATE_MOVABLE;

So ... shouldn't that safe us here as well for THPs?

> 
> This patch introduces a dedicated PCP list for the THP CMA migratetype,
> ensuring that CMA THP pages are not mixed with other migratetypes and
> remain available for CMA allocations as intended.
> 
> Signed-off-by: akash.tyagi <akash.tyagi@mediatek.com>
> ---
>   include/linux/mmzone.h | 10 ++++++++--
>   mm/page_alloc.c        |  5 +++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..dd93088ce851 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -696,11 +696,17 @@ enum zone_watermarks {
>   
>   /*
>    * One per migratetype for each PAGE_ALLOC_COSTLY_ORDER. Two additional lists
> - * are added for THP. One PCP list is used by GPF_MOVABLE, and the other PCP list
> - * is used by GFP_UNMOVABLE and GFP_RECLAIMABLE.
> + * are added for THP: one for GFP_MOVABLE, and one for GFP_UNMOVABLE and
> + * GFP_RECLAIMABLE. With CMA enabled, an extra THP PCP list is added for
> + * MIGRATE_CMA, allowing further distinction between MIGRATE_MOVABLE and
> + * MIGRATE_CMA for THP allocations.
>    */
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#ifdef CONFIG_CMA
> +#define NR_PCP_THP 3
> +#else
>   #define NR_PCP_THP 2
> +#endif
>   #else
>   #define NR_PCP_THP 0
>   #endif
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2ef3c07266b3..35f8041afbcc 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -519,6 +519,11 @@ static inline unsigned int order_to_pindex(int migratetype, int order)
>   	if (order > PAGE_ALLOC_COSTLY_ORDER) {
>   		VM_BUG_ON(order != HPAGE_PMD_ORDER);
>   
> +#ifdef CONFIG_CMA
> +		if (migratetype == MIGRATE_CMA)
> +			return NR_LOWORDER_PCP_LISTS + 2;
> +#endif
> +
>   		movable = migratetype == MIGRATE_MOVABLE;
>   
>   		return NR_LOWORDER_PCP_LISTS + movable;


-- 
Cheers,

David / dhildenb


