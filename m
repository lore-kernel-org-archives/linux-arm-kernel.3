Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23944C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 02:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKnWx5LrBtIKgWAbXgiWOXDWrG19qs6MsR+rTdIDWJM=; b=d+HUEWicx5jDu5pw6gqIgpmfqT
	vmWbrEzE4w5AxKWx5io+5w0O2EPaMl1Qocr95hq1w3GITH+t2DpogUMnhZ7i1RyqsQGMAl55uBy1V
	u6l1SwpyUwMW/N+zWwcJ4uKYa5ZQMBMSgazfuTYpvVV9QA9AhrMyJVpA8TUa22op+rfPUltBC4ro5
	3EyNSptEFw8jLMjucwVzqWkV8bFywRq9+TsRQjmrWZDcRXetVnVtBef+WU1dTcEAt3iyWbKHZwrsu
	pP7f2r8UU1qVeqkIAi2w27VGOMwo3e1F6Ih5sasl5BfXyyepOXBYujzPZ5ZRIRV5P2qv/p0Zrv0uc
	g5K/cAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjph2-0000000De0e-2fX2;
	Wed, 15 Jul 2026 02:49:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpgz-0000000De0F-12nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 02:49:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so4265369f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 19:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784083787; cv=none;
        d=google.com; s=arc-20260327;
        b=NyxHIt3YAtrU/UtxAHzIprLu+sPyxcN3jsbt/HQHRRcrjDsWvg+lHc7N9tSX3GIIMC
         pr/aex3M6hUn8QAZxLOy+OwIi5ognFoslH8FgIzqBDHcnD6It4t70WMgejqS8RFiY+ll
         NH34pPbCHesAP2YqDaWWhScNcdYJySdTttt/yDcaF2GdqT3tF/TpIb2ewkJZKqFxZPDW
         86Ocmp+XTcbAK7pC+jWG6jHPIMcc6PgibuB2EMBqhYBe4BALO5u7P68IcFbjyg1WBZaI
         DYSHJ/7B9Bc16H05GxmXv0knChCKOnvm2Uz4bWYcygN5yab5e+XIQTzllpb5gd/yNVBu
         l+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FKnWx5LrBtIKgWAbXgiWOXDWrG19qs6MsR+rTdIDWJM=;
        fh=4crY0TtU5d8qj3zEa5iNx7ZkVcz8Bd9qbc096ZR6m3Y=;
        b=j0qMCn8fHzKveB1M8j8oVqvOu2a5OOfvqNqI08rQL10j+259KGSdM4uxf4zIgxBVXO
         J1fVPC7roum9s9hSReeYH1gTeao55vw6avOUfHtOHbGIGZBFu8UWKjBUA717HFOp7nfu
         U4R92PW94DJQLT8uOIY80TSCg8gsnGj7jkhb3m0JofPaq+TRyDKkqElu1iaQEpisCpqr
         Mzefl3oUGptF+wDdxiEMgaAn+q/77JZbpgJ8ms4MHwUvmBZuFOOs1uLKCtYtrniFPNbf
         YmdoRqyJIjpIfEFWwDaJE4+25C2JK/iK2rKvHbyHgzeQIolNFPTBmhJo+lRba8f8HTq1
         V4mQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784083787; x=1784688587; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKnWx5LrBtIKgWAbXgiWOXDWrG19qs6MsR+rTdIDWJM=;
        b=IO7InJCz4k16m9jkhJnPDXuPQQNMHAsZLvlxn5JmA++u/uB1ASxZejj5SwJ2vt7eSH
         KTS/UNRLB3RV0bu7uHwNvN6U4oZKi0NOo5xncWKTvXrrL8rjUMKmLwp++vnxrWsJIkSj
         NqzOg6fqgC2TKmuspIvC2u6KdJtASLg/fiQwzVhWSbUgIK/36dtSwT2dVthzA+23aQO7
         +/+wacc6D+w7WQbBgHXJ+o/f1ECIlZFW1BP3SKlcpWdtIE84SnNdpngVin3YkMjD1i+Q
         6TH7YIpnQHxBKyTY258BF/V/sRl6uneZDo1/m/6CBvtA4aavEV1CxbJXNuTcRpAfHfyI
         SxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083787; x=1784688587;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FKnWx5LrBtIKgWAbXgiWOXDWrG19qs6MsR+rTdIDWJM=;
        b=EwgWkdqLBBF8kCSoilkfUYsSewi5j3Ab15qqrk4wUphUXW1rvgRUAlJU+13p6DPgLF
         84cv87UY2xujtBC8moYKwwynuhROJjvO7mUSBkfHDmI9t2g4/6hDuT9qJ2SQvJwRBLAs
         Y9ocyCAIUXI+JUtg0ayGuJri/gL+5TGK+vSk0HBBc2HZ29d4dHdYhqLPKkDnhlqaTCzU
         NqD/fkBL+YxN+cgukFSSl1wt3WumY8vnKG+OAXPRVuhS0GSgBH+BNDz2ihZcIk6rWksO
         GCOOnlFDZCEfcy7OhuT1UjSUSUyOdSzL79LxR28rBXDGBDOUPazeWC6sGidHsJqN9oJ+
         f8iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfxlQjLsUFybGZBALAmztRk+QlLlyRXY72QBqqmSCg7vvSKsyWAZCGHoGU773l+xtssBHGXrWFlsXzayIMtZPV@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKKzU3montQ2sDtrRG9t4H9jWP+EU4UtN/NYDTagYk/l7vLux
	WBdglt6Ou2qnOFnj3ELlNhaoQkvuqIOo3GjGMgeBYBQRf7A32MCYOMYB6mQ1y2VOZBVqnLRv5Go
	c6hrb+GZafaYELcHuqF9CUITakdEVMNk=
X-Gm-Gg: AfdE7cnok2E4UhmLzUEfxzPYF2st/g5Bv/eob6VQToWjIV2kZHxzmiIF2fTn4h08pDj
	ocwA0Bcv8oNh0Kiwbd4ETC0iSXEcKelxMguWkaUo1MgHpAOVokZTWnZNq2dqZk8IZZWInFayX1x
	TSY4oFIe6i7I7V8ssa/8gvZ3jbJGp/3Pqic2foomzqsfxFZ8LSL7Ms0PG7gIeBjNtpwr752qP26
	eUV9Nxce+GTf+/zro3V9b3wYcqfhVbgeqriFfObgv2T48ciiftGYQgySdyXNq7NV6uobRF3ag==
X-Received: by 2002:a05:6000:4382:b0:47d:fc45:8589 with SMTP id
 ffacd0b85a97d-47f4fc6b180mr843449f8f.0.1784083787198; Tue, 14 Jul 2026
 19:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709073823.6643-3-jiangwen6@xiaomi.com>
 <bc4ab9da-0b16-4203-9901-4845323c3e5c@arm.com> <CAHKocdFn9DP=wGLYJrhndxTnxz=eMeWYjK1m2OzPotcvz_sVjA@mail.gmail.com>
In-Reply-To: <CAHKocdFn9DP=wGLYJrhndxTnxz=eMeWYjK1m2OzPotcvz_sVjA@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 15 Jul 2026 10:49:35 +0800
X-Gm-Features: AUfX_mxTQ2AORVdVLQD0WyKg_A5YApzG5_NgRHhzAQxuuwLcGmmwOTgb4HGKwEg
Message-ID: <CAHKocdEOveLGiad3pOFMNGEKec-wvnwY7w88-8k1Npm1t_YTcA@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, david@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>, 
	Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_194949_678650_8DDA6033 
X-CRM114-Status: GOOD (  30.61  )
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

On Tue, 14 Jul 2026 at 17:24, Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> On Tue, 14 Jul 2026 at 15:13, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 09/07/26 1:08 PM, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > > blocks, reducing both PTE setup and TLB flush iterations.
> >
> > Too little commit description for the proposed change here.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >  arch/arm64/include/asm/vmalloc.h | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > > index 4ec1acd3c1b34..7d9c7dc795c42 100644
> > > --- a/arch/arm64/include/asm/vmalloc.h
> > > +++ b/arch/arm64/include/asm/vmalloc.h
> > > @@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >                                               unsigned long end, u64 pfn,
> > >                                               unsigned int max_page_shift)
> > >  {
> > > +     unsigned long size;
> > > +
> > >       /*
> > >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> > >        * aligned in both virtual and physical space, then we can pte-map the
> > > @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> > >               return PAGE_SIZE;
> > >
> > > -     return CONT_PTE_SIZE;
> > > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> > > +     size = rounddown_pow_of_two(size);
> > > +     return size;
> >
> > Please do explain the fact in a comment that huge pte mappings
> > upto PMD_SIZE are being allowed here, if the given block is
> > CONT_PTE_SIZE aligned.
> >

Hi Anshuman,

Would the following comment address your concern?

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -29,6 +29,8 @@ static inline unsigned long
arch_vmap_pte_range_map_size(unsigned long addr,
  * If the block is at least CONT_PTE_SIZE in size, and is naturally
  * aligned in both virtual and physical space, then we can pte-map the
  * block using the PTE_CONT bit for more efficient use of the TLB.
+ * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+ * capped below PMD_SIZE.
  */
  if (max_page_shift < CONT_PTE_SHIFT)
  return PAGE_SIZE;

> > IIUC arch_vmap_pte_range_map_size() gets used only when config
> > CONFIG_HUGETLB_PAGE is enabled. Hence should not these new huge
> > sizes being supported here also be added as valid HugeTLB sizes
> > thus updating __hugetlb_valid_size() and adding corresponding
> > new HugeTLB page sizes with hugetlb_add_hstate() ?
> >
> > OR could arch_vmap_pte_range_map_size() and set_huge_pte_at()
> > can be updated for vmalloc without doing corresponding changes
> > into HugeTLB itself ?
>
> These sizes are not new HugeTLB page sizes. They are only vmalloc mapping
> spans selected for a particular virtually and physically aligned range, so that
> the PTEs can be installed with the contiguous bit in larger batches.
>
> Therefore I do not think they should be added to __hugetlb_valid_size() or
> registered with hugetlb_add_hstate(). Those describe the HugeTLB hstate sizes,
> while this change only affects how vmalloc chooses the PTE-level mapping span.
>
> Thanks,
> Wen
> > >  }
> > >
> > >  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
> >

