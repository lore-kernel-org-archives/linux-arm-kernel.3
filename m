Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE08C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=; b=u67fGVTFK036isYODoEXsDaLrS
	3Lj3VrYW1Bi+paV/hP3C4XW8YaDaGH14Z7WaRpe9kPoemO86IfUBWeykqBm9x3cwOP+2sMm/Kmiz9
	VjegRjYmZZ4nK15AMAZvoHhKW+iEO++XYmJfoqgG+6hIohtnmadrEJQL1FdD/wvKG3TqnNbpMrax7
	x9z1Ob4EmQdkNcRXwgo/XThF1sm/P/W7x0hH5piH9QsIXtC7NZHE3vK2CyBcgpe8prycpf/fiaZ7T
	Kg4ZDRyQiYY1HbLYxmmeV5CrlGKitkVY+Ppd2iCj9E/5XZzS0BT3cPqF3srVmQf805JNJiPd8NZ3C
	g/0kkTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HhF-0000000BhBt-05hg;
	Wed, 09 Sep 2026 12:46:37 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HhC-0000000BhBH-0JZx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:46:35 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfbd148aso10002236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788957993; x=1789562793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=YsPGOjoft9BXWHxLprb+vvKiKuKB8F4k/Gm1LkTTYWlrokixG1/SXhCikBJZkH1tb5
         BKD/f5auPxFmMiHdUQdVHygH6+jFyYtI795mgoYBgxZpO585NupjjKTJQRVipNoQ1Xrj
         fA2sllE6f9tg6qcc65cXrgMM4dS4dimHf2dbQOqGfCeJnu41o6n/qocmZnjFKrvmM/4/
         D4xFM54ULuh4kTVPQLPUi4jP2ONZXXiltFyUMiOBc+IR/eRFJYppLa2t4Jw++r07A/vN
         9zlotRUdbBxzyUFZGf8dSLWJGGol7nZmxwBlE58BBnF5++xDRaYHjhqSnApCKb8TgkzU
         lfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957993; x=1789562793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=JsZtfkuPSYMcRuNnWXzVrhE0NFyGXIHfbdDc71SmT5ZMK228jURuE8pyB4rFYmbMPI
         67qKtVWw3JFAfIcPaSCAKxXLc34h195qj1UQC2dtt4UXkp1SPcjfhEuyO9u/7VhLdcBR
         /OLZhFmvEs5z5HUjO7jPdZhS/5c6xvFqjnxgSQGorlfX2wDqpzg2bVG+0OzphQnrIB0Q
         rbnFiHdDfqD8mKBYGKkhEdDrp8Nrq7cqZS51HmHMRgiVEj57JULOQNDhs1XelvJo0b18
         FN2OeomhLIFr2A3/5PKynUpGq83cBkA53kIUwB+gCBWT+t38as4+IG12PTEKESfqfVG5
         ulQg==
X-Forwarded-Encrypted: i=1; AKwUvBw/AVjVwHJPLcMgKn2k2LL2+iM+qgrwGIMi8ZXstBJeoH6patOEd80Vc7WeSjayatBcNnsh3DesaXfMVx9s/glI@lists.infradead.org
X-Gm-Message-State: AFuF++n9lYAnEzl0ZtTpqn9H16PRfnU2VBI/sB7r72izwVRiUBMBexYL
	DiKyhHYswgKAEdGkCJFDgvjPkNoH9XTbfcLsvlCjK1bY4sWjUqXuDrxF8SKwNntwxJDs95hNJ3Y
	ottVx
X-Gm-Gg: AYBFou1NVxOyrQxS/jD7FFLjXAYpo5rXkAEw+388mRd7JF6pGXmPYR5irI/d3DTtVKI
	V+McdIPPoLOQQjlgmu5TaC0DCGb+m388M3RtBmzIsO2hX39+NNoCO1GfK/cAU37LgKiqQPTt4n/
	C+M1WUUo320LewJ6PHkABrGw9TmzK00PZdpcTCg6hJooNLEn00OaZrNqghYha/6i1Jy7J3TA2Ji
	XMl4GmhddhAOQhw31eTq24ReVRFqus9vxfjxJOKhR3mNX8NTKIDFjD3ad+jB4a1HVxbUhkFKNP1
	cThv2GC5wehWTC0lGN2grwpOIUBXFMOdLa02HiYVgCSnHkoY7JcLCE6oZvhJ2xwAkA4BghuJbVc
	e3YjL9+2VwhJ810RR0ZWMHIcRGRnWgJDwgOMRkVpVdU/wwtlhrY4VFCKIo/5hPnJ3S0RPn5TTA8
	/wnVDof/kpvKlWK94qJri46Xz6bqejk1IAqwJKVtY91nsdgo0M6jvY3oth/GGlEZqT4xGqaUNU9
	VaxX650fNpr44x5PKTZEM5w6gMBrKlcblpzaBj8Q8B0G8Pdamq7mXO/
X-Received: by 2002:a05:6214:ccc:b0:910:4080:dc4f with SMTP id 6a1803df08f44-9106b371c17mr87577676d6.4.1788957992321;
        Wed, 09 Sep 2026 05:46:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91053b4992csm85467086d6.22.2026.09.09.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:46:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4Hh6-0000000Ge25-36Uc;
	Wed, 09 Sep 2026 09:46:28 -0300
Date: Wed, 9 Sep 2026 09:46:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260909124628.GH2543240@ziepe.ca>
References: <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnyag84.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_054634_346466_D5C32893 
X-CRM114-Status: GOOD (  30.06  )
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

On Wed, Sep 09, 2026 at 03:39:31PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:
> >
> >> I looked into this, and it becomes fairly complicated. We can move all
> >> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:
> >
> > I was going for the opposite, you'd move everything out of arm-smmu-v3
> > and into the arm-cca-host and obtain the viommu through tsm_ops not
> > through iommu_ops.
> >
> > I guess I pointed to that in another email.
> >
> > The only thing arm-smmu-v3 should provide is a simple function to give
> > the pdev phys and irq parameters. arm-cca-host calls that when it
> > creates an viommu object.
> >
> 
> 
> So ended up with
> 
> static const struct tsm_viommu_ops cca_tsm_viommu_ops = {
> 	.owner = THIS_MODULE,
> 	.type = IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3,
> 	.get_size = cca_viommu_get_size,
> 	.init = cca_viommu_init,
> };

OK, may also be fine in the main tsm ops? 

> struct cca_viommu {
> 	struct cca_psmmu *psmmu;
> 	struct iommu_viommu_provider *iommu_provider;
> 	const struct iommufd_viommu_ops *iommu_ops; // backing SMMU ops

??

The viommu created for a RMM owned vSMMU should have no connection to
the normal SMMU driver? It just needs the psmmu information.

We need to adjust iommufd side to know that this object cannot accept
an iommu_domain, only a kvm fd. I don't want to pass in a fake
iommu_domain that has nothing to do with how RMM will operate things.

> static struct iommu_domain *
> cca_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
> 			       const struct iommu_user_data *user_data)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->alloc_domain_nested(viommu, flags, user_data);
> }
> 
> static int cca_viommu_cache_invalidate(struct iommufd_viommu *viommu,
> 				       struct iommu_user_data_array *array)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->cache_invalidate(viommu, array);
> }

These ops should fail (just be NULL) not reflect to a psmmu.
 
> struct cca_vdevice {
> 	struct iommufd_vdevice core;
> 	struct pci_tsm_context *tsm_context;
> 	struct cca_host_tdi host_tdi;

Is the extra tdi struct still needed? Isn't cca_vdevice the tdi struct?

> 	u32 l2_sid;
> };
> 
> static const struct iommufd_viommu_ops cca_viommu_ops = {
> 	.destroy = cca_viommu_destroy,
> 	.alloc_domain_nested = cca_viommu_alloc_domain_nested,
> 	.cache_invalidate = cca_viommu_cache_invalidate,
> 	.vdevice_size = VDEVICE_STRUCT_SIZE(struct cca_vdevice, core),
> 	.vdevice_init = cca_vdevice_init,
> 	.vdevice_tsm_req = cca_vdevice_tsm_req,
> };

> 
> and on iommu side
> 
> struct iommu_viommu_provider {
> 	size_t size;
> 	int (*init)(struct iommufd_viommu *viommu, struct device *dev,
> 		    enum iommu_viommu_type type,
> 		    struct iommu_domain *parent_domain,
> 		    const struct iommu_user_data *user_data);
> 	int (*get_params)(struct iommu_viommu_provider *provider,
> 			  struct device *dev, enum iommu_viommu_type type,
> 			  void *params, size_t params_size);
> 	void (*release)(struct iommu_viommu_provider *provider);
> 	void *data;
> };

Not sure what this is?

> The TSM disconnect path will now fail while any vdevice is alive or
> active. 

Yes, that's makes sense.

> Destroying a vdevice will unlock and destroy the VDEV. 

Yes

> I think we can also unmap its MMIO mappings at that point, provided
> we track the mapping requests in a list alongside the vdevice
> details.

The mmio is owned by vfio, there should be a handshake in VFIO to
remove mmio when it becomes private, otherwise I don't think we need
to do anything more?

> All CCA operations will use pci_tsm_pf0::lock, though I think the
> locking can be made more fine-grained.

Sure
 
> I will send a cleaned-up series so that we can review the code changes.

Does it seems reasonable to you? Was there any oddness with modeling
the vdev/bind through the viommu?

Anyhow I'll look more closely when you are ready. Thanks

Jason

