Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE1CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDqpN9jjtDTTnD3FFWvTmd/09fl9tVBA1iW60cJzO6M=; b=OHZCDfdvRIDuUgdgltOHc044TC
	/9p4m4jmKC/Q9T7RWFfmza/L2Nl5bZ4oZmC7hjZaiOmH8QtiZZxXyCd0htQsKjNGjbvkgmjNqmJep
	H5JCip7Eu+jEpf7iVgXAO9AOvIS5qhsKHn7NOHfJXPl7jd5o3/WfP2IM4xZTgHTwItNfKsXASOuJv
	nHzpVvSXlmDVkyq3Q2zTJESOFLS13riRgYjV6Bire79iBmeKZDM0T+funkbEKRoVO09INtCfLzWVB
	ZCQN07vvrTEI3iiNXmq8AVw9RztnFkfoZpep5CJgPIe1R+iI68YWTKKL/WtrFavUMGvhQpYON8eNd
	zQFiXohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF7U-00000001iaa-3Cs6;
	Mon, 14 Jul 2025 09:05:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF53-00000001iQp-2zyg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:02:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10011764;
	Mon, 14 Jul 2025 02:02:27 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C51E93F694;
	Mon, 14 Jul 2025 02:02:35 -0700 (PDT)
Message-ID: <404625f2-808a-4578-98bd-4d12d7a72c7c@arm.com>
Date: Mon, 14 Jul 2025 10:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm64: mm: Re-implement the __tlbi_level macro in C
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-6-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-6-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_020237_801131_7DABDE23 
X-CRM114-Status: GOOD (  16.96  )
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
> __tlbi_level() is just a simple macro around __tlbi_level_op(), so merge
> the two into a single C function. Drop the redundant comparison of
> 'u32 level' against 0 and tidy up the code a little while we're at it.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 728b00f3e1f4..ddd77e92b268 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -128,8 +128,17 @@ enum tlbi_op {
>  	___GEN_TLBI_OP_CASE(op);					\
>  		break
>  
> -static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
> +static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)

level is passed into all the higher level functions as int. That's why the
"level >= 0" comparison was previously there. Of course no users should be
calling this with a negative value so I'll guess that I was trying to guard
against seeing a valid level -1 in future with 6 level/4K D128 pgtables.

Given everything else uses signed int for level, perhaps we should be consistent
here too?

>  {
> +	u64 arg = addr;
> +
> +	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
> +		u64 ttl = level | (get_trans_granule() << 2);
> +
> +		arg &= ~TLBI_TTL_MASK;
> +		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
> +	}
> +
>  	switch (op) {
>  	__GEN_TLBI_OP_ASID_CASE(vae1is);
>  	__GEN_TLBI_OP_CASE(vae2is);
> @@ -145,20 +154,6 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
>  #undef __GEN_TLBI_OP_ASID_CASE
>  #undef ___GEN_TLBI_OP_CASE
>  
> -#define __tlbi_level(op, addr, level) do {				\
> -	u64 arg = addr;							\
> -									\
> -	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
> -	    level >= 0 && level <= 3) {					\
> -		u64 ttl = level & 3;					\
> -		ttl |= get_trans_granule() << 2;			\
> -		arg &= ~TLBI_TTL_MASK;					\
> -		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
> -	}								\
> -									\
> -	__tlbi_level_op(op, arg);					\
> -} while(0)
> -
>  /*
>   * This macro creates a properly formatted VA operand for the TLB RANGE. The
>   * value bit assignments are:


