Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F4E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2Vo4sUWZSw1sdW6OgDMvdBMe4C8MXVx2UmZLgvr588=; b=a8SPVGRweiUjRgLTea9guQnYtb
	SEX5NXLo9XNIDYXhHDR+2SkjpE1Pj/2Ls2MG3chzUvy8Wyi9kpW/jtlAdmMbev3KwFrrH0k0Q/Ke0
	Kk6CBcwQkS836KIDiGL0oqWkfAa1dS6kuKvkthnMJBRfhWZ5qNdoOLJYDB1zdF3UlbwS0z2/Guxh6
	szTg+ONCzW0KAqrrjLyOO7ENXxTwJ6dnhzR9h2Th7Y3kFcuEIHdqOI2icII6xc6iXIr+viXGv8C0p
	3S/FOgHMAgSuahlHtzHpYj9fROQiQYPKby/md8ltTYinggGAGrjEdpT6UudUHFNb5+v/jDUZjaXeF
	TaoG2+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmr-00000006NjA-2uOo;
	Tue, 03 Feb 2026 09:33:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmn-00000006Nfi-3jyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:33:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FB61339;
	Tue,  3 Feb 2026 01:33:21 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A24D3F632;
	Tue,  3 Feb 2026 01:33:22 -0800 (PST)
Message-ID: <fd130189-b9b8-437e-9240-308a5897c9b5@arm.com>
Date: Tue, 3 Feb 2026 09:33:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 41/47] arm_mpam: Generate a configuration for min
 controls
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, tan.shaopeng@fujitsu.com,
 xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 Zeng Heng <zengheng4@huawei.com>, jasjits@nvidia.com,
 Jason Sequeira <jsequeira@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-42-ben.horgan@arm.com>
 <20260113153938.00007d6e@huawei.com>
 <80db7035-07d3-4fb4-a228-f9c67d2df1f4@arm.com>
 <9e01328f-7f28-4b43-aaf4-59d3ce80c268@nvidia.com>
 <3ae02b5b-22ab-4778-a29d-709ca3163f58@arm.com>
 <ca45ea06-53fa-4010-86c6-66213243b636@nvidia.com>
Content-Language: en-US
In-Reply-To: <ca45ea06-53fa-4010-86c6-66213243b636@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013330_018237_61A99CAA 
X-CRM114-Status: GOOD (  30.80  )
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

Hi Shanker, Fenghua,

On 2/2/26 16:34, Shanker Donthineni wrote:
> Hi Ben,
> 
> On 2/2/2026 4:21 AM, Ben Horgan wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shanker,
>>
>> On 1/31/26 02:30, Shanker Donthineni wrote:
>>> Hi Ben,
>>>
>>> On 1/30/2026 8:17 AM, Ben Horgan wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Fenghua, Jonathan,
>>>>
>>>> On 1/13/26 15:39, Jonathan Cameron wrote:
>>>>> On Mon, 12 Jan 2026 16:59:08 +0000
>>>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>>>
>>>>>> From: James Morse <james.morse@arm.com>
>>>>>>
>>>>>> MPAM supports a minimum and maximum control for memory bandwidth. The
>>>>>> purpose of the minimum control is to give priority to tasks that are
>>>>>> below
>>>>>> their minimum value. Resctrl only provides one value for the
>>>>>> bandwidth
>>>>>> configuration, which is used for the maximum.
>>>>>>
>>>>>>
>>>>>> Hence, I'll drop this patch, and update the mbw_min default to be
>>>>>> 0xFFFF
>>>>>> and for the value not to change even if mbw_max changes. I think this
>>>>>> leaves us in the best position going forward without any heuristics
>>>>>> that
>>>>>> may come back to bite us later when proper support for a schema
>>>>>> supporting mbw_min is added to resctrl.
>>> Background: I previouslyshared original fix(seecodesnippet below) with
>>> James Morse
>>> ~2 years ago to address the errata, which explicitly recommends usinga
>>> 5% gap for
>>> mitigation of the Hardware issue (the problem described in commit text
>>> of T241-MPAM-4)
>>>
>>> For some reason theoriginalimplementationwas splitinto two patches:
>>>    - Generic change applicable toall chips
>>>    - Specific fixfor Graceerrata T241-MPAM-4
>>> Issue: Dropping this patch impacts[PATCH v3 45/47] forthe errata fix. If
>>> removalis
>>> necessary, please mergethis changeinto the T241-MPAM-4-specific patch.
>>
>> What's the behaviour on T241 when MBW_MIN is always 0xFFFF?
> 
> Memory bandwidth throttling will not function correctly. The MPAM hardware
> monitors MIN and MAX values for each active partition to maintain memory
> bandwidth usage between MBW_MIN and MBW_MAX. Therefore, MBW_MIN must be
> less than MBW_MAX (IMO, setting MBW_MIN to always 0xFFFF is incorrect)

Ah, yes. 0xFFFF is indeed a bad default. Looking at Table 5-3 in Mpam
system component B.a I see that as all bandwidth will be below the
minimum and so high preference the MBW_MAX will have no effect. I'll
keep the default for MBW_MIN as 0 (or the minimum for grace).

> 
> Grace errata T241-MPAM-4 has two issues:
> - MBW_MIN must be greater than 0 (WAR set to one when when it's zero) -
> In the Grace implementation of memory-bandwidth partitioning (MPAM),
>    in the absence of contention for bandwidth, the minimum bandwidth
>    setting can affect the amount of achieved bandwidth. Specifically,
>    the achieved bandwidth in the absence of contention can settle to any
>    value between the values of MIN and MAX. This means if the gap between
>    MIN and MAX is large then the BW can settle closer to MIN. To achieve
>    BW closer to MAX in the absence of contention, software should configure
>    a relatively narrow gap between MPAMCFG_MBW_MIN and MPAMCFG_MBW_MAX.
>    The recommendation is to use a 5% gap, corresponding to an absolute
>    difference of (0xFFFF * 0.05) = 0xCCC between MPAMCFG_MBW_MIN and
>    MPAMCFG_MBW_MAX.

Ok, thanks. I understand the issue more now.

> 
>> I'm worried if we make a policy decision of how to set MBW_MIN based on
>> MBW_MAX for this platform then we won't be able to support a
>> configurable MBW_MIN in the future for this platform.
> 
> Yes, we can't support generic programmable MBW_MIN for Grace chip. The
> currentresctrl interface doesnot exposeMBW_MIN, preventingusers from
> configuring the recommended5% gap. Without this interfacesupport,
> theonly wayto applytheworkaround is through driver-level changes.
> 
>>   As when MBW_MIN
>> support is added in resctrl the user's configuration for this platform
>> would change meaning on kernel upgrade.
> 
> What is the timelineforaddingMBW_MIN support? We have two options.
>  Option-A: Keep the current WAR 5% gap and don't allow users to program
> MBW_MIN.
>  Option-B:Remove the5% gap workaround and relyon usersto program MBW_MIN
>             accordingto the Grace recommendations
> whentheinterfacebecomes available.
> 
> We'll prefer option-B.

The problem with option-B is that the transition introduces a change in
user visible
for any existing MBW_MAX configuration.

If option-A is preferable to disabling MBW_MAX on grace until we have
proper MBW_MIN support in resctrl then I think we should assume option-A.

The work to decide how new schema is underway but it's difficult to say
how long it will take.
See: https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/

Assuming that you're sure that the 5% gap is the best policy and that
there are no other objections I'll add that policy back into the
T241-MPAM-4 workaround and look into a way to ensure that we don't
accidentally enable MBW_MIN support for grace comes when the proper
support is added.

> 
> Thanks,
> Shanker
> 

Thanks,

Ben


