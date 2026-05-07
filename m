Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E6CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=; b=RwPd6ePHP0CD8ob7IJBxkIjjiG
	rrXED20QKUZySNev238cIBt2yXIVOOOc4Uvs59ijFkxpB7ioTylMXmh0hYyCuySKfygbA2aYGMh37
	BOwipb7HFpPa3KAWV4KjGABEyPdZ26ukWiGtcPVbTgLOOJ6WPyvkM7grD1uoOjCczXIV7cwwIyfeS
	fwXXdZeIDf0rE+Ath2IyrmX0+jek3WKgXACcMOAKofeqJnanF+cCawWnB+iWvtbFkV2GnvsNqSMVp
	eSC2RlHzwkxBo6MOrknCembbXHIO3sbf/GxJ2Slqh4LRdv5ghlma/REAzAt9ESNa+LJm9nBz7Ud9e
	23e1DgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuIW-00000003Cww-22gX;
	Thu, 07 May 2026 08:41:32 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuIT-00000003Cux-1tAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:41:30 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c796163fac5so385535a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143287; x=1778748087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=ej2U1T871X7xAnfuXp3jCB/0CtLmoAPt0yLVPD98LEq+DyvGiml1Vr9qEMyBEWghsf
         CgbFbdL35C7Dachi4grlvMV3zBKQBfJgjZyO1cKag5QSdh94sY+x5dXDCyKRnXW7b1ze
         BtLcHc6Wy3KrB33IEesAiLOPtbQHS2kZnyrj4FfNmVtx55pxV2Q6xpCcz5kERDShuG1H
         PifSX6mfC9vH4q/MKMngJYt6DxQRahAqOy8euFbhzyFWHbAZYmbzFNXeVCV1zmmNPadN
         m7EJfiWjf2oAd9CysBVr+g67HEhwv8J+6Z/xf07zsTOllNS86IutCXc4sw5otl9Sr957
         rkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143287; x=1778748087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=PVP/PnFfGt0jPhIICz2KIc8KDFxs3UfZQyP9ozbzg7qqVooIWduw7NOL5H3cS6E5HK
         rZIcBZbix7jPG04/Et/oiIcq4KUndPwWfbMrqn5e/WvBzhAU8RYOJiQPkOuUpuW5EvWx
         YYBGDlXDQn/Gw77OgAhnw0U11ABg2rDC8GWT8hEJ1HBPqLArmhIcUYdnS0NnF3EoRaXF
         xpF3+IU2607E4a0SbMq9Z25FHv0fAR/2X1PVtcJMduECU6NSlAhh7FCOno+B8k9bidsb
         egWT85PNj0u+OCxLVBVmzJKfQlQs0X7GzHxx9Ze/w6H+xD+XZDtgPj2Lfc7fm19vTgwg
         Gl5Q==
X-Forwarded-Encrypted: i=1; AFNElJ82cc/LUGEwZsiiGo1jCxaInu0XJeWeZMwDtPFRNLUN5AhoEYJFvEEdY1OzWxyZdTOm139BKPRL9ZoV44jyXFHF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn8VKM+fcEmE94M8Ld0KXtwJC+71GUkUzD93/leTUiYTHSbjwu
	J50FWTokAqhZoJ2MufU1emtYxVUrfmBMtMTt30rLAQNcECnSRCF7nZXK
X-Gm-Gg: AeBDieuSrRZlIe49iw6OwjX7BHFOjnuJoJ+sFqs+C7JONSEonK0AjZoggPvAMLSb3Wr
	dOuByWC09wk07foa27toEoMuLCF289JPisKDbeMlrD8M/c5jZOT1bQ6G4Q8xOMV51yNcp2pllQh
	cuCG/iuf+XpIYef5HGVoxy0MKvAmtYRx98AIq8+PxDowXv1jr6+39FFYq6gddqGdQOV9dDAJm55
	M90AmDgK7KYgDxi/ii1ob8ep0iOD2a+MgiaaVWKUIGxyiC/HfK3tpY5sR7Jjaa+EWTWPk87K/+g
	kxZ2oW7fTcWPz5wh3U6y6ivYxm9y7p5qNqkXgmMu1TUY1CqHPcOBehPpx8jj+bz6H9wBKOkBsBx
	tckt6da0tYCPV35XIvnhm1WVl2X0n1xILdJYAiO1tvIJQi3WRKqLxeS+e7PYIQF0liei+klTlGs
	xIi5bDpcNPXWE3w0HCdhTumU9VIO1OyJQrZKNheyx4zg==
X-Received: by 2002:a05:6a20:a106:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3aa5ab6853cmr7732684637.36.1778143287552;
        Thu, 07 May 2026 01:41:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253586c6asm1305583a12.4.2026.05.07.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:41:26 -0700 (PDT)
Message-ID: <126f4fd0-0a1c-41e0-8746-fa7ab85d6773@gmail.com>
Date: Thu, 7 May 2026 16:41:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
 <20260506014752.GA280279-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506014752.GA280279-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014129_492136_8A70092C 
X-CRM114-Status: GOOD (  15.63  )
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


在 2026/5/6 09:47, Rob Herring 写道:
> On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
>> When a reserved-memory node contains multiple reg entries (e.g.,
>> reg = <base1 size1>, <base2 size2>), the count used for
>> total_reserved_mem_cnt is wrong in two places:
>>
>> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>>     many regions it reserved in memblock. The caller in
>>     fdt_scan_reserved_mem() then increments count by just 1.
> Just to make sure, more than 1 worked before the referenced commits? It
> would be easier to just define we only expect/support 1 entry.
Looking at the pre-8a6e02d0c00e code, __reserved_mem_reserve_reg()
reserved memblock memory for all reg entries, but only called
fdt_reserved_mem_save_node() for the first one (guarded by an 'if 
(first)' flag).

So multiple reg entries were never fully supported: subsequent entries
got their memory reserved in memblock, but their metadata was lost
and driver-specific init callbacks were never invoked for them.

The referenced commits made this worse by also breaking the count
tracking, but the root limitation predates them.

I support documenting "only 1 entry supported" based on the
following reasons:

   - of_reserved_mem_lookup() does a name-based linear scan and returns
     the *first* matching entry. A node with N reg entries would create
     N entries with identical names; entries [1..N-1] are permanently
     unreachable via lookup.

   - Drivers like CMA and DMA coherent are designed to initialize a
     single contiguous pool per node_init call. Calling node_init
     multiple times with the same FDT node is not a supported usage.


>
>> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>>     only reads the first reg entry. Subsequent entries are never
>>     initialized via fdt_init_reserved_mem_node(), so their metadata is
>>     lost.
>>
>> Fix both issues:
>>   - Make __reserved_mem_reserve_reg() return the actual number of
>>     regions successfully reserved. Update the caller to accumulate
>>     the returned count.
>>   - Rewrite fdt_scan_reserved_mem_late() to use
>>     of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>>     initializing each one via fdt_init_reserved_mem_node().
>>
>> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")

