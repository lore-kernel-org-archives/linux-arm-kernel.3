Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407BCF46455
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kQhGtTK/Lt5/UNF5mERVigZml+1Hw4HwS17dAwaToA=; b=I9FFewD5U26PcviAILXT80VmBe
	k8odBJ7o4UEAtbSH7Rrs2tYRj4rlssZBoA+q0XEBBgXHoIyzGAHK+zAmaCuljurw5bYtuYe9PT6u+
	SA4WzM9sRrzQkEWJADyTtYqxaJ78FErWaXbPfwz3yNOYUl93IAW25VYCV4OdSjF5yMPJ/SYWNbt/d
	rX/FPj/2i+fuLB1qIJSaOLmAxKgOO2/PYju2IxQLkfkdCu2ogQ18aiO29P9qeJroFjbsQaCA31VBO
	WXXbyxtC/jLf2B5wpSaceu9IgYRavJLd/lnTK/WckdR0MW+hiX7eNb1sXohEtJI1mhe2ngtGTg9Hi
	7POrKm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26T5-00000003rLO-37jm;
	Mon, 16 Mar 2026 11:50:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Sw-00000003rKg-33ym
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 11:50:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso37224365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773661832; x=1774266632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kQhGtTK/Lt5/UNF5mERVigZml+1Hw4HwS17dAwaToA=;
        b=XsgMGlvu9ce5TH7FPJI8eM2hGrFEfQVwNttNb7yb7tSU9vKUDA8BCO3cJEDtREMxxd
         5gbP56ouHS/WXxIMVdYg6wwXgTnuw8wo7KkaUPlAlZuowVT7RMrYvdnxPYyFY2mHuUb1
         CPyR+d9epp+/8B+VndJXxKZHVCKqiD+kPtOwWKgEK9j2QlWfahJw7o9L9VbHu5ZdC6mf
         yw3E0uIIC0hWxx7Qc+3w0DGjHcGAFIuyBvQFTHPmIlAiwdB92qgQCeA1hd3wQU9mKHj/
         KDFJYx5lqSHlb8tj6ftY5eI0UZbpGYeg7/xHmgLgrgVu0vdQonAm5NLTdgGTqP5FC506
         jQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661832; x=1774266632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kQhGtTK/Lt5/UNF5mERVigZml+1Hw4HwS17dAwaToA=;
        b=pM0WNgElqtb6dcASVn53W5OxHHvkzSvgd8yXBymS0ywU1jCmws+o0sBhatjw1U/DBD
         L5zcvPUWgCpR4IRt+WNmG2eL9YzKW2f96ceGDYHt6xuXltxooPP9kKr+rhKLoZQHe7po
         pdMs9/PbMi8U1zgaxrs0tVhY2Z8h9IVo91SgPkE+vT7eY1tXVKJjdU9Ted3Oryw/Z4em
         BeBY8czx7OhH7hsq5xSjqhdgHjjnXbF5jASYj1ZtsCQu0ZshG1IhR+FW36zXKlDnPRil
         sxQGS3Jw1pai18odAmLHfrghuuTfQr+rpBR+p2F4VDfm8swfCzXsXORP7GpWlWihV1tg
         QMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUXNmJa+HHZzftdDz4xpAaaIP8lGyxMtJtZ54VFKRo7WTHJNYON3edeNwc1WAeNcovxg+8q5EVpvSIPjgp1ervD@lists.infradead.org
X-Gm-Message-State: AOJu0YzoO737rNYY0h0PjcPXx+o3EWqLDooApxui8GJkiJfVsXLQUwc4
	tfAKxXLd0mOsfNfNv/3wqxuoxiFD1YFO3WnIR3TgOKIqehFIO9PchoDi
X-Gm-Gg: ATEYQzwO23IjE/iGLpBtFiCrO0xtnufgl275fcrNMVa/ArbGYYj5bG3aPpaWaI0Fdm1
	+8k8HSuhcmeyM6xyRAM5/bUxNOv4H3ssOUy5f+LGXzGJJQZ09NNYtvs30UY7f8q3+/Sf9DfLNdN
	EPBpgf2o+FIExnPA2pKObIJcp0tW2tGB2zC2+R8j8i8GR4Vb653snzm749TAIGdRyZvZg5CoewF
	yT/+EyQVujDKHWayBnjogDC9jFxDd7q16yU+jOJH8sKuID9fL54q5TOp30giJqdBir9DdltVfjg
	BD6IBKZduWeyE6rFVnxmgho41+5BoL9UmlwY7AqPc34wISmiVAm/8LyBl9WPhksFY0W+BCQDKA5
	8SsMqeTz8xbn7c+G78BAZpkWgAtFDP3DuvsDnFL5WaPzISiUbAVfVV2dWDH2fs1m5cvmuvCNiA8
	dL3s3h11S29dPoKBqP0ASfqfZnoWrCE9SRFyk5JVAjhZIV6O9shL9iP3ulD8rxuLg+
X-Received: by 2002:a05:600c:1e8b:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-4855672ada8mr206704535e9.32.1773661832366;
        Mon, 16 Mar 2026 04:50:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm421847035e9.0.2026.03.16.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:50:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:50:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [RFC PATCH v2 2/7] arm64/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <20260316115030.6988ad62@pumpkin>
In-Reply-To: <20260316052401.18910-3-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
	<20260316052401.18910-3-kprateek.nayak@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_045035_573163_C8A11D44 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, 16 Mar 2026 05:23:56 +0000
K Prateek Nayak <kprateek.nayak@amd.com> wrote:

> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. GCC generates a:
> 
>   movz  w1, #lo16, lsl #0     // w1 = bits [15:0]
>   movk  w1, #hi16, lsl #16    // w1 = full 32-bit value
>   and   w0, w0, w1	      // w0 = w0 & w1

I don't thing the '&' needs to be part of the asm block.
Just generate the 32bit constant and do the mask in C.
That will let the compiler schedule the instructions.
It also make the code patching more generally useful.

	David


> 
> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> by Claude which is implemented here. __runtime_fixup_ptr() already
> patches a "movz, + movk lsl #16" sequence which has been reused to patch
> the same sequence for __runtime_fixup_mask().
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  arch/arm64/include/asm/runtime-const.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index c3dbd3ae68f6..4c3f0b9aad98 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -35,6 +35,19 @@
>  		:"r" (0u+(val)));				\
>  	__ret; })
>  
> +#define runtime_const_mask_32(val, sym) ({			\
> +	unsigned long __ret;					\
> +	asm_inline("1:\t"					\
> +		"movz %w0, #0xcdef\n\t"				\
> +		"movk %w0, #0x89ab, lsl #16\n\t"			\
> +		"and %w0,%w0,%w1\n\t"				\
> +		".pushsection runtime_mask_" #sym ",\"a\"\n\t"	\
> +		".long 1b - .\n\t"				\
> +		".popsection"					\
> +		:"=r" (__ret)					\
> +		:"r" (0u+(val)));				\
> +	__ret; })
> +
>  #define runtime_const_init(type, sym) do {		\
>  	extern s32 __start_runtime_##type##_##sym[];	\
>  	extern s32 __stop_runtime_##type##_##sym[];	\
> @@ -80,6 +93,15 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
>  	__runtime_fixup_caches(where, 1);
>  }
>  
> +/* Immediate value is 6 bits starting at bit #16 */
> +static inline void __runtime_fixup_mask(void *where, unsigned long val)
> +{
> +	__le32 *p = lm_alias(where);
> +	__runtime_fixup_16(p, val);
> +	__runtime_fixup_16(p+1, val >> 16);
> +	__runtime_fixup_caches(where, 2);
> +}
> +
>  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
>  	unsigned long val, s32 *start, s32 *end)
>  {


