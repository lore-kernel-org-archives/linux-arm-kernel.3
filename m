Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88731CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fg/D4PQz7ORc/1gIr+qblX/iL6/NOg0Keo710yXxNfQ=; b=BfexZaKa3SaHGMCKS637DgvK6b
	2yrvuE8gn9TSK+cbSmLSoociVww9tnFWy2chPF9hhE9ZdDsuNWJZ036SWy3qDpzW0XtNez3oO3kMM
	SU9Fp62SXOSIufySjqiuAv/xqm3cDFWvqpmHT7WKoJrw1m0/N1cKeEqi9/eJiI08f0KbFyb0AvVAs
	DLweuNc6IQvP/bvT8OkFQ8rHVmyk1jHPg2ZLOtr7Ouvma2FTwg0qdF89w2j3FzWN2C6zxDB2wErwl
	rCXNuiTXjKJtZQKIK7z4turYbqi2zn93qB+BMAitHE+2kohIKOIi7YXcE730xRGbCJFJKakCqN1pY
	ZvXtNmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuWV-00000006GIw-1pqY;
	Thu, 23 Oct 2025 12:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuWS-00000006GIQ-3PFM;
	Thu, 23 Oct 2025 12:34:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397E11516;
	Thu, 23 Oct 2025 05:34:19 -0700 (PDT)
Received: from [10.57.36.157] (unknown [10.57.36.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67773F59E;
	Thu, 23 Oct 2025 05:34:23 -0700 (PDT)
Message-ID: <579bdc4e-ab71-4120-8991-34400d4bbf8d@arm.com>
Date: Thu, 23 Oct 2025 13:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iommu/amd: Don't call report_iommu_fault()
To: Jason Gunthorpe <jgg@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Benvenuti <benve@cisco.com>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Leon Romanovsky <leon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nelson Escobar <neescoba@cisco.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
References: <2-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_053428_901033_DB08C4BF 
X-CRM114-Status: GOOD (  18.04  )
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

On 2025-10-22 6:12 pm, Jason Gunthorpe wrote:
> This old style API is only used by drivers/gpu/drm/msm and
> drivers/remoteproc, neither are used on x86 HW. Remove the dead code to
> discourage new users.

I'd be almost certain there's somebody somewhere using remoteproc on x86 
with some FPGA/bespoke PCI device/on-board MCU/etc. - whether they're 
doing it on AMD *and* care about its fault reporting mechanism is really 
the question.
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/amd/iommu.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 2e1865daa1cee8..072c80bb2c2b3a 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -840,29 +840,6 @@ static void amd_iommu_report_page_fault(struct amd_iommu *iommu,
>   		dev_data = dev_iommu_priv_get(&pdev->dev);
>   
>   	if (dev_data) {
> -		/*
> -		 * If this is a DMA fault (for which the I(nterrupt)
> -		 * bit will be unset), allow report_iommu_fault() to
> -		 * prevent logging it.
> -		 */
> -		if (IS_IOMMU_MEM_TRANSACTION(flags)) {
> -			/* Device not attached to domain properly */
> -			if (dev_data->domain == NULL) {
> -				pr_err_ratelimited("Event logged [Device not attached to domain properly]\n");
> -				pr_err_ratelimited("  device=%04x:%02x:%02x.%x domain=0x%04x\n",
> -						   iommu->pci_seg->id, PCI_BUS_NUM(devid), PCI_SLOT(devid),
> -						   PCI_FUNC(devid), domain_id);
> -				goto out;
> -			}
This part is unrelated to the report_iommu_fault() call - in fact it was 
specifically added even more recently.

Thanks,
Robin.

> -
> -			if (!report_iommu_fault(&dev_data->domain->domain,
> -						&pdev->dev, address,
> -						IS_WRITE_REQUEST(flags) ?
> -							IOMMU_FAULT_WRITE :
> -							IOMMU_FAULT_READ))
> -				goto out;
> -		}
> -
>   		if (__ratelimit(&dev_data->rs)) {
>   			pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
>   				domain_id, address, flags);
> @@ -873,7 +850,6 @@ static void amd_iommu_report_page_fault(struct amd_iommu *iommu,
>   			domain_id, address, flags);
>   	}
>   
> -out:
>   	if (pdev)
>   		pci_dev_put(pdev);
>   }


