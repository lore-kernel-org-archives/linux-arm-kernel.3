Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF6C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiwRQZn9VkZjZ94MllXbBD6sVMBrL0OZDsGbDbpkLdo=; b=evBR9+xDXwy4QMdIV65piD3BLh
	P2nTUHvdS62QXnnPDLB6EIsa9QjPzb1utASNtq0KPo3YrEztTasvZlji5nc9+/wrclfYs9c5e5dpO
	dGgb5SWagJ74MCBKA2aoyp/6u92rC2PB/KsY7w3+cVWkjCEZ5G6uBDFu2oCqMbxJDQyZSp9+f4SDE
	gfJW8CHFZJWaMzqEvlPNe5SxgNfqZWR96ZE+Q8XzvUoI2idyxc6FCT61qckwwWPSk9AfraUT5MA4c
	VBEvOi9IloWuL3A7/yH2WiOfuXAbIZuLXwKp79GVU+b0Hlt4jD0n2BgL6NP8zV4Uc03EPgkCpILEl
	YwkRQ55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd57y-0000000Cs3i-1AwS;
	Tue, 06 Jan 2026 11:21:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd57w-0000000Cs34-0d2M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:21:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F3C1596;
	Tue,  6 Jan 2026 03:21:20 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F8D83F5A1;
	Tue,  6 Jan 2026 03:21:22 -0800 (PST)
Message-ID: <22eadfd1-67f9-470f-8e4e-b9af4dc869e1@arm.com>
Date: Tue, 6 Jan 2026 11:21:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/45] arm_mpam: resctrl: Add CDP emulation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-23-ben.horgan@arm.com>
 <20260105180700.000037c8@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260105180700.000037c8@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_032128_308631_09CF0E29 
X-CRM114-Status: GOOD (  18.23  )
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

Hi Jonathan,

On 1/5/26 18:07, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:24 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Intel RDT's CDP feature allows the cache to use a different control value
>> depending on whether the accesses was for instruction fetch or a data
>> access. MPAM's equivalent feature is the other way up: the CPU assigns a
>> different partid label to traffic depending on whether it was instruction
>> fetch or a data access, which causes the cache to use a different control
>> value based solely on the partid.
>>
>> MPAM can emulate CDP, with the side effect that the alternative partid is
>> seen by all MSC, it can't be enabled per-MSC.
>>
>> Add the resctrl hooks to turn this on or off. Add the helpers that match a
>> closid against a task, which need to be aware that the value written to
>> hardware is not the same as the one resctrl is using.
>>
>> Update the 'arm64_mpam_global_default' variable the arch code uses during
>> context switch to know when the per-cpu value should be used instead.
>>
>> Awkwardly, the MB controls don't implement CDP. To emulate this, the MPAM
>> equivalent needs programming twice by the resctrl glue, as resctrl expects
>> the bandwidth controls to be applied independently for both data and
>> instruction-fetch.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> CC: Amit Singh Tomar <amitsinght@marvell.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Minor thing below.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> 
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index 5a78299ec464..ba0312b55d9f 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -5,6 +5,7 @@
>>  #define __LINUX_ARM_MPAM_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/resctrl_types.h>
> 
> This seems odd as nothing added to the header in this path appears to need it.
> Maybe should be down in the c file or in a different patch?

Yep, moved it to patch 33, arm_mpam: resctrl: Allow resctrl to allocate
monitors.

> 
>>  #include <linux/types.h>
>>  
>>  struct mpam_msc;
>> @@ -56,6 +57,8 @@ void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
>>  void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>>  void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
>>  void resctrl_arch_sched_in(struct task_struct *tsk);
>> +bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
>> +bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>>  
>>  /**
>>   * mpam_register_requestor() - Register a requestor with the MPAM driver
> 

Thanks,

Ben


