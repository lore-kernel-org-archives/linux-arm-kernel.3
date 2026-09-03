Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZhtG1wx2jm/FfrEGQtp35GRqcBVCx7bZi9IJYydKpM=; b=dnnK7je2AlqEQ3JGMpiJKcX+2k
	x27rH9SwpuskO5ev95KjPPbDgNjvAdbj75cY/o8sAqjh0bKjKH6j/OOgZaStl6/wdrY3OZSO/e4jq
	+meaEZyigOKitRGUbuD/GlAC1+qES/OkDGNGROjKd5yt6btrwIQfkHcr7/ZMMxMptObfBZE4Y1ARg
	JGZ8UvaxhuR+c4piuDF5+1VBMSOLIbKZkqFr3K6nH+7WqQ/mVykD+rmq3a2WHWSYmkpms37h6G2H5
	Zk+bC3pZjYahgvYF2iG1oOgaRn/zm7GCai8VNYPtiYR7JhvMReq4B4d49ps2I03p3HK62uDvK6y6B
	tNm4acow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B3m-00000000GEh-3mcn;
	Thu, 03 Sep 2026 17:17:10 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B3k-00000000GEI-0fb6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:17:09 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-90e7d9c747eso1400246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788455827; x=1789060627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZhtG1wx2jm/FfrEGQtp35GRqcBVCx7bZi9IJYydKpM=;
        b=HsnbhPPbGCFHVWZ01dPSUCPDoUYP2YmZV+vYvt+q01b9Ee82yN0UG50HL9yLMNrgUG
         2EDj42a9HTtpzcQOTTNqhUbHANDzDWGHM6ZwOxyKGj0oHRHPvuC5trmsBPz7B/h7Qbbg
         iS0iU8mL+Xo/iZRd7phCYjDMgM6XWnrG/AwNSYG+O8atjF22sGiff/r/feRLgeAhz0t+
         5yR+Su1jU4EnUo/JK0b8Rkw+lUj/rBpYUGo0eitOHNMX3IDZJLXfPDDMKlolhleLzJ6r
         34I9ziyO2N9pFW3pyQQQqeAfNhAVjieZ+6P/D0xLc/Jn6TY3pN2nteooutjT6cATXvNm
         9bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455827; x=1789060627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZhtG1wx2jm/FfrEGQtp35GRqcBVCx7bZi9IJYydKpM=;
        b=tZdpwyosykMZ0HbZSw6kLjFUrnYNJyPII4JxWwDNMLa++OehTCs8fe1izP5REJG6cU
         VJGJiJgWmuYZNYSpaI5/AIh2HpFre5e4225IJlzDWtmRaM7u7bRuNi3UUzEMuSMXGzdK
         tS71QCApXWOrxujPaLZzm3i+5hRe+ECvh1PNZTWBo0W05Z0iZ+CzYYSbEasUTi2kTnVA
         MNbZi9bXglGdPkVG6HV1WKiibt9w6VWXr39+uP3bu8TGvTVSkiyINIo2xDI5mRFNqbT+
         /5AN4Mu+JZCjdQK90D2Z62Wz/ksiD7yXvM+IdzgJnrPje7e7V9ThMiWD7/rFNpmsWEuf
         cZdA==
X-Forwarded-Encrypted: i=1; AKwUvBwt9yBf9HKdZtWSa/qNDhRSpMMKk+SloT15MyNUeqHg+fTXDEXroM1xL2VcxPalL65KkB++4leJgA3sHuQ6CS3U@lists.infradead.org
X-Gm-Message-State: AFuF++nRSn17top4hQyzRoe4coaUWKg8/drQKffHgAxvXH2g0vIjt97h
	KwdxQ3C1QhyZ7XHlMLFoEp679GKumBKyOsehzdkSenjpnA/0n1uedXtlwe1+m7fyrMw=
X-Gm-Gg: AYBFou3R88MJ9FGpWPb4eJb9/BCzAfDXgfUkKWBoQVK2BDcL9BtI7etz9N8CYSZptWU
	oycdAgtcRxcWJMBEGYc+KROT0AF7cXFUDCFdfF5fKP4jhdJeTvatzNLcpqqLi2fqeBS2BmkfuHt
	Z2PZ8RyBc8RJVMd5SRMPzcjXBFvLgTM3zLufv7O3nSh9U2FGnZYOwJPheIpR3GlSXtKoTT3FSAB
	e8Yywtd2bYjmarNRi0pSR9onmkB0JED4xThU8qvWUIc6ZuH+EFJKnPO5yJ+dPM6bDEoxbhIDXDJ
	BRuyjdCf/ay5UQXrcRp31FzuImBWKDip+dTbqb7iLo8Xtna5X8ONkcnj4i34W0PsRQ2ACE+O1v1
	YBVUGTbR3Ru2Ac4OftKrUEiNJkwBtHM+QdmSU8bNpqF3KeCTYMU0lm65oleHq4hbrUozK/SYH2O
	oii4U7f25vGyPZqfeQCeLww2ild/Bb7RW+T0VMiEwYk94d7Nk/wAicyREDcJlrrCsza0Y5Y7Jhf
	uIP4Pwh//89OSI93fgO6Kx2YAshcTK/PeUCgSK9ApnA9jHp7zIg6EM/zA==
X-Received: by 2002:a05:620a:4448:b0:936:a407:98bb with SMTP id af79cd13be357-9396f65f15cmr827993085a.9.1788455826461;
        Thu, 03 Sep 2026 10:17:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb678b8sm13297985a.30.2026.09.03.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:17:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x2B3g-0000000HY70-3vJi;
	Thu, 03 Sep 2026 14:17:04 -0300
Date: Thu, 3 Sep 2026 14:17:04 -0300
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
Message-ID: <20260903171704.GK2890729@ziepe.ca>
References: <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q5izxz4.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_101708_221529_ACEE3849 
X-CRM114-Status: GOOD (  37.34  )
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

On Thu, Sep 03, 2026 at 11:18:47AM +0530, Aneesh Kumar K.V wrote:
> >> 	vdev->destroy = arm_realm_smmu_v3_vdevice_destroy;
> >> 	return tsm_bind(dev, kvm, vdev->virt_id);
> >
> > I think we should drop tsm_bind() as an abstraction. It doesn't make
> > sense to take that round about path when we are calling RMIs directly
> > above. It was intended to be an abstraction, but it isn't working out
> > with this viommu based abstraction.
> >
> 
> I was considering using the viommu only for explicit pSMMU/vSMMU setup,
> SID/STE management, and realm stream-table creation. I expected other
> operations, such as vdevice creation and lock/run state transitions, to
> be driven by IOMMUFD ioctls and dispatched to the TSM backend through
> abstractions such as tsm_bind() and tsm_guest_req(). This results in the
> following split:
> 
> - Arm SMMU: pSMMU/vSMMU setup, SID/STE management, and Realm
>   stream-table creation.
> - PCI TSM: device association, bind lifetime, DSM lookup, and TDI state.
> - arm-cca-host: PDEV/VDEV operations, TDISP transitions, reports,
>   measurements, and IDE interaction.
> - IOMMUFD: route userspace requests using the vdevice ID.

I don't really like it, I think the viommu code should handle the
VDEV and VSMU, TSM should handle SPDM.

"TDI state" is the existance of a iommufd vdevice, it doesn't make
sense to have a seperate "TDI state" concept and a parallel set of
APIs out side the iommufd object model that concretely defines the
lifecylce of the VDEV.

Is there a reason to have this split aside from it matches the tsm
prototypes that were sketched?

> >> @@ -513,10 +514,16 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi,
> >>  		if (copy_from_user((void *)&req_obj, req.user, req_len))
> >>  			return -EFAULT;
> >>  
> >> -		if (req_obj.tdi_state != RHI_DA_TDI_CONFIG_RUN)
> >> +		switch (req_obj.tdi_state) {
> >> +		case RHI_DA_TDI_CONFIG_UNLOCKED:
> >> +			return cca_vdev_device_unlock(pdev);
> >> +		case RHI_DA_TDI_CONFIG_LOCKED:
> >> +			return cca_vdev_device_lock(pdev);
> >> +		case RHI_DA_TDI_CONFIG_RUN:
> >> +			return cca_vdev_device_start(pdev);
> >> +		default:
> >>  			return -EINVAL;
> >> -
> >> -		return cca_vdev_device_start(pdev);
> >> +		}
> >>  	}
> >
> > This stuff cannot flow through sysfs. The VMM must support running in
> > a sandbox so it cannot easially call out to sysfs while the VM is
> > running. That makes the sandboxing more complex and ugly. The flow we
> > have now relies on fd passing from the launcher into the sandbox to
> > get things like vfio and iommufd into the VMM.
> >
> 
> This does not go through sysfs. It uses the following IOMMUFD ioctl:
> 
> IOCTL_OP(IOMMU_VDEVICE_TSM_REQ, iommufd_vdevice_tsm_req_ioctl,
> 	 struct iommu_vdevice_tsm_req, tsm_code),

I see, I saw this when I was grepping:

static ssize_t tsm_request_store(struct device *dev,
				 struct device_attribute *attr,
				 const char *__buf, size_t count)

Which the name and sysfs parts confused me, it looked like core
code. Turns out it is the sample driver.

> I need to spend more time considering your suggestion to handle guest
> requests through viommu_ops rather than as TSM backend operations. The
> split described below seemed more natural to me.
> 
> - Arm SMMU: pSMMU/vSMMU setup, SID/STE management, and Realm
>   stream-table creation.
> - PCI TSM: device association, bind lifetime, DSM lookup, and TDI state.
> - arm-cca-host: PDEV/VDEV operations, TDISP transitions, reports,
>   measurements, and IDE interaction.
> - IOMMUFD: route userspace requests using the vdevice ID.
> 
> It is not yet clear to me whether operations such as MMIO validation
> (TSM_REQ_VALIDATE_MMIO), setting the TDI lock/unlock/run state
> (TSM_REQ_SET_TDI_STATE), querying TDISP object details
> (TSM_REQ_OBJECT_INFO), and reading or regenerating TDISP objects
> (TSM_REQ_READ_OBJECT and TSM_REQ_REGEN_OBJECT) belong in viommu_ops.

They way I'm looking at it is the "TDI" is the RMM's VDEV.

The RMM VDEV has to be created from an iommufd vdevice and be 1:1 with
that. Thus the iommufd vdevice is the TDI.

Therefore, the struct cca_host_tdi should be the driver specific
struct of a struct iommufd_vdevice.

So if you want to get the information in the cca_host_tdi you have to
come in through the viommu ops with a vdevice object in hand.

This seems like a much cleaner logical seperation than trying to
maintain a cca_host_tdi external to the iommufd vdevice object that
actually directly controls its lifecycle.

So if you did this then the cca_tsm_guest_req would flow through some
generic viommu op similar to what AMD proposed:

struct iommu_viommu_op {
	__u32 size;
	__u32 vdevice_id;
	__u32 viommu_type;  // enum iommu_viommu_type
	__u32 operation; // unique enum per type
	__u32 req_len;
	__u32 resp_len;
	__aligned_u64 req_uptr;
	__aligned_u64 resp_uptr;
};

enum {
 IOMMUFD_VIOMMU_OP_CCA_OBJECT_SIZE
 IOMMUFD_VIOMMU_OP_CCA_OBJECT_READ
 IOMMUFD_VIOMMU_OP_CCA_UPDATE_INTERFACE_REPORT
 IOMMUFD_VIOMMU_OP_CCA_UPDATE_MEASUREMENTS
 IOMMUFD_VIOMMU_OP_CCA_VDEV_MAP
 IOMMUFD_VIOMMU_OP_CCA_SET_TDI_STATE

And none of the TDI information leaks out side the iommufd world.

The iommufd side change to introduce CCA support would then only be
adding the IOCTL for iommu_viommu_op and some fiddling with how the
viommu is created.

Then everyone can use the same infrastructure for their related
problems.

> Meanwhile, I will clean up my changes and post them as a patch series so
> that we can review them more closely?

Well, OK, but I'm am still very interested in focusing on the
viommu. I cc'd you on another thread so you can see the other topics
I'm looking at here that all come down to very similar patterns.

I think the TDI related tsm ops were developed well before iommufd was
completed and you have raised a good point now to re-evaluate if the
we even need them since we now understand that the iommufd vdevice is
in fact the concrete TDI object in the uAPI.

Jason

