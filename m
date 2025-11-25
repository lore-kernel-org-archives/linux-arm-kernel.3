Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58351D0E6EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt23P88VwKhWerb28gPQjkddkJpJ+ajkjeYULo2506w=; b=lLh6FSRTEP5H0SHDWP1Q9HpYec
	IulgfXxGvnnOYe2jZcQGboPBvz0+sLuI3lSBySXJ9Bq1/ATNnXKSpTcGXKFUoHhGqYTjmZijYhwme
	OJm4mJaS5ei614BDbEbUgWmjPNGZE3Bt7XdBFN9EAaymCJPrUYlOjTnrVJ1ENEgaAv3L4LMOwf/h7
	odCd05p5fqYALdWU1zZTDnMH/arck5OaIBBxWHQ/0ycky08lksxQNGcj5XBBfAv40pIR5bVprQNqD
	1RKEkKsaZBYY4H/ZG04dsXqvySCI7/j+5THaXLLlODlfT4H0pvGdeg9aYXUp7Ep5B2kuCXYxgMH7D
	1a/UVazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtvo-0000000DQTk-2X3P;
	Tue, 25 Nov 2025 14:22:12 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtvl-0000000DQSq-2b7G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:22:10 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3464C5C3AC;
	Tue, 25 Nov 2025 15:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1764080524;
	bh=lCT+owy5A7izWg3Y4iAUPBOhRqFZkOsq11yIy0cwvY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIER5eX5S6QaCqC+3BZZWnYz/IRTlm54MKwKdKivZSpojZZwBhuTwi5t+ViDdYbo4
	 AIiRsdmu4aJ6Xp01EcG10inM+6r7neUe3T/OHhggRCEbIGISdZJ/wHCw8OTGysgIaE
	 n/vaC+8JOLKY//KyGo+wPno++VGI3jyrzLq63Hj+CXScJeMju7pltA53Ma7vDOaNPr
	 tyzL9aWukq7F2NXS3d+smEZYybpwySz/Gw3V2J8DPc77FTj+gsq+exgp8YvIF8uRm3
	 MQyDAA47+MlrgTvd9puXOB6C+U0d0IYymQAVNFuMMVvwfoblFdm1/pqQ/QIGRfom9y
	 8w0iNll9T45jA==
Date: Tue, 25 Nov 2025 15:22:03 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: afael@kernel.org, bhelgaas@google.com, alex@shazbot.org, 
	jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, lenb@kernel.org, 
	kevin.tian@intel.com, baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev, 
	pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org, etzhao1900@gmail.com
Subject: Re: [PATCH v7 0/5] Disable ATS via iommu during PCI resets
Message-ID: <iovdqkgm7std6tpbfoolpkzksbc4hy3egfqgf6wbqmga2jlo7q@uolshjbvs3sm>
References: <cover.1763775108.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763775108.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_062209_877360_1DB495A8 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 21, 2025 at 05:57:27PM -0800, Nicolin Chen wrote:
> Nicolin Chen (5):
>   iommu: Lock group->mutex in iommu_deferred_attach()
>   iommu: Tidy domain for iommu_setup_dma_ops()
>   iommu: Add iommu_driver_get_domain_for_dev() helper
>   iommu: Introduce pci_dev_reset_iommu_prepare/done()
>   PCI: Suspend iommu function prior to resetting a device
> 
>  drivers/iommu/dma-iommu.h                   |   5 +-
>  include/linux/iommu.h                       |  14 ++
>  include/uapi/linux/vfio.h                   |   4 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   5 +-
>  drivers/iommu/dma-iommu.c                   |   4 +-
>  drivers/iommu/iommu.c                       | 220 +++++++++++++++++++-
>  drivers/pci/pci-acpi.c                      |  13 +-
>  drivers/pci/pci.c                           |  65 +++++-
>  drivers/pci/quirks.c                        |  19 +-
>  9 files changed, 326 insertions(+), 23 deletions(-)

Looks good from an IOMMU perspective, but needs Ack from PCI side.

Regards,

	Joerg

