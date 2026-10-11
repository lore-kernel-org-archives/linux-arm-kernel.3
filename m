Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4685FCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X8y55PrXkGOudIsFCasLzIDfqrrSmuwJHtcshJbz80=; b=lDsGH/G6wBk3UwJFhwjwvAnM2b
	fytYzWsR8nUWByO+f64RMdPBP4/BEMnrHWJt9QklGbZW693Qz0oNmJplIQDt05D7Knez5/wrQV80a
	EGGdfl+xegZjZa3i+8S9n+QirU4eu5qzAfZkYQCfA1pPbR9y5hP2LbgiM3eIiYgWFcEuK5z40IAOk
	gGCKvhuhJr8goZEXEnfzvAXGXIs4/Jf2eiBSKDziHIIa+vz+MGjSxeuk7Ga9k/Bzw3PSt+CVzT0XY
	odRIdNqOwW5tTvpx9E+MW6+uD521xZpsnDy2QScUzV0ketIKZhOE5/45Xpx3JVPmgBUQDxTx6TDhk
	LUiTJdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtjo-0000000947G-2FCu;
	Sun, 11 Oct 2026 13:37:16 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtjm-0000000946q-0YtZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:37:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso124390766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725832; x=1792330632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X8y55PrXkGOudIsFCasLzIDfqrrSmuwJHtcshJbz80=;
        b=i9ZLCHQzuJYPZfNRZXtvFAkjHC+yhj6WDaXVgQJt01nG968mPpXJz79M1GZeh08S4h
         g3tEi86asEN7Zxj3BYlxMG6fWLsLDsXakxvLy+ChHhO+9dgGT3NsobziS6Si8ko7U3tD
         OMu9uyj9WsekFkVfP9AHPC8EtvBGZLH8D7qxjEXK+hrkuWdHVLiP3eWyMbocZaUtQGA7
         m/5uYPLiXCnhQ/vy1BbD6OgTR19iUoqMWQlQTtBVNwqxdyPXu5R2/xZg/y/g7vEwVPbc
         q5p4QmGs6QOdRp8v/5+hgZ7j07tMM1if6+K3am9u/G3ZGxjy32A120JTn0vF7Rs6hTzP
         7x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725832; x=1792330632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X8y55PrXkGOudIsFCasLzIDfqrrSmuwJHtcshJbz80=;
        b=zLyFvg/3A3+ZiJmVIGF0YiJSXaveJGw4yYgitroQ6i5priXQD04QwaaL7BHxdsduWo
         HBYKkkn8Z99RfsY5WIowbHY2uIfwuPkp68TBN0bTtcKqLYx8/1XVa1L1tW7LhAG+WM4x
         n62ccCHGX2z9bg7WFlkbsIByIFvkGtzDcKM1Z9JzaB5lNtBDiNQaWxzMnuq16kzlzKLb
         0WA3rL/cYUELCqh1jNBURHgjYKYq0ZxlT9lbrAEtJ6IFj815SYGR/rrnsW05uSu5OsFQ
         QH9/U8Ss2ga8iN51SVVKgFjRU1rF66KbNxjBbH/CoBmcNguTEKMqDVUlXj22dlM/Hb1m
         /Hww==
X-Forwarded-Encrypted: i=1; AKwUvBxUmzpny4uJxtc91zfVig6bPZ8l5YObe8sZDXy7baGjRvYMzIHGMjtY1qISjVs3y77GGEivLbSiaZY+ezqPN3k3@lists.infradead.org
X-Gm-Message-State: AFq9FYL1cxyVBNRT/Tp1VIBpSmpYYb/+NRevmvM2yIbh9911GD1Wv8Mc
	R4dT32zJc2hSOaZ8TSrp/9OdbR22yenAdEFCRAbSuytzRI1Ifpk5lHci
X-Gm-Gg: AYBFou3DoNVWCGkYqNFtXTOMlZN/CQJtuuossVydKnRl5v3rlHD+/pIVMvYuj/h1pKA
	hpB7QkPARinTgoxefv75RU+r/KWYC3bST8QjgdV6R29+sCrrkHcvPqJ3EJjAA6FJ88Iuygnsw1s
	gBf/sX9qjlJW9Er3zjOeVGBvtplYOPIEUq3BZrLLq9hGKC64s8kZ+JvLw9F4PGvXOO09RfQyk4d
	wDAr2jMfigPTg+DkWct9Hm0r70iCs6Gu8c0EkguYMHY0FxZNWVnM3xD4NQvtkXXC7AC/GNKhYVl
	hCrcYaLhzIWdHBa61t/itubQEK9xC01GqQ7jg+g1hUqw0EPtBIxBA5r5rtfWsA+rdXMjfIjDXYO
	4KZIaYZBWFmwaQ5dQZqwUHkoocoSG5g9qhIs83yIlsSumUXXl5eyYTfViMQERhpK6MRVGdUyeEE
	KGmN1znQnl44Dv0XXR8E3LOfKb4FZkkOv2PAU=
X-Received: by 2002:a17:907:3f8d:b0:c2c:d06f:cf87 with SMTP id a640c23a62f3a-c31aa0d3106mr668410766b.46.1791725832001;
        Sun, 11 Oct 2026 06:37:12 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7b976sm361047966b.36.2026.10.11.06.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:37:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 15:37:09 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case
 in clear_flush()
Message-ID: <asuRBRZS9KzC7Y8q@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-5-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-5-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_063714_189856_A373DFAD 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, Oct 02, 2026 at 05:09:41PM +0800, Wen Jiang wrote:
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
> 
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>  
> -	if (mm == &init_mm)
> -		flush_tlb_kernel_range(saddr, addr);
> -	else
> -		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -- 
> 2.34.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

