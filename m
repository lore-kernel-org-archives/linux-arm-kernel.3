Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjsur9DLBO9lraNK3jQ4gyxveT6GDJ/WoDBpZ+ezdw4=; b=hoIKIeH8ieMAxw+0BVOqrUNUZa
	7IttSakykU4RBIdU9mW2ZGaNqYwGYBJTltb/dYTwUw45P5aOxNWn9fNLFXFwbzUDY+svpRbPX806k
	1dPvBeOycE1cPqIi9Rtkg0CLlBgZTYkYQgCUbtay5D7PfyJDKQux/lsXtlCN9zPgw3BQ38lcnLJCh
	TGfOlbLe/7/UKRglO1sj1Z7IMujgHhPQvl5IrRCk/MrJDYSx2CgMKBlOuBAraRM2kIBr6XMI7xg1+
	TdyDWfYowsUa0no9onm3H+cf9sqvD3DigdJLNNZZKqvOZZ9f8qvB9BAeM131BHqCZRI55TJAQtBgd
	TpFf4WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQr5-00000003Jya-1cFh;
	Mon, 14 Jul 2025 21:36:59 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQoe-00000003JpJ-4At2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 21:34:30 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7e2c920058fso116022185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752528868; x=1753133668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjsur9DLBO9lraNK3jQ4gyxveT6GDJ/WoDBpZ+ezdw4=;
        b=gb3KOb13Q4smK0dozYfokQhDBQ3sygCdNXfcRLzXmBHgjWKwePaM+lYdsxLO5KiXdG
         L9fvwqRFmd7XV+kOawv0XRUjz3FeleYW+FavdMu4o1HhZoXOD6x/FyCspkuJxmsEETNU
         c/PfS8zrXW892LqnNEh78kS1idoTmzz1D3CXbZbBrKDm1k7xBGPLJTeu9rKGhVMkFxTg
         fTMrG0P+c1aKMY49k9Lt2pG4GtJJtU5Sji0QSEjVynLmMOKuMuqTGfKVmrP7NXeJe/aW
         rkfA7Ypc0H9jLwSPYslW1LDLPZcExlHOgIK+p+K+EpP3s00i6PIdY78HkIAiUyc4NlbB
         fk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752528868; x=1753133668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjsur9DLBO9lraNK3jQ4gyxveT6GDJ/WoDBpZ+ezdw4=;
        b=sCwtRU2jTn7PQlVu7Ey5x0RJUzoYDkVcYdVE1yGzaZkf/BkXUdrPtcgnHwDWYDi/zQ
         VyVzufMpz0xa7eLvfrZSgck5m0JToSMLrjLP769DmvCrVyiAa0iegSrDZBbtUdfuRiMx
         fN/8NXveTSBzNcp7FWFQgH3D3Ae5BHnmcb0+udW7VeEAsN+S4S8Rtez3NApbFwLXT1Wa
         n0qtK7KEm4XaP7EkSmOb2k9kocYdN1iuXB6Fvon4VZsLmMEnmpEKtREug5X5LUaxpdVL
         sAjwiZ7Nt3YKZc8i5xtVlXrRcnucbkE2/ivpruMPT9nls4X2yUfZvUlZaMtp4dtzov7Z
         FwHA==
X-Forwarded-Encrypted: i=1; AJvYcCUCVSvr9Dfduzu8u/UJO1IE7ySlMRo7WmG8iFZWbzwHZEoR1ijEXRh7oTiS5xfkJoWEw9WT2hlR+FslYlW70ljK@lists.infradead.org
X-Gm-Message-State: AOJu0YzGsegpMaoYiP4No5ddX4okS3ZRDPhAV60OYlPAU0u1SmFNB5Zk
	hqeyDze2eRImCYwdMCI5MKx9hn9zPfjq2QrS45ZoZwLtJR4v/HSlzsSIhuznnwxl9M0=
X-Gm-Gg: ASbGncvEwwkber19JDRe6Px5XUyByH0uoXtqmdIiivp/3Opjr+wdAKmy5S/xhMTOrTh
	89n7S0c9a8ucM+sXuHi9H1FNvJxCquzgTsJs5F+kzeG/Jx4ENQwiVRPmN3YsAAEes+YvbSC0+Tv
	K6i6AEvdK1hh8YcUee9htWi8ZA2RYVVBIj/cABcKkZOQyYM2LUt3EEsRp59g4/gGjAyoy/AZQAe
	siTGvpi49amVNFBJv7Saumt/Cj2qe1ot8wK+oUt1+uOUWcNGeUbRiKJvIKwIM689uNWvyp5QO4c
	DOUHnckNou2JMr4xwJXlrezC632B7cwGyCBqBS2RU15e09Cbua6WINJAfRRVxuWYx3ifK5tcT3P
	Dgw2u0Q4PZPbVgVR5yEE45pLx2nkivh1lCeQ7knAqxqlsUqUen1j3faN2EDtifzT0mn6wVW41VA
	==
X-Google-Smtp-Source: AGHT+IFEx3lCJSamFS7GtCIM3DJJbVlIj8bmcaZbUD5CgXC67a7uWIwLe/hJ3o7zuNw/2yCru6JygQ==
X-Received: by 2002:a05:620a:20cf:b0:7e3:3682:6dee with SMTP id af79cd13be357-7e3378dd518mr183144785a.4.1752528867626;
        Mon, 14 Jul 2025 14:34:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3357a2f85sm57242685a.14.2025.07.14.14.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:34:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ubQoc-00000008jqs-0p6Q;
	Mon, 14 Jul 2025 18:34:26 -0300
Date: Mon, 14 Jul 2025 18:34:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Nate Watterson <nwatterson@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra241-cmdqv: import IOMMUFD module namespace
Message-ID: <20250714213426.GJ1870174@ziepe.ca>
References: <20250714205747.3475772-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714205747.3475772-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_143429_139996_6D7EFB6D 
X-CRM114-Status: GOOD (  12.90  )
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

On Mon, Jul 14, 2025 at 10:57:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The tegra variant of smmu-v3 now uses the iommufd mmap interface but
> is missing the corresponding import:
> 
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_depend from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol iommufd_viommu_report_event from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_destroy_mmap from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_undepend from namespace IOMMUFD, but does not import it.
> ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_alloc_mmap from namespace IOMMUFD, but does not import it.
> 
> Fixes: b135de24cfc0 ("iommu/tegra241-cmdqv: Add user-space use support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied thanks

Jason

