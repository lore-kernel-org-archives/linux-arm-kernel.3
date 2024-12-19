Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2368E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M825NDB4/Bj9UxpPUCSqA5uXq4jUZw3QO6OfHdEl9o=; b=zNK1Bw+dOSr9Yhu0oBKGGwy+si
	5tmcXbqUNPjTDts/S+327Cl9Djn8Vhum+cQN1xsC9a98hZZ9hicL29RsWrexNp43jXiZ2HIaXH4hU
	2VyXvIFNzXzcrErmqUlfiyg5i207T9NrFLr52yivff0vG+wOtTiOoE4botjsVW018etKEKdewLYL9
	1AbvM6790ox7bhSQg1goKbeAkuCjhWvTHOPtS8IHzb/Qh+UtTb7+/KcjINZqzk7kGIu3MSK9YlwaD
	suaWeua6lJFgIrhgvHzFEFaIsv4+QoOzDQ11bxFVrmb64NWZgVKNX+JuCmJ3LPVs5UGV8FwuCb0m4
	KXeOfNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFLp-00000001kJ2-3CHS;
	Thu, 19 Dec 2024 12:09:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFKk-00000001kDi-0hCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:08:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6FD1477;
	Thu, 19 Dec 2024 04:09:15 -0800 (PST)
Received: from [10.57.1.39] (unknown [10.57.1.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDD43F720;
	Thu, 19 Dec 2024 04:08:45 -0800 (PST)
Message-ID: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
Date: Thu, 19 Dec 2024 12:08:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241216171017.4881-1-robdclark@gmail.com>
 <20241219113019.GA23640@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219113019.GA23640@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_040850_260175_06DCFD8F 
X-CRM114-Status: GOOD (  10.21  )
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

On 2024-12-19 11:30 am, Will Deacon wrote:
> On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> On mmu-500, stall-on-fault seems to stall all context banks, causing the
>> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> MMU-500 has public documentation so please can you dig up what the
> actual behaviour is rather than guess?

Yeah, I'm pretty sure that's not true as stated, especially with 
SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is 
plausible that at the system interconnect level, a sufficient number of 
stalled transactions might backpressure other transactions from entering 
the same TBU, even if they are destined for a different context. That's 
more about the configuration and integration of individual SoCs than the 
SMMU IP used.

Robin.

>> This fixes an issue with an older mesa bug taking outo the system
>> because of GMU going off into the year.
> 
> Sorry, but I don't understand this sentence.
> 
> Will


