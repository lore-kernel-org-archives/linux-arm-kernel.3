Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25480E6BF08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN7Yr1Wm5pWGvZX67T0Yo5fom5gFjqXWEl3ox2Jm5hU=; b=Ds3nISqcW5Hcbstvq4BkqKE3nl
	xeJSv01iNQI3eZ08KzCWFqy9eG3uaPp9kVyQf/rEZVC4y+N8r8bn2efdm3y0vc62nq5lAOReOvn4+
	u8DRa6/XOH2+By69Sto5rP08UcgJbr8fn+BC8X7Rw6fAGhKEU3Rzl3OlIPQqqHg5YtLameam5tRiF
	9Dr1G33jAdTiJ4oPrk80uMWgfh3/Fcmzk4XNNdzrHvTtMsAOn5oBpJsN88FVpY6cwHBjJ39GKaraB
	iDm09snYF2xQnOIbZguOK/r5qrq4cbTnjhoPQ++CIvhVNNGw5IS2JkTMJzC8Gm9t5r9cZOSjUU7r1
	s2K2cIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnVY-00000001TaV-2EX5;
	Fri, 30 Jan 2026 12:21:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnVW-00000001Ta5-0Kyu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:21:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F4148153B;
	Fri, 30 Jan 2026 04:21:41 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9921D3F632;
	Fri, 30 Jan 2026 04:21:43 -0800 (PST)
Message-ID: <a069fd6f-41d8-45b4-b63d-ccace1a0f501@arm.com>
Date: Fri, 30 Jan 2026 12:21:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 45/47] arm_mpam: Add workaround for T241-MPAM-4
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-46-ben.horgan@arm.com>
 <23f08379-301d-4ffc-bf6f-d6a7bb952724@nvidia.com>
 <e38cb392-ff29-4008-aa4f-e9d7166836f0@arm.com>
 <e10fa678-9564-4e09-a848-fac22e1c9a64@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <e10fa678-9564-4e09-a848-fac22e1c9a64@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_042150_262389_7C7A8F27 
X-CRM114-Status: GOOD (  17.76  )
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

Hi Fenghua,

On 1/29/26 22:14, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 1/19/26 12:56, Ben Horgan wrote:
>> Hi Fenghua,
>>
>> On 1/15/26 23:20, Fenghua Yu wrote:
>>> Hi, Shanker and Ben,
>>>
>>> On 1/12/26 08:59, Ben Horgan wrote:
>>>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>>>
>>>> In the T241 implementation of memory-bandwidth partitioning, in the
>>>> absence
>>>> of contention for bandwidth, the minimum bandwidth setting can
>>>> affect the
>>>> amount of achieved bandwidth. Specifically, the achieved bandwidth
>>>> in the
>>>> absence of contention can settle to any value between the values of
>>>> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
>>>> zero (below 0.78125%), once a core enters a throttled state, it will
>>>> never
>>>> leave that state.
>>>>
>>>> The first issue is not a concern if the MPAM software allows to program
>>>> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
>>>> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
>>>
>>> When MBW_MIN=1, min mem bw can be very low when contention. This may
>>> drop mem access performance. Is it possible to set MBW_MIN bigger so
>>> that ensure the floor of mem access is high?
>>
>> Isn't that a policy decision rather than something we should be putting
>> in a quirk framework?
> 
> MBW_MIN is 1% or 5% less than MBW_MAX.
> 
> The lower MBW_MIN hints hardware to lower mem bandwidth when mem access
> contention. That causes memory performance degradation.
> 
> Is it possible to do the following changes to fix the performance issue?
> 1. By default min mbw is equal to max mbw. So hardware won't lower
> performance unless it's needed. This can fix the current performance issue.
> 2. Add a new schemata line (e.g. MBI:<id>=x;<id>=y;...) to specify min
> mbw just like max mbw specified by schemata line "MB:...". User can use
> this line to change min mbw per partition per node. This could be added
> in the future.

Thanks for bringing this up. It raises some more general queries about
the handling of mbw_min and so I'll move the discussion to
[PATCH v3 41/47] arm_mpam: Generate a configuration for min controls
as it isn't specific to the nvidia quirks.

> 
> Thanks.
> 
> -Fenghua

Thanks,

Ben


