Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4ABD2ECE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wwb0BucoU9pwrZ7HxA6A8L6Cx7GPr2fiyhszcitlq8=; b=a0EVxCpJDee3s4ildwYs5mbT71
	6lvAYL0J4Cq8gbrtQaR4jlhx5dYgyZ8S1NonqaqosYE6OVHyjNj19m+gHNcUQHoAfCDORh6mg0pbh
	PdLKs/oR7ZEpXSrSlAlehnb4kB614JtFLXG9+1d7ya0rJQOiRUCzqBxMYF30hcE10g00IQ19PNIvC
	oHlx+bi/3FWL1eVxrX1QziJCvDtVVRfDtov8oRdys5QTrqqySN98S+YpevZfbpYwn6dHhetDDwu7K
	PLBAKQqDhZj39Cs4gt9woeTmfy6NEQBAaNPnk3nAoxzW7VAEWQonopp/CkQWOmbnNHrKtU8emROMw
	b/UwaDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwIW-00000002r3M-3uE9;
	Mon, 19 Jan 2026 20:56:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwIT-00000002r31-46Be
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:56:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D82F497;
	Mon, 19 Jan 2026 12:56:17 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63C783F632;
	Mon, 19 Jan 2026 12:56:19 -0800 (PST)
Message-ID: <e38cb392-ff29-4008-aa4f-e9d7166836f0@arm.com>
Date: Mon, 19 Jan 2026 20:56:17 +0000
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
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <23f08379-301d-4ffc-bf6f-d6a7bb952724@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_125626_053139_F836AAF8 
X-CRM114-Status: GOOD (  12.27  )
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

On 1/15/26 23:20, Fenghua Yu wrote:
> Hi, Shanker and Ben,
> 
> On 1/12/26 08:59, Ben Horgan wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> In the T241 implementation of memory-bandwidth partitioning, in the
>> absence
>> of contention for bandwidth, the minimum bandwidth setting can affect the
>> amount of achieved bandwidth. Specifically, the achieved bandwidth in the
>> absence of contention can settle to any value between the values of
>> MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.  Also, if MPAMCFG_MBW_MIN is set
>> zero (below 0.78125%), once a core enters a throttled state, it will
>> never
>> leave that state.
>>
>> The first issue is not a concern if the MPAM software allows to program
>> MPAMCFG_MBW_MIN through the sysfs interface. This patch ensures program
>> MBW_MIN=1 (0.78125%) whenever MPAMCFG_MBW_MIN=0 is programmed.
> 
> When MBW_MIN=1, min mem bw can be very low when contention. This may
> drop mem access performance. Is it possible to set MBW_MIN bigger so
> that ensure the floor of mem access is high?

Isn't that a policy decision rather than something we should be putting
in a quirk framework?

Thanks,

Ben


