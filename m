Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD673C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg2HPDJGw50++nt9f+gnQ911MKt1QN60boipCB0LDgE=; b=LeX41xf8/8CMzt9Oh9uciTVsk/
	qVccQ5Ky7hyKBk7bjUU8WdI6EMuNL0zq1XaIw70w5W3O7sVpBVFMDqEsjQpQUxpa83D2+t8a1SGGo
	XDhnYRX8HZmAHFK+2meVzKVpOibQloOE/q1B7PUjYnCqs7eCVGVebelMW5yTaahVA6HkrzKvCNvFN
	xB9yXkluMBPE3rrMh1yaCnJcpEk16kUHKcYUzGwbQqrFx+CfHXkp4JoPN6J5ROIu0C8/QGSsj2/96
	+hPDL5kO5+8IK00kouaAW4ZakPqGoJQsmR0vjIiWn+tPuuh0M3boYAxuIcjOIDabuNRFDp652eGDE
	RrlQC9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6rm-00000001wlq-0mTo;
	Mon, 17 Mar 2025 09:34:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6mG-00000001vUn-1EZw;
	Mon, 17 Mar 2025 09:28:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E81913D5;
	Mon, 17 Mar 2025 02:29:02 -0700 (PDT)
Received: from [10.57.84.137] (unknown [10.57.84.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F070E3F694;
	Mon, 17 Mar 2025 02:28:49 -0700 (PDT)
Message-ID: <16c12c3f-f2c2-45fa-9db6-4dfaeb002059@arm.com>
Date: Mon, 17 Mar 2025 09:28:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/ptdump: Replace u64 with pteval_t
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-3-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250317061818.16244-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_022856_437273_E3CBB6D4 
X-CRM114-Status: GOOD (  18.95  )
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

On 17/03/2025 06:18, Anshuman Khandual wrote:
> Page table entry's value, mask and protection are represented with pteval_t
> data type format not u64 that has been assumed while dumping the page table
> entries. Replace all such u64 instances with pteval_t instead as required.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/ptdump.h | 8 ++++----
>  arch/arm64/mm/ptdump.c          | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index e5da9ce8a515..476a870489b9 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -24,8 +24,8 @@ struct ptdump_info {
>  };
>  
>  struct ptdump_prot_bits {
> -	u64		mask;
> -	u64		val;
> +	pteval_t	mask;
> +	pteval_t	val;

Given Ard's suggestion of using "ptdesc" as a generic term for PTDESC_SHIFT (or
PTDESC_ORDER, or whatever we ended up calling it), I wonder if it would be
cleaner to do the same with the types? We could have a ptdesc_t, which is
typedef'ed as u64 (or u128), then pteval_t, pmdval_t, ..., could all be
typedef'ed as ptdesc_t. Then for code that just wants a generic pgtable
descriptor value, we can use that type to indicate that it can be at any level.

Thanks,
Ryan

>  	const char	*set;
>  	const char	*clear;
>  };
> @@ -34,7 +34,7 @@ struct ptdump_pg_level {
>  	const struct ptdump_prot_bits *bits;
>  	char name[4];
>  	int num;
> -	u64 mask;
> +	pteval_t mask;
>  };
>  
>  /*
> @@ -51,7 +51,7 @@ struct ptdump_pg_state {
>  	const struct mm_struct *mm;
>  	unsigned long start_address;
>  	int level;
> -	u64 current_prot;
> +	pteval_t current_prot;
>  	bool check_wx;
>  	unsigned long wx_pages;
>  	unsigned long uxn_pages;
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index fd1610b4fd15..a5651be95868 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>  	struct ptdump_pg_level *pg_level = st->pg_level;
>  	static const char units[] = "KMGTPE";
> -	u64 prot = 0;
> +	pteval_t prot = 0;
>  
>  	/* check if the current level has been folded dynamically */
>  	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||


