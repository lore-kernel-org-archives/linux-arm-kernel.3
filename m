Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96455C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPEKPBLvcDmPuNDghsI/pB/0064nCujHCjtUcrWwoDs=; b=Poy6NBB1TVss6txNM6WnSP7t+0
	JFhH8kRwmNroPAsFdXdHVZDAKF2y9/2NRepUM5nhXd9fgfB8fYUFMNU77ga+ffQMerVZUPlw9HiGl
	7CqfOWRrJDFtXUMMlVNBRtseum1iiPwE8iKvmEUjKSJ4SWls6uFETvefmQGvrBh0fpWPp1Kpy6MlS
	+yX6Awrn4FwZgO6g11jR47Pu+diSEB2zQ8CAz9GLUQCFGcwAV+tbp0Fd+uJmQwecSTAZ/PIBY+fZM
	AJx39O5Boespw8FK78WpzaUOlyTN6Rqwk5/HAPiPxIzu9HBXJQu6TbD3Ri0grr+1reEl5Bj5c0zTI
	ML0V9dDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxah-00000005JkM-1ikh;
	Tue, 11 Feb 2025 21:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxZH-00000005JbI-0Xrm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 21:13:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D63E1D14;
	Tue, 11 Feb 2025 13:13:39 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533493F5A1;
	Tue, 11 Feb 2025 13:13:15 -0800 (PST)
Message-ID: <97dfb0d9-1d7d-4174-9a7d-aac6f4ffaea8@arm.com>
Date: Tue, 11 Feb 2025 21:13:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] iommu/dart: Assert !locked when configuring
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
 <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
 <20250211192152.GA810942@robin.jannau.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250211192152.GA810942@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_131319_216081_1143002C 
X-CRM114-Status: GOOD (  19.80  )
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

On 2025-02-11 7:21 pm, Janne Grunau wrote:
> On Tue, Feb 11, 2025 at 06:41:00PM +0000, Robin Murphy wrote:
>> On 2025-02-10 7:39 pm, Alyssa Rosenzweig wrote:
>>> Configuration is only possible and needed for non-locked DARTs and will
>>> fail for locked DARTs. We cannot try -- assert that we do not.
>>
>> Except now we absolutely will - if a locked DART and its client device
>> are advertised to Linux, instead of gracefully refusing to touch it,
>> we'll now attach the client to a DMA domain, firing a barrage of
>> multiple WARNs in the process, and give it DMA ops which still cannot
>> work. I'm not really convinced this series on its own leaves us in a
>> better position than we're already in now... :/
>>
>> How hideous is the rest of what's required to actually make this usable?
> 
> The TTBR can not be changed but the preset first level table can
> modified at will. The driver keeps a shadow first label table and syncs
> that to the preset 1st level table on flush_tbl().
> It gets more complicated by the fact that the iommu for the display
> coprocessor is locked and mappings for its firmware and boot framebuffer
> are preinstalled and have to be maintained or restored on
> initialization.
> This is handled via reserved memory with translation.
> 
> Downstream change to handle this is in
> https://github.com/AsahiLinux/linux/commit/d90cc3590ea460e1c574b4b7c47fdafb2794af6a
> not including the change to parse / handle reserved memory with
> translation in iommu core.

Oh, if we handwave away the reserved region stuff for now, it doesn't 
seem *too* terrible, so definitely worth trying to land the bones of it 
along with this prep work, I reckon. From a quick look I think it might 
possibly be even cleaner as an io-pgtable quirk, to essentially skip 
allocating/freeing L1 and have some mechanism to fill in data->pgd with 
the remap afterwards (possible super cheeky version - also prepopulate 
cfg->apple_dart_cfg.ttbr and have alloc/free handle the 
remapping/unmapping themselves...). I'm not 100% sure off-hand, but 
since you avoid the DMA API and don't seem to have any other dependency 
on data->pgd having a linear map VA (other than the virt_to_phys() in 
the normal alloc path which you'd skip anyway), it feels like it ought 
to work out.

I guess to support multiple domains you do still end up having to 
save/restore the L1 contents at the driver level when attaching, so some 
kind of shadow table notion isn't entirely unavoidable... oh well, it's 
a thought, at least.

Thanks,
Robin.

