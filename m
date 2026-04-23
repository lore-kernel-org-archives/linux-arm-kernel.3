Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2E0FDEE28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHs1SB6C6q+VxGSLs4PEu15EKKlh8msoZuhCPbHV/WQ=; b=B6/hI7bbuXnfzBdu+XljXNntEG
	TQvN2ZcU75xw/dpOqG3qB8/0H1Ae8rxm1ojN0Hzhw8bhmLdKO0huSHChbPev7yL/JC2JYLmjD5F21
	fs+3dajOPrrOgrzo8gVmayIZNPVa6x4MwW326j1Ybc0yuhuI05T196+gwX+zDqwq8q40AADrZrZit
	fR3hBdyFcb0UpIiEvJ0tO5QhK69B6SyMCt9Fc0GMseA6b1RWhx3Igz7rDyy47he6GyFw3++Z0+msg
	UoZbv2H3gtDnCMuoiLaA4QfM4hS+txjJb5Ww1K38nhG7sGdxWoVUENU5ccM/sREiOxMGS7y30Q3fm
	KqOxBH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2nK-0000000CO83-2Rd7;
	Thu, 23 Apr 2026 22:45:14 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2nH-0000000CO7S-1cLD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 22:45:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8eb5ad01402so554351385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776984310; x=1777589110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHs1SB6C6q+VxGSLs4PEu15EKKlh8msoZuhCPbHV/WQ=;
        b=eWOVKi5oS9QsoW9SOmCkktz3SulSAZ74Qh7dFnhpE6h9u/rwOL4boc+0IWuwiLna94
         FQ+8UCR8L8JBeGHsiKhEyf1npZ4v5IG3OFGrYD+ogTBX4mAhVc4dvb7xfeZ/WMb5XRwb
         2YJ5obE/k9US9C+NfU95ibVUF7ebm98Y8osptlPfzdGrhtY6cLtbmkC1lbEoseW7jsMn
         Mgm0TWCYhwPXWgVN3V9Cb05Vi6Z4Ier/t4mhvyt/ynHTgi7AVYPtmmVrrLUDFAhIN5og
         eEVa7MNS9NmlKFdE/rp4NRRpevQkex6QuysbyRRbIdIzTceZtG8nt76e8qPlxaMtmFL3
         5mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776984310; x=1777589110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHs1SB6C6q+VxGSLs4PEu15EKKlh8msoZuhCPbHV/WQ=;
        b=mhY8ntcT28G+Ne+GHkWi08msx3sSNf3DJyW0VtxWtvO22X+JmBJP+vmxYFKFEQ6s6u
         8qycVaRGmBYQYigj4Wgu0gWfPBz3yPb+iw9HE1w2WGu8EnzVwIVKQRxFT93/xdFWBMYx
         6gd/swfMQH2QlzfjpBfwRb8jYWrGY9SvXe47rkabBhDMDR2+EdwaMvtuuTRFZXRri5eh
         fwcSBi9Y6f3mKRuqy5aVz/W3ILuY7ZCX/P5whlw2xId0MnY5Gikr6wsRATk1tjHoN7gt
         AL/GaIHvK4n1WTCnBs/zOubLS4oH3MAHxZXCy2MgJAm7ebPYXyiVtwMt1zOrfj6BT84D
         Uagw==
X-Forwarded-Encrypted: i=1; AFNElJ9ulxFe9z8arytzAZ4cmPKYq8KPHTZQnZtoq12YKwYHfr12LZTbEsaZlFUKYFZX6f/m+dyISXig+QU+2SVzkuLx@lists.infradead.org
X-Gm-Message-State: AOJu0YyPImxrIE5tS4YyV8oHBHa7tCP3T9mdmqZWB0oBGIE333D5TtHU
	OIVsoZ72gX36vWbJPq/9u7SG54DvJZISvw/nFEIh8cxbjz2Lp+/KIKzbHwCGeIwyqVo=
X-Gm-Gg: AeBDievMckCwMUZL9SPo9vZJh6UCoMW32wNGYk+w79GaU+TaUb6rdVVZMAP6p5bOtJA
	DcMbYth8lYVO4hRyRiqND6cYR1PHf299x/h1HUqcMVipr7bDVqX66dyb+PrOd1iDRzDQLvtyhvu
	8iBlKC6cmT+OD+DPQkWtiw/y8wTDGv/4DzeZF+qrXbYIYDmvQtJ+86Z9G96wsrtRj/ifPXCJbT5
	QXYG1q9xl88DHukdu+XN8jAGmZHA5HnUwT7Cw+P3kIcmImiiIQbsNcgA2y7u0zWWnLpesWQIK38
	iAlLNYthkbaHnpfVeG0E0QdW96btdLfyFr5vSWMBQijMv3gc8OIh0zQqCz/wWWiPABja8CvPQB4
	ViAa74Nk28gSdcwwK3Dqx8Y0Ii6wBc4xbsReJ0cm0shJU826psBhutjWDIASVIzq9S1Z0FYQ7YG
	b2ZW1cCrt9s99qWATC7AObmVqOwA2F4wMqZakbVmXyTbBcAuilamK9qMFnIgV6h96kphOfBRV48
	lhAXY+cJtn7Nvrt
X-Received: by 2002:a05:620a:4554:b0:8ee:2c17:2ff3 with SMTP id af79cd13be357-8ee2c1733c4mr2169354085a.0.1776984309768;
        Thu, 23 Apr 2026 15:45:09 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb9becc72dsm1271207885a.34.2026.04.23.15.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:45:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wG2nE-0000000GLqe-155A;
	Thu, 23 Apr 2026 19:45:08 -0300
Date: Thu, 23 Apr 2026 19:45:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: rafael@kernel.org, lenb@kernel.org, saket.dumbre@intel.com,
	lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	joro@8bytes.org, robin.murphy@arm.com, nicolinc@nvidia.com,
	praan@google.com, vsethi@nvidia.com, sdonthineni@nvidia.com,
	kthota@nvidia.com, sagar.tv@gmail.com, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, acpica-devel@lists.linux.dev,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 3/3] iommu/arm-smmu-v3: Honor IORT Root Complex PASID
 descriptors
Message-ID: <20260423224508.GU3611611@ziepe.ca>
References: <20260423191417.2031652-1-vidyas@nvidia.com>
 <20260423191417.2031652-4-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423191417.2031652-4-vidyas@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_154511_458541_83EC3403 
X-CRM114-Status: GOOD (  22.43  )
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

On Fri, Apr 24, 2026 at 12:44:17AM +0530, Vidya Sagar wrote:
> The SMMUv3 driver currently calls pci_enable_pasid() for any PCI
> master that exposes a PASID capability, regardless of whether the
> upstream Root Complex actually supports PASID and regardless of the
> RC's declared Max PASID Width. With IORT spec E.c (RC node revision
> >= 4) firmware reports both, so we can do better:
> 
>   - If the IORT Root Complex node says PASID is not supported
>     (Flags bit 0 == 0 at byte offset 36), enabling PASID on the
>     endpoint is futile - the RC will not forward the PASID prefix to
>     the SMMU - so skip pci_enable_pasid() silently.
> 
>   - If the IORT Root Complex node reports a Max PASID Width (bits[4:0]
>     of PASID Capabilities at offset 33), clamp the endpoint's
>     pci_max_pasids() result by 1 << width before computing the SMMU
>     SSID width. This prevents master->ssid_bits from exceeding what
>     the RC can actually carry.
> 
> Both behaviours are gated on iort_pci_rc_pasid_max_width_known(), i.e.
> RC node revision >= 4, so platforms with older IORT firmware see no
> behavioural change and continue to enable PASID purely on the basis
> of the endpoint capability.
> 
> Use the new IOMMU_FWSPEC_PCI_RC_PASID fwspec flag (set by IORT) for
> the support check, and call iort_pci_rc_pasid_max_width_for_dev() for
> the width clamp; both pieces are wired up in
> iort_iommu_configure_id() by the previous patch.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f0..2b269307fd33 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3071,16 +3071,28 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
>  
>  static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>  {
> -	int ret;
> -	int features;
> -	int num_pasids;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>  	struct pci_dev *pdev;
> +	int features, num_pasids, ret, rc_width;

Don't reformat the code like this.

Otherwise the series broadly makes sense to me

Jason

