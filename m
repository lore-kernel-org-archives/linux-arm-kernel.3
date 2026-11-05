Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB11606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n/B5Cpu4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBrD/Ngd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HcoU1mf7kO9fvwMNLAx61kTpoNrJasMlL0pCTHLa1Co=; b=n/B5Cpu46y17wowRwYGoyPeRJz
	lRRjZcZyHRRjbB+JGzWkObeWbjUlRaNggtYeDhGxxJFsLWMLWDAAv+krRpO5fD+m5wkv+9nf/KaGi
	tFzx+XvZFzu2Ik6RpOH+1f0tyLDMbhFv5wAX79NX7hWuR5XRESeYi4/ci6AsDBe9tXpcNQIFK1v0P
	a7eYf8MRQBlvkzk6WVa+hbiXAKNes9ezY39JTkqjfmyo6vBQRWFMUuC4BWIsOWlqJqHjeVj9fI6ID
	q+ZJIA/OxBrbelkq5gDyDZ1PcCc95yMYl37a+2E/jBDDV09bIWcb+RvV9BoH6DUq5Qu65L1VNT2rV
	tR1RgGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOq1L-00000007t9s-3aqw;
	Thu, 05 Nov 2026 05:28:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOq1K-00000007t9j-1vEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:28:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D27E5435C8;
	Thu,  5 Nov 2026 05:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADF31F000C1;
	Thu,  5 Nov 2026 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856497;
	bh=HcoU1mf7kO9fvwMNLAx61kTpoNrJasMlL0pCTHLa1Co=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KBrD/Ngds9bqLOcBa7RpvNd4iMkexWpa+DzC6+ffKh1NhLEcaCBmEuvd0SpOEEPHV
	 8jL17aLET5sVc1/TAi2tTazVETSBSX1k5gdhp8dNc51yhlt825KrAfTsm/PLVPQfs1
	 9DrfPotW/M5CJ7LWNRkY9NQVWMQL33DBsrkDB24mg07HUa2Aj8OlTXilnd46qOgQEv
	 k3CuSvDbuwDNqcLyuF0M2036cdvl79e8QDDblmq3o0qYsa+f6X05yCvSN7xzjURY4I
	 9npdc1/J6QCtCKe6MDyezbs+VUY/TM6+1/uf5gFICQVmA2vkwcCTCg1cwzx5WXcGu5
	 d6UQgbCzYGvFg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
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
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
In-Reply-To: <20261104193139.GB3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com> <20261104193139.GB3889730@ziepe.ca>
Date: Thu, 05 Nov 2026 10:58:06 +0530
Message-ID: <yq5afqxf97a1.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
>> On Wed, Nov 04, 2026 at 09:46:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> > VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
>> > the selected vIOMMU implementation has no use for one. This would force
>> > implementations such as the following Arm Realm vIOMMU to create an
>> > unused parent.
>> 
>> IIRC, MSI on ARM still goes through the NS pathway. So, it wouldn't
>> be "unused" if the device attaches to it (or its nested hwpts)?
>
> It is unused by the RMM VIOMMU. I think that is what is Aneesh is
> explaining.
>

We create an IOMMU_HWPT_ALLOC_NEST_PARENT HWPT outside the vIOMMU and
attach it before allocating the vIOMMU. This HWPT is used for untrusted
devices and MSI-X.

The sequence is:
	ret = __iommufd_configure_device(kvm, vdev);
	ret = iommufd_get_hwpt(vdev, hwpt_flags, &hwpt_id);
	ret = iommufd_attach_hwpt(vdev, hwpt_id);
	ret = iommufd_create_vdevice(kvm, vdev);
        	viommu = iommufd_alloc_viommu(kvm, vdev, vdev->link_tsm_name);
		if (ioctl(iommu_fd, IOMMU_VDEVICE_ALLOC, &alloc_vdev)) {


Alloc viommu does the below:
	viommu->_viommu.size = sizeof(struct iommu_viommu_alloc);
	viommu->_viommu.flags =  0;
	viommu->_viommu.type = kvm__arch_get_viommu_type(kvm);
	viommu->_viommu.dev_id = vdev->bound_devid;
	viommu->_viommu.hwpt_id = 0;

	if (ioctl(iommu_fd, IOMMU_VIOMMU_ALLOC, &viommu->_viommu)) {
		vfio_dev_err(vdev, "failed to allocate VIOMMU %d", -errno);
		free(viommu);
		return NULL;
	}

>
>> By dropping the nesting parent from VIOMMU, it just simplifies the
>> attachment to an S1 paging hwpt, right?
>
> Yes.
>
> The VMM must always maintain a S1 paging attachment that is the
> identity map of the VM on all devices, same action as when there is no
> viommu.
>

I am currently creating an S2 paging attachment. This results in a
configuration with S1 disabled and S2 enabled, which is used by all
untrusted devices.

-aneesh

