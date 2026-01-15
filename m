Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC8D46627
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 22:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=; b=A1gKDFwSvE3pbNtsCxeHsgewA4
	fVXfaOBmQxNkjq2PuETJO1L21Vej4C381ZTL9ywV3/ZPklzVLtYzMUTObVPFhcVdlgErrnnaLwaZj
	fFpZYaQ/krGosoxi0HY6hlJYdwe64bSd63Mct/Zo6Z4qsN/KwHhyp7tQNwDPYNvRwFPIXU5Vu7T1s
	x/B+v6Ns9G64mUUnYtbaOz0MKogA6F/8x9IxqIaibia+l0S3fPSyxLn6jbI+3dzbCDH6U4vQBi9GN
	A7jbMRGpmSZU+OfXbuUsrBjIjtKUnI58JZJs3bLIemp3oa01A5h0Nvv9ZF64zIhnr3j3/dKa0WB8g
	8CwIMeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgW3M-0000000DHkp-2tpm;
	Thu, 15 Jan 2026 22:42:56 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgW3K-0000000DHkS-1D3t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 22:42:55 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b9fee27ccso179873e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768516971; x=1769121771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=H+p9C6IWAhh6Lvh2O0NgZontL9CJEVhf7H0b06cB5GbJt2dCYDU8AS97YMN1zP2hZT
         QjIwHmpwH0FmtCkFEAcIyE6p/RZCNkdONVh9cn7mHrOLLZXjr7Kr1P2eepoWH6M68deH
         iQielQ+ZPIJ1Wo1lQLu6XMr5q2KBoj+xhoqxt7SlPWx+zhbm/Pe4kcvCwn9vg5yW74Zx
         kalqd1H52TqKuItXyalBD0saVv92mC+qEKlkXOQi3vb6eTDFGoNh7H3WICGD5lktyH6/
         8hwWdZJQmvHzRYTy9RHo1eAvbZXHnLPuIlmu7g1Y1hqc1HFRMScvKhWtZwl9x4z9NOWR
         INMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768516971; x=1769121771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=b3Wgd+/dwwlXsLTSLvPhnZa+eFmUfoPqcB9T8v0q0nLvS66hY+DilZDLVViobF+OIg
         +V+vy94oKWJZPNH/3GnSYap+6YOflCDom2NN1F2Mob0Edxrf6TgCv3/auEMSIX7axoof
         q0eZTaY/e0IEx0VBoYfv1uA11li6sCaBIZQo33R5rN641Ms8NNxbwtWZivElZXqb7gGW
         3+W9UBTqEHGPHEhqd0ncCA1BcumymcEpIEGS8ITUSmxJe5tWWlKEPsuA6IVNVNmJY3CA
         71UQFJp5iUHMjbDqb5lH+SSVZqOARpdx2XJYvFYduTn05NR2fOKZ/pUSBmoyTI4aC7dQ
         jhGw==
X-Forwarded-Encrypted: i=1; AJvYcCVSgz0Nh9vpyJGDiPSx5emXQh5h2luVpW/LQN7MAtOv40vAdpxqIW4Iuo5RX57bPFafrMBR8FVIMVjLps3siaMK@lists.infradead.org
X-Gm-Message-State: AOJu0YwK1GLmbk2sEU1a/JZgv/luGH/Y4g5wMnHJs9yGMu4V9s0gXwst
	uZca2b/Nc97aw1uk3BBbIXsLAOLT+EWrd6kjPoYupTqozrZEGiqboKxP
X-Gm-Gg: AY/fxX4+eh0QPStXENp4qXSKUwAM3F29UcuQLHRfcDINhqNrZRZMS/xZrXU05MYG0w3
	UeE+0U0jQ6GZGYOwyklCOS5M4FeMBRZC8XdGLwHWlrSnmN7sSoDTft6PUws8qi6pYL563dJFSFn
	6mntxqrtHgiQ/ztJiuCzEbCZ0GoLq6CoWxEBIkm+Z/UeMfNWJUvNumyorVGxjuHNMb3fCAFNyh/
	Jf0BYYKtrRYS5r32KJoIqZadcDOAboZMCCQPOijAAD72iGuKB4NOLe4NPEljcevhZERlQdiI9dJ
	kHpypUJ9cvDoM3nC+VeCguGBj9z2mU0XpKydukBm/pcln9yPdVbiBC98agBrVBHdt7l6We5BOHl
	UNBMOFOQ/osh3fbHgE9+A5hPnQfyQ/r2XwQSpXoZGQSTZBiumSe2bezpb5wKU6zSolNj2w8+vl9
	+SJZGIcSKkvL0V2VhCNAQ=
X-Received: by 2002:a05:6512:63d1:20b0:59b:7be4:8c40 with SMTP id 2adb3069b0e04-59baef130e4mr131958e87.8.1768516970797;
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Received: from [192.168.0.18] ([87.116.178.235])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf35434bsm209044e87.45.2026.01.15.14.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Message-ID: <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
Date: Thu, 15 Jan 2026 23:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow
 computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, llvm@lists.linux.dev
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_144254_360331_2D1B4E53 
X-CRM114-Status: GOOD (  19.93  )
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



On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
  
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..b5beb1b10bd2 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>  
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
> +	 * both x86 and arm64). Thus, the possible shadow addresses (even for
> +	 * bogus pointers) belong to a single contiguous region that is the
> +	 * result of kasan_mem_to_shadow() applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> -		return;
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	/*
> +	 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
> +	 * arithmetic shift. Normally, this would make checking for a possible
> +	 * shadow address complicated, as the shadow address computation
> +	 * operation would overflow only for some memory addresses. However, due
> +	 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
> +	 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
> +	 * the overflow always happens.
> +	 *
> +	 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
> +	 * possible shadow addresses belong to a region that is the result of
> +	 * kasan_mem_to_shadow() applied to the memory range
> +	 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
                  ^ Missing couple 00 here

> +	 * resulting possible shadow region is contiguous, as the overflow
> +	 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
                                  ^ same as above

> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL << 56)) ||

This will not work for inline mode because compiler uses logical shift.
Consider NULL-ptr derefernce. Compiler will calculate shadow address for 0 as:
      (((0x0 | 0xffULL) << 56) >> 4)+0xffff800000000000ULL = 0x0fef8000....0
Which is less than ((0xFF00...00LL) >> 4) +  0xffff800000000000ULL = 0xffff800...0
So we will bail out here.
Perhaps we could do addr |= 0xFFLL to fix this

> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
>  
>  	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
>  

