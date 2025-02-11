Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F667C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qp8FXc7l2huQpDDqUvBf4BSAvHA6gyxKUiNVmQD6PLw=; b=IMS3WbRK4zi3TH
	fZiL8v3bhdjS6JKMZYqqp5g0+moBh0eFVYAwZFU13xfUWYM8kgn1NfixZkNFXTg6IBxTbzyQlg/Fi
	8uR6FgdNaBPnNNW8XgXsf/ph1mTad4gDcgqx3+xjYxvaqWmyIzsHSh/cvN7fCBDf5fHUwGiqvfdps
	KZuZy0zfxq3a4QTGIqkh/UdfPq4vJT9VtHUnVIvz30AeykaOT/PalDTCCkIx3o5O/Xz+ikS6iP8pI
	gOnZ12DrBIHzEl66+EMhV67FRaVvsxIwcLC3OWWNd6dN1D1drJdkJkRVtNSaQ1PPv96JthbD66TJg
	5ANGqD2YXfgudCvPGu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpzz-00000003t9q-0B2R;
	Tue, 11 Feb 2025 13:08:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpZs-00000003oL1-1vsC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:41:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f5a224544so45631145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739277682; x=1739882482; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp8FXc7l2huQpDDqUvBf4BSAvHA6gyxKUiNVmQD6PLw=;
        b=Wxpz3ycWUEhxZwk7wvJoUWcXsDcEE9F9WWFDuU14vgq314CCbW9cDlHxElQB5DDYoE
         zE71pR0jERmkArA2lwAipF341Cym/bFzK43N7dZB8Zr81GqpC0bLbru78PQHnPWYH9pt
         cPGu3AMnPKZArh8DYorK1uzWIOo+EJfhhnEskw1zR5Ee2fT3KAaCPcKzZByFMposFcQn
         QOcPGdJHHvmLh0Hl4u6kuAivpAxd0cAII5Q1d+lHE11RRe1yqUGHOLAsCVlyhMs1YSBN
         LDMdl3kMZr2QT7gV7BAur49NNE7HoXVNyw4rUhPZJC8xD/ySAKZ4prMygOlPE/jeyTAu
         vIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277682; x=1739882482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qp8FXc7l2huQpDDqUvBf4BSAvHA6gyxKUiNVmQD6PLw=;
        b=ndQROdo6NMSxyrcjmHom6IPrAIRmL08cdl1tfIzvFitunB8YpBSRRCXtsUMyV56XG1
         ZMPZH+87kdC4UOP/3cpl+u49z8jG9ZK3+Z3cJEwF/XCnsD3Vk+XXl4/d1nmoQGDnyhrK
         n5eWt1V4e4mlIRllLekKWLOikHawnHTrJUVQE0qAQWPfXE614mG2IDn3JBwnhXDtAPNe
         AUks/P8COL4k/LOvIjCihTz+VFwKHxH5LVB1PABEzIKeOEIqYd167/GJBWYey81bnYOX
         A+lu0zNXJp5x+S0zJg1LUnwxHuGxAuQh6letXw4IH3dYjgN0JbwjSlgV+HaAjeNhTB89
         EahQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyUC0N5gApJ6AxFEEyr2yyLyfaWjplYp+ea7fSiSPuIaowB2f4ynp9CKDVzeXBDtzT3/KfL11x61i5yjeiv5dT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcsr6rCf09zFMsSeh077C0rzg9hiEV393RftP6uVRcjNXGUUrZ
	oS6lf8lU266QBDmmOMHj/hBM6ngwYbGJJhHegPxDWElFgQHSWzRad8kReBBmacU=
X-Gm-Gg: ASbGncv40kDH6717ecn4o34//SxjU/r0/2pXp+3btOdeY4RlXK3h9vB1rbOyRviRPLr
	DhZcWeq3PCnA3BD85Bl5cHuKuqXTaxDFrt1qMFR+zAYDZdiyc7BU6V1o0UWzj9uuG0fVmB/X/g2
	D8TPHo7Zi9vlUCfZV08jYlp3HCYT4PxeC3D6NnEkp+Vnn9fUhs7+ZtJQfOEYMITlzYq36mKiwAI
	4YezX7vhayTJ9Kx6J6WMJ5ltN78UpDqv+Uz/qlYIHQX9Fv/mDU9cyQzjK0iZkxIGvFhkt9vhEG0
	foFnJkSJEMeiXVB8sydf6mWOFBuZBFSL9jYkxIpBEg==
X-Google-Smtp-Source: AGHT+IHOuwW2S8J1yw3NRTlkAu47N8Bv/dy8tpNXivF9AQn/HjfyDnQSydirHNWFT7gUC4WKzQR0nQ==
X-Received: by 2002:a17:902:e946:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21f4e6a57f1mr313385905ad.2.1739277682572;
        Tue, 11 Feb 2025 04:41:22 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368bb4bdsm94384425ad.235.2025.02.11.04.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 04:41:22 -0800 (PST)
Message-ID: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
Date: Tue, 11 Feb 2025 20:41:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
 <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
 <3f7babee-b232-4e6b-a896-947150dcd1ef@bytedance.com>
 <2b0bb476-5bd6-489a-9b9e-7aa20964abfa@redhat.com>
 <4e298f68-36ff-496a-81d2-7124f792180d@bytedance.com>
 <bad8e013-3d01-4fe5-8783-c6d7e0e32a74@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <bad8e013-3d01-4fe5-8783-c6d7e0e32a74@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_044124_830373_BFFAA180 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Roberts <ryan.roberts@arm.com>, open list <linux-kernel@vger.kernel.org>, Hugh Dickins <hughd@google.com>, Muchun Song <muchun.song@linux.dev>, Ezra Buehler <ezra@easyb.ch>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2025/2/11 20:09, David Hildenbrand wrote:
> On 11.02.25 10:43, Qi Zheng wrote:
>>
>>
>> On 2025/2/11 17:37, David Hildenbrand wrote:
>>> On 11.02.25 10:29, Qi Zheng wrote:
>>>>
>>>>
>>>> On 2025/2/11 17:14, David Hildenbrand wrote:
>>>>> On 11.02.25 04:45, Qi Zheng wrote:
>>>>>> Hi Russell,
>>>>>>
>>>>>> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>>>>>>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>>>>>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>>>>>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL 
>>>>>>>> pointer
>>>>>>>> dereference resulting in a kernel panic. The culprit seems to be
>>>>>>>> commit
>>>>>>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>>>>>>> Reverting the commit apparently fixes the issue.
>>>>>>>
>>>>>>> The blamed commit is buggy:
>>>>>>>
>>>>>>> arch/arm/include/asm/tlbflush.h:
>>>>>>> #define update_mmu_cache(vma, addr, ptep) \
>>>>>>>             update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>>>>>>
>>>>>>> So vmf can be NULL. This didn't used to matter before this commit,
>>>>>>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>>>>>>> the commit introduced a dereference of it, which now causes a NULL
>>>>>>> point dereference.
>>>>>>>
>>>>>>> Not sure what the correct solution is, but at a guess, both:
>>>>>>>
>>>>>>>       if (ptl != vmf->ptl)
>>>>>>>
>>>>>>> need to become:
>>>>>>>
>>>>>>>       if (!vmf || ptl != vmf->ptl)
>>>>>>
>>>>>> No, we can't do that, because without using split PTE locks, we would
>>>>>> use shared mm->page_table_lock, which would create a deadlock.
>>>>>
>>>>> Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?
>>>>>
>>>>> if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {
>>>>
>>>> In this case, if two vmas map the same PTE page, then the same PTE lock
>>>> will be held repeatedly. Right?
>>>
>>> Hmm, the comment says:
>>>
>>>           /*
>>>            * This is called while another page table is mapped, so we
>>>            * must use the nested version.  This also means we need to
>>>            * open-code the spin-locking.
>>>            */
>>>
>>> "another page table" implies that it cannot be the same. But maybe that
>>> comment was also wrong?
>>
>> I don't see make_coherent() ensuring this when traversing vma.
> 
> Right, we could just have the same file range mapped MAP_SHARED into the 
> same page table using two VMAs ... I suspect writing a reproducer for 
> the deadlock should be easy.

I guess so, but I don't have an arm32 test environment yet. :(

[...]

>>           vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, 
>> pgoff) {
>> +               unsigned long mpnt_addr;
>> +
>>                   /*
>>                    * If this VMA is not in our MM, we can ignore it.
>>                    * Note that we intentionally mask out the VMA
>> @@ -151,7 +178,14 @@ make_coherent(struct address_space *mapping, struct
>> vm_area_struct *vma,
>>                   if (!(mpnt->vm_flags & VM_MAYSHARE))
>>                           continue;
>>                   offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>> -               aliases += adjust_pte(mpnt, mpnt->vm_start + offset,
>> pfn, vmf);
>> +               mpnt_addr = mpnt->vm_start + offset;
>> +               /*
>> +                * If mpnt_addr and addr are mapped to the same PTE page,
>> +                * also skip this vma.
>> +                */
>> +               if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
>> +                       continue;
> 
> Hmm, but is skipping the right thing to do? Maybe you would want to 

Ah, your concern is that in this case we may also need to maintain cache
coherency. I'm not sure about this.

> indicate to adjust_pte() whether it must take the PTL or not.

Indeed, this is a better approach. Will do it, and hope arm people
can help test it.

Thanks!

> 
> I did not study that code in detail, though ...
> 

