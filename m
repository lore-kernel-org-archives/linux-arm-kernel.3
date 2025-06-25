Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693CDC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDYmk8nUIEBllr11u7gZCCbXSbBQzHOYE0IyCu7JXpA=; b=vEl1UnnwgOlYzmuvj+w+39SRo2
	K3UttgKUShZR/S8nJcg6HPbR/uWu8aOT1KzriFk/0wTXzjuUHeNj4alK0UgzalzxtTJA6N0plXT3q
	ZEMLNlK38f55g1eFa8NxFi6/qN1jJhoucTfbGUhV7mtwrBf05HBGD8lh9QnR47svmLv0PvrsRV7Ds
	lyk8nomcj0gf/VnIJwQcAT09Couz+U5+oze41Hb2Oc5GlJZdLC0jmg1lsq00MrWXOqLofkG8UoxyW
	h8ORpMlyBR9ukDWVNSNo+4RGX+xwCtfIgjeR78C7CVWymFojN5Www0cLYmvoXtO95sbbMjz5+794v
	BpICi+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTQy-00000009OhL-39lQ;
	Wed, 25 Jun 2025 16:57:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPBz-00000008cM4-0k8D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750854330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDYmk8nUIEBllr11u7gZCCbXSbBQzHOYE0IyCu7JXpA=;
	b=ByeRLj+cZMuGL11Ux263XpTEqvcmGchdw0SCMrEfspOgk6F6HDKQZTk1bWP5YnEVUI/P5T
	+LhrkQchz3MnGWwFSZJ4rfxeKtvzG19tpONqVFRSZkXZAwCZ8BpO+M4VYRoPgJUOedCSut
	1ggR2yzsHFMjyRQz1jKvKyuT8NyKcsU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695--g7N0b69N1itJypjaIN3gw-1; Wed, 25 Jun 2025 08:25:28 -0400
X-MC-Unique: -g7N0b69N1itJypjaIN3gw-1
X-Mimecast-MFC-AGG-ID: -g7N0b69N1itJypjaIN3gw_1750854328
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d50eacafso11177575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854328; x=1751459128;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDYmk8nUIEBllr11u7gZCCbXSbBQzHOYE0IyCu7JXpA=;
        b=T+Kb8VhApck6WBCWfKIMY5yVUxl5t73mYBR4rqTqSDqxYbkiWhk79RQ/jTOiauoZ2m
         zQ7ROBKQEqga3OhXCmOQ78ohyPNm/F6ub8zD7ThCp7gsJwNtnQxL3eUBgHPsE+vfAgeQ
         9VFxYXY0tJohEDA0EZWuZRiGFjJEXVw2iKQ2UEs75Ui9G0ZPCBww24bPLEF7haVqPl1e
         CyF+XzmBe6iTpJIUqJVOiAQXAxTHHz3vs77GlDnDP/TTpE4fx77mRTCOXxqzP/fFXiSA
         7p+GIgPon3rP+mXEPeclLbwLltk/FLSoqOOfQG/p+XtbLbv+412v5l+RykD9a5IptTZj
         B/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXq8VohCoQCyF5sE6gdIuYd2S2BF642ruWGQUyHc5eFt+KB1HKo9kcddna8m2is1UGlXGPLASVxa4KPN5ugsDDl@lists.infradead.org
X-Gm-Message-State: AOJu0YzpQ1XnWYsdViVGZ1LVD5y8LiMAwfyDRXmC8t9ERWvTq5MCO5Wb
	WNtWu/OFDgDflSM0puZJEbJh5wCeSr5XLqSzJkiYQUp8DNkqNplJ48a40H0JUK3W1TCJIkpWus3
	21u5qSPis4XWYJCbX3E9t5jhcE0hVojg/CKDsYvx5c5TzoZxpyyxJX++yo8jsPQOhj3CUVpckVA
	Eb
X-Gm-Gg: ASbGncs/rbf8zo8bOZE7tgvkpKt4zAuK2HG2NaGri3AWfKjhlHDyCTQ4kOH+FA5LTUq
	2+OSi3K2xEzUGq79lxyt9Vd8Cz3BcYGA/ZLIRQJ0exn5yudlXeG41XvnH+14mQhLx6GRpZsJI2q
	cN9CZZ44kOZz/3zet2tflj1wlIqMFTZnITurC0Uyl4Y2qXEQHW1G/QpyIIgPmG8ZsJCLU1XaCPO
	kWX3edaQ6GnnM3ovT0wgoHumc7TOpg1391YVYRZaUsSxmY99C+pLoynsI6BN7280Um3gs7EKheL
	f73QDZRhbphi25BrnSlmW0z+8JlnWS0mt6jRZvTCmjEABMceYUW29CQTV7+BdBHd/lBxHKF4HST
	wYa5IHwYUUN4Ws71e8tVK/oIMDuUuyif3+/tnzgLLtHn3
X-Received: by 2002:a5d:59c5:0:b0:3a6:ec41:b9df with SMTP id ffacd0b85a97d-3a6ed64c0b6mr2122594f8f.49.1750854327715;
        Wed, 25 Jun 2025 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzn1jUnDPQBJAUUttMGYVvx0eT64PRI60IqxVI+7ZhvAx6ZiMuZPeCNf6yzmjyKxVSvIBOw==
X-Received: by 2002:a5d:59c5:0:b0:3a6:ec41:b9df with SMTP id ffacd0b85a97d-3a6ed64c0b6mr2122565f8f.49.1750854327273;
        Wed, 25 Jun 2025 05:25:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f294asm4571380f8f.58.2025.06.25.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:25:26 -0700 (PDT)
Message-ID: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
Date: Wed, 25 Jun 2025 14:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
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
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qvm6l9kcrmYzoA0r2EwcWbjyEDT20ikfYKwJaFMBCaA_1750854328
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_052531_292778_9805CA61 
X-CRM114-Status: GOOD (  16.67  )
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

On 25.06.25 14:20, Lance Yang wrote:
> 
> 
> On 2025/6/25 20:09, David Hildenbrand wrote:
>>>
>>> Somehow, I feel we could combine your cleanup code—which handles a batch
>>> size of "nr" between 1 and nr_pages—with the
>>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
>>
>> Yeah, that's what I was suggesting. It would have to be part of the
>> cleanup I think.
>>
>> I'm still wondering if there is a case where
>>
>> if (nr_pages == folio_nr_pages(folio))
>>       goto walk_done;
>>
>> would be wrong when dealing with small folios.
>>
>>> In practice, this would let us skip almost all unnecessary checks,
>>> except for a few rare corner cases.
>>>
>>> For those corner cases where "nr" truly falls between 1 and nr_pages,
>>> we can just leave them as-is—performing the redundant check inside
>>> page_vma_mapped_walk().
>>
>> I mean, batching mapcount+refcount updates etc. is always a win. If we
>> end up doing some unnecessary pte_none() checks, that might be
>> suboptimal but mostly noise in contrast to the other stuff we will
>> optimize out 🙂
>>
>> Agreed that if we can easily avoid these pte_none() checks, we should do
>> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes sense.
> 
> Hmm... I have a question about the reference counting here ...
> 
> 		if (vma->vm_flags & VM_LOCKED)
> 			mlock_drain_local();
> 		folio_put(folio);
> 		/* We have already batched the entire folio */
> 
> Does anyone else still hold a reference to this folio after folio_put()?

The caller of the unmap operation should better hold a reference :)

Also, I am not sure why we don't perform a

folio_put_refs(folio, nr_pages);

... :)

-- 
Cheers,

David / dhildenb


