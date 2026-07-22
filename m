Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E24C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Z7oDiKdtFczxQKch+yVvuNvhzSOS2efy5d+XjmEE4=; b=b0u4A+AznloDm3J2Ua5Srki/pN
	W5h33KMfVYyuU1Hqam2MVk1dF7PGyiifOpIXDoSrYJ0+skEIfeaiAUZpCipQjNCPGH3hhzo1d4nOc
	LtjY/KJQLKZHtKBYWUkPbVPAa0oqVMUDobuFJIlXwO/qDHu0IhYaag/MuNMjQPMKjVLhk9Cgqsqgi
	phDafKVhzx+t6q8HPFgY4bKK5ZRAYmxdCpn5DOXN8F8IxyMJr14lto8x87Pt6xOQjaCsqlm6oWyXj
	vJsz6Zj8vAQ41frLQJvyYGpzYEaof+aj0r8Pe1kK71qq+QjA+QgHyNRynhcmgG4d6Y8qQF7oez2Yk
	qZJV6QZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVjz-0000000Bi1L-3I2X;
	Wed, 22 Jul 2026 12:07:59 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVjw-0000000Bhzj-0Jrw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:07:58 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-37fb1883fbfso3255369a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722075; x=1785326875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Z7oDiKdtFczxQKch+yVvuNvhzSOS2efy5d+XjmEE4=;
        b=NzsTBVclC/VLVbD8OYfdQQll1aIpQIm1h7lVsOkNuN2ZusTF4VT1ZdrZr9IuiIq7ca
         FqOanYD7nVWkVPyGEpekuM21VnAWD8FsQKwG6hWxtiNLDSTm2xspwduoqKFvXK2luHvj
         /TpOmsrp3jUeBdzbiLJ/BlZbhkAWrzgmxies125ubSZHabIUb+EBgPdAhqYwuHwdIo+E
         r706H1iRbLbuKmslN3zrMv71CCcar5CJcHtVr5kItYlao1CX5wDq6ZEyYIdlW9rWo88P
         oP2VXWJz0JtGr8prK33m4WTR7X04gKrP4feyaj9cNJdyldjzFaxtRVeKib3OKaRQrYuo
         JfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722075; x=1785326875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Z7oDiKdtFczxQKch+yVvuNvhzSOS2efy5d+XjmEE4=;
        b=Ao5Y6KRng4W8bWpl5aWid4LPjrEPm2yGfmilNxFwYivYAFCXL5iWrqHnlWQchFD7KY
         5vYFhb/5eaEWD02jKhayD4E1fgPCIo8oJ3FVOx4HyaNb5a9SOTaI7VzpbdLsPpFIkEdQ
         DnfF7iNWSkQK+AXbMqTHvjihQH/pxn5wsWmBA2Ug4Xp8hdYjwdgEUlVDb0hVxHn513kG
         u37yfPpR0vuYBpvNL2xhFI243JY8UwKaIa7OQwP6bUUItaRbLdn1a4JbNFelxp4TLhnp
         mDaozgGoP6IzHmjX55pKzqWmGHZmrYdKDsu0gOUCIkUjpSFHGJRiK1ZG4ZitL8J5qBDy
         PjNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqrIQ0j+G8OVQWll3zduFJqrvUuBmFy4d79s13DjIkPi09nF5jQmPdm22JizwMiOWBPQoRIONkULMvQsJoUNgv@lists.infradead.org
X-Gm-Message-State: AOJu0YzHBCOCz2PDbwO/vl/ZfGdsEHrDk7tvwI2g9rUoWVpSAJYppXVM
	TxoL8nmt1Ojv+MyNBJ37WhB/zaoOIcOZwreJcesyGMiG1L1W6iD1NPDI
X-Gm-Gg: AR+sD13EcQQkcWzID6F07PqslxI29HIUTA/FhHIvjRvajCEdfp2tE5yfJEiC888qVfw
	pCBQOpB3ylkwIxyfB0425ShChHHwvKwrTDwiNwf10MQmGyW/y8wCxRZIQoF4eXzJzgaQdrFs3cc
	f7ugr+bSaYP5BW9njuS6U1D3Gciq3wkZsSIwGWLisUqC0gNPyHXDT6UYKru008nC8Rah8R/ADYK
	8h8ripiwwX5U/Ky+xTLCfH47qdPLt+yqWYC2D0KTUNH4R4SZnZ/VZci+fvSx6q15Un/5hM1Cp2i
	yZaWoNnAeO3tdidSxjEcibwOFt3qkwLmP0ndrPH1Dg6l9Bh2+ULqawA1/KQrJ9Z9vjAyp2h7dOG
	H1DMz/ZLQqY1jBbUsy/7rr8gDLd3mny7J7oy9TsjWAdOwpx+/xMkEDgdLekX7FdGG4X5BwR8qor
	/51Ne3wco8JA==
X-Received: by 2002:a17:90b:1b42:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38e4b57ee22mr21351484a91.40.1784722074599;
        Wed, 22 Jul 2026 05:07:54 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9218a343sm3215461a91.16.2026.07.22.05.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:07:54 -0700 (PDT)
Message-ID: <e3dd16fb-3795-4028-a2f9-00f54882183f@gmail.com>
Date: Wed, 22 Jul 2026 20:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_050756_115675_ADBE6AE0 
X-CRM114-Status: GOOD (  22.57  )
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



On 6/30/26 15:47, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> On SoCs that carve out large firmware-owned reserved memory (GPU
> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
> those carveouts as part of system RAM even though their contents are
> firmware state that is not useful for kernel crash analysis.
> 
> This series introduces an opt-in 'dumpable' flag [1] on struct
> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
> DT-based architectures (arm64, riscv, loongarch). By default reserved
> regions are treated as non-dumpable; CMA regions are explicitly opted
> in because their pages are returned to the buddy allocator and may
> carry key crash-analysis data.
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce. The reserved memory
> has already been filtered out in x86; the optimizations in this series
> apply to systems that use DTS such as arm64/riscv/loongarch.
> 
> The series is organized as follows:
> Patches 1-4: Small prepare changes and cleanups.
> Patches 5: Add dumpable flag to opt-in vmcore.
> Patches 6: Append /memreserve/ entries into reserved_mem[].
> Patch 7: Add generic kdump helpers.
> Patches 8-10: Wire the helpers into arm64, riscv and loongarch kdump
>               elfcorehdr preparation.

Hi Rob,

Gentle ping on this series. Patches 01, 05 and 07-10 have been
acked (thanks Pratyush, Will and Marek), and the comments there
have been addressed in my local tree.

Patch 02/03/04/06 are the core of: reserved_mem changes, they are still
pending review on the devicetree side.

Could you take a look when you have a chance? Happy to respin and
address any feedback.

Best regards,
Wandun


> 
> v3 --> v4:
> 1. Rebase this series on v7.2-rc1.
> 2. Add two cleanup patches (patch 02/03).
> 3. Simplify patch 03 to avoid checking whether initial_boot_params is
>    NULL multiple times, suggested by Rob.
> 
> v2 --> v3:
> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
> 3. Add some prepare patches.
> 
> v1 --> v2:
> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>    feedback [1], v2 drop that property and exclude reserve memory
>    by default.
> 2. Split some prepared patches from the original patches.
> 3. Address coding-style comments on patch 5 from Rob.
> 
> [1] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
> [2] https://sashiko.dev/#/patchset/20260520091844.592753-1-chenwandun%40lixiang.com?part=4
> 
> 
> Wandun Chen (10):
>   kexec/crash: provide crash_exclude_mem_range() stub when
>     CONFIG_CRASH_DUMP=n
>   of: reserved_mem: dedup and relocate reserved-memory messages
>   of: reserved_mem: skip late scan when no regions are reserved
>   of: reserved_mem: split alloc_reserved_mem_array() from
>     fdt_scan_reserved_mem_late()
>   of: reserved_mem: add dumpable flag to opt-in vmcore
>   of: reserved_mem: save /memreserve/ entries into the reserved_mem
>     array
>   of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>   arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
>   riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
>   loongarch: kdump: exclude non-dumpable reserved memory regions from
>     vmcore
> 
>  arch/arm64/kernel/machine_kexec_file.c     |   6 ++
>  arch/loongarch/kernel/machine_kexec_file.c |   6 ++
>  arch/riscv/kernel/machine_kexec_file.c     |   4 +
>  drivers/of/fdt.c                           |  11 ++-
>  drivers/of/of_private.h                    |   3 +
>  drivers/of/of_reserved_mem.c               | 108 ++++++++++++++++++---
>  include/linux/crash_core.h                 |   6 ++
>  include/linux/of_reserved_mem.h            |  15 +++
>  kernel/dma/contiguous.c                    |   1 +
>  9 files changed, 142 insertions(+), 18 deletions(-)
> 


