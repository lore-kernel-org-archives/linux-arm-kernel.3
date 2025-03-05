Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F800C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGWydqnoXIhCLQqdot4fyHdmsRNksb4I77lqc7a9rY0=; b=UCCBS4ZJV1aL2Y9gq+IhDncJ5V
	z3tu71qOSzy2/esYNxbIKsSD/FBch37nFCN5vCcJD+WgPS5TYBrJRSw52X473taayyuOiPrw5QzML
	NsN+5AYHj3LVhK2OtewUQYy1uV66V7idZahORC566bSNNsoCJ6W51Ven/1IbCCyvV3B5mi/UpaJly
	NmAjMyGq+JuPWMD/zU2cRsHRoMLgz13zv/ShEZ4bL9iD7tCEn+DiPlPP/IgeKAtYdidN+5CP6VYCZ
	7uslLdo+2uGQH2j/U+zvIEtiMR5pWJCSLlQKo0CdR8d8B+/Sq92fw1Uh1M2xJobfSlbfh3Z+IP8Bv
	17ckJ3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvQr-00000009EG8-37zG;
	Wed, 05 Mar 2025 20:33:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuik-000000097JE-3AOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741204077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eGWydqnoXIhCLQqdot4fyHdmsRNksb4I77lqc7a9rY0=;
	b=aWpAMt79QwcI9lJ0/9umS0vWKp/aZEm84/ZnYXg0PYyE3wf2HxhCHXtzjihjcQNLZIh623
	iORu8MbPkQe2EPnMj2g/Ey4EhzLa9M1c9VVqOXxd6tCbN5bmTq0LXM/th0ycKbS39s8HIX
	tlgK+0aRkIuDAu5eAZGWFN/cIL96D5s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-N_zwlqsVPrerKhcIR-iMxg-1; Wed, 05 Mar 2025 14:47:56 -0500
X-MC-Unique: N_zwlqsVPrerKhcIR-iMxg-1
X-Mimecast-MFC-AGG-ID: N_zwlqsVPrerKhcIR-iMxg_1741204075
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso63534445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741204075; x=1741808875;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eGWydqnoXIhCLQqdot4fyHdmsRNksb4I77lqc7a9rY0=;
        b=v0bukgsOIe09mxpDkeAy/xX+vY6Lw/YxVzyBcNijRvN2sAq3p0yOIxunjg9dQhiJvr
         UsdpJWlW3Tg6Vk8rhiSywHuMyMZfRPjuUJhThIKwzsBdyUofWwGYFohpAJEHfUCNy/rm
         vGTZmCHRSDPvtvaH7KASEAU6TWyrZpLBhIihMFqyWcsoADZfepVgT9hOBcp1w8h+UbUA
         fseCnEDVMNCS7PzBhfnlAr0GgHEa4E6UlVZosZ04Jpv4FG7izMq1dPr1/ngAJLjELP27
         L3JJubeY4rUBybSPlMcGSynnTTIiGI++LRnwVKL3Q4JB5a3/NwUfCJQ/5u+NyWBu34S3
         8XIw==
X-Forwarded-Encrypted: i=1; AJvYcCVuqFVVmFV7fxiPqzwVi2Zt2GqwGRkwBRzkApZce++mNpU8i6LLEjDB9YG6bIisGh2FIOyrM4LE3rAlkEXNsJcH@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4+MLAc05eh1A6N1mdVr2943Zkxvp8IrF1HSiGMjfhSubHwiy
	EpGj05EvTaU8DdM6k6kzY1ZgzFtJKNKzNhf6IbxlqTp3dm/sqknBzn+nUjJAXOp9DmClF6g7lm+
	xEhlukWSI18Xw/P9XycxeXbRkA9hvpvQYnPB+qZr0Kwsg+ZGf5AbeNDfivE8C5+6O2y2AVMOo
X-Gm-Gg: ASbGncsflOX8vvK4IwesirwNOiTLdDjdhPntiUOP6KlaDfAZXm6+T8cuXrhi8TI7M7d
	2Nxu+d+oiqq4y5IkJ6aGWU3HO96VFd5rWtg1Ut/jA9hz9rRpV1hQSU+8s5aA2fmG51qxnCOTjL4
	frnJzZgLNqGaBTCYoCoUMP57j4i70Izil6hncaHnKdR4YXK1TBDOS3maI/em7YncSxWXYqbVSR5
	oW8WslP90UAEfCC/Wfr8yp87N9aoP5FbRr1Yq99Bch9aYMBpMZ6TOLmXnxzxGroG47Ch5V875zY
	7qwICIHwSzNekzTOPLXJxTl+fRw1757XqP+V4IypAlM3SeQYev5QCXm5XgVeRXB7/PVH4C4JlZc
	1KYL0wWzK8ZqpSTcJWNMIUPX0B5ePNtejuM+UuOTTViU=
X-Received: by 2002:a7b:ca48:0:b0:43b:d6ec:3d57 with SMTP id 5b1f17b1804b1-43bd6ec3de3mr31096915e9.15.1741204075052;
        Wed, 05 Mar 2025 11:47:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0XZGZCIlmOlRS0LbFcH+/JVJl+ID+X2yGng1e5xV1yy07EP7WWTcYimXXucuhZJRVuD//ew==
X-Received: by 2002:a7b:ca48:0:b0:43b:d6ec:3d57 with SMTP id 5b1f17b1804b1-43bd6ec3de3mr31096645e9.15.1741204074608;
        Wed, 05 Mar 2025 11:47:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:5b00:84f2:50f3:bdc8:d500? (p200300cbc7395b0084f250f3bdc8d500.dip0.t-ipconnect.de. [2003:cb:c739:5b00:84f2:50f3:bdc8:d500])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426d34csm27332645e9.5.2025.03.05.11.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 11:47:54 -0800 (PST)
Message-ID: <62f93f79-a8d4-44a5-b276-3ac5af4ab25c@redhat.com>
Date: Wed, 5 Mar 2025 20:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v1 0/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Tong Tiangen <tongtiangen@huawei.com>
References: <20250304154846.1937958-1-david@redhat.com>
 <20250305152055.GB28112@redhat.com>
 <CAEf4BzbyFy0eQHLac3zR8GiGDOUqYoTGAWDbFaeou903OGOTpg@mail.gmail.com>
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
In-Reply-To: <CAEf4BzbyFy0eQHLac3zR8GiGDOUqYoTGAWDbFaeou903OGOTpg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _JJlMpvGx9vjv5kloe4oo5DTkcjBRRiuMxEXlVcoKf0_1741204075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114758_876088_41A638C1 
X-CRM114-Status: GOOD (  28.65  )
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

On 05.03.25 20:43, Andrii Nakryiko wrote:
> On Wed, Mar 5, 2025 at 7:22 AM Oleg Nesterov <oleg@redhat.com> wrote:
>>
>> On 03/04, David Hildenbrand wrote:
>>>
>>> Currently, uprobe_write_opcode() implements COW-breaking manually, which is
>>> really far from ideal.
>>
>> To say at least ;)
>>
>> David, thanks for doing this. I'll try to read 3/3 tomorrow, but I don't
>> think I can really help. Let me repeat, this code was written many years
>> ago, I forgot everything, and today my understanding of mm/ is very poor.
>> But I'll try anyway.
>>
>>> Are there any uprobe tests / benchmarks that are worth running?
>>
>> All I know about uprobe tests is that bpf people run a lot of tests which
>> use uprobes.
>>
>> Andrii, Jiri, what you advise?
>>
> 
> We do have a bunch of tests within BPF selftests:
> 
> cd tools/testing/selftest/bpf && make -j$(nproc) && sudo ./test_progs -t uprobe

I stumbled over them, but was so far not successful in building them in 
my test VM (did not try too hard, though). Will try harder now that I 
know that it actually tests uprobe properly :)

> 
> I also built an uprobe-stress tool to validate uprobe optimizations I
> was doing, this one is the most stand-alone thing to use for testing,
> please consider checking that. You can find it at [0], and see also
> [1] and [2] where  I was helping Peter to build it from sources, so
> that might be useful for you as well, if you run into problems with
> building. Running something like `sudo ./uprobe-stress -a10 -t5 -m5
> -f3` would hammer on this quite a bit.

Thanks, I'll play with that as well.

> 
> I'm just about to leave on a short vacation, so won't have time to go
> over patches, but I plan to look at them when I'm back next week.
> 
>    [0] https://github.com/libbpf/libbpf-bootstrap/tree/uprobe-stress
>    [1] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZ+ygwfk8FKn5AS_Ny=igvGcFzdDLE2FjcvwjCKazEWMA@mail.gmail.com/
>    [2] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZqKCR-EQz6LTi-YvFY4RnYb_NnQXtwgZCv6aUo7gjkHg@mail.gmail.com
> 
>> Oleg.
>>
> 


-- 
Cheers,

David / dhildenb


