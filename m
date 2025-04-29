Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53412C3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzOJ3l0iCtkEByccE0Wwh9YboIMqWbLM9kNzswJiyvY=; b=R37rCArqzorM2ftjzWsY/zSg/u
	qHOQNcLDysIb34qb+17KUEWMdSBXbGvWc3jGMSFYQXE6E9LYBHz7496kYVNb886DpJ+5ZxkvEwtYT
	wTHlvjmC37622vZAGhvfS3AQpeApwLfRdfbkZ4ppomoGNwyFlNc80iSYbdC3Otml+KCDKiZ0S6DVn
	NsauoxzJN0z/zkkN4lb38T8g5gLdSHbgV//gUciW7TKwgoyuX1rOFl3N6ecaP5nZKUOMhX9qTiUL9
	uMZHtxFex1GqvHUyGcvOxA1W2UUZO/dGsW7jb8MzXabJ02MiaDZctVWIhB2VCV8zc9gh2lk73avSg
	cl3rSImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mh8-0000000A568-1HB8;
	Tue, 29 Apr 2025 15:16:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lXn-00000009qJm-1Hgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745935362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bzOJ3l0iCtkEByccE0Wwh9YboIMqWbLM9kNzswJiyvY=;
	b=J8mqqb6KQrDYtMbe84XoKakJCsJtyRcGTqLlDhT9sfc1qQulT1X27Y8bAY5eil76pUItbp
	+VWbBNyxqFrEGwQorBSrWI+jY9TvfpaSy7YCsfYTXaGCEQcOyptGsV1NS1TmM8dIwSYT5A
	ujIUphHb56Rr8Hhw57VhcnprjcdXlwQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-8YGkcheLP0CUiULH20zflQ-1; Tue, 29 Apr 2025 10:02:41 -0400
X-MC-Unique: 8YGkcheLP0CUiULH20zflQ-1
X-Mimecast-MFC-AGG-ID: 8YGkcheLP0CUiULH20zflQ_1745935360
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso27126685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935360; x=1746540160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bzOJ3l0iCtkEByccE0Wwh9YboIMqWbLM9kNzswJiyvY=;
        b=WjXiLqEjHd8/7bqeNPXklg+xzmZUMPRyxkA3WK/jQ8Uxq3n/MxTHemVmhZbMHui3Um
         T1qkovloZiD0PpBEWuDuxFUpChQZi40AaEQjFzBa4SI9+nX/VIUJ9TdSlPsEgeo5ihFt
         5hAL7YOzxkE1MMcPZRG+L48Qk3FtTmvLI1WhyKpizwLKVzkDHpDxGHToTncw3+OMi/J6
         e5wXqVcqreciMQtB76Qwf/1t1aaS7KjUuZ5FnsCzCPxCxCxwYCh1sCI8KVoImEGRQiD/
         Y5cS9oYU3CdX8/UDbEWsiKyvrVeizha2vEbw9HkDRLLgbaoBSSMP16i1gdULR78nHZa8
         iXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0aDc/SXJBtFXS9IzKtu1GuuIAo3Fz5w55kFQ1ANJ7GIlkoU79om96A2p4K77UwCqPndvGqju/WHVuMjprvPHK@lists.infradead.org
X-Gm-Message-State: AOJu0YyS4JVmJ2iNWgYwlkrDMDHp3tLAejcybkjcUUaccshwHJEaTfLr
	8n9KCfOMUCZBhbIEAta+p2Qb0ION8rpp+UzEhkHjs6J7KLDjpaPtfLBLKYo2Qgm/fPlsA5l/utK
	r+CNY2BXifrOdV7YsEd45PlRzvMYlji4gKDe8j17L9NBMesMjbstKuCHRpOVSBaxx8GJB9fx7
X-Gm-Gg: ASbGncvIF6QXtlL9kN4rx0lQHo/yPFJ27H8EseABW4YrvFDS4cBU4aNMYGFRbwxsOvz
	ghoNZ6EqMKrDy9Xp78o90cnswTXgKMBMjFouc/dVm6Vhocp9X/YslZbAMXzm0DEwT8S/VZHhKLl
	8zuPvwKPc1ofdUIbHECoBaZS5OX09EkZ3klSINA4ybyvYhsig0tZ5Cm8E2axIcYue3RM5vOTEGo
	y8lzZTYlWQgx6oGIBuAK+t5UDgmdtp03OxYuLb1gTMvSXiRqJ48QxTmUpWUh7m65cez6v0nRBoq
	WOdQ2Tbp3WOBGkvTZBB+it0fXrej5uJzb7HMm0PQK3frLi+3poxtLaKmpwVjXbqzBdAZnhxz1rU
	be4kSd5CMJHQdn+LhVWjcrLYIOU7WXAOINEKUyvE=
X-Received: by 2002:a7b:cb88:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-441acaa8d6amr25497155e9.1.1745935359615;
        Tue, 29 Apr 2025 07:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtb1hfCeBhNCaf5Q8KYXBK4Ot+ZsbBCrlpMl6OdBbsZss6ffFPJKvwhbpJMn1zaVkt4lWmDQ==
X-Received: by 2002:a7b:cb88:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-441acaa8d6amr25496065e9.1.1745935358778;
        Tue, 29 Apr 2025 07:02:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm193971675e9.14.2025.04.29.07.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:02:38 -0700 (PDT)
Message-ID: <306922f6-f21d-4973-bff5-425f3211d5b9@redhat.com>
Date: Tue, 29 Apr 2025 16:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Optimize mprotect for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <6ac365cf-da48-4791-b56d-62335519efdf@lucifer.local>
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
In-Reply-To: <6ac365cf-da48-4791-b56d-62335519efdf@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C3RgR9Oz-gkjK_xRFOmIHfsrxZzmA_e9Lek0ubLvWrA_1745935360
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_070243_433732_FB75AA3F 
X-CRM114-Status: UNSURE (   6.25  )
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

On 29.04.25 13:03, Lorenzo Stoakes wrote:
> -cc namit@vmware.com

Yes, Nadav is no longer working for VMWare.

.mailmap should already include the correct mapping to the gmail address 
AFAIKS?

-- 
Cheers,

David / dhildenb


