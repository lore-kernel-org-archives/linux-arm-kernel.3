Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9562C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPuSP7rL/M6eQxF/T0CIz+v7BklLeO0LdTlpgvoVmcw=; b=PZe7cf23T3ifSjsLx+AzZlkhw7
	VR0vzZTeNr7xBTp5kpLU2NwFY9fJgEeiyFplc4JFD+uggXFOG8pu/hMrQw9JgarQ9Z3nopCi80B/s
	0fSbnC9w8BCe20BLNELf2sb1kiv/Lt/zOTcJ91LmHzvNxPqY8AkY8X52KTwSLjB9aBvNuvw4YeKUZ
	niZjkbQm6ygoidy3AVZDL/N6hDpZ9p/1RHEEZxip/D7zLlAhT/J4Pwt0QfxaMVjTcv5zYBWb0GdRC
	21ybntUSWvJtpnGT2y4yuLlMz1XdT6sBsd/PlLyrbTcW/4TIETcYv6lGEB9gPRtTdFs51BWkxAw3x
	S0MH3tIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ljO-00000009uZo-3DsP;
	Tue, 29 Apr 2025 14:14:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lW6-00000009qAX-0Qwb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745935257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rPuSP7rL/M6eQxF/T0CIz+v7BklLeO0LdTlpgvoVmcw=;
	b=ex6H35Q2yDXexpCK0Y5lbGJT6CjTHSv2m6TVQESLYNI9anmkgD97lVqeTAG5KY+nqdKAph
	NIenbDszI1MgWoYBfUYccUd8OnPfpKSsGRIGCfmLjIGevwcukcSUt2fz7cbE1mflxTizFU
	6PpUInIynBcCajpZsTOI6aSIC29IUgg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-JTUhwt5vO-CmXQ9_DFxU1g-1; Tue, 29 Apr 2025 10:00:54 -0400
X-MC-Unique: JTUhwt5vO-CmXQ9_DFxU1g-1
X-Mimecast-MFC-AGG-ID: JTUhwt5vO-CmXQ9_DFxU1g_1745935253
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so24787555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935253; x=1746540053;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rPuSP7rL/M6eQxF/T0CIz+v7BklLeO0LdTlpgvoVmcw=;
        b=SJK6xPSs1eOXbNRdXbecYafho1L5gkVNqRGrFdOILbgTWZ9zyrmIG5QnJScHaziuK4
         TK3gxJWALfOfbM8jDPSIIFJhzsANxnGeUKmNd3GxwOcsRzqGzTcHdiTU8kv5SMggvUPH
         aj/RbR4QyYiHAVPSvR97ElWG0xgGUFsBqa2Ug39a2IGiplsfHbwxfsuWkSwClmvsXLjR
         tg8rPpHxm/RJu+G150STnNt3vX/MYxBqBRuGo5CAhbzm1Rv4j1dJv8H7xiDdeI/6lAne
         kHx0zqokd9VqewPJngaYAycptztIB9zhEhI9mwqvRjhxp/dno+bpZWvVaPblcv2XnQwM
         5fNA==
X-Forwarded-Encrypted: i=1; AJvYcCX+b+UYybltLBCUrnb52c1ZsAvZLDgiijy7Ww5ZwkJyGOFot2bmsHWQcGDLGrRZzolGsdHpTcNYYyU6Pq4PSFLV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy45D8lmWxukHFUJbuFjc3dDjp7QPR+hBBJeLmUrxGJ9KbLTnR
	KbLgup6J8U7z53/ZWNZ3arFzXB1IrTyap9W+elCq2N0X5E3UJqV9iRDAgeRo1fq3KkFjh7xh03R
	B0roPypEWPWRA+1HRCeTWH+d7gIKW8+dTZ/X3iQPQVpY2f1kNA/eMSjsMRbe5oiQ4d/Wyhusj
X-Gm-Gg: ASbGncvYxh1lor7XhrV83nTOftQxC9LLAbxI9cTzwWnGxTeELVN8sHIx0RUKVG7U3Jg
	bFgRaUx9pG2Ab/nIIfVez0z9LjArN10Qfh0+akzVhBHplA/qbwX+Z9YZUt+2d0ag7tgTdr7Ubxl
	hfHZfw9patRCnQk9l5T9YceqHazypq6JVeZaWZPSLFbnvuYx1mbb6AdPUKAv0q6Y0trv0JuMise
	UBCgTQzja7oEm6kVGx87XhEciALmBQ41NXzOcfy+f1CaVxm0xFlMcRhV+MMSMtiTn4GxU1kByAO
	6PqFLp3aBRbDTArvd3FQTdbfS9JY/4XFoYkufNCJIqwTY9bRSqK6hziSEx4Vn2F1Da0wIRM5mTM
	KX2AdkLKmoeOW6SnDOV5ZazrQOl7fO09Pq4FcEOM=
X-Received: by 2002:a05:600c:19c7:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441acb5bb33mr23651265e9.16.1745935252592;
        Tue, 29 Apr 2025 07:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC5+jkoc1JUziXqrIgQ+fR1hmKrKcNVkEatdSDCSmI8IokLNHuGLQJS3hly2YAp/zkXdCxpA==
X-Received: by 2002:a05:600c:19c7:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441acb5bb33mr23650395e9.16.1745935251585;
        Tue, 29 Apr 2025 07:00:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a13bdsm189398195e9.9.2025.04.29.07.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:00:51 -0700 (PDT)
Message-ID: <a427092f-3179-4397-a5c2-e13561706dbd@redhat.com>
Date: Tue, 29 Apr 2025 16:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L_6bDPKe9Wgpkno-Ivl-4W3vtLaL7gBClbo1Tbq2kjE_1745935253
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_070058_207756_A05BE1F0 
X-CRM114-Status: GOOD (  16.72  )
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

On 29.04.25 15:57, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 11:27:43AM +0200, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -			     pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>     	struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>>     		 * write-fault handler similarly would map them writable without
>>>>     		 * any additional checks while holding the PT lock.
>>>>     		 */
>>>> -		page = vm_normal_page(vma, addr, pte);
>>>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +		if (!folio)
>>>> +			folio = vm_normal_folio(vma, addr, pte);
>>>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses vmsplice()
>> and unmaps the R/O PTE, meaning it is only left mapped by the parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
> 
> This makes me concerned about the stability of this series as a whole...
> 
>>
>> If that test case does not detect the issue you're introducing, we should
>> look into adding a test case that detects it.
> 
> There are 25 tests that fail for the cow self-test with this series
> applied:
> 
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with base page
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (2048 kB)

As expected ... :)

-- 
Cheers,

David / dhildenb


