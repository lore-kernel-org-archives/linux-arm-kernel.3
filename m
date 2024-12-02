Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A9D78311
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3OJxeC05OEpKJXaqS/T7FWlvK5y/yJmdvmfj+hUxqc=; b=JIJ2q/ehe4YLqPFua1oWFWE+Ia
	V4AvnJ2A8tQ8xpuy1zc++FAybQY/fj1ZbuGzil9AU1hsoBcOCQVw0du6jGm+03fyVja1RU/sGA6Lp
	prDy5TjItqv/uXcHd8zGJcJTx6iSzuM96/7QHrVwYgTD/UF5dE+0GAtbcjoaCLinYxRt20ahjphwa
	TWK3LbEybVGf9s4C53RdxP9D7GdIJ63T7rZHB96DXInW66nmaeyMvC0NdteKdKFtR12uT8XUOmO0i
	fLNoKB7XIawcrQ7aSrOOTK3Mf4y5WBQwFMjcXSEnVEATb/MgCzcohjrdTdvwgFi2KyC8fGnPe6FEv
	6+SJwumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Is-000000062Kq-3RDq;
	Mon, 02 Dec 2024 12:13:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Ht-00000006251-0N8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:12:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so217465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 04:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733141542; x=1733746342; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3OJxeC05OEpKJXaqS/T7FWlvK5y/yJmdvmfj+hUxqc=;
        b=RAKaOaYiRmCl5vvDuUyFvc6Z5vA4f27Ac9p88VuNI0X37sN2y20dTg/1HPe0tW4tVI
         c+ASQHM0+G7oZNUKz3tpqkJ4b8of1VBYwaRza1kwjkz+asA29/7x9RcfANr3Dlz2zqqD
         Qmx+Ig2CEdqLCe/uzqExmaeVZvF0hh2izrGpsG6AdlfRZC+3v5bofM/rSp2edO3XtmyB
         ZDL2db3X1BF+rclIXExczl8CEJejSjHacy/tR9tVWHDhBNUchZll8SjgsWXw6Ysfnqzl
         7vtLBt68YFqsmu8QFlEyKCGDXGV/hZuL57vajzxYfUm9QfKa+KG17nz+Ic1qJ9wOWn4h
         EPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141542; x=1733746342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3OJxeC05OEpKJXaqS/T7FWlvK5y/yJmdvmfj+hUxqc=;
        b=dxmH3x/u106sSYWVNzAoVuRuYiRh/US0XpKaVVuMHFMKk2M+/nCYWiBUio9oQF18Wc
         QG6t0hTY+Mejw4xRe226IQBn+0HJ8qXpeN3zTC7PEBj0MDZdBnceAZ/eTVXm7sTGEMCB
         FrD6hWA1b7eFMf/bcuYp660aJylFiUzweQbJxJOne1sMh62Uej0pbvkSxh4ZKQ45kSte
         4ZBaykdf23NI5TiZ/e7t4VH6rtB3Mq8AnThcGkPGCLGJN8uMu9avEc2oAWRvqF1H++0S
         3UiCs1AUtKlb1V6TSIyEhFtMO1Sxj12O8e5L3qUN9xjO/6ctgiQukxidSby5WYbs0249
         +TGg==
X-Forwarded-Encrypted: i=1; AJvYcCXFlcuIgVUpmPvg4PNc/YeStR7naSzUD2rEj1dJvJcBmz4HcNJ44tPM6rfZlnrFeFOcQQmW5zKJlvNVaTp46795@lists.infradead.org
X-Gm-Message-State: AOJu0YyiHULg39lrrqt+4XdgjBhGhNY70RIc6/RioAeVwnga/QkGXDHx
	e/WHy2aVTOYsIbSbSoFGx7OWbMwnEd+7K5yVBQEehgtDOYrdanNLiT+klqHm3IYcJKTysHqoWsW
	vag==
X-Gm-Gg: ASbGncstp2dzYsmCGrc/9+zI8aLHn4ioUb/URb9o9HNATO7dtyb2xLMzh5+vm9UXpHt
	AqC/39drb2hePOXG1R/8dy5wp7ZbaPVAxK+ZGwSNd+ADpzyNx3wUzUuQfSr5ULujZoJftJ+nZ2/
	YssQufYrnSpFWSBeDkIlntVe+lDwMZpUDqSIvy+SwyH7BttUfJGDtSwB+IcqqXoGqBwLB+21IPF
	Tiuhu8F+suZlzkRAidMPw5+svH3XVh8tIqUlPk9ovQRkpgOMYR9hWEIxDBAP2FTpfdQtOdKshJz
	JF1xhPOfRtkx
X-Google-Smtp-Source: AGHT+IFWgNWQtw5nySaRT0MW3AbORF9BjBCT5+v/BU5F99S0LZr6LNKr+wPuDHwta/Ys4y0RVWD2ww==
X-Received: by 2002:a05:600c:2253:b0:428:e6eb:1340 with SMTP id 5b1f17b1804b1-434b0577f32mr4477205e9.4.1733141542168;
        Mon, 02 Dec 2024 04:12:22 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385deeb6acdsm9806424f8f.81.2024.12.02.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:12:21 -0800 (PST)
Date: Mon, 2 Dec 2024 12:12:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org
Subject: Re: [PATCH 1/2] iommu/io-pgtable-arm: Fix stage-2 map/umap for
 concatenated tables
Message-ID: <Z02kIaxP96am-P2f@google.com>
References: <20241024162516.2005652-1-smostafa@google.com>
 <20241024162516.2005652-2-smostafa@google.com>
 <CAE2F3rDyj8WohXHTa1H3_gqTndyJL3cUEfBnXCEibNo1oYTt3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDyj8WohXHTa1H3_gqTndyJL3cUEfBnXCEibNo1oYTt3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_041225_146967_E31A5680 
X-CRM114-Status: GOOD (  35.69  )
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

Hi Daniel,

On Sat, Nov 30, 2024 at 08:20:10PM -0800, Daniel Mentz wrote:
> On Thu, Oct 24, 2024 at 9:26 AM Mostafa Saleh <smostafa@google.com> wrote:
> >
> > When calculating the max number of entries in a table, Where
> > RM_LPAE_LVL_IDX() understands the concatenated pgds and can return
> > an index spanning more than one concatenated table (for ex for 4K
> > page size > 512).
> > But then, max_entries is calculated as follows:
> > max_entries = ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
> >
> > This leads to a negative index in the page table, where for:
> > - map: do nothing (no OOB) as fortunately all comparisons are signed,
> >   but it would return a negative mapped value.
> >
> > - unmap: it would leak any child tables as it skips the loop over
> >   “__arm_lpae_free_pgtable”
> >
> > This bug only happens when map/unmap is requested with a page size
> > equals to the first level of the concatenated table (for 40 bits input
> > and 4K granule would be 1GB) and can be triggered from userspace with
> > VFIO, by choosing a VM IPA in a concatenated table > 0 and using
> > huge pages to mmap with the first level size.
> >
> > For example, I was able to reproduce it with the following command
> > with mainline linux and mainline kvmtool:
> >
> > ./lkvm run --irqchip gicv3 -k {$KERNEL} -p "earlycon" -d {$ROOTFS}  --force-pci -c \
> > `nproc` --debug -m 4096@525312 --vfio-pci 0000:00:03.0  --hugetlbfs  /hugepages
> >
> > Where huge pages with 1GB would be used and using IPA in the second table
> > (512GB for 40 bits SMMU and 4K granule).
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 0e67f1721a3d..3ecbc024e440 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -199,6 +199,17 @@ static phys_addr_t iopte_to_paddr(arm_lpae_iopte pte,
> >         return (paddr | (paddr << (48 - 12))) & (ARM_LPAE_PTE_ADDR_MASK << 4);
> >  }
> >
> > +/*
> > + * Using an index returned from ARM_LPAE_PGD_IDX(), which can point to
> > + * concatenated PGD concatenated, get the max entries of a that table.
> 
> I believe the macro that returns an index is called ARM_LPAE_LVL_IDX
> not ARM_LPAE_PGD_IDX.
> 

Yes, the comment is not quite accurate, although ARM_LPAE_PGD_IDX()
calls ARM_LPAE_PGD_IDX() which is the problem.

Thanks,
Mostafa

> > + */
> > +static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
> > +{
> > +       int ptes_per_table = ARM_LPAE_PTES_PER_TABLE(data);
> > +
> > +       return ptes_per_table - (i & (ptes_per_table - 1));
> > +}
> > +
> >  static bool selftest_running = false;
> >
> >  static dma_addr_t __arm_lpae_dma_addr(void *pages)
> > @@ -390,7 +401,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
> >
> >         /* If we can install a leaf entry at this level, then do so */
> >         if (size == block_size) {
> > -               max_entries = ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
> > +               max_entries = arm_lpae_max_entries(map_idx_start, data);
> >                 num_entries = min_t(int, pgcount, max_entries);
> >                 ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
> >                 if (!ret)
> > @@ -592,7 +603,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
> >
> >         if (size == split_sz) {
> >                 unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
> > -               max_entries = ptes_per_table - unmap_idx_start;
> > +               max_entries = arm_lpae_max_entries(unmap_idx_start, data);
> >                 num_entries = min_t(int, pgcount, max_entries);
> >         }
> >
> > @@ -650,7 +661,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> >
> >         /* If the size matches this level, we're in the right place */
> >         if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> > -               max_entries = ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx_start;
> > +               max_entries = arm_lpae_max_entries(unmap_idx_start, data);
> >                 num_entries = min_t(int, pgcount, max_entries);
> >
> >                 /* Find and handle non-leaf entries */
> > --
> > 2.47.0.105.g07ac214952-goog
> >
> >

