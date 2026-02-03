Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53F9E87859
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNPAD0QFbgm4/qvzoQb+Y2ByAInliPCL3kr5iyVcBpk=; b=Nzxl8yyfwCLW3gHv2XCqQStTCT
	Izd3hI8G/EY/u03lBYnUNnHH+5wga1lqRXVx/Pu4PMMEh+PG5pCLqH9/UiSYzU1uMs8ERm6zmPNMP
	TVsBm+hCRkFN0Xc9LJmibLyKh4LiH2MHkgj2c9XX5VWP1bjg9pwbZSJO4weADWjeteZyGkU4V6FEY
	56SGl64KmMk3sfa3kEwaKMlDKVbA9k2BRIZB1pgkStdIyL76EbacavFPTqays67/2F4/4LeMA1ML5
	4AXtHICyzGhfBWsHqE/lIZ8etQL/H1SEj9HCBZszzbaB/JDX4FsWba/ViBvRMynIb2OvxfFdDanwt
	aUbIsYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLcn-00000007Cwo-1epL;
	Tue, 03 Feb 2026 18:59:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLcl-00000007Cvp-1PEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:59:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD768339;
	Tue,  3 Feb 2026 10:59:34 -0800 (PST)
Received: from [10.57.54.50] (unknown [10.57.54.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D68253F632;
	Tue,  3 Feb 2026 10:59:37 -0800 (PST)
Message-ID: <0472f0f6-2f13-459e-857d-d5003f2f0ac4@arm.com>
Date: Tue, 3 Feb 2026 18:59:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: dan.j.williams@intel.com, "Tian, Kevin" <kevin.tian@intel.com>,
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
References: <6971b9406d069_1d33100df@dwillia2-mobl4.notmuch>
 <20260122131432.GJ1134360@nvidia.com>
 <69727e7ded712_3095100ab@dwillia2-mobl4.notmuch>
 <BN9PR11MB527649A0049CA195E7BCF9218C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260127150440.GF1134360@nvidia.com>
 <69795d0366a9_1d33100d3@dwillia2-mobl4.notmuch>
 <20260128130520.GV1134360@nvidia.com> <aYGEDv86r4a6l2Dv@Asurada-Nvidia>
 <20260203143348.GA3931454@nvidia.com> <aYI0LUdXqrjmRcMo@Asurada-Nvidia>
 <20260203175540.GC3931454@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260203175540.GC3931454@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_105943_527945_5311B57A 
X-CRM114-Status: GOOD (  18.98  )
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

On 2026-02-03 5:55 pm, Jason Gunthorpe wrote:
> On Tue, Feb 03, 2026 at 09:45:17AM -0800, Nicolin Chen wrote:
>> Btw, attaching to IOMMU_DOMAIN_BLOCKED/group->blocking_domain is not
>> allowed in general if require_direct=true. I assume this case can be
>> an exception since there's no point in allowing a device that has no
>> driver yet to access any reserved region?

No, the point of RMRs in general is that the device can be assumed to 
already be accessing them, and that access must be preserved, regardless 
of whether an OS driver may or may not take over the device later. In 
fact RMRs with the "Remapping Permitted" flag are only strictly needed 
*until* an OS driver has taken control over whatever it was that 
firmware left them doing.

> If require_direct is set then we have to disable this mechanism..
> 
> I'm not sure exactly what to do about this as the require_direct comes
> from the hypervisor in a CC VM and we probably don't want to give the
> hypervisor this kind of escape hatch.
> 
> Perhaps we need to lock off to failure on CC VMs if this ever
> happens..
> 
> But baremetal should just keep working how it always worked in this
> case..

Realistically this combination cannot exist bare-metal, since if the 
device requires to send ATS TT's to access an RMR then the SMMU would 
have to be enabled pre-boot, so then the RMR means we cannot ever 
disable it to reconfigure, so we'd be stuffed from the start...

Even though it's potentially a little more plausible in a VM where the 
underlying S2 would satisfy ATS, for much the same reason it's still 
going to look highly suspect from the VM's point of view to be presented 
with a device whose apparent ability to perform ATS traffic through a 
supposedly-disabled S1 SMMU must not be disrupted. However I think there 
would be no point exposing the ATS details to the VM to begin with. It's 
the host's decision to trust the device to play in the translated PA 
space and system cache coherency protocol, and no guest would be allowed 
to mess with those aspects either way, so there seems no obvious good 
reason for them to know at all.

Thanks,
Robin.

