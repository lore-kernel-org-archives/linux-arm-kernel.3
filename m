Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E7BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pZe05cqV5Y1PIBh8vBXPAYdFpy0cqXi9nRKa9E+n1Q=; b=2vTa89vWkGFJhLvWOmSdyomgSM
	72K7bWzWso9HCh04F8EAP4J5EdLTuIOa+mMeU5xjUuEMJ63tyO9ggLKPzuPx9bu9ukzinNJx2/fkC
	+HEWNrJ/9y38PY3B/4wx7apmG8y0J/5JGPuX2vTl2AJH3z95I5cxyaVDh8kw47JYq6K0ptLLdDnIR
	qydfm3wrqQ/W7tVPX/t7LKTX9FR6HRxIZIoXoFL4c2Nh82aGhaKQ+KyRqQ9dVmjj0zqgEUSNh2tOW
	0p2RITpISQzV0+YBWCyZyWi6guo7oD1T0QoT4h3tk1ddQhhnuW5CS8Sk5MpL0Wx5wYcC0DEeNGD3e
	BvpD9WhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHln-00000009Wgq-05R1;
	Fri, 24 Oct 2025 13:23:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHli-00000009WfF-41Bx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 13:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761312226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9pZe05cqV5Y1PIBh8vBXPAYdFpy0cqXi9nRKa9E+n1Q=;
	b=MSchdtg/4j+KLaSKgcGfRjOZVIXPvyc+npI9oIgPWGV8UaK6J2Z5wEmXpLLwx5miJ7q0UL
	OFKroxe4Gc7Lv2rXp0wb7nrh8/s9uMjplzJisTOSHF6iUXNyFSEswDk+PlKByT6H5v9aJ6
	UcK5eNguq/FUvShLuFruAyvLD5cqkmc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-0MYncHZDOoiWuO5GUsCYLA-1; Fri, 24 Oct 2025 09:23:44 -0400
X-MC-Unique: 0MYncHZDOoiWuO5GUsCYLA-1
X-Mimecast-MFC-AGG-ID: 0MYncHZDOoiWuO5GUsCYLA_1761312223
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46fa88b5760so7234875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 06:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761312223; x=1761917023;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pZe05cqV5Y1PIBh8vBXPAYdFpy0cqXi9nRKa9E+n1Q=;
        b=K+1tOTPidbTf8y7MibkgXx8ZHvDbWX+AAp3HM5hbxpkQRoEbqxbyTVzxuTvD2DLYLB
         5IzXx1+1VoZMqSusbwUv+GhEyu+3PcFCI2xy/y3x8XwkaYouOYJY8l3m37x91JYeeIyh
         CHDnP6aGo4DsvliGLWuLv9oXXPvlF8xZeu5Av/iyKt5S8cp8aythvmmtcEsijnR3XuWx
         enhIgP6R+AP0Hmf8Lh89W58t0Lj3j5Dy0L0+F+uEwJgmHB4djjLOTv3s585AVSYqWm7a
         YbM+tQBW0AwjSrTG+uK8Js3+0YKRiZTAQAubztKM/d3jRom0mX9ZTv3SYurAguPJsmZS
         VSBA==
X-Forwarded-Encrypted: i=1; AJvYcCWUEiB7B+Z3Gwb8+AXW6DyHdN7/yCOgYABh6+/ZhloEPFp/PKDSlM6Q8632lfZg1oFJ9xOn70CCiEmlNAzTe6a7@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZC+KfaSfaqLcdtoO8E7neAag2M9Wz28ZQTwhSq18c6uHd3xD
	n9DeWQ9M31m2NlZ7wpEkUGQABqz7K5tBChsXDJfK01FE8hPRPihAS2LDxvurQ+gaJbZr5IfXhAp
	YkqyZnZZGDXSB7ryn02BEGZaeS4kP6La9u50RqW1HJ8d4YaEL9cxAjj7uozwRmd7RyALDSOpbkE
	nj
X-Gm-Gg: ASbGncuxKMnwDFXhc0dAOdGhwJ49LHSMgTIORNt/g8esNQcYZNtIIbLzUhA41pK4urk
	HbIEuwQg7VJ3rG9+//iGbIt/aGxS1Av3TUCTg1G9kqm6a/nrD0S7lzANQfSpFWHxpbWGXQzw+u9
	IvMKv0q4fkJLUN68Zsmamho+DWFa4UPRfjf3n2jHc5wLFjXpcOhHEvcx4Cj3kbhJ6muDskxIy3P
	W7KXReTzqEk7J6ocL0asjWUqFpnt6NNeF+/vhUeSVslEz4Ttb0JDlfBehA13BhFy24g+XRt96yq
	F69oQ9EG3BkzS2qL9CBIxGajJccMyLh9A2FqRCG94Fn5WtkIRGflgyctaU1NEUqDnY4AZeb/7ME
	Ckb7gNMAd8hLEpxzEZe3TzKXU+gwpzhReT2gSCtfH6Q50sQEZ+25/wnYDjNrkJ+Rq5SbYO25d/7
	nMimh2G8vCUj2csGQeENnFMDnYuXA=
X-Received: by 2002:a05:600c:1d9b:b0:46e:38f7:625f with SMTP id 5b1f17b1804b1-471178771b6mr180789585e9.10.1761312223051;
        Fri, 24 Oct 2025 06:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtGsLBVTNfj/FZoaJq9YDf0YbzbT70oZVwx4vja/yfyCx4XWjsWfYr2kPeTBeEcFsrMCFiZA==
X-Received: by 2002:a05:600c:1d9b:b0:46e:38f7:625f with SMTP id 5b1f17b1804b1-471178771b6mr180789265e9.10.1761312222639;
        Fri, 24 Oct 2025 06:23:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ec1dfsm9461004f8f.43.2025.10.24.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 06:23:42 -0700 (PDT)
Message-ID: <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Date: Fri, 24 Oct 2025 15:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-8-kevin.brodsky@arm.com>
 <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
 <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dia4kAWPKU_AYm_LHIW-1gCt3bdqkJCHB6ktwmVlzZg_1761312223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_062347_062106_114746A7 
X-CRM114-Status: GOOD (  23.82  )
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

>>> + * currently enabled.
>>>     */
>>>    #ifdef CONFIG_ARCH_LAZY_MMU
>>>    static inline void lazy_mmu_mode_enable(void)
>>>    {
>>> -    arch_enter_lazy_mmu_mode();
>>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +    VM_BUG_ON(state->count == U8_MAX);
>>
>> No VM_BUG_ON() please.
> 
> I did wonder if this would be acceptable!

Use VM_WARN_ON_ONCE() and let early testing find any such issues.

VM_* is active in debug kernels only either way! :)

If you'd want to handle this in production kernels you'd need

if (WARN_ON_ONCE()) {
	/* Try to recover */
}

And that seems unnecessary/overly-complicated for something that should 
never happen, and if it happens, can be found early during testing.

> 
> What should we do in case of underflow/overflow then? Saturate or just
> let it wrap around? If an overflow occurs we're probably in some
> infinite recursion and we'll crash anyway, but an underflow is likely
> due to a double disable() and saturating would probably allow to recover.
> 
>>
>>> +    /* enable() must not be called while paused */
>>> +    VM_WARN_ON(state->count > 0 && !state->enabled);
>>> +
>>> +    if (state->count == 0) {
>>> +        arch_enter_lazy_mmu_mode();
>>> +        state->enabled = true;
>>> +    }
>>> +    ++state->count;
>>
>> Can do
>>
>> if (state->count++ == 0) {
> 
> My idea here was to have exactly the reverse order between enable() and
> disable(), so that arch_enter() is called before lazy_mmu_state is
> updated, and arch_leave() afterwards. arch_* probably shouldn't rely on
> this (or care), but I liked the symmetry.

I see, but really the arch callback should never have to care about that
value -- unless something is messed up :)

[...]

>>> +static inline bool in_lazy_mmu_mode(void)
>>
>> So these functions will reveal the actual arch state, not whether
>> _enabled() was called.
>>
>> As I can see in later patches, in interrupt context they are also
>> return "not in lazy mmu mode".
> 
> Yes - the idea is that a task is in lazy MMU mode if it enabled it and
> is in process context. The mode is never enabled in interrupt context.
> This has always been the intention, but it wasn't formalised until patch
> 12 (except on arm64).

Okay, thanks for clarifying.

-- 
Cheers

David / dhildenb


