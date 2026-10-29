Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACECE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZODGGtuv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYVH+Mm9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b1L/YgA0unso+/Lv8s9MhtgPB5X7wkfHZu4ut24TmCk=; b=ZODGGtuvbnsMj5xa0VCTmL4Gx0
	BQ62pi7RMHaGe1fFR7kB5x4eQKn51b71uQAMys+ZQ3SV02UHI110XWl9adnkw7Hh/GvnkymaHtOor
	tc1HhCbe7UShmJVvUGsq2jwGKJaWLuXiOx4ZqmbEE3Iso/dci8FxmPlGuDWFDS6HEkBvppbjX+0c5
	fctlKxx8eJm5oaKU3GyJhpfLO7oPlger7aoUwwsa6JYvPMr1qqzBoDIgbZbf0KD945PcHazHb8ANk
	9mN1dVn4ThZL/nhcar0hdu7ulkXU+LcR27Coo5kSmiMLhZqyIx5BRlEZIgRO9RrETp6KpJqpbfK0n
	TRj21gMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMZv-00000008sCi-0v4k;
	Thu, 29 Oct 2026 09:37:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMZu-00000008sCS-0Q2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:37:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21CCA43E39;
	Thu, 29 Oct 2026 09:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D2D1F01829;
	Thu, 29 Oct 2026 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266665;
	bh=b1L/YgA0unso+/Lv8s9MhtgPB5X7wkfHZu4ut24TmCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GYVH+Mm9omq5BAsPPLcumqvOBUW7yKv6qRkJyIck5tFwfRa1tUfjtE1geDCpsmBEP
	 2RwHK9Cy8sS2rBXuKXJvctC4Bq6C2jK6S/gBMA9x1sxt6ydKYVAFfAqpCKD+Lbm+RW
	 CTkFLp+EHxcq2Q+0N+MiEyq8LgEaRZKBHMQZslmLTNkQz52CiV4VANY5UuxTSJYiXc
	 HSEiViC0iMwJEQOI2/cy1vL8wqYF36gfQSfNXAqFM2CsYJ00Xwib/fXPCJXdfkBwli
	 uFbEJD7BvWk6qn89ZMam6ipKB0JOazajL/SM6VxCjG3IQq3Hghn8AUsKjF5s6ntxKr
	 WS9/dwDL4KSwQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 10/16] iommufd: Add the vdevice TSM request ioctl
In-Reply-To: <179321444123.2412245.6955528563980811144.b4-review@b4>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-11-aneesh.kumar@kernel.org>
 <179321444123.2412245.6955528563980811144.b4-review@b4>
Date: Thu, 29 Oct 2026 15:07:34 +0530
Message-ID: <yq5a1p98c0f5.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 300 lines skipped ... ]
>> +/**
>> + * enum iommu_vdevice_tsm_guest_req_op - Guest TSM request operations
>> + * @TSM_REQ_VALIDATE_MMIO: Validate and map a guest MMIO range for the trusted
>> + *                         device.
>> + * @TSM_REQ_SET_TDI_STATE: Transition the trusted device to the unlocked,
>> + *                         locked, or running state.
>> + * @TSM_REQ_SEV_ENABLE_DMA: Enable DMA for an SEV device.
>> + * @TSM_REQ_SEV_DISABLE_DMA: Disable DMA for an SEV device.
>> + * @TSM_REQ_READ_OBJECT: Read bytes from a device object, such as a certificate,
>> + *                       measurement, or interface report.
>> + * @TSM_REQ_REGEN_OBJECT: Regenerate a device object, such as a measurement or
>> + *                        interface report.
>> + * @TSM_REQ_OBJECT_INFO: Query the size of a device object.
>> + * @TSM_REQ_MAX: One past the last request operation; not a command.
>> + *
>> + * The request payload and response format depend on the TVM architecture.
>> + */
>> +enum iommu_vdevice_tsm_guest_req_op {
>> +	TSM_REQ_VALIDATE_MMIO = 1,
>> +	TSM_REQ_SET_TDI_STATE,
>> +	TSM_REQ_SEV_ENABLE_DMA,
>> +	TSM_REQ_SEV_DISABLE_DMA,
>> +	TSM_REQ_READ_OBJECT,
>> +	TSM_REQ_REGEN_OBJECT,
>> +	TSM_REQ_OBJECT_INFO,
>> +	TSM_REQ_MAX,
>> +};
>
> This is still no where close to being well defined enough.
>
> Everything here must tie back to defined spec references, listed in
> the comments.
>
> I cannot guess what data is passed over any of these APIs, how things
> like "REGEN_OBJECT" select which object to regen, or what the format
> of those objects even is. The formats of req/resp are never specified.
>

The request and response payload formats are specific to each CoCo
backend. Since iommufd treats the payloads as opaque and does not
validate their contents, what would documenting those formats here
achieve?

The limited validation is intended to prevent this from becoming a
general-purpose multiplexer ioctl. It restricts the ioctl to a defined
set of guest-initiated operations that the host forwards to the
firmware. The path is essentially:

guest -> vmexit -> VMM -> iommufd ioctl -> TSM backend -> firmware 

> The comment for this should probably be *enormous*. Every arch should
> explain what they do on every one of these ops, and it should be
> identical if it is structured like this.
>

That would require documenting a significant amount of backend-specific
detail in iommufd. Could we instead require each TSM backend's
guest_request callback to document its request and response formats?


> I have a strong guess almost none of this is actually general, but
> lets find out.
>
> You can also put enum kdocs directly before each enum which helps alot
> when they get as big as this stuff has to get.
>
> My guesses with no information
> 1) VALIDATE_MMIO why would the hypervisor ever need this? Guest
>    validates MMIO through secure communication to the secure world.
>

With VFIO PCI BARs backed by guest_memfd, the VMM can validate that the
IPA and PA values provided by the guest belong to the VFIO device. We
previously also used this operation to ask the CoCo TSM backend to map
the device memory (the BAR regions). I have removed this operation from
the latest series because that responsibility is now split between the
VMM and guest_memfd. TDX and SNP still need to be updated accordingly.

> 2) TDI_STATE I thought at least RMM did this with an RSI?
>

CCA uses RHI. The RHI reaches the VMM, which issues the ioctl to
complete the request.

> 3) ENABLE/DISABLE DMA, see #1, must not be done by hypervisor
>    See my reply to Alexey:
>    https://lore.kernel.org/linux-iommu/20261022123058.GC3008132@nvidia.com/
>
> 4) READ/REGEN/INFO, what are the objects? What format are they in? How
>    do you select them?
>

These objects are cached by the hypervisor. For CCA, they include the
certificate, measurement, interface report, and VCA. They are read in
response to guest requests. The requests reach the VMM through an
RHI, and the VMM issues the ioctl to read the requested object. REGEN
refreshes the objects/evidence at the guest's request.

>    Does this overlap with attestation subsystem? Should attestation
>    subsystem be used to access the SPDM related data?
>


I had hoped we could use it, but I could not find an easy way to
integrate the two. We need a simple way to read these evidence objects
into userspace. I am not yet sure whether evidence-get can be used for
that, since it does more than simply read the objects; it also updates
evidence.generation, among other things.

>
> Update the comment to explain all this, don't need to answer here.
>
> We really need to do these defines along with implementations, that
> probably will settle alot of the questions above.
>
>> +
>> +/**
>> + * struct iommu_vdevice_tsm_req - ioctl(IOMMU_VDEVICE_TSM_REQ)
>> + * @size: sizeof(struct iommu_vdevice_tsm_req)
>> + * @vdevice_id: vDevice ID the guest request is for
>> + * @op: One of enum iommu_vdevice_tsm_guest_req_op, excluding TSM_REQ_MAX
>> + * @tvm_arch: One of enum iommu_vdevice_tsm_guest_tvm_arch
>> + * @req_len: Size in bytes of the input payload at @req_uptr, at most INT_MAX
>> + * @resp_len: Size in bytes of the output buffer at @resp_uptr, at most INT_MAX
>> + * @req_uptr: Userspace pointer to the guest-provided request payload
>> + * @resp_uptr: Userspace pointer to the guest response buffer
>> + * @out_tsm_code: TSM-specific result code returned by the TSM implementation
>> + *
>> + * Forward a TSM request to the TSM bound vDevice. This is intended for
>> + * guest TSM/TDISP message transport where the host kernel only marshals
>> + * bytes between userspace and the TSM implementation.
>> + *
>> + * The request operation is guest initiated. The vDEVICE implementation
>> + * declares the TVM architecture and operations it accepts; iommufd checks
>> + * both before forwarding the request.
>> + *
>> + * The request payload is read from @req_uptr/@req_len. If a response is
>> + * expected, userspace provides @resp_uptr/@resp_len as writable storage for
>> + * response bytes returned by the TSM path.
>> + *
>> + * The ioctl is only suitable for commands and results that the host kernel
>> + * has no use, the host is only facilitating guest to TSM communication.
>> + */
>> +struct iommu_vdevice_tsm_req {
>> +	__u32 size;
>> +	__u32 vdevice_id;
>> +	__u32 op;
>> +	__u32 tvm_arch;
>> +	__u32 req_len;
>> +	__u32 resp_len;
>> +	__aligned_u64 req_uptr;
>> +	__aligned_u64 resp_uptr;
>> +	__aligned_u64 out_tsm_code;
>> +};
>
> Should the viommu_id be passed in as well, or we know it implicitly
> from the vdevice_id?
>

We get final callback via

vdev->viommu->ops->vdevice_tsm_req

>
> I think this is probably a fine generic API, it should probably not be
> "TSM request" so that the other viommu people can reuse the transport.
>
> I would probably try to stick to exactly like the other APIs do with a
> single enum. Two enums for op/arch is saying already that the ops are
> not well defined.
>
> So maybe strip this patch out to have no tsm stuff, define no ops and
> just give a command transport into the viommu driver?
>

Are you suggesting one ioctl per each guest request ops?

-aneesh

