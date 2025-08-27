Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D6ACA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=; b=lerEjv3VJGRPU6f62GVD1wEWyB
	KAVi9OzqUNcRyxja95FXF0GqlSbXAf876RpfomVf6zpwBnXU4qHs1VnYfKGSRWyvfa0e1LG4ZgKfa
	J1r3pZj8YUg+aCcqHH8jkLqDHegcIwOR8eFNGWPNR80JEiOQOympwcZ4F28yBImjZHzNnq0HoGUOf
	c7dL2uZAB/9upsm9v+dPVzwLeMlSj7o65xlMDJeU0oWK2Swbbf9hcXrPF2yqnggn9NUkyv5yqWM4e
	KT61cl8LWcIXz2NYjyZZhFdYQak5ruiwk0hwEzWMY/3697cOA38h5SbDZmr6nAoQkOGNr4ChZyEKM
	/ovRB9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE02-0000000FAOK-3QBW;
	Wed, 27 Aug 2025 11:07:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCfx-0000000EtMj-1o9t;
	Wed, 27 Aug 2025 09:42:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso5311470f8f.3;
        Wed, 27 Aug 2025 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756287759; x=1756892559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
        b=ijyo+SI5cQMYv7UOPPf2DCWddvqx/3TkLzd0HV1ernhDIHUiRENkh2vk/Wh2+k7jB3
         FFipvcsRk9vaWZinJhttwE2z+HLER1AihAV8Uj2pCLyIDf/gTWlnLOvs5cpS4vaLOxiK
         yGxoVHf1OikLWAGqE6HqzNH8r2Tz2DBji0jrupulh+ClVxxLw8xq8a3dROEDf4phmnM6
         iEmsHE/zptw6DC3Watd4Ymsc1hwknAxtYl2nREgRIXJD16CAKe5WlVT77orJKdq/UGvj
         knNMLxkxZebQjIbA9lR7f/stRkTbJactE2IcHZu0Zj4KJZf4iZ/UmrSHnK2XIG3AS8qb
         5eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756287759; x=1756892559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
        b=QfgBcPBXDXpmukJDbLY0XiviTOYR4/9k3rNYHooc3OVe7w6r0Wn+oN/+l7fMnUTLo6
         tyPRdwqjYtXn81ENnTUXhAEqmbDlsFYikMBXv+fLjDhoEiD2sctmlWdQC1CWDv8XWkjS
         567AHeI1Fq3nJVDqOUTty1zJHSHjX84GKW5hElR4ngQpNZ2zeAtaP2NSARTR7yP23M2z
         3GUVJnIVTixyugRpKXlY3etgUMUv6Nbpx0F7TfRN6DQTg0RcgbtMPu6uCVzj1XOYYjlt
         rR1OvW9IPDYBn4jqbOFw3mmrM/Mhxgju+qV4eGdZPWp0JRrZ3hbZ+xZ++6vPSzI7kFcN
         46CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuKXApxAqsFRvlm0vWbpSQ/verkpIvU6HrdxsnDOPKgHXMcBvnTAVDyN5T4xjxYq6HXzMwLcZYoB0DKns=@lists.infradead.org, AJvYcCUuhddNOMgBA7PGLPt2sG1Z++Y5iSULAyRGTnb4xlRgIgXfATLQ1Q4CpZht7YuCh7T457Z0ZWx0KUynBisuEt48@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/HdOPiNYWYeeS+u1A0GwTikcOPGpAk+3vXK//2NYiN9VR/GT
	U3Izguk/Q8rfNZKPPY6DecLWjabbSnial0CQ2Mb32kJeEDzzMNfl3bJQ
X-Gm-Gg: ASbGncuJ18QkzBByK4P/PKSzSMH45rC9eJB1lsxvLArxzd+L8ECVZssrnTPDTXL92iH
	RIDXWy9NEjM6m8n5OyE0/0qfl7OlTawUb7JjrvlMw4HkFmDUZYO9eRWyFJMVcGHRn92EA+6cCQZ
	rWKATNdPKuahl6fSlEOZaHPq7AWHhoaD7WQ4YmeoeYmlniS76c2fEtt4grxUFb0ptg9HEYhpdys
	s/eRj0/sIGvNeC+mBsWLQIpPPW67dXKEVdg3JTM1Pd4ka6Vm6le5vnTG/xGUe3c1KnWtlut/j+N
	xW8fC4+2sRI+TbzbWRgjnRiPBHN75E3Bo/CgDV5TAMZhSRXPTzd46ezP+AabDvH2oRRwSCm9jOV
	MYFjx/DrunMzJZ5ksdX+/+IpnS6hpuGNbyPtVwImUy3gz0dWFh1/6NWRu3g+gmvgPBw==
X-Google-Smtp-Source: AGHT+IFkjO5GHbU1+2MUuKQvNL0fwH2etmLb7S57NgBpdq01aCYpWSgROxwdQQpXxfO8aoPZevSNpQ==
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id ffacd0b85a97d-3c5dcb10b6amr14770182f8f.43.1756287759105;
        Wed, 27 Aug 2025 02:42:39 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:4a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc4b102889sm3363615f8f.51.2025.08.27.02.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:42:38 -0700 (PDT)
Message-ID: <46d09557-1873-4d97-b073-ce0c7296b954@gmail.com>
Date: Wed, 27 Aug 2025 10:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
 <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
 <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_024241_472126_52B37757 
X-CRM114-Status: GOOD (  15.40  )
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

On 8/22/25 14:59, David Hildenbrand wrote:
> On 22.08.25 13:32, Pavel Begunkov wrote:
>> On 8/21/25 21:06, David Hildenbrand wrote:
>>> We always provide a single dst page, it's unclear why the io_copy_cache
>>> complexity is required.
>>
>> Because it'll need to be pulled outside the loop to reuse the page for
>> multiple copies, i.e. packing multiple fragments of the same skb into
>> it. Not finished, and currently it's wasting memory.
> 
> Okay, so what you're saying is that there will be follow-up work that will actually make this structure useful.

Exactly

>> Why not do as below? Pages there never cross boundaries of their folios. > Do you want it to be taken into the io_uring tree?
> 
> This should better all go through the MM tree where we actually guarantee contiguous pages within a folio. (see the cover letter)

Makes sense. No objection, hopefully it won't cause too many conflicts.

>> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
>> index e5ff49f3425e..18c12f4b56b6 100644
>> --- a/io_uring/zcrx.c
>> +++ b/io_uring/zcrx.c
>> @@ -975,9 +975,9 @@ static ssize_t io_copy_page(struct io_copy_cache *cc, struct page *src_page,
>>            if (folio_test_partial_kmap(page_folio(dst_page)) ||
>>                folio_test_partial_kmap(page_folio(src_page))) {
>> -            dst_page = nth_page(dst_page, dst_offset / PAGE_SIZE);
>> +            dst_page += dst_offset / PAGE_SIZE;
>>                dst_offset = offset_in_page(dst_offset);
>> -            src_page = nth_page(src_page, src_offset / PAGE_SIZE);
>> +            src_page += src_offset / PAGE_SIZE;
> 
> Yeah, I can do that in the next version given that you have plans on extending that code soon.

If we go with this version:

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov


