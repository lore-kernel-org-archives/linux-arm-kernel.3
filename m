Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A2CFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHTQhH2Ab2LSEOrh4ufzsq76d1ANSJMLO0xKlWKUO30=; b=1rlHnc6xWhZBarBNEcBp6idwmx
	ixsF41s/oSbefH+EvxYvGvKeL9K8UlGmMgH3s42v6IDbMfYs9C3T1aEAwe6KN7TZRiKydYV+JE0vd
	VC077BRDiq8QHg6ZvWqk8r2d/p3Ry27YhDk1JXJTvFKoExm0iOGcy5hu0/HlhwNFcgYyYN7nSQAl9
	2Kzkq1YcBCNDxPy6vA4ceJyu4Urvr7CppNpg7hXup0Uh1Nx2gMEDKFwa9zTaayynmdLt93LMaZJJD
	QPGdFfzliYip2H2PBKvog3zi93CCAyRl4b+RYnQQO98s33eisi8jS0v4hVk/oR1d2Y8OtNUmAooKm
	BOKqaVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN6PO-0000000AIxr-1Xxj;
	Sun, 23 Nov 2025 09:29:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN6PN-0000000AIxZ-2fHK;
	Sun, 23 Nov 2025 09:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C597860154;
	Sun, 23 Nov 2025 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0853C113D0;
	Sun, 23 Nov 2025 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763890164;
	bh=2I+PL6KFXMf1ExzwcEo6rxHgBhtJ6ZnSKe1DUCdju6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7jifpVGDAqPpKDkZuO/QsfToNbQDpJa2kAFJZk4yAylfgk/MeL1ezsABScoWiTZO
	 Ku+OXoOcjccsTnJNVU1zQf9yPlmKH06vJWutPJzn1yH3BptuD9feIUO/MnErEuPISq
	 r5y6WFdsKU3khR65MZEj5AZhn/N47JUrWgdbQB0EVoDMyAI+E3GaUQJBay4euzi31x
	 O2AVOrQYiTC2cLaDfjgimQSwJ6eL1aMJuZUtR1ois0Q7WcCFXdl75NooHFy9CX/xz8
	 XRwqfzPfl99hPRywUKEZspXnVUBxauU8sJxNXjtiaWVG6jVwA0A0i8bA5DudifPBwP
	 92yJNUREfDQWA==
Date: Sun, 23 Nov 2025 11:29:20 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Benvenuti <benve@cisco.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v3 1/3] RDMA/usnic: Remove iommu_set_fault_handler()
Message-ID: <20251123092920.GB16619@unreal>
References: <0-v3-e5d08e2d551e+109-iommu_set_fault_jgg@nvidia.com>
 <1-v3-e5d08e2d551e+109-iommu_set_fault_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v3-e5d08e2d551e+109-iommu_set_fault_jgg@nvidia.com>
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

On Thu, Nov 20, 2025 at 03:46:22PM -0400, Jason Gunthorpe wrote:
> The handler in usnic just prints a fault report message, the iommu drivers
> all do a better job of that these days. Just remove the use of this old
> API.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/infiniband/hw/usnic/usnic_uiom.c | 13 -------------
>  1 file changed, 13 deletions(-)
>

I imagine that you want to merge this patch through iommu tree.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

