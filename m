Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3443CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0G0e5c8vHjBsi5c13zpcsZ51xrN0whMkQDVL58DeA8=; b=w6PnQXPkVJHjrX9MQb/MVT95kd
	HPDRMkEsQeFRm6k/ss4jVg78x4CyXHHMX7y+m7CAy+o+SKphi1I+hSqp4yzwx7eoZmRBJDYlVO2FT
	eI+lMiTmKAUD9Vf+KHx5xvuszpxYbVzMug1sAM6g6wCSyeScuIidCEbmygdJgxhsDnx1LCcnbR0xS
	4ZWPUmEkensYvvGjYUX/qD4FJXYAQGz6ZJkTH2KG96sy4yXDa57uRCJ5fbcwwSzZAtdYmtRqng1WJ
	9cuLCgtgA1E9bcaoe053A+O8VFCaUxCVYOCnRKSrRnbb49j4+wx7bzeAw7543Vk1ysGU6MET3+PO8
	v3bQX0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPul-0000000DZCz-13oU;
	Mon, 11 May 2026 12:39:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPuj-0000000DZBz-09g3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 12:39:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 047B016F3;
	Mon, 11 May 2026 05:39:05 -0700 (PDT)
Received: from [10.57.68.228] (unknown [10.57.68.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD99F3F836;
	Mon, 11 May 2026 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778503150; bh=QLEE1X1xHeVvZP4CCFZks7mG64iGB9TUiMiSZkQVSaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yr0IcQFYT4Du7w6J9c139Pmm1QHTDFOpJ1zDcdnaU+8YGlNfWVc4aWtPtNKgq1yBM
	 PQ0RFPgH/OTcOGhw9vj+p3ok1HleN3E/hMoaNK2qphVtKCE9B9/Z9Rrgznd4N9iVwh
	 WFzRYaNxpuEsM2kucOGKIUqHoRQJs+4n0JCbUhjg=
Message-ID: <30eefd04-1d0f-45d8-b55d-e3e8d41a57ef@arm.com>
Date: Mon, 11 May 2026 13:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
To: Jason Gunthorpe <jgg@ziepe.ca>, Joonwon Kang <joonwonkang@google.com>
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com,
 baolu.lu@linux.intel.com, iommu@lists.linux.dev, joro@8bytes.org,
 jpb@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolinc@nvidia.com, praan@google.com,
 smostafa@google.com, will@kernel.org, jacob.jun.pan@linux.intel.com,
 easwar.hariharan@linux.microsoft.com, kevin.tian@intel.com
References: <20260424133953.GY3611611@ziepe.ca>
 <20260507095851.3220765-1-joonwonkang@google.com>
 <20260509171013.GF9285@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260509171013.GF9285@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_053913_190300_4CD57573 
X-CRM114-Status: GOOD (  21.19  )
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

On 2026-05-09 6:10 pm, Jason Gunthorpe wrote:
> On Thu, May 07, 2026 at 09:58:51AM +0000, Joonwon Kang wrote:
> 
>> By "similar instruction" on ARM, I guess you mean ST64BV0, which fetches
>> the bottom 32 bits data from ACCDATA_EL1. Please let me know if you meant
>> others as it will matter. If ST64BV0 is supported on ARM, however, it
>> would mean that ST64B and ST64BV are also supported already according to
>> the ID_AA64ISAR1_EL1's LS64 field. The latter 2 instructions are just to
>> atomically store whatever user wants to a memory location without
>> referring to ACCDATA_EL1 and all the 3 instructions can be run at EL0. So,
>> the userspace driver would have enough capability to designate arbitrary
>> PASID as it wants via the latter 2 instructions when communicating with
>> multiple devices.
> 
> IDK exactly what ARM did. IIRC on Intel ENQCMD forms a special
> non-posted write TLP and the device can tell the TLP came from ENQCMD
> and so it trusts the encoded PASID. ARM has to have done the same
> thing - allowing anyone to forge the PASID by using a different
> instruction misses the point of the Intel design.

Yes, ACCDATA_EL1 is a privileged register neither writeable nor readable 
by userspace[1], so it should be functionally equivalent from an SVA 
point of view.

> Honestly, I'm not sure why they even implemented it. SMMUv3 can't do
> the translation scheme required to use ENQCMD from a VM anyhow, so it
> is pretty useless.

Not sure what you mean there - indeed you can't do the SIOV thing of 
assigning individual ADIs to _different_ VMs, but there's still no 
reason you couldn't give the whole accelerator device to one VM, and run 
the "full" kernel driver in that VM to hand out ADIs to processes, same 
as for non-virtualised ST64BV0/ENQCMD usage. It's entirely usable, just 
not so "scalable".

Thanks,
Robin.

[1] 
https://developer.arm.com/documentation/ddi0601/2026-03/AArch64-Registers/ACCDATA-EL1--Accelerator-Data

> 
>> We have multiple processes and a single device, those processes want to
>> do SVA with the same device, and only one process will do SVA with the
>> device at a time. Though, the problem occurs even when irrelevant
>> processes allocate the PASIDs from the global PASID space for their own
>> irrelevant purposes.
> 
> The only way to allocate a PASID from the global PASID space is to
> establish another SVA, so you have multiple devices doing SVA?
> 
> Jason


