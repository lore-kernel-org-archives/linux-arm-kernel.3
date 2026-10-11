Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B309FCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMWKtk6aRSbfvQLUR3KyOPOC0cuhIr7sFz+mSYCpkyE=; b=mvtjiD6jFKPd2kA0Mze/btSxsQ
	CxR2mE80pm6bGvnjsfAUAleCK1hlpxv6R13XluvNgpy7NsaDqgEYKVHkD13tncH5nbl+dWxgjAmUn
	JyVVjhF51IXM109hUXe2NCv0Mbbu72aq5uNV/b2f6uKKH8NSCS2mbllrL+D+GiT6bhMtbIArUyvKH
	6NguHkb+q99LiN4o2Qy5NgyzKuQvpE846wbBIyzxw7xAIckKDRqRegTeJpyEQzxb01zGSrVheHg8L
	1sGwH96jdqQ+Wm/Egn2toQyUxVPoYO4npwgRTnyQe3aaMtNyWv5Dg1SHu95Fs7862yUMorX7wufOn
	c/TvrWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFq7Q-00000008u6Y-3zWd;
	Sun, 11 Oct 2026 09:45:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFq7O-00000008u5Y-1zz0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 09:45:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso108457366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711920; x=1792316720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMWKtk6aRSbfvQLUR3KyOPOC0cuhIr7sFz+mSYCpkyE=;
        b=nXUCW/FmLp4FmDg8P9lulX+k+HgN486teYCA2p0Rs6OkT69BE4of/6ocId/XHd8In6
         /nN+biHXH+lSIzod3qdh5u54HNDpcQ3baEYmSN/Ok6Qv+u1fIDZV6TBE4F+gdzaqObNN
         0An7B6+9aygE8jATt/VCeuUi3am5Sd/BWxyigcC6X4kCOOMEb8k43vupFeTNmue2U9N1
         NDfRyK6Bdc84UXB5q0bGcZ0ww78dkOCHcR6MUHOPzG21hxgX91rdM3Q8no01WRtE6Ivb
         kl6cECMYx/3PgVpTKlSEzaqhIC62r+JAJ6Fh09J1anrBHIBfiYfY/0wPCGpExVj/u92S
         kiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711920; x=1792316720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMWKtk6aRSbfvQLUR3KyOPOC0cuhIr7sFz+mSYCpkyE=;
        b=JFC6lnxQugkZhxhDgRn67e9HGTXzwLarIcZYBCzzYN6YMMygP45v3D/VPF3kMNFZNY
         pU+2mexfk6a6UOkDqbgjhp6V+xHo1BZT4PeHqg1O/cZLxcJQt9hgr1L4SvMi+5tsODAO
         iQzPkgvrdWeokDu29i4kAFhJ4ZJqbPP6fyRMKyDY/5TG9RlzCczenV9OsOXYSmo57dWb
         5mm8xmjTSEjAeeXJrul0kBVxtixti78pacDwlM1P4OWpeEgRIGRfb444FfFkpTJto/1m
         zDsf/LmVy9g35AhDCzcSoKLGrzYoYBwM2qDg/sxctZE2cCp2hwbN63E3sLBLjdNQCh5x
         SmOw==
X-Forwarded-Encrypted: i=1; AKwUvByGHImri7fnOqJMj1673Uz6df1BtuZ6gHeGtHmHE7CHjP8AIVrHEODzO0cVFiGulOdZK/uRKQ6PGpUyW0BQEkcA@lists.infradead.org
X-Gm-Message-State: AFq9FYK/Ri3lFKwmhivZAblsAcPpLTO2AWdaByja458Q3xbKYlYTq00D
	LVLaxk7zvS+dSgm9X2VJmG4wuuZGb+Agmts82emEWK/02pVPpu/CVt5U
X-Gm-Gg: AYBFou2HIVPPuBX6pr6/AYHVgi4t/WF3NyMej7BN0wk/Fepkj3wkGeh1YqWNBx11z2e
	1Mw0sFfCAxWW9x8WJbv/rMVnO5N/LZmUXytZxzhNohyJJ0SLhoxtgHpGDxK2Tnwj4GC3qTdNxVr
	wwVHUfc0htmlHi5FqzIGMxdFkUGkDNSW1d6BvBNSuJq9wHuV+mX7z35ydQfjq+TwLqf2MuVghs8
	Lr4De2UKiwooI4DnNYWyO7KmYeIwvI/AWFTQuqSDlZnjHH+2H9eW32UdzhcigRDwHTi0TmcHBla
	DilDPKWGeKxbX4nLo06XO7qWgxhCl+G5NMyPO0x4Za2DxgHRt5iuhRwUpz+qPCLYz13zQRGqfzY
	hf+NZDqLxVWxHdsgtSTjR5CYf2HqhtdjlD6TKy2tAimRVVvQ6F8OIgNWxAWgp+lfo0JsaXY/TkB
	Q+p5LZkJUq8KCn0hv6pYtmKiDZLspHQ29Ix3IDXmGk3B7Gog==
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr650442866b.21.1791711919938;
        Sun, 11 Oct 2026 02:45:19 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ad0ad1sm347200666b.77.2026.10.11.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:45:19 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 11:45:16 +0200
To: ryan.roberts@arm.com, dev.jain@arm.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <astarANeoldvqBxc@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-6-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-6-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_024522_533577_C8C6D1D0 
X-CRM114-Status: GOOD (  22.11  )
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

On Fri, Oct 02, 2026 at 05:09:42PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> Previously the function returned a single CONT_PTE_SIZE for an aligned
> range, so the caller mapped one CONT_PTE block per iteration. Now, for a
> CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
> that fits within both the remaining range and the caller's max_page_shift,
> so a single pte_set_huge() call installs several CONT_PTE blocks at once.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..c29704a19e276 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
> -	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
> -	 * aligned in both virtual and physical space, then we can pte-map the
> -	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
> +	 * virtual and physical space, return the largest CONT_PTE-aligned size
> +	 * that fits, for more efficient use of the TLB.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min(end - addr, 1UL << max_page_shift);
> +	size = round_down(size, CONT_PTE_SIZE);
> +	return size;
>  }
>  
>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
> -- 
> 2.34.1
> 
This is arch/arm64 code. Can you, Jain or Ryan from ARM folk review this change?

Thank you!

--
Uladzislau Rezki

