Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424F9CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=; b=fmMleVhs/ywBAEEhixQ+h0WwbV
	wLaeDHc/Tua4WYN72nTHihPXpMJHhkgeUC90SPNo3dUlSRGHgoHaq6ww+CdSWkI8nuPJI/o2Xw9S0
	okou7o5jWe0T7lEtCIbUfkT5BehOQjmGL8wY4gksv6sPzQxDb4mMszwLoR199cDPnD417JKndIAhS
	ryX5zpeIwY8G7dPH5krpFRNzHC1fFuFo1R9wSuLpgHWWjI/tpR2bbuyrzB9Tjw3fDyK6fmW9y/lyE
	g/To+8wfQ2Jft8cu16h5KcHjEHtII4G3aTPZI0swPyyBLToUmKur3cK0TVMp6zc4V23prHD2qaXWz
	A0f5w9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1QN-00000008bAZ-16Fo;
	Tue, 09 Sep 2025 16:42:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvIR-00000006Gj2-1HXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757412594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
	b=EIH2P8zIcZYkDaCMrxLDGWHfPHP777hlvuk4rjzrd3EWHy82xAVFawnQA0eQ11KfPTUQIw
	mfMilZyTB/IPyohu6Inx1nvoomsXwhxl1TwV8jO+qcFWtUu16n9q54WBAzd+YUCW37T5WO
	MDo4/NDu6ELr7/8Lah8RGtOioePKBS0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-PWsZgjlLNZeU1R0ctG0zAw-1; Tue, 09 Sep 2025 06:09:53 -0400
X-MC-Unique: PWsZgjlLNZeU1R0ctG0zAw-1
X-Mimecast-MFC-AGG-ID: PWsZgjlLNZeU1R0ctG0zAw_1757412592
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3df2f4aedd1so3943594f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412592; x=1758017392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
        b=eV954MsG7t/aMhJYK6eLhuL2qbfWIDwHUNh+E0PxaW/TL+VhRoSbZ6HA2XRSzZXZd2
         LUQaos/MFs0X71SfSU+4xYoJ15peqztNMQTerFiKGuUssvYFlWzejQruoT8lN+Wz23oX
         uTZgZbQRwbJ8V0ojtxdfjNVXm7Ye7CdyjObfUfCrzcunYRA1ePfy+wgUiD3Ehgsu5H07
         gadQpFir3lekxtSIohFNOQX/o/ZiS436NXv5V6w6jj0cpkCbAEY3242ga9GifCvHgtG5
         SwEg/k0J72x5AsBXpDDmurSvhKzCgkTnC+hoRWZauiok5nyij6jUJGw+nPYTm94i+RP8
         1Z6g==
X-Forwarded-Encrypted: i=1; AJvYcCUwi+wbK1RzuCtYOU/Ak4GZsBYduH0UNPmQ+gfr0xt0YHXjJQspIiVuo6MoeaJ7RwxVo6gQNMUYOISYOgvOLF6V@lists.infradead.org
X-Gm-Message-State: AOJu0YyFQr25n5rUWYPh19tpWwA0peArstQctfpDUm9a5V68Fzp3P2pZ
	LjOAalROBmVXY1FfxBpcgevkM5p/BFJjeh6oWq529J06jKATtBTryf3Mr/CGgBgtd4GKPunhEi3
	STHm/5YUEAWawzBmGwpz40r9QlsZa+uPJnmHDhnSbKektEphb85SwmBnxp2tDjD5Qo4aID1+sSO
	/J
X-Gm-Gg: ASbGncsZsgqxvjsVQsWfRiYLCm9key7r7LD3JtMo7dYTQ8O8lONQCf0eufX5Hlv0MSl
	Jfhzs8/W47ISjfPVJtL1JmxCnljvlBkG0k07XZ0WKilBnkEDOGSYe633PMoQq7Eo6AC7yZK3IhK
	fIZLJPrx7Im/Gct2hVJgbdHG+9ROa77a91iLn+a/UT3pNWZQxHJj/IixAqFTRc2PUrVbCZnZqfq
	cZIo0+x1BaNnXoHZ0kxqJl8M9bsjTsLjDU8BIXGNAJkpjW6gYmvc6AYE9eGRRcQJjGE7lUZLawE
	3Txuz8kC/ZEFg19mj6U15MnPrM4/Pys7fjzkHEvrvqPRA8VydkvJfRo4/vNE+4hrXnTzKkvVLbJ
	CjTnw5ICFzTGDEls7HLzxiGyKYyiMgoPtOt6mqymExmRV53OTIeSr5oBNInLT2G2Unf4=
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424827f8f.10.1757412591685;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6kYqxQMhMlrUNgHhh5IEpwCukAjnB2iBRVYizcIa9qqydeyLJ0L3jlngBNKljI3RpH7CHw==
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424776f8f.10.1757412591141;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7522562d1sm1945921f8f.63.2025.09.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:09:50 -0700 (PDT)
Message-ID: <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
Date: Tue, 9 Sep 2025 12:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
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
In-Reply-To: <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bd3yzkLk5BdWDE2OzPai-EvUooXnZabz4iKrDzO55Sw_1757412592
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_030955_439266_DAF4D7DE 
X-CRM114-Status: GOOD (  21.00  )
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

On 09.09.25 11:40, Alexander Gordeev wrote:
> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>> (taking and returning no value). This is proving problematic in
>>> situations where leave() needs to restore some context back to its
>>> original state (before enter() was called). In particular, this
>>> makes it difficult to support the nesting of lazy_mmu sections -
>>> leave() does not know whether the matching enter() call occurred
>>> while lazy_mmu was already enabled, and whether to disable it or
>>> not.
>>>
>>> This patch gives all architectures the chance to store local state
>>> while inside a lazy_mmu section by making enter() return some value,
>>> storing it in a local variable, and having leave() take that value.
>>> That value is typed lazy_mmu_state_t - each architecture defining
>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>> For now we define it as int everywhere, which is sufficient to
>>> support nesting.
> ...
>>> {
>>> + lazy_mmu_state_t lazy_mmu_state;
>>> ...
>>> - arch_enter_lazy_mmu_mode();
>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>> ...
>>> - arch_leave_lazy_mmu_mode();
>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>> ...
>>> }
>>>
>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>     lazy_mmu is already enabled, and it temporarily disables it by
>>>     calling leave() and then enter() again. Here we want to ensure
>>>     that any operation between the leave() and enter() calls is
>>>     completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>>>     leave() to fully disable lazy_mmu. enter() will then re-enable it
>>>     - this achieves the expected behaviour, whether nesting occurred
>>>     before that function was called or not.
>>>
>>> Note: it is difficult to provide a default definition of
>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>> that definition would need to be available in
>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>    #include there is very tricky due to the existing header soup.
>>
>> Yeah, I was wondering about exactly that.
>>
>> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
>> different.
>>
>> Which raises the question: is using a new type really of any benefit here?
>>
>> Can't we just use an "enum lazy_mmu_state" and call it a day?
> 
> I could envision something completely different for this type on s390,
> e.g. a pointer to a per-cpu structure. So I would really ask to stick
> with the current approach.

Would that integrate well with LAZY_MMU_DEFAULT etc?

-- 
Cheers

David / dhildenb


