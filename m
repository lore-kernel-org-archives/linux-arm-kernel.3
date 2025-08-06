Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D338C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s85fEJ1hPbwJ1lBrvMiN3B9Ym2qPT06ksiPFgWtT3io=; b=Cxy39Ow5BGFDKb1RAFbRso7U/6
	Y3053t5Z2XtgNz0ehXfhMdJzi3qopR+HyewnPK+x9vVn1ev7jZH04rHPM3Qlv3cov4c/zyeMqzU2L
	5KW2tv5A+0fqwrtOHL4Bxp7JV7EZYy4VUiMsS8EGm1BVOIVKiEegwjN3VDiVDC46eGfAqaKpabb9J
	XHwkmhww2fwyiURgqX6pf+FgpWmtmrulEcuarICwxnEGGzt/kyQTO9UrbOFu3+LlO3c6OkvXF8Z/i
	2FnHubyj1xGwv82MSPKcs/B6l8sa2XT9WFJNwP2XvdPEPYlbn72JzXHqnJwwNkoX/1/pedPXVG1a4
	sxCM+3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbWR-0000000Eudl-2gUE;
	Wed, 06 Aug 2025 10:37:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbOH-0000000Eteg-3axr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754476140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s85fEJ1hPbwJ1lBrvMiN3B9Ym2qPT06ksiPFgWtT3io=;
	b=iPmg3q+F/sojUi33Z2fWC2fap8LUEfu4bx1xJ9+okO+6bFGL57aWkJfeiV0oZQ4961P5D/
	9KharUHSf3ABbvAbzmxR1nbEX83VlP87eg9CWRJ124R8aaTfiFClU4cXbOpo+D5fn4zsK5
	5C0RROzMqTHj180vKwQSQc0ojhRCboQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-1ardVJTlMPOFP3ucByu9yA-1; Wed, 06 Aug 2025 06:28:59 -0400
X-MC-Unique: 1ardVJTlMPOFP3ucByu9yA-1
X-Mimecast-MFC-AGG-ID: 1ardVJTlMPOFP3ucByu9yA_1754476138
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7931d3d76so3021094f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 03:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476137; x=1755080937;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s85fEJ1hPbwJ1lBrvMiN3B9Ym2qPT06ksiPFgWtT3io=;
        b=PcAbiwfLJ/ZJ11O6YHfARNWjgsHRErAmHP5T18QQl8NbEyFJrG+5RTZVpcZ9iYSBNO
         iPaUeNYQ6aIm/D/UkwVtKtCUvTOhrY4SKcFEYa0tondPAGFjmzC1ap6np+YLoC1kZonf
         8q197/iccGtJmZvxbpPuPPACgJp0ndt/wAYYTohtpCEj7u/KcaxAJ/TTMV+cv16bwQR4
         rWLRddVsigynr6TLvHZqsF0DKIPBRYaQF1G7gNvq3WejPMTElGyMdeJguZJY6O25Qo81
         s9+j2Oe/uSlF5pQF+3QakCSnHPn87rlurbwX8ci/dudW/Vr3D1+5fOOnk35DYyAufmCO
         OZUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpxIu3lhVkrzJ2buT+lebAVVp9ljBfvRYfIuJl2YHuPH7M/kTCWj2rapgOGKfXzPsJAJuvdQfLjTL6tgNXHeKJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpj5AIuuwPs/S28J3h86bLRzmg4B7m4NUuNBhKV6ugNhl8LvpY
	fnFYoNGhp5qaavXnJpRpsnbDVmmXPIJzmWlfKzkxScHcTh3ife8WgnexkZOV4sWzlW/iYo0nIwB
	cfWYAfC0F+a2xnP9W3MXxjwDVtWsURQ5ZUTNUO7ZW/Ie/q0RsnXpSqG8bKbXTV68PKuvLvezDS9
	77
X-Gm-Gg: ASbGnctzes4NQgwoNpvqYYRmWF+DwrZ2Br0JkYUkVvfJl04tHtoibt0Tnd0ATeCO15W
	xJnmTaf/zQKfAYaclR3BkduwRjJRAtvvj9uey0nEvUgrqB2avfyvLrOJWDL81AwY0Kj0yujIKOa
	GY2lXlmcBZeWZcuyE5zxIfEZIL6sjRsGe8rwVuDBDu0DJir6Ty+ION3LeI8BxY/9CUsuDnUJ2AK
	MfpSqLPdKfF/v8Ec+twGauhB44iVcLaMiboFR7cXo3Bh5dN80BE5CkfEnMSiyjRvgejfJnHfYKM
	4H8P3NPoVu4lcLTbL1HmABeHYTkFabJPgS+YzsHx/+A8Auqtu4aQmNfuzcoG8K/TzupabD2eAUi
	EsSx01DBwCx5+vP28tyIUBmWvAl0T4epNQjZGzsx0rlXiyULSKwFVEKPOHdwKusaFca0=
X-Received: by 2002:a05:6000:2908:b0:3b8:d1d9:70b0 with SMTP id ffacd0b85a97d-3b8f49274bemr1706343f8f.40.1754476137454;
        Wed, 06 Aug 2025 03:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqcuMGgXTI80XNd7U4VUy0jmmg4JtekFe2gy7z4uJGY7EhGa5/HqatfjsYaIs+GhSWHgVy7w==
X-Received: by 2002:a05:6000:2908:b0:3b8:d1d9:70b0 with SMTP id ffacd0b85a97d-3b8f49274bemr1706322f8f.40.1754476136998;
        Wed, 06 Aug 2025 03:28:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:8a00:42f7:2657:34cc:a51f? (p200300d82f358a0042f7265734cca51f.dip0.t-ipconnect.de. [2003:d8:2f35:8a00:42f7:2657:34cc:a51f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac036sm22401606f8f.15.2025.08.06.03.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:28:56 -0700 (PDT)
Message-ID: <aa496798-5ac6-4cb0-bdc2-91515172e935@redhat.com>
Date: Wed, 6 Aug 2025 12:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
 <54ee1971-d91a-4fe6-90b8-16212c8568d1@redhat.com>
 <0d52d680-f3d3-454f-8c12-602f650469ab@arm.com>
 <9cbe9c6a-0013-4239-9347-bf5d43021fe3@lucifer.local>
 <e3d13396-8408-49c0-9ec9-1b02790959aa@redhat.com>
 <2d0d58a4-bd27-41ac-9b25-1cd989c02383@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <2d0d58a4-bd27-41ac-9b25-1cd989c02383@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: noqVKM7gHvRt2HFDsDj9tjpppHDdDD6N3KMAum92VXk_1754476138
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_032901_970821_77881BE4 
X-CRM114-Status: GOOD (  23.70  )
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

On 06.08.25 12:20, Dev Jain wrote:
> 
> On 06/08/25 3:41 pm, David Hildenbrand wrote:
>> On 06.08.25 11:50, Lorenzo Stoakes wrote:
>>> On Wed, Aug 06, 2025 at 03:07:49PM +0530, Dev Jain wrote:
>>>>>>
>>>>>> You mean in _this_ PTE of the batch right? As we're invoking these
>>>>>> on each part
>>>>>> of the PTE table.
>>>>>>
>>>>>> I mean I guess we can simply do:
>>>>>>
>>>>>>       struct page *first_page = pte_page(ptent);
>>>>>>
>>>>>> Right?
>>>>>
>>>>> Yes, but we should forward the result from vm_normal_page(), which
>>>>> does
>>>>> exactly that for you, and increment the page accordingly as required,
>>>>> just like with the pte we are processing.
>>>>
>>>> Makes sense, so I guess I will have to change the signature of
>>>> prot_numa_skip()
>>>>
>>>> to pass a double ptr to a page instead of folio and derive the folio
>>>> in the
>>>> caller,
>>>>
>>>> and pass down both the folio and the page to
>>>> set_write_prot_commit_flush_ptes.
>>>
>>> I already don't love how we psas the folio back from there for very
>>> dubious
>>> benefit. I really hate the idea of having a struct **page parameter...
>>>
>>> I wonder if we should just have a quick fixup for hotfix, and refine
>>> this more
>>> later?
>>
>> This is not an issue in any released kernel, so we can do this properly.
>>
>> We should just remove that nested vm_normal_folio().
>>
>> Untested, but should give an idea what we can do.
> 
> This puts the overhead of vm_normal_folio() unconditionally into the
> pte_present path.
> 
> Although I am guessing that is already happening assuming prot_numa case
> is not the
> 
> hot path. This is fine by me. So I guess I shouldn't have done that
> "reuse the folio
> 
> from prot_numa case if possible" thingy at all :)

I mean, it only applies when trying to NUMA-protect something that is
already protected. Not sure how relevant that is in practice.

As we don't even batch these today, we could just do:

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 4e0a22f7db495..2154a1a3c6656 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -127,10 +127,6 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
         bool toptier;
         int nid;
  
-       /* Avoid TLB flush if possible */
-       if (pte_protnone(oldpte))
-               goto skip;
-
         if (!folio)
                 goto skip;
  
@@ -304,6 +300,9 @@ static long change_pte_range(struct mmu_gather *tlb,
                         struct page *page;
                         pte_t ptent;
  
+                       if (prot_numa && pte_protnone(oldpte))
+                               continue;
+
                         page = vm_normal_folio(vma, addr, oldpte);
                         if (page)
                                 folio = page_folio(page);


But with my change, we could actually batch-skip such large folios,
because mprotect_folio_pte_batch() would see the folio.

-- 
Cheers,

David / dhildenb


