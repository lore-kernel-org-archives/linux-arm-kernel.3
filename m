Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A60C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvvVgG8sFYyCKKWqflx/P6eBZ3R2UIey0m6zvQUGr2I=; b=Tlhn+DB0x6w5spyNUhKq0uoeCW
	3GPIa++fP8ZvU+XVRQxJXz5LUa8vbg9LCuHxUmV2mTKh4r9uC1Y+XNqePBPhOdtHkI+DV1Z5Oc/wo
	90d9KXphB/AO97HtU4rk9mrjTmhGV3xKOSa1QutbMBgjdzblvL+xbEktaGNJajVJyteFHtZbkaQXZ
	Wct3k2g7HLQexwzofFGjtCBLBLOvRgYI1MLqYJNi9PHIAA+K+d8pR31xWVdajdFxgkc/tihcbdqhv
	BsLP5ta9P/kW4JSf79WnxdLe4XAAeQ7ML9WeWOaZc3eafd4IHECNtQr2PYyuMRYghcrCRZKsRmbss
	vaHc8/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERFg-00000009F6J-08YN;
	Mon, 12 May 2025 11:23:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQwZ-00000009CHZ-1nvj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:03:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F06D150C;
	Mon, 12 May 2025 04:03:22 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C87013F5A1;
	Mon, 12 May 2025 04:03:30 -0700 (PDT)
Message-ID: <0ca27453-7fa8-47df-ac11-8992319da578@arm.com>
Date: Mon, 12 May 2025 12:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <aCHUwZzeI6sEbg2T@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aCHUwZzeI6sEbg2T@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_040335_518634_34F10B46 
X-CRM114-Status: GOOD (  16.45  )
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

On 12/05/2025 12:00, Catalin Marinas wrote:
> On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
>> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
>> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
>> flags in order to defer barriers until exiting the mode. At the same
>> time, it added warnings to check that pte manipulations were never
>> performed in interrupt context, because the tracking implementation
>> could not deal with nesting.
>>
>> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
>> do manipulate ptes in softirq context, which triggered the warnings.
>>
>> So let's take the simplest and safest route and disable the batching
>> optimization in interrupt contexts. This makes these users no worse off
>> than prior to the optimization. Additionally the known offenders are
>> debug features that only manipulate a single PTE, so there is no
>> performance gain anyway.
>>
>> There may be some obscure case of encrypted/decrypted DMA with the
>> dma_free_coherent called from an interrupt context, but again, this is
>> no worse off than prior to the commit.
>>
>> Some options for supporting nesting were considered, but there is a
>> difficult to solve problem if any code manipulates ptes within interrupt
>> context but *outside of* a lazy mmu region. If this case exists, the
>> code would expect the updates to be immediate, but because the task
>> context may have already been in lazy mmu mode, the updates would be
>> deferred, which could cause incorrect behaviour. This problem is avoided
>> by always ensuring updates within interrupt context are immediate.
>>
>> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
>> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> As per the request in the original report, please also add:
> 
> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com

I've already added it, 2 lines above your comment...

> 
> I'll give it a try as well with my configurations and let you know if
> there are any problems. In the meantime:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!


