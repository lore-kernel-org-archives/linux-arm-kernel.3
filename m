Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7804BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=; b=srETGr8mfa+/Ljs27OLIADFAKc
	Sb5lb6oCQD4hxtoFT/jQSTaMVi1cgNBF4sB4ZOo2vt1eDnXdyLunSL7j/hCwx8JtvSr7bqbnIpX/W
	xZWbX9k9rCIR0frN0U6TcZ12GGtKsuOH6odnBVe/tJF6p7aE94VH2LRiuRQ6h03KShuE5fP7pMS4w
	bX4ItJ8LSVgJ/uU6PlnievQoQd+U7KKNVtlu4vQiMnV6dC68ot4aqYl0uEn+P+ORPMzkcAtIxJka8
	rcRdrzpJ6LNe7y0fMwGDemF5qVc+8wo0ubBa8LfLVS0FHQaZAkud6ck702crvRo56jY+T4WaR/JHW
	9mvep7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4Lc-0000000DSPn-2SA6;
	Wed, 27 Aug 2025 00:49:08 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4Iw-0000000DSAh-0VhF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 00:46:23 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3ef6866cd99so4464115ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756255581; x=1756860381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=C/jWawzCYScydP/yziZyWXea6Z1PbIuy6F3Pa3vtiuvtHi0qCpBVGCtkkxgRW6R2z6
         pI/LYZRKbcRXnlp0ayjZPiT1ua/8eZ/2ubE93AtUJcTqfo51J++nyrrrZfHNoxs42oBS
         zoCpY9WAkYQCrAUDHCVA17RGh/hOGcMdlXg8nCrqzGULgj86LwxDYvAE+BFtqNHSx5Qk
         SAy4qn7ttzkZ/A1eUP/3XA0+ol/vHsDEzk3axQ2JVy5TFYIymtwbnHl7jDIYOmx9axh/
         cWDGU+ih9jozNBiYf7plHZQ08Erd+k4D7Q7f2OIKVHHUOxGXekQE0iYxv9MT1BrF4M2f
         +Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756255581; x=1756860381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=Jj13NebkN4kiX5k2UslJ9cxtjo6ANavJnVwbt3HQ3I3v1pJnckpHLTu/zT1YwXJtXw
         mTUoZ6nioBEQ59Ojh7rAic/BLuRN1C/FucKo/sgWK91B/w6roMtzS7eyi6Ns3O1ZZ7W8
         +P5NTcB96pIJ5xYwB2JCRJbE9J1rkgFgq59S9wqHCIx+c7HpI2iE9Ur+hXJfT1dsrxWV
         pQk0qeRhF46WzGAbhKuSEcp3hPheJDy/I1G2PFcZT/INCdRIw7MqA293Kgzbwf2KUXNv
         DxwenWrTcP0VDI3GGV70MWcrisQomyu8QUsGzOIPYTkGarXAy3ghTtnbVpbrUwD7/j29
         4jXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd8YVqvOAPh/zW1U9EAXznr7ilL29jI76OFcJH0ameTG+RypsAV1ypObJkzSrRjdQ9HRSVi4nhricHDZXNG5tn@lists.infradead.org
X-Gm-Message-State: AOJu0YwSTWQSQjlEAVwBSGeDZPJn8jFWmTB3XqUvfaLnlouOivOxneNa
	xQtyfdtWhBo31qQPa48xq/De7cBBawlIFZchgjPnhgEKjlRkpkRs5bySAPQ7fUw8m9A=
X-Gm-Gg: ASbGncvB8fCdmeyniOHxm535ALA3MHgogNvk/LZOfYGuUd8usivT2Eq+kGDJc6lGti5
	JXkPEF7Qex/s3qPl/X5GifnsPjHSN3fR/YS3okyP7yFKEV605ogxaASR6G21jvSOCCcTkpLS8mu
	E04ckZWMGHwDH0h9BgmOTuYOOHVK5kv34slAP9lwb98bZ7KCnKHEvyCy0aZPb1aOkFFstP1JbKV
	caPoUoQNO/iY0dUG8CyayjvvEKeDMZLiR5KMlXX1yl9/cQoHEJDqhz839r+rRFEYVWvtAkAh/U9
	Hhm1PgIaqJ59Rygv9ZIuYst4cSVTopYaktY2BrM4MH09SymAt6c1jVmUyxLXdt3gE8MVlEqc2wJ
	8xdHkr+oDnK8S0jdinHYDxK4FriqYU+iDlpB7Rg==
X-Google-Smtp-Source: AGHT+IGfh2W97xdVpFCgiQyq3Pb9/ifBsTlwqyh1OAHr3R34PnfYQnj+aQ8bMShNsAl8EpMrNrhaMQ==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr43866025ab.11.1756255580619;
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ef2ff2dd60sm14606295ab.9.2025.08.26.17.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Message-ID: <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
Date: Tue, 26 Aug 2025 19:46:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
 <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_174622_178930_7CE15DDC 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Maciej,

On 2025-08-26 3:08 AM, Maciej Wieczor-Retman wrote:
> On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>> On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>>> +/*
>>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>>> + */
>>> +#ifdef CONFIG_KASAN_SW_TAGS
>>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>> +{
>>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>>> +}
>>> +#else
>>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>  {
>>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>>  }
>>> +#endif
>>
>> This is the kind of thing that's bound to break. Could we distill it
>> down to something simpler, perhaps?
>>
>> In the end, the canonical enforcement mask is the thing that's changing.
>> So perhaps it should be all common code except for the mask definition:
>>
>> #ifdef CONFIG_KASAN_SW_TAGS
>> #define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>> #else
>> #define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>> #endif
>>
>> (modulo off-by-one bugs ;)
>>
>> Then the canonical check itself becomes something like:
>>
>> 	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>> 	return (vaddr & mask) == mask;
>>
>> That, to me, is the most straightforward way to do it.
> 
> Thanks, I'll try something like this. I will also have to investigate what
> Samuel brought up that KVM possibly wants to pass user addresses to this
> function as well.
> 
>>
>> I don't see it addressed in the cover letter, but what happens when a
>> CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?
> 
> That's a good point, I need to add it to the cover letter. On non-LAM hardware
> the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
> isn't that difficult in outline mode, but I'm not sure it can work in inline
> mode (where checks into shadow memory are just pasted into code by the
> compiler).

On RISC-V at least, I was able to run inline mode with missing hardware support.
The shadow memory is still allocated, so the inline tag checks do not fault. And
with a patch to make kasan_enabled() return false[1], all pointers remain
canonical (they match the MatchAllTag), so the inline tag checks all succeed.

[1]:
https://lore.kernel.org/linux-riscv/20241022015913.3524425-3-samuel.holland@sifive.com/

Regards,
Samuel

> Since for now there is no compiler support for the inline mode anyway, I'll try to
> disable KASAN on non-LAM hardware in runtime.
> 


