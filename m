Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD638107BCF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWYoEOr1AuuMwexCNkAV5Xjg1Fj+o5j9mbbB6gMZvq8=; b=IuZGg7D3q2sTPRllr+FVBk9MMc
	GzFAzhd2OVvoaxWskmfRMPoiuYLaNvLxcEXZoYRkv8Y6JzXS12eSQpwB8ZxVbvn1toeQs6MZwRKMM
	U0CfUd7BrB89wMn7Vr8z0IyrFMCqi2Y478EV//zhiGgaiotuhDxf05SnDZDw2hJ8XzuhvA7Em56iy
	VQHC6CnD7MW7d4OUVOCBaDbhxt6f1y8WGEZ312qK6EBQAKMPk0v1qZP2xF5LL88urPS4f/Mw1SmHi
	K2aK2k/BPEIsrbsS8WN3De2ubHtYcQjCEhf9IqiUnXPI4R/xfAzRQBTVgednf0G36cTHg2bgQPTaV
	Ii6/EFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2o37-00000008CXr-0Vh5;
	Wed, 18 Mar 2026 10:22:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2o34-00000008CXV-0rF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:22:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5FC81E2F;
	Wed, 18 Mar 2026 03:22:35 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BEF93F778;
	Wed, 18 Mar 2026 03:22:38 -0700 (PDT)
Message-ID: <967c7d65-6ffe-4eb9-817c-2eb1f9b510b1@arm.com>
Date: Wed, 18 Mar 2026 10:22:36 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Jesse Chick <jessechick@os.amperecomputing.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <a8d31059-f821-48ac-b6bb-7e8d38fac7b6@os.amperecomputing.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <a8d31059-f821-48ac-b6bb-7e8d38fac7b6@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_032246_303912_80B2B01B 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Jesse,

On 3/17/26 00:25, Jesse Chick wrote:
> Hi Ben,
> 
> 
>> Thanks for all the reviewing and testing so far. Just a bit more to get this
>> over the line.
> 
> 
> I tested this patch series, specifically L3 CPOR, on an Ampere
> implementation with common benchmarking tools (lmbench, multichase).
> 
> 
>> Generally the resctrl glue code works by picking what MPAM features it can expose
>> from the MPAM drive, then configuring the structs that back the resctrl helpers.
>> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
>> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
>> counters are considerably more hairy, and depend on hueristics around the topology,
>> and a bunch of stuff trying to emulate ABMC.
> 
> 
> The observed latency in increasingly large R/W operations scaled as
> expected across various numbers of competing processes and cache
> portions. The distinct jumps in latency as successive cache level
> capacities were exceeded indicates that (a) L3 CPOR is configurable from
> user space via the resctrl interface as described in this series and (b)
> that the feature itself is working correctly.
> 
> For the series:
> 
> Tested-by: Jesse Chick <jessechick@os.amperecomputing.com>

Thanks for the testing and description.

Ben

> 
> Thanks,
> Jesse
> 
> 


