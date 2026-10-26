Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bQYH6Zro;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzuqJlL7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=waEbYX6KJPSoRNadiwOCD4LDKbTYoW2me5cQNSodTwI=; b=bQYH6ZroEmIYBO
	3pgKCTLFeUIQ251/HVl1AJW3jaxdH4WsME7RYSW3k0wvhsLqPBlV8pOHBKSmztuIkle1swvBJY9VD
	iPm8vi3EY8vRB/Ng46KBbj7sZSdPoe9XRNTzFi3XfCImkZSNcLjSgb83oZL7BuLmOFWsd6n1Wer6T
	6f0UhvQ31ymkQ379EEQUOjvo4tk3qtiMU7w9hK4v2HqXcRgqFtL1uODmimhBGW4eME8CtYlsst7mU
	Kv7O8/SR55HL0Czwdb72OVkjTiM+iCsuCjDHvr2UEl/PoTb4hNSQR3ZoH0lLFxGV1Nco9V6ZyKpur
	MMe79aOIVNtCpRbiVX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ9l-00000002PZB-3njo;
	Mon, 26 Oct 2026 11:46:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ9i-00000002PYO-2k5r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:46:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DFA61684;
	Mon, 26 Oct 2026 04:46:14 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AE3D3F59E;
	Mon, 26 Oct 2026 04:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793015177; bh=fG1932O5DnRLeWO28TC5OCEzVFgP3pBcePlqgLQmTiM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mzuqJlL7w1VogY9w2u92PK52BKlIVq3WC5uykPM1cXLMVMUZa12omeT08El7Nu7u2
	 mTjSVSp6lM91xzRHWsVcz4qdAEmAk4SvhgfsWe7O/IoiOLWEk2aY1y3J/uchKTbOMX
	 10s26HxS0natqMBJ/41T+1s1GqRrmEweoeRBvLJc=
Message-ID: <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
Date: Mon, 26 Oct 2026 11:46:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] arm_mpam: Add L2 cache monitors
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_044622_955135_C6C76D5E 
X-CRM114-Status: GOOD (  19.54  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 22/10/2026 09:48, Jinjie Ruan wrote:
> MPAM resource monitors hang off a partitionable resource in an MSC, not
> off a particular cache level. resctrl only knows about the L3 scope, so
> the L2 cache monitors that MPAM platforms implement are discovered by
> the driver but never show up in resctrl.

Yes, it would be good to add support for more monitoring scopes. This is not just relevant for MPAM.
RISC-V can also have monitors at many places in the system and we should coordinate so we have a
uniform solution across architectures.

> 
> An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
> level comes from the ACPI MPAM table's cache locator. So this is mostly
> a resctrl scope problem, not a hardware one.
> 
> Extend resctrl's monitor scope to L2: register the L2 occupancy and
> bandwidth events against the L2 resource, pick the L2 classes for them,
> and borrow a CSU/MBWU monitor for the duration of a read. With CDP the

Borrowing an MBWU monitor doesn't sound right. The MBWU monitor needs to be configured while the
traffic is happening so that it can keep count of bytes. The CSU is different as it can measure the
occupancy without having to keep any state.

Thanks,

Ben

> two PARTIDs need separate accumulating monitors, so the borrowed-monitor
> context becomes one monitor per PARTID.
> 
> Patches:
> 
>   1-2  Generalise the per-domain read path, add l2c_occupancy and
>        mbm_core_bytes, update the documentation.
> 
>   3    Split the borrowed-monitor context into data and code entries.
> 
>   4    Do the CDP num_rmid halving for every mon_capable resource.
> 
>   5-7  Pick the L2 classes, describe the events with the L2 resource,
>        add the read paths.
> 
> Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
> files show up and are readable; l2c_occupancy reports the modelled
> occupancy, and mbm_core_bytes reports the modelled bandwidth.
> 
> QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
> Test cases: https://github.com/ruanjinjie-eng/mpam_testcase
> 
> Jinjie Ruan (7):
>   fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
>   fs/resctrl: Add the L2 monitor events
>   arm_mpam: resctrl: Split monitor context for code/data
>   arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
>     CDP
>   arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
>   arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
>   arm_mpam: resctrl: Add the L2 monitor read paths
> 
>  Documentation/arch/arm64/mpam.rst |  23 +--
>  drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
>  fs/resctrl/monitor.c              |  15 +-
>  include/linux/resctrl_types.h     |  13 +-
>  4 files changed, 222 insertions(+), 65 deletions(-)
> 


