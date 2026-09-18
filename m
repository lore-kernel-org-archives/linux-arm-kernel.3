Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C696DC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=; b=1PJJLGcuMDBTCCnaQc+duyqpBT
	FH6pPYiTUi/Yi5M1GcGkMTLxID1L6CWTneMSevVxn499AoD0Iz2ldbKzUQ+gNGJiOfj3txCS0L/4c
	Uu/x+tb6M8q8GwEgHCjB2DTVVKk+KPpMzVYappvfIQkazsgmNgJx1CutHL5+TiY+M5voEKNo99uxI
	Z5fN2END7O/tNPNM28oOeknj7mpLkt67VZwcKj8xUvR0qvSvJ4/HLicynMQo+N+ZVd484rz6EpWPp
	r8ZjITOH+BrKs+1yQ7qqm/Kjvn15kxVmOIRtYmlIAKH/oci5RNDRj0/aZYxCp7RlI85ikFWwBQNDL
	bB8PIGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TrZ-0000000DnPQ-1San;
	Fri, 18 Sep 2026 08:22:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TrX-0000000DnOK-1eCP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=; b=EMjBtqLsa5vz8Qv/Akvy1F+qEy
	Feq/o5Xf3f/CZrMXFp3dPeiA5Kr0dy64LOawZD3uYjeCVqKFJwydwEELFTAaoGQ+IrBk9Lrh5Y+Ic
	R4MD5mOE3acLtlsCZVxbM/bYbA76rPkRAe82RXGUTgMgLzcFgc3N/vze8uQCeMlkIb1cjJ57TkIL4
	MLUNJzehSdtTMRTqinlN07213qsnQnDMd4//eNJIDRVXKg/5GvObJx9FnSaQmSHWu3NcWBuluJFyk
	x6Ny27BhhAd1RGRrW233AyXK9nfD1pYUqvn+gFO6ewkRsos838lpHD6cmhFej2XyM71G7DNcRIHT0
	2AhBprDg==;
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7TrU-00000009mY1-1Ugj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:22:26 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d6fbdc8772so2518815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719742; x=1790324542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=d9X7dCgp/1FgRlrz76jBkf7xRHIUUF7dTBVvfhKKJSRwIO3HU4Lo+FoLT0C7K+U8zj
         Y/GEt+alM6pXsL5UmmFqZGiv/8FoXgx5ZLck9Kxs9KsaW3T+fQewjFEtQot8FM+0zm2L
         uvNncanWuVTB/sjvfWis3riFp+U3h1BQ2di3gvJjlY+vl8SPMmKgEycn0ilgU+xeVLvn
         fdIYEpHdu8As3zI2uTNuLbXhAO7eWG7SISOH97bL6WTQ4AQ5iULP4ghXrsDS5Ncq0g/n
         LoSO7q0g1/QbrBo4mbKWerw1qJh/BQQwQkDrrzdG3sdGx7Gbo6/SCnahcO2w6ff5xrCK
         okGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719742; x=1790324542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=i5uAAdChCQmVffFIjC+a+EQc5kOnVwMcvaf1LZWEXdirTtt+7oLKMsS/DeN60+U4UC
         X0hFfz6hl6LQ2QKQJ9b6sZg9DmYUdqZRwV31GerR/CKmsVZEAbIgpCm3SPTmdAhwHWVh
         GxtuR/NurDV6GnPvDzkFPcKfJ1mCxuPZ2yFCWNQQ2ZXgyRArAC08yn0pvxZAV3TVz8YL
         cCWdxC3QLljczSm4qql470Z4NDvkpTPQPqErLrUXnI1vYclB+WGmXlxpAuaTUeJZISCc
         CQSoA8LmCsX3E2HzAKl3XvAYv+RMST7s2Wer+GCRgiNchvY8LSyFw7sf4HPPswvptt9H
         lVyA==
X-Forwarded-Encrypted: i=1; AKwUvBwSM6ZYjzSf3KlXxaXR24Zc8Wco/17sd4/jcBJjd9Wp9C0IKiNyDQ+cvDW1RDwTEytRN0rr5I5GDdkZixmfQg8u@lists.infradead.org
X-Gm-Message-State: AFuF++lQdrMim99uZk0Ii5O4cO7pwX8cQEGWQUdgp14sten5FmZrCDKp
	UC5KAlIvVMIk/wV41YH5C/CMbgEK9UQqwHL7kNyJm7t+UsXDozB7MhMX
X-Gm-Gg: AYBFou3cHEJgIN+YlXE8P94Zfv35LUfkjoJlkqNPnNucY+6qfuIJini1hkER5dFdJGG
	6HX3HXS+yZBUde8TFFfqTgQgZDM8cZpLJ1ORlucFxDyNSRcs5JCP2sNtxE+ZJRjuUnTF0xwEfad
	L7teY9qNfuOQXCYo4dIU90b+qLnfHHmwsjniXg9bclO0RN8mlNx+7FpVZCcXhK34zoGGU+gzSYE
	9/QvQLXPx/GKkDufQkjaCCeeytHfOMTIcl2Uq2Y1wRQfmkOiow03c+xKDyTLLfH3T4tPykEKRFY
	hW0W7+Tn+UnHa6fUHTgLTzfBvWGY6K/5chHZx8MwOaDXcrdf8IpGJQbAz7r9sJRzjmv0Qkk59YZ
	u7N/ugR083f8FJ7LxysaSVJGfCFzT30IrDddVE62RcbQjOthqgad5gt7JFCOETCj3JasZIzeXtd
	iI2lTGi75dz4C5l8e3FpYGKeDyoAO8Fn8M+e59cNmtkD0gYTQGhLB+SKnbREPnf/5CY9HQQsMHO
	HU6cw==
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr3426122b3a.35.1789719741686;
        Fri, 18 Sep 2026 01:22:21 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e79f1sm541488a12.30.2026.09.18.01.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:22:20 -0700 (PDT)
Message-ID: <bc6cf467-84d1-40a0-b570-1b5256a6e2e2@gmail.com>
Date: Fri, 18 Sep 2026 16:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzxavL91icLw-Xv@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092224_559004_7CF15F09 
X-CRM114-Status: GOOD (  20.37  )
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



On 9/18/26 16:08, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Add MEMBLOCK_NODUMP to mark regions that should be excluded from
>> kdump vmcores.
>>
>> The flag is meant for reserved memory that carries no data useful for
>> crash analysis. Reusable reserved regions such as CMA may hold useful
>> data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
>> patches wire this up for /reserved-memory and /memreserve/ entries.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> ---
>>  include/linux/memblock.h |  9 +++++++++
>>  mm/memblock.c            | 16 ++++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index d62db9e776cf..b2fcf11fba2b 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
>>   * kernel that we know is good to use. It is the only memory that
>>   * allocations may happen from in this phase.
>>   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
>> + * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
>> + * for crash analysis (e.g. firmware carveouts).
>>   */
>>  enum memblock_flags {
>>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>> @@ -63,6 +65,7 @@ enum memblock_flags {
>>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>>  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
>> +	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
>>  };
>>  
>>  /**
>> @@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
>>  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
>>  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
>>  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
>> +int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
>>  
>>  void memblock_free(void *ptr, size_t size);
>>  void reset_all_zones_managed_pages(void);
>> @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
>>  	return m->flags & MEMBLOCK_KHO_SCRATCH;
>>  }
>>  
>> +static inline bool memblock_is_nodump(struct memblock_region *m)
>> +{
>> +	return m->flags & MEMBLOCK_NODUMP;
>> +}
>> +
>>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>>  			    unsigned long  *end_pfn);
>>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index f2952d725c10..2e87f39826dd 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  				    MEMBLOCK_KHO_SCRATCH);
>>  }
>>  
>> +/**
>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Mark the region as not to be included in crash dumps.
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>       ~~~~~~~~~~~~~~^
> Is it impossible to use at runtime even thought it claims to be generic?
It is currently only used during initialization, so I added __init_memblock.

If other modules need to use this function in the future, this annotation can
be removed.

Best regards,
Wandun>
> 
>> +{
>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> +				    MEMBLOCK_NODUMP);
>> +}
>> +
>>  static bool should_skip_region(struct memblock_type *type,
>>  			       struct memblock_region *m,
>>  			       int nid, int flags)
>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>  };
>>  
>>  static int memblock_debug_show(struct seq_file *m, void *private)
>> -- 
>> 2.43.0
>>


