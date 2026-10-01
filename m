Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F828CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZXyBZOxPP9aVP1iLcONa2ADo5uyWcMjFEkbOU3Yh9w=; b=qLSei8DJFpdhDEaG18Mp/oxPp1
	tPR2fmWGPJUq4qGeG3LWDHNQrCD6+51uP8WBxEX1XrvZD3lAD8YNDvWu7rvlRa6bzCtMa7S8kDU8V
	Sm9PomBnr0MryWxHFWg0tyK3cHenMfF4Ax2D/Vyb0x4taX9r47oLk9DzDTbbBUJFG1FaEoQ4ocr/G
	R3udHR1Z7XDjlF8akV/vWQdPxczG6yVLdgWik9dE8lRzAl0ISd4BxzalWlrdcpgmwzeSqlfbZxK8m
	lGd47QhX6z75tmYoGKMcolwIOPLSJF03DZydeueuIC16G8rMY4Mzgb7S3e8s+3h4lhZfPYTZaA0t6
	vbOF6YaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ9D-00000009cMH-1Pot;
	Thu, 01 Oct 2026 15:56:57 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ8p-00000009cIj-20mr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:56:33 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e1195040aso385399166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870174; x=1791474974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZXyBZOxPP9aVP1iLcONa2ADo5uyWcMjFEkbOU3Yh9w=;
        b=EWQ76RJIQD8ASyOpAUlAVcE7M4RUkP2RmQ76LpWvRp31/r6YfFhkZotG2M61V25o1L
         K2Nj/B1QOp1O6FslJPs8jlTkDEWwuyYHv3Rr39mUjBgUOYIR6tYp1WTV5OCwzsPWNmOk
         S7rJyAXptRmt2LqNPLm9QN0baWR5UHczYICoG7M2hC/GIXVTBRJPvcOqVEDv02Xkr+Yt
         X/dnZOjykT1UApassRBRqnCZupb4QwW9+G+1ctlu1/kg+/Ae0qfAqiUc1hSDsyXL+Uff
         19hbahqEkJyQu09LKPf0PDscOuwRNyc8VO9Yko42Dho0pGlnkn5eV+FWHLxN0O2Otjx1
         aCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870174; x=1791474974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZXyBZOxPP9aVP1iLcONa2ADo5uyWcMjFEkbOU3Yh9w=;
        b=cNle+K8v0iHwzEtQhpbMyzSLZCqFvav9BiKjU/Zf2bhH3ncbtTe2E4UJ9SkIIPYEdd
         1kPcoxWPeE27uKXKxSmYDln5o+HJHSWp+Auq6lubE/1Ubr9w4Fu49MDx6od6e3EciqkB
         6d11DePobStp+khBNr5Kq1cAkXcy/AyaQpuPcFT0bCphhjrSQ/+uqFLSimPrJWJYcwbi
         VmAajN2uKRAvN2D9eOtRAiCelT3T5vcNcb1p5LxhP0Xwn9i6G5HnXp/0DgVBjpv9HV4u
         6KPknk2tnJhJPfWeiiSskUxH8MM3lVp+Bl8z9q8PkDHpiiTudWXJNZt42Tel8fgDXXY8
         9sSg==
X-Forwarded-Encrypted: i=1; AKwUvBxWmY8LkHhgETc+a2WZsk/0LeiCnqJNVZ7gZ/2MMyVayxtIlK1iyW+PC60U1PM6egGdURnS39WGlFP7AdQl/cfx@lists.infradead.org
X-Gm-Message-State: AFuF++kBWQjRxq28ABL3wZfX3711xm5Z7Z5uUKHemX4FE6+akhli0v87
	LO8dY3pdENUuiXgbZ4ykdWzUkTQ+o33q3RZAueWzivQrP9ryyM9XxNdK
X-Gm-Gg: AYBFou1snCJ6zNw8xhn6KvB7xFr9J2qlcUXhwonCWCd8HevQ07pl2WxuWxz60pfRpAF
	wNmZFzEsO8MDp9wmq5zyqWygamOQ7+ccmoKXlucPzAh6eNxMoosPjVjl+mL7vU+FtHaq29RckF+
	6o2G4HbCHiKirqm59kMzclwjEb7mr8Xny/rvVan3JoHF4lOQcF1kdW9TIf8xWy/T/nI8Md3zYty
	21hkMmaL8n6ir/QvfBItiWqvW3ZNKd7Gk6O7yJ2AjibCB11R4KSJpw3AbmWlug6EpIGvcB6UYsF
	+xWx6sAAttqb/1VsrOGxCZ7vc+lWe3FziL3xXMhju9vxVt5blKwvBGB+F9dv33tqiW368da3i43
	2GqgKdZ5tUTuHTWrk5Hncbz66KQq2z9iZC3xKjOf9goqvBArrUc5QlsjVHbi5of3ZF/3O2kLHWK
	yR7sgznQYpdRgV1myRRSYcCNbe+qyL4LfREHs=
X-Received: by 2002:a17:907:96a0:b0:c26:3566:5b47 with SMTP id a640c23a62f3a-c2e4ad55c07mr1700466b.12.1790870173588;
        Thu, 01 Oct 2026 08:56:13 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d96628sm181851866b.62.2026.10.01.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:56:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 1 Oct 2026 17:56:10 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
	leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	rppt@kernel.org, ryan.roberts@arm.com
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <ar6CmpPkwu1VgZ22@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-6-jiangwen6@xiaomi.com>
 <ar0s14p8KPgmDKmR@milan>
 <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085615_550622_F020BE57 
X-CRM114-Status: GOOD (  31.14  )
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

On Thu, Oct 01, 2026 at 03:55:44PM +0800, Wen Jiang wrote:
> On Wed, 30 Sept 2026 at 23:38, Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > > blocks, reducing both PTE setup and TLB flush iterations.
> > >
> > > For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> > > multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> > > mapping spans, not HugeTLB hstate sizes.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > > index 4ec1acd3c1b34..4053b1ec1902e 100644
> > > --- a/arch/arm64/include/asm/vmalloc.h
> > > +++ b/arch/arm64/include/asm/vmalloc.h
> > > @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >                                               unsigned long end, u64 pfn,
> > >                                               unsigned int max_page_shift)
> > >  {
> > > +     unsigned long size;
> > > +
> > >       /*
> > >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> > >        * aligned in both virtual and physical space, then we can pte-map the
> > >        * block using the PTE_CONT bit for more efficient use of the TLB.
> > > +      * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> > > +      * capped below PMD_SIZE.
> > >        */
> > >       if (max_page_shift < CONT_PTE_SHIFT)
> > >               return PAGE_SIZE;
> > > @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> > >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> > >               return PAGE_SIZE;
> > >
> > > -     return CONT_PTE_SIZE;
> > > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> > >
> > Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
> > comes from? I think the commit message should be improved in that sense.
> >
> 
> Hi Uladzislau,
> 
> You're right, and the "half" is a leftover that can be dropped entirely.
> 
> Before this series decoupled vmalloc from the HugeTLB, the value
> returned here was fed into ilog2, which reconstructs pagesize as
> 1UL << shift. That forced the size to be a power of two, and PMD_SIZE >> 1
> was then the largest power of two strictly below PMD_SIZE,
> 
> How that pte_set_huge() takes the size directly, the size only needs
> CONT_PTE_SIZE alignment. And this function is only ever called for
> a range that the caller has already confined to a single PMD via
> pmd_addr_end(), so no explicit PMD cap is needed at all. I'll
> simplify it to:
> 
>         size = min2(end -addr, 1UL << max_page_shift);
> 
> and update the commit message accordingly.
> 
Thank you!

--
Uladzislau Rezki

