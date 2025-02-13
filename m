Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46724C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pytLOgsJ6w0iZR+NIH8XaYbmclBUyoXYJ+y3TKg+LBk=; b=CV+f++QEtIkYdyeImXIze4ntHt
	934qltm3+DmWSU0sX5QwQ432kEHUdnBLZxPAXRvcvYtAL1neXviJGzj28TS3j1IXKLJqr2uA1KZfh
	xjWYykM38td+M3EpSuSIC1PwDYf6oXcBENx1+S44C2/KH4sd9o5EogQUGwrTE50OztUxs/KIKITS7
	41Y6yUow0A+Mb52H95UAieSCwzXbJ1N/HpSteca2wDK2CKLJCKXxs2M/aqMm1xofc2kocY1N5YxHe
	tBGPs4Au6FXLYibGysQEx1pG6sMWc9LFNcPBVQr1VeuGqm37xNm+2LLz4SgKNS/kZPUG1rTx4vHpK
	rFEcywnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tielo-0000000CNNk-2Pvm;
	Thu, 13 Feb 2025 19:21:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidp0-0000000CCbv-01Jn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739470820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pytLOgsJ6w0iZR+NIH8XaYbmclBUyoXYJ+y3TKg+LBk=;
	b=Q1oF8Pfo3zeaksIDZUukIhJnyoyk5Ew/DGY8+FoZvnVM3kp2WJz+0fnE+YnXXhkGbQVcuX
	beDr4pPHzKlPN4ILlpxutjUKWGMYKTnNXGC8E+uI81DlqgU5p0HeEGuIScr6KyetovL4CP
	owYfLK/3+Z4hehFyCVdU6uZ0XoBSuHk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-uq6QFlCxNW2Kgb-AIAYAOQ-1; Thu, 13 Feb 2025 13:20:19 -0500
X-MC-Unique: uq6QFlCxNW2Kgb-AIAYAOQ-1
X-Mimecast-MFC-AGG-ID: uq6QFlCxNW2Kgb-AIAYAOQ_1739470818
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso8868235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470818; x=1740075618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pytLOgsJ6w0iZR+NIH8XaYbmclBUyoXYJ+y3TKg+LBk=;
        b=QavKuw6Bo7mo8GmwK2e7/2WLYebM4XSlhMpHJveSyiCDMcWAbKFi+1YUbKJs0pAbkB
         g69CJOwU0Uwv+w+YT9ytfIQM+7lb4FyQVx5jYc7YFxssVh8naOgCyPx5qF7lnjmsvq3J
         87fPbcF7dkWwvh2/qlu8nJmxk5l2vgqZl0u+jEdoYva2XVaEsKjjMEhPy14duKdD2JpQ
         M9yrB9l/6CvYHWXL1dTiTB/l+fYIAljcePPVCTaxYbysuvR95r1vWvkRl3mX/gZBzkG3
         +bNFa2gvKZdNXzJJiiSagfltw1mDXWeM/NCaO+mm/GdvQJZKBP66ioz+dHEBZEoN4dNR
         XL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5n7B69l9A67Ulyt1BBMzPYafzHPGDrNNGhPyvqGWIpQhD0g7v6LVuY6UAW5027p82bbAbOSTZM1QLOq6gU6eD@lists.infradead.org
X-Gm-Message-State: AOJu0YybJ7vQv+5DwgTdADLgt55KB7qSC8CEZ93hv07jad5mgXF1595U
	dgUre/gS4u/NMdH0U1TOmL5fcR8zU2AA2i2yabF2fijeWElLrysVmR0sMrN6ZoqrrFaGC/Dmd4T
	mACr7KOPtVPFifCsEjSypRTdYuhPpy7blqzfqi003xmqysYxdqtPDT6cKntkfUf3kTf3RhMvb11
	2qiKiLZgM=
X-Gm-Gg: ASbGncsmOsztHl4ZLeqe6q2b8756G4YMWKcfWa0EHrcYNctCHJDIhLl9MELRGdryCNz
	mIDsuq4n4tUUVVNLj/WGdUu0nm9Tt9QRQ/gamQfvG6yK91g6KW74Ul7yxnt+xA3q+DRUvdShSfN
	pdy3N6b5qDUW1BXkAJcc59tPkGkUQeoEr/8JiinQ+n32P/lGhv80XE684TQp3gGbUeV+I5cOKz6
	fdHCo14VCSGQm20azNuEPb30CuVH4aMvKofB2XOm7fQHBmkx/ZFU87Y8BcA+UgAhiAL0OofSJbb
	E152USDpCuRd/SXVi3rQKjoyNJOFMGhoVRGpdi/HN5VQWHjcPrgZ8/HD/cOQhWAO8drug/u+lVb
	6ETrutb8enpgkaXtJwuW2iIxfptpaAw==
X-Received: by 2002:a05:600c:3b92:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43958181444mr91347355e9.13.1739470817876;
        Thu, 13 Feb 2025 10:20:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXc4N82IenXGwh+44BI6911vT2zL5aY7TaLVcIlBEPYF+z8IcYWDZHilNByWqZXHx3JxSh5g==
X-Received: by 2002:a05:600c:3b92:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43958181444mr91346825e9.13.1739470817309;
        Thu, 13 Feb 2025 10:20:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c718:100:347d:db94:161d:398f? (p200300cbc7180100347ddb94161d398f.dip0.t-ipconnect.de. [2003:cb:c718:100:347d:db94:161d:398f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f23asm55155855e9.7.2025.02.13.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 10:20:16 -0800 (PST)
Message-ID: <e3e62864-f914-4ecd-bd26-0363ea72e991@redhat.com>
Date: Thu, 13 Feb 2025 19:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 stable@vger.kernel.org
References: <20250213075703.1270713-1-quic_zhenhuah@quicinc.com>
 <9bc91fe3-c590-48e2-b29f-736d0b056c34@redhat.com> <Z64UcwSGQ53mFmWF@arm.com>
 <b2964ea1-a22c-4b66-89ef-3082b6d00d21@redhat.com> <Z64yZRPpyR9A_BiR@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z64yZRPpyR9A_BiR@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SmCQV_RSCqCCTmS4qI6Cjzh-NlycMHZ9V-IQhooMC24_1739470818
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102022_127637_4764AB27 
X-CRM114-Status: GOOD (  25.52  )
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

On 13.02.25 18:56, Catalin Marinas wrote:
> On Thu, Feb 13, 2025 at 05:16:37PM +0100, David Hildenbrand wrote:
>> On 13.02.25 16:49, Catalin Marinas wrote:
>>> On Thu, Feb 13, 2025 at 01:59:25PM +0100, David Hildenbrand wrote:
>>>> On 13.02.25 08:57, Zhenhua Huang wrote:
>>>>> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
>>>>> to 27, making one section 128M. The related page struct which vmemmap
>>>>> points to is 2M then.
>>>>> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
>>>>> vmemmap to populate at the PMD section level which was suitable
>>>>> initially since hot plug granule is always one section(128M). However,
>>>>> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
>>>>> existing arm64 assumptions.
>>>>>
>>>>> Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
>>>>> pmd_sect() is true, the entire PMD section is cleared, even if there is
>>>>> other effective subsection. For example page_struct_map1 and
>>>>> page_strcut_map2 are part of a single PMD entry and they are hot-added
>>>>> sequentially. Then page_struct_map1 is removed, vmemmap_free() will clear
>>>>> the entire PMD entry freeing the struct page map for the whole section,
>>>>> even though page_struct_map2 is still active. Similar problem exists
>>>>> with linear mapping as well, for 16K base page(PMD size = 32M) or 64K
>>>>> base page(PMD = 512M), their block mappings exceed SUBSECTION_SIZE.
>>>>> Tearing down the entire PMD mapping too will leave other subsections
>>>>> unmapped in the linear mapping.
>>>>>
>>>>> To address the issue, we need to prevent PMD/PUD/CONT mappings for both
>>>>> linear and vmemmap for non-boot sections if corresponding size on the
>>>>> given base page exceeds SUBSECTION_SIZE(2MB now).
>>>>>
>>>>> Cc: <stable@vger.kernel.org> # v5.4+
>>>>> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>>>>
>>>> Just so I understand correctly: for ordinary memory-sections-size hotplug
>>>> (NVDIMM, virtio-mem), we still get a large mapping where possible?
>>>
>>> Up to 2MB blocks only since that's the SUBSECTION_SIZE value. The
>>> vmemmap mapping is also limited to PAGE_SIZE mappings (we could use
>>> contiguous mappings for vmemmap but it's not wired up; I don't think
>>> it's worth the hassle).
>>
>> But that's messed up, no?
>>
>> If someone hotplugs a memory section, they have to hotunplug a memory
>> section, not parts of it.
>>
>> That's why x86 does in vmemmap_populate():
>>
>> if (end - start < PAGES_PER_SECTION * sizeof(struct page))
>> 	err = vmemmap_populate_basepages(start, end, node, NULL);
>> else if (boot_cpu_has(X86_FEATURE_PSE))
>> 	err = vmemmap_populate_hugepages(start, end, node, altmap);
>> ...
>>
>> Maybe I'm missing something. Most importantly, why the weird subsection
>> stuff is supposed to degrade ordinary hotplug of dimms/virtio-mem etc.
> 
> I think that's based on the discussion for a previous version assuming
> that the hotplug/unplug sizes are not guaranteed to be symmetric:
> 
> https://lore.kernel.org/lkml/a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com/
> 
 > If that's not the case, we can indeed ignore the SUBSECTION_SIZE> 
altogether and just rely on the start/end of the hotplugged region.

All cases I know about hotunplug system RAM in the same granularity they 
hotplugged (virtio-mem, dax/kmem, dimm, dlpar), and if they wouldn't, 
they wouldn't operate on sub-section sizes either way.

Regarding dax/pmem, I also recall that it happens always in the same 
granularity. If not, it should be fixed: this weird subsection hotplug 
should not make all other hotplug users suffer (e.g., no vmemmap PMD).

What can likely happen (dax/pmem) is that we hotplug something that 
spans part of 128 MiB section (subsections), to then hotplug something 
that spans another part of a 128 MiB section (subsections). 
Hotunplugging either should not hotplug something part of the other 
device (e.g., rip out the vmemmap PMD).

I think this was expressed with:

"However, if start or end is not aligned to a section boundary, such as 
when a subsection is hot added, populating the entire section is 
wasteful." -- which is what we should focus on.

I thought x86-64 would handle that case; it would surprise me if 
handling between both archs would have to differ in that regard: with 4k 
arm64 we have the same section/subsection sizes as on x86-64.

-- 
Cheers,

David / dhildenb


