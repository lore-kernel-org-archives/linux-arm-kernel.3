Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77805C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 19:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlfPbl9U0b/o5N9rX3Vqr5rZsZeMWo7A8d3jNHieFXg=; b=SATm6tmPowunV/z22iLEdxxcOv
	/eHm4C1tBsGwloxKi6F3rR/f2KSEsAWruqw2UF8I1wApoQvd3YNOt00Up2wuE7G91opWDoodO/fPR
	S8OkJbw0aJyh4VD8JIMbwQfJxoG7hQlYt7nwMesvwnXjOqOzJnpR49uAYFWcF8Mu07W1md1Sh3MqG
	6d7sag0SI8bvBltFEiHAWbow8cI0n+8zTWHXMAf67lxmlGuWAEr4nqLiblLkCcY24Qph3BHshBRwB
	YtU4dr1/X6T7/O6IQEFd+vOG1LAWYX96ycS18R4L9Aokrkyy+GtneRl3I7Qp5n1UC+FV4KUbt000d
	uxbp7pIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGkF-00000007YG6-15lb;
	Sun, 25 May 2025 19:10:51 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGgb-00000007Xu4-3gOQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 19:07:07 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4767e969b94so26650461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 12:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748200024; x=1748804824; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlfPbl9U0b/o5N9rX3Vqr5rZsZeMWo7A8d3jNHieFXg=;
        b=OJA1sQN/xpx2qPSv0WWnHiPx+S09DfnXLXYW4zsU0VJ3J+mlR9eIivjSvzo6I1H9jU
         W6uSyVJqr1rfVoTSqp+iuA9y6whI8GmoIePV6sflhKRLbPiWTqWv2yedo/DG/DIjSD8k
         VcwZ7a4nC9/TSKob4K774IgtDfAqeJHVq5f+naAJBW1nzDqgfeJKdY738JSgUMwVYuPW
         g8ZoI7nPNq1iarkRahbvnCzSmeUopSK3Rz0Locl/c7QPnKwb0l0i802666RkWic4PWcU
         zEl4SCxZPvit7KbC2oZJthFN/NvrRazN079pmZtgm6fF9KtWoGWRp9sqkR932P5g0Y0d
         Q+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200024; x=1748804824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlfPbl9U0b/o5N9rX3Vqr5rZsZeMWo7A8d3jNHieFXg=;
        b=v0eFCP1ym6bqcCdQJQ7m226grcjsnzFNYALUetJpVDN6wzPijW8H5rEI5hGnbqkIZz
         6few+Kfj7CnC2hpvrp0NW6FZMD3OtFBB0jwwwWtPliMP52PanRsl8HLsRvaz5curWm0N
         Qao7hZqZtTAcQzzA1pwze98O8OQyJ24I8hpic3uPALwNuik8QH/g1ddASCLfaDpL4VH2
         siAFEMdVnNzbg6Rme+rTezYwkDXEZgEC/CJtZJdBkr9lUE46zWzp2ubsKTazzfu4klT8
         P1ZGhOO4REUijCJ2BFf8JVAy7iDpmbpI7Ixj4HEGeDpTlKnQb4bYrG2yHwbYCLxp28U/
         u0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvHcOTHQFfbQxZjvqJ8xljby2/VlDLW7bMcfDmaGJl/QQVX6UXlooa1BXQLdP4Oml5dfE5IaO0Ojr6EEsjHiqS@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQIR+KQfjV9ltfXJdB1p+EDgz1Dm+98D5D/fSBJ7coAaYpaof
	Tw33hYiaLrHxgqjeIjaLNtVVu5RsKxyTgm+yqd6w2GBhkfPDkOfX4V1hOXlKvgJRqhEzxivGGbK
	wlVBMjbk=
X-Gm-Gg: ASbGncu+/bW7JCqeA7rmiKz4MFT3jCeVPZI05/Iucvb2BeAIMfIYnN+IbpJdSMK9Avf
	DVe+sMoHX8EhLtS5EUGrXGh9+zJavxhy857De7xE8AuH6ATBgnTSvWwm8Mn6eGYeP/ySM8nYcJJ
	aL/Jiv1EPtrnjnjlsKU4nZo1XdErf7U6n44WdQkOnCrW93uEOK5xjc3SQS3fFMJJCHWQhXfj7JN
	9aJRd7vhISciwY2+M/KehrTJmfwUVFq/3RwHyKbWspvAnwSzpsjWGmSHqzqzP2P0fEIKAaJo148
	gX8O7MLzfHetrZK9NMf7o0x0/YYrVtSBwKz25yNoDofMezHKhIpqcY9yWCmQUeTcxi5b374EeB1
	pMgrratGljIPDh6lr040QZxkbJYM=
X-Google-Smtp-Source: AGHT+IEsK8RsIZHAhqzNbJPFGKthMn51tZwQ52JiopY7fu+XaQ8UU+nS+s5NnIXGcLb0DNTM1neWbA==
X-Received: by 2002:a05:622a:550f:b0:494:95b5:ce38 with SMTP id d75a77b69052e-49f4781f4damr107883391cf.42.1748200024664;
        Sun, 25 May 2025 12:07:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b7400sm1472991785a.66.2025.05.25.12.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:07:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJGgZ-000000003eK-2F45;
	Sun, 25 May 2025 16:07:03 -0300
Date: Sun, 25 May 2025 16:07:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250525190703.GD12328@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_120705_922287_0D625689 
X-CRM114-Status: GOOD (  31.67  )
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

On Tue, May 20, 2025 at 03:42:24PM -0700, Shyam Saini wrote:
> Hi Jason,
> 
> apologies for the delayed response.
> 
> > On Wed, Apr 16, 2025 at 11:04:27AM -0700, Jacob Pan wrote:
> > 
> > > Per last discussion "SMMU driver have a list of potential addresses and
> > > select the first one that does not intersect with the non-working IOVA
> > > ranges.". If we don't know what the "non-working IOVA" is, how do we
> > > know it does not intersect the "potential addresses"?
> > 
> > I had understood from previous discussions that this platform is
> > properly creating IOMMU_RESV_RESERVED regions for the IOVA that
> > doesn't work. Otherwise everything is broken..
> > 
> > Presumably that happens through iommu_dma_get_resv_regions() calling
> > of_iommu_get_resv_regions() on a DT platform. There is a schema
> > describing how to do this, so platform firmware should be able to do it..
> > 
> > So the fix seems trivial enough to me:
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index b4c21aaed1266a..ebba18579151bc 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -3562,17 +3562,29 @@ static int arm_smmu_of_xlate(struct device *dev,
> >  static void arm_smmu_get_resv_regions(struct device *dev,
> >  				      struct list_head *head)
> >  {
> > -	struct iommu_resv_region *region;
> > -	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> > -
> > -	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> > -					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
> > -	if (!region)
> > -		return;
> > -
> > -	list_add_tail(&region->list, head);
> > +	static const u64 msi_bases[] = { MSI_IOVA_BASE, 0x12340000 };
> >  
> >  	iommu_dma_get_resv_regions(dev, head);
> 
> my understand is, this hook is not called for all the devices, eg: pcie dts node
> doesn't use [1] "iommus" property instead it uses "iommu-map" property
> as a consequence, [1] while loop exits prematurely and iommu_dma_get_resv_regions()
> is not called, so there is no IOVA reservation for the pcie device. 

I can't really understand this sentance.

The above is the only place that creates a IOMMU_RESV_SW_MSI so it is
definately called and used, right? If not where does your
IOMMU_RESV_SW_MSI come from?

This function is also the only thing that computes the reserved ranges
that iommu_get_resv_regions() returns.

As above, I've asked a few times now if your resv_regions() is
correct, meaning there is a reserved range covering the address space
that doesn't have working translation. That means
iommu_get_resv_regions() returns such a range.

If you don't have that then you have a bigger platform problem, IMHO,
as vfio/iommufd only respect reserved ranges.

Otherwise, what is the issue you see, exactly? Did you even try it?

Jason

