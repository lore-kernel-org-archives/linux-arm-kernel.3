Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFAFC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2q9mWrQ077CpWx7gvzoZmI6LLaEYOe/WRqM0y6kozc=; b=uS8gMMlTLd067bztxYSkKKrSr+
	1t7dJrfrP4T6aHdCCnCa9FsC1Cdm+1V9ql+vmy1Fxm0PgZMUSQHyjif9Mz7CrHmhptKCfQr8KMaoT
	rOQMFEYX2rtjKgS2ayShoH6g8sPvRn7OvzzP5QrnqajUcey245HAzx2bJb2VIE+W7QvDHAE16/qd7
	B/yUvyb7wTiklJjk3IB+CAb4D9KPnY6PFy0kWgMpodX0h6V5USB8cbuLZTcXOrDYJNGoMHQFs/QiW
	LETueF/gaXTRsPJPNUp55cylnCQT9Uu+yJt3KHMBLqq1dgSbObJGV/SkVNXJb2iWuRt3zpjyj5JG3
	H4x7z7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503H-000000099ay-2uyx;
	Wed, 16 Apr 2025 10:31:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yZy-00000008tX1-1t6J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:57:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so35613235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744793829; x=1745398629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2q9mWrQ077CpWx7gvzoZmI6LLaEYOe/WRqM0y6kozc=;
        b=mFMX9h0NrDsapu2id7w50d2lrUjwlGhtXYq+LjGBFiNoCStL+UImVWsMWcFfvYM2yD
         yv3a+psA8tC05h4KwMxAwtSVYRlApyHblaIymwa3VwtTgFMoXyB7DTZ+nu4/2lU4aoez
         qaJoPVz6iu7eMvKuCSi61bkhrPygXmhiZkObYqbzqw28mw7yKtJKgsgjJTsoD7cR0kv1
         yNx7Df17Smiy0wGdk6SIpeFbG26HguWryHEzrZt0OvHhFA3vQ+QqDl7SERiQvFFWY197
         cO6qPZTV3pwILml2odW4/aakkhY11iyjxNTMTRp+imZpgG8ZABSN4Js/xbCks2HspCz4
         3TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793829; x=1745398629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2q9mWrQ077CpWx7gvzoZmI6LLaEYOe/WRqM0y6kozc=;
        b=RTo+qckWE5Zzw8JI9iOJlDVdeqVEzRbtOs9+qStfbPMX4MjySjuL/A2aTK+/JAryzs
         gzMR/6PlFmFsOEffwwIn61drAT/r74G8sYAF3fT2t+WrCv2LCshqrZ1a8+fRn6u9p3Tj
         rUvN7iyfihpPKplyn2lOpPofXP2QtgLHGPdBCv2YRlrFihKa1GaxCQ4KH8YBkvLy6fI/
         r9B6Pig54zl7ugo0CFalBJ3lDf6XPaaM39u80nIGfY42p0VXh8Qnc4nTrfwLIwhJgedD
         I571TaEmS0+2mHbALtT5Sc5lB7eXimfgxvJW0/tRXDdAEbQOeGntXF3VWT0+TiAyp5co
         zpTg==
X-Forwarded-Encrypted: i=1; AJvYcCWqWlkG+vVAs1HOvkKCRyHXfb0rUbIGOAYEgs5qLV7DYPPdn2gg7hsmJgaQbHH1dGIYs86qsl4hs/VnuyovOhnR@lists.infradead.org
X-Gm-Message-State: AOJu0YyybSe5p7wjt98x8JTp2w+rrtK5Qfw+fF1y94VeLJYwaQbqcbdb
	sZA7WFwzZrLTyz+eDrNDm22HGcoD+dAtPe4ANvHgviB+twxdeC7J
X-Gm-Gg: ASbGnctQ41Fvx2E6DXTD0Mz4A9JCySO/oBLCKjxD2ZFOH91SFKtZNiQSQjheHY3iXHr
	Pv2adBkSRaUuA2AabtevJRILQ4bpq6DMBQXlwqVMEIWzXw3pA7CMtq7pAhSJELWj1FGoj5EVy9+
	5knj8HEAq4QtA2JFuNQOJL92rVtwrctaV0UW4PB0G/1QBQEN/OHu+DUD+0ijP+8q+ta8Gc/lbeK
	YyQ8zQ48622wb9RDT4Y4LsIN+ZUNVDp57gZjbOA7qlRkuPq6U/PE5WpPRa0q7e3U3FkBRptcHB8
	XJgjokatPivXBHQGSRAGZviP21ClA98My6kCmBDJsTwdn0mE0GmJZj1u6aPPRpxWIpa8OBq8UEG
	TDZ4=
X-Google-Smtp-Source: AGHT+IEdRu9lqhEI67GQdu6KzEDCKydS6x6IrBr2xmSqPRQe84os+UnJO/xBR4d/+hw1Eky5YD7SfQ==
X-Received: by 2002:a05:600c:4e45:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4405d616b5amr9104385e9.11.1744793828365;
        Wed, 16 Apr 2025 01:57:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640e3sm16841706f8f.12.2025.04.16.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:57:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:57:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Xavier <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
Message-ID: <20250416095706.47a8afa2@pumpkin>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
	<20250415082205.2249918-1-xavier_qy@163.com>
	<20250415082205.2249918-2-xavier_qy@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_015710_492394_3B4FADF5 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, 15 Apr 2025 16:22:05 +0800
Xavier <xavier_qy@163.com> wrote:

> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.

Benchmarks?

As has been pointed out before CONT_PTES is small and IIRC dirty+young
is unusual.

> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..0acfee604947 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>  
> +/* Note: in order to improve efficiency, using this macro will modify the
> + * passed-in parameters.*/

... this macro modifies ...

But you can make it obvious my passing by reference.
The compiler will generate the same code.

	David

> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> +		if (pte_##flag(__ptep_get(ptep))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +		} \
> +    }
> +
>  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  {
>  	/*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  	for (i = 0; i < CONT_PTES; i++, ptep++) {
>  		pte = __ptep_get(ptep);
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>  
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;


