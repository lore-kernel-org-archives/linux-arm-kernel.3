Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118A5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nx4dOHYjSNdWLzROLXYP29B21uFfLWAgyj6hrreJJo=; b=VVdjh70pk+lsbZVks7hknIUaty
	SHDMV7tWSL4VHKnuwhlwYeMBngL77hwErwRGnZlXyJTKVkV3B3NU9GrZnsWxXzBdbHIQXrEKV61Kk
	t/AJ67srfy90LNt5Lj6Uz67OEH5EXpNCnEVWj3t+f3G/J8PuNhpfXKXPAiy1JDGm5LT6JUmksJ4lG
	ucxZtcXf9qlHD0mb9IgmLGveEbaS/kU4CCvgmeUmO+XFXATMh0QKzargdr0hpFxPFXPHUCKAXGSeS
	Y3UKikmi5uhWJrjVAXKvBWsyTPIJIdP2Cv+stkZC60Wt2tkZWEwME+f6wkrOOh92zhdFiDCwqKy1s
	2pk/kePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz8S-00000005kNg-27Xz;
	Tue, 11 Mar 2025 12:55:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz2D-00000005jUt-25pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 12:48:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98DE1152B;
	Tue, 11 Mar 2025 05:48:45 -0700 (PDT)
Received: from [10.57.37.142] (unknown [10.57.37.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABE503F673;
	Tue, 11 Mar 2025 05:48:33 -0700 (PDT)
Message-ID: <072d1d3a-2aeb-4ab0-9db1-476835a1131e@arm.com>
Date: Tue, 11 Mar 2025 12:48:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
To: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1740762136.git.robin.murphy@arm.com>
 <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
 <Z89P461+Y6kQDOCX@vaman>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z89P461+Y6kQDOCX@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_054837_600838_56B094C1 
X-CRM114-Status: GOOD (  12.74  )
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

On 2025-03-10 8:47 pm, Vinod Koul wrote:
> On 28-02-25, 17:26, Robin Murphy wrote:
> 
>> +static u32 d350_get_residue(struct d350_chan *dch)
>> +{
>> +	u32 res, xsize, xsizehi, hi_new;
>> +
>> +	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
>> +	do {
>> +		xsizehi = hi_new;
>> +		xsize = readl_relaxed(dch->base + CH_XSIZE);
>> +		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
>> +	} while (xsizehi != hi_new);
> 
> This can go forever, lets have some limits to this loop please

Sure, in practice I doubt we're ever going to be continually preempted 
faster than the controller can move another 64KB of data, but I concur 
there's no harm in making the code easier to reason about at a glance 
either.

>> +static int d350_alloc_chan_resources(struct dma_chan *chan)
>> +{
>> +	struct d350_chan *dch = to_d350_chan(chan);
>> +	int ret = request_irq(dch->irq, d350_irq, IRQF_SHARED,
>> +			      dev_name(&dch->vc.chan.dev->device), dch);
> 
> This is interesting, any reason why the irq is allocated here? Would it
> be not better to do that in probe...

Well, I'd say technically the IRQ is a channel resource, and quite a few 
other drivers do the same... Here it's mostly so I can get the channel 
name - so the IRQs are nice and identifiable in /proc/interrupts - 
easily without making a big mess in probe, since the names don't exist 
until after the device is registered.

Thanks,
Robin.

