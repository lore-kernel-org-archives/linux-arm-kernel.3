Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85DC56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d47StiA7dSocBR80vImtT1TMhni8OG6XYHmv9LtOCxw=; b=w28t6jjDZqOjNuXrZ96fUNUJXK
	FxLkdQabyxuIujdD4TTyU1+KA/xLO47HuqopkB3UnrxGp68Zo/ccXPywac6JwSvDblUiJ91n806ve
	AGXo7EiIaIE8K6okNrcZNyw5Yad8pQCMZbGVOWk9baIwDP42ZwZHGSjGH1mUVqQeuqRU2xEcxVtKw
	gQpjTVVFwqYxD+/rfUTP2RN8H0ZKDJgJlYNici6QLIkeP2VdteQYIimDotNlRlpJvM8cvfyTcqsCr
	bhPKQ+4iAR/E3m/qjWfZkS0i52FDEjtdvzB5fhOblQ0SJJKkoxfE6nPRQyOlciOHHZtxo/Tsu8Ddf
	tHDXU04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRla-0000000EsqM-0q7O;
	Fri, 20 Feb 2026 14:46:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRlX-0000000EspG-2LfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:46:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98E4A339;
	Fri, 20 Feb 2026 06:45:49 -0800 (PST)
Received: from [10.57.58.244] (unknown [10.57.58.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7AE33F62B;
	Fri, 20 Feb 2026 06:45:52 -0800 (PST)
Message-ID: <c7cd42ff-f95a-4aaf-ab79-5af476bca894@arm.com>
Date: Fri, 20 Feb 2026 14:45:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, dan.j.williams@intel.com,
 "Tian, Kevin" <kevin.tian@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "praan@google.com" <praan@google.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
References: <20260203143348.GA3931454@nvidia.com>
 <aYI0LUdXqrjmRcMo@Asurada-Nvidia> <20260203175540.GC3931454@nvidia.com>
 <aZZDo3BeuBKh9q24@nvidia.com> <20260219143737.GG723117@nvidia.com>
 <aZc//6kvH3Eqfwfe@nvidia.com> <20260219174139.GI723117@nvidia.com>
 <aZfoqETxb31jp/Pk@nvidia.com> <20260220125044.GK723117@nvidia.com>
 <6a842339-3f0a-48db-830a-326add917519@arm.com>
 <20260220135124.GA1894399@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260220135124.GA1894399@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_064559_724548_F5F0CB93 
X-CRM114-Status: GOOD (  25.52  )
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

On 2026-02-20 1:51 pm, Jason Gunthorpe wrote:
> On Fri, Feb 20, 2026 at 01:22:49PM +0000, Robin Murphy wrote:
> 
>> But is that an issue? Until the device has a driver, surely it shouldn't be
>> expected to send interrupts at all, much less depend on them being received
>> and understood by Linux? The MSI cookie is only populated once a driver
>> actually requests some MSI vectors (since it doesn't know what ITS
>> address(es) may or may not need mapping), so an empty DMA domain is still no
>> better than a true blocking domain in this regard anyway.
> 
> Oh, the issue is the driver_managed_dma flag.
> 
> In this mode we do bind a driver but the iommu callbacks at driver
> bind are not called anymore because that flag says the driver itself
> will call them later.
> 
> Things like PCI port driver that never issue DMA at all will set the
> flag and never make any calls, while still expecting interrupts to
> work.
> 
> This is why the other option is to rework this somewhat so these
> drivers still make call in to the iommu and can get an interrupt
> setup.

Or perhaps we handle BUS_NOTIFY_BIND_DRIVER to manage the switch from 
BLOCKED to (empty) DMA independently from whether the driver 
subsequently claims the DMA domain or not? That said, I wouldn't have 
any particular objection to generalising iommu_use_default_domain() into 
something like iommu_prepare_default_domain(bool managed) either.

> All of this is only for multi-device groups where we want to ignore
> some bad grouping with VFIO on old HW without sufficient ACS. Thinking
> about it some more I suspect this entire concept has been broken from
> day 1 in VFIO on ARM. If the iommu_group has two members, port driver
> and a VFIO device then:
> 
>   The port driver will start first, install the ITS page in the DMA
>   domain, VFIO will start second an switch the domain to BLOCKED, then
>   to PAGING, and the ITS mapping used by the port driver will be lost.
> 
> And nobody will notice this has happened because the interrupts in the
> port driver are only used for RAS IIRC so the net effect is your
> system doesn't print AERs anymore.

Indeed VFIO's MSI cookie doesn't inherit any existing mappings from the 
DMA domain, and that wouldn't work anyway since the IOVAs would almost 
certainly be different. So we'd have to somehow free any existing AER 
interrupts before the domain switch, then fully re-request and reprogram 
them afterwards, in both DMA->UNMANAGED and UNMANAGED->DMA directions. 
Oof...

Thanks,
Robin.

