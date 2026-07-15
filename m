Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0033AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4quosoz/Au9cuaRbDHoKbbtLwTanYpBnxnE4muPEzPA=; b=m/79YtKgz0217/LhLH/Y3mGUfT
	w0TRNgiCn/uN/3w8bc6Wv+HQ69G9SwVSCfUBID4VooS/H4jf62lrrZ0skZWKR6UF59fDxZuoADEcJ
	cbuRV16tGK7PH+agAYJunmgbXw9FNXXeFF5r1SZ5XQ3C07IRXz7er/ibaRGOvM+F+7qv7nT9O29sf
	MZzPaySLfJJ4HpgGsNoWG9bs7hXJazOb0oMnpcrgOiyIveibfMCGu/fUl/2sEApDbajgaNBaVTTmA
	0qGQ7e1qF6tORLaMUq953P1Sob0hAcNN5ChGRcZqjPR0iyf4yi+aT9t7R3DwMqG1FL9G1L94tx0hm
	ENNE5JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3fZ-0000000FaM0-1Eue;
	Wed, 15 Jul 2026 17:45:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3fW-0000000FaLa-0qe3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 17:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F14D1477;
	Wed, 15 Jul 2026 10:45:08 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 082EA3F905;
	Wed, 15 Jul 2026 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784137512; bh=eeC0Oy450ThvtldVu7hsdDDTtsDrV1G7Io1D0bRWiaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6XlR9E7+wabRwgqSqgyqMPSBUX37OU5Tw1RX+1jC4gX3sHe7TBofS6iO2vKr4w7X
	 bAwt8DLiiej7yQPNCnADLT8u4092zBXlPyEXXZV+RCkKjv3+8cbS4+D2qcfyFjRGqA
	 /3bh/TYMWJoRcNDK9Js6UyZr3mTZjVJQDVTu7FTQ=
Message-ID: <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
Date: Wed, 15 Jul 2026 18:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
 Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
 <20260715125039.GA50536@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260715125039.GA50536@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_104514_386783_FEB270DB 
X-CRM114-Status: GOOD (  18.65  )
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

On 15/07/2026 1:50 pm, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 01:14:18PM +0100, Robin Murphy wrote:
> 
>> Conversely though, I really wouldn't want to have to maintain arm-smmu
>> supporting two completely different pagetable APIs simultaneously either :/
> 
> Does arm-smmu era HW even support CONT?

Yes, it goes all the way back to ARMv7 LPAE, predating even SMMUv1, and 
certainly at least Arm's implementations (MMU-400/401/500) can all make 
meaningful use of it.

> AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
> as well. I think it would be fine to implement all the unique LPAE
> features it needs in iommupt, I did most of them already.
> 
> I do have an ARMV7S implementation for iommupt, but I did not solve
> the sub page problem. So while it is functionally working it is not
> usable since it wastes so much memory. That's a tricky problem to
> solve since the algorithms depend on the gather->freelist.
> 
> I didn't spend any time trying to do anything about this as I was not
> intending to touch arm-smmu

Indeed between the irregular table sizes (before you even get to the 
Mediatek shenanigans...), and the awkward GFP_DMA limitations and/or 
reality that many of the systems using it really don't have memory to 
waste, I'd have considered v7s pretty much terminally incompatible with 
iommu_pages and the abstraction that iommupt is trying to be... :/

Thanks,
Robin.

