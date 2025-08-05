Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45011C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9Lrb8raU1rOL/1BQQhDKfgxN9mYfLFp5sfiFKeG3uI=; b=og5CFdRDjTBOtw5EEnZ2dw5kQk
	zJuDZCew+1YCcerWBz5Do7/BWTDF0zn+ga1U3BJuIVMTBWEKks/A/J2+bqmjlTn902WOVBwn7M0Io
	Qhdkl1gQzpZNYPD5fCR91BnbMvC1gc3pN/yDuaZ007D0cJqHIVjGG4U9GuGH2FmweTz9/crxvM43J
	BXXLb5s0qmapnCr+h1cTy4F/M3ZNd0ffHdHwtZDWArWhax40bS/oYIHT3Vf5lbBgTCRfl7mVz5ymc
	0DDBFk8Ri+mfQphwtN8/Nj42r1mArlbkXfw9DY3CHOsPiiXpErQDDNCxqbZvklk6g0AEak0LOuzZC
	lW2DiQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMX5-0000000DYbh-481n;
	Tue, 05 Aug 2025 18:37:08 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLv9-0000000DULi-2gTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:57:56 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7de159778d4so388806585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754416674; x=1755021474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9Lrb8raU1rOL/1BQQhDKfgxN9mYfLFp5sfiFKeG3uI=;
        b=cTxCABe19Rg2aYxcPMYhIr0DL9bx/aqQj3zRUDquHcjxhwtFlgzUDTBWwJMxDXKAhp
         5oZ3S25aETh5c6u87EC0cXVRQS0on4BVVYj5NbKblaXzdwmI926c+bKiKfAGa30tAL6C
         buVxjSJ9P8DfKb2QWnGm8foulMOggzzYa/6WRqf3Bu8lhJqTXzJxQuInOu/Z3mQWZBAV
         hCLX1+1Iw64Dw85SI1PfFjonErKKKNDHnPsVfKLW052iCC4K70kmwN9syUqukDzboLOe
         EqD17FD6Rv2zyXzRMn3qmIBeHVrKTKnXzgHU3oWo+gBt/raXSyfLwduQ/zNGj6rmFe1y
         gLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754416674; x=1755021474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Lrb8raU1rOL/1BQQhDKfgxN9mYfLFp5sfiFKeG3uI=;
        b=j7krvGbVlyFrc/yOPopTmaahDeM5Mcqr0QRPDgUc7IMChpJ9FdMGHlIHUMgKjzAo5s
         qbyN74qAsn6XO33WQiXZ3zawq+DUck0APxaAF3KcVzMtqy3LOoeSWGcpmMDm2xTk3icY
         XEGB7LqgYYuW2YFRAODvZ/ujJwdseaYsaOt1njxF8BCsgujC7aetk4kHSRFVLwKrLiSW
         vKIeKPYslvg8Joi7IXuAsSVDgSqS3vGv7ChemvIU0Ok7LO9wiG/3WGo9tJqiXQBrTUu4
         y4uWMLCrNBCLOjcKASeSSqdzs64muQqyQHyv9FPR5ds28F72skbifyXLNp7b/Hp3ZqzP
         FPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnraGGFDhFdzpVWFfsyXtKBRCUyZubUDv0j/ufjTipgtx5Mb1S+wYhZSSy1kaC6KvjgTWoYvHrvcBlRefz/7lL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qSCCqaVTcbOSSXkPTh1bR2cBRLUVy7xKAr6FbOUkYWm7GF+p
	rrFpdglemwkAQonCjm0TurcHOGEj3nmfcEVNMMJiu1BfVXC+4CZZqieV5KwlogvH62k=
X-Gm-Gg: ASbGncszD8iW6CY6CM8buLSvBxYxCPimInAXnoLG/m/6JTqxP9blc+caQVihvPmkMYT
	hIjLzKqPd+iztP+X+dyg8lL8v9iyYlZLKSMBebo8m1Srh2lEaLBl0KeiOlI60/fcTSxKlRgwcKo
	k0vr1zzVBq7IhiNxdOmGuOmPWSLUWPzPQFSqrmlVXX/j9YzPSyp/1XgxHXcueBZ5V7EbNm0PVD8
	1+E9vVDzS8Ff3zDPsuE2neJSzwL1ESxaUXaNJh0jrFxfOwUQdjdZbd+fTWyhL2a7qXa2DB7r2P0
	IWPEZkgShNSZZ3VqWgMfg6NBt5RCywLmKW6eTN1YfN3EfxFQC8TfXBs11t6s1Dq2YBXnDWVcBUN
	jfIDIPLbILswX1ufIQg6ko+k25FpHRnj+eRRZcYeeTyo9whIvCmAyQddMByr/83PHkGqF
X-Google-Smtp-Source: AGHT+IGE5ERjj9D3VCjcEiKXdj9UhaaZiZPpSWlP7T6HKiKWYrHGgc5JWaH3dvBy9gtMCFsNCYW/Rg==
X-Received: by 2002:a05:620a:28ce:b0:7e6:9753:db16 with SMTP id af79cd13be357-7e814d03585mr36631185a.14.1754416674276;
        Tue, 05 Aug 2025 10:57:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e7f7e277besm338203385a.57.2025.08.05.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 10:57:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujLv7-00000001Zhc-0EXt;
	Tue, 05 Aug 2025 14:57:53 -0300
Date: Tue, 5 Aug 2025 14:57:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250805175753.GY26511@ziepe.ca>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJDGm02ihZyrBalY@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_105755_688471_45F27C01 
X-CRM114-Status: GOOD (  37.24  )
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

On Mon, Aug 04, 2025 at 02:41:31PM +0000, Mostafa Saleh wrote:
> > Are you saying the event queue is left behind for the kernel? How does
> > that work if it doesn't have access to the registers?
> 
> The evtq itself will be owned by the kernel, However, MMIO access would be
> trapped and emulated, here the PoC for part-2 of this series (as mentioned in
> the cover letter) This is very close to how nesting will work.
> https://android-kvm.googlesource.com/linux/+/refs/heads/for-upstream/pkvm-smmu-v3-part-2/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c#744

Oh weird, but Ok.

> > In other words you have two cleanly seperate concerns here, an "pkvm
> > iommu subsystem" that lets pkvm control iommu HW - and the current
> > "iommu subsystem" that lets the kernel control iommu HW. The same
> > driver should not register to both.
> > 
> 
> I am not sure how that would work exactly, for example how would probe_device
> work, xlate... in a generic way?

Well, I think it is not so bad actually.

You just need to call iommu_device_register

	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);

Where 'dev' is always the smmu struct device, even if your current
probing driver is not the smmu device. That will capture all the iommu
activity the ACPI/DT says is linked to that dev.

From there you just make a normal small iommu driver with no
connection back to the SMMUv3.

Eg you could spawn an aux device from smmuv3 to do this with a far
cleaner separation.

xlate is just calling iommu_fwspec_add_ids() it is one line.

> same for other ops. We can make some of these
> functions (hypercalls wrappers) in a separate file. 

What other ops are you worried about?

static struct iommu_ops arm_smmu_ops = {
	.identity_domain	= &arm_smmu_identity_domain,
	.blocked_domain		= &arm_smmu_blocked_domain,
	.release_device		= arm_smmu_release_device,
	.domain_alloc_paging_flags = arm_smmu_domain_alloc_paging_flags,

	^^ Those are all your new domain type that does the hypercalls

	.probe_device		= arm_smmu_probe_device,
	.get_resv_regions	= arm_smmu_get_resv_regions,

  	^^ These are pretty empty

	.device_group		= arm_smmu_device_group,
	.of_xlate		= arm_smmu_of_xlate,

        ^^ Common code

Don't need these:

	.capable		= arm_smmu_capable,
	.hw_info		= arm_smmu_hw_info,
	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
	.page_response		= arm_smmu_page_response,
	.def_domain_type	= arm_smmu_def_domain_type,
	.get_viommu_size	= arm_smmu_get_viommu_size,
	.viommu_init		= arm_vsmmu_init,
	.user_pasid_table	= 1,
	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
	.owner			= THIS_MODULE,

> Also I am not sure how that
> looks from the kernel perspective (do we have 2 struct devices per SMMU?)

I think you'd want to have pkvm bound to the physical struct device
and then spawn new faux, aux or something devices for the virtualized
IOMMUs that probes the new paravirt driver. This driver would be fully
self contained.

> I think we are on the same page about how that will look at the end.
> For nesting there will be a pKVM driver (as mentioned in the cover letter)
> to probe register the SMMUs, then it will unbind itself to let the
> current

That sounds a little freaky to me. I guess it can be made to work, and
is maybe the best option, but if this is the longterm plan then
starting out with a non-iommu subsystem pkvm driver seems like a good
idea.

Today the pkvm driver would do enough to boot up pkvm in this limited
mode, and maybe you have some small code duplications with the iommu
driver. It forks off a aux device to create the para-virt pkvm iommu
subsystem driver.

Tomorrow you further shrink down the pkvm driver and remove the
para-virt driver, then just somehow bind/unbind the pkvm one at early
boot.

Minimal changes to the existing smmu driver in either case.

> Then the hypervisor driver will use trap and emulate to handle SMMU access
> to the MMIO, providing an architecturally accurate SMMUv3 emualation, and
> it will not register iommu_ops.

Well, it registers normal smmuv3 ops only, I think you mean.

> So, I will happily drop the hypercalls and the iommu_ops from this series,
> if there is a better way to enlighten the hypervisor about the SIDs to be
> in identity.

The iommu ops are a reasonable and appropriate way to do this.

But since pkvm is all so special anyhow maybe you could hook
pci_enable_device() and do your identity hypercall there? Do you
already trap the config write to catch Bus Master Enable? Can pkvm
just set identity when BME=1 and ABORT when BME=0?

Jason

