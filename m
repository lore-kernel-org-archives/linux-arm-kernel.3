Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E38C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkeDqYa1HLfts95iCxAWRO24Np4zPeA8eWDtJpHaVXY=; b=k4TBBnvU9W3QdVftoO4LPNZyS8
	Ah2NIA5kbrtYT66J9Vu7kf+RUEKwRjUh8prSHAGT/nrHuBO4XwH+SP7in3jxfAdSuF5eCGSB3e2fh
	4w2wl2j/RyqvyyOGQP2YcXPZdsRL9Zj2SdczXzGQI3UdA1oFxVSQey8aydLzcoI3PfeXK1WQeV3qw
	rPP7yCXbVieIb5KXXWeRmFk29W/jT0PGinp77LLQabSF5Mr6B2E2NH6YhHMBfvoi+BsEOhp21Xr5f
	oo9vZwOsJ2oVK92aYnMwqR4KHRE6ImYWKyYJGEFMZsAg4D/FomG/14WwhcrbM1eWv6HCY4UpiWKGy
	uAPKV5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPaj-00000009v0q-24sP;
	Fri, 07 Feb 2025 14:44:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPZJ-00000009uWq-3FpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:42:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738939374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkeDqYa1HLfts95iCxAWRO24Np4zPeA8eWDtJpHaVXY=;
	b=uwqW32XETTfe2u7CGshYrBNeAd+It/c+WnC1sALbfdPFvSaCtEi7ErbTUgR20g6mvbu/M/
	uyvL6Ru9wTI1Y0k9fNu8yDrlaUV2ObuZoPfcTi3xIleR68BXK9QKXuoRiyttaV7PTP0ToX
	CpdmTtj8Gh+78L3eD8joO+se52SZdPVUImCVceOqlT5aSIJjg7ajcZi5g8reOqVnNJNWNN
	y7uOinjdrR/DeMZQnvZ9J7QX7HY7bNnhgHbtN0EbdUw7g+C+tHDuSX7687DWMztvSYlAP6
	l5zNYX6/GNhCbR0TZkryf+LybkBfHCcigSqJQzRD/JXEeIOJP7CRm15wLJa+FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738939374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkeDqYa1HLfts95iCxAWRO24Np4zPeA8eWDtJpHaVXY=;
	b=jtOnsBd24wYOO8DUY4nJeuOxusWoOJiTGUPwTktLczqPvXUzX1fViIYAMoXBFt08EuQf8G
	aOJ7fsBoWZzxXVBg==
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 robin.murphy@arm.com, maz@kernel.org
Cc: will@kernel.org, kevin.tian@intel.com, alex.williamson@redhat.com,
 joro@8bytes.org, shuah@kernel.org, reinette.chatre@intel.com,
 eric.auger@redhat.com, yebin10@huawei.com, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
 anna-maria@linutronix.de, yury.norov@gmail.com, nipun.gupta@amd.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
 jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
 shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
 ddutile@redhat.com
Subject: Re: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
In-Reply-To: <20250207143402.GA3651395@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <20250207143402.GA3651395@nvidia.com>
Date: Fri, 07 Feb 2025 15:42:54 +0100
Message-ID: <87lduhlssx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064257_957604_25A435F3 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, Feb 07 2025 at 10:34, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 07:32:16PM -0800, Nicolin Chen wrote:
>> Though these two approaches feel very different on the surface, they can
>> share some underlying common infrastructure. Currently, only one pair of
>> sw_msi functions (prepare/compose) are provided by dma-iommu for irqchip
>> drivers to directly use. There could be different versions of functions
>> from different domain owners: for existing VFIO passthrough cases and in-
>> kernel DMA domain cases, reuse the existing dma-iommu's version of sw_msi
>> functions; for nested translation use cases, there can be another version
>> of sw_msi functions to handle mapping and msi_msg(s) differently.
>> 
>> To support both approaches, in this series
>>  - Get rid of the duplication in the "compose" function
>>  - Introduce a function pointer for the previously "prepare" function
>>  - Allow different domain owners to set their own "sw_msi" implementations
>>  - Implement an iommufd_sw_msi function to additionally support a nested
>>    translation use case using the approach (2), i.e. the RMR solution
>>  - Add a pair of IOMMUFD options for a SW_MSI window for kernel and VMM to
>>    agree on (for approach 1)
>>  - Add a new VFIO ioctl to set the MSI(x) vector(s) for iommufd_sw_msi()
>>    to update the msi_desc structure accordingly (for approach 2)
>
> Thomas/Marc/Robin, are we comfortable with this general approach?
> Nicolin can send something non-RFC for a proper review.
>
> I like it, it solves many of the problems iommufd had here and it
> seems logical from the irq side.

I haven't seen anything horrible. My main concern of having a proper
cached and writeable message is addressed.

Thanks,

        tglx

