Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073A7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8PI+jedvflyq/VB7m0YvNOqkrFrLjJK6JjkfGkp2tY=; b=Q5YlwoIGrQeDQTPUschn27nGay
	JQbJlCB7QgkNN3kRatwCTjZWrlPX+iYJ4aoQMUxdv1BfDCEcDW3+RqHpeKblSsLKMqd9uam4LbXfg
	lGGe3570KlS/dsq2a0N/sunUHs5l/DF/ssOuXCsc2at3ucmWPodEkGXZ1G3YoCuGP9AkGauTEurPI
	zyQz3oDtMlMbxk8XjyM1+PwIVvChcHC95eZ53Xo6f5E9xe2fSNB0cThGdce6kmtQdXBGjurTHZcYP
	+Nc+PwQnn0Tw2ttJn0MMVB973/Bf59qR4VQR84WGTDgQJlEhb61H+78W86a3fwlQty7pH+F767iST
	1AaWyntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje0E-0000000CMjd-2TMu;
	Tue, 14 Jul 2026 14:20:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje0A-0000000CMip-1i7g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:20:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ccdf36f63dso139135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784038849; x=1784643649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8PI+jedvflyq/VB7m0YvNOqkrFrLjJK6JjkfGkp2tY=;
        b=RVcuXYh4EoMD24J44/EaCQmvSJ2kZa0+VVg5zrt1oOklcuHomANqJH2B5AY9GYU0E+
         CyjBYxUpT3hcxED7LpHutWotYxMKQ6DovfMpHmTeLxyvY+nakJd869JBDKvNsELYNfTJ
         s0xdcz/9E2nX0i2/Vjxc06yAaG+PekRqEtvQJGIjOc8VQkcnElrwVCJ/5Ftpn+kMfMkr
         xXLQCWzaT6umDoNJNyThvDIPcmxfMIlJ7QYjMIICsS8XO0Kkb1XkBzF6x8iO9IBrSOMV
         MYdsUrb8/Eok5uQVWZhGeuiKxwiknTTNTGXb4InkD+JGTnz7QyFJE2+zKz+cxvy1Wvnj
         /6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038849; x=1784643649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8PI+jedvflyq/VB7m0YvNOqkrFrLjJK6JjkfGkp2tY=;
        b=EJbPejemly7FpwrKZxREcNbDzsN90fVVFDBXuSEOwDiRzaTfVhgMIii9L9uvi5H8H7
         4AU7EJ/EOMLdLAc/uWe5vra4SyDYYofu+ROWbsBOJPkEInGWuBKx0VauTtTICbIrh2Ip
         lFQpGtTMKGThUeFTH+XTgyWiftxffEuYqQ+QU9onpSD8B7xr7BhzAtp856WHMBtbgA9M
         uiFPaKFuOCMbbT85WHUDYlXy8Z5HGgyfHWoED9ovl2kxyy8rr1IPpEX4pAM4KDpPXbxn
         CiEDHaPxOkB8jogTCJ7dhj7++JIu4++hurn4LPsNafPg5BYCqg7aIFVudiaYN4szHXqN
         pMdg==
X-Forwarded-Encrypted: i=1; AHgh+RoNhspIfLgmyGc1c1Kcs0Z/vYftc4kwA+MCcd8WxFgueFdF4FM/31w8YLwoVrOXfkxKzxgDOeZkLbPx8ZGve4Ra@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8MZL3+3fC0k4aXhxezFgolF3inQEYXfCzXt+ODT7WiyzyMNeh
	E4ZSpdiU3ZTL6hy8jCkmDpJEs6LclfJbb0IU54LwQFL4oTEKbOhzFv1ypIT+7nnpnQ==
X-Gm-Gg: AfdE7ckB7YQJiPmngVJLyLuv5NQGRSP+KKttTuDx9XLUDL78gMoc0O+f1Ko+jJVAQ1B
	3T3337uRihC2YnHW4pSW4j/+4JkyzwMimrjsv0d4MSXSC/HjTeE9Rv3NtRVHnHaCAUJneF5hKJz
	ijoOFRJRwtJZTmvyAWobqJnCM1xug4SSoSFImFKKC3V7IXAnSU3lAhPg1Vra1+oDeTb1wQhfVQg
	KJrX+gj3GdWAFkZdRxYYT/TDc8araQH3cBy+WUpBYMtTOaRZREy1dIbXK40FPVFWoLggRJdtD2C
	RK5PSIzPEzsRHeQaxmtbuxxakoc8Ydsd/mF6kwZ9FGBo+7/5H86kWtVvcbidcRR8yD4k0/pwxrs
	oUAzpryJOcFQ7fR9sDTMtyIDvYOJyZyjFFoCqNG4CoHhJnbYZ5q/sBFI2u1CdBgybV5mMiWj2BC
	FtgNA0cvSOicZGOmyWDc9eP1iLwAyaCW5/2jBFjAAdK8xDrcY=
X-Received: by 2002:a17:903:26c6:b0:2ca:be81:b469 with SMTP id d9443c01a7336-2cee1134f8emr5728555ad.0.1784038849054;
        Tue, 14 Jul 2026 07:20:49 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2389e8sm1590432b3a.8.2026.07.14.07.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:20:48 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:20:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] iommufd: Fix vDEVICE allocation lifecycle bugs
Message-ID: <alZFuwNz0RCcqawZ@google.com>
References: <cover.1783311134.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1783311134.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_072051_999724_024BD124 
X-CRM114-Status: GOOD (  17.29  )
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

On Sun, Jul 05, 2026 at 10:36:08PM -0700, Nicolin Chen wrote:
> Sashiko flagged a few bugs in how IOMMU_VDEVICE_ALLOC creates and validates
> a vDEVICE on a vIOMMU:
> 
>  - the core publishes a vDEVICE into the vIOMMU xarray before the driver's
>    vdevice_init() runs, so a concurrent invalidation can reach one it has
>    not yet accepted;
>  - the undersized-vdevice_size guard returns holding the igroup mutex,
>    deadlocking later vDEVICE operations on that group;
>  - the Arm SMMUv3 vIOMMU accepts a device without exactly one Stream ID:
>    an out-of-bounds streams[] read for none, stale ATC/IOTLB for several.
> 
> Fix each of them properly.
> 
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/fix_vdevice_sashiko-v2
> 
> Changelog
> v2
>  * Add "Reviewed-by" from Kevin
>  * Patch-2: Add "Cc stable"; drop the out_release label by inlining the
>    xa_release() call
>  * Patch-2: Note that the reserved slot is hidden only via xa_* helpers
>  * Patch-3: Return -EOPNOTSUPP instead of -EINVAL
> v1
>  https://lore.kernel.org/all/cover.1782767110.git.nicolinc@nvidia.com/
> 
> Nicolin Chen (3):
>   iommufd/viommu: Release the igroup lock on the vdevice_size error path
>   iommufd/viommu: Publish a vDEVICE only after vdevice_init() succeeds
>   iommu/arm-smmu-v3-iommufd: Require exactly one Stream ID for a vDEVICE
> 
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 15 +++++++++++++
>  drivers/iommu/iommufd/viommu.c                | 22 ++++++++++++++-----
>  2 files changed, 31 insertions(+), 6 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

