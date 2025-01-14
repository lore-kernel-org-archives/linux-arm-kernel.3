Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDBDZRkgRmItIj5vhNt+NtvPcslu++WjcIN5loqh8wE=; b=AvVCs18OPF72RdMZw4DIlDngJz
	O8pZWHykz3jI8D/g9YGMEoyK1Cs+wOKLhftgAuLTyvsciJg46LXBJMHaWLu8Rrx48e72lyhMhRXMt
	6V7dxr0C7sGQQKVXb/kTzeFVjCs2TTBjCqvqSgLVzTJClvyM16Cii/rIT0DQuHz1lqADmZA/7XSAp
	2UCjqM6nkiDv8VR1BHt54nBGDgyYIIQ2kOyCMAsdwBgpbiT8lfoOpuJhFS50phHekdoYgAx9/eUUh
	wxSuL/Df8CIaX08DeSrxGGxhR0cIcd6+pzZc7q0NTkauXv7bBRLIwiVxSiLaW+GJjAtC5B+9l8hdt
	/FEZmo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdcw-0000000800k-1LC2;
	Tue, 14 Jan 2025 09:54:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdb4-00000007zkU-2rqA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736848348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PDBDZRkgRmItIj5vhNt+NtvPcslu++WjcIN5loqh8wE=;
	b=WwPWZ9B+IQflMpPUiOJXXCb7H1jPLzy31e64HC4e05heAYnQ/8pm1Kt2vPcLC8x4RwgoVE
	lSSfwhS+k2s0carU+91V9U8QlGaGfNOcG264106XwnDHA5jIG63pvgOC++/+WaUs8buEGA
	rVHG2eePwq0gbdcU1MHg8GPFkA9YwE0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-dkqsDc1TM4yMud_NZMK5VQ-1; Tue, 14 Jan 2025 04:52:27 -0500
X-MC-Unique: dkqsDc1TM4yMud_NZMK5VQ-1
X-Mimecast-MFC-AGG-ID: dkqsDc1TM4yMud_NZMK5VQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362153dcd6so27835525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848346; x=1737453146;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDBDZRkgRmItIj5vhNt+NtvPcslu++WjcIN5loqh8wE=;
        b=MamP3cLkvgppNkF4fJiTG2NhCYkz87ELSzXE85Me2TG6vYv8ZHt2K6wjUEjzSABOG7
         ZntbeAZvmQ6feeXdxVFAIkdWGWjMoRiyWxg3J/0UZApv3HSBcjYg27r5iS1CmohHTh51
         /harrJqasKAcxsHzlv+ylsmYK9KcPPdVg0deX/knsynHjjHFckMmAAmUBlfQpFiWdUpE
         sYXI6a9DMdGBadh77RN7lw7NdWqMb+JZvUgItbEOwtEUYUHr5qrOZ//RSUwx4LdfuGP7
         q9pK2M9JtfCf8bPBSLzHJVVVGdct3zqr193/5ebbiGeWaoL/aEU2aHLjHbU8JsZY7Dkh
         77hA==
X-Forwarded-Encrypted: i=1; AJvYcCX/TKyzBClBMk/Uzxt7R23h98QCWCH8rOBr+aZmhOmyyXrlzUuRnZvz9ZE/CZDUgv186pkYNwORpIO2oXbPrrCW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9IGkSjaT8f4ziyZoUGF0hanDVyg5qpTxM9cge3f5pLM1sXRgD
	JKcuCHRbuJLQktBOq1CUEh0ze3sAO/DIUEMG/3cRgiEAgtNSTqs4FZh7J5R/nHZcFrCHk6cxq80
	b5bprb/lGPhnpm1+KuExVOYuGeyALwOWTdINMfRENqmlpnfSGv3s/UKHTse0LlF8GRMkX2leB/N
	xt6okUzxI=
X-Gm-Gg: ASbGncv9ohuPbSCnswUcX9YlSNLvmuhdERNhGCGxDjcFxT3/PK2NLaxkDbTfc7DRGNH
	sDopt5agUCvUbiM6NNVxbzfgYLryMVs8XBWJqfDExu2+CSWpG/zC5arYDUKcGFce3ymb6EvKKEV
	OoB5Q51ASjYIx4Z/u/t6QLMWJLKDNXdBAN3z6LJQ0ADBEOApq3WfQDUOqcAawMSfRFnVyN3Zku3
	RtvJlAl/dQztiTqd4C2mC0uTvBymEb07DbRmbeOeWlsMNZS+UdFhAR530UOPAqc38eJS2I3Bbpf
	N4PPO5dic8SrdWmjKxMpnz0vovlp+chga3QbFlTg3uglk43qa0sWQ1DpKETBv42bsQJhq5tY6jo
	IVbebM7fT
X-Received: by 2002:a05:600c:3c9e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436e26a6727mr212713155e9.8.1736848345865;
        Tue, 14 Jan 2025 01:52:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYYQkP3w+WbBbVTmVzQNIKNbbwZDRcnAz9hqgywI3HAHsF6csSDCAJ1P9oM0IZPlA9qfv53Q==
X-Received: by 2002:a05:600c:3c9e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436e26a6727mr212712915e9.8.1736848345451;
        Tue, 14 Jan 2025 01:52:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c738:3100:8133:26cf:7877:94aa? (p200300cbc7383100813326cf787794aa.dip0.t-ipconnect.de. [2003:cb:c738:3100:8133:26cf:7877:94aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm136532165e9.12.2025.01.14.01.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 01:52:24 -0800 (PST)
Message-ID: <f50b59ad-3b15-4ca8-9390-17319d441ed8@redhat.com>
Date: Tue, 14 Jan 2025 10:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm: Support tlbbatch flush for a range of PTEs
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Mark Rutland
 <mark.rutland@arm.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Yosry Ahmed <yosryahmed@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yicong Yang <yangyicong@hisilicon.com>
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-3-21cnbao@gmail.com>
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
In-Reply-To: <20250113033901.68951-3-21cnbao@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cxuAKEnJD4ajlHCFyctmxM3yMt73PEPjWAHPkuCuWh8_1736848346
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_015230_862745_B526A50A 
X-CRM114-Status: GOOD (  27.88  )
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

On 13.01.25 04:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This is a preparatory patch to support batch PTE unmapping in
> `try_to_unmap_one`. It first introduces range handling for
> `tlbbatch` flush. Currently, the range is always set to the size of
> PAGE_SIZE.

You could have spelled out why you perform the VMA -> MM change.

> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Shaoqin Huang <shahuang@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lance Yang <ioworker0@gmail.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++------------
>   arch/arm64/mm/contpte.c           |  2 +-
>   arch/riscv/include/asm/tlbflush.h |  3 ++-
>   arch/riscv/mm/tlbflush.c          |  3 ++-
>   arch/x86/include/asm/tlbflush.h   |  3 ++-
>   mm/rmap.c                         | 12 +++++++-----
>   6 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index bc94e036a26b..f34e4fab5aa2 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -322,13 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>   	return true;
>   }
>   
> -static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> -					     struct mm_struct *mm,
> -					     unsigned long uaddr)
> -{
> -	__flush_tlb_page_nosync(mm, uaddr);
> -}
> -
>   /*
>    * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
>    * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
> @@ -448,7 +441,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>   	return false;
>   }
>   
> -static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
> +static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>   				     unsigned long start, unsigned long end,
>   				     unsigned long stride, bool last_level,
>   				     int tlb_level)
> @@ -460,12 +453,12 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>   	pages = (end - start) >> PAGE_SHIFT;
>   
>   	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> -		flush_tlb_mm(vma->vm_mm);
> +		flush_tlb_mm(mm);
>   		return;
>   	}
>   
>   	dsb(ishst);
> -	asid = ASID(vma->vm_mm);
> +	asid = ASID(mm);
>   
>   	if (last_level)
>   		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
> @@ -474,7 +467,7 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>   		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
>   				     tlb_level, true, lpa2_is_enabled());
>   
> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
> +	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>   }
>   
>   static inline void __flush_tlb_range(struct vm_area_struct *vma,
> @@ -482,7 +475,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   				     unsigned long stride, bool last_level,
>   				     int tlb_level)
>   {
> -	__flush_tlb_range_nosync(vma, start, end, stride,
> +	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
>   				 last_level, tlb_level);
>   	dsb(ish);
>   }
> @@ -533,6 +526,15 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>   	dsb(ish);
>   	isb();
>   }
> +
> +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +					     struct mm_struct *mm,
> +					     unsigned long uaddr,
> +					     unsigned long size)
> +{
> +	__flush_tlb_range_nosync(mm, uaddr, uaddr + size,
> +				 PAGE_SIZE, true, 3);
> +}
>   #endif
>   
>   #endif
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 55107d27d3f8..bcac4f55f9c1 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -335,7 +335,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>   		 * eliding the trailing DSB applies here.
>   		 */
>   		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
> +		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
>   					 PAGE_SIZE, true, 3);
>   	}
>   
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 72e559934952..7f3ea687ce33 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>   void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>   			       struct mm_struct *mm,
> -			       unsigned long uaddr);
> +			       unsigned long uaddr,
> +			       unsigned long size);

While we're at it, can we just convert this to the "two tabs" 
indentation starting on second parameter line" way of doing things? Same 
for all other cases. (at least in core code, if some arch wants their 
own weird rules on how to handle these things)

[...]

>   	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>   	int batch;
> @@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
>   	if (!pte_accessible(mm, pteval))
>   		return;
>   
> -	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
> +	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
>   	tlb_ubc->flush_required = true;
>   
>   	/*
> @@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>   }
>   #else
>   static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
> -				      unsigned long uaddr)
> +				      unsigned long uaddr,
> +				      unsigned long size)

I'll note that mist tlb functions seem to consume start+end instead of 
start+size, like

flush_tlb_mm_range()
flush_tlb_kernel_range()

So I'm wondering if this should be start+end instead of uaddr+size.

-- 
Cheers,

David / dhildenb


