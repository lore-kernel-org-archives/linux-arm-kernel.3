Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E871CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTc3iABbp8/x3cMApSkIXOySoaYZfZ4kjPplyV1NtwQ=; b=Isw3LPLEEVtHSs2Xr+cRKE7INf
	mVY67bVNkR+v+hb9MobPgvKOKQM0gNcngMWwJ4JwlAcTVeEMwCi3F80Ax2guEG1qVKO9NYK1KLFxv
	qTngJe2UuACEtQJS5XAStqHEcNdxPf5fKl2NDW6/mMTXDpAliHAxowmHSH7uZnkir9Xt42cYcDDsI
	QEcKEVrePioD3aG/wbynWcWh1IM1M79u0pZZ0jqptKRW4XmIwX7WkFQDTnG6e9WzwXr3+vfzpKQ64
	ZTp6dkrQnyh4wi7l9OeIfquT05r3XAgUdR3dnAIw9PgPV6cT/6gH7iafufNSUHq4NbJrLVBSpyAPs
	vu/k10Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGrf-0000000Brpr-2NqX;
	Tue, 04 Nov 2025 13:14:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGrd-0000000Bros-1avl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:14:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11CDA1CE0;
	Tue,  4 Nov 2025 05:14:10 -0800 (PST)
Received: from [10.1.31.224] (XHFQ2J9959.cambridge.arm.com [10.1.31.224])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC0DE3F66E;
	Tue,  4 Nov 2025 05:14:16 -0800 (PST)
Message-ID: <b5b978f3-bb29-4cbc-b006-fb9c4402b067@arm.com>
Date: Tue, 4 Nov 2025 13:14:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kprobes: check the return value of
 set_memory_rox()
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251103194505.4077265-1-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251103194505.4077265-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_051421_469268_5A09B679 
X-CRM114-Status: GOOD (  24.11  )
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

On 03/11/2025 19:45, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), __change_memory_common has more chance to fail due to
> memory allocation fialure when splitting page table. So check the return
> value of set_memory_rox(), then bail out if it fails otherwise we may have
> RW memory mapping for kprobes insn page.
> 
> Fixes: 195a1b7d8388 ("arm64: kprobes: call set_memory_rox() for kprobe page")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>

This patch looks correct so:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

but, I think I see an separate issue below...

> ---
> I actually epxected 195a1b7d8388 ("arm64: kprobes: call set_memory_rox()
> for kprobe page") can be merged in 6.17-rcX, so I just restored it to
> before commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in
> alloc_insn_page"), however it turned out to be merged in 6.18-rc1 and it
> is after commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"). So I made the fix tag point to it.
> And I don't think we need to backport this patch to pre-6.18.
> 
>  arch/arm64/kernel/probes/kprobes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 8ab6104a4883..43a0361a8bf0 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -49,7 +49,10 @@ void *alloc_insn_page(void)
>  	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>  	if (!addr)
>  		return NULL;
> -	set_memory_rox((unsigned long)addr, 1);
> +	if (set_memory_rox((unsigned long)addr, 1)) {

How does x get cleared when freeing this memory? arm64's set_memory_x() sets
PTE_MAYBE_GP and clears PTE_PXN. The only function that will revert that is
set_memory_nx(). But that only gets called from module_enable_data_nx() (which I
don't think is applicable here) and execmem_force_rw() - but only if
CONFIG_ARCH_HAS_EXECMEM_ROX is enabled, which I don't think it is for arm64?

So I think once we flip a page executable, it will be executable forever?

Do we need to modify set_direct_map_default_noflush() to make the memory nx?
Then vm_reset_perms() will fix it up at vfree time?

Thanks,
Ryan

> +		execmem_free(addr);
> +		return NULL;
> +	}
>  	return addr;
>  }
>  


