Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FF9CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urgZfwF4+fq0Bvx57GpO772zcrt3WJsYUh542YPK0gU=; b=Wps7OHIUzY0qVC0FNf53cOsJOP
	6lvr8mof2kTXNUIej3czTFmdDjzK8JbYG+L42IcHzvxhlGFQGpPxa+TQund/pcUSaixqC2niLyHHm
	XdWRGo1uc3/o6+0brR2esu6FLImJzddyhD2Fw0EYGaD6p796y0MEwCVzBAeIWvQXWcfRvVUucu1VO
	AeWsWF9tDCEPIJvfqVGFCpTI1NIOmxSvlCAKOmGwQUdrIRSmaPmSGxMFNz3xc9wGl7aNcFJW1meku
	mFdTSORxQDTAV949C1XxeevsXf4l6lKGILSzeroBWQhdIgPg6arIFcWqoLK2/f4F82MxBVGNSXTis
	hKpxUR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4I9-00000004hct-1P7b;
	Thu, 07 May 2026 19:21:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL4I7-00000004hcR-1bbC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:21:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 12:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778181706; x=1778786506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=urgZfwF4+fq0Bvx57GpO772zcrt3WJsYUh542YPK0gU=;
        b=RoBgaKo+tQjrWEXalEwH5spzU6JN+5MyFDNPzVSiO9cVeUFvIM5Ynt31IVUjT/ED1H
         9ItOW+eAA2cdU8526uBr9hxdkjm8+nKosAr4zWq8Cd6VWMhEE1TE40xgZLxqy+e4fKaj
         SjVp5BvWvt5gHExO/KLddlObyDlW0Iq9pCsYRxkeoL9Z5tuq0a2gxP6oLoAEhAuDABaC
         vTiTBYERW2OHXSNPpMMxo2g0whwn5eKwPFug+j1o3xjQ4lpsE/CSGoaQU8e6jVr4CAPt
         SNg48UImaUttbI49aHZpOuAfIBOYsZu6MZdpaJcqfbEAXMzxjNV3wqqCUrScthJQWAbM
         6j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181706; x=1778786506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urgZfwF4+fq0Bvx57GpO772zcrt3WJsYUh542YPK0gU=;
        b=arY5F5I8X+9O8go+Xm0x/ytKbdwMR/xg0r0bu1DBa2EY1WC78RYbEAOtgEjLfZy5os
         H1meTgxaoORaxtsFXiaYzxGR3NI6la3RD49w73AK8sI2XqIAK+oYdWNVVppuDXrYls57
         v4x/Uo9NNpfo8jo5TFCdHR+HC9KzJSqGlCq0uox8izLPT/lZw60wA9ydd4/n/co9AdPY
         JpqpBVSbXq0edfpikVRB6lmFgB2nmhf+1pF4KrvsHzD038i2uwnPrBkxLReuPQsFPrTh
         ow93siIvpuGcgyMRrAOY7EaXAxF4YKqlGTR0Th98SO6RjHbFmAmvSpgNHPbAIYl8WTWM
         DgHw==
X-Forwarded-Encrypted: i=1; AFNElJ8ybZ9DNPU+aDyNeHqrQ56OVVaWgXd1HHwY3xlMNcv1lpBCAlYSSX1VHR8HVYZ9kccsiC+O9CEIqNOXnMJJxerD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi2oVxIEwpnD9PZ03QlvEdTnT6iSOSTTr3JBnEcIAcaA00+kZT
	DFhzqGHPdCJOY1QEwZYc7177/jkfC2FXSH3xqXn237jEGgRh08wrwzNskO9LrfrMGw==
X-Gm-Gg: Acq92OFBKFRHIthy2pBmf/qFXnQdT2xcQcCnbxQEFpmhRU77/wgyaDTaudhA/HDBIWS
	DhecOzkNanFECBlQOqngE03RKTJIqprGAKcLmPPm0Bdlwby90TFoGWaZam2nZeVmDcmjS7MlKrx
	SWqdp4+W8/rcqbgCbWZ6xujDOzFlprkuz9jRnLe5X4BS+6JdDW5vqarP3MYtBgMUS1cHRuUsPM/
	qYEX9AK3jIUZIsY96Gu2FRasDA8iOvd5iSMwanUeulXHn3JlS8oNkdNvbU1NMPrXZ8ECcp8OtxN
	K09bZq4w/y51VLuPQB7EQyZJGQqdV/Kl3IqbI1ql83+nWJ8dNvy6hAq0RpkQCnKgBotSu/wlYX4
	qXQLHDPKYYS7NFv7WZccdUIx/LYmIewCltBQF+bWpEkK4SQhQnbOK5pJHc0uixvmReJ/1apm3Pu
	mwSBRSuM+ew5mqoCxFLg4hpk0jXZJFLEFbEqsnnTZV1MpAbjj238vaOLtreMo3Zl9BtswP
X-Received: by 2002:a17:903:3c6d:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2bae9a8bf41mr779895ad.8.1778181705676;
        Thu, 07 May 2026 12:21:45 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664735c942sm213564a91.1.2026.05.07.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:21:45 -0700 (PDT)
Date: Thu, 7 May 2026 19:21:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Yigit Oguz <yigitogu@amazon.de>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, dwmw2@infradead.org,
	suravee.suthikulpanit@amd.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lilit Janpoladyan <lilitj@amazon.com>
Subject: Re: [PATCH 2/3] iommu/vt-d: Add PCI segment and vendor:device ID to
 DMAR fault logs
Message-ID: <afzmQ6FieJ2YIt9Y@google.com>
References: <20260506150541.60467-1-yigitogu@amazon.de>
 <20260506150541.60467-3-yigitogu@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506150541.60467-3-yigitogu@amazon.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_122147_424928_3DF72305 
X-CRM114-Status: GOOD (  24.20  )
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

On Wed, May 06, 2026 at 03:05:38PM +0000, Yigit Oguz wrote:
> Include the full SSSS:BB:DD.F address with PCI segment and
> vendor:device ID (VVVV:DDDD) in DMAR fault messages. Uses
> iommu->segment for the PCI domain and pci_get_domain_bus_and_slot
> to look up the pci_dev. Falls back to segment:BDF without
> vendor:device if the device is not found.
> 
> This brings Intel IOMMU fault logging in line with the ARM SMMUv3
> event decoding, making it easier to identify faulting devices
> (e.g. after FLR) without cross-referencing lspci.
> 
> Before:
>   DMAR: [DMA Write NO_PASID] Request device [86:00.0] fault addr 0xe0000000
> 	[fault reason 0x05] PTE Write access is not set
> 
> After:
>   DMAR: [DMA Write NO_PASID] Request device [0000:86:00.0 8086:1533] fault addr 0xe0000000
>   	[fault reason 0x05] PTE Write access is not set
> 
> Signed-off-by: Yigit Oguz <yigitogu@amazon.de>
> Signed-off-by: Lilit Janpoladyan <lilitj@amazon.com>
> Assisted-by: Claude:claude-4.6-opus
> ---
>  drivers/iommu/intel/dmar.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index d33c119a935e..225fa498d714 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1890,30 +1890,39 @@ static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
>  {
>  	const char *reason;
>  	int fault_type;
> +	u8 bus = source_id >> 8;
> +	u8 devfn = source_id & 0xFF;
> +	struct pci_dev *pdev;
> +	char devid[48];

Why not have a #define for this like you have for AMD and Arm?

>  
>  	reason = dmar_get_fault_reason(fault_reason, &fault_type);
>  
> +	pdev = pci_get_domain_bus_and_slot(iommu->segment, bus, devfn);

Not an Intel iommu expert, but I have concerns about using 
pci_get_domain_bus_and_slot() in this path.

AFAICT, dmar_fault_do_one() is running in a IRQ context & the pci_get_* 
family of functions iterates the global PCI klist. It eventually calls
bus_to_subsys(), which takes a plain spin_lock(&bus_kset->list_lock) [1]
which isn't IRQ-safe. Same thing with klist_put [2] called in klist_iter_exit

> +	if (pdev) {
> +		snprintf(devid, sizeof(devid), "%04x:%02x:%02x.%d %04x:%04x",
> +			 iommu->segment, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +			 pdev->vendor, pdev->device);
> +		pci_dev_put(pdev);

Same here, pci_dev_put call put_device which might sleep [3] and hence
shouldn't be called in hard IRQ context.

> +	} else {
> +		snprintf(devid, sizeof(devid), "%04x:%02x:%02x.%d",
> +			 iommu->segment, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +	}
> +
>  	if (fault_type == INTR_REMAP) {
> -		pr_err("[INTR-REMAP] Request device [%02x:%02x.%d] fault index 0x%llx [fault reason 0x%02x] %s\n",
> -		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
> -		       PCI_FUNC(source_id & 0xFF), addr >> 48,
> -		       fault_reason, reason);
> +		pr_err("[INTR-REMAP] Request device [%s] fault index 0x%llx [fault reason 0x%02x] %s\n",
> +		       devid, addr >> 48, fault_reason, reason);
>  
>  		return 0;
>  	}
>  

[-------------- >8 -------------------]

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/bus.c#L60
[2] https://elixir.bootlin.com/linux/v7.0.1/source/lib/klist.c#L209
[3] https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/core.c#L3794


