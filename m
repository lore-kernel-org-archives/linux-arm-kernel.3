Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87784CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzRO5pIU0DSRZ8uGAUnSnpZkLb58ICtmQOyBoRGpu2M=; b=uJmiUeQ9yKIayq8+X8IZ3Z6wEn
	j0Y+09JUpTkCNUCfPsdiNAcpTAg1s03KiKU8hoCTkzQHJuChQBDNNfwkLlEVAXT4iBCOfZFqa8572
	QyV+Jv9zVgBg7f0bemC3NcyH9JOoh9N87Nk6XYaLJDgVkI3sghZAsddY9GFWavcNIf4hWieJfDjvV
	df0R4gD4PDKaxvHPx/eRl5eBZm3kEQT96BJiWYNk2GtlzLfaexhn7ZR5KjvQcsek3AUSukg1XlkYm
	6iwDniTJ0As1eIyIybGOgZ4OG9zYzKruoK4yHaq/orhYAQR8FBvyuiFOpyZ3PvYZnypT9Q2YIWIV5
	KB7YRFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfHo-0000000DUKY-25i9;
	Tue, 13 Oct 2026 16:23:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfHl-0000000DUJg-1fuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:23:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D03EB169C;
	Tue, 13 Oct 2026 09:23:21 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 295413F871;
	Tue, 13 Oct 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791908605; bh=KjKzlUft5xNV3o/eqcbVESlWEYwfRH38VPCouMzjfIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R7FsTosr3Xgh6POSYmp6YKYdBHjOI4Eg3ZXseaXZo+5lMCpZk3B5wCT84+LhzPjcG
	 Z4sArXt+D+iIqYMMqy2k7kM/w+MGjOhsYm47G0CmeOIz7pcrnKDzflot5kGo1nPOFl
	 RaehSl84mJ5SsiVj/EQ8KwwA5+bi2VSFiM7Tbbwo=
Message-ID: <4d2a05c3-f7f6-4348-a3b4-c8f3ffa79b6c@arm.com>
Date: Tue, 13 Oct 2026 17:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Peng Fan <peng.fan@oss.nxp.com>,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jean-Philippe Brucker <jpb@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy
 <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89> <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
 <20261013124400.GI14213@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261013124400.GI14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_092329_565047_4170D8E9 
X-CRM114-Status: GOOD (  16.15  )
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

On 13/10/2026 1:44 pm, Jason Gunthorpe wrote:
> On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
>> If we're not going to support PASID for shared streams (which I suggest we
>> don't...) than we shouldn't strictly need to worry about CD tables anyway.
>> So rather than having to special-case CD table sharing for shared streams,
>> perhaps it might make sense to generalise back to a "default" per-domain CD
>> for non-PASID use, which can then get switched for the private per-stream
>> cd_table if and when a device does enable PASID?
> 
> If we have stared STEs then the group becomes the per-STE data
> structure not the master.. We don't have any way right now to do that,
> but it would make some sense for the group to store the shared CD

That would be precisely the aforementioned special case that I'd hope to 
avoid. My point is that the CD represents the domain context, so we 
really shouldn't have to have multiple copies of that per-device _or_ 
per-group, _unless_ it is attached via a PASID, since in that case it 
does need to be copied into a per-device CD table (since the per-domain 
CD table was indeed the wrong move in hindsight).

So what I'm saying is that if we're going to make anything share CDs, 
then ideally we should just make all non-PASID devices always directly 
share the domain's own CD, then if we just enforce that any devices 
sharing StreamIDs must be non-PASID devices, it should all work out, we 
save some memory in the normal case, and never have to be concerned with 
rewriting any STE with a different S1ContextPtr for the _same_ domain 
except when enabling or disabling PASID for the (single) device owning 
that STE.

Thanks,
Robin.

