Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1EBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJY4RT6a64HXJVbaTrWAO2PlJU+lHXwkk4EZvpUDTws=; b=gc3Hu5U/jXpCrvES3eBRRsR+5F
	KMn0Y14+RR782qsFRgIY9RtzF4T4uXNcoVM60mh2a60XcPO6GJklTNvHB6VvN96UxIvH9EIk7CXnw
	4Ij54UB5wzrfcEDrz03rTEijqOr4cb0yCHJQuHAg56FxdCtJzGu8vqcmAQMXOlKSchYTrMy8RljEU
	KNn/yNkyguOyy9dO5f7lx62xsgAWDPjIgR6hMZIoQ52wKjquRUZo0Bv31uhPJMMIph475YCBrhOJq
	DRoIeLg5P2jkOJKupU8yr8X0dlDBn1Rws/WUIfh+PwRwyl8tSTZCj2OxNjZPmLlRPL4ug+dkIANCO
	Hu9lMc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEpr-00000001gRA-0rvv;
	Mon, 14 Jul 2025 08:46:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEhv-00000001far-1jVX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:38:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7261B1764;
	Mon, 14 Jul 2025 01:38:33 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4593E3F66E;
	Mon, 14 Jul 2025 01:38:41 -0700 (PDT)
Message-ID: <22879688-eac8-4d76-b406-14a4458e09b0@arm.com>
Date: Mon, 14 Jul 2025 09:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] arm64: mm: Introduce a C wrapper for by-level TLB
 invalidation helpers
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-2-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-2-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_013843_504479_3676576C 
X-CRM114-Status: GOOD (  16.03  )
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

On 11/07/2025 17:17, Will Deacon wrote:
> In preparation for reducing our reliance on complex preprocessor macros
> for TLB invalidation routines, introduce a new C wrapper for by-level
> TLB invalidation helpers which can be used instead of the __tlbi() macro
> and can additionally be called from C code.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h | 33 ++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index aa9efee17277..1c7548ec6cb7 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -88,6 +88,16 @@ static inline unsigned long get_trans_granule(void)
>  	}
>  }
>  
> +enum tlbi_op {
> +	vae1is,
> +	vae2is,
> +	vale1is,
> +	vale2is,
> +	vaale1is,
> +	ipas2e1,
> +	ipas2e1is,
> +};
> +
>  /*
>   * Level-based TLBI operations.
>   *
> @@ -105,6 +115,27 @@ static inline unsigned long get_trans_granule(void)
>  
>  #define TLBI_TTL_UNKNOWN	INT_MAX
>  
> +#define __GEN_TLBI_OP_CASE(op)						\

nit: my personal preference would be to explicitly pass arg into the macro
instead of implicitly picking it from the parent context.


> +	case op:							\
> +		__tlbi(op, arg);					\
> +		break
> +
> +static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
> +{
> +	switch (op) {
> +	__GEN_TLBI_OP_CASE(vae1is);
> +	__GEN_TLBI_OP_CASE(vae2is);
> +	__GEN_TLBI_OP_CASE(vale1is);
> +	__GEN_TLBI_OP_CASE(vale2is);
> +	__GEN_TLBI_OP_CASE(vaale1is);
> +	__GEN_TLBI_OP_CASE(ipas2e1);
> +	__GEN_TLBI_OP_CASE(ipas2e1is);
> +	default:
> +		BUILD_BUG();
> +	}
> +}
> +#undef __GEN_TLBI_OP_CASE
> +
>  #define __tlbi_level(op, addr, level) do {				\
>  	u64 arg = addr;							\
>  									\
> @@ -116,7 +147,7 @@ static inline unsigned long get_trans_granule(void)
>  		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
>  	}								\
>  									\
> -	__tlbi(op, arg);						\
> +	__tlbi_level_op(op, arg);					\
>  } while(0)
>  
>  #define __tlbi_user_level(op, arg, level) do {				\


