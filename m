Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FC8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rom/ptDsxRGJM1AJ//ihjpMNAtsF50k3kKj9llJ3pM=; b=I09OYSunhm/7BWua8aNbQe/He8
	maqLfAK0W8JjHijA1jb8K3Q4Mha6d9WlASzB6zeCnbQimvlTpaggVcK9zLl5ykNd0tjDz7BxdUCt0
	DLGKOPD5Hi1HpcL8QEt1EjGZuYiVFzfKhgSv/BwLNto01hien7v7gq67zdIun7Av2nRnnZrfzURlm
	ttmTys2WmjH1PQ0Cpg5rmE2IpGJmcTTAOaCJWjAAP5bX1nurwtbmlwDO4ptWnm+Ds+CWBMFABN17p
	I9eKe/WQv6f2SzwZxdng9x6cQcXu2y7LjHdqwpLe3A5CYR3KOk1VE+ELrMXr+ua4YucmoZFSPMdSv
	i2UDfPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrY-0000000BErW-39lS;
	Tue, 19 Aug 2025 18:15:12 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN58-0000000AiaH-1gfS;
	Tue, 19 Aug 2025 14:12:59 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-618adc251f0so6940102a12.3;
        Tue, 19 Aug 2025 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755612776; x=1756217576; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rom/ptDsxRGJM1AJ//ihjpMNAtsF50k3kKj9llJ3pM=;
        b=f0Bvuyfeqh3HFQuXhyVl7FqpuZud/fYLGQYRPZDvn+4o2qoZpJwnOPfXrkLngM+BUF
         z/x3u/0Arwd9qSd3Zu7stEJt46ep1XJ7F1rLzqjfcU8xRNvyYsyDB1Jy9gXpR7FMDCSy
         V5FczRwEfbslB+5QvUnJvSLd05UvUJLdsAKI6orDxel0duWNs2P/26AJ8GHsTLAQOOjw
         Y13DmIgO47SXlKTJaYRO6dMIl8Zkvl0lBVz/G44fQ1JsWxmv6J8Rpbh+Re6E0bcbXm5E
         QcDbv/cYEwXqIG3YGkOWQ1RluUU3C3OnaubzLiowCPMF/RxCYbZxxg2qvBNWB2gQf2Q3
         Qabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755612776; x=1756217576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4rom/ptDsxRGJM1AJ//ihjpMNAtsF50k3kKj9llJ3pM=;
        b=hUaZRqwMO8s4FK/PDv0/fMWRg+nC0uyvx4DBfmXyh7HMhEfO8L1PCQauhhYj4xEuWO
         SF97PK0+h2HbgFt30m7zFXiadiU4xDpVBdUHV808eK8D3DISIARu3YSQ9ZIf70T9Y5Go
         Krpq7+BvTwuSmT+8Msx8mgQtuBcDd7dF2S0a+uLyi/qpJYgVVQC8VSUSRkq2yYUG1ZBa
         8VvA60t2yFjCq8F9Y73NsnCz4xCIlC9V8U/HYUWDlCH5+VJz5ekDaG6c3P0vVIxnaTIm
         o4HVV50kakxVxoGCq6PGA0UmMxq2UdiUvY3h7SkZKNUyuzdHIIePvWu0am1DIVrqLVar
         8lGw==
X-Forwarded-Encrypted: i=1; AJvYcCVsw8slacArDouY7eEwJcRWImpfW/I/oqfHfNpPfj7n7dy5FkLoSrt1T8cr8/XgwKgcTm+DqDIgl88UAnEOVtA=@lists.infradead.org, AJvYcCX3xjFog4K27fPT6L6BGU86vd0mqUOOxOpYZUGCJta6BJKB3HHALy93ytFLSwbOCF97AIo8R5qjp4t85/LISz/9@lists.infradead.org
X-Gm-Message-State: AOJu0YxpVNgbgyENGGF7yoge5YWCzbQ7+P6ZfsOM4KvfocHuEG+sUpfj
	Z2m1GKN49l4esGobHgFnWYqLE28n3wimy9wIDc0gtdsd5FdlvCqzWdTD
X-Gm-Gg: ASbGncsLNWirVu0SS9Hl4vQXpvYhZflmkyOhdOCEb8B/mtoNeWdyIS2xaiZdPDu/Bdt
	xKUQ1VFxUoaaLFHTB5RIl5eJNUBbrCokMVZs+yMBWBOrUPf5Ii9Aq8YIcAP7yc9HPmVexCzYfRf
	XsMPWydHOovXHUII9EtcD9huXIx9dORaneVzcsTXuQOkk2OBTQLWSGk1+nhWeOiGWqFquR1CFWH
	PzDR2UXTDvdf8FMxeVoW9jz3MWqSihYcDACtx1QE5DGEOoYfGie4jGo60ahuTIqzpAoFYfIOvc+
	yY/VsZII7m4EGE/2SHOULWlyU7V1TTzW/GOkTQqwet9Cjzx16fcRfRLjbCo0OEuytN3uP0lSG29
	SxW9seWkLq7uuCek0rg5z0DpDCrlSTSatwHGvHuToHIQefiJFhjtCX5ali4aBTuO7QH5fWXODrM
	MCf4AyxvFJrAMJbAEKxaBj
X-Google-Smtp-Source: AGHT+IFjds2SJBGycL2SuHhwQHLH3bYoZmPtau2WcISFrPcM8JLn2BauR7tIIFylmYhvn0dRldBLkQ==
X-Received: by 2002:a17:907:9493:b0:af9:74b4:f4b7 with SMTP id a640c23a62f3a-afddd201b61mr242326466b.45.1755612775940;
        Tue, 19 Aug 2025 07:12:55 -0700 (PDT)
Received: from [26.26.26.1] (95.112.207.35.bc.googleusercontent.com. [35.207.112.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdb602ca0esm589785866b.2.2025.08.19.07.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:12:55 -0700 (PDT)
Message-ID: <550635db-00ce-410e-add0-77c1a75adb11@gmail.com>
Date: Tue, 19 Aug 2025 22:12:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] pci: Suspend iommu function prior to resetting a
 device
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
 joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: will@kernel.org, robin.clark@oss.qualcomm.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 rafael@kernel.org, lenb@kernel.org, kevin.tian@intel.com,
 yi.l.liu@intel.com, baolu.lu@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
 helgaas@kernel.org
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <3749cd6a1430ac36d1af1fadaa4d90ceffef9c62.1754952762.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <3749cd6a1430ac36d1af1fadaa4d90ceffef9c62.1754952762.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_071258_451640_86B2496C 
X-CRM114-Status: GOOD (  31.27  )
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



On 8/12/2025 6:59 AM, Nicolin Chen wrote:
> PCIe permits a device to ignore ATS invalidation TLPs, while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out: e.g. an SVA domain will have no coordination with a
> reset event and can racily issue ATS invalidations to a resetting device.
> 
> The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.
> 
> Now iommu_dev_reset_prepare/done() helpers are introduced for this matter.
> Use them in all the existing reset functions, which will attach the device
> to an IOMMU_DOMAIN_BLOCKED during a reset, so as to allow IOMMU driver to:
>   - invoke pci_disable_ats() and pci_enable_ats(), if necessary
>   - wait for all ATS invalidations to complete
>   - stop issuing new ATS invalidations
>   - fence any incoming ATS queries
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/pci/pci-acpi.c | 17 +++++++++--
>   drivers/pci/pci.c      | 68 ++++++++++++++++++++++++++++++++++++++----
>   drivers/pci/quirks.c   | 23 +++++++++++++-
>   3 files changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index ddb25960ea47d..adaf46422c05d 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -9,6 +9,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/init.h>
> +#include <linux/iommu.h>
>   #include <linux/irqdomain.h>
>   #include <linux/pci.h>
>   #include <linux/msi.h>
> @@ -969,6 +970,7 @@ void pci_set_acpi_fwnode(struct pci_dev *dev)
>   int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
>   {
>   	acpi_handle handle = ACPI_HANDLE(&dev->dev);
> +	int ret = 0;
>   
>   	if (!handle || !acpi_has_method(handle, "_RST"))
>   		return -ENOTTY;
> @@ -976,12 +978,23 @@ int pci_dev_acpi_reset(struct pci_dev *dev, bool probe)
>   	if (probe)
>   		return 0;
>   
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 */
> +	ret = iommu_dev_reset_prepare(&dev->dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return ret;
> +	}
> +
>   	if (ACPI_FAILURE(acpi_evaluate_object(handle, "_RST", NULL, NULL))) {
>   		pci_warn(dev, "ACPI _RST failed\n");
> -		return -ENOTTY;
> +		ret = -ENOTTY;
>   	}
>   
> -	return 0;
> +	iommu_dev_reset_done(&dev->dev);
> +	return ret;
>   }
>   
>   bool acpi_pci_power_manageable(struct pci_dev *dev)
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b0f4d98036cdd..d6d87e22d81b3 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -13,6 +13,7 @@
>   #include <linux/delay.h>
>   #include <linux/dmi.h>
>   #include <linux/init.h>
> +#include <linux/iommu.h>
>   #include <linux/msi.h>
>   #include <linux/of.h>
>   #include <linux/pci.h>
> @@ -4529,13 +4530,26 @@ EXPORT_SYMBOL(pci_wait_for_pending_transaction);
>    */
>   int pcie_flr(struct pci_dev *dev)
>   {
> +	int ret = 0;
> +
>   	if (!pci_wait_for_pending_transaction(dev))
>   		pci_err(dev, "timed out waiting for pending transaction; performing function level reset anyway\n");
>   
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 * Have to call it after waiting for pending DMA transaction.
> +	 */
> +	ret = iommu_dev_reset_prepare(&dev->dev);
If we dont' consider the association between IOMMU and devices in FLR(),
it can be understood that more complex processing logic resides outside
this function. However, if the FLR() function already synchironizes and
handles the association with IOMMU like this (disabling ATS by attaching
device to blocking domain), then how would the following scenarios
behave ?

1. Reset one of PCIe alias devices.
2. Reset PF when its VFs are actvie.
....

Thanks,
Ethan> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return ret;
> +	}
> +
>   	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_BCR_FLR);
>   
>   	if (dev->imm_ready)
> -		return 0;
> +		goto done;
>   
>   	/*
>   	 * Per PCIe r4.0, sec 6.6.2, a device must complete an FLR within
> @@ -4544,7 +4558,11 @@ int pcie_flr(struct pci_dev *dev)
>   	 */
>   	msleep(100);
>   
> -	return pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
> +
> +done:
> +	iommu_dev_reset_done(&dev->dev);
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(pcie_flr);
>   
> @@ -4572,6 +4590,7 @@ EXPORT_SYMBOL_GPL(pcie_reset_flr);
>   
>   static int pci_af_flr(struct pci_dev *dev, bool probe)
>   {
> +	int ret = 0;
>   	int pos;
>   	u8 cap;
>   
> @@ -4598,10 +4617,21 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>   				 PCI_AF_STATUS_TP << 8))
>   		pci_err(dev, "timed out waiting for pending transaction; performing AF function level reset anyway\n");
>   
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 * Have to call it after waiting for pending DMA transaction.
> +	 */
> +	ret = iommu_dev_reset_prepare(&dev->dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return ret;
> +	}
> +
>   	pci_write_config_byte(dev, pos + PCI_AF_CTRL, PCI_AF_CTRL_FLR);
>   
>   	if (dev->imm_ready)
> -		return 0;
> +		goto done;
>   
>   	/*
>   	 * Per Advanced Capabilities for Conventional PCI ECN, 13 April 2006,
> @@ -4611,7 +4641,11 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>   	 */
>   	msleep(100);
>   
> -	return pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "AF_FLR", PCIE_RESET_READY_POLL_MS);
> +
> +done:
> +	iommu_dev_reset_done(&dev->dev);
> +	return ret;
>   }
>   
>   /**
> @@ -4632,6 +4666,7 @@ static int pci_af_flr(struct pci_dev *dev, bool probe)
>   static int pci_pm_reset(struct pci_dev *dev, bool probe)
>   {
>   	u16 csr;
> +	int ret;
>   
>   	if (!dev->pm_cap || dev->dev_flags & PCI_DEV_FLAGS_NO_PM_RESET)
>   		return -ENOTTY;
> @@ -4646,6 +4681,16 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
>   	if (dev->current_state != PCI_D0)
>   		return -EINVAL;
>   
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 */
> +	ret = iommu_dev_reset_prepare(&dev->dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return ret;
> +	}
> +
>   	csr &= ~PCI_PM_CTRL_STATE_MASK;
>   	csr |= PCI_D3hot;
>   	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
> @@ -4656,7 +4701,9 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
>   	pci_write_config_word(dev, dev->pm_cap + PCI_PM_CTRL, csr);
>   	pci_dev_d3_sleep(dev);
>   
> -	return pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
> +	ret = pci_dev_wait(dev, "PM D3hot->D0", PCIE_RESET_READY_POLL_MS);
> +	iommu_dev_reset_done(&dev->dev);
> +	return ret;
>   }
>   
>   /**
> @@ -5111,6 +5158,16 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
>   	if (rc)
>   		return -ENOTTY;
>   
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 */
> +	rc = iommu_dev_reset_prepare(&dev->dev);
> +	if (rc) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return rc;
> +	}
> +
>   	if (reg & PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR) {
>   		val = reg;
>   	} else {
> @@ -5125,6 +5182,7 @@ static int cxl_reset_bus_function(struct pci_dev *dev, bool probe)
>   		pci_write_config_word(bridge, dvsec + PCI_DVSEC_CXL_PORT_CTL,
>   				      reg);
>   
> +	iommu_dev_reset_done(&dev->dev);
>   	return rc;
>   }
>   
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d97335a401930..6157c6c02bdb0 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -21,6 +21,7 @@
>   #include <linux/pci.h>
>   #include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
>   #include <linux/init.h>
> +#include <linux/iommu.h>
>   #include <linux/delay.h>
>   #include <linux/acpi.h>
>   #include <linux/dmi.h>
> @@ -4225,6 +4226,26 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>   	{ 0 }
>   };
>   
> +static int __pci_dev_specific_reset(struct pci_dev *dev, bool probe,
> +				    const struct pci_dev_reset_methods *i)
> +{
> +	int ret;
> +
> +	/*
> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
> +	 */
> +	ret = iommu_dev_reset_prepare(&dev->dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU\n");
> +		return ret;
> +	}
> +
> +	ret = i->reset(dev, probe);
> +	iommu_dev_reset_done(&dev->dev);
> +	return ret;
> +}
> +
>   /*
>    * These device-specific reset methods are here rather than in a driver
>    * because when a host assigns a device to a guest VM, the host may need
> @@ -4239,7 +4260,7 @@ int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
>   		     i->vendor == (u16)PCI_ANY_ID) &&
>   		    (i->device == dev->device ||
>   		     i->device == (u16)PCI_ANY_ID))
> -			return i->reset(dev, probe);
> +			return __pci_dev_specific_reset(dev, probe, i);
>   	}
>   
>   	return -ENOTTY;


