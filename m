Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF45C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXghlfhRrFCx/sGoC3oMAY0O6HNgyaJ/L03L6lreXxo=; b=4+LeSurYcn9eimp7pr6q311F0j
	s1Ew5qAKcbDx6FSY7mlx1i/TaGwOlsBUjFJWdQvtCANmcae24Kz/w8YcoLcXHWsRlKs1DTV6yaCZ9
	fCHQNtmDTiuiiCEqRGy2O7bsR29opIw91ImdtJIz4TOwxNawgj7aEDaZN7p+HF3zASbwwLuCU9ARo
	o4stF3F6Q/7sB4ojSIB45Fi8POsF+pkPYXzqc1uqOCrXNpVEnUhqr90XTA/6ujCMw5B36NH6IUD2K
	jmgt+p7sPG067gM9kPibtTYHq2suVFNunKwL91AhZzumbWyTNH6EazQ3pDW+HOi5keAXIUTpU7uuy
	DiO1bR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taOUB-000000091KP-0JE4;
	Wed, 22 Jan 2025 00:20:47 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taOSt-000000091Dr-0RW1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 00:19:28 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7be3f230436so579807585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 16:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737505166; x=1738109966; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXghlfhRrFCx/sGoC3oMAY0O6HNgyaJ/L03L6lreXxo=;
        b=HK+ko20wMpJlFn3vtYLXM0YNP+rt8JiFSewHKuuuBvEc08UAHk1NzYWh9K89pAp1jE
         jwZ93+QY4CmLgsxJjSm0Ljhk5BwFKt2PWF+m9EiPRC8sBUduH2thciOv7TmvdM9Qb0ns
         GVs2Edfa24JFCkn99eI4etjVw7Jqgz+l6M16WgKwq8ZWlzfPtgUw3HOrAeJIM5ZTcA3b
         ZkDfBw2BlNN48JSE2/wWKjGRa9bP651ozfROgvp5Px58pvFGyuCRykqDj2VM+1/n26sK
         rSQx+7MwEY1jmooUXA+7n4FC+9Cxn6bOeW5jkT14oq2VMa8CccCFvdU96jcCsiRKVtwv
         /O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505166; x=1738109966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXghlfhRrFCx/sGoC3oMAY0O6HNgyaJ/L03L6lreXxo=;
        b=ty/OHvZon6Js0lLxlnB7WiIU0ABy1N5OxpnJ+wE6cHcipyuzdb22WI8ui26BtoaWPi
         NszGaDMREgG65gcQY2I59pFmGSnsoWvDbVFoUsTM7EFAtTiVreed2Dsh0gDbmnDCTOzG
         ITkFS/uS9m8ODoITMvX/dxqEpv/+UlYsWuUmwVKiNt8F26tdoKmyZqDY/zTo27qpsfPU
         Rv+JuoWGUNViMuXir3Q7ZEWBQohT1l+AFytDo2q1DERA1GxkWlAcbCgiLBc/+Ye6FkaV
         3barYsMOQQND6VtHkD761Wz6dVpTgvloq/nOkYyVCnzwUr7FkSh5A0sPkSbjNY5om2p6
         GUNg==
X-Forwarded-Encrypted: i=1; AJvYcCWxnBHzkVvum9QS5cMIhEwGFkiEDkpiKvk4NV9Cu81wQxovTZMe8DaEpTjwieJ8quMG4qagyyWXmTT6V8wJRfeF@lists.infradead.org
X-Gm-Message-State: AOJu0YzpN1gC31+OiO2Jn51Y5hawCncyeR00nvPf7iKzf2rGoQF3+Rpb
	kLH/mfn2MR9ZlZpmQ6tWxybRkdvjBjs3xPDEzB0ahNVVOQULX/XZKOej5mGXOx4=
X-Gm-Gg: ASbGncs7FssZJFS/QWm3fGvo1Xc4IRJa9kPitDmLsTKci/kmfOLuZmhXO+rX8ZQ8c4z
	ICeGfw8qK5q/bjaJXDvn3Ue18MVNkLBxuz7KFFl06iUlkLw5wUD20hCVTSM2Xe2bidmbix7myGg
	xWc/kMvsl1b4MHW15rrQZUkvtbAynneyWWxp3BHN/Q7v3GbluktGNG1L/fn62tTDEvpvDYj2+n1
	fytdI10LOhazSrdFgIEiYJv2O2dc/DtFx2dM0+Ts/Wb
X-Google-Smtp-Source: AGHT+IHoWfQLXBi4VVc2RH/uW0uLrxtbCGBc+6ctACTGWHOSsmF0DObwhxass5GjF3fYnabLc9/BJg==
X-Received: by 2002:a05:620a:440b:b0:7b6:cf60:3973 with SMTP id af79cd13be357-7be6321c80fmr3167063785a.23.1737505165882;
        Tue, 21 Jan 2025 16:19:25 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61473bc5sm605450085a.20.2025.01.21.16.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 16:19:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1taOSq-00000003lzE-0J9M;
	Tue, 21 Jan 2025 20:19:24 -0400
Date: Tue, 21 Jan 2025 20:19:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250122001924.GT674319@ziepe.ca>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
 <20250120142643.GM674319@ziepe.ca>
 <67901659.170a0220.20b206.f1f5SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67901659.170a0220.20b206.f1f5SMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_161927_143754_164DE7DA 
X-CRM114-Status: GOOD (  26.89  )
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

On Tue, Jan 21, 2025 at 01:49:10PM -0800, Jacob Pan wrote:

> > On Thu, Jan 16, 2025 at 03:23:04PM -0800, Shyam Saini wrote:
> > > Hi,
> > > 
> > > Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> > > assuming that all platforms have this address available for MSI IOVA
> > > reservation. However, this is not always the case, as some platforms
> > > reserve this address for other purposes.  
> > 
> > Can you explain this some more? This address is in the kernel
> > controlled IOVA space, there are few ways a platform can impact this.
> > 
> > How is the platform impacting it? Is the non-functional IOVA always
> > reflected in the iommu_get_resv_regions()?
> 
> I don't know the platform impact but just to clarify, are you asking
> whether this non-functional IOVA is also under IORT RMR or other FW
> tables? I don't think it is.

No, I'm asking how can you possibly have a HW platform where
MSI_IOVA_BASE is unable to be used for DMA?

MSI_IOVA_BASE is 128M, and most ARM platforms put DRAM starting at
0. Most ARM VMMs put DRAM starting at 0 too.

So a platform saying that DMA to 128M doesn't work is pretty broken,
to the point it is hard to believe there is a HW issue at work here?

> But this special IOVA is reflected in iommu_get_resv_regions() the same
> way as the hardcoded MSI_IOVA_BASE. So each iommu group's
> reserved_regions should show.

That's great

> > Why not avoid this conflict in your platform software?
> I had the same question but it seems there is not enough difference
> (than the standard smmu) to justify a platform code. i.e. platform
> specific iommu_get_resv_regions(), is that what you are suggesting?

And here I mean, why not stop marking it reserved in the ACPI/DT
inside your firwmare or hypervisor?

This smells like some SW component using the same address Linux uses
for some odd purpose. Just change it and let Linux keep using the
address it wants?

Jason

