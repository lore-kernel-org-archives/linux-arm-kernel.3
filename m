Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zc1ZtvmGJ5KapEi1iwLqXeN/vl2AD2R+iU1xpLs0mw=; b=AbWLO8kPGmu/OKEhHDimMcC9+f
	in+jblA+AwnU2sANvQKe+QngOqWxevAiuoIW8K9TvBvAXfRsMqHSq24hy7rhmNqbn3/aGfliv9XT9
	SOamKnOyuI8V2/P9nBrzKk7CwSXtfO46aU9MNZB/2r5s8PeuAwXO6N2IQMxcjb7pxxkCop8keI2d2
	Jt9KjmyzfX2dQkwhvidolxbuPIeLwJ5Itokyj/XkRwMklIdyge8SszeMLT5AIMjBu9F1iDjds/ltd
	vK7qoKvlwAuDznBjvqfGbfm/XSm3UHc1K5g6Ubqdg4INRgxZPYCtCuH0ve4l74IXAngvWAhgDafW8
	kCRmg7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMuS-0000000Cy4W-37fA;
	Tue, 06 May 2025 18:20:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJE9-0000000CJCq-0K1n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746541496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9zc1ZtvmGJ5KapEi1iwLqXeN/vl2AD2R+iU1xpLs0mw=;
	b=RiiuwaVJ+7EHHJ2gpj7ANFkWAn4KTGnb/9v5OAuztEopnuAqmYamj3O9XoYvK6VNdRojRO
	VVkn3cX9qhaE2dIGk6esRRHnata7GiqH7Djl3IG8bWhFaAmqlfTJquk998e0mQLQctACot
	cKg3xThmKN28TSJaZafZnp4KlPIOX1k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-kYOoBKffMnGfKKnmSvvsFA-1; Tue, 06 May 2025 10:24:52 -0400
X-MC-Unique: kYOoBKffMnGfKKnmSvvsFA-1
X-Mimecast-MFC-AGG-ID: kYOoBKffMnGfKKnmSvvsFA_1746541492
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0ac55e628so354357f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 07:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541492; x=1747146292;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9zc1ZtvmGJ5KapEi1iwLqXeN/vl2AD2R+iU1xpLs0mw=;
        b=pOw0/XRHJzQoiNdSdhyd7X0uQrNj06vaKg3i48OmAfJ1xsVzww/GlWzPVUAjazdXCJ
         DVMu0HFX3oA6oAkMz8t6ZVjNH3ffGpm1RSiEm3MEAIsRpU/KOlOqFmPBkW/uKCkh7vq9
         RmJnIMzyW8UmTeNlpOqIAegL50trCs+KfIm68Wsmr/o9dOjjcnu/RoVHnxkLr0wRgs8N
         6LGPkYoLwbsaejLCIbFvtVO3hsuXn7OJuCoHq2oamACHW4ka5veRahfAxoQoH2SJXm4r
         SQYQ8UCgrG3vlqJquna1ikYkiFzLa+UAARdj1PIU7XA27NNosUb8vy8D/NNwA/A48BZ0
         FcPw==
X-Gm-Message-State: AOJu0YxNndEXHntBz4fy3DmuRyJvcW9gM/69RDVQjBn+eBJb0cWPufc2
	AbkSJb+OcOl9ZjobdUppWBH9gOv8OcSqwvX6cOrP+QUAmR9ajG48EGTRM9dS+wU4amIexsBUP3/
	TNXbOG3mnrrR6Al8bqcQ4nAXOVHXsFQcDAT1yZyR/rC101mEdgdZleqkEQCXkUofK7fUJ5A6h
X-Gm-Gg: ASbGncvLdY+sXpWYblNfkLcccjgFdW64zFdjaeZcpuzAky6qlQwgRZWv6yhpEXFXA0s
	1hF9CvHVi2/A2pGDKDyCB4MxnD33isc32qfaCK1M0ih2brH0d5R4eO3dUBHCDCX8vzdbVRYQXOT
	wPElB7fRor+rcqvuO8zVYX/xCDZZTHP95vzGVcc2gNCJhPWjDoA4L26F2lE1hb1sPTZmHLbB7v/
	NOmgSP9oUyx+touXYLJC9H7HW1iaFVE21S8CBfvZ7nsxlbRmJfUxompaCqZKxm3y/1KbdGRdVzb
	jst6p9griaKz13OPNZWbn4nTLpwt1DLKFmWGrVA0fh+TvyghP7g=
X-Received: by 2002:a05:6000:1882:b0:3a0:8c30:63dc with SMTP id ffacd0b85a97d-3a099adcademr12398435f8f.26.1746541491646;
        Tue, 06 May 2025 07:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELT3uhvXzYaDL4GC+mS3AuYh8FvYuciR4o2IRMpMPpmXJqrQKgtNFIpV3cWERG4orkT5s5GQ==
X-Received: by 2002:a05:6000:1882:b0:3a0:8c30:63dc with SMTP id ffacd0b85a97d-3a099adcademr12398409f8f.26.1746541491233;
        Tue, 06 May 2025 07:24:51 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm14075606f8f.97.2025.05.06.07.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:24:50 -0700 (PDT)
Message-ID: <5ea287f0-24cb-4ad4-8448-6e397fbf1ec8@redhat.com>
Date: Tue, 6 May 2025 16:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 4/5] mm/readahead: Store folio order in struct
 file_ra_state
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-5-ryan.roberts@arm.com>
 <c8f78fd6-c1fb-4884-b370-cb6b03e573b6@redhat.com>
 <2b1ea3d9-6c9b-4700-ae21-5f65565a995a@arm.com>
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
In-Reply-To: <2b1ea3d9-6c9b-4700-ae21-5f65565a995a@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BB5Ky6Akg73RQGaUUWGP11r_D3YT3VbtH2mfPFc1-Dw_1746541492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072457_272784_1EBFE9C2 
X-CRM114-Status: GOOD (  16.30  )
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

On 06.05.25 12:03, Ryan Roberts wrote:
> On 05/05/2025 11:08, David Hildenbrand wrote:
>> On 30.04.25 16:59, Ryan Roberts wrote:
>>> Previously the folio order of the previous readahead request was
>>> inferred from the folio who's readahead marker was hit. But due to the
>>> way we have to round to non-natural boundaries sometimes, this first
>>> folio in the readahead block is often smaller than the preferred order
>>> for that request. This means that for cases where the initial sync
>>> readahead is poorly aligned, the folio order will ramp up much more
>>> slowly.
>>>
>>> So instead, let's store the order in struct file_ra_state so we are not
>>> affected by any required alignment. We previously made enough room in
>>> the struct for a 16 order field. This should be plenty big enough since
>>> we are limited to MAX_PAGECACHE_ORDER anyway, which is certainly never
>>> larger than ~20.
>>>
>>> Since we now pass order in struct file_ra_state, page_cache_ra_order()
>>> no longer needs it's new_order parameter, so let's remove that.
>>>
>>> Worked example:
>>>
>>> Here we are touching pages 17-256 sequentially just as we did in the
>>> previous commit, but now that we are remembering the preferred order
>>> explicitly, we no longer have the slow ramp up problem. Note
>>> specifically that we no longer have 2 rounds (2x ~128K) of order-2
>>> folios:
>>>
>>> TYPE    STARTOFFS     ENDOFFS        SIZE  STARTPG    ENDPG   NRPG  ORDER  RA
>>> -----  ----------  ----------  ----------  -------  -------  -----  -----  --
>>> HOLE   0x00000000  0x00001000        4096        0        1      1
>>> FOLIO  0x00001000  0x00002000        4096        1        2      1      0
>>> FOLIO  0x00002000  0x00003000        4096        2        3      1      0
>>> FOLIO  0x00003000  0x00004000        4096        3        4      1      0
>>> FOLIO  0x00004000  0x00005000        4096        4        5      1      0
>>> FOLIO  0x00005000  0x00006000        4096        5        6      1      0
>>> FOLIO  0x00006000  0x00007000        4096        6        7      1      0
>>> FOLIO  0x00007000  0x00008000        4096        7        8      1      0
>>> FOLIO  0x00008000  0x00009000        4096        8        9      1      0
>>> FOLIO  0x00009000  0x0000a000        4096        9       10      1      0
>>> FOLIO  0x0000a000  0x0000b000        4096       10       11      1      0
>>> FOLIO  0x0000b000  0x0000c000        4096       11       12      1      0
>>> FOLIO  0x0000c000  0x0000d000        4096       12       13      1      0
>>> FOLIO  0x0000d000  0x0000e000        4096       13       14      1      0
>>> FOLIO  0x0000e000  0x0000f000        4096       14       15      1      0
>>> FOLIO  0x0000f000  0x00010000        4096       15       16      1      0
>>> FOLIO  0x00010000  0x00011000        4096       16       17      1      0
>>> FOLIO  0x00011000  0x00012000        4096       17       18      1      0
>>> FOLIO  0x00012000  0x00013000        4096       18       19      1      0
>>> FOLIO  0x00013000  0x00014000        4096       19       20      1      0
>>> FOLIO  0x00014000  0x00015000        4096       20       21      1      0
>>> FOLIO  0x00015000  0x00016000        4096       21       22      1      0
>>> FOLIO  0x00016000  0x00017000        4096       22       23      1      0
>>> FOLIO  0x00017000  0x00018000        4096       23       24      1      0
>>> FOLIO  0x00018000  0x00019000        4096       24       25      1      0
>>> FOLIO  0x00019000  0x0001a000        4096       25       26      1      0
>>> FOLIO  0x0001a000  0x0001b000        4096       26       27      1      0
>>> FOLIO  0x0001b000  0x0001c000        4096       27       28      1      0
>>> FOLIO  0x0001c000  0x0001d000        4096       28       29      1      0
>>> FOLIO  0x0001d000  0x0001e000        4096       29       30      1      0
>>> FOLIO  0x0001e000  0x0001f000        4096       30       31      1      0
>>> FOLIO  0x0001f000  0x00020000        4096       31       32      1      0
>>> FOLIO  0x00020000  0x00021000        4096       32       33      1      0
>>> FOLIO  0x00021000  0x00022000        4096       33       34      1      0
>>> FOLIO  0x00022000  0x00024000        8192       34       36      2      1
>>> FOLIO  0x00024000  0x00028000       16384       36       40      4      2
>>> FOLIO  0x00028000  0x0002c000       16384       40       44      4      2
>>> FOLIO  0x0002c000  0x00030000       16384       44       48      4      2
>>> FOLIO  0x00030000  0x00034000       16384       48       52      4      2
>>> FOLIO  0x00034000  0x00038000       16384       52       56      4      2
>>> FOLIO  0x00038000  0x0003c000       16384       56       60      4      2
>>> FOLIO  0x0003c000  0x00040000       16384       60       64      4      2
>>> FOLIO  0x00040000  0x00050000       65536       64       80     16      4
>>> FOLIO  0x00050000  0x00060000       65536       80       96     16      4
>>> FOLIO  0x00060000  0x00080000      131072       96      128     32      5
>>> FOLIO  0x00080000  0x000a0000      131072      128      160     32      5
>>> FOLIO  0x000a0000  0x000c0000      131072      160      192     32      5
>>> FOLIO  0x000c0000  0x000e0000      131072      192      224     32      5
>>> FOLIO  0x000e0000  0x00100000      131072      224      256     32      5
>>> FOLIO  0x00100000  0x00120000      131072      256      288     32      5
>>> FOLIO  0x00120000  0x00140000      131072      288      320     32      5  Y
>>> HOLE   0x00140000  0x00800000     7077888      320     2048   1728
>>>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>    include/linux/fs.h |  2 ++
>>>    mm/filemap.c       |  6 ++++--
>>>    mm/internal.h      |  3 +--
>>>    mm/readahead.c     | 18 +++++++++++-------
>>>    4 files changed, 18 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>> index 44362bef0010..cde482a7270a 100644
>>> --- a/include/linux/fs.h
>>> +++ b/include/linux/fs.h
>>> @@ -1031,6 +1031,7 @@ struct fown_struct {
>>>     *      and so were/are genuinely "ahead".  Start next readahead when
>>>     *      the first of these pages is accessed.
>>>     * @ra_pages: Maximum size of a readahead request, copied from the bdi.
>>> + * @order: Preferred folio order used for most recent readahead.
>>
>> Looking at other members, and how it relates to the other members, should we
>> call this something like "ra_prev_order" / "prev_ra_order" to distinguish it
>> from !ra members and indicate the "most recent" semantics similar to "prev_pos"?
> 
> As you know, I'm crap at naming, but...
> 
> start, size, async_size and order make up the parameters for the "most recent"
> readahead request. Where "most recent" includes "current" once passed into
> page_cache_ra_order(). The others don't include "ra" or "prev" in their name so
> wasn't sure it was necessary here.
> 
> ra_pages is a bit different; that's not part of the request, it's a (dynamic)
> ceiling to use when creating requests.
> 
> Personally I'd leave it as is, but no strong opinion.

I'm fine with it staying that way; I was merely trying to make sense of 
it all ...


... maybe a better description of the parameters might make the 
semantics easier to grasp.

""most recent" includes "current" once passed into page_cache_ra_order()"

is *really* hard to digest :)

> 
>>
>> Just a thought while digging through this patch ...
>>
>> ...
>>
>>> --- a/mm/filemap.c
>>> +++ b/mm/filemap.c
>>> @@ -3222,7 +3222,8 @@ static struct file *do_sync_mmap_readahead(struct
>>> vm_fault *vmf)
>>>            if (!(vm_flags & VM_RAND_READ))
>>>                ra->size *= 2;
>>>            ra->async_size = HPAGE_PMD_NR;
>>> -        page_cache_ra_order(&ractl, ra, HPAGE_PMD_ORDER);
>>> +        ra->order = HPAGE_PMD_ORDER;
>>> +        page_cache_ra_order(&ractl, ra);
>>>            return fpin;
>>>        }
>>>    #endif
>>> @@ -3258,8 +3259,9 @@ static struct file *do_sync_mmap_readahead(struct
>>> vm_fault *vmf)
>>>        ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
>>>        ra->size = ra->ra_pages;
>>>        ra->async_size = ra->ra_pages / 4;
>>> +    ra->order = 0;
>>>        ractl._index = ra->start;
>>> -    page_cache_ra_order(&ractl, ra, 0);
>>> +    page_cache_ra_order(&ractl, ra);
>>>        return fpin;
>>>    }
>>
>> Why not let page_cache_ra_order() consume the order and update ra->order (or
>> however it will be called :) ) internally?
> 
> You mean continue to pass new_order as a parameter to page_cache_ra_order()? The
> reason I did it the way I'm doing it is because I thought it would be weird for
> the caller of page_cache_ra_order() to set up all the parameters (start, size,
> async_size) of the request except for order...

Agreed. As above, I think we might do better with the description of 
these parameters in general ...

or even document how page_cache_ra_order() acts on these inputs?

-- 
Cheers,

David / dhildenb


