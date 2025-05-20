Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF0FC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlpgK8+tZkkDHiRWgBwHzi2Y0cqlH2RIldw1jLBTIb4=; b=sTpRlv7nMJnKHCTT+7j7N/7TzU
	xx6GFM1KC6rPHzKy3pHtSFpwpIxksGC7GwllexyNqEAmD+SH+74a+wVtnBlmhV9rvPveMl9XeB4o6
	yGRg4bzq8FSsxAjyovrwk61zrxB9WYK7H1XguULtsq+29t9771iykFIc5UEeFJLMtJ/0WZzS7Tnod
	dEnTA39D0u4ObvNU3Awil1VbMCBHmO2j0ama+w04+1CQYF+ElIGkvBRZURvhQvSoPKPsDhLi6y3To
	opTJ2O1pd6qMwnQWc+7vD6NZmnYPkbBqNtAiaCkKxgxKJJQWitYQFSfAf4xyaFiPDIv8UweK3LIL0
	09OewgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVmm-0000000EJqu-0G9z;
	Tue, 20 May 2025 22:50:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVfF-0000000EIvb-4Ajt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:42:27 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 9616F2067864; Tue, 20 May 2025 15:42:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9616F2067864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747780944;
	bh=DlpgK8+tZkkDHiRWgBwHzi2Y0cqlH2RIldw1jLBTIb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvUGCBR4iqg/M7Vg3HP94282EcXsXC5noJNb1o/uDAj1lfvSmUtR3/enibqZKqGml
	 IvzwXSS/YTm9/i/m4JJRERdIp388+J5wxgwzStIpmjQ4uI+6mrY/MlL8XjdktFOfqI
	 o3HYFu1SfU5/WDFlksRh6wBlNWwZk7zhBZ5f0IOI=
Date: Tue, 20 May 2025 15:42:24 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416181759.GF493866@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_154226_062600_05D5CEC3 
X-CRM114-Status: GOOD (  24.29  )
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

Hi Jason,

apologies for the delayed response.

> On Wed, Apr 16, 2025 at 11:04:27AM -0700, Jacob Pan wrote:
> 
> > Per last discussion "SMMU driver have a list of potential addresses and
> > select the first one that does not intersect with the non-working IOVA
> > ranges.". If we don't know what the "non-working IOVA" is, how do we
> > know it does not intersect the "potential addresses"?
> 
> I had understood from previous discussions that this platform is
> properly creating IOMMU_RESV_RESERVED regions for the IOVA that
> doesn't work. Otherwise everything is broken..
> 
> Presumably that happens through iommu_dma_get_resv_regions() calling
> of_iommu_get_resv_regions() on a DT platform. There is a schema
> describing how to do this, so platform firmware should be able to do it..
> 
> So the fix seems trivial enough to me:
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b4c21aaed1266a..ebba18579151bc 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3562,17 +3562,29 @@ static int arm_smmu_of_xlate(struct device *dev,
>  static void arm_smmu_get_resv_regions(struct device *dev,
>  				      struct list_head *head)
>  {
> -	struct iommu_resv_region *region;
> -	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> -
> -	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> +	static const u64 msi_bases[] = { MSI_IOVA_BASE, 0x12340000 };
>  
>  	iommu_dma_get_resv_regions(dev, head);

my understand is, this hook is not called for all the devices, eg: pcie dts node
doesn't use [1] "iommus" property instead it uses "iommu-map" property
as a consequence, [1] while loop exits prematurely and iommu_dma_get_resv_regions()
is not called, so there is no IOVA reservation for the pcie device. 

Did i miss something? Please let me know.

[1] https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/of/device.c#L161

Thanks,
Shyam

