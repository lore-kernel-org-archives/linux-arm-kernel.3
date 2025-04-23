Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A0C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAHGe4zE8gnERUqvBrhdXOuLfdZN+3XixHIZALCJ1W8=; b=S+r4T2aCQ0+Na3okJIb5GXpRyh
	vUj+VFZmCtYNdAT97IenW7w3CmqfLA6R5rsI8xIMQg7jjLMQHVmclp8AKak51K+tZDeSANpglAVB9
	9by1+ZNemSmGqRjOkKF9e4f5LbIZ9QYrDPY7yUwOYxwaVeX9O+ym6b076ZXLn5BjWY1vkoOROaEUt
	54SX0ngfkxotx9r0kuChY+1tUMhFSFU8bEFIFEYv46Pwhw+QLAANJmTwfdXCrED77XBdv0Crg61oU
	Hj/VwddA5knAv00DpkvBPabH+hdpEPlrYS05LZCE4NX+Vk11fnipL6I+dAdt+YiRSk9wosWOyF0jS
	a7SuLZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqP-0000000BlK5-1NvV;
	Wed, 23 Apr 2025 19:33:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7feD-0000000Biws-3JQs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745436040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAHGe4zE8gnERUqvBrhdXOuLfdZN+3XixHIZALCJ1W8=;
	b=QPYebWlAtm6+KVjC3n2TWIxmwyLmsGR8idAEW68T948bfACRLrSDKvTbajVbvP7fwS/LA9
	pcUKGFheM3YfIGAyhMoXzN3RoWnnDgci9hD7+Gm64zBvpYH/IuyKl4TC3xQOWU/t4VVt+P
	arOEtzm6GwRVRUXXK2QN8SizGhN+DH8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-N12uJUYLMc2nZOPRuvE2Dg-1; Wed, 23 Apr 2025 15:19:07 -0400
X-MC-Unique: N12uJUYLMc2nZOPRuvE2Dg-1
X-Mimecast-MFC-AGG-ID: N12uJUYLMc2nZOPRuvE2Dg_1745435946
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47682f9e7b9so2944131cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435946; x=1746040746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHGe4zE8gnERUqvBrhdXOuLfdZN+3XixHIZALCJ1W8=;
        b=lGNoE0lnx4JWViNNZOMjwF1JPb01fRnqVBJsLng8q5REAy1AtZTVwpZLlFw7FmxZyi
         G2KFxjvsVloN8qAlYl8RXEbF+o32JqxGmWpFQ3sdValpID/VV5Lw+BjO0VqoDMRr1yz1
         7BCANfoSD3oOX+4bixHmqyLDANr3oFOIM7LYIckQZ44c+2uYyzgJV6YRI7xGorjmi9Q+
         ZE+XnKjB8Zy+9Nk/qKbVpT1ZEhI1128Zhdx/kG7Xj9S+INoBs9AQoEm/vV4x4Y3DGaQH
         BVCaAq5Ifno5F6xqcZR0H+Pz56MlQYCm69odqG04ko6qLfS36vdZV8GI3Xbqt+0UVAq7
         aBDg==
X-Gm-Message-State: AOJu0Yz2HtFuKWkzsN91Kl98eKenLooJa6ctiPBJI/6xyD5Ck/+p915Q
	U+6EV1b1zk6aRAKG0Qu35rQ58At9LimmA6fogkJciRK9E0rP7kO7KXTAOkBq/QpFIEwbmzL4HRp
	G+yoSOq3h/d34UnEgQ16T6e1rjQ0gMDZLoEbbzIelIUNFv2XFZa9dVMat6D/FoixQChvQvsKC
X-Gm-Gg: ASbGncvAl9vfQdlm2GxXdizbJKu3VEthp4kCKvQAXfCIwiuccJ9scPW1QvVYC4ptFMZ
	SL4ld2rG3hTW7fjSh/yC8g36KLrViVxeY3e2Yvh9UAFAKlnfXQxy+suymNOKrLxuymqDJgZary/
	wEhKrZIWC66EKCV17cBouNi2B6hn/i68nEfz6pcPc1s4scNkJAJKBxiKQ96p48EMTZ6ztELJQZ8
	tvpSWiaCSb+3uUxyx8LUgWWa71w83SM+HaXfosFeMbHeyulRMsQtGwPX/E6vPWJjFNpZ9B8nfsu
	PPitsqz1U403JA==
X-Received: by 2002:a05:622a:1802:b0:476:7ff5:cc27 with SMTP id d75a77b69052e-47aec4dcc0dmr256540531cf.51.1745435946234;
        Wed, 23 Apr 2025 12:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYZnsrqVQFMmxCCRWBHo6cgTz6A3ekouceyIUYb+WLWz7C/tNEfgqMMuRkHi33l8+eZSJ1kA==
X-Received: by 2002:a05:622a:1802:b0:476:7ff5:cc27 with SMTP id d75a77b69052e-47aec4dcc0dmr256539801cf.51.1745435945812;
        Wed, 23 Apr 2025 12:19:05 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.200.211])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9a8dsm71719371cf.70.2025.04.23.12.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 12:19:05 -0700 (PDT)
Message-ID: <4d18462f-8bc6-459e-9eeb-09e63559d854@redhat.com>
Date: Wed, 23 Apr 2025 15:18:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xRjgTeolR3zAf5kyZKDMKFh8Cx8bNBPZWbzwtEN4PKM_1745435946
X-Mimecast-Originator: redhat.com
Content-Language: en-US, en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_122041_902487_DCD83C86 
X-CRM114-Status: GOOD (  33.23  )
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

On 2025-04-22 04:18, Ryan Roberts wrote:
> Hi All,
> 
> This is v4 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. All patches are now acked/reviewed by relevant maintainers so I
> believe this should be good-to-go.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
> test was repeated 10 times.
> 
> legend:
>    - p: nr_pages (pages to allocate)
>    - h: use_huge (vmalloc() vs vmalloc_huge())
>    - (I): statistically significant improvement (95% CI does not overlap)
>    - (R): statistically significant regression (95% CI does not overlap)
>    - measurements are times; smaller is better
> 
> +--------------------------------------------------+-------------+-------------+
> | Benchmark                                        |             |             |
> |   Result Class                                   |    Apple M2 | Ampere Alta |
> +==================================================+=============+=============+
> | micromm/vmalloc                                  |             |             |
> |   fix_align_alloc_test: p:1, h:0 (usec)          | (I) -11.53% |      -2.57% |
> |   fix_size_alloc_test: p:1, h:0 (usec)           |       2.14% |       1.79% |
> |   fix_size_alloc_test: p:4, h:0 (usec)           |  (I) -9.93% |  (I) -4.80% |
> |   fix_size_alloc_test: p:16, h:0 (usec)          | (I) -25.07% | (I) -14.24% |
> |   fix_size_alloc_test: p:16, h:1 (usec)          | (I) -14.07% |   (R) 7.93% |
> |   fix_size_alloc_test: p:64, h:0 (usec)          | (I) -29.43% | (I) -19.30% |
> |   fix_size_alloc_test: p:64, h:1 (usec)          | (I) -16.39% |   (R) 6.71% |
> |   fix_size_alloc_test: p:256, h:0 (usec)         | (I) -31.46% | (I) -20.60% |
> |   fix_size_alloc_test: p:256, h:1 (usec)         | (I) -16.58% |   (R) 6.70% |
> |   fix_size_alloc_test: p:512, h:0 (usec)         | (I) -31.96% | (I) -20.04% |
> |   fix_size_alloc_test: p:512, h:1 (usec)         |       2.30% |       0.71% |
> |   full_fit_alloc_test: p:1, h:0 (usec)           |      -2.94% |       1.77% |
> |   kvfree_rcu_1_arg_vmalloc_test: p:1, h:0 (usec) |      -7.75% |       1.71% |
> |   kvfree_rcu_2_arg_vmalloc_test: p:1, h:0 (usec) |      -9.07% |   (R) 2.34% |
> |   long_busy_list_alloc_test: p:1, h:0 (usec)     | (I) -29.18% | (I) -17.91% |
> |   pcpu_alloc_test: p:1, h:0 (usec)               |     -14.71% |      -3.14% |
> |   random_size_align_alloc_test: p:1, h:0 (usec)  | (I) -11.08% |  (I) -4.62% |
> |   random_size_alloc_test: p:1, h:0 (usec)        | (I) -30.25% | (I) -17.95% |
> |   vm_map_ram_test: p:1, h:0 (usec)               |       5.06% |   (R) 6.63% |
> +--------------------------------------------------+-------------+-------------+
> 
> So there are some nice improvements but also some regressions to explain:
> 
> fix_size_alloc_test with h:1 and p:16,64,256 regress by ~6% on Altra. The
> regression is actually introduced by enabling contpte-mapped 64K blocks in these
> tests, and that regression is reduced (from about 8% if memory serves) by doing
> the barrier batching. I don't have a definite conclusion on the root cause, but
> I've ruled out the differences in the mapping paths in vmalloc. I strongly
> believe this is likely due to the difference in the allocation path; 64K blocks
> are not cached per-cpu so we have to go all the way to the buddy. I'm not sure
> why this doesn't show up on M2 though. Regardless, I'm going to assert that it's
> better to choose 16x reduction in TLB pressure vs 6% on the vmalloc allocation
> call duration.

I ran a couple of basic functional tests for HugeTLB for 1G, 2M, 32M and 64k
pages on an Ampere Mt. Jade and a Jetson AGX Orin systems and didn't
get any issues, so:

Tested-by: Luiz Capitulino <luizcap@redhat.com>

> 
> Changes since v3 [3]
> ====================
> - Applied R-bs (thanks all!)
> - Renamed set_ptes_anysz() -> __set_ptes_anysz() (Catalin)
> - Renamed ptep_get_and_clear_anysz() -> __ptep_get_and_clear_anysz() (Catalin)
> - Only set TIF_LAZY_MMU_PENDING if not already set to avoid atomic ops (Catalin)
> - Fix commet typos (Anshuman)
> - Fix build warnings when PMD is folded (buildbot)
> - Reverse xmas tree for variables in __page_table_check_p[mu]ds_set() (Pasha)
> 
> Changes since v2 [2]
> ====================
> - Removed the new arch_update_kernel_mappings_[begin|end]() API
> - Switches to arch_[enter|leave]_lazy_mmu_mode() instead for barrier batching
> - Removed clean up to avoid barriers for invalid or user mappings
> 
> Changes since v1 [1]
> ====================
> - Split out the fixes into their own series
> - Added Rbs from Anshuman - Thanks!
> - Added patch to clean up the methods by which huge_pte size is determined
> - Added "#ifndef __PAGETABLE_PMD_FOLDED" around PUD_SIZE in
>    flush_hugetlb_tlb_range()
> - Renamed ___set_ptes() -> set_ptes_anysz()
> - Renamed ___ptep_get_and_clear() -> ptep_get_and_clear_anysz()
> - Fixed typos in commit logs
> - Refactored pXd_valid_not_user() for better reuse
> - Removed TIF_KMAP_UPDATE_PENDING after concluding that single flag is sufficent
> - Concluded the extra isb() in __switch_to() is not required
> - Only call arch_update_kernel_mappings_[begin|end]() for kernel mappings
> 
> Applies on top of v6.15-rc3. All mm selftests run and no regressions observed.
> 
> [1] https://lore.kernel.org/all/20250205151003.88959-1-ryan.roberts@arm.com/
> [2] https://lore.kernel.org/all/20250217140809.1702789-1-ryan.roberts@arm.com/
> [3] https://lore.kernel.org/all/20250304150444.3788920-1-ryan.roberts@arm.com/
> 
> Thanks,
> Ryan
> 
> Ryan Roberts (11):
>    arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
>    arm64: hugetlb: Refine tlb maintenance scope
>    mm/page_table_check: Batch-check pmds/puds just like ptes
>    arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
>    arm64: hugetlb: Use __set_ptes_anysz() and
>      __ptep_get_and_clear_anysz()
>    arm64/mm: Hoist barriers out of set_ptes_anysz() loop
>    mm/vmalloc: Warn on improper use of vunmap_range()
>    mm/vmalloc: Gracefully unmap huge ptes
>    arm64/mm: Support huge pte-mapped pages in vmap
>    mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
>    arm64/mm: Batch barriers when updating kernel mappings
> 
>   arch/arm64/include/asm/hugetlb.h     |  29 ++--
>   arch/arm64/include/asm/pgtable.h     | 209 +++++++++++++++++++--------
>   arch/arm64/include/asm/thread_info.h |   2 +
>   arch/arm64/include/asm/vmalloc.h     |  45 ++++++
>   arch/arm64/kernel/process.c          |   9 +-
>   arch/arm64/mm/hugetlbpage.c          |  73 ++++------
>   include/linux/page_table_check.h     |  30 ++--
>   include/linux/vmalloc.h              |   8 +
>   mm/page_table_check.c                |  34 +++--
>   mm/vmalloc.c                         |  40 ++++-
>   10 files changed, 329 insertions(+), 150 deletions(-)
> 
> --
> 2.43.0
> 
> 


