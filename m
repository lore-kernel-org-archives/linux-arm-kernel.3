Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 04:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQ722ac+6DdXrAPXWdxusOTifbugFGTD2i2qMo39IMY=; b=Ooehp3ukXsR1F8FdxRGRMGNOzv
	MndFefjePFsFbkrw1s/7EYqfA/sBYO29lPc/EnDnwnOHtUqfdz9qudaVA+gjx/q33VtjTv3x/SkbT
	+s7BS8yNOzhbm/RTy5iZDFa0InhFcZIXI9xSRwZ8WgwQwCcbdFj9DmaCUOFgkoMtNCxVb+GMojgjo
	4Ar4JbOTpfOxCVtetBJQMu2tQRkx27xAZ/zp5PbpKTubecXEPQRIMVUhVZmqOxtUkqg7HnyRXDbur
	8oBoiP42o+RWMoSx1q3ez6bR8ookQFV+ypl4cjy24Ojy64HB7V1m1tFK5Hzxko1YX66auGYAvu9Ss
	PoVP2m7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTvE1-00000004c5w-1IzM;
	Tue, 24 Jun 2025 04:25:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTvBe-00000004bwm-0Pd1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 04:23:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58E6106F;
	Mon, 23 Jun 2025 21:22:48 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BD8A3F63F;
	Mon, 23 Jun 2025 21:23:03 -0700 (PDT)
Message-ID: <f565a64e-62d8-4cb3-b1b1-6de981b1052a@arm.com>
Date: Tue, 24 Jun 2025 09:53:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] coresight: Appropriately disable programming
 clocks
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
 <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>
 <20250609163840.GL8020@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609163840.GL8020@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_212310_412310_AC70EBB7 
X-CRM114-Status: GOOD (  16.28  )
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



On 09/06/25 10:08 PM, Leo Yan wrote:
> On Mon, Jun 09, 2025 at 05:11:21PM +0100, Suzuki Kuruppassery Poulose wrote:
>> On 09/06/2025 17:00, Leo Yan wrote:
>>> Some CoreSight components have programming clocks (pclk) and are enabled
>>> using clk_get() and clk_prepare_enable().  However, in many cases, these
>>> clocks are not disabled when modules exit and only released by clk_put().
>>>
>>> To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
>>> by replacing clk_get() and clk_prepare_enable() with
>>> devm_clk_get_enabled() for enabling APB clock.  Callers are updated
>>> to reuse the returned error value.
>>>
>>> With the change, programming clocks are managed as resources in driver
>>> model layer, allowing clock cleanup to be handled automatically.  As a
>>> result, manual cleanup operations are no longer needed and are removed
>>> from the Coresight drivers.
>>>
>>> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
>>
>> This looks suspicious. This patch covers a lot of components, but the
>> above commit is only affecting ETMv4 ?
> 
> Since commit 73d779a03a76 is the earliest patch that introduced the
> issue, it has been selected as the fix tag. We assume this will cover
> any subsequent changes that have the same issue.

Although I am not still sure about this patch actually requiring a
'Fixes:' tag as it just transitions into the device managed clocks
rather than fixing an existing issue. But choosing the first commit
makes sense as Leo has explained.

> 
>> The patch as such looks good to me.
> 
> Thanks for review!
> 
>> Suzuki
> 


