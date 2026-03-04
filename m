Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3663EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/XrX5Bu8nB1QMG/Qcbxzkm5sC59lfIQiJM8xkiO4IA=; b=Dmy7+zlyp36WNDQLDwUQtmAtx+
	iMF+XGxG+ldpgJOjqvQQrBgydGd0w0fnygmVkz2ZQ1ZjXPO3gfCP+rFu4+t97puoLb+nrwaVkuEKg
	Suj334Cq0xwGJFAhSwBZKukI83zlaNb9rMQwIICEdgkBzkIBBD1CTJ5sY1lDpsR1seW5dCRDBDOHl
	owNxRtajZv71cUT4L1laDHWE8GTIIxq7/Vu72D2F8xtcNi/cYXobyiDBs1DRvX7CBr+6tkScCOdEf
	3B3InrxA/cPngs9sovkB+KHsMaWYc8bta/E8+1+MyTAxel5yiDoIafH9LL4Xi2GT9ghZd2WwTliAO
	vPvsq3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxikW-0000000Gu24-0xDc;
	Wed, 04 Mar 2026 09:42:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxikT-0000000Gu1V-10Hv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:42:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05F4A339;
	Wed,  4 Mar 2026 01:42:25 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E153F694;
	Wed,  4 Mar 2026 01:42:26 -0800 (PST)
Message-ID: <6259fddb-62f3-4874-8188-6ca82e3586a8@arm.com>
Date: Wed, 4 Mar 2026 09:42:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, quic_jiles@quicinc.com, reinette.chatre@intel.com,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <87y0k8r7j1.fsf@stealth>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <87y0k8r7j1.fsf@stealth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_014233_407938_96656108 
X-CRM114-Status: GOOD (  28.23  )
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

Hi Punit,

On 3/3/26 20:18, Punit Agrawal wrote:
> Hi Ben,
> 
> Ben Horgan <ben.horgan@arm.com> writes:
> 
>> The main change in this version of the mpam missing pieces series is to
>> update the cdp emulation to match the resctrl interface. L2 and L3
>> resources can now enable cdp separately. Cdp can't be hidden correctly for
>> memory bandwidth allocation, as max per partid can't be emulated with more
>> partids, and so we hide this completely when cdp is enabled. There is a little
>> restructuring and a few smaller changes.
>>
>> Changelogs in patches
>>
>> It would be great to get this series merged this cycle. For that we'll need
>> more testing and reviewing. Thanks!
>>
>> From James' cover letter:
>>
>> This is the missing piece to make MPAM usable resctrl in user-space. This has
>> shed its debugfs code and the read/write 'event configuration' for the monitors
>> to make the series smaller.
>>
>> This adds the arch code and KVM support first. I anticipate the whole thing
>> going via arm64, but if goes via tip instead, the an immutable branch with those
>> patches should be easy to do.
>>
>> Generally the resctrl glue code works by picking what MPAM features it can expose
>> from the MPAM drive, then configuring the structs that back the resctrl helpers.
>> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
>> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
>> counters are considerably more hairy, and depend on hueristics around the topology,
>> and a bunch of stuff trying to emulate ABMC.
>> If it didn't pick what you wanted it to, please share the debug messages produced
>> when enabling dynamic debug and booting with:
>> | dyndbg="file mpam_resctrl.c +pl"
>>
>> I've not found a platform that can test all the behaviours around the monitors,
>> so this is where I'd expect the most bugs.
>>
>> The MPAM spec that describes all the system and MMIO registers can be found here:
>> https://developer.arm.com/documentation/ddi0598/db/?lang=en
>> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>>  This document has the best overview)
>>
>>
>> Based on v7.0-rc1
>>
>> The series can be retrieved from:
>> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v5
> 
> I booted with the series applied on an MPAM capable platform. The driver
> is able to probe the L2 attached MSCs.
> 
> In terms of features, bit-mapped based cache portion partitioning works
> as expected. The platform also supports additional controls (cache
> capacity and priority partitioning) and monitors (memory bandwidth and
> cache storage). The ones supported in MPAM driver probe OK but don't
> seem to be exposed. E.g.,
> 
>     mpam:mpam_resctrl_pick_counters: class 2 is a cache but not the L3
>     
> 
> It looks like some of it is due to an impedance mismatch with resctrl

Yes, what you describe is expected behaviour. There is no support yet
for cache capacity (CMAX) or bandwidth priority partitioning and
monitors are only exposed on the L3.

> expectations but hopefully we can get to it with the basics in-place.

I hope so. The CMAX and the bandwidth priority partitioning should be
easy to add once there is a generic way of adding new schema. There is a
plan/discussion here [1] and I don't expect adding monitoring on L2 to
be hard.

[1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/

> 
> Feel free to add
> 
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>

Thanks for testing!

> 
> Thanks,
> Punit
> 

Thanks,

Ben


