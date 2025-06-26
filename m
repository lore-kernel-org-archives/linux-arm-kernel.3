Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF53C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=; b=HgnfGEImcMtm9tXAJt3LUbuDSR
	LGTztGWi8haQ1mvy67JbxyqT91pbGepSb7xIhwSAO5EzIwVaf4hyepBD//vUUm628ui/6s5tY425k
	YBRJ57PMMSfUNqd2gKc0MEv/UqJenrF0c6bnEhHgtYt36wYnNUtPGZrXD0AyZj/Wc3bj19Z4V9dkh
	ClOaRO2BeOkl2mdakDLPQeRumiaV/JXcrzbjA4NNGf0/4Vlji+CQ2+mbrqRH7uvNvMtpRwHfXGk9S
	iseIhI7BT78RhwiMa/2aaxu4epYA4uKwl/vckMYlBVEaX7Uwo9N6BFAQzZdWs+SIKQh01UzQYMegM
	CAIPsMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiRK-0000000B4AY-2FXc;
	Thu, 26 Jun 2025 08:58:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhnM-0000000Aw2D-0ZWp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
	b=CzeI+Ehfu2L0phIGakBMbV+qqwWxTlbzhA9FCKDYgDalc6WeglmJ9lSdO5PHqvZ1SFq1Nl
	CbcdA0yItrZT+R1ql0+fbo2xPzCCxF74C6HHbHvbu01OLoiDbzhWN8bHhcE7aPRKBTFSp+
	6WCFy2ohtIhpdUko/ozr2RegnNsfvfU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-SvTeVhupNOeolfbQWPFSvQ-1; Thu, 26 Jun 2025 04:17:16 -0400
X-MC-Unique: SvTeVhupNOeolfbQWPFSvQ-1
X-Mimecast-MFC-AGG-ID: SvTeVhupNOeolfbQWPFSvQ_1750925836
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so262357f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 01:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925836; x=1751530636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
        b=K3yF5lRSKksRduNtIZc9j41tz6L/tSVD0JYGCKXhyeB6qv7R1Aum7ppyJw4BM8C3mu
         SZwaDQAhFeK6yoeS/kLNyTnObJ3AVD6nmTxhC3RsXHb4EIEhB+8Ki59ezTjSQEvVEZPd
         xYeldi8LZxNg/GdH5y1lkFMd4BuYsOVWqrT7Dw8k2WSNCb3WpgWBwHLnk3l12P506pLL
         orWuSD3mOH4a84vHqvLoU0uGVtqWHgjetjj6A3DB7PypCb/IoK/ycXtCYcEYnK0/r014
         oqZ4g6FuR4EUPCVknoKUU/IVUamNYsfqtsawfDQ+BpHB0w6N7JNhfEit0PTVMvAt6ilf
         oqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyLP/6z9zOkYwKoruVJub6t9RuhmorDVrsGmswSrvtmQJw3Rt9utM4cf50P9ip++s+OxGC3MFtD8uyDa8l7ybk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi86N3GiW9JJ+QJ43wgvwcLlnj7Bet8wFcc765Tm8kVwl6AXvK
	0UGLOFq+hzs4FuvngdlMR2tRQUlDQeD3TAVLL6gl1LDtICDSj1chq4rC+T5MAnlQzWXb9/o6F7o
	kBiDbLJVgQcBMiiAPBuSOeyVJU232A7sEV0SNqwRe5qoAvn0s/yDUBY77DlAos+4mNbelAsGoeN
	0z
X-Gm-Gg: ASbGncsp++2lnE8riD3+XRzRLCmIFgQPT1YBwqHuIfVHM3aVqddG1b/ERoQyjvaciEA
	PivYm/fAw6lqgMRz81dw3Cs5AtcIJ+TPlAefTlNt9358lzNqd5Dq1FHPfg8Wo3PQl8X4kGJzJzv
	Q+DdZbLyQTAyvMvpXEfRC4MS4Jfgy71clZQCnlDS/Jj7FoAbXsofnCUpH+k0E/bzbjRbu6Rkld3
	p4yKPlp5QU4h+Tn8CcbdS047tXL5EE47QPXgzA0v7rYGoj84g6KH2A3wrn6bjN2U9lv7uphe2M4
	yp3dfNvcN3u165281yR2OoytEdGt+OJsOcH5bYjbNCO4DnQIiiqxPB3dEsZNA0XRN876tTLEeyI
	Lm1i07xXF+Tz56qw2oWtmlxT7CZVb6jFcilNSX8Np6Hc1V/OPAg==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593024f8f.36.1750925835691;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhcXZypQm7XHMVnXTuYK23gyUnWaEv0Gc3DtKcA7Ooe9VhmSlfjk+Trd4HOr6R6kONFyi0fg==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593002f8f.36.1750925835318;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm11886905e9.11.2025.06.26.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:17:14 -0700 (PDT)
Message-ID: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
Date: Thu, 26 Jun 2025 10:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
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
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
 <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
 <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dfgvrr_1SiiYID2zoiLNWhd4HAzB9MUJmQB8L6gv5PY_1750925836
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011720_246840_EB50F914 
X-CRM114-Status: GOOD (  12.52  )
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

On 26.06.25 03:17, Lance Yang wrote:
> 
> 
> On 2025/6/26 05:03, Barry Song wrote:
>> On Thu, Jun 26, 2025 at 12:25 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 25.06.25 14:20, Lance Yang wrote:
>> [...]
>>>> Hmm... I have a question about the reference counting here ...
>>>>
>>>>                 if (vma->vm_flags & VM_LOCKED)
>>>>                         mlock_drain_local();
>>>>                 folio_put(folio);
>>>>                 /* We have already batched the entire folio */
>>>>
>>>> Does anyone else still hold a reference to this folio after folio_put()?
>>>
>>> The caller of the unmap operation should better hold a reference :)
>>>
>>> Also, I am not sure why we don't perform a
>>>
>>> folio_put_refs(folio, nr_pages);
>>
>> Because we've already called folio_ref_sub(folio, nr_pages - 1);
>> Looking back, it’s kind of ugly, huh.
>>
>> discard:
>>                   if (unlikely(folio_test_hugetlb(folio))) {
>>                           hugetlb_remove_rmap(folio);
>>                   } else {
>>                           folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>>                           folio_ref_sub(folio, nr_pages - 1);
>>                   }
>>
>> I assume Lance will send a patch? If so, remember to remove this
>> when switching to folio_put_refs(folio, nr_pages);
> 
> Ah, got it. Thanks for pointing that out!

Obviously I was hinting that the split refcount update can be merged 
into a single refcount update :)

-- 
Cheers,

David / dhildenb


