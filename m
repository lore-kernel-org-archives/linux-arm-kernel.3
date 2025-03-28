Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022CFC36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUnPgsuz8T+vePvFGDWjwwoff9wHljDhHBQ659Low9s=; b=ovZWJnBS5b2axyLF7P+fqvFtDO
	tqwVRjKtngil+RlZcn7nMwBLVPCRe98UXu+AsGvonrR4Exwhks2ZZU1EjzTIZINecsa7DsZzonB6Y
	39YW4kwIwc6uo7LghuV0E/tsIngGSO7M270Z70O7lmQDCESPW1QffgmmhU6vNIQQEdsgs+84c9MwF
	8hASG9eZpfrxO0usbclOmndQJTZOYgbnRA2CZm96igE4dCGDfUuHPqkXDJNeZteHFhSUdSXwPsj9a
	cqMowDo7rhZjZ3zMim8zpRjmJkWvyWcke/yrbcYSEWhS5yPVkms0qZ4+cGGkaVKZgtu9630igX7xo
	OQhu7qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Xb-0000000DOiz-2nHW;
	Fri, 28 Mar 2025 13:14:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9T8-0000000DO1K-1R9S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:09:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6411007;
	Fri, 28 Mar 2025 06:09:58 -0700 (PDT)
Received: from [10.57.87.112] (unknown [10.57.87.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45A2B3F63F;
	Fri, 28 Mar 2025 06:09:51 -0700 (PDT)
Message-ID: <dfc06a39-3d92-4995-ab06-c552e351f7c8@arm.com>
Date: Fri, 28 Mar 2025 13:09:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Content-Language: en-GB
To: Zi Yan <ziy@nvidia.com>, Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org>
 <731D8D6E-52A0-4144-A2BB-7243BFACC92D@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <731D8D6E-52A0-4144-A2BB-7243BFACC92D@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_060954_426848_D2FA8817 
X-CRM114-Status: GOOD (  17.49  )
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

On 27/03/2025 20:07, Zi Yan wrote:
> On 27 Mar 2025, at 12:44, Matthew Wilcox wrote:
> 
>> On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
>>> So let's special-case the read(ahead) logic for executable mappings. The
>>> trade-off is performance improvement (due to more efficient storage of
>>> the translations in iTLB) vs potential read amplification (due to
>>> reading too much data around the fault which won't be used), and the
>>> latter is independent of base page size. I've chosen 64K folio size for
>>> arm64 which benefits both the 4K and 16K base page size configs and
>>> shouldn't lead to any read amplification in practice since the old
>>> read-around path was (usually) reading blocks of 128K. I don't
>>> anticipate any write amplification because text is always RO.
>>
>> Is there not also the potential for wasted memory due to ELF alignment?
>> Kalesh talked about it in the MM BOF at the same time that Ted and I
>> were discussing it in the FS BOF.  Some coordination required (like
>> maybe Kalesh could have mentioned it to me rathere than assuming I'd be
>> there?)
>>
>>> +#define arch_exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
>>
>> I don't think the "arch" really adds much value here.
>>
>> #define exec_folio_order()	get_order(SZ_64K)
> 
> How about AMD’s PTE coalescing, which does PTE compression at
> 16KB or 32KB level? It covers 4 16KB and 2 32KB, at least it will
> not hurt AMD PTE coalescing. Starting with 64KB across all arch
> might be simpler to see the performance impact. Just a comment,
> no objection. :)

exec_folio_order() is defined per-architecture and SZ_64K is the arm64 preferred
size. At the moment x86 is not opted in, but they could choose to opt in with
32K (or whatever else makese sense) if the HW supports coalescing.

I'm not sure if you thought this was global and are arguing against that, or if
you are arguing for it to be global because it will more easily show us
performance regressions earlier if x86 is doing this too?

> 
> Best Regards,
> Yan, Zi


