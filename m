Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738CBF94CCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMaHUJlbAM3Jd7+mxnX/4RLAPCc1hrK90/OUP5mm3oY=; b=pVXsVHa8gyWTas2hsSl80ch6D4
	5FEuxMe+2AJapAxdjLviTZ2DvDpCKf7reeRGBJwTbpy2EZT+0C4X3IK3G8I52Fv61o6mBc/HmhCUT
	EhXsOjQExQrKp3YVfuwp0wBRvRLeBGQ+fjZrTH0ee4fMzp1YmqZAAoRXvx0vWknRKC6B7SXTiyOJn
	+cRzG9oZdV8/idvy2BuiRu87+OkN4vHnDt0JlgvA6rMBaLxxfRI8rFWChfiYe+dwJvZPmPry9/0Be
	M//Zxu5ZiAOdK1tSPk1XRcooBh8OjgRqFQQH4s6YbD9JiV4w6v8gZfpD+EIQ+4n4ufddvCrIAaBtL
	IiydzV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQsV-00000009ePl-1N75;
	Wed, 22 Apr 2026 06:16:03 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQsS-00000009eP8-2ouW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 06:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776838560; x=1808374560;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wNW80J9+6cZEODBKEuNJBOLTJ4Is+qz3rHCTGu+9o+w=;
  b=NZ7FjtIWJHVLvuPpoK65qtFw60BunXiINh/ftwJiXcsSIU8fk+DqYSzx
   04qRBG1sTnYYwZJW+6fT14bbSxgAZwJTSUFjfWGLNVJLK5OrQGUsxMwNk
   TM4UMO11xYFZC1zn1naMGaUfTWMrj+OSJSa+sMOb2pmfdkAr190V7RD7b
   spN2v9INSjXJHZP2/bK5RJluiE6mvXnJLh0dfJIWzHmmneXLStAYy/NWT
   YVU2PmYBfGKIeW6xCdEwzEm+w85sJAIVfor3UnyKVHr+m1rIhqlFoqdTk
   ewR6RHkRoZE+KfUBjxi1jdPDMun/KHNHboFmTyATXj9GNRwoljNQMVZA0
   g==;
X-CSE-ConnectionGUID: ZVhZ/lXdQYi2M9G6kV27/A==
X-CSE-MsgGUID: mcfDxhheQPazEDgd8aKPqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77765900"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77765900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:15:55 -0700
X-CSE-ConnectionGUID: 2R1ctoaSQaaYdcrEGlRJGA==
X-CSE-MsgGUID: RYB6JcRSSRyoZ6TmdWoRfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227926992"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:15:52 -0700
Message-ID: <cbcbea4e-c857-4b75-a55d-ba3f89cdf22d@linux.intel.com>
Date: Wed, 22 Apr 2026 14:13:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] PCI: Propagate FLR return values to callers
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <8bc784e505dc04ca81582307c4a70babbf58eca0.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8bc784e505dc04ca81582307c4a70babbf58eca0.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_231600_769641_688F2EFF 
X-CRM114-Status: GOOD (  23.60  )
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

On 4/17/26 07:28, Nicolin Chen wrote:
> A reset failure implies that the device might be unreliable. E.g. its ATC
> might still retain stale entries. Thus, the IOMMU layer cannot trust this
> device to resume its ATS function that can lead to memory corruption. So,
> the pci_dev_reset_iommu_done() won't recover the device's IOMMU pathway if
> the device reset fails.
> 
> Those functions in the pci_dev_reset_methods array invoke pcie_flr(), but
> do not check the return value. Propagate them correctly.
> 
> Given that these functions have been running okay, and the return values
> will be only needed for an incoming work. This is not treated as bug fix.
> 
> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/pci/quirks.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 48946cca4be72..05ce12b6b2f76 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3957,7 +3957,7 @@ static int reset_intel_82599_sfp_virtfn(struct pci_dev *dev, bool probe)
>   	 * supported.
>   	 */
>   	if (!probe)
> -		pcie_flr(dev);
> +		return pcie_flr(dev);
>   	return 0;
>   }
>   
> @@ -4015,6 +4015,7 @@ static int reset_chelsio_generic_dev(struct pci_dev *dev, bool probe)
>   {
>   	u16 old_command;
>   	u16 msix_flags;
> +	int ret;
>   
>   	/*
>   	 * If this isn't a Chelsio T4-based device, return -ENOTTY indicating
> @@ -4060,7 +4061,7 @@ static int reset_chelsio_generic_dev(struct pci_dev *dev, bool probe)
>   				      PCI_MSIX_FLAGS_ENABLE |
>   				      PCI_MSIX_FLAGS_MASKALL);
>   
> -	pcie_flr(dev);
> +	ret = pcie_flr(dev);

It makes more sense to return early here on failure. There is no need to
perform the subsequent steps if pcie_flr() fails. Would something like
the following work?

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 757a296eae41..9e0f29ac9f95 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4015,6 +4015,7 @@ static int reset_chelsio_generic_dev(struct 
pci_dev *dev, bool probe)
  {
         u16 old_command;
         u16 msix_flags;
+       int ret;

         /*
          * If this isn't a Chelsio T4-based device, return -ENOTTY 
indicating
@@ -4060,7 +4061,9 @@ static int reset_chelsio_generic_dev(struct 
pci_dev *dev, bool probe)
                                       PCI_MSIX_FLAGS_ENABLE |
                                       PCI_MSIX_FLAGS_MASKALL);

-       pcie_flr(dev);
+       ret = pcie_flr(dev);
+       if (ret)
+               return ret;

         /*
          * Restore the configuration information (BAR values, etc.) 
including

>   
>   	/*
>   	 * Restore the configuration information (BAR values, etc.) including
> @@ -4069,7 +4070,7 @@ static int reset_chelsio_generic_dev(struct pci_dev *dev, bool probe)
>   	 */
>   	pci_restore_state(dev);
>   	pci_write_config_word(dev, PCI_COMMAND, old_command);
> -	return 0;
> +	return ret;
>   }
>   
>   #define PCI_DEVICE_ID_INTEL_82599_SFP_VF   0x10ed
> @@ -4152,9 +4153,7 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
>   
>   	pci_iounmap(dev, bar);
>   
> -	pcie_flr(dev);
> -
> -	return 0;
> +	return pcie_flr(dev);
>   }
>   
>   /*
> @@ -4166,14 +4165,16 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
>    */
>   static int delay_250ms_after_flr(struct pci_dev *dev, bool probe)
>   {
> +	int ret;
> +
>   	if (probe)
>   		return pcie_reset_flr(dev, PCI_RESET_PROBE);
>   
> -	pcie_reset_flr(dev, PCI_RESET_DO_RESET);
> +	ret = pcie_reset_flr(dev, PCI_RESET_DO_RESET);
>   
>   	msleep(250);

The same there, ...

>   
> -	return 0;
> +	return ret;
>   }
>   
>   #define PCI_DEVICE_ID_HINIC_VF      0x375E
> @@ -4189,6 +4190,7 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>   	unsigned long timeout;
>   	void __iomem *bar;
>   	u32 val;
> +	int ret;
>   
>   	if (probe)
>   		return 0;
> @@ -4209,7 +4211,7 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>   	val = val | HINIC_VF_FLR_PROC_BIT;
>   	iowrite32be(val, bar + HINIC_VF_OP);
>   
> -	pcie_flr(pdev);
> +	ret = pcie_flr(pdev);


... and here.

>   
>   	/*
>   	 * The device must recapture its Bus and Device Numbers after FLR
> @@ -4236,7 +4238,7 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>   reset_complete:
>   	pci_iounmap(pdev, bar);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {

Thanks,
baolu

