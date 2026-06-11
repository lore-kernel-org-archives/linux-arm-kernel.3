Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3BBCD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=; b=2kqLZ8SIbVW3XGKzFDXlJXFs6A
	DD76qqGB3pAEjtkalmjMHoOjsxxYG4bO3ANsB08QeL/LdVGRYpCp/JEntHzUC5w9iZYsjtH5Jwo1Z
	W9IAkkF65nhtsT8dLZpaBpQWVmng3BjZWRGDjJkBk1/bzjHoqk5wj1YR9dvKNrv1Ha6mL67kTEIsg
	QQ20lqEdPhQ1Bg8CUg20clos8omwqVhbF1RBmDGDKJXPkPSEZB3b76AFWx6BJNeHE+Cd9NLJx5E3y
	k5MpB6NzXRyH4Ojj9nZYIks/OoMZ4GgGcWiVgzfaAmxXfoc5f/N3ys+M3s087ppLVsDnjeMNHVNnS
	kXIcGGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVnV-00000008bOd-1k24;
	Thu, 11 Jun 2026 03:09:37 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVnS-00000008bNb-2Grt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:09:35 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so4876990a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781147373; x=1781752173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=CN3ugqcSnzjErmYuD7UMMdn/4szOektWAI3+I+JFZjAicb5wL90Qkx1ts6iSuGjT1H
         of6tsvUzqb2Tn5IaryPEG/O8NheoPuLfDi0anQ1/8Vpg/dGvGgzZwN6yqmzyFb8xG+U1
         kvyePheT1ISYLGeuOem1u8fDMRfQx/8ZSPMlXqIrVBZ9p0fpcr8fxVvMxbKTJfveq40C
         qcCvvdoWK5gmXED/ANwrH/3NncaRrQJn589xHuGlILwfgvto5p3XpuhKTFb8y8+rfA+/
         RKzGEvaKpFsQxD6muBXF5UYwcOyFV5YzidPEQsOdUdCjGaMTPXvFKp+5WLh2hAdupJUT
         iseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781147373; x=1781752173;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=eP1EA2AZYiL78IxjyFFKEkkhMPLFlRNuVTd9LV/pWgENuspW6XPFGB/f1rcaLiqs66
         cl3x0l46jekZ5mMhv+5caw3VhxPiVH62x3j+z24DMEjE2RuANpq2DDLqB3xA9Vhz6auA
         WA9tM2b5mBi/3lJpYFQwpJ+Qj0SRzIwau2bdUn7MRFGhF6HuXVLOZZa60/Xwvu8/d8QG
         eVFBXO+88rI1Q28dvjBooCvLGsa283y/7it9NAHghLmHu1EItDDtdDYsyl9OsJ859YdO
         H0h4pwa3VoGZGd5ah3Wg1w75SNMGcHUyEYj9zms0u8ViZHXv3pWRS2WMh2IRrop2KLMN
         fIUQ==
X-Gm-Message-State: AOJu0YzDr7Xed6DpdGRFGCNtRMdAE4dPjiiYb888Vmt4FA1IH7uN/kLI
	eMQxVBPxTJpkR2Ok6F3k4XZy1Y+7cX8sjG2E/cv2JhHF0E44JKp30pCVG8OZ8Nijw8bThQ==
X-Gm-Gg: Acq92OE8rxuEK/U5elLuqg8SqEf8h3qzENtlRGrwaBY9rcKPK82iu093jL2+/qVaeOA
	F2AJ3UpQI5CtbxMKUegBiwfank3OKKr7J1JtaM22ynYqjNEVnpTQepH3+nIH8nzSJVqdvVXFZbe
	Hqx442BBV5G6chSIaAsEHseiTqH6LqwE480xGC5nGYu8Q9SL4HGbv+RrIsieetseNaBSXW7Jp0O
	qJicVMIQ8QgLsknhRg++lRM5F0yQ4rnPXevSwv6SNjILFL9Qr6rlw1msRvEWPkc2ulufYEVqNQi
	SNrPYV9aJ27FYOJdrAO/JAFI7K84ODJbWeubh1U9FF6dt5NEckcP7vp9zitb09zFocbUrID4/zO
	mEdIB18TcVepqcQdVAZbX5p/xce/3r71tD+SFxMLPUhYMqxpQVCOKQfBPLtOrNxsjVjJ09H7LBj
	fRoh3BI+BjardIaBzv/Xi9Hr45vVEQGKCAZgy6otpQzA==
X-Received: by 2002:a17:90b:570e:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-377a75cc2b7mr1151650a91.13.1781147373379;
        Wed, 10 Jun 2026 20:09:33 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86585b5356sm107409a12.14.2026.06.10.20.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:09:32 -0700 (PDT)
Message-ID: <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
Date: Thu, 11 Jun 2026 11:09:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, Rob Herring
 <robh@kernel.org>, saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
Content-Language: en-US
In-Reply-To: <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_200934_619298_078C9E5D 
X-CRM114-Status: GOOD (  20.73  )
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



On 6/11/26 10:09, Wandun wrote:
> 
> 
> On 5/27/26 11:29, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU
>> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
>> those carveouts as part of system RAM even though their contents are
>> firmware state that is not useful for kernel crash analysis.
>>
>> This series introduces an opt-in 'dumpable' flag [1] on struct
>> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
>> DT-based architectures (arm64, riscv, loongarch). By default reserved
>> regions are treated as non-dumpable; CMA regions are explicitly opted
>> in because their pages are returned to the buddy allocator and may
>> carry key crash-analysis data.
>>
>> The series is organized as follows:
>> Patches 1-3: Pre-existing fixes and a small prep change.
>> Patches 4-5: Restructure to allow appending /memreserve/ entries.
>> Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
>> Patch 8: Add generic kdump helpers.
>> Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
>>                elfcorehdr preparation.
> Hi,
> 
> Gentle ping on this series.
> 
> Status summary:
> -patch 03: respun separately per Rob's suggestion, picked up for 7.2
> -patch 06: Acked-by: Marek Szyprowski -patch 09: Acked-by: Will Deacon
> The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
> awaiting review. your feedback would be greately appreciated. I know we
> are at the end of 7.1 -rc cycle, I don't want to rush this series, just
> collecting more feedback, and will send next version based on 7.2-rc1.
> If spliting the series into smaller logical group would make review
> easier, please let me know. Best regards, Wandun

Apologies for the formatting issue in my previous email.
Here is the properly formatted version.

Gentle ping on this series.

Status summary:
- patch 03: respun separately per Rob's suggestion, picked up for 7.2
- patch 06: Acked-by: Marek Szyprowski
- patch 09: Acked-by: Will Deacon

The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
awaiting review. Your feedback would be greatly appreciated.

I know we are at the end of 7.1-rc cycle, I don't want to rush this
series, just collecting more feedback, and will send next version based
on 7.2-rc1.

If splitting the series into smaller logical groups would make review
easier, please let me know.

Best regards,
Wandun


>>
>> v2 --> v3:
>> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
>> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
>> 3. Add some prepare patches.
>>
>> v1 --> v2:
>> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>>     feedback [1], v2 drop that property and exclude reserve memory
>>     by default.
>> 2. Split some prepared patches from the original patches.
>> 3. Address coding-style comments on patch 5 from Rob.
>>
>> [1] https://lore.kernel.org/lkml/20260506144542.GA2072596-
>> robh@kernel.org/
>> [2] https://sashiko.dev/#/patchset/20260520091844.592753-1-
>> chenwandun%40lixiang.com?part=4
>>
>> Wandun Chen (11):
>>    of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
>>    kexec/crash: provide crash_exclude_mem_range() stub when
>>      CONFIG_CRASH_DUMP=n
>>    of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array()
>>      fails
>>    of: reserved_mem: zero total_reserved_mem_cnt if no valid
>>      /reserved-memory entry
>>    of: reserved_mem: split alloc_reserved_mem_array() from
>>      fdt_scan_reserved_mem_late()
>>    of: reserved_mem: add dumpable flag to opt-in vmcore
>>    of: reserved_mem: save /memreserve/ entries into the reserved_mem
>>      array
>>    of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>>    arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
>>    riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
>>    loongarch: kdump: exclude non-dumpable reserved memory regions from
>>      vmcore
>>
>>   arch/arm64/kernel/machine_kexec_file.c     |   6 ++
>>   arch/loongarch/kernel/machine_kexec_file.c |   6 ++
>>   arch/riscv/kernel/machine_kexec_file.c     |   4 +
>>   drivers/of/fdt.c                           |  11 +-
>>   drivers/of/of_private.h                    |   3 +
>>   drivers/of/of_reserved_mem.c               | 117 +++++++++++++++++++--
>>   include/linux/crash_core.h                 |   6 ++
>>   include/linux/of_reserved_mem.h            |  15 +++
>>   kernel/dma/contiguous.c                    |   1 +
>>   9 files changed, 157 insertions(+), 12 deletions(-)
>>
> 


