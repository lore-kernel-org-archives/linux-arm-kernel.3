Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E01C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gr388eDAaOABnPZrXjkZ45mWUbD3uMhzRpmwOTnLOU=; b=sQu/zntcL39oUEadsa8knIFijL
	H7ij5PS3r6XgtIUZMVZ/F18kS2/H1Tns0YqioH2S5s49yIIddJIWe5x11eV8qQq9vQ17kaNkeNIn6
	W4rmRatvAeVGA9YogZqnVBVMi6DBR2BHXQ9hvDEP+unJ5x1w/TKGjz3CJw2UpOjhUVOFWWFu51EwY
	oPuAQiJndgzuxOgopRvIOLxGoFMtF0fm25yIxyTcRkMVU66QLXXbXIJEvpHG0X7G8LW2SgXkZNQfM
	e1H3gyMLstJSTgm7XznuA8tDzj04b6PVHCQUMxaCCofHqCUO4DRfCW/j8xG23P3smDvqrXlhJ86Wl
	svJIC+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Gfs-0000000EICg-1rHT;
	Fri, 11 Apr 2025 15:52:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ge3-0000000EI3c-2hcu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 15:50:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2263428c8baso211185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744386619; x=1744991419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gr388eDAaOABnPZrXjkZ45mWUbD3uMhzRpmwOTnLOU=;
        b=khXeqIbXUPlOTCRyS7gPZqXvaAP6S/cRco+LEs8gm2kSMMaABytUPLKoUqimsALD0u
         PQJiR9JGISNK6+lWEUhe235mIWXqlnQ4t6a86nCmBL+LXJUbob30sUkB/32d2SlrbOh9
         QvpbsYq1XiklcDFJYJY3rgd3nq6/LTUNrA5j2tTPh7KMZlogE2N6wVA8h/hA/xGGRc3J
         yJ9M+TOkTLe/flgcOG6AIASwTPLUFlhdYU2cyWHbfypbhUH8Dd9vi3pv57TLqowVvfqf
         HV0YWHB4pbo0xe8g4pNOmh2pkQu8lheNFprxANb6fKvwaYFH6YQt/2ZtLcDVOewCytB4
         Niig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386619; x=1744991419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gr388eDAaOABnPZrXjkZ45mWUbD3uMhzRpmwOTnLOU=;
        b=vxo0vIqRoIjI38d51OruCFCDD4xO5VfvMCvAF+i+eXwStKf33TyYG1xvMKiIhwgw6a
         aMb713DrmsYqas7yPLEu5gjqX8VK085s0ioVZ69GvC8EK837tJz4QwMhsG+C6Y6cXYiU
         3z28AX+XYWGu1py7SkWinZoNLB0SGtxggPbeKGc01bDOZEPTQJ7jgOWl0e5z8by3ZT5T
         07XGjuubKV0mqraGRSTzu/Hz8SOEuYTkPIYxlOaNcGwFpbB0Dh18WMHB8Nef7uQVUlBc
         B5BhyKkmTK1xURbNwZGonqMYP2QovBa7NHn6yXKowVtiFpfwpSQZ8VoFOcOUgOeQzapu
         6Y3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAf8EYwWS9ji2FvTePHUzuPMLdFlQiAPt55HIauW8whEIuSRVC3D1bQ8AK0HqIuZgtx7hRxs9AYrEz6ukJiyYa@lists.infradead.org
X-Gm-Message-State: AOJu0YyDDPmAXoae5gzb+hjko5GS/IlGob10V7PmMyfVuPp8bT2KbRsR
	BFaM0amlNUqZWLYwSYCv1mM3+XcVugO6T8f4gtcWMZDHP9TL8UxfXK9173yeHw==
X-Gm-Gg: ASbGnctqaHpsWkHnL0Yk1WdQtymtKl0pCW1AZTVpm4NIGnEx/Yd5n7kgkkX5Btwp7oK
	pWzO1bGMSjSVbqc9YDJ/0CbKw0Zf3a5vdoC5/5uONmq8teSoTUDDlLyICxPsOjiCVcKB2oUrKq+
	qmuLxfaCjPWEM9vdzX77wUuJSaR5Vkv7/W4ULAG6GOVOR7fY44NSFH3gs5KvTfxUE4ol4XLj2cW
	N0qeMBASH5WL/pWKmPSc8t23nRLnVqKG79Tg5NP/nGTqXKNw7VjfHRx/jXALmIlwhkEZ6tYPRDq
	mBpOKSkppbIWd7WS1idzPmWGsV6/9n+ndsXB/SVVdrBNJAXaDpTeQGa8hIBMg0coEpmEydEXlUZ
	gRECQwyM+yw==
X-Google-Smtp-Source: AGHT+IGAUGcHPS948c/RABJFlkfq9Ah9C95gnh02WA26avQXzL8VcB6UHm60FHX1cSKOUEo1ud5oSQ==
X-Received: by 2002:a17:902:d306:b0:223:37ec:63be with SMTP id d9443c01a7336-22be9971cf3mr2846815ad.4.1744386618527;
        Fri, 11 Apr 2025 08:50:18 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd00sm1681155b3a.126.2025.04.11.08.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:50:17 -0700 (PDT)
Date: Fri, 11 Apr 2025 15:50:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	nicolinc@nvidia.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fail aliasing StreamIDs more
 gracefully
Message-ID: <Z_k6MqMcVO068Mq8@google.com>
References: <39d54e49c8476efc4653e352150d44b185d6d50f.1744380554.git.robin.murphy@arm.com>
 <20250411152122.GF8423@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411152122.GF8423@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_085019_689062_882F6C44 
X-CRM114-Status: GOOD (  40.35  )
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

On Fri, Apr 11, 2025 at 12:21:22PM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 11, 2025 at 03:09:14PM +0100, Robin Murphy wrote:
> > We've never supported StreamID aliasing between devices, and as such
> > they will never have had functioning DMA, but this is not fatal to the
> > SMMU itself. Although aliasing between hard-wired platform device
> > StreamIDs would tend to raise questions about the whole system, in
> > practice it's far more likely to occur relatively innocently due to
> > legacy PCI bridges, where the underlying StreamID mappings are still
> > perfectly reasonable.
> > 
> > As such, return a more benign -ENODEV when failing probe for such an
> > unsupported device (and log a more obvious error message), so that it
> > doesn't break the entire SMMU probe now that bus_iommu_probe() runs in
> > the right order and can propagate that error back. The end result is
> > still that the device doesn't get an IOMMU group and probably won't
> > work, same as before.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index b4c21aaed126..c06459f7077b 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -3400,9 +3400,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
> >  		/* Insert into SID tree */
> >  		if (rb_find_add(&new_stream->node, &smmu->streams,
> >  				arm_smmu_streams_cmp_node)) {
> > -			dev_warn(master->dev, "stream %u already in tree\n",
> > +			dev_warn(master->dev, "Aliasing StreamID 0x%x unsupported, expect DMA to be broken\n",
> >  				 sid);
> > -			ret = -EINVAL;
> > +			ret = -ENODEV;
> >  			break;
> 
> I don't think we should dillute the meaning of ENODEV here. It is
> supposed to mean that the driver does not recognize the device and
> this IOMMU instance doesn't translate for it.
> 
> That is different from the iommu instance owning the device but being
> unable to probe it for some reason. The failure recovery in the core
> code should be different.
> 
> IMHO it makes more sense to change this and related:
> 
> static int bus_iommu_probe(const struct bus_type *bus)
> {
> 	struct iommu_group *group, *next;
> 	LIST_HEAD(group_list);
> 	int ret;
> 
> 	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
> 	if (ret)
> 		return ret;
> 
> So that recognized, but failed, devices are contained to only effect
> that device and do not fail the entire iommu or bus registration,
> which is more like how things used to work when the probe path would
> ignore the per-driver failure codes.
> 
> I can't think of a reason why we'd want any per-device failure to also
> abort the whole iommu registration??

I don't think this change would abort the iommu registration?
The probe_iommu_group would simply ignore the -ENODEV. Or are you
talking about a case where we don't return -ENODEV?

>
> It would be nice if the dev->iommu would record that the struct device
> is inoperable and then we can fail
> iommu_device_use_default_domain()/etc in a contained way.

Ohh okay.. you mean the dev->iommu_group == NULL may give an illusion to
<bus>_dma_configure that DMA is allowed? Even in that case the iommu 
would block the DMA right? And upon inspection of dmesg it would be
clear that something went wrong with the probe?


> 
> Jason
> 

Thanks,
Praan

