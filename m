Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03369E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=; b=XZtDXTUSvpcgXwoNnpE7m6pjYX
	WbFINUSFthp1qCh8Z9VUoqtnlWKeaCfRJ6rYjU56CcyWEOb+YK4IOQPmAITC51+bWZgmIZPyhiQ5h
	MXCByeYNoW413Nk30WTSnegWIGp9FZwmA05FCbPJb7pQsKAxlYBujGHll+cSsrt9ySDnYvoWkDO5T
	TYmx8f1tuvoGB7HDyImk9MXo45we4fIlXGaHYeI9CVpgRnCjinmNZjJc40N2rstLUeGMxB+wZgSWO
	AjmbAe5BAvasdmOxJFhfAn2mdjaM9boLJBgRrmV7Mx8+cKudsa5+TbiIhDISDROgmt/WKdtR7kDK+
	Y90W3ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8p0-00000004nQh-2Ozw;
	Tue, 07 Jan 2025 12:36:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8nB-00000004mvA-20s7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:34:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2164b662090so198398035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736253281; x=1736858081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=l2/Vit2DKZvUFAHNzQk0nTt3q9RldYSfxSXgtNVRPYgNpJ9N2eVzqILJiSoGg18Bnp
         DcD93rC3He0tJxhAzS4gUxMJSVfgjKdpSkCETl4yZq/cWtmZAPcLNl7WQm2FgMNpLADy
         pdsgqREwqNrbMyxmc4tk2JFv8vbf9HCnueSNl7wtCygTeZIYLCr8quMTygGZYpIhCYJm
         sQmeLpQ4F/Z+htKXXnvwSIZQLngO0K4EFJ04YVTw+QJX/maX59Ne/v9hxCvnA65Q0gK5
         oYkREmkFt2IbMJBQGGUnYjr6YDg2Uwpa6gF+/kr7PEZjSMJY/Cr//os2Sziaa+FhSoeW
         8/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253281; x=1736858081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBNgt4Pp+5r8EWFOkpTfSkW0RGZvpIi++k6cMXShG00=;
        b=nGXbr0s/B9AdX6Y7QIyDbfrxpbt1gyJUB0fjLyi0Z5WppGaukbOBpGrgE/pXjdcTUp
         Nuvvj8F2Q0qLGSeqa04L95V2C1VKn/g+whpp09r7knxq/iEVG36DwmNA+e/4HMgX8I7P
         OBSfZGoxr50tCA9XMMZx8fcTDj23r2HZO+L9pWnGZLp0YTK0a9r9EPuRtoAHHJABa7dB
         hFntMlv8QhzrUfQHSoeV1+0jlql9217GtWNu7S+gVVzP8vxBGpT92VBAwakdMXf4RZr6
         LOdPtFG8+DTN2ULmrc3TVNWKriJIGfHb2hSnfOvOTiFQak6RomVnnX3VDyzzUeBQzGUM
         cXCw==
X-Forwarded-Encrypted: i=1; AJvYcCWyneq3nsYjK/RaHXISjpCpTvXpZx0UO/IMkqsaOz3gz5bHHqM4dGzwm3+AAIuTnY1H5NCHkLo/fIOl7Td1T3c3@lists.infradead.org
X-Gm-Message-State: AOJu0YwdzrI2QMPYwPCsIv6kFrb82fD4C7IIXahVMcaRXNqHg7tO/j4B
	OWkdDQ7jNLauC89Sxj5ipSxOl6Ycg4LFGv2URNPD/DyIN8LziXPGwmcWR73gf6c=
X-Gm-Gg: ASbGncvC7+GCpHCFx+Z0GAJwiuhxFu+f+78mZ3Icn6KPzATePow/N/VB+J+hXdmjDtr
	jQ/LBMklTvDSHBpsN/kk3U/lbsyUGkdWRqhf5QaipL1gBdVu3YvuAQUeRXFS+wfcDp9WpROWAVa
	svi2iFssGf5KTPLzEJE5rA9mAvtNA7YAXWI39eNBL5Lwx+QphEpurRpih2swyYS86jAxQWyk7wc
	1jjAPDJQrErqoRtIxo5JdZP1riOIuHPqU6U0ljziZOHNDQKkSVSkFeB7XJizWJlt1Dv8ZwJPSBK
	fMsX
X-Google-Smtp-Source: AGHT+IE3yUUkb0m+aLP2spLDFrGsHc6y1BQTdsXYC7/WM0wTJqWEm80meD2oBwGaRCvgAk0D5TXwug==
X-Received: by 2002:a17:902:e746:b0:215:8847:435c with SMTP id d9443c01a7336-219e6e8c595mr965146185ad.12.1736253280842;
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cddsm311379695ad.48.2025.01.07.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:34:40 -0800 (PST)
Message-ID: <9040b9ee-88c9-4347-b8b6-5894b45e62b8@bytedance.com>
Date: Tue, 7 Jan 2025 20:34:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] mm: pgtable: introduce generic
 __tlb_remove_table()
Content-Language: en-US
To: Andreas Larsson <andreas@gaisler.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <f7febc7719fd84673a8eae8af71b7b4278d3e110.1735549103.git.zhengqi.arch@bytedance.com>
 <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_043441_524136_42822486 
X-CRM114-Status: GOOD (  11.65  )
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



On 2025/1/7 20:32, Andreas Larsson wrote:
> On 2024-12-30 10:07, Qi Zheng wrote:
>> diff --git a/arch/sparc/include/asm/tlb_32.h b/arch/sparc/include/asm/tlb_32.h
>> index 5cd28a8793e39..910254867dfbd 100644
>> --- a/arch/sparc/include/asm/tlb_32.h
>> +++ b/arch/sparc/include/asm/tlb_32.h
>> @@ -2,6 +2,7 @@
>>   #ifndef _SPARC_TLB_H
>>   #define _SPARC_TLB_H
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
> 
> sparc32 does not select MMU_GATHER_TABLE_FREE, and therefore does not
> have (nor need) __tlb_remove_table, so this define should not be added.

Got it. Will remove it in v5.

> 
> 
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC_TLB_H */
>> diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
>> index 3037187482db7..1a6e694418e39 100644
>> --- a/arch/sparc/include/asm/tlb_64.h
>> +++ b/arch/sparc/include/asm/tlb_64.h
>> @@ -33,6 +33,7 @@ void flush_tlb_pending(void);
>>   #define tlb_needs_table_invalidate()	(false)
>>   #endif
>>   
>> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
>>   #include <asm-generic/tlb.h>
>>   
>>   #endif /* _SPARC64_TLB_H */
> LGTM.
> 
> 
> With the removal of the define for sparc32 in v5:
> 
> Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Thanks!

> 
> Thanks,
> Andreas
> 

