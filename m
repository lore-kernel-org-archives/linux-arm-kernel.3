Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B81CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRg4MCwFnvrNqRvlPfGDLk8MzpC0OLCTk14CpKVfvfo=; b=DBcGIoqC3m+gtqeQYIXLzwKCyK
	B4MfC4zKtv/T4urSxIpGVVWz25ms1cv1P6UYJhqc/AXEbU9pBI9ccePSepzxrSyhFpUrhElDGQGCX
	EpdKkWBIoN5eZ8pPwf9dKZ+NzDH6WZeNzantrdBu8MpnkTQrfTm7vB8jepR8UoUv12kCEOOGnsni2
	8h82qFEv032EfjfnodDv29WhakZ5x5L51CDkG6VVAjGhnn5fcy7QZS7O50brotc4Qlai2oEqVJn63
	MGKlmE3cSkU7qdNAmd0+VMHuxFUKI2WO7ggth57XioJ/QKTbCRzy9z2kCSsCtj5tuGG2HwpdOvnW4
	QonkVUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdTb-00000004DRQ-2vJt;
	Wed, 20 May 2026 09:44:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdTY-00000004DQW-2NCG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:44:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a88db610ccso5302996e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779270266; x=1779875066; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRg4MCwFnvrNqRvlPfGDLk8MzpC0OLCTk14CpKVfvfo=;
        b=FM40lsjz5iiemDB8L0vG6MBwyHqB/elKzq5DZQmlTaZFeGGzBy8uCuN22am2Pn2B5G
         a1seEc61LNH8Tp2T1LI+5hAKbp1RXESrhGwc1qoXgh4lOgLLZM2R1dzw2ddz53axNivh
         WOHi1mKb7th6mMmWh34kmxcmYENVhDk8q5y/tZb7KbTiejIupi+Ak0F1GfRngZnp+45f
         RajMkJ5rwPC2R0GaK562eL+BgJ75BXTxwbbLz2xPhfAx3paPwkZDZooIvftakgYl+jEE
         32Gfi/xw+64oPK3iddaBdJQkp5RzE4Ug0DxTQSa9uDUD34xzv7vocwkQk32bBl80DjtX
         +Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270266; x=1779875066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRg4MCwFnvrNqRvlPfGDLk8MzpC0OLCTk14CpKVfvfo=;
        b=pxRTbRyGoFkTbjukiBIMdDh1z0L3EbIK5tJ+BVNhhtFLmYKIGxg2GslOGvsvD8Oncr
         8wSkHShyG2EnCLbExHow5VLf2bQ2V7LZD8+EiF4zjNBsILcFJK6+vT1/NKSWuxXqckf1
         Ft16otNjbhHMV6fj/6ZOGbh2ZiQqqmBx6V8Ya6nN2gmqlBfNJruhRnQL2tpVZsCErYrR
         +iFym9l+b7JJ0SsyDJC4DEnaCaO5Dst+M9ASKcHUCk28/VS8wgHzH9Qe8VWAnQOAIZ/s
         3oZV4UPEdoary/6jId39BjevGeP9eMmSE8S6biQCGg1QTsI92kbSXiLsvoaKmqv2VMOH
         Ks+A==
X-Forwarded-Encrypted: i=1; AFNElJ/YMWRSb/2yOB8nZUR2ePBkY/+tKVnXf8nWee99uEg3B5VuPE5QjYcBU9q448SCM8RxiuDFJJ3XXG7VqdT4IP3k@lists.infradead.org
X-Gm-Message-State: AOJu0YwArGcCOIJCuaiQFEXsOpwPlIwP2rnlwmsJAie4H+FlGw3hLPKs
	6RSQ67FPWTnp5X5O+fhhug4+sq20xoKnF1C50g7lOuX4bo61j2H/Ynee
X-Gm-Gg: Acq92OFlofnHeFFAS8QgS/WSt5H+8bBIm8kHKhnHzKSXe7ZqmV3BWLy4jVxpFLe3YzK
	P/NhNnjUfSvOYVoqe8WQ6df7EmuJFQz6GsMmEyMtE6S8M/oeHX8VJeQlRQZFCquR44Z5oj61MPq
	ONgwYR0Sug6yGkaLktEUXNxafvsomSdzf01LlDlICEGl2XExoOVXG/ygzASl9GDbjT1Sa2zark0
	NZkeISSj6UUNZkKvpxxnp1hNvj8aDAK2EIml99ic/UvpvIGA9XS5I6VzXRsibuWg0kBxaPDa3DR
	IyEpfSFzFu1Mbc/CQVIlmeuD2qpmC8xIYVHIrZq7ttgjH44//HsKLqICaeHAHrGw7pmC/keN4iF
	SeWhlezeAmlLP6RsaUKYQsav5BtPd6fU8sfH/+DlAkty57VQzX7Es+YZjRkXpp9k7VQ9LmvJKBR
	0=
X-Received: by 2002:a05:6512:318f:b0:5a8:8de0:4576 with SMTP id 2adb3069b0e04-5aa0e764a87mr7000628e87.25.1779270266285;
        Wed, 20 May 2026 02:44:26 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a619sm4807804e87.27.2026.05.20.02.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:44:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 20 May 2026 11:44:24 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2 7/7] mm/vmalloc: Stop scanning for compound pages
 after encountering small pages in vmap
Message-ID: <ag2CeHWDLLglCF7t@milan>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-8-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514094108.2016201-8-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_024428_623464_B12C29F1 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, May 14, 2026 at 05:41:08PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Users typically allocate memory in descending orders, e.g.
> 8 → 4 → 0. Once an order-0 page is encountered, subsequent
> pages are likely to also be order-0, so we stop scanning
> for compound pages at that point.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index b3389c8f1..60579bfbf 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3576,6 +3576,12 @@ static int __vmap_huge(unsigned long addr, unsigned long end,
>  			map_addr = addr;
>  			idx = i;
>  		}
> +		/*
> +		 * Once small pages are encountered, the remaining pages
> +		 * are likely small as well
> +		 */
> +		if (shift == PAGE_SHIFT)
> +			break;
>  
>  		addr += 1UL << shift;
>  		i += 1U << (shift - PAGE_SHIFT);
> -- 
> 2.34.1
> 
Can we squash this patch with
"mm/vmalloc: map contiguous pages in batches for vmap() if possible"?

--
Uladzislau Rezki

