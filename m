Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1569EC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBzVW3EzUnSFqKtUlrJNYA/jua39Lx8cYBqm7GJOMP0=; b=o5j8qfpZF3uKoZOtBX9U2WBqlz
	ZS6t2Vm74Rf2Y6ruSr+DPpfKvKZNP380h3dCxHcpxyIOZxa5YfQuU0AIVySEYJBOe+a10QjrWYvRi
	PaHRMB55inyN85BFkI73Ah1uCi+HC1T+u0/uXNKpcb1IHcsvdDj8IlACOGxhye/pMJZ84vLSJqDdq
	kUvml9NEDhcvUaI6XDf3aE/sSRPdBHFvLJAn4XZt3EbQXqlBfZMteHYKtjQx8LQK2BnHrH2j0HibP
	6ltSgEZo0H5xtwkB2ZO+7Ldwc7acL36Yn8BRIXNf4/C+n7hC9Vqrovr9d0qA0CCb9gjTunQakKsDW
	abIaEcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncYB-00000007GVa-1eHZ;
	Thu, 27 Feb 2025 11:59:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbxS-000000079ho-03R0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:21:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A6302BCC;
	Thu, 27 Feb 2025 03:21:48 -0800 (PST)
Received: from [10.57.36.150] (unknown [10.57.36.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2583F6A8;
	Thu, 27 Feb 2025 03:21:29 -0800 (PST)
Message-ID: <634c60ea-fec3-43ad-923a-cf9ba5e76065@arm.com>
Date: Thu, 27 Feb 2025 11:21:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] iommu: Make iommu_dma_prepare_msi() into a generic
 operation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
 tglx@linutronix.de, maz@kernel.org, joro@8bytes.org, will@kernel.org,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com, patches@lists.linux.dev
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <4ca696150d2baee03af27c4ddefdb7b0b0280e7b.1740014950.git.nicolinc@nvidia.com>
 <5b9e15e1-8081-46ef-b9db-3872e98a6f35@arm.com>
 <20250221164400.GN50639@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250221164400.GN50639@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032138_096458_8F5F5C31 
X-CRM114-Status: GOOD (  16.08  )
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

On 2025-02-21 4:44 pm, Jason Gunthorpe wrote:
> On Fri, Feb 21, 2025 at 03:39:45PM +0000, Robin Murphy wrote:
>> Yuck. Realistically we are going to have no more than two different
>> implementations of this; a fiddly callback interface seems overkill. All we
>> should need in the domain is a simple indicator of *which* MSI translation
>> scheme is in use (if it can't be squeezed into the domain type itself), then
>> iommu_dma_prepare_msi() can simply dispatch between iommu-dma and IOMMUFD
>> based on that, and then it's easy to solve all the other fragility issues
>> too.
> 
> That would make module dependency problems, we have so far avoided
> having the core kernel hard depend on iommufd.

It wouldn't need a hard dependency, it's easy to have a trivial built-in 
stub function which becomes valid once the module loads - you literally 
have the iommufd_driver infrastructure for precisely that sort of thing 
already. All I'm saying is to hide the callback detail in the IOMMUFD 
code because being IOMMUFD modular is unique to IOMMUFD and not the rest 
of the core code's problem.

And frankly otherwise, what even is the benefit of moving the 
iova_cookie pointer into the union if we have to replace it with another 
whole pointer to make it work? This is just adding more code and more 
complexity in in order to make struct iommu_domain... the same size it 
already is :/

Thanks,
Robin.

