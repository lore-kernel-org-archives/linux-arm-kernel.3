Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B24AD29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmC1VsoCKvHUeXfyUxPpgocxZeIWo3eCf2Ms5WFFShk=; b=VmxNt12aV5YVy/LWAOlHKAjBUU
	8lh6zUsiTeaR7swWFPQAkixqcCXcUtFZxbELqfZBBjGyzNJMrFlezxp+8iA8RobFdx99e0Z+0N20P
	SYKrd31MsmBsFxihTTzk//g0SUq2h6rQkyeuQkmwIWD/leSZfLKLjNwtT3RFMeDl7j1+5wBGS6gQJ
	7PlYPc6/+vPX4qi9uL1YWkEAiG5D54YitHlnxwzMRJhzV3YC7dQGnffrLAyr4R30nUK9xOAu/OBmf
	6lSgQ+Xc+kdVxoEiq9OXgO/UCmk1KLB0PVW+Q6foI24+DS2otPtybMHLgP1gEeUFd0ZRFakTAkZ9d
	1Epq+ROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqZh-00000002I5B-0jb7;
	Mon, 19 Jan 2026 14:49:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqZf-00000002I4q-03gg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:49:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19817497;
	Mon, 19 Jan 2026 06:49:38 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D79E73F632;
	Mon, 19 Jan 2026 06:49:39 -0800 (PST)
Message-ID: <892730c8-e4a1-44e2-a6b4-2c9af0a7eab0@arm.com>
Date: Mon, 19 Jan 2026 14:49:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/47] arm64: mpam: Advertise the CPUs MPAM limits to
 the driver
To: Gavin Shan <gshan@redhat.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-9-ben.horgan@arm.com>
 <7c224083-595b-432f-9147-1e8067df634c@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <7c224083-595b-432f-9147-1e8067df634c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_064947_200951_4F9C439B 
X-CRM114-Status: GOOD (  20.33  )
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

Hi Gavin,

On 1/19/26 06:37, Gavin Shan wrote:
> Hi Ben,
> 
> On 1/13/26 12:58 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> Requestors need to populate the MPAM fields for any traffic they send on
>> the interconnect. For the CPUs these values are taken from the
>> corresponding MPAMy_ELx register. Each requestor may have a limit on the
>> largest PARTID or PMG value that can be used. The MPAM driver has to
>> determine the system-wide minimum supported PARTID and PMG values.
>>
>> To do this, the driver needs to be told what each requestor's limit is.
>>
>> CPUs are special, but this infrastructure is also needed for the SMMU and
>> GIC ITS. Call the helper to tell the MPAM driver what the CPUs can do.
>>
>> The return value can be ignored by the arch code as it runs well
>> before the
>> MPAM driver starts probing.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   arch/arm64/kernel/mpam.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
>> index 9866d2ca0faa..e6feff2324ac 100644
>> --- a/arch/arm64/kernel/mpam.c
>> +++ b/arch/arm64/kernel/mpam.c
>> @@ -3,6 +3,7 @@
>>     #include <asm/mpam.h>
>>   +#include <linux/arm_mpam.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/percpu.h>
>>   @@ -11,3 +12,14 @@ DEFINE_PER_CPU(u64, arm64_mpam_default);
>>   DEFINE_PER_CPU(u64, arm64_mpam_current);
>>     u64 arm64_mpam_global_default;
>> +
>> +static int __init arm64_mpam_register_cpus(void)
>> +{
>> +    u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
>> +    u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
>> +    u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
>> +
>> +    return mpam_register_requestor(partid_max, pmg_max);
> 
> mpam_register_requestor() is exposed until CONFIG_ARM64_MPAM_DRIVER is set.
> CONFIG_ARM64_MPAM_DRIVER and CONFIG_ARM64_MPAM can be different until
> PATCH[39/47]
> is applied. So we need PATCH[39/47] to be applied prior to this patch so
> that
> mpam_register_requestor() is always existing and exposed.

I've split out the part of PATCH[39/47] that removes the CONFIG_EXPERT
restriction and put it before this patch. With that CONFIG_ARM64_MPAM
will unconditionally select CONFIG_ARM64_MPAM_DRIVER.

> 
>> +}
>> +/* Must occur before mpam_msc_driver_init() from subsys_initcall() */
>> +arch_initcall(arm64_mpam_register_cpus)
> 
> Thanks,
> Gavin
> 
Thanks,

Ben


