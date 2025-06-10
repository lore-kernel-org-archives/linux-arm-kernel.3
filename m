Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3631AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ouH/PJFEkAjFGDBxmHkInwDz0FSY52fc2pNnFWKOY8=; b=FlwJnWRTZ490Bquyof8gd6Ylzz
	y06ty9NbFIhAKcFDgJG5o/nXAns9f+kTL+EP/Bv9cXHfHSM3K80rM7Zs2phFFJRRAUm71DVAQC6rj
	qgdLOHZcj+KHSsv8f/LG3ZJIwYxk20sayHOELxnrpwjEj4x40x6syP0NFGx/MxMFmR2OoUJIuh6HU
	q/YF97zxdFrwriqP4PHke1m9j5iAwuQRNshOEFsVaNa0esxuPx9dcwVBPWwJt039sn7BkEZ+GwDcv
	Ln38L/rai6g4d4gna7p964uzvuxScs7jkDvx5ckqTD626Te3rY36tiGxrQ3Mglv1vZlW1420Svk3V
	8gWNHr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP14g-00000007LZ0-0NHZ;
	Tue, 10 Jun 2025 15:39:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyoX-00000006vAN-3YCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3ouH/PJFEkAjFGDBxmHkInwDz0FSY52fc2pNnFWKOY8=;
	b=UZZ95Xm+7aeai12GysQs8tkTsn0aP8T9yLYHBH350Yc4Mpj9QVrmpK3MnXyt0phMLHRysp
	f6slVN5+sHHcUh8lzy/64IrWfACeDCVIekYIIcbcIEuVhYI2RT860OkGc7Jv0eadkVhHp4
	94y4d4EMDHlPBi1Ar0Dt9eNBMzUhebs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-gB7j04uhMguKbgfmGoPRXA-1; Tue, 10 Jun 2025 09:14:51 -0400
X-MC-Unique: gB7j04uhMguKbgfmGoPRXA-1
X-Mimecast-MFC-AGG-ID: gB7j04uhMguKbgfmGoPRXA_1749561290
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso15636425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561290; x=1750166090;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ouH/PJFEkAjFGDBxmHkInwDz0FSY52fc2pNnFWKOY8=;
        b=pbGU0wP/37AiOv8ljZFzRtz1Vwjl4KbE+oCTdV1D6tEFf2ZDANU7tCC75aUS0RUl3a
         ZtbzunKVfrkv6XzInZIEjUTZlxjDgXLu1Sr+8+itLu8BIq0EZBPVR1s+K+d2Qr5TmO86
         RQd8APhy0U/1hhiSw2wbfd+FYS5WR/jU7fBFOAkiMQViVezsRUnNxeLWK/Q0bHgB5Ebn
         sWImzbYL02c3ZlYB7XayZryP1Ke10GvrklbpVNa7RcB3RPYVerF6dbJ0+0b4mZ6wUogH
         n2qZy0a+BEmhcuKVKxORJybc/X3qYsp/md7LnY+/PlQZof8PXdpqwLYWui6WNQnZ4FTs
         uujQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOd8q8MUZJWFD/eE+zYyX1swm7tcTScRQAoF1fDhjsoo9v1/Ua/GdAv168kBdYws3C0dj/S+wL2GW799huUjak@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/32MIHwwNmAMTjFGvLZGWLLVD+83yHzDUfmTIpRqVbexezP/i
	8YMlTqKQMuPSE3WvhMg/OIcyTk9tTtR18QhsvMi1OvlO9tRhZQio1tyhX0AQeFUl8FUhu1IUtFP
	E5kffCTlalXEbKXepw1o7Q1t3EhP1mS1SYqq+bBZj80tC5Kjc2FojcWiZ731sgW+6OruC3gKfBd
	uC
X-Gm-Gg: ASbGncvihJDUODDHgReaCakKODQ5iYuezjwBX+Q57RYTUXfo/vqB8basoqKIxmWTZtI
	x4pa2UhsWCwuKMrpfGi0FC8YivWwiBxJZjzNXyTmI3fQ2zBkykUaw8BRoUEvilcJp25sVEhMQgc
	PXqzWnZTK6SEFoiJTPsCexMpImpr6UMx3ly3DCOWdL1nph7EFMPRugI1AfBtJba7IhfXWk8oEXP
	wpOZDxfSHRT4fYQ7dVeDQNX3IetlIO2M1CpMqRKC7x6RIEt1u7KYr5bv+pAWcTeLEHi3LHAkBHF
	tEASdpqiAXGSFHWsMzX9Aj9o+fS/N0w59/lcjHiLsGsN3p4JYusnDhA=
X-Received: by 2002:a05:600c:8b6e:b0:450:d422:2092 with SMTP id 5b1f17b1804b1-452014557d1mr149407355e9.8.1749561289782;
        Tue, 10 Jun 2025 06:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbxtZldNzSnPZLU/kGR9eWXkVvoxMrfRnzlaElJKdZcYo4jd1SgsAP7wqzt6fVFzT3iNngtQ==
X-Received: by 2002:a05:600c:8b6e:b0:450:d422:2092 with SMTP id 5b1f17b1804b1-452014557d1mr149406935e9.8.1749561289346;
        Tue, 10 Jun 2025 06:14:49 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm141807225e9.34.2025.06.10.06.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:14:48 -0700 (PDT)
Message-ID: <1b94d8ce-ab6c-417d-af4e-cd49bf297b60@redhat.com>
Date: Tue, 10 Jun 2025 15:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-3-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250610114401.7097-3-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B1Vy34Rficubbb0I8wxV0lESR8uG6GZlebcU3vom0oU_1749561290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_061453_973861_E3704A56 
X-CRM114-Status: GOOD (  22.20  )
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

On 10.06.25 13:44, Dev Jain wrote:

Subject seems outdated: walk_kernel_page_table_range()

> Since apply_to_page_range does not support operations on block mappings,
> use the generic pagewalk API to enable changing permissions for kernel
> block mappings. This paves the path for enabling huge mappings by default
> on kernel space mappings, thus leading to more efficient TLB usage.
> 
> We only require that the start and end of a given range lie on leaf mapping
> boundaries. Return EINVAL in case a partial block mapping is detected; add
> a corresponding comment in ___change_memory_common() to warn that
> eliminating such a condition is the responsibility of the caller.
> 
> apply_to_page_range ultimately uses the lazy MMU hooks at the pte level
> function (apply_to_pte_range) - we want to use this functionality after
> this patch too. Ryan says:
> "The only reason we traditionally confine the lazy mmu mode to a single
> page table is because we want to enclose it within the PTL. But that
> requirement doesn't stand for kernel mappings. As long as the walker can
> guarantee that it doesn't allocate any memory (because with certain debug
> settings that can cause lazy mmu nesting) or try to sleep then I think we
> can just bracket the entire call."
> Therefore, wrap the call to walk_kernel_page_table_range() with the
> lazy MMU helpers.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
>   1 file changed, 126 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..2c118c0922ef 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -8,6 +8,7 @@
>   #include <linux/mem_encrypt.h>
>   #include <linux/sched.h>
>   #include <linux/vmalloc.h>
> +#include <linux/pagewalk.h>
>   
>   #include <asm/cacheflush.h>
>   #include <asm/pgtable-prot.h>
> @@ -20,6 +21,100 @@ struct page_change_data {
>   	pgprot_t clear_mask;
>   };
>   

The general idea looks sane to me.

-- 
Cheers,

David / dhildenb


