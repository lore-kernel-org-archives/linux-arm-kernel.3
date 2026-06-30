Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B541C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=; b=FolFWy/mzDkoT/c0WmFfeznotK
	ox7SO6VPSfl9PsE3vmMrf74NSuSHXOoJqYrBLpKbIJO9uavGqDNJ+yr5CM3lcBTbbwkPQ6GyHACFn
	le+/nz7Bsj806rFQHiVGiiVogwmMSUyr2PfLIAKATcjCcuOPji+DXAVhAt8qrmQGPQxI6Oy+p4y7g
	rUwXisG4TMRMG4NfoCBabXX6E/YxEhQj2F9Ei4O/enOOXw9H1cjgnUz6vf5F1NzLxqwae6IjcVLau
	ahLaPh6TdYO/4557QJ8g6QPuvDu9gFjHPTZ95REPh8t6FSI8aMUhVv8V/ZBKhGdSBXzIWXO6mPbb/
	Ia9pUexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX8k-0000000GuOw-37Hj;
	Tue, 30 Jun 2026 12:00:34 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX8e-0000000GuM8-39Hi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:00:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-847921eed4aso1407336b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782820828; x=1783425628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=Bj1LapwFxR1TnBUo1E/O03bWfzspCNxY6Mt+kzdR+2iqoaGgAw7gpWY9ohvuX/WpWb
         sLINU/rHbLcPYExwXfTyNjfGTIfsSf+QJW+Sbt35OG+deLWBdIkcMrN4i+MnHHMtocCo
         00APTfl/IUJ2T0YVejBoSpZMDXra1FcNK2/ec+lqewx/L6StAULqdaoXFG7icoby130v
         24DxUzqpBwZ9s+rBw6JUSrd5Ge2WxmdXt2OAVXmOsRnkNwFmKIbTkY6aM5Aou41iTvBJ
         zA/q4ncMKkDoxfu47Rda8F9Q9QOMl5yAB2d7uVvkBg1v2qCHbVizLhHzTRIRNAx35dPb
         lw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820828; x=1783425628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQJzhkIkVPlkRxcrVSAS1/qxSmuU/Saa7J0AIvXGGuk=;
        b=sd+k4xMu0er7bHiL+RPXOvLCw/JKbETOui2F/i+cXPOmv5NS6CqqQuZ4a+k5behjiB
         4sw4hh/VbKLD6ikRTtGjU1eZ04LK/jnHQbF8PP/nnnvcJN9drNa8JpXUf0y3+DWWWYIs
         T409JBXMtOGLQcHd88u578Oz7TJneySuVdexVH8N6rdwB8DXWteR6967P3H23HEghZ2n
         ITnEmBp1jkYMBrB3FZ476b47rHYALNZVsfGjO/uqsyRn6klmzJALVTzFajprcRc1RrjY
         32gnZlqNxpRbmaL9aBoEueHsnY6TMaPW0va3W02bCehYPudAKHBRsZer2G/T1uJV5InR
         6MBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJEshKxCEo5jYmmxVCnGxurx8Wi7G9zkC5rKudONy6C4/5Nvs0/KGprchxXAJwgb2JXEJ0O7RsciQqRCBJcHTa@lists.infradead.org
X-Gm-Message-State: AOJu0YzFKgDiYkFI0PScS3zhRVKOwpK36yRbcZLDpyQwuVNTlJjmIdO0
	M9cUflGjvq1Kv/IVhLA6bxRhlIiuQHRRUXiHFX7TXpYzI9+X0JBcnC7r
X-Gm-Gg: AfdE7clEelNARPHh7M0DvvJmYVqGkKVgaJU3x5mhDCX1Dhe4uvuCcEw0MJpDy/MfWrA
	BZUCDdX4XRylRYQkWAKb5SP3WA3++qMuQN8WR2a7O/ydRDt2l0H0p5iQn+3tXrT5SKcqCYwPJmU
	84743Hly0dRFVbWYT86Err5QD6xF8eHd0moYiCa6l6hnQwSewFGeNdc+CG5uLWJdhRQX0tnLlxd
	ZbPiJrB6LGfJTI4K6TmIJLO1942O7rwzGM441g4HmX1XX04Yl9+itFhGRzC9xIcbqOiEgQfx9Cq
	MdL6K5PqzOkOtMwQtAuSVTk+50GmCA6tDXCPhOTjyHNyyQqwr43fn4IffyOjJvRXM7BvMCeVEAJ
	TFIknJM3GIBrL+SpgmKnZqQHdGOyVLAmhTS65isOhl5XfbbN8LdqpDTIrVmV1qRFLO3OwBQbbI8
	7EJ80JwYFBhgjjfR5jpUsp
X-Received: by 2002:a05:6a00:1ca1:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-8479f2175cbmr2758259b3a.35.1782820827394;
        Tue, 30 Jun 2026 05:00:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd39asm1834294b3a.34.2026.06.30.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:00:26 -0700 (PDT)
Message-ID: <e6028d44-781f-4d21-bef9-eba0547df03d@gmail.com>
Date: Tue, 30 Jun 2026 20:00:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved
 memory regions from vmcore
To: Pratyush Yadav <pratyush@kernel.org>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, catalin.marinas@arm.com,
 will@kernel.org, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, ruirui.yang@linux.dev, m.szyprowski@samsung.com,
 robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260630074715.4126796-10-chenwandun1@gmail.com>
 <2vxzechoi8o0.fsf@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <2vxzechoi8o0.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_050028_791405_F80C6F17 
X-CRM114-Status: GOOD (  17.18  )
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



On 6/30/26 19:12, Pratyush Yadav wrote:
> On Tue, Jun 30 2026, Wandun Chen wrote:
> 
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Apply the same non-dumpable reserved memory filtering to RISC-V kdump
>> as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
>> flagged regions from the elfcorehdr PT_LOAD segments, and
>> of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.
>>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  arch/riscv/kernel/machine_kexec_file.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
>> index 59d4bbc848a8..25359d583bc3 100644
>> --- a/arch/riscv/kernel/machine_kexec_file.c
>> +++ b/arch/riscv/kernel/machine_kexec_file.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/elf.h>
>>  #include <linux/slab.h>
>>  #include <linux/of.h>
>> +#include <linux/of_reserved_mem.h>
>>  #include <linux/libfdt.h>
>>  #include <linux/types.h>
>>  #include <linux/memblock.h>
>> @@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	nr_ranges = 1; /* For exclusion of crashkernel region */
>>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>> +	nr_ranges += of_reserved_mem_kdump_nr_ranges();
>>  
>>  	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
>>  	if (!cmem)
>> @@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  
>>  	/* Exclude crashkernel region */
>>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>> +	if (!ret)
>> +		ret = of_reserved_mem_kdump_exclude(cmem);
>>  	if (!ret)
>>  		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> 
> Nit: can you do the usual pattern of if (err) goto err; instead?
> 
Sure, will fix in the next version.

Best regards,
Wandun

> So this would look like:
> 
> 	/* Exclude crashkernel region */
> 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> 	if (ret)
> 		goto out;
> 
> 	ret = of_reserved_mem_kdump_exclude(cmem);
> 	if (ret)
> 		goto out;
>         
> 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> out:
> 	...
> 
> With this,
> 
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> 


