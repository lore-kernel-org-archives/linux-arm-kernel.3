Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB62CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qgw45kgIvklypQIdjW4WKJClwzbVj1vFIwI4+ABCxY=; b=dxx53GBladaxm42cZZmylNOdmc
	/hUrkn6taffk1pLgwFV2LzRU38Mrp8fwhzuGM+dFL4+FAGB/tm9aBA+9m2dEVWzjQI9Xg9rc/S65q
	u9KPR0rs6juxeNHiP2y7bTJ2R+DxM/kIZfKO/DYD2ZVsqvbTA6O2RH6TkeTD/QYl6r6y2e856b3As
	Ojb/JiRLfk7vJDdJQvI8hjBOWYWiBbIjsvNprzOKDFkKgfvXAJMEn9ymIjGRESRqT88JGfhXtDQhc
	q9xSSCnAvXWTSCd+91WdvTVBpGxgh3uMYyrbhCdLAELKiJFYZ5x2PpqhV0U3Z5P7HePMOGsgMk+YX
	U5cN0Inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfZ-00000004Uyx-24DU;
	Sat, 23 Aug 2025 09:36:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWDC-00000003I8Y-3zms
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 18:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755886202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Qgw45kgIvklypQIdjW4WKJClwzbVj1vFIwI4+ABCxY=;
	b=JHFX0+qkscmKrac5JO5QpD94YU+RlaIqCcfk7NStHx4YpQ7BhKJ68r7z9zUawt1/IEf/xK
	F5Uz4NzVkQX2cifF9pTBMeK4zynem6E9/Ug9ZV+NdoQHMrr4BfCxSCujEAeB8LgXIimM6i
	lG7cYHbAUOumgcUMLrb87AE94jvL/Xw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-gGkvaGo4NFWQKsapTBESNg-1; Fri, 22 Aug 2025 14:09:59 -0400
X-MC-Unique: gGkvaGo4NFWQKsapTBESNg-1
X-Mimecast-MFC-AGG-ID: gGkvaGo4NFWQKsapTBESNg_1755886198
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3c68ac7e19dso226328f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886198; x=1756490998;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Qgw45kgIvklypQIdjW4WKJClwzbVj1vFIwI4+ABCxY=;
        b=L/nMFZbRrUwNeAR6IopJqUIxHqeQOrmAvfHdyQTUZ0+wjHUa0/9VPFilnzOtksnLS+
         MZorjn2eO0iGASsYLxoOT9dCBnFD9soBb662nm57JkbdxCxpDFlkP1AC2YlTNe60ZrXe
         xFBzEmyclJG+biVC8I1qEmBFbisoQTSrxZXPaWiWvwDKOZb+M6cC1N70B0euiZzQQSt5
         Z5+gAIG+NapQ4VojtVJjHKd3Ayb+lcFjorjJq0YsdTz4n3gKGhVrY9W17H1GmUTCqeel
         iZ2Im4rPWbC5WU/mCQ4SklyBomoUg6AL6tDm84mVgzx2zq4d/CH5LGpxnx7HK6a3xZLr
         yfzg==
X-Forwarded-Encrypted: i=1; AJvYcCXPIwjMwK+FrQq7WIxrtG5jL6NsNQoQg1+U8fBQtJOCKZGAxs0vle25adyCQMZC+wSXRE1fsunwDYiFZhSetkKi@lists.infradead.org
X-Gm-Message-State: AOJu0YykfAppE+oFgEfexrs16CgWLjL63h9U3oECL9vDvymaXr2+aSXF
	JEXtkhg9u33TdVgEqQWp7IHw2KIkG/Dj7niHw8XnbWxvTOuzPXldzP9X4qEWIHA/fCzgy5Jui/L
	1W+EC/uOUTyb+w2NjFk2ParYhTnf0wWXliYFWWgPPmboFHJ4ddHOF5qG2pnaIjUmyawSi/ooIF+
	ql
X-Gm-Gg: ASbGncsQQFIcYbdoAZLyDn+vMGSNkJVirSiE4re5PeOCBzS2MbZz2zq0O66rIz2IK6z
	uTj4mptIOlk2DgUiLJf/vfQAF/Ai4rICkFJ+ylEHlOFza5J2+DXVZYwtbfBeLW2Qt98qNq7ccxK
	lhX+hWncAF8SXSiMssp/TtO1eJOubN0SNZY/b8AN/7ox9DluInrAnn+DQkUZOjQ+OIWS6Vxy5vK
	r3dhfcz+ArebIVuEHLvwc4FVqsPbg5MQp+YQayvvDhhhNjtVNJQx83uDz+BiZzocGYPEeRfADSn
	Pq8ygtcc4Ju+0UIR8q0mtjx6rzxSSasDzQpi3xP9k3hqKPxz/i9mnW0vI3RTe1uVCECJaXg+xoO
	DCt7J1ec37bqvEGLCHmTh6/8wgoBwldAqTCjMO+yS7aDFj3zKA8Z34SaPI1SDXWHqYBU=
X-Received: by 2002:a05:6000:4011:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3c5da83bbdfmr2672618f8f.8.1755886197859;
        Fri, 22 Aug 2025 11:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGihO/MfCjEADxWF8Q8DVVHHoqn0Rg/Ikr9pZDPhG5cKysecyGKSziAj6ohTWcg7Hwh15RzFg==
X-Received: by 2002:a05:6000:4011:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3c5da83bbdfmr2672603f8f.8.1755886197412;
        Fri, 22 Aug 2025 11:09:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2e:6100:d9da:ae87:764c:a77e? (p200300d82f2e6100d9daae87764ca77e.dip0.t-ipconnect.de. [2003:d8:2f2e:6100:d9da:ae87:764c:a77e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ac36sm7608875e9.6.2025.08.22.11.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 11:09:56 -0700 (PDT)
Message-ID: <1a3ca0c5-0720-4882-b425-031297c1abb7@redhat.com>
Date: Fri, 22 Aug 2025 20:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/35] mm/mm_init: make memmap_init_compound() look
 more like prep_compound_page()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-10-david@redhat.com> <aKiMWoZMyXYTAPJj@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKiMWoZMyXYTAPJj@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _TUOmZPXgkRoN8vnWD40YzpRgxnMox_jg4NamYUBoV4_1755886198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_111003_060457_E38A8469 
X-CRM114-Status: GOOD (  18.92  )
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

On 22.08.25 17:27, Mike Rapoport wrote:
> On Thu, Aug 21, 2025 at 10:06:35PM +0200, David Hildenbrand wrote:
>> Grepping for "prep_compound_page" leaves on clueless how devdax gets its
>> compound pages initialized.
>>
>> Let's add a comment that might help finding this open-coded
>> prep_compound_page() initialization more easily.
>>
>> Further, let's be less smart about the ordering of initialization and just
>> perform the prep_compound_head() call after all tail pages were
>> initialized: just like prep_compound_page() does.
>>
>> No need for a lengthy comment then: again, just like prep_compound_page().
>>
>> Note that prep_compound_head() already does initialize stuff in page[2]
>> through prep_compound_head() that successive tail page initialization
>> will overwrite: _deferred_list, and on 32bit _entire_mapcount and
>> _pincount. Very likely 32bit does not apply, and likely nobody ever ends
>> up testing whether the _deferred_list is empty.
>>
>> So it shouldn't be a fix at this point, but certainly something to clean
>> up.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/mm_init.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 5c21b3af216b2..708466c5b2cc9 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -1091,6 +1091,10 @@ static void __ref memmap_init_compound(struct page *head,
>>   	unsigned long pfn, end_pfn = head_pfn + nr_pages;
>>   	unsigned int order = pgmap->vmemmap_shift;
>>   
>> +	/*
>> +	 * This is an open-coded prep_compound_page() whereby we avoid
>> +	 * walking pages twice by initializing them in the same go.
>> +	 */
> 
> While on it, can you also mention that prep_compound_page() is not used to
> properly set page zone link?

Sure, thanks!

-- 
Cheers

David / dhildenb


