Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168FACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQMBR3G5+Db1duFANu1LlfQUqIsF8KEE1eC0NYFF1Ho=; b=f+ns/oT2926lDRK3zjlsnb5uAg
	rAK+Xixdn8EMYKtHbiYX9gg2DmvsVHf+4fC8bcFlvoqCi3rGpga+dbNzxBuMXV7+YVYMJcmx2OLuP
	BqqqkXqnAYoEkTGCv9/iFWXJW3QmfBCINGYBIJx8m8o3cc1JW0TiPz8aBqTDvJzcWtyYkKEAmDTYH
	IjNYfK1WQ6s6BqkOMRtifeBWluqMONXvQBxowb/xCdsRw8ZVnp8VFUUQlcA1/HsL8VSct431nBSAW
	Xt3AGqax7sL37+3cEE4vcvOpg0cde0XbY3XrXNe5tURLNcN0W9vVhrknAKASyc4CXnQZOIY7fwbAk
	8SO6ukew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M9V-0000000GDQV-0jRF;
	Wed, 24 Sep 2025 09:51:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M9R-0000000GDNH-2ahU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758707464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wQMBR3G5+Db1duFANu1LlfQUqIsF8KEE1eC0NYFF1Ho=;
	b=c0vPEHwm+aP8DRqpI6jwhDdm3adZ1STCpN+nEoACzDfG7Gg+hWE63tEV65SzlHtEy03j+6
	1Jrf+34F78uKTSxchKftAcCmKhU9AZ+6Ybqiu+RwxQLqjMi9pHqsAdjgCaiVRUlNLbXIth
	Ym/pnvrdeis3r0mJBmFtU/P/PYKqNXo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-fkj6CsT_MeKFoIDaPRbxyw-1; Wed, 24 Sep 2025 05:51:03 -0400
X-MC-Unique: fkj6CsT_MeKFoIDaPRbxyw-1
X-Mimecast-MFC-AGG-ID: fkj6CsT_MeKFoIDaPRbxyw_1758707462
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ecdd80ea44so521484f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707462; x=1759312262;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQMBR3G5+Db1duFANu1LlfQUqIsF8KEE1eC0NYFF1Ho=;
        b=xAO5avy67Iym7gGj14WhAmoKppHsUadVpCXnbtK8e/YZEvjwCdH756Rs8m85g5I1US
         W8HWBVaOQl4/0r4e8oXZt5aZx7I3071vs/nKX7LGQ2jdQX3kEW7/0VOLogpbiYwh3QMQ
         MOlmyWqoe2HCvSwXsnNaxgY2uh+plBe0dHskt7Np8RyCTBkFG3CZAZqp9PQFfun9RBf/
         hEGRqDgDXz685eDZ7t9PuU4d5YpFsE6sNBlo/aPvAEd4nGcXj8sEEr8xHonRQL24wazZ
         oSo5dHVvBNTGxubah8CmEpxInSuNvoSE6SGIRb9lI/a6bW+bsquZqn8Gcpj/uVVvwxkZ
         H9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWjT7bhjv1oOgFTcVpkK0i1aIsBdNcJgOoM1bAEg5gkLYK1DG0zWEf5xhJ9W7tADFCUBRzN3MP86XQQACKy7NsH@lists.infradead.org
X-Gm-Message-State: AOJu0YwKh/oWK6NyPQ968GQqaL6Mry4JpfX9F2Lh9d7aiq3yJXcmnBn1
	DdGyTm44Gn0KDDMcteP7Ignoq/kGIkkfAyRBdNQBQRGIG2dg8U9HVhs8nZErBJ31TLbpFFUwDXC
	aAlO+dttVescnrhc5fXRXIUnHn9wV62Xe2J58tLm+iqxj/p25jdr+n88cYDs0G2xFtPXftKl567
	XV
X-Gm-Gg: ASbGncsL6frTWnnVWXmZTPpIPKbo3tlX8Vh+bvCvtBKNLGaHxVgknAObeKwG+dtsxZ6
	UL+UKbYa05om8Ge7+YXT2vIutA9yTRtdStBqLJHrKSgGwiL+HmUFS8Rgoz4+fZ4O8CyDwJtyQAx
	b8IviLxNzA19xSHGtYG4c0jKlYvM44HptJI0I/P1nDSgYFPH6HNsdUkWC0P6LK5gbwmbgHSWBu2
	IUL5BFuvXu1M589IyMyvCgf6qD88jYtYFVMqUIqLdb4PCDYpEe+E1LNQG16xurZCsZEH6wPsBc9
	8izhAr15B+I+KJjBI5SPaJkmMqJ1UfH2iC1ysVaJMkkyiLikEkVtm+i6oY+z2sS0HKY15p3bMOf
	cOIHIotUicJlImhfIuiQ07GmF+0ZnRA3DcmD/MNFmTCDO+KDgzscRNqXxLKg8pqig6A==
X-Received: by 2002:a05:6000:250e:b0:407:d776:4434 with SMTP id ffacd0b85a97d-40ad3e31090mr1902982f8f.30.1758707461951;
        Wed, 24 Sep 2025 02:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhPPRuD29fp3XB+dlfoXl2496knpnZNpdUhlWL76OfhvP5Pe0dNCs5vxe+nKDXGGk5bWGRAQ==
X-Received: by 2002:a05:6000:250e:b0:407:d776:4434 with SMTP id ffacd0b85a97d-40ad3e31090mr1902931f8f.30.1758707461451;
        Wed, 24 Sep 2025 02:51:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b? (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de. [2003:d8:2f14:2400:afc:9797:137c:a25b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a998314sm29241655e9.3.2025.09.24.02.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:51:00 -0700 (PDT)
Message-ID: <f8571506-30c0-4dc8-9995-41a6469f8fc7@redhat.com>
Date: Wed, 24 Sep 2025 11:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
To: Yin Tirui <yintirui@huawei.com>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, anshuman.khandual@arm.com,
 yangyicong@hisilicon.com, ardb@kernel.org, willy@infradead.org,
 apopple@nvidia.com, samuel.holland@sifive.com, luxu.kernel@bytedance.com,
 abrestic@rivosinc.com, yongxuan.wang@sifive.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20250923133104.926672-3-yintirui@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uUbQbuzYm_2ouXYl6j9Mvw05415TbPXgYHL7EJ8JLFk_1758707462
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_025105_736414_D5965315 
X-CRM114-Status: GOOD (  20.04  )
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

On 23.09.25 15:31, Yin Tirui wrote:
> Add PMD-level huge page support to remap_pfn_range(), automatically
> creating huge mappings when prerequisites are satisfied (size, alignment,
> architecture support, etc.) and falling back to normal page mappings
> otherwise.
> 
> Implement special huge PMD splitting by utilizing the pgtable deposit/
> withdraw mechanism. When splitting is needed, the deposited pgtable is
> withdrawn and populated with individual PTEs created from the original
> huge mapping, using pte_clrhuge() to clear huge page attributes.
> 
> Update arch_needs_pgtable_deposit() to return true when PMD pfnmap
> support is enabled, ensuring proper pgtable management for huge
> pfnmap operations.
> 
> Introduce pfnmap_max_page_shift parameter to control maximum page
> size and "nohugepfnmap" boot option to disable huge pfnmap entirely.

Why? If an arch supports it we should just do it. Or what's the reason 
behind that?

> 
> Signed-off-by: Yin Tirui <yintirui@huawei.com>
> ---
>   include/linux/pgtable.h |  6 +++-
>   mm/huge_memory.c        | 22 ++++++++----
>   mm/memory.c             | 74 ++++++++++++++++++++++++++++++++++++-----
>   3 files changed, 85 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..4028318552ca 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1025,7 +1025,11 @@ extern pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>   #endif
>   
>   #ifndef arch_needs_pgtable_deposit
> -#define arch_needs_pgtable_deposit() (false)
> +#define arch_needs_pgtable_deposit arch_needs_pgtable_deposit
> +static inline bool arch_needs_pgtable_deposit(void)
> +{
> +	return IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP);
> +}
>   #endif
>   
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9c38a95e9f09..9f20adcbbb55 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2857,14 +2857,22 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   
>   	if (!vma_is_anonymous(vma)) {
>   		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
> -		/*
> -		 * We are going to unmap this huge page. So
> -		 * just go ahead and zap it
> -		 */
> -		if (arch_needs_pgtable_deposit())
> -			zap_deposited_table(mm, pmd);

Are you sure we can just entirely remove this block for 
!vma_is_anonymous(vma)?

-- 
Cheers

David / dhildenb


