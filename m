Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=; b=QsK/hDnaxh7OREu1sOCOprJoqq
	erx3olhH4nkPKkFJWctlybtI/A3OCK1caeL9HUZOlNDHsRgoq8zSezDYtoUrBAR/WdBs7+3tuY6Fu
	ChvFpCAzRuz/WjNMW3dhY9oIIjOQpTfhA/GGKIfenwqYTObf70U3exANt6+cgEOXU7j+pmEV+f3k1
	AmB/37hNp+/NkZw2k1RhU/5YsiUVQqziVkAtLhVJFzC1RLXCuL8E+rhmzJZZN7vdHcr7T384/zNbU
	DW4abyCzyu/NKYePnzWVKgepAYdyhJjFORlmULGt1L4Sc0lxyZhg9SQQHIknH9MIeEuu6ymytHUIM
	p9gE9INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhln-00000005oKh-3vQO;
	Fri, 20 Dec 2024 18:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhkb-00000005o8y-2pC3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
	b=Nv3nag2ONqN9wr5gUrNzI4yz5bzuF/TgGFoBIG887ioWrLG7qj+yddc6C5jC5p2HXZ57dA
	K+qPXUhv35PCPl5bFJBiAissgHxCXyRfiUqOTS2hFniCeZvGp/G760yIg8emwxY4UUCssa
	JS6nMTCR3oQqFn4/ZpOfvwxXkLGKrYQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-zySb8QdNPUi8B9ZJUGV_cg-1; Fri, 20 Dec 2024 13:29:23 -0500
X-MC-Unique: zySb8QdNPUi8B9ZJUGV_cg-1
X-Mimecast-MFC-AGG-ID: zySb8QdNPUi8B9ZJUGV_cg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e1339790so1367993f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734719362; x=1735324162;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
        b=YMrSUY+t0jwNmsQRKnqBsWUzB+v0rmhEa20hAqxRosVVLv8dUyWqIeTqYmTAQWm9TO
         AXq4a8pVvUeF4s2VJITX70OYdYdzsRVcp4ilVOf+BWmh0IogzlngqS4LRZe2KmLmrJsb
         PiCygVoYjXXnlN6vyUiGFLEj3oVXTw2Jl6VMkq1Mekl2+rKzCH2H0kVUpiBK+ijoZT4t
         bQvqYrxwWk+bIzDunJbhoIdHlAsettT3XAPxRB7Iv5DwnncQWhK9fzPvdqzB92rXnwJA
         kPyvCb0HSPD/HFe9O9Qtg169QB/B8DKqRi2mtB3ji/ygOCV5lYtB+fEyttutCI7No0dy
         tYVg==
X-Forwarded-Encrypted: i=1; AJvYcCXXMgnjNLZrxM6CrzAjvFWDhNl1eq9VJvsRfTs4HerxjTs97DpxIT7G2LnrWF3iBvDvX5Q1/y8Cy8FRMNzvtE2R@lists.infradead.org
X-Gm-Message-State: AOJu0YzHxLVSv76I/SIjIITecIOzTrgw6GbvOH1k1+SO8oMrOG/XLjsZ
	f9vK5res5VCrhfZnJU5j3Ur6gmu6b6XBG/NuE5dQ5nY8tXTpkJSAvqizuhvILifrtBjlxAwrqgu
	l4zuJlhSqoZjVHFRFt1qggI1sWG6nFJsLzvVMf/4qd/6vW/swFnBIIcFUukC98GRPd9xEDay5
X-Gm-Gg: ASbGncvbkNWPLVxPzRK6jPIAlSQ4SD7KsLofVxaVnkebNL9A6XvCXL3Gp4UD0EN7Al4
	8iRXdp63c4sCLEDYRUJLF1up6qv92cT+uCvx19kCV6mgVxkiot46ZTWKshT3ELBAkhvbdU8Mdy6
	7NTm9woWjJSEqCvCb8Qi3/sNkxePZFPlzLP+CARhhEXK7lFLtBnUwiiH6eUsFDklVe7niifIWnE
	nbxt0pmgc8iSwU7R+m77DplY0f1X3MMVgNOtGh2MwTwHQVj1MzIYRaZaoM7VtjkaD0va9kLQl/l
	/ZaePRpYq+wWjMTO7FiVkFuYsNCDQyZqszax8ofyinX7ms/i3PLNlUMl+cJbgKin9cKDZH10zEF
	F+1UIlnmU
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr4852352f8f.59.1734719362336;
        Fri, 20 Dec 2024 10:29:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4GC48OmfJNltY6Ek7vleCwhpqJySNAWqKHGuZFUvMe2tCVDpmaDR4IIQ/DXZtWNsmnqadZA==
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr4852317f8f.59.1734719361985;
        Fri, 20 Dec 2024 10:29:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm85576885e9.40.2024.12.20.10.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 10:29:20 -0800 (PST)
Message-ID: <4446a9c9-613b-4303-9a06-686fb10af363@redhat.com>
Date: Fri, 20 Dec 2024 19:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/25] mm/mm_init: Move p2pdma page refcount
 initialisation to p2pdma
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <aaa23e6f315a2d9b30a422c3769100cdfa42e85a.1734407924.git-series.apopple@nvidia.com>
 <359a1cf2-c5b0-4682-ba3c-980d77c4cfdb@redhat.com>
 <bk6cmiubwvor6gevit3wgl4k66xxpfcv6swmfrtvxnjnuojqkx@yow3pmyuxozw>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bk6cmiubwvor6gevit3wgl4k66xxpfcv6swmfrtvxnjnuojqkx@yow3pmyuxozw>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g4U2EfwD1GNqkvwG6RYolJJ3ahScpX-ia-5SMtuQye0_1734719362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_102925_777464_4502EF62 
X-CRM114-Status: GOOD (  10.69  )
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


>>
>>
>> But that's a bit weird: we call __init_single_page()->init_page_count() to
>> initialize it to 1, to then set it back to 0.
>>
>>
>> Maybe we can just pass to __init_single_page() the refcount we want to have
>> directly? Can be a patch on top of course.
> 
> Once the dust settles on this series we won't need the pgmap->type check at
> all because all ZONE_DEVICE pages will get an initial count of 0. I have some
> follow up clean-ups for after this series is applied (particularly with regards
> to pgmap refcounts), so if it's ok I'd rather do this as a follow-up.

Sure. For ordinary memory hotplug I'll also convert it to start with 
refcount=0 soonish, so there we're also simply pass 0 to __init_single_page.

-- 
Cheers,

David / dhildenb


