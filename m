Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C17C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8t5HFUqc+uUOq+DP418Q40OKNx1R/fQImmMod37+pg=; b=K016IaNw975YAA8lGTx3dkA17l
	KnCixKSRcNUvVPI8hSxKq+tW5K5Tn3ZmLm32arVp87BVXhdzADDB54pvuNPi+ZPMt9MeER0J5Yw7b
	fYTpyrS3DLoeGAAQlnp8UsknTOsoGOWSJlXR0GcgldpFB/XTHHkSdNF9SseEMCfseAJXebiWE4/NH
	LFtuXu/sXJ7SsHjUhIBdcCxOoP2Pd9Ah+/8n9kRxV7MILSj3cA+6J8R/sO8sTvto8Od7PK9iH5ZQL
	Uw9NDtpy+1R1ZUMxzGsILxRlZSqCJY/wBXbEySJ26e3z1WaVzb9OqEmMs5HezZUYThjLChuXwdvFj
	PVfbMyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujexJ-0000000FQFs-3huq;
	Wed, 06 Aug 2025 14:17:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeqo-0000000FPEA-1geS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:10:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459e497776cso90545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754489440; x=1755094240; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S8t5HFUqc+uUOq+DP418Q40OKNx1R/fQImmMod37+pg=;
        b=yKRJo5VFI/eMFmal4gEiRHflIsqSQYz+FlDHbcnzkVfU95XLTulpTZlcManKZDFBNd
         6fhI2b+AAEMGBXpYJoIB4vv/JoZINxVujfbV+Yjd1TVCU595UtnS8hIW1JYLLk2rilwL
         0/b1m3MBupjrgBdznwyobLre2IYVG6VSoVCgAiHyDtbm7p1PFMsMuaTWNzlU2Ox2TIte
         fFkhc3lVPlYEMdWIpGcaS+bd5Hc3mroVsLnH9hi2hnOgWbE7t9WNyneAyPtnlAHP1tJg
         ps8FR6OtloqJQWLU+up4q1XCTxx3mJL8bUIIfePSMuI4Bws3TLsmM7Tx0KZzroFVlQ/H
         7KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489440; x=1755094240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8t5HFUqc+uUOq+DP418Q40OKNx1R/fQImmMod37+pg=;
        b=QHpgJ1hSQ2qdOzWEOYtvdcaSqkNvFZ71UmiVfWE0xYIgbIdJR2ycd6VCfGZpA5jkWy
         s3xrO7cyLTOkDwYanN6T4CnYoNl1Zd8do540Ecd+uuZppikJnDbkRsHQB1ATlDPWXXDs
         aI4UPsBz1BLSY+Kxd7qLOfxv8qyE8qr0j9cWkjRnn6JcmOfZF4IywEZycGyZKyG2TyyJ
         LbftrhrLZ0cQW7xjKv8G1iJe0L7PfvBYUso9EY3fa88KjUi33WV+4V/j0q4ZjrdMRuMS
         IchP9OcN2QqgQ3tlqv03AJvzx2NkFqvzmtpFYVitfstY77l8++5B/R5xjzzxgRQnOMu5
         pwpg==
X-Forwarded-Encrypted: i=1; AJvYcCWqcNBqS40MduxiaXemxoPZl4+8wJwxcNzH7s8vL/Rja/5Z4UXLIXYRoBmkgji1YqIPyWkMx6wgpU+oEBEn3/1g@lists.infradead.org
X-Gm-Message-State: AOJu0YwWqYOhPV63tXQMa6HU5OMq1DpZDLqDNlKiMJHZq56go+Zu8Fk8
	e1OV6jqhjX7FcB4R3vk7HliFB2DOj/1Qsecr7nIAw76WqosptX4Z6DRHgwjR/Ufslg==
X-Gm-Gg: ASbGncv1OevCFL9BIKgR9u9K/aSZOrV8tuuklaAXFHXTP++nGod3tTmmlu1VSS9Ibm2
	j9yV4tFQtnecekmljGvjKMoLxsTBplvM8CRaCd2h7NF3JfXnJNQgpUocJjoOAP3lJ/7agKZZ4Ei
	yNaUY+N2ppYZoNZMaVJg8fkZ1Mvmq1b5KGN7o+zxD2gAMYjTO6TNzaIU9609fot8AaJ1EwxVPbg
	rBkO+Cy0eXtWll/ILqE0IOf8PPj8kXNVwf/Ch83AVeWAsjMgalW11C+ADwN7HtJ4DfItl741psl
	DhUgurFLKePEp43oWU7M3IuhsxZn1d4N8W9jsjB/1mLN1O8BCuM9pBF+Hz9qwUt4zxnQrx0zxRX
	OZerWd0o3wgIY9FtOR+uFOGq7tuKyNAP9a7neWRcsfKWO+BAFThrTagVLjp+IOzc7BQ==
X-Google-Smtp-Source: AGHT+IHFwOHplPeniFX/OYHA6MsJidP9FSVHfWws6kd04FRGtTTr89FlkYU0XPDUkpq8hanIQWmrxQ==
X-Received: by 2002:a05:600c:1f10:b0:456:e94:466c with SMTP id 5b1f17b1804b1-459e74b4543mr1411575e9.3.1754489439774;
        Wed, 06 Aug 2025 07:10:39 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5843021sm58288915e9.3.2025.08.06.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:10:38 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:10:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aJNiW48DdXIAFz8r@google.com>
References: <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805175753.GY26511@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_071042_443486_6190D9DF 
X-CRM114-Status: GOOD (  57.54  )
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

On Tue, Aug 05, 2025 at 02:57:53PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 02:41:31PM +0000, Mostafa Saleh wrote:
> > > Are you saying the event queue is left behind for the kernel? How does
> > > that work if it doesn't have access to the registers?
> > 
> > The evtq itself will be owned by the kernel, However, MMIO access would be
> > trapped and emulated, here the PoC for part-2 of this series (as mentioned in
> > the cover letter) This is very close to how nesting will work.
> > https://android-kvm.googlesource.com/linux/+/refs/heads/for-upstream/pkvm-smmu-v3-part-2/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c#744
> 
> Oh weird, but Ok.
> 
> > > In other words you have two cleanly seperate concerns here, an "pkvm
> > > iommu subsystem" that lets pkvm control iommu HW - and the current
> > > "iommu subsystem" that lets the kernel control iommu HW. The same
> > > driver should not register to both.
> > > 
> > 
> > I am not sure how that would work exactly, for example how would probe_device
> > work, xlate... in a generic way?
> 
> Well, I think it is not so bad actually.
> 
> You just need to call iommu_device_register
> 
> 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
> 
> Where 'dev' is always the smmu struct device, even if your current
> probing driver is not the smmu device. That will capture all the iommu
> activity the ACPI/DT says is linked to that dev.
> 
> From there you just make a normal small iommu driver with no
> connection back to the SMMUv3.
> 
> Eg you could spawn an aux device from smmuv3 to do this with a far
> cleaner separation.
> 
> xlate is just calling iommu_fwspec_add_ids() it is one line.

I am not sure I understand, the SMMU driver will register its IOMMU
ops to probe the devices, then faux devices would also register
IOMMU ops for the KVM HVCs?
But that means that all DMA operations would still go through the
SMMU one?

> 
> > same for other ops. We can make some of these
> > functions (hypercalls wrappers) in a separate file. 
> 
> What other ops are you worried about?
> 
> static struct iommu_ops arm_smmu_ops = {
> 	.identity_domain	= &arm_smmu_identity_domain,
> 	.blocked_domain		= &arm_smmu_blocked_domain,
> 	.release_device		= arm_smmu_release_device,
> 	.domain_alloc_paging_flags = arm_smmu_domain_alloc_paging_flags,
> 
> 	^^ Those are all your new domain type that does the hypercalls
> 
> 	.probe_device		= arm_smmu_probe_device,
> 	.get_resv_regions	= arm_smmu_get_resv_regions,
> 
>   	^^ These are pretty empty
> 
> 	.device_group		= arm_smmu_device_group,
> 	.of_xlate		= arm_smmu_of_xlate,
> 
>         ^^ Common code
> 
> Don't need these:
> 
> 	.capable		= arm_smmu_capable,
> 	.hw_info		= arm_smmu_hw_info,
> 	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
> 	.page_response		= arm_smmu_page_response,
> 	.def_domain_type	= arm_smmu_def_domain_type,
> 	.get_viommu_size	= arm_smmu_get_viommu_size,
> 	.viommu_init		= arm_vsmmu_init,
> 	.user_pasid_table	= 1,
> 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
> 	.owner			= THIS_MODULE,

Makes sense, thanks for the detailed explanation.

> 
> > Also I am not sure how that
> > looks from the kernel perspective (do we have 2 struct devices per SMMU?)
> 
> I think you'd want to have pkvm bound to the physical struct device
> and then spawn new faux, aux or something devices for the virtualized
> IOMMUs that probes the new paravirt driver. This driver would be fully
> self contained.

I think it’s hard to reason about this as 2 devices, from my pov it seems
that the pKVM HVCs are a library that can be part of separate common file,
then called from drivers. (with common ops)
Instead of having extra complexity of 2 drivers (KVM and IOMMU PV).
However, I can see the value of that as it totally abstracts the iommu ops
outside the device specific code, I will give it more thought.
But it feels that might be more suitable for a full fledged PV
implementation (as in RFC v1 and v2).

> 
> > I think we are on the same page about how that will look at the end.
> > For nesting there will be a pKVM driver (as mentioned in the cover letter)
> > to probe register the SMMUs, then it will unbind itself to let the
> > current
> 
> That sounds a little freaky to me. I guess it can be made to work, and
> is maybe the best option, but if this is the longterm plan then
> starting out with a non-iommu subsystem pkvm driver seems like a good
> idea.
> 
> Today the pkvm driver would do enough to boot up pkvm in this limited
> mode, and maybe you have some small code duplications with the iommu
> driver. It forks off a aux device to create the para-virt pkvm iommu
> subsystem driver.
> 
> Tomorrow you further shrink down the pkvm driver and remove the
> para-virt driver, then just somehow bind/unbind the pkvm one at early
> boot.
> 
> Minimal changes to the existing smmu driver in either case.
> 
> > Then the hypervisor driver will use trap and emulate to handle SMMU access
> > to the MMIO, providing an architecturally accurate SMMUv3 emualation, and
> > it will not register iommu_ops.
> 
> Well, it registers normal smmuv3 ops only, I think you mean.

I mean when nesting is added, the arm-smmu-v3-kvm, will not call
“iommu_device_register”

> 
> > So, I will happily drop the hypercalls and the iommu_ops from this series,
> > if there is a better way to enlighten the hypervisor about the SIDs to be
> > in identity.
> 
> The iommu ops are a reasonable and appropriate way to do this.
> 
> But since pkvm is all so special anyhow maybe you could hook
> pci_enable_device() and do your identity hypercall there? Do you
> already trap the config write to catch Bus Master Enable? Can pkvm
> just set identity when BME=1 and ABORT when BME=0?

pKVM doesn’t trap actual device access, also we have to support
platform devices, so it would be better to rely on existing
abstractions as “probe_device”


I had an offline discussion with Will and Robin and they believe it might
be better if we get rid of the kernel KVM SMMUv3 driver at all, and just
rely on ARM_SMMU_V3 + extra hooks, so there is a single driver managing
the SMMUs in the system.
This way we don’t need to split current SMMUv3 or have different IOMMU ops,
and reduces some of the duplication, also that avoids the need for a fake device.

Then we have an extra file for KVM with some of the hooks (similar to the
hooks in arm_smmu_impl_ops we have for tegra)

And that might be more suitable for nesting also, to avoid the bind/unbind flow.

I will investigate that and if feasible I will send v4 (hopefully
shortly) based on this idea, otherwise I will see if we can separate
KVM code and SMMU bootstrap code.


Thanks,
Mostafa

> 
> Jason

