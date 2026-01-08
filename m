Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04834D1D460
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4LHsOGc5pju7+ZZ7G/UCMXvDe5juRNxgmay6MHvgpc=; b=j/CwLy0ct3YHzQb6t4h05r1RCR
	j0y6mA/C3HZzKSxyyt3575v8fnJ4yUvvseOvD+aM62+Jr3PNJdRt16mAXb3ieMwwu3xWBhb2HVl97
	DX600VMQtWtO+XDus6RSWmRB/8+XCMBSiNeUNNcJYomiN2VQ6hgN1MI+Ql9Syj1492OBNDznr0Znp
	qtmTD8qHZZD7cCjhwiZKUu/J9CG7vAKfUCofkhJrPiOgPx88/bmjzy4h5J3ngv0XBjukQrWFNU4KF
	qYjTtyem266jdSJQ7h9lsnQxC3pK794VXUIEIDlDqZUYztFyv0zCpQyxhQlYkzM6epjoBBGDzZxuy
	5Q2IRGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrGQ-0000000HOdt-0xSw;
	Thu, 08 Jan 2026 14:45:27 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrGN-0000000HOch-0zuR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:45:24 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ee1879e6d9so35704201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767883522; x=1768488322; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N4LHsOGc5pju7+ZZ7G/UCMXvDe5juRNxgmay6MHvgpc=;
        b=Y5/J0hkvQBeYLzF3VNzO/jx+pZloNFXSIY8Vlcp/lFWbrsFYgYlH7C1lDCpztJuIJw
         DidTlWu/gmfstntcmhCoHh/ROJCoaZH+ToiR6EFV7+5lll+doxImJmG+PvwoSn5pYOA+
         KkDJgS8JxjmaxGdwEcpRb5xOJZhhqd/f+HdtRG9FsgNS29W7dOF61VY/BLqFIxBzU6BA
         No6BbePQ2FRYNoI3JysOsaU6MOA5nnSrWz2JruCLQcSCMAD8g5tFBA/dYIJduGs18B1e
         t6Xdi5cmBy5HEPx7nnE56Am5uh7/XALAHzCkbi2CQ964wmatDMvPHaT/oVoOj/KW3kO/
         pVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883522; x=1768488322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4LHsOGc5pju7+ZZ7G/UCMXvDe5juRNxgmay6MHvgpc=;
        b=ks470diz/91qwgOj496ZRtSBTfK+bvazUWOtQHqFqxgQB0lz0R3DyVLDmWaBw7aayh
         HoAKFVrp8UrhXXvaw/RBbVzW8bhj+jGB7q7U8IZucOCFcGF1KFJTxEwCotBUy+lQb6m6
         Loeg+P2xdnx60foY5rnF0qQSbDU8kdc99BADMeIUffUk4et3CSw2TKVIH87cNWWa5KDR
         ERMEAhhUvihlH1rMSOMwNlXDdU/C053q8C2dACqIAsSEPX6TZvHKVxp0lmVmDSMPdVCB
         Q+LSsH1QFICkUR8nK7EH5DYeeoB46lcS77hAhv5WCQxdF/JyXyMyaWXL63u8IMTDQexl
         rNPw==
X-Forwarded-Encrypted: i=1; AJvYcCVDNteaKN8yHLFjBcV1dk1I9lIyATdyTCgttm90PbEgfb3oau+ReX6pRY8bquoG6X0DyDgAGUP9izuBnG+5i+4e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76bxtHr62EWN76jahB2cl8sFr13xtEkGl5UqqJ8NEWqupCkxp
	fN5/iEIWs1sAOoZJX77A5cSM9Uk2VcYXmMl/vXDxqTuYzopUsWHN6ip6uPy6yVu0a10=
X-Gm-Gg: AY/fxX6c4JU2ucHausgPDNusNWvGfHMNWJ2LMj4Pt3yAuVMgjamD/dl9VfvyCpU/1Ry
	45Y9PFRFGREFd5vU/LEw0CVZg8savFFe311GS14xos1lRdF6SOqnIioUW2UWzoFEqTMa5rrkQpf
	75iyhmF/9z3lelurg19NcT2O/t85+YhUfMRisqpw1uig46djUzXle5DNRHclEIv5sV0zABmLCuu
	fx4aVihLtcRTizMbMP/2dkFBFTRPUnHDemGdRfFDyeqn6uMT+k883PoF/PPphn69ZlibmzCW+aq
	dO1dLKAjxfiyus1Mdq9c2g/kYmulFYXy0dir0oSqiHnPZLAVYZI4PZNd7eqTOjxGdTy6UCaG3dl
	odR/LEWXM8icLUHoXZx3ffGS0lG+MGlTmi1bugXsmnuhiLkWj1Xxpk96tnrYZDi7uj0nzGOQ5sT
	52zPsN/vDeaKg/VmZrVesYZSUcMfeYkMEjXZ5ShbPeoVR3gsXdRoMYO+8fDqM01nyfi6R73q7UZ
	CtLyg==
X-Google-Smtp-Source: AGHT+IES3ov00CDdYvOziEIM2g2UrgYu5X+EmgztTduCXnjzLnO2ob95S0v4/KfSRH05axzpnJtLpA==
X-Received: by 2002:a05:622a:2297:b0:4ed:b8d6:e0e8 with SMTP id d75a77b69052e-4ffb48a86e1mr83270651cf.22.1767883521678;
        Thu, 08 Jan 2026 06:45:21 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d64563sm48461021cf.13.2026.01.08.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:45:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vdrGK-00000002MBP-1mPB;
	Thu, 08 Jan 2026 10:45:20 -0400
Date: Thu, 8 Jan 2026 10:45:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
Message-ID: <20260108144520.GE545276@ziepe.ca>
References: <20260108113846.56179-1-smostafa@google.com>
 <20260108125934.GB545276@ziepe.ca>
 <CAFgf54ocNybHR_Mp1+i7cff-jkeMUV1QxBCt04jnKxwfwnyUfQ@mail.gmail.com>
 <CAFgf54o+YZUyZTszFt-uBW4ZhjrAMsfPFUb9kKTK1uHWdS+++w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54o+YZUyZTszFt-uBW4ZhjrAMsfPFUb9kKTK1uHWdS+++w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_064523_284126_C2574FE7 
X-CRM114-Status: GOOD (  25.71  )
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

On Thu, Jan 08, 2026 at 01:44:51PM +0000, Mostafa Saleh wrote:
> On Thu, Jan 8, 2026 at 1:27 PM Mostafa Saleh <smostafa@google.com> wrote:
> >
> > On Thu, Jan 8, 2026 at 12:59 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Thu, Jan 08, 2026 at 11:38:46AM +0000, Mostafa Saleh wrote:
> > > > Jason pointed out that the DMA-API calls are not really needed [2].
> > > >
> > > > Looking more into this. Initially, the io-pgtable API let drivers
> > > > do the CMOs using tlb::flush_pgtable() where drivers were using the
> > > > DMA API (map/unmap_single) only to do CMOs as the low-level cache
> > > > functions won’t be available for modules.
> > >
> > > This isn't what I ment at all, the iommu-pages.h could do the flush
> > > inside itself using the already existing
> > > iommu_pages_flush_incoherent() instead of open coding the dma api
> > > calls everwhere, and maybe that could directly call the arch function
> > > on arm (as x86 does) which would be easier to implement in pkvm's
> > > hypervisor.
> > >
> >
> > I see, so basically, we add the check for IOMMU_PAGES_USE_DMA_API in
> > iommu_pages_flush_incoherent() with the DMA-API stuff and call it from
> > the io-pgtable-arm instead.
> >
> 
> iommu_pages_flush_incoherent() is also used to flush non-cacheable
> pages in generic_pt from flush_writes_*(), so it might not be that
> simple; We might need to add a new variant.

There are no non-cachable pages in the iommu-pages system???

All memory comes from folios and is mapped to the CPU cachable.

The general API requires the user of iommu-pages to know if the
underlying HW is going to do non-coherent DMA, in this case it must
call iommu_pages_flush_incoherent() before the HW does DMA.

Effectively what I'm saying here is to convert the arm page table to
use iommu-pages and then put your pkvm abstraction at the iommu-pages
level instead of trying to hack up all these users.

You can also do the same conversion to the smmu driver to use
iommu-pages instead of DMA API, AMD and Intel are doing this already.

Jason

