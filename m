Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C2EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGHI47Uk7ivYjDw6pJp4pRueuEDSB7hHUc7Dm7encu0=; b=BGfKnk5f1lWsXfwZo3zfR3Vvh0
	vb7LOPpdynIdmtAorRypkn+Qgn7/huKdWVMPl4XlZeLRZW+srvWphMrUVcdMJxUjNCRyfZwn427+u
	4pF/Hr6pLepeVV7Dx8/+LzP5HTvCqo5s+IewiWpOLcnpQIypPSzZJHKrAsiGs5UzVTOC0E2pDvikN
	20ptaBaYInkupPG6y1DX7WWJhmEjCo3yftI3x1W2QHLOdfrqY03fYWCWSVSlURcG8RfPyp7UmABAI
	PvydWozGFlh+yCfSWqkbwZM3hJXp2tSEj++HxQdDsSo58Oq030b1x+OkqxfWSRXMrSWh17zFPRbnW
	iFDN8Bzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKu6-0000000A9mi-1LKH;
	Mon, 13 Jul 2026 17:57:18 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKu4-0000000A9mA-1Yyt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:57:17 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so26337986d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965435; x=1784570235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YGHI47Uk7ivYjDw6pJp4pRueuEDSB7hHUc7Dm7encu0=;
        b=hB2H3ODbHFfN1uU6WezOWcFsTC53pW8IFl2yhADH/4svnDTJqJWUhm+rK/73PhLGYc
         q7tbvdyZ7cBhpgIORc0jXMAfNvSN3JGD9oa+uxqc1/tsjNlGbsQTPPk38ymwngsSVHd3
         XgQzhOia6IcRSllyvWXJcVkz9a66MEtGjshDkCKIOrk0CtD7YDVcIetYo8J4GCOZCVMt
         sUJj1WVnbOMDfAqwTNAfnRCwcO/bPJ5nBRRSfPZDhquraoTLRbt49EmCBEv2TErJKNh9
         t9COvGj1KQ3s7EqwFY6uh4Vq4brQ+CdanBEcLHt2iGalwbc92FsTt/p76IqDrCEI6kf7
         qsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965435; x=1784570235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGHI47Uk7ivYjDw6pJp4pRueuEDSB7hHUc7Dm7encu0=;
        b=Rgmydo7Ec18IDBKMSVp2pRwh0kr95Yf9ZSZpAJ2SqNQG6rNe9VuRYyc+OXT3p+Pk0L
         CHglVAjhcXgmOsGSVByPgePqVNblWBbxVy77Eqz+wACGwzHb37tY/WlXV0/kz2oxkC4F
         NJ/BxsAbpb39YB7lNf3vl32GdDoMW/g75QohNYg9BuFvkpuL+qNMZJCZol0C82QQ4OPR
         sA1H6vXLK1sedrtW5Txzo0r+CaW1uwb0SCKRAm6Y+cIDF6ZofDuomSPSgwvam8XRkGlv
         pHB2y/N+XceRDuXHeo2yyS1vzsKcTH+/6cVkPjWudL8osbjbakO3ZbGKDWjQ2RYc+lnS
         hArA==
X-Forwarded-Encrypted: i=1; AHgh+RrNLr4UB6vEIwGPdHy2QC5/7Lv+H7SS1KK9UO/uUsxww/2AdE+RJhXqH9OsP4hUvwRodYezujHn4Ph6WJzesnn6@lists.infradead.org
X-Gm-Message-State: AOJu0YxrYsCu/jK6ZgzMFod+icuM+4QSV+bAv4aMyA8oYrAoFeNa1RHi
	DUC61TLiF/w2m+ay2n3Y2k42/D/PqytGLq+GVOiKYKS3t93eD1qxo4UpkrRPlGDhO00=
X-Gm-Gg: AfdE7cmXAoQQlJHn3quMIbhnopJoI3mwaZlE28F2wntt84UVvBkmGXqHjRNpIOul/cT
	V3kgjaDElr7dqrv5y20x1RH3flhjamjjeXZgrbxy8pSUbyhFRR2/K8z5GFgO+EnW5Fcx+qEqZrQ
	rw3p8RR9t98b10QzTH4ekH1izGQBU9VwEPykf8oqHhIPbVUQxyqfrDclAY5U8Pi+cTx2kzZzA+G
	YYP6s96PchmTjT+luqpe3iRCyP4z1wcLj/gx9TMPCt/2VGOO3hq21r0wHPPRlsZ9FffL+9TJF+X
	Q4iHaXcTSVWA1NREGgSDEZLhQUgJ4nm9agUft63hyMU9Ya2EoA9ZbJS++xx0LNSK6peEN05eeZd
	GQ+ZEbQpmUyY/agSMd3+uMP+veUrohujRAfTuapwz70ueFT7yrisaxWmaAPZQ
X-Received: by 2002:a05:6214:5012:b0:8ff:60cd:8174 with SMTP id 6a1803df08f44-904053d8c92mr120238636d6.60.1783965434905;
        Mon, 13 Jul 2026 10:57:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e082csm149305496d6.5.2026.07.13.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:57:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKu1-0000000DxAz-2t49;
	Mon, 13 Jul 2026 14:57:13 -0300
Date: Mon, 13 Jul 2026 14:57:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 03/22] iommu/dma: Check atomic pool allocation result
 directly
Message-ID: <20260713175713.GK3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_105716_417502_6F3BB4AD 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Jul 01, 2026 at 11:19:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The non-blocking, non-coherent allocation path uses dma_alloc_from_pool(),
> which returns the allocated page and fills cpu_addr only on success.
> 
> Do not rely on cpu_addr to detect allocation failure in this path. Check
> the returned page directly before using it for the IOMMU mapping.
> 
> Fixes: 9420139f516d ("dma-pool: fix coherent pool allocations for IOMMU mappings")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

