Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9B3C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ihVrinw115rJrSYXwInOqAt0jxw5Rnkv8t8xQTnuTI=; b=bxL3qy6uz++qB6KWDAMF9M450q
	pRDByKuPhsb3bhg8DPyNwjqnip8VX1LUTiLl42/9tPoNc9awlO/34Qf9x78A87sE4Oc8gLeiIW+iq
	qmJQCCs4WEdLjUcEigkFbAcL6RMoGvLoFPEfvuB7tm5hG0Hdv5dtEGVm6n+S6ASxnEVS1dSRyJHVq
	/b3inMqYgZIPD6AetnrvIuv7oEi39+9gJah7vs0FU2phVzcdfsPbh3I0GpwlLvq/T+yRFCVpFngEp
	zKOyfxdiVtgx7+ueJF8GX7YX+Thv+5ucbMiCvfckMQQKKK1Id2IAuQuQRdkmhLAIoOEfX0VxgRXem
	td0gySdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9qi-00000001zli-3Lkq;
	Thu, 20 Feb 2025 16:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9oS-00000001z6F-28CD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:54:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5A0316F3;
	Thu, 20 Feb 2025 08:54:27 -0800 (PST)
Received: from [10.57.80.147] (unknown [10.57.80.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B7703F5A1;
	Thu, 20 Feb 2025 08:54:06 -0800 (PST)
Message-ID: <fc199d7c-ab09-4278-b641-962184bff14d@arm.com>
Date: Thu, 20 Feb 2025 17:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] arm64/mm: Avoid barriers for invalid or
 userspace mappings
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-8-ryan.roberts@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250217140809.1702789-8-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_085412_635180_D5D999C2 
X-CRM114-Status: GOOD (  24.26  )
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

On 17/02/2025 15:07, Ryan Roberts wrote:
> __set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are

Nit: it would be more accurate to say __set_pte() instead of
__set_pte_complete(), as it is the former that actually writes the PTE
(and then issues barriers).

> used to write entries into pgtables. And they issue barriers (currently
> dsb and isb) to ensure that the written values are observed by the table
> walker prior to any program-order-future memory access to the mapped
> location.
>
> Over the years some of these functions have received optimizations: In
> particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
> table modifications") made it so that the barriers were only emitted for
> valid-kernel mappings for set_pte() (now __set_pte_complete()). And
> commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
> in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
> barriers for valid mappings. set_p4d()/set_pgd() continue to emit the
> barriers unconditionally.
>
> This is all very confusing to the casual observer; surely the rules
> should be invariant to the level? Let's change this so that every level
> consistently emits the barriers only when setting valid, non-user
> entries (both table and leaf).
>
> It seems obvious that if it is ok to elide barriers all but valid kernel
> mappings at pte level, it must also be ok to do this for leaf entries at
> other levels: If setting an entry to invalid, a tlb maintenance
> operation must surely follow to synchronise the TLB and this contains
> the required barriers. If setting a valid user mapping, the previous
> mapping must have been invalid and there must have been a TLB
> maintenance operation (complete with barriers) to honour
> break-before-make. So the worst that can happen is we take an extra
> fault (which will imply the DSB + ISB) and conclude that there is
> nothing to do. These are the arguments for doing this optimization at
> pte level and they also apply to leaf mappings at other levels.
>
> For table entries, the same arguments hold: If unsetting a table entry,
> a TLB is required and this will emit the required barriers. If setting a

s/TLB/TLB maintenance/

> table entry, the previous value must have been invalid and the table
> walker must already be able to observe that. Additionally the contents
> of the pgtable being pointed to in the newly set entry must be visible
> before the entry is written and this is enforced via smp_wmb() (dmb) in
> the pgtable allocation functions and in __split_huge_pmd_locked(). But
> this last part could never have been enforced by the barriers in
> set_pXd() because they occur after updating the entry. So ultimately,
> the wost that can happen by eliding these barriers for user table

s/wost/worst/

- Kevin

> entries is an extra fault.
>
> [...]


