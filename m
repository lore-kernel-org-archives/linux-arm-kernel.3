Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3584BCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=; b=NpXwLfnsln2eKJWsKqeC1isWnS
	HhBwpfWK67cpxO8lGJYwI9RKvgYOwvVG25ctKvsZpbEk9svvYgEOCGCbV8W0aDBXkH2bHKlaiY9xi
	GgOXLMPRC/OR3KmNVuz781COxhMD39R8R4IN8wYprBGNLrukgnBC57B8Xhdr1pu5eeLYjd/Exzt3d
	9kVIfel0X/Swl2XQGVB4tt3SIjcOBQsDgYfT6XtP1EcuStNJEMrYPyIWCoTc1CGsFwZknYkjTGIMz
	3S+9fEjVU7LyLqGcNFRXj9SKjaC10FI6iNxUeutupSGiO1OmY6qz2utKHswA+Q5f/riDyfEF7avHd
	UhZo11mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBe4-000000084La-1xvq;
	Thu, 01 Oct 2026 07:56:00 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBe2-000000084L6-1WzG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:55:59 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3920so46617985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841356; cv=none;
        d=google.com; s=arc-20260327;
        b=PvxzTTrwCJTdttxV/zLT+DoInkqy8KaqNf61WfgrpdSnef2SpWODV2xUbyRccFSTJ2
         uDi4Ke34QCGBRQXgmBC7/uFlTJrrac9NXBYjYcfZGDzddsUT4XEiJkIrVCUHFbPaYh0K
         kprwAbXP4jHc4E8OsQ/Dw8HFikJTMC+PcDWWjiY9GXMZfa/JbZDvRR4K5HBNDZMX+ixJ
         uQ5eHuniaQlFxADO8dgich4Hwjc5BIXv5TrPPecg2oSMrE+aRt2BoCPQ4YkDdfHBY9Lk
         0KXFi4Kj+EGhGvc+mE27GDcIMe/uMAYL299pTmjybEPanUq7RPfX4UmuSfILPphejEoH
         tjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        fh=Tc207Q6kie4Tw9tGrrwAolpR4lE5LkkxjKG21if/30o=;
        b=HhTLm2kvRX1yWiXRBaWw0v4DWvXMDYACRRxlm5QCMlDA6gJxiNI5G6FyKjK2o++0jG
         2cHhRrqtAZrl+KxfW+TFcr9QcTIiq6TLd73tfOPGRGmQHDPT3oddUMBOl3nbyxMoSfAF
         GSeWxczTLTGS8AMkNuOFHaKuLiGRxvGX+Y8jJ+/Yi/9UxPtwTr1/jJ4+JLZj8FQeTUQk
         DqWLEAkTAIDQ05SIpH6177aWU3/4itP83Pe1tJr9KWvHX6Une7sgcps8LMwYOziSoQv7
         /rdArUIEabi0XGY6ilMwoDbVU3zgvVwCLIzV2cKs6mMZMMAmRNrQyYsQo6bzQ1wOypLe
         ltQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841356; x=1791446156; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        b=IUpfO2ldc0kVqu1lIUKsgyuzqwFArJyZUzgGKLzenPNh5NFWqBlC0q1KogI+ZfmRji
         oc3TsiftqlUf04Ijg6lHyJmMhCTThf53q3sZu7IDUa/1AiEIsgMFneClHbg/u6/PBK5x
         z2BMtqy0wGxPmXpbS5q15PYS8ZIwDkRPSb0ffQukKaHjIYy0xjCxNLrGy8dnsz2Cbpr9
         AKzgmpEOGYN+GWa/E+wqsQ7Edmj5BazTWRfoL4LX9sw09pAzSURNxCIrFpurJrkPeYqz
         L5RJrG6K53WNC7cjC7x8IzrV9MMUdN2gk48SiMQ3+XBdHZ9A3r++gCafaO8HEbBUwiiY
         bwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841356; x=1791446156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1AHrAL5m9r+wBvSCXVxM17eZGx8eAClbgj8DyTpgrNA=;
        b=vgasO8aSJ1kuJYP4wI7TKncOk8YgSCzDDHQyx6CWL4a8hPYjiD6AQN84HuRILEFtYC
         eYi/CQMql9X+/gZWhlzs7cj3zJQlWEBJky9xatzf9YLV7zZTVn9xmLECv1LtderCTkVU
         peiAgOUlEuhSoVl0Q3/sbd5m6mXg/3FoQgiJcU+aFhGd8I8JrdAw+SB1CyQJtCpJOAez
         ZQBoqYY7sYaWat+KbViGwNJ+1vsXv6f7N8d/22qAaPAoyt3ipEVW0ZaOJcFcLdQxma8H
         OHBesvwMDpDYRPjC6tiS8S9FMpnU05kjiS1tkB0qJZlsIfX2lWn2wGqUbGix5higXqGk
         BUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3xohZgb29R0MRcm+nQA7kMTWkWX6tytTXiwwAEzM0vJI5ButdKDN3DelJq+hLbxL7s9W30dfkEnR63DdTU1bk@lists.infradead.org
X-Gm-Message-State: AFuF++kzRloDzUFHWwFGTtb8blZ2qEzNYu82Z+jNlW0NzgawMwZ+a6HX
	DG4tLyhDxXJnoaVAUAPBLhKvV9J6a2zCxS8oqlJaKuH8NBo1MoHJgsILX/niKyej3gXBoY6kHcd
	yLY0QNOtAX5ESomHdDSzjguPaw3tM8t4=
X-Gm-Gg: AYBFou0mzwy89/ELRUwfQ2XA7MiUaTJ7yCcZBEzZkHV7Y1ImZvBSNU8al1ItjKc+D6C
	EveHosU9voGxZvyhErbolNTt6YcgBePKEbDZ3dmpSGAGPB21663rwlC/+1Qyd6GV4CMaMbR1WyL
	57BX4056f+1a6XdM366VLUFY6ME7lX6u1zn4KoB9vgMqkcFohCK1gjDsidMT5X3rH2FbS2i0B9s
	rFVxh2vzwQQE1ugxkmWY63j2fhRK2F/bjSTs3PV3sOY5zdFNa5FDUKaQxKuEsWLLTZ3FtXlf0YW
	UyqKRn74j75CLzGcx0zc55LsC/abOq9uxQ3p8X7ae/5IAEGwRiRoA7e8uA==
X-Received: by 2002:a05:600c:5020:b0:4a0:1efa:c746 with SMTP id
 5b1f17b1804b1-4a01efad733mr26833895e9.21.1790841355651; Thu, 01 Oct 2026
 00:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-6-jiangwen6@xiaomi.com>
 <ar0s14p8KPgmDKmR@milan>
In-Reply-To: <ar0s14p8KPgmDKmR@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 15:55:44 +0800
X-Gm-Features: AclHuK_wExzN3hq35-9mtJ9Vi_bHjI_pv0wB1wZZplKSMEZ1VOjoAMFGpVzuuYY
Message-ID: <CAHKocdEF3RE5FA+LPRf_E0ns02a5akvUDKvSDvERoyTryV1X6Q@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size()
 to batch multiple CONT_PTE
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_005558_447626_F913877D 
X-CRM114-Status: GOOD (  26.58  )
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

On Wed, 30 Sept 2026 at 23:38, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> > blocks, reducing both PTE setup and TLB flush iterations.
> >
> > For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> > multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> > mapping spans, not HugeTLB hstate sizes.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> > index 4ec1acd3c1b34..4053b1ec1902e 100644
> > --- a/arch/arm64/include/asm/vmalloc.h
> > +++ b/arch/arm64/include/asm/vmalloc.h
> > @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >                                               unsigned long end, u64 pfn,
> >                                               unsigned int max_page_shift)
> >  {
> > +     unsigned long size;
> > +
> >       /*
> >        * If the block is at least CONT_PTE_SIZE in size, and is naturally
> >        * aligned in both virtual and physical space, then we can pte-map the
> >        * block using the PTE_CONT bit for more efficient use of the TLB.
> > +      * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> > +      * capped below PMD_SIZE.
> >        */
> >       if (max_page_shift < CONT_PTE_SHIFT)
> >               return PAGE_SIZE;
> > @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> >       if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> >               return PAGE_SIZE;
> >
> > -     return CONT_PTE_SIZE;
> > +     size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> >
> Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
> comes from? I think the commit message should be improved in that sense.
>

Hi Uladzislau,

You're right, and the "half" is a leftover that can be dropped entirely.

Before this series decoupled vmalloc from the HugeTLB, the value
returned here was fed into ilog2, which reconstructs pagesize as
1UL << shift. That forced the size to be a power of two, and PMD_SIZE >> 1
was then the largest power of two strictly below PMD_SIZE,

How that pte_set_huge() takes the size directly, the size only needs
CONT_PTE_SIZE alignment. And this function is only ever called for
a range that the caller has already confined to a single PMD via
pmd_addr_end(), so no explicit PMD cap is needed at all. I'll
simplify it to:

        size = min2(end -addr, 1UL << max_page_shift);

and update the commit message accordingly.

Thanks,
Wen

