Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154DEFD5F79
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhgFpSeQmIt9/Bn9B2tb3GS8hG4UzUV5QUAvyGcMwrE=; b=0WpWLiyWEPPmkOkrpYoJiFgLVN
	umRWtW9r3yDiJ8NppSvwnGhFhae5/cMTydTYEftEsh0BgfizWJtXkU+O8Qo4IXhDFx9vdzgSjOvQr
	rFyEDdnOPp6qRombi5gX1gvI2XFOsmfl7LL9i0zzUt3DtL5E/dtGDHR6EXBPlkct6kDNLkzdbdBXf
	eUCvY3KklmFT/TddtIeAYZRTpKvhAZkhKr27OS/E7poEHacc8yA5igIyakizvMSTKuvSn1pIOwkzt
	wGRjulTiq3vJxHltNhKmcrQrZ+Dql+jAa9bMObarrMEQRBfQKGuK0vrdea+jHoLu9MLmYCCGBKXIU
	XP6RJ5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQsn-00000008jV4-41xt;
	Wed, 08 Apr 2026 11:15:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQsl-00000008jUi-3SM1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:15:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A5603161;
	Wed,  8 Apr 2026 04:15:31 -0700 (PDT)
Received: from [10.57.86.179] (unknown [10.57.86.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65DE03F641;
	Wed,  8 Apr 2026 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775646937; bh=igR4tf9tvQIXuyv1BNumq6EyMN3XRctwsRk0w2FJVXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vmSjwA7DZY/mrvzmHWRHTxc8XRQEDtjI/NSPo+eCaom6KcIlEdJNksO3Ug2p32frD
	 bmssI77hNNjyHZbmiXYcj6Z+SnjoN3yx4TSxtECLlBIK9kTaVScZIcg+SWNq9WCl9l
	 ei7sqx3WBZdUfzeW3vdvTzF2MEUrE172T8LpGmog=
Message-ID: <2c1a1694-9597-400d-b441-714225b5377b@arm.com>
Date: Wed, 8 Apr 2026 12:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm-smmu-v3: Add PMCG child support and update PMU
 MMIO mapping
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_041539_934066_63002794 
X-CRM114-Status: GOOD (  16.77  )
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

On 2026-04-08 8:51 am, Peng Fan (OSS) wrote:
> This patch series adds proper support for describing and probing the
> Arm SMMU v3 PMCG (Performance Monitor Control Group) as a child node of
> the SMMU in Devicetree, and updates the relevant drivers accordingly.
> 
> The SMMU v3 architecture allows an optional PMCG block, typically
> associated with TCUs, to be implemented within the SMMU register
> address space. For example, mmu700 PMCG is at the offset 0x2000 of the
> TCU page 0.

But what's wrong with the existing binding? Especially given that it 
even has an upstream user already:

https://git.kernel.org/torvalds/c/aef9703dcbf8

> Patch 1 updates the SMMU v3 Devicetree binding to allow PMCG child nodes,
> referencing the existing arm,smmu-v3-pmcg binding.
> 
> Patch 2 updates the arm-smmu-v3 driver to populate platform devices for
> child nodes described in DT once the SMMU probe succeeds.
> 
> Patch 3 updates the SMMUv3 PMU driver to correctly handle MMIO mapping when
> PMCG is described as a child node. The PMCG registers occupy a sub-region
> of the parent SMMU MMIO window, which is already requested by the SMMU

That has not been the case since 52f3fab0067d ("iommu/arm-smmu-v3: Don't 
reserve implementation defined register space") nearly 6 years ago, 
where the whole purpose was to support Arm's PMCG implementation 
properly. What kernel is this based on?

Thanks,
Robin.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>        dt-bindings: iommu: arm-smmu-v3: Allow PMU child nodes
>        iommu/arm-smmu-v3: Populate PMU child devices from Devicetree
>        perf/arm-smmuv3: Avoid double-requesting shared SMMU MMIO for PMCG
> 
>   .../devicetree/bindings/iommu/arm,smmu-v3.yaml        | 10 ++++++++++
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c           |  3 +++
>   drivers/perf/arm_smmuv3_pmu.c                         | 19 ++++++++++++++++---
>   3 files changed, 29 insertions(+), 3 deletions(-)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-smmu-perf-754367fe66c8
> 
> Best regards,


