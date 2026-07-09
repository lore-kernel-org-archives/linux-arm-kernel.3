Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D89C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFhSRz8gZycpoeCODX2WLW97+vxo0gdKug4rM1GmWm0=; b=DM7TidE1qYTItXHKgBbxH8c8Ki
	zbUrCb6ZXL/UuwQxlGyxLG9zUac1ZaIOGnEOcUXK0V2PizVI3qIM0EMQNoGN+wEUVUtu4/MW4RywJ
	NamLaxPRecjjBIFxXV4V4nndkwiuxIIiDBFM/WFFn6BBfBOrkjwG4DqELpKSE6DX1LBfkauKgyMSH
	EXJ64rmZfK8OhEdmqR/f1LNnqLIWdkEGF3uaEnYP3sznvLKEAkmdSjaypUtRHl1De/lzWJVZYnd1y
	HC5WpokhPuZ1tPPdT6EpoCbSvoKw6uIom5G+nnN6J30KFpQEZngFeIQ2dt5mlzlhgOQJDLpVHxNWT
	XnsovTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrrR-000000033ej-1z2V;
	Thu, 09 Jul 2026 16:44:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrrO-000000033e8-3xGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:44:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8E951570;
	Thu,  9 Jul 2026 09:44:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21283F66F;
	Thu,  9 Jul 2026 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783615465; bh=Y7wfNC1739zey9eUhGqmGlRu8bQ7jbWzrvClfA89rHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DN+r+cuxUlrZjcbko1hTwCogobshJCrtb8sXIvzM/p9XKxBe8egqdqv5O5PF3I6sH
	 xoRxu6PUOAdPdDHaXXvUtsPK+yGzlsMvV1QN7SI18foO0kdVrhSjq8gCo26OFvXaN/
	 /VsicGHlgNTtPIxsnfe12LtOj99s3oZv5nsoq6uo=
Message-ID: <f344dd12-6b68-4d3e-bf66-f84fdf748b44@arm.com>
Date: Thu, 9 Jul 2026 17:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org,
 catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, stable@vger.kernel.org
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <20260703164914.GY7525@ziepe.ca>
 <6465c885-3a9d-4c0b-ab74-7665e274ae72@arm.com>
 <20260703192459.GB1978949@ziepe.ca>
 <f13b30cf-e885-44c6-8e61-7924937eb8ac@arm.com>
 <20260709160440.GL118978@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260709160440.GL118978@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_094427_106580_B481E780 
X-CRM114-Status: GOOD (  23.79  )
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

On 09/07/2026 5:04 pm, Jason Gunthorpe wrote:
> On Mon, Jul 06, 2026 at 03:13:01PM +0100, Robin Murphy wrote:
> 
>> Indeed if anyone does want to use SVA on such mismatched hardware and are
>> happy to use a custom kernel with CONFIG_ARM64_HAFT disabled then they can
>> and will continue to be able to do so.
> 
> It seems like we have a chip that is impacted by this. I'm being told
> that the necessary ARM IP is not available in time to properly match
> SMMU and CPU for its particular application.d
> 
> The chip is embedded so those work arounds are possibly OK - but I
> think this issue keeps coming up and ARM should have a better overall
> solution for CPU/SMMU mismatch in the ecosystem since it seems like
> this is going to keep happening..

To be fair, even if new VMSA features were added to the SMMU 
architecture in lockstep with the CPU architecture (which historically 
they haven't been since the SMMU version often needs additional 
consideration - oh, the fun we had with HDBSS...), and the SMMU products 
were developed and released in sync with CPU products (which again they 
have not been, for more than just architecture reasons), then at the end 
of the day from the Linux perspective we'd still have to deal with 
licensees having the freedom to play mix-and-match, so I don't see 
there's much that Arm could really do.

The CPU architecture does now provide FEAT_IDTE3, which platform 
firmware can use to hide visibility of features from an OS/hypervisor, 
so if you did ask, I suspect you'd get the answer that beyond that it's 
up to the OS to decide what it wants to do with what it's given.

> Even if Linux could automatically limit the CPU features to the SMMU
> it would be a big help.

Feel free to propose patches, but given that SMMU details may not be 
known until after userspace is up (since the driver can be a module), 
unless features can safely be toggled on and off entirely dynamically, 
for many cases I don't see that we could ever do much more than letting 
the user pick their preferred policy at boot time via config or command 
line.

Thanks,
Robin.

