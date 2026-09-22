Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B9C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OaLmhjzdR+cPFOrh9HnxO0CTOzFE+bnWyMClYX5uFg=; b=U3AlEL4vkFehNCYyB366c6OWD8
	9R6XmMm9hwxP2x8Tmxh4VXxChMmQhorWqB+dg/aba7N9N5tyKInRHofnjYz7FjeiZqxEbXsfb/A5A
	rLHK1lqolt3mgKVGoc7ESTFQ0SlQkZrZLnODXYb2H5bk8+5peJS7CPFv+aJMadw9hllYdVvC/Iyja
	GT//rUjFexAKfEw8sdenyjNVQ78+EtQNI6GowUQl0xF4rq4P7LCKG8/avI8ldmSl7dIv3RXVyajlI
	Pb0z5QnyrvwKk34WgVl9E8xX9kUaqOGoa7lvHAx+cJdA9+v7XCIASP7tTQR8XGZMSw+EnggIHRAgG
	tPteq5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ycx-00000005AgU-3VVb;
	Tue, 22 Sep 2026 11:25:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ycv-00000005Ag8-3bOz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:25:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 854E21576;
	Tue, 22 Sep 2026 04:25:28 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.cambridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98EC83F528;
	Tue, 22 Sep 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790076332; bh=tRKBokC9dboApmD51WjGyleP1D+mC+A66/4ykfbSHlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lRd8kv6vuOuNmmtvZYaYTQJsE2zRmmZUnIjbNFo3wPvD23EBWlOn6N414ritXW920
	 8NrldoMoMZ3QGLz0+Lg3CtLU/tCyMaXMhVtcPG7uehc9r0+SfVERb4EsT91EO+fqTL
	 XZ8u4JyaPyE9hXxuY0Sm6hk23fJ8d7vFY18V9fG0=
Message-ID: <16066089-ccbd-4c29-9401-5cdcc5c29aab@arm.com>
Date: Tue, 22 Sep 2026 12:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mte-kasan: Use IS_ENABLED() rather than
 ALTERNATIVE() 'cfg' parameter
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
 will@kernel.org
References: <20260902113232.314831-1-mark.rutland@arm.com>
 <20260902113232.314831-2-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260902113232.314831-2-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_042533_942866_C9EF1268 
X-CRM114-Status: GOOD (  19.16  )
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

On 9/2/26 12:32, Mark Rutland wrote:
> The ALTERNATIVE() macro accepts an optional 'cfg' parameter, which
> accepts a CONFIG_* symbol. Where a CONFIG_* symbol is provided, but is
> not selected, the ALTERNATIVE() macro will expand to nothing.
> 
> It would be nicer overall to remove the 'cfg' parameter and to have an
> explicit check for 'cfg' outside of the asm() block. This is clearer to
> a reader, and permits the compiler to elide the asm() block when 'cfg'
> is not selected.
> 
> In the mte-kasan code, replace the usage of the 'cfg' parameter with an
> explicit IS_ENABLED() check.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/mte-kasan.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
> index 3521392719189..de910f1c19e1b 100644
> --- a/arch/arm64/include/asm/mte-kasan.h
> +++ b/arch/arm64/include/asm/mte-kasan.h
> @@ -53,14 +53,16 @@ static inline bool system_uses_mte_async_or_asymm_mode(void)
>   */
>  static inline void mte_disable_tco(void)
>  {
> -	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0),
> -				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
> +	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
> +		return;
> +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0), ARM64_MTE));
>  }
>  
>  static inline void mte_enable_tco(void)
>  {
> -	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1),
> -				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
> +	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
> +		return;
> +	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
>  }
>  
>  /*
> -- 2.30.2
> 

Looks reasonable, FWIW

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

