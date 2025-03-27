Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8575C36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGH+RDQqvizTR7M2TT7xmX5Ot4Go2YXyV6Szdxe1HRI=; b=NZqGUKEhsNwXhj6UOPogBBAPlm
	bATC/q3+TeCMD2GkFExz4KME+rJ0bPmhrg/UEJIq9uECwkMF5EgIDauq0GPF9Txzcgp4X7HbCOZI0
	LvSeicBJmWDEMEsnt+IfsXH7c7Z95RxpmQkOtpMxH2dPoajSoEmU7THNqIE3HpzyggiaE6ZBCdmWm
	41EcPnfPJSeo0439+G7IbrWwV/0r51criuJhYZi0mfb8dIhwz5ZBYXnJCSYugRuBAJCZlVip5hc54
	8BEt4OF/3L1HdL1Yeb5PPgovBP6jcYkWNn4YD5GESteXpRyF0lpNVu4k1IROGpxyylB7Dn6WVMLn5
	C1HWVNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnAI-0000000B3OR-1CGA;
	Thu, 27 Mar 2025 13:20:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmvh-0000000B1Fk-3sIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:05:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54954fa61c8so1039975e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080752; x=1743685552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGH+RDQqvizTR7M2TT7xmX5Ot4Go2YXyV6Szdxe1HRI=;
        b=EK1LO2XV9sJKRt5rH+CSAtFeWsCCRmJzqoyCsZ3qAQRlTw+5xct+1Wi+atzg/icCRN
         gOrGT6l6+mmLP3e3Q5LbR50jcDyO/YZa5X9RLCn1r0e+x/YSt8I90RlYWMt8Ysqbgy2C
         myHrH7P20p++dcMKt8LJi57v/PdMAN0cLlAKljeMQBpttpQVOvBDiCcA9n9Kato6dd9c
         oF8mClbPtXnfirLvbWC6Rh8LT3M64NG/Z6t0jrYw8iNdIDFn5AXhe3XgYbYr2x8nVqB6
         wstYyZt7ODOBHQmFmwGzT9+jn/d35JW7BueIEscQpYra7nMCI6eaFbDcuxi5DBOnJelR
         E5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080752; x=1743685552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGH+RDQqvizTR7M2TT7xmX5Ot4Go2YXyV6Szdxe1HRI=;
        b=aH3ccaZHxcXtVda5m8r66A9AB7mb6GiM7oYKT77PSHjAcW+BgYDjXc4LyHV0pf7fm2
         3w0tdje68hd67LQMV0/pz8Kr96deWQeRGVVUDMYN219spAHGqS7T3szbpcQ/EAC9cIqO
         GWdisDbRbgAuUl5RZpamZCcKnPJiQG/pjiTXdxOG6hGwkXVzCMPfZbJtvnfm6qJ9IVq2
         Xkaq9QQaAs8Dq2G1NB1v0LHpqGcwEb19KCh3gbA2d268b4saNEnwsV3RY5Yk/8EE0tex
         xQk7Ehc8BNytmsKvnytytLuZXF9p8GvK/YlcjuoSvWNg/cOcNQrMcOXfisxyXCMp8lwT
         WuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmt6Q36w4rU6iXy9R1emT4L+8VO/P8beutfbQM0FXJd9jdhQ5DDSbzNxjqt+pAIWbW9uS1QQe0MMDvizBxvDbJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzve2kOPm2FYSMhEoeuDpKSguG2GLaGFBWI6aUjVwmDJOqWPDWj
	fHpc0q6KdzOzmeY8ifhWPuhbCUKIQ0u7yXF8jKK9qkf1Xf0m5lNR8gQ4kg==
X-Gm-Gg: ASbGnctAYd7ENSbOfn1uLaALlnkKhvzx/JAKn5v3PYIU03axM69WkrVkPGlTa/77FU/
	pRD3vQ/3MgIZ6o6oH+ju3h/FBKInFFv8tF8cB8ksFh9XNeZJ9dkzg+b3pAG2fex/PjM9Pkxx/dv
	bmL1qAUoHLb+cT4KzvbjS9O86ReCR4g8zCkuDsIaLBHkmDcHDlCPllbO34CrMsFRW6DlRwmCuVA
	x4+wpJZLF2PmGOeeu/JwWCqXuI4m3QtNC11LRBwgN6EEIAdB6iEytqvCz08C6SJRZS3+e4qigtF
	UPhXauJoDIOevAGSS7ExNijbJ0tx1FyBY70XspDLn6xv8c13VJh2rV52RtGhrxRiESPmXbi8Hqa
	0ZDFIvD937w==
X-Google-Smtp-Source: AGHT+IF1ll9cFaCAoJWAxGR51kEPmHYKRptVRMXGOLv6BMKpLV+455ArQUeHscuizCmY6sFulZkafQ==
X-Received: by 2002:a05:6512:3512:b0:545:2d80:a47d with SMTP id 2adb3069b0e04-54b01263b2amr1059877e87.44.1743080751766;
        Thu, 27 Mar 2025 06:05:51 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64689eesm2075567e87.24.2025.03.27.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:05:51 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 14:05:48 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] mm/vmalloc: Warn on improper use of
 vunmap_range()
Message-ID: <Z-VNLBWc_LThvu9k@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-8-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-8-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_060553_965257_26E7D32A 
X-CRM114-Status: GOOD (  25.30  )
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

On Tue, Mar 04, 2025 at 03:04:37PM +0000, Ryan Roberts wrote:
> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
> pud level. But it is possible to subsequently call vunmap_range() on a
> sub-range of the mapped memory, which partially overlaps a pmd or pud.
> In this case, vmalloc unmaps the entire pmd or pud so that the
> no-overlapping portion is also unmapped. Clearly that would have a bad
> outcome, but it's not something that any callers do today as far as I
> can tell. So I guess it's just expected that callers will not do this.
> 
> However, it would be useful to know if this happened in future; let's
> add a warning to cover the eventuality.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a6e7acebe9ad..fcdf67d5177a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  		if (cleared || pmd_bad(*pmd))
>  			*mask |= PGTBL_PMD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PMD_SIZE);
>  			continue;
> +		}
>  		if (pmd_none_or_clear_bad(pmd))
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (cleared || pud_bad(*pud))
>  			*mask |= PGTBL_PUD_MODIFIED;
>  
> -		if (cleared)
> +		if (cleared) {
> +			WARN_ON(next - addr < PUD_SIZE);
>  			continue;
> +		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
>  		vunmap_pmd_range(pud, addr, next, mask);
> -- 
> 2.43.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

