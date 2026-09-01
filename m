Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE6FC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OKnHhRZ8go2dIM+TUC5S1DKTqLCGIFKzpmJtqNqNtM=; b=bDk++WUrrtp76mVYLvxdBNEl2K
	q+EfzEgtVpRVkonK04atIsiweHZ9Iw+tQcClBsjrJvt/TdI3d6pDI2ZVNEgqwTXXzJHj4Gbag0eTV
	XjjfSDp0C9yvqatn1wQQxdZAmXB9iVJFVUEx4WTsfyor8yYpSUv12UlCKP88/12XupO+VOlVMIBqd
	mh857s4IfmcGdQbstG+ajdMIt+GoQ+5GJKzMPL5AuZCa0dRQGXq8L9576VHve3F8psaiwEf8wz2WZ
	Rngg/lZnRWFpT/qXW/gjvtXGnYCwvsGopih1R6ajxvxrM70nUVa4unQKmj6yYlcyo7l4MFX7qggmf
	1BWjO3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXL-0000000BNxX-29OI;
	Tue, 01 Sep 2026 09:12:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXJ-0000000BNwo-2ifK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:12:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF4111692;
	Tue,  1 Sep 2026 02:12:01 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD163F882;
	Tue,  1 Sep 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253925; bh=OAJbyZz/ESiAWbgy8vL8egurZestop0OBiXg4a+hnq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sna3chVxatS6pqs5ij7OptLhR6Ki6mUqMl/tI+T7D8Px6fVtfcxa972Gcgu6EoxAR
	 kZwIBI7C/5PG5YnCPjO6Irpg2k0Uu1/FHapdxRi8tOfgmghmF0i4+A71ve4r7GYpTz
	 nxTpxxV+jCrtDwos/heb5hqZ2sPpNFVtjvxflqH8=
Message-ID: <2b56b3fa-872b-4600-a351-cb48e06b4657@arm.com>
Date: Tue, 1 Sep 2026 11:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/4] arm64: mm: Map fixmap PTE tables r/o in the
 linear map
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-7-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-7-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_021209_820072_7AC637E5 
X-CRM114-Status: GOOD (  20.25  )
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

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Without physical KASLR, the fixmap page tables will appear at an a
> priori known offset in the physical address space, and due to the lack
> of randomization, the linear map carries a writeable alias of the fixmap
> PTE pages, which appears at an offset in the kernel VA space that is
> also predictable.
>
> Given that the placement of the fixmap area is never randomized either,
> a single store to this linear alias region is sufficient to map any
> physical page with any permissions at a known offset in the kernel VA
> space, including on top of the PTI trampoline.
>
> Avoid this, by remapping the fixmap PTE pages read-only in the linear
> map. This is possible because all updates to bm_pte[] occur via the
> mapping of the kernel image in the vmap area. A read-only mapping is
> still needed for things like ptdump that walk the page tables.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fixmap.h | 3 +++
>  arch/arm64/mm/fixmap.c          | 8 +++++---
>  arch/arm64/mm/mmu.c             | 8 ++++++++
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 170c3502d723..9191125738e9 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -112,6 +112,9 @@ enum fixed_addresses {
>  
>  void __init early_fixmap_init(void);
>  
> +extern pte_t fixmap_bm_pte[][PTRS_PER_PTE];

Instead of fixmap_bm_pte_size, why not use the same inner size as the
definition, and then simply use sizeof() where required (or make a macro
out of it)? Both the inner and outer sizes have to match the definition
so there's no risk of things going out of sync I think?

- Kevin

> +extern const size_t fixmap_bm_pte_size;
> [...]

