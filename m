Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7372BCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXxlxipshsFnd98Nkncaq6s+XN4axxGz1vRo0Xze8nc=; b=rptYf1+AJ8GPskvSLAlbl8/Gjk
	xQoJcoR88uJyukyuULK83Mf6MLa0eU0QlkMntxeWSHV0FTAojiH1ryowigMRO2ssXUFzzBBID10cs
	mn1cWLHOnehmSx6NLg3gTdzWSDlJ0HnCcg6QwBiMQUwElnjxt1RoqNpW1GDkmlfi+mf3HJAt9x2AW
	bKGp2/+FzT7H88celH7PzLnwW8MahsiQw+MSokQZUksLJU15gw5R82xek2CnWw5URAWkfSnCQaGra
	Gitu5y/9P1XrseGvVXic3yHUJUKWoefOlX9PdbJg3TvK87gTotSaffUpd3HVNRnEiMu85LI0GSfp5
	fUZ6X90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4mM-00000004ksN-0VsL;
	Thu, 07 May 2026 19:53:02 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4mJ-00000004kri-0aSk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:53:00 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-50d864c23bdso16121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778183578; x=1778788378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXxlxipshsFnd98Nkncaq6s+XN4axxGz1vRo0Xze8nc=;
        b=RhFWJhQ2bkLg0pjZrdsuhap03+5FrTXdNBG6WU+9nhkpIAr3xdJGvLj0Jk/Vo2467Q
         QVtusLqG6+f/Jj9EXfxucwoC55KQEfPQ4LsRRioxktK7P71zPIEgSqHb7nnqshZSk6Db
         pH1lyJyhgl2i69JJkKKjQ0vRaEA23Qf57UjFcLiUX9J7o9jBRixeg1qoBVVhg0bQn0TH
         Wb3j3e0pB9dByKX9QcfVTEYsGA/9K1kQwaTYjLWz2PXeXxzfd29WcFcPW8EEOVsTEwl9
         C921O0OVJqMfO0H45wxbboae3YdBVSJRicxzv0x2pFgrvT7SqPasIEwmJz0DCOgkVQWH
         dmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778183578; x=1778788378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXxlxipshsFnd98Nkncaq6s+XN4axxGz1vRo0Xze8nc=;
        b=LORmnN8n5DRn95c01A3NMuzQaIgzIRbo4KrJyu2Trco6Cshbq/BmGQWeYULYPHnDpO
         1WAkVx9sfWP3lwwJXIIRn5Hw/rcqE+rBDTGHL1IG5l+qH2figyxAsRbKnjHeonwrJKGF
         1jHZq0tSwn9DtsPCMXi+Pw9jjk+Sqw8Im4SYgeub/JUczF26LiI9tpofFHZKso+w8gDx
         kCrSEBVqIfgmCCoh1WKObobePQqCRy45/XbS5e8I8iq48MkR7FP6jKCpNadr0bPkvS6p
         JuyHDjmVE5byUtdtAb1ZeuaK0eT2j9ZUpWfSo5SEvbyAzuBoNQScwqdgGoTUjnxh4KMn
         eMMA==
X-Forwarded-Encrypted: i=1; AFNElJ9c++iT8wPFAE1X+MVD8HRq/k89beBxtixhP7ygWF6QVk4Q0E2xcrd5jot2Kc4EAUYrx5MwkgZsKbSA0Ui5zs98@lists.infradead.org
X-Gm-Message-State: AOJu0YySW95pyE75xloZggxP5yc9Mf/nSLNqw5xXrnPwtxBc1IPwOHah
	ClyKJC0JpnYs117DWsM1MYgGsrBRWltBR/Lt1xd4rwmo35CsM3GkdTR0k2GxGNi1jg==
X-Gm-Gg: AeBDieu3gNJS8LhAaNYAGnUWb7trdj7uK0GaiPLHaklkGOe6N+7SL5hxoYHmkGfDjkK
	SoBVW0zL4Eu2xt7HAwLaZ8+SBBB0ut+pS4oMjsZ/UPgpp6J48hnSdqkxGFN0vwO2sKS7F6cBVpc
	bXUgu6S4M4wKCBxD605AB/l3HuMPjnzGH2DiJ2ur/4hY0bNQ33T3T/2+iMFpbw/iojYMFwX4m61
	gjgPu9bqC5cEvgNieCdDV1pJXELprITHoV1cTqBceGOtCjDble7kwppg2yYh5Y9hl8/17VrBQNd
	I+2m9LkxEiDLrlJad63j3tRvgR5iGVYtnVYgMr4xT40f5UqKYuCt1VieaxwEOYxkoaPZ3BslsV5
	pLC+f+eSVhY2O/4nlrMSSA6Xna4rxLl7vH02hhYN0YJt6NP5HC3kLHQrM8m7/obCM4QJw1qdcAS
	ECII7RInWJBiKmP0hc0IIabG3ikmUDz4WYISD69cT4Mf91Dhxqu+fZyWzfcndss/ubw6y7foXcb
	gUPrs8=
X-Received: by 2002:ac8:614b:0:10b0:50f:ce97:3b84 with SMTP id d75a77b69052e-51487e39150mr2421751cf.6.1778183577126;
        Thu, 07 May 2026 12:52:57 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a80069sm2298791985a.15.2026.05.07.12.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:52:56 -0700 (PDT)
Date: Thu, 7 May 2026 19:52:49 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Yigit Oguz <yigitogu@amazon.de>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, dwmw2@infradead.org,
	suravee.suthikulpanit@amd.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lilit Janpoladyan <lilitj@amazon.com>
Subject: Re: [PATCH 3/3] iommu/amd: Add vendor:device ID to AMD IOMMU event
 logs
Message-ID: <afztkdvuWFn-42Pr@google.com>
References: <20260506150541.60467-1-yigitogu@amazon.de>
 <20260506150541.60467-4-yigitogu@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506150541.60467-4-yigitogu@amazon.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_125259_194680_36B8CBE9 
X-CRM114-Status: GOOD (  22.19  )
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

On Wed, May 06, 2026 at 03:05:39PM +0000, Yigit Oguz wrote:
> Add amd_iommu_devid_str() helper that formats PCI device identity as
> SSSS:BB:DD.F VVVV:DDDD by looking up the pci_dev via
> pci_get_domain_bus_and_slot. Falls back to SSSS:BB:DD.F when the
> device is not found.
> 
> Before:
>   AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 domain=0x000a
>   	address=0xe0000000 flags=0x0020]
> 
> After:
>   AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 8086:1533 domain=0x000a
>   	address=0xe0000000 flags=0x0020]
> 
> Signed-off-by: Yigit Oguz <yigitogu@amazon.de>
> Signed-off-by: Lilit Janpoladyan <lilitj@amazon.com>
> Assisted-by: Claude:claude-4.6-opus
> ---
>  drivers/iommu/amd/iommu.c | 94 ++++++++++++++++++++++++---------------
>  1 file changed, 58 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 01171361f9bc..441b4a7e85d5 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -779,11 +779,34 @@ static void dump_command(unsigned long phys_addr)
>  		pr_err("CMD[%d]: %08x\n", i, cmd->data[i]);
>  }
>  
> +#define AMD_IOMMU_DEVID_SIZE	48
> +
> +static void amd_iommu_devid_str(struct amd_iommu *iommu, u16 devid, char *buf,
> +				size_t size)
> +{
> +	struct pci_dev *pdev;
> +
> +	pdev = pci_get_domain_bus_and_slot(iommu->pci_seg->id,
> +					   PCI_BUS_NUM(devid), devid & 0xff);
> +	if (pdev) {
> +		snprintf(buf, size, "%04x:%02x:%02x.%x %04x:%04x",
> +			 iommu->pci_seg->id, PCI_BUS_NUM(devid),
> +			 PCI_SLOT(devid), PCI_FUNC(devid),
> +			 pdev->vendor, pdev->device);
> +		pci_dev_put(pdev);

From a quick glance it looks like we call this in bottom halves, which
looks fine.

> +	} else {
> +		snprintf(buf, size, "%04x:%02x:%02x.%x",
> +			 iommu->pci_seg->id, PCI_BUS_NUM(devid),
> +			 PCI_SLOT(devid), PCI_FUNC(devid));
> +	}
> +}
> +
>  static void amd_iommu_report_rmp_hw_error(struct amd_iommu *iommu, volatile u32 *event)
>  {
>  	struct iommu_dev_data *dev_data = NULL;
>  	int devid, vmg_tag, flags;
>  	struct pci_dev *pdev;
> +	char devid_str[AMD_IOMMU_DEVID_SIZE];
>  	u64 spa;
>  
>  	devid   = (event[0] >> EVENT_DEVID_SHIFT) & EVENT_DEVID_MASK;
> @@ -796,15 +819,16 @@ static void amd_iommu_report_rmp_hw_error(struct amd_iommu *iommu, volatile u32
>  	if (pdev)
>  		dev_data = dev_iommu_priv_get(&pdev->dev);
>  
> +	amd_iommu_devid_str(iommu, devid, devid_str, sizeof(devid_str));

Will this iterate the global pci dev list for EVERY event? I'm wondering
if we could improve that somehow?

[------------- >8 ---------------]

Thanks,
Praan

