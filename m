Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C44C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCzoPTpV/z5B2tKPQZt3PsPAo+HT8Vi32iw6SgMRUdg=; b=RBNUUmzwzfGDjos2KXpfTqtSHC
	2E0HxFwU4b4N/6oGCLiWQlfNtslQeI7+1OXy2t17uNnyCGQoDVGWJaELnOM1NvPb9gkzm92w1AVJF
	sB3xlvABivja0AxNUlR9gtboIwl2Ld1ZBxHsUESuceFXM6t+XjhoaYlnJcD+cXyMMvDKTWtFkCgwN
	m6CWpIHZxOCBv4HWJTxLCZnLp2Vlc9qvxsAkRZwaagGePrKCc0gVVQnEQ5N4lNNFjB57cF5h86FAc
	Ytj8ye72jayulCvlj6uXpHYZOLCg1vVENryLy9xrpDaH99G/Eb6AFnaPiEmoWhXNCh44KiOz3+usv
	CcPwX5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje2r-0000000CNCB-0CuK;
	Tue, 14 Jul 2026 14:23:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje2o-0000000CNBX-15pi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:23:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cacef7d299so134475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784039013; x=1784643813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lCzoPTpV/z5B2tKPQZt3PsPAo+HT8Vi32iw6SgMRUdg=;
        b=F35afdcQudjiSlHO57Nlz19a16G7feT2TMDqyhy9JTYPbWX3E86VVu3eXOeFTU5vfE
         Gzm3kXbvY/rzJ0BQhvu2/mZtSnxdED6Y5kxSaF13hZVE45JmwOuwCenypsmPIPFFyaN5
         19Vd64RWhFIpXYfBK5ym9V0BFU4jTQz5+cMFK+gKm4tEvDIyO4+nlIm1sOEhUKsN3MVa
         7Ley8lJmvsPV3NRX93skUEQkKuNG0+1kI8V14ubshhA2eHrd5REayM6OYv0RgZqOWlaD
         r+/RtirUoNLYgTgQmfLd4D9i+xjuc5YQgfwmRZXfAnXChTxsPvjkNQlFWd6RzMqGOjpR
         gvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039013; x=1784643813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCzoPTpV/z5B2tKPQZt3PsPAo+HT8Vi32iw6SgMRUdg=;
        b=mVN62tZGOWti/9BuJfdesNW5IBY9y5hn+Xk2JIezlrSOyXYug6qefPBMBT97VH281L
         8VaPY/NU7+phobcwDeg0yfwp+CzdMLa+zDzUCsYoy3MLapBlgWqXG5pt9GUZtbingqwA
         +e5qYGh4xrSWuh2PvG0U2x39qtDX1RBKduOeuYVRVjc961fz58P+Cy44FSCSptXY6ZPH
         bwE4b01edVNXJzmDDxDwu7y9FYvVAd8xW3+qZNRAlK9aeMsUGWcSaXFEX3wzNSk6LCuz
         p5YsT/D4f0v37DjXRjgJRzza6+PFV4py7+gjHSLkVlQd6Mn4XvpblkXZGS8115jhWkNh
         Jq0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5RVuQpk+wdco1KVkf2b+xPoFH3NhXaulFek1OZ6rkUd0/H8F7sbnrmJC3VXP+vFPDTZJ5aDPlmzJOtuST7RKs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8lKUDn54P9RQyUluYkKlYkr8BDMhvmQDodF4dUbJvC2mW9+J
	K4CI6irtbz1tUUW29Q4WSFqhr3ZXU9NdB6C1cBBOjdrjMD5vQ09K1Pe6DmmWeYnrdA==
X-Gm-Gg: AfdE7cnac4hwKEmx4FoGjO1+JhERjMPOJWemQKh6N3rogRUjbtoCAP0yg4NwSmeKehj
	mR8V5yf6RFomkTzMB7SqplKh+3JOOMNseLs6d5JnDoB7+ZHKmQgMJa623vfk+lPoWRglussiO09
	q+5gDVaD8RdRcuid+y/KMNK9ZWb17/rwOWptVNG8Lk+8xLjL1Fjc+h0xDULNLMd1t5NA78dI2e9
	PKjc/eQ+E5YwxdQj9izckp3nRA8Nh6N9fddPSkaZpfzq9w/km7VbPRZrImOT/BTYK9OO0uxIWo+
	x3XkU7eKKOr2rnM6lW1174Z5fsizkKOMhFwtL8W2dSdl1hPQzw3QIspuEWWczFDmQBsEvFblytU
	uO4BtJf3fV+e/3F6RiYbJKGyDqWSA1SodH12JF+S7ScrFGBv0cVVND9sveb7Zf1ca2rwLsNonK1
	aYcM2FC/8WfBa1+tAd4LcnFWfjvwhExSD6Bym1BRsGZYpJkQk=
X-Received: by 2002:a17:903:2311:b0:2c7:7c7d:fb8f with SMTP id d9443c01a7336-2cee1c08769mr5822805ad.17.1784039012483;
        Tue, 14 Jul 2026 07:23:32 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172cf903sm1577377a91.8.2026.07.14.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:23:31 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:23:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] iommufd: Fix vDEVICE allocation lifecycle bugs
Message-ID: <alZGXrCMZffUvMdM@google.com>
References: <cover.1783311134.git.nicolinc@nvidia.com>
 <20260714140607.GB3695849@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714140607.GB3695849@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_072334_313751_E10699DC 
X-CRM114-Status: GOOD (  21.13  )
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

On Tue, Jul 14, 2026 at 11:06:07AM -0300, Jason Gunthorpe wrote:
> On Sun, Jul 05, 2026 at 10:36:08PM -0700, Nicolin Chen wrote:
> > Sashiko flagged a few bugs in how IOMMU_VDEVICE_ALLOC creates and validates
> > a vDEVICE on a vIOMMU:
> > 
> >  - the core publishes a vDEVICE into the vIOMMU xarray before the driver's
> >    vdevice_init() runs, so a concurrent invalidation can reach one it has
> >    not yet accepted;
> >  - the undersized-vdevice_size guard returns holding the igroup mutex,
> >    deadlocking later vDEVICE operations on that group;
> >  - the Arm SMMUv3 vIOMMU accepts a device without exactly one Stream ID:
> >    an out-of-bounds streams[] read for none, stale ATC/IOTLB for several.
> > 
> > Fix each of them properly.
> > 
> > This is on Github:
> > https://github.com/nicolinc/iommufd/commits/fix_vdevice_sashiko-v2
> > 
> > Changelog
> > v2
> >  * Add "Reviewed-by" from Kevin
> >  * Patch-2: Add "Cc stable"; drop the out_release label by inlining the
> >    xa_release() call
> >  * Patch-2: Note that the reserved slot is hidden only via xa_* helpers
> >  * Patch-3: Return -EOPNOTSUPP instead of -EINVAL
> > v1
> >  https://lore.kernel.org/all/cover.1782767110.git.nicolinc@nvidia.com/
> > 
> > Nicolin Chen (3):
> >   iommufd/viommu: Release the igroup lock on the vdevice_size error path
> >   iommufd/viommu: Publish a vDEVICE only after vdevice_init() succeeds
> >   iommu/arm-smmu-v3-iommufd: Require exactly one Stream ID for a vDEVICE
> > 
> >  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 15 +++++++++++++
> >  drivers/iommu/iommufd/viommu.c                | 22 ++++++++++++++-----
> >  2 files changed, 31 insertions(+), 6 deletions(-)
> 
> Applied to for-rc
> 

Oops, sorry. I missed this while looking at patches in mutt. Feel free
to ignore my R-b if I'm too late.

Thanks,
Praan

