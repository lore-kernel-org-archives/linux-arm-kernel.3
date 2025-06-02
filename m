Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=; b=X7+XT6Dh2Za2syjvQDi1Oh3AoO
	JNduR21eCRWi9doLtJPk5OhdG4yvWeDOJnANcUh9NvLMbSgyeAZjVXmLh7rHepuq6FQvJr60vdk/e
	4mPF4plhODkp0+d4DsjUxfueNcUxOpDkV6COE5Rw59Hz87vCHPP0Z0UoxbNoJVC9eSjfUw8t65CMI
	C/LR/P7PuK9Zo+PRgFw2R4q2GUXftlasfLVOfJBcw9IXOKXQlSATpzYPXp/OnyPzkhZwmtDP0cDN1
	tyT2A8I54CKGEmlR3c5r85cpLw65hID6/FtNXQJ/Okf2i9mYTL5QYoD4wFA5zC2oQm3IHxUCvfkIK
	aB2BRSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3eX-00000007Iv0-0C6w;
	Mon, 02 Jun 2025 11:48:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3bQ-00000007IOR-0CDW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 11:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748864714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
	b=ZByUxsDKPGTaZk8y2+Kb8NwAh3A/X0ad92kDTHL3s7oa62aj+3PbBYumiAXFx4gdsn3Shr
	5ftlCSznJBCNlmeLhWZYXTqkH0g7xrqjd3+FX+b6V66ESJv9aj2jCT/MN3K+/QjHQH9gAs
	rRlfECCwTwghjwoEenSa88OJ8sMt7XQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-OGVPMOKvM3GOzyFG58O3wg-1; Mon, 02 Jun 2025 07:45:13 -0400
X-MC-Unique: OGVPMOKvM3GOzyFG58O3wg-1
X-Mimecast-MFC-AGG-ID: OGVPMOKvM3GOzyFG58O3wg_1748864712
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450cb902173so19454575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 04:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748864712; x=1749469512;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
        b=UV3M85R/dTJ5h7foD+ABQN1UnvimRWbJtDufUsB8vTHJJdH3OsQe+8nmRoBU6wufAr
         zHKmAl3yk0Y6GYYkP8oBcE92UrbUym7pI32AL6MX1laLnTZju4W5Uj+7Jpw9VYN4zb7j
         J3Ww9GnFdJvmhzjhMXRJHhrGKx2YM1tDUudF5TJMAwN76kcQwSDm4aFtsxCt+Y8ZLoFe
         4IyGzkVwYxOeTyNkkZjgPtIRlOaj5xbbtlb1ekP5XuraGfFetRlOw/lYYkUZs6TNmtzR
         IUq40JNF5ycCnPqmibqiByAQWE2+XRIQl1Db2ePTThz3/LzrpGMeFBfOvK04crL9ZIWS
         eqqw==
X-Forwarded-Encrypted: i=1; AJvYcCUcmsqrVLuw+Ct4M30dYKyWI5m0yvYjkN13QnCBVKxqRN5/yoHIbnlVj80yiBi0mw9OExJ7lYWlnrt2OrJmLe8T@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhf4+SN2UiGEA6HTicn40Y7UKtVb3XCclXMfhrST6C+0MMJOMA
	8JmJ6s71TvzahF0MjPXupGSuhxkXaE7biJCgLyGAebeYGTh/vkImMIugqYsgmkmnoH+MexD5kFJ
	J4aW9yb3scCU9zyB8RI0jJzNYn3VPFfGHK7w9BRVNkhOFz4WPyoQuJ+sjK9sB7bn/Nq3rVO77Up
	jB
X-Gm-Gg: ASbGnctWtX5PnseetjUfh8JFqLPPZfbypNz3pxNcGBC4ue58pt0//J6okwi2xGmaF1A
	YP3Bujd7pTevBViI65uagKirkzamUKEmlQbesOilqVZ/bo5/i4LKiNxBT0SeriyCROVaMbwPS8/
	FCOxpCRpjhBRojytM+IexGk1ULFWsbYRpaON+YBFIQmtRRoMyr3BLPT8Xe1VTISL9mPgAlHVIqD
	b4faiEgb9RKma3mF9uIjG1IF4OBb7te89j+bq9VPyVQh43F4yLNkKMNebqZtlQm6OUeF9lGi7iJ
	deXWYffA104n88pEDMdX3cVO6siHGJv7A3HULmRXsExCNzK40Gg06dYPVoIzubkFac/g+NV4mIp
	Cw85zlEOq83u+dmXNCTrpoyu9zFLwM3IODyf5S8A=
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr123242605e9.15.1748864712257;
        Mon, 02 Jun 2025 04:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNiWxj7ru1ZpdEa7TTYC+Mx0/zZsZQT6PVApBO3c8hzuU2D+iOpq+QjyaIBIup3raLJSW1Xg==
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr123242185e9.15.1748864711876;
        Mon, 02 Jun 2025 04:45:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f92585sm126373555e9.5.2025.06.02.04.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:45:11 -0700 (PDT)
Message-ID: <3327f886-e708-4229-a83f-2404f115d44b@redhat.com>
Date: Mon, 2 Jun 2025 13:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
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
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
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
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f436ja6noVXoLWCiHhAQy4GoZ50MePjsghUrnFBxe7o_1748864712
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_044516_177514_0FE6FB48 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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

On 29.05.25 08:32, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


