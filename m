Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B2CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rwn20ez+dkw7n0xM3zxrVu1oqGgCVumFyniEBZtAK6E=; b=Wk+gxc+vRntXxS+Ux8xn2Z4Z2h
	jayfKgMl2SZAskgG6JdK3L668Q4U8eX/zwymQuiKS7IxCyGWUcnrmOlO67aDWdeBhkM4TcKNN4Ksn
	aSMRr7ho6Bery94jW8ffop99uYEzelFVFlq2jAji3oIiqJ1dv5MsISwNs9gD2VQLgb09MY06vU/bu
	eR6Sxc5sHVvG3JPoCyXI/9N92NaQeg3COHdRaVd3AadUYLDIBP/siNAluSHtHNsjZUcxBz7G3apU9
	bNy0bPTCp1PW2sgrR5B1lpLIRgGaenwWUQr0054CgxcOht36XnXdXQI+BAJzYT5hCVApkF2l4XZTI
	1hqg7YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWrp-00000002JKO-2g7W;
	Fri, 19 Jun 2026 10:54:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWrn-00000002JK0-09yW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 038F64746;
	Fri, 19 Jun 2026 03:54:25 -0700 (PDT)
Received: from [10.57.95.87] (unknown [10.57.95.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84AEF3F62B;
	Fri, 19 Jun 2026 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781866469; bh=s/f0450p0ipSbzYrTpx30RMlCwIeDpJgQBuLFxB4f7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cQig9C/3Fs4Qsg3hrx+5xbicCCSIKr5aSxpLihZzHe8fC1h10xTpW06wyAf+FOgzN
	 0VWqHPp9X59AbrLIvGz1bDw0Y4D+QBT9CI4GqxQgwombbv6UYoI/y7JQagrlImv0Q8
	 oradQ4Huu+YwiwBD4+kTthIp6ifhKWoeejJoStxQ=
Message-ID: <666a981f-44b6-4c19-a641-c1eff44fe54f@arm.com>
Date: Fri, 19 Jun 2026 11:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] arm64: mm: add helper to fill execmem with
 trapping instructions
Content-Language: en-GB
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-5-abarnas@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260611130144.1385343-5-abarnas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035431_133073_7DACDDF6 
X-CRM114-Status: GOOD (  17.59  )
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

On 11/06/2026 14:01, Adrian Barnaś wrote:
> Implement the architecture-specific execmem_fill_trapping_insns() helper
> to poison executable memory regions.
> 
> When CONFIG_ARCH_HAS_EXECMEM_ROX is enabled, the execmem subsystem
> requires a way to fill unused or freed executable memory with
> architecture-specific trapping instructions. This implementation fills
> the specified region with AARCH64_BREAK_FAULT instructions and flushes
> the icache to ensure the traps are immediately visible to execution.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/mm/init.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index c673a9a839dd..71aa745e0bef 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -408,6 +408,20 @@ void dump_mem_limit(void)
>  }
>  
>  #ifdef CONFIG_EXECMEM
> +
> +#ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
> +void execmem_fill_trapping_insns(void *ptr, size_t size)
> +{
> +	int nr_inst = size / AARCH64_INSN_SIZE;

The x86 instruction is 1 byte, so it can exactly fill any provided buffer. For
arm64, the instruction is 4 bytes so we can only exactly fill the buffer if it's
size is 4 byte aligned.

I'm guessing that in practice, size will always be page aligned so we are good?
Perhaps worth a WARN_ON_ONCE() though?

Thanks,
Ryan

> +	__le32 *updptr = ptr;
> +
> +	for (int i = 0; i < nr_inst; i++)
> +		updptr[i] = cpu_to_le32(AARCH64_BREAK_FAULT);
> +
> +	flush_icache_range((unsigned long)ptr, (unsigned long)ptr + size);
> +}
> +#endif
> +
>  static u64 module_direct_base __ro_after_init = 0;
>  static u64 module_plt_base __ro_after_init = 0;
>  


