Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4F4C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYQ/bpAI/sDBdZirKSVzCU1z9UHeGrQNsjqHwc+cPlM=; b=sbjfaJfoz0RKyZ5EK97TT0vnRC
	kuCSuyT9ddcOPiKnLQEjtgRS2RanbAup8MNDT+RSvEv7f/fcNvqTQaOALHunivg/qHfMlvnWeSYBB
	zpd9WEquofseSYToa6st1nauuxUl97F3QTJmGHwIwPZZsd24EoO1Njdk9avPTovyLeRPxcYVqD3bE
	H85PDFZfRB+eHbTXWpkzlnGEzXTqsrtN0g8qzBO0xD0NzsmZ7GzWmqB+Fju9tlXH/myWifFnfjn5/
	xGQtBYk6nJkzj9mHju2xBD9sr24v5u0+P6rYtps1qAs8F8eRaK0XjoomJ4Zk3BPm8DNrItOpH9hOv
	BXi9PMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHZm-0000000DaJx-2pTS;
	Thu, 19 Jun 2025 15:53:18 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFcR-0000000DDai-1Xtt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:47:56 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6fafb6899c2so8241446d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750340874; x=1750945674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYQ/bpAI/sDBdZirKSVzCU1z9UHeGrQNsjqHwc+cPlM=;
        b=oGHt+buivVQCbb+JjowBO7xvNDD0Lg0gtugVAhgpJk9zLTn3hsmg1I9k3GgZ+ce7/M
         WZt+YSPhg4m5OVCEJSOXVD7nK/I4Cd1qDqTtG92kRRETkXt4BbpsSIzb2ppA7UCdtw85
         wQRLLGx9IHE3J6VUNwYkWxsPte56INOoS+Bzw3SHMB2rwSYoMF6nAjhjobfB8ES9Dqyl
         WZMX3RmQSeRG0TYcLTWRsVY+/qoP6wOUKpcjNKi/NbKqp8uaiXITXIT9W0hrnfpkqylk
         16TJehgqzpaZ2IkbjmP7yVrTK/U5/34MnrdOoXJj1n4r5FDMOuf68Ao6lS7EzVgqN+z9
         QDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340874; x=1750945674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYQ/bpAI/sDBdZirKSVzCU1z9UHeGrQNsjqHwc+cPlM=;
        b=HjcjIuDyJSqt2/lHA2UVO4EfKdnH4q9FHETZZsdA3TjgPHz7hcaGYylrgxMW5TFaMB
         xRkpFZPt8o2/pG2TNOriocV6q3aVy7rew3NNQlLF5dscRD589dSnDWkFobWnV34oAgs9
         zOiC1EfHNiKDINGb5iQlc6lnnbL3s5/PWuTBLujqBGRpB+AWjFgZQBBI269wiynP6Zia
         Sev+5UK/3fTdGihGJ8qbZY65qw4I2kXImM1/RSuSjgwVwv+1ljRnnSYANq0L7ZnZ6CnI
         BUl53KY9MfbuHrYqOnaCrzkfa/tjZbOfZ8nHenyBGPU6WyR9wwcCZcsFGvU+HNuq/bHO
         TWqA==
X-Forwarded-Encrypted: i=1; AJvYcCVAeW17l3/M+Yjlub55wBRCMk+qqYAmADvKMnm6k5UL+IXP8AwUBq0LtMQxKRKt9qvuFe4nMVT3VH/IlbRJZY/B@lists.infradead.org
X-Gm-Message-State: AOJu0YzfKRg57UNkKXCUpYALQLgzpKaHbo22Gf4jkRq6pjTONaX+znDr
	2R07JreJpRyZEzAI7lTg7z1nMGFgpmXP1WGnnKwNpUW1JE1qDfX1FOx5eoj54Vo0MnM=
X-Gm-Gg: ASbGncucCIxscBqo4/07EiyPOgOB1nr+P7RTlQnnQ3WUdOcFw/wcYp0wnIl6OsOuxIs
	cg7nuSe6jKp3ZumCBZsscmUnMeJHoc3VWgZoDUDiCOm/TF+DxDFHruAaOk0vUAqKVbVWPKn59Bt
	S4ySgOtGfYaEoxXHAzXEkVh80qDQ2R+wIKLj1n6YvluND7sldULihXigjLMZQm8GznqZxVpOrNg
	1hSLOCp1ySeqSb+iOjDoNRVpgC0RXakd+sA3nBUmxrGzAWNqTFhULfOx0dnieU3cO4k6tHyO0i2
	7tDGfIQNUXEAAPX23SlDKdfuKYhttNbiZrFg3srMaPLg20UftX0kOAbCikoeUOjLtXecmAqO+9M
	/IhI9Rc1zgJmYnZtvGkFTlI+3Uhi/y6tvjJmVfzytayDt/f3Q
X-Google-Smtp-Source: AGHT+IGKKbkBGSks/IowBLfvye5xxNHuREVlgm3Gb8+mx970WjBDJXc/75SD+rQcFO1qF/3YmiJmhA==
X-Received: by 2002:a05:6214:5249:b0:6fa:ad2a:7998 with SMTP id 6a1803df08f44-6fcff77803fmr53005146d6.18.1750340873781;
        Thu, 19 Jun 2025 06:47:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd01508c18sm7586976d6.54.2025.06.19.06.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:47:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSFcO-00000007AG4-3E8L;
	Thu, 19 Jun 2025 10:47:52 -0300
Date: Thu, 19 Jun 2025 10:47:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250619134752.GB1643390@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619131232.69208-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_064755_410187_8C2BE468 
X-CRM114-Status: GOOD (  28.15  )
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

On Thu, Jun 19, 2025 at 03:12:24PM +0200, Benjamin Gaignard wrote:

> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct vsi_iommu *iommu = vsi_iommu_get_from_dev(dev);
> +	struct vsi_iommu_domain *vsi_domain;
> +
> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> +	if (!vsi_domain)
> +		return NULL;
> +
> +	vsi_domain->dma_dev = iommu->dev;
> +	iommu->domain = &vsi_identity_domain;

?? alloc paging should not change the iommu.

Probably this belongs in vsi_iommu_probe_device if the device starts
up in an identity translation mode.

> +static u32 *vsi_dte_get_page_table(struct vsi_iommu_domain *vsi_domain, dma_addr_t iova)
> +{
> +	u32 *page_table, *dte_addr;
> +	u32 dte_index, dte;
> +	phys_addr_t pt_phys;
> +	dma_addr_t pt_dma;
> +
> +	assert_spin_locked(&vsi_domain->dt_lock);
> +
> +	dte_index = vsi_iova_dte_index(iova);
> +	dte_addr = &vsi_domain->dt[dte_index];
> +	dte = *dte_addr;
> +	if (vsi_dte_is_pt_valid(dte))
> +		goto done;
> +
> +	page_table = (u32 *)iommu_alloc_pages_sz(GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);

Unnecessary casts are not the kernel style, I saw a couple others too

Ugh. This ignores the gfp flags that are passed into map because you
have to force atomic due to the spinlock that shouldn't be there :(
This means it does not set GFP_KERNEL_ACCOUNT when required. It would
be better to continue to use the passed in GFP flags but override them
to atomic mode.

> +static int vsi_iommu_identity_attach(struct iommu_domain *domain,
> +				     struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret;
> +
> +	if (WARN_ON(!iommu))
> +		return -ENODEV;

These WARN_ON's should be removed. ops are never called by the core
without a probed device.

> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> +				   struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret;
> +
> +	if (WARN_ON(!iommu))
> +		return -ENODEV;
> +
> +	/* iommu already attached */
> +	if (iommu->domain == domain)
> +		return 0;
> +
> +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
> +	if (ret)
> +		return ret;

Hurm, this is actually quite bad, now that it is clear the HW is in an
identity mode it is actually a security problem for VFIO to switch the
translation to identity during attach_device. I'd really prefer new
drivers don't make this mistake.

It seems the main thing motivating this is the fact a linked list has
only a single iommu->node so you can't attach the iommu to both the
new/old domain and atomically update the page table base.

Is it possible for the HW to do a blocking behavior? That would be an
easy fix.. You should always be able to force this by allocating a
shared top page table level during probe time and making it entirely
empty while staying always in the paging mode. Maybe there is a less
expensive way.

Otherwise you probably have work more like the other drivers and
allocate a struct for each attachment so you can have the iommu
attached two domains during the switch over and never drop to an
identity mode.

> +	iommu->domain = domain;
> +
> +	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
> +	list_add_tail(&iommu->node, &vsi_domain->iommus);
> +	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
> +
> +	ret = pm_runtime_get_if_in_use(iommu->dev);
> +	if (!ret || WARN_ON_ONCE(ret < 0))
> +		return 0;

This probably should have a comment, is the idea the resume will setup
the domain? How does locking of iommu->domain work in that case?

Maybe the suspend resume paths should be holding the group mutex..

> +	ret = vsi_iommu_enable(iommu);
> +	if (ret)
> +		WARN_ON(vsi_iommu_identity_attach(&vsi_identity_domain, dev));

Is this necessary though? vsi_iommu_enable failure cases don't change
the HW, and a few lines above was an identity_attach. Just delay
setting iommu->domain until it succeeds, and this is a simple error.

> +static struct iommu_ops vsi_iommu_ops = {
> +	.identity_domain = &vsi_identity_domain,

Add:

  .release_domain = &vsi_identity_domain,

Which will cause the core code to automatically run through to
vsi_iommu_disable() prior to calling vsi_iommu_release_device(), which
will avoid UAF problems.

Also, should the probe functions be doing some kind of validation that
there is only one struct device attached?

Jason

