Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4192ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eZCyRyOy/1us8vFre1xbt8cZXKsm7kPVp64LbO26As=; b=fz49dh38N0PLCRyMQLPDAl9xRB
	aeIDQVT2jpCKJyEjHgCd8ehzRIIAkohGlNCq8M8wbeltZRiPZxxBP8LZHlnCMY3+F0BmfYQzvBGj4
	hI1oT/QOUpnxUpKrtU8oti4Vfi/qRqYAJZqjpwnpwoNUuMy4PJXgXoTzLlMoVPxUnUqNAfJlWo53U
	/f6PT4fWtTJ/KH3IbONNGlKi4l2LYYrPsXvWi4AyESldJNAxaBWYZo1XuHg9JPnDbg0awXgQdm4/b
	Qe9Lqdre2jInb48YeC6sCk9S8Xdk2wt4wUkW+S8k/zShjc3K4Fi/zZF+Ske+V5ngd61hxoevXKi8E
	swVv8F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9w-0000000HI81-18V2;
	Tue, 02 Sep 2025 12:30:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNjF-0000000GVmJ-3PkU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756806904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4eZCyRyOy/1us8vFre1xbt8cZXKsm7kPVp64LbO26As=;
	b=icSDwAs6jb3g9a4oUxluyxFrvUoz5XSowlY/Nvq/xe8Les9P9iYW0B5e+nvoSmDjh3KBZ5
	en/XjjN2cWb2/FWI7VjlatRkojdbdKI/ULa4t4k51qXKFjfdXYCEnFUhZdc/SP8TnTz2Fl
	/Y/sGks6WU7OYJTkq0Sm7Vg0DG0ALFc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-PzhnXrD-PEODxAVA851SeQ-1; Tue, 02 Sep 2025 05:55:03 -0400
X-MC-Unique: PzhnXrD-PEODxAVA851SeQ-1
X-Mimecast-MFC-AGG-ID: PzhnXrD-PEODxAVA851SeQ_1756806902
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b99c18484so2112615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806902; x=1757411702;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eZCyRyOy/1us8vFre1xbt8cZXKsm7kPVp64LbO26As=;
        b=hARIa1mWa5fMFkhG4X5XMacernEYymNqA5d+28JFVXSiI8BbIgJy56ejAQ802xrgRz
         aL6hozgyulwfv39HyV1joZ/C5otXq9OzkKL1vNA874yE6Rc9Y851DA5yfbdDN4Jrz/qp
         py/SRngNAPhHgwoecJFvHEOTgeOM505xMGJG7Fri2Y6q41mmSMb/VH5Px4nS7dQr4Pco
         hG4V1HiNzUeSV+BNNMkFo3o/DqsN/IU297mm4M4jBKgUjbLCPM+/5t87O0xS4+c3r2kp
         CRWpxuo5WbmXofHQ+4EcjgwG0uXs4hdQ1n4r4SjPqKKKy+Xwo5HeRTOn8y+oLSOgPlJx
         BscA==
X-Forwarded-Encrypted: i=1; AJvYcCUcy4xmOAknaXBQFC1chfmj5qndzZa7VafWc9XLVTq2doQXJ8jebPCyHgnoDoqtXcXRYASEIfPFTHyZSzaumuVw@lists.infradead.org
X-Gm-Message-State: AOJu0YwLHS1z1u4PLD3Vp/62AxkmlZkUzOLYDoj1NprkV5j9tyczT3pZ
	4YX2ogckf/o8TiyybMcgX7zQ7NO3SzJ/3WdU7w1Fg5XMMWJdT4/BVaUX+9gS++GDV5k7Itbuitj
	sdzwytANsM1J7+BwSz4kmJquPv/D+aRg01QD5OuW2sTipYgu0Mu1vcLmjno9tnZJrzH6xjDh4Pc
	ku
X-Gm-Gg: ASbGncuACBEUuxReo57Kwv83HJCs11GbzEQ//n5LuBSRUtS3IbL4gAs0hUjqKRYLm/5
	deyFQ7mHXnxjnJhYb/Qq8AbTDFH8T4PNDlauIkRs0ae8a7hDV9/zea710sRZtmnwHEH+s2axoRP
	TQm88ogVjrr13mc6R4ADKMh7ZVdn3ug7hKRci338ZXdWgzxsJd6WUMzx+lLk1gAKtA05d4/HcnJ
	I/U8DeP7qrAgjh43rYWEJlISMqwN2/ACnSx4eQC06uspPrlr2lR5VME749pIDMy9EvoSp9+JGmx
	Tm5Kp/Mc4IXSQSDADuLAaw4rpgaXW4tDEKf1zVXIXadwpowxxw2p4/yFIDvzD63m9QyJ4Ll77mx
	sa6Wm3k8Lg5+fLeC6Qno4B0V+RzXmsCxYtRB9VaYdmDx2BjCj2GA4DQdZAReHnr6pOyY=
X-Received: by 2002:a05:600c:4f45:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-45b8b3ea168mr63251155e9.13.1756806902114;
        Tue, 02 Sep 2025 02:55:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw9JfwtwC068M3a+d86/hOvR7JxhwCiBJFNzquGsYRrqR/k0m99Ht4VzLz8N6zCOBMmSesxg==
X-Received: by 2002:a05:600c:4f45:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-45b8b3ea168mr63250885e9.13.1756806901601;
        Tue, 02 Sep 2025 02:55:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3f00:731a:f5e5:774e:d40c? (p200300d82f1f3f00731af5e5774ed40c.dip0.t-ipconnect.de. [2003:d8:2f1f:3f00:731a:f5e5:774e:d40c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm190896135e9.3.2025.09.02.02.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:55:01 -0700 (PDT)
Message-ID: <8f571dc9-f2d4-46c2-a4b4-6854fa31da2e@redhat.com>
Date: Tue, 2 Sep 2025 11:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
To: Fuad Tabba <tabba@google.com>, "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "ackerleytng@google.com" <ackerleytng@google.com>,
 "Manwaring, Derek" <derekmn@amazon.com>, "Thomson, Jack"
 <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "seanjc@google.com"
 <seanjc@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "will@kernel.org" <will@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>
References: <CA+EHjTxymfya75KdOrUsSUhtfmxe180DedhJpLQAGeCjsum_nw@mail.gmail.com>
 <20250902091810.4854-1-roypat@amazon.co.uk>
 <CA+EHjTz1JxOy=E3p=So2q+k=UK3cDG6C8gOUgA9NQEpqRdhW5g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <CA+EHjTz1JxOy=E3p=So2q+k=UK3cDG6C8gOUgA9NQEpqRdhW5g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HhmyM6RRtKQuedOEeiDj3c_25lrAdOipJ09JL083GJo_1756806902
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_025505_963633_AED02DDC 
X-CRM114-Status: GOOD (  23.04  )
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

On 02.09.25 11:21, Fuad Tabba wrote:
> On Tue, 2 Sept 2025 at 10:18, Roy, Patrick <roypat@amazon.co.uk> wrote:
>>
>> On Tue, 2025-09-02 at 09:50 +0100, Fuad Tabba wrote:
>>> On Tue, 2 Sept 2025 at 09:46, David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 02.09.25 09:59, Fuad Tabba wrote:
>>>>> Hi Patrick,
>>>>>
>>>>> On Mon, 1 Sept 2025 at 15:56, Roy, Patrick <roypat@amazon.co.uk> wrote:
>>>>>>
>>>>>> On Mon, 2025-09-01 at 14:54 +0100, "Roy, Patrick" wrote:
>>>>>>>
>>>>>>> Hi Fuad!
>>>>>>>
>>>>>>> On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:
>>>>>>>> Hi Patrick,
>>>>>>>>
>>>>>>>> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
>>>>>>>>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
>>>>>>>>> index 12a12dae727d..b52b28ae4636 100644
>>>>>>>>> --- a/include/linux/pagemap.h
>>>>>>>>> +++ b/include/linux/pagemap.h
>>>>>>>>> @@ -211,6 +211,7 @@ enum mapping_flags {
>>>>>>>>>                                      folio contents */
>>>>>>>>>           AS_INACCESSIBLE = 8,    /* Do not attempt direct R/W access to the mapping */
>>>>>>>>>           AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
>>>>>>>>> +       AS_NO_DIRECT_MAP = 10,  /* Folios in the mapping are not in the direct map */
>>>>>>>>>           /* Bits 16-25 are used for FOLIO_ORDER */
>>>>>>>>>           AS_FOLIO_ORDER_BITS = 5,
>>>>>>>>>           AS_FOLIO_ORDER_MIN = 16,
>>>>>>>>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
>>>>>>>>>           return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
>>>>>>>>>    }
>>>>>>>>>
>>>>>>>>> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
>>>>>>>>> +{
>>>>>>>>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static inline bool mapping_no_direct_map(struct address_space *mapping)
>>>>>>>>> +{
>>>>>>>>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
>>>>>>>>> +{
>>>>>>>>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>> Any reason vma is const whereas mapping in the function that it calls
>>>>>>>> (defined above it) isn't?
>>>>>>>
>>>>>>> Ah, I cannot say that that was a conscious decision, but rather an artifact of
>>>>>>> the code that I looked at for reference when writing these two simply did it
>>>>>>> this way.  Are you saying both should be const, or neither (in my mind, both
>>>>>>> could be const, but the mapping_*() family of functions further up in this file
>>>>>>> dont take const arguments, so I'm a bit unsure now)?
>>>>>>
>>>>>> Hah, just saw
>>>>>> https://lore.kernel.org/linux-mm/20250901123028.3383461-3-max.kellermann@ionos.com/.
>>>>>> Guess that means "both should be const" then :D
>>>>>
>>>>> I don't have any strong preference regarding which way, as long as
>>>>> it's consistent. The thing that should be avoided is having one
>>>>> function with a parameter marked as const, pass that parameter (or
>>>>> something derived from it), to a non-const function.
>>>>
>>>> I think the compiler will tell you that that is not ok (and you'd have
>>>> to force-cast the const it away).
>>>
>>> Not for the scenario I'm worried about. The compiler didn't complain
>>> about this (from this patch):
>>>
>>> +static inline bool mapping_no_direct_map(struct address_space *mapping)
>>> +{
>>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
>>> +}
>>> +
>>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
>>> +{
>>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
>>> +}
>>>
>>> vma_is_no_direct_map() takes a const, but mapping_no_direct_map()
>>> doesn't. For now, mapping_no_direct_map() doesn't modify anything. But
>>> it could, and the compiler wouldn't complain.
>>
>> Wouldn't this only be a problem if vma->vm_file->f_mapping was a 'const struct
>> address_space *const'? I thought const-ness doesn't leak into pointers (e.g.
>> even above, vma_is_no_direct_map isn't allowed to make vma point at something
>> else, but it could modify the pointed-to vm_area_struct).
> 
> That's the thing, constness checks don't carry over to pointers within
> a struct, but a person reading the code would assume that a function
> with a parameter marked as const wouldn't modify anything related to
> that parameter.

Ah, thanks, I forgot that detail, it's only for embedded structs but not 
pointers.

I wonder if something (sparse?) could detect such cases.

-- 
Cheers

David / dhildenb


