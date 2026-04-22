Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0147FA1FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ/PNfLOtwPtNM5z4oMwzLcAzbSfzM49oMbcq1O1PUw=; b=RAGV7gTKKEq1cMm5o4SQR0nRp4
	LtkcQsL/tJfBTVMtZKQQxwytDRcg36uJXmCTVBmRJ8ybdqjqykBJNoKuk15l04/muH+P1nCvUPknS
	W2XNkhm7UxN7bohXrvW/zXkhzw7oDwWuyAKG7SpwR+LVTBH5PEBatPwCMNLlxhL5FDSWKkQCzV1lD
	9At9T+IdS/4T73TmHRgQOPEKkG8xyy+F5TYj4gO/cUm73h2HFIIO37QV/KEB2FTibuP6SK7tQ4oGf
	KXDzEkLibGSxOxcrxS4hWa0saAVBI4o+X8fn2wKYcB/1dp3wlTgxlhVKsVs+BI5DUplkEXjuKbUxx
	nY9zzZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaZK-0000000AWnb-0le6;
	Wed, 22 Apr 2026 16:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaZH-0000000AWn4-1Ejn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:36:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE0751F37;
	Wed, 22 Apr 2026 09:36:41 -0700 (PDT)
Received: from [10.57.20.180] (unknown [10.57.20.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52DEE3F23F;
	Wed, 22 Apr 2026 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776875807; bh=3kpEt4tyIzeCujOrtWwP6Mi5ZUwWwYdyZCmkAKnE9Mc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ITv64P78gbm2ng42VydpF4SeOSQjad7OUzqS3oRcwOqKG3QTWwVkjzlNGc88e6Rpp
	 DRiBEDCt52mbHoYdVay6aWU0Z5fJPTNDB3lJySbMCL7CBZ5Xot95JVzzk8emtYTq49
	 yXJ93u1tw6FaNahRjKDUTuUIQsJ5qzfWIhyt7XFA=
Message-ID: <fe618d83-fe9d-4b35-a1e7-f71b703cfd7e@arm.com>
Date: Wed, 22 Apr 2026 17:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
To: Jason Gunthorpe <jgg@ziepe.ca>, Evangelos Petrongonas <epetron@amazon.de>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com, Zeev Zilberman <zeev@amazon.com>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260422162351.GK3611611@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_093651_376912_C985388F 
X-CRM114-Status: GOOD (  18.94  )
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

On 2026-04-22 5:23 pm, Jason Gunthorpe wrote:
> On Wed, Apr 22, 2026 at 06:44:31AM +0000, Evangelos Petrongonas wrote:
>> The motivation is live update of the hypervisor: we want to kexec into a
>> new kernel while keeping DMA from passthrough devices flowing, which
>> means the SMMU's translation state has to survive the handover. The Live
>> Update Orchestrator work [1] and the in-progress  "iommu: Add live
>> update state preservation" series [2] are building exactly this plumbing
>> on top of KHO; [2]'s cover letter calls out Arm SMMUv3 support as future
>> work, and an earlier RFC from Amazon [3] sketched the same idea for
>> iommufd.
> 
> It would be appropriate to keep this patch with the rest of that out
> of tree pile, for example in the series that enables s2 only support
> in smmuv3.

Or even better, just make sure that whatever hypervisor supports this 
half-finished WIP mechanism also uses IOMMU_HWPT_ALLOC_NEST_PARENT to 
explicitly get stage 2 domains for VM-assigned devices in the first 
place, rather than swing a big hammer at the kernel (that takes out 
SVA/PASID support as collateral damage...)

Thanks,
Robin.

>> For this use case, Stage 2 is materially easier to persist than Stage 1,
>> for structural rather than performance reasons:
> 
> I don't think so. The driver needs to know each and every STE that
> will survive KHO. The ones that don't survive need to be reset to
> abort STEs. From that point it is trivial enough to include the CD
> memory in the preservation.
> 
> It would help to send a preparation series to switch the ARM STE and
> CD logic away from dma_alloc_coherent and use iommu-pages instead,
> since we only expect iommu-pages to support preservation..
> 
> I could maybe see only supporting non-PASID as a first-series, but a
> CD table with SSID 0 only populated is still pretty trivial.
> 
> Jason


