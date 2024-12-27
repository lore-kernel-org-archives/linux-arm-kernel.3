Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B99E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=; b=Qh6pS862obOUgosdlJvVjGJarq
	LqlC/fq8EaQt3RrSaT/ifJmf/pW0tiPGCdKSJD1tSD+2jQeDwe2ezYJi0P9HzczMDxo8ZlLqmXaxw
	GagB4vZxjIqi266FaJCfhgPCG1JPf0dIYAvwuVTVu1GZ89NQ5fRqrYyYZFduEuMoP24lxqID0m5tU
	30khdsMRX2WyXDt2gCgfuibgD+jFO/d9cfEKbRXsIju/tymNBS5onZ6SiByVeKP3jq+HKAvSps4C8
	Lt++ejUlTMetu5+rVO/e+K+WOg2fiL7BeGbWsN2qFFW4mnLJ2kIsvPKJQZIAoBQZ9Ns9i3t7/APgO
	fh0MTzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDOz-00000000dCn-1OFW;
	Fri, 27 Dec 2024 16:41:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDNn-00000000d1t-34lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:40:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21683192bf9so93579225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1735317614; x=1735922414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=nhGfAHd5lMV0MYGeDcMxR1IelDmZrIHLKZicdttrt7vLC5yaxQQ8+SOBH9gUaaDnyw
         Ebf7HgqGjMMYbdo4ZUEuO+aiiLw3fiQazpkLxT/Xbgl3KXrWY4q5JMbThQLS25PqUY5R
         VGLOlettHj7jDgvHAcIf0CqCPd+B8DQUHZgzCqsmiUjALqOjUhlgJaD3Q2qqiS5GaBHW
         B3H1SWcFrBdb0Kf8VCLQUlEr6KrLGNO7CZmGo4YYKTm4n0iYymEV0qb3pUpg0Co6eBxG
         jm9j1YFXWqf5Wg4InolNPSbaEMTDTexjGHFurHq95rZI2y9ng0js/sqhJZL22PrScJqE
         A0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735317614; x=1735922414;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Xw2EJnY1X4WK+jvdY4voHsewcHZzxXdmJCqhZbsvE=;
        b=UG66O+eEYlxn+3U/1VO6btXNg0CAPpkXHgwY4j/Dq5y0nqlaRoP88o7d7cQhSVVkWd
         PIKSK4n6H+Nx1y4zryI8Il4fbaZ0ebs0xAEhf2QYomPe5nOHIs553h7T3YrpkKj5G3jS
         Ijq0T36b47fedIpfPYzhLZdg3pA9mTmBWtADFLtg/DS35ZE101A5u+4xGhX6LpZokT5e
         OdiFLqbcw9HthG+z0kxqyzrYlbm62ayBYROlHsp8l6LRoyGCr9iITgSJ4DlYe5dH27Kk
         GorOZ390Tz2c442WyUVYMijgD8bbyHFuoe0wQXtQ+azK44c4UPMWbqYV3ZVN9JQqQE5q
         08YA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzS3Crf+fX8REy+bKKgU5S2bgK/+t8aFnIgzvmPvo9fu2FcbXFIxp3ZcMMAPSjIWoetYtZVA7kYRQk6nYLNvj@lists.infradead.org
X-Gm-Message-State: AOJu0YyW1+y6fVUQYZp372pXnVj9ClPpd7Mddi/TU/vBB35oyqxaWOuU
	rryLoDz1Rk/5Xf2093S5uVf45uw9ykp7WpqU7w7fZ/VWbZq7itdetK5TL6XAB8g=
X-Gm-Gg: ASbGncve5A+6OkIlX4/1F3FGAh6vrW7OtnIiPkhun0HmszEMi4EjQeilvcTqbQH7pMn
	LQ8h7prNp6tdzG6mhQhYVGUqPWbcp6iaMlOqbfpdQwSCM/tUDtxTIfzPIp8mDj8QBF8aU7cwkNL
	Kjdtvh5rven10T0FQ5daNRl6E6qoHIdu3+bDsfxGK4HL30siy7bMkc6WMDCIjbAQlGIsvnmUHnT
	5lv+c5XTKpg2zL/jXyFid/eEa4DfXF6Ns5fTZIcqpyh09lTbQ==
X-Google-Smtp-Source: AGHT+IGj5bTxRBL/TPC4rp9UNK8vWD764vaF6GBCxeBJ0bzTi0HACd7gUMrcV8Bcwh/Ub684hrsLqw==
X-Received: by 2002:a17:902:f645:b0:216:5556:8b46 with SMTP id d9443c01a7336-219e70dbcf8mr427204505ad.49.1735317614352;
        Fri, 27 Dec 2024 08:40:14 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-89eaa1c4fdfsm7512714a12.60.2024.12.27.08.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:40:13 -0800 (PST)
Date: Fri, 27 Dec 2024 08:40:13 -0800 (PST)
X-Google-Original-Date: Fri, 27 Dec 2024 08:40:12 PST (-0800)
Subject: Re: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
In-Reply-To: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
CC: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
  tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
  willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
  akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com, Arnd Bergmann <arnd@arndb.de>,
  Will Deacon <will@kernel.org>, aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
  rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
  linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
  linux-sh@vger.kernel.org, linux-um@lists.infradead.org, zhengqi.arch@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhengqi.arch@bytedance.com
Message-ID: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_084015_988645_1D15472F 
X-CRM114-Status: GOOD (  23.55  )
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

On Mon, 23 Dec 2024 01:40:48 PST (-0800), zhengqi.arch@bytedance.com wrote:
> From: Kevin Brodsky <kevin.brodsky@arm.com>
>
> {pmd,pud,p4d}_alloc_one() is never called if the corresponding page
> table level is folded, as {pmd,pud,p4d}_alloc() already does the
> required check. We can therefore remove the runtime page table level
> checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
> the generic version, so we remove it altogether.
>
> This is consistent with the way arm64 and x86 handle this situation
> (runtime check in p4d_free() only).
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index f52264304f772..8ad0bbe838a24 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -12,7 +12,6 @@
>  #include <asm/tlb.h>
>
>  #ifdef CONFIG_MMU
> -#define __HAVE_ARCH_PUD_ALLOC_ONE
>  #define __HAVE_ARCH_PUD_FREE
>  #include <asm-generic/pgalloc.h>
>
> @@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
>  	}
>  }
>
> -#define pud_alloc_one pud_alloc_one
> -static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
> -{
> -	if (pgtable_l4_enabled)
> -		return __pud_alloc_one(mm, addr);
> -
> -	return NULL;
> -}
> -
>  #define pud_free pud_free
>  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>  {
> @@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  #define p4d_alloc_one p4d_alloc_one
>  static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
>  {
> -	if (pgtable_l5_enabled) {
> -		gfp_t gfp = GFP_PGTABLE_USER;
> -
> -		if (mm == &init_mm)
> -			gfp = GFP_PGTABLE_KERNEL;
> -		return (p4d_t *)get_zeroed_page(gfp);
> -	}
> +	gfp_t gfp = GFP_PGTABLE_USER;
>
> -	return NULL;
> +	if (mm == &init_mm)
> +		gfp = GFP_PGTABLE_KERNEL;
> +	return (p4d_t *)get_zeroed_page(gfp);
>  }
>
>  static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Are you trying to keep these together, or do you want me to try and pick 
up the RISC-V bits on their own?

