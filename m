Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53331CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNOzcXMScA76uJWwzh9BJczyYeIHAq55KZT2qzZwpSA=; b=yjeBSOeOiaqzBtHvuxj1Zcrnda
	LAO49cNKnBgyafKBljikaTRoph8wBocqCkKOlURAhjCUdQASCi0rWqCn3+DdlQ6qTBx92YxPDUh66
	MzBprOS19zrNJlaZ7aPkVnfM4Dt5CIzIk6lD4HtkApH016jNjiYVYYJePmmgbuUmRHVIGl0JE2Lq6
	xFYp0ITfcA6GtAszeXS64+GixR3b8bOAwejsuxUYYj0ap1hnNOQi5yPyPGU1PtC1fUdzvJM/ZzDni
	w1boXCz7YU2nxg3PEFjPNrUKInGBVoRuef2qegWKIIKYbYQ3tpFDQ/GaPAjdr7zJ234Dz++PWgaBz
	8kX04lIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScbL-00000005ut5-3yNJ;
	Thu, 28 May 2026 15:24:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScbK-00000005usS-0EBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:24:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b46da8c48eso145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779981889; x=1780586689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNOzcXMScA76uJWwzh9BJczyYeIHAq55KZT2qzZwpSA=;
        b=kgPldXzko5qrbG3cTVmsC3SyG11RkGCqIleojnyo5Lw8O4gUO+m2lhcpX8IFLjextp
         ZluQ0h6yracvTshADMY0mqLmWMFuXYVzAG1FZqvN/8Wwq/pVakHAuqC4SyGJI9hmuWl/
         7ITR8MyQQCz7ULYvaz1Gb+KwCgYhTtdxvLm4cB+CSyAqzzROwW10v9Vy5QlcOf0d9OXR
         X+GSCSEUr4waz6W1mNNUfFLcWU5ZL1NsrVmKStVyzEk3JymnPSyO9dI2OP9sh/bwYC5G
         mPlLpudY4tHpEVZ8w2XLdg3pisTOhL0NFgEox8xIF1qAwbinZ3YbjAmbYqG/C4iyeQOp
         rJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981889; x=1780586689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNOzcXMScA76uJWwzh9BJczyYeIHAq55KZT2qzZwpSA=;
        b=FRG+QO4Yz+tjV805wLTZFTQ+OHWxFAckkEvWwokOXNT78DYycqykcx4mTMRXL7+TL1
         wRWwybgy2lWiF7sReJpIymOni3GVSrLSmkWxrv60e4mWo4GG0lH/PBhpBNf1jz6Ha+fl
         Lc7ntvMpV42ljpcsoqdIFJQ3/7zznIbf4kxrjWXaKV1AgDW2yg+YPLxdHoqxzkJQZYbX
         pa5YxRA0BI9V5cDuelavGWFynFghLzLc8NnghVJP63QzWGCaWUovv8OvFHy5oXRrvjGV
         MnmC9NF/7Und/7FrzUFsQGZJvN8tKWwBROGZK+5qKFDhkY/tuDKSHq7vdXrlqEe7lqAe
         0TLg==
X-Forwarded-Encrypted: i=1; AFNElJ9QloJRHwBMFrP/iHaXvx4RTr/mvx1T/Zgw92sRYceuTniUssJyLp6Y13OOyIu/6BSUL4Ebt+f8q1awulDgOkn8@lists.infradead.org
X-Gm-Message-State: AOJu0YzwWoXA9Z7sGmcCuGi3Pj9qW8t87LIzi7e44cSXQ3P8rPPxrhtr
	+6PsS/2EHZeqJcnjlXlbUBPfOM95vIrValTjrlOAdAL2LhzBj97Lqh+RjFeHdngx1A==
X-Gm-Gg: Acq92OEMAZulpHdjJ3vhR/+Vqh4gF+quPdC0MVSSwiIvY1ZNRJ0vHlqJw3f35TPBcjp
	QNUw0ikg9jNNArMdC1ySNongRWhNqVweLQa+bsK5+9MvLQQmi0vYzvZbHWMmLR1gOMkJRLTS+N1
	hNqtCU/BoxyMxsdL5+spsqjSmQVSe6StPVZ+g2KpYXTnoggpblZJz1wmuntztk+atQl+ijOdk2z
	R8B6wkJ9QixaFZmZ+hMA/rsO46s44t3M8dVytUfncvXfayb6NYm1ELAJRvT270wT8kwRxnGYsBT
	I3XZE0DqaB92qG7HNtG0c14n3XB3jqTwOo3GC0Hdqp28ORNpwBRuQUuCeiON8LYvUgqqpvkBK7K
	OBDmd8vnMJ9Q4oxHxwR1NIMXauEnBgD9L9dUNotqy83xMQGovMeF4SqFYrpdBjpiB64UsolHGoK
	YarKccgjCPcrmD/76sHBqg8IfUI1kGjk0QsFpD8Vp4gJYYy8Z0+hLOwc1q7AA/2J4LVTiH
X-Received: by 2002:a17:902:d50f:b0:2bc:dc0b:ab29 with SMTP id d9443c01a7336-2bf0bb6f798mr1375375ad.0.1779981888366;
        Thu, 28 May 2026 08:24:48 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm28676365ad.37.2026.05.28.08.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:24:47 -0700 (PDT)
Date: Thu, 28 May 2026 15:24:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <ahheOF8L0aGMttcI@google.com>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_082450_112883_CED2E46A 
X-CRM114-Status: GOOD (  30.65  )
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

On Thu, May 21, 2026 at 01:34:22PM -0700, Nicolin Chen wrote:
> When a device's default substream attaches to an identity domain, the SMMU
> driver currently sets the device's STE between two modes:
> 
>   Mode 1: Cfg=Translate, S1DSS=Bypass, EATS=1
>   Mode 2: Cfg=bypass (EATS is ignored by HW)
> 
> When there is an active PASID (non-default substream), mode 1 is used. And
> when there is no PASID support or no active PASID, mode 2 is used.
> 
> The driver will also downgrade an STE from mode 1 to mode 2, when the last
> active substream becomes inactive.
> 
> However, there are PCIe devices that demand ATS to be always on. For these
> devices, their STEs have to use the mode 1 as HW ignores EATS with mode 2.
> 
> Change the driver accordingly:
>   - always use the mode 1
>   - never downgrade to mode 2
>   - allocate and retain a CD table (see note below)
> 
> Note that these devices might not support PASID, i.e. doing non-PASID ATS.
> In such a case, the ssid_bits is set to 0. However, s1cdmax must be set to
> a !0 value in order to keep the S1DSS field effective. Thus, when a master
> requires ats_always_on, set its s1cdmax to at least 1, meaning that the CD
> table will have a dummy entry (SSID=1) that will never be used.
> 
> Now for these devices, arm_smmu_cdtab_allocated() will always return true,
> v.s. false prior to this change. When its default substream is attached to
> an IDENTITY domain, its first CD is NULL in the table, which is a totally
> valid case. Thus, add "!master->ats_always_on" to the condition.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Nirmoy Das <nirmoyd@nvidia.com>
> Acked-by: Nirmoy Das <nirmoyd@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 ++++++++++++++++++---
>  2 files changed, 73 insertions(+), 9 deletions(-)
>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

>  
> +static int arm_smmu_master_prepare_ats(struct arm_smmu_master *master)
> +{
> +	bool s1p = master->smmu->features & ARM_SMMU_FEAT_TRANS_S1;
> +	unsigned int stu = __ffs(master->smmu->pgsize_bitmap);
> +	struct pci_dev *pdev;
> +	int ret;
> +
> +	if (!dev_is_pci(master->dev))
> +		return 0;
> +	pdev = to_pci_dev(master->dev);
> +
> +	if (!arm_smmu_ats_supported(master)) {
> +		if (pci_ats_required(pdev)) {
> +			dev_err_once(master->dev, "SMMU doesn't support ATS\n");
> +			return -EOPNOTSUPP;
> +		}
> +		return 0;
> +	}
> +
> +	ret = pci_prepare_ats(pdev, stu);
> +	if (ret || !pci_ats_required(pdev))
> +		return ret;
> +
> +	/*
> +	 * S1DSS is required for ATS to be always on for identity domain cases.
> +	 * However, the S1DSS field is ignored if !IDR0_S1P or !IDR1_SSIDSIZE.
> +	 */
> +	if (!s1p || !master->smmu->ssid_bits) {
> +		dev_err_once(master->dev,
> +			     "SMMU doesn't support ATS to be always on\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	master->ats_always_on = true;
> +
> +	return arm_smmu_alloc_cd_tables(master);

Nit: I'm not sure if I'm getting this right, are we saying we *need* to
allocate CDs for CXL.cache cases in the probe itself because STE.EATS
requires Config=Translate with S1DSS in bypass?

Does this imply that active transactions can be occurring *before* the
first domain attach? Are 

Thanks,
Praan

