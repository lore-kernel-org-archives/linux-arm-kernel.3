Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D41D29C39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNv/WLjmhXxPRgxWPo8o1cLUblJ9y9GcvZHWBnP0Vno=; b=mNrdbNaFuHj3nlaUtlf4hmOvg8
	/SzwrjYuIZopD7L2YWzAkFvBYBXUGdgk1kISHfwlXxdS+YxT/r2G1BUSmIG3nY5TssXFdZmLO1cpX
	7RwBpgrZeOPQKYJTj2IOpwFl+O8N2UBT53mOKK/hjsuAiwHFZ7ARqDgYSFysMhR6ofxru5zC2r3MN
	PlLQDb4awM7LZsORsZqD+TQrby73N03A7jv/FvPmpr8Ugz+yqSDNKPr7vdF42Dnkg2OTPXImRUjnP
	rfISWT/JtTUXh+29B6xg25XwMG9uA7WIUt//fL0cvlxovVb1dnxS3KrYyUWCkm+6utqeyIzsWIErW
	vpl2EgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrVE-00000002OJR-01My;
	Mon, 19 Jan 2026 15:49:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrVB-00000002OIy-1gJ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:49:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322B1FEC;
	Mon, 19 Jan 2026 07:49:05 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2FA93F694;
	Mon, 19 Jan 2026 07:49:06 -0800 (PST)
Message-ID: <a48e749d-fdeb-4306-9324-0f62fc72b589@arm.com>
Date: Mon, 19 Jan 2026 15:49:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/47] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
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
 <20260112165914.4086692-12-ben.horgan@arm.com>
 <57a015c3-9a4b-478b-8cb6-6c61f84c0b74@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <57a015c3-9a4b-478b-8cb6-6c61f84c0b74@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074913_525102_99A0CAB9 
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

Hi Gavin,

On 1/19/26 07:01, Gavin Shan wrote:
> Hi Ben,
> 
> On 1/13/26 12:58 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> Care must be taken when modifying the PARTID and PMG of a task in any
>> per-task structure as writing these values may race with the task being
>> scheduled in, and reading the modified values.
>>
>> Add helpers to set the task properties, and the CPU default value.  These
>> use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
>> avoid causing torn values.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> Keep comment attached to mpam_get_regval()
>> Add internal helper, __mpam_regval() (Jonathan)
>> ---
>>   arch/arm64/include/asm/mpam.h | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/
>> mpam.h
>> index 7b3d3abad162..c9b73f1af7ce 100644
>> --- a/arch/arm64/include/asm/mpam.h
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -4,6 +4,7 @@
>>   #ifndef __ASM__MPAM_H
>>   #define __ASM__MPAM_H
>>   +#include <linux/bitfield.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/percpu.h>
>>   #include <linux/sched.h>
>> @@ -22,6 +23,22 @@ DECLARE_PER_CPU(u64, arm64_mpam_current);
>>    */
>>   extern u64 arm64_mpam_global_default;
>>   +static inline u64 __mpam_regval(u16 partid_d, u16 partid_i, u8
>> pmg_d, u8 pmg_i)
>> +{
>> +    return FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d) |
>> +        FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i) |
>> +        FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d) |
>> +        FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
>> +}
> 
> Nitpick: Alignment issues in the lines for 2nd/3rd/4th FIELD_PREP().
> 
>     return FIELD_PREP(...) |
>            FIELD_PREP(...) |
>                FIELD_PREP(...) |
>                FIELD_PREP(...);

Sure, I'll align these.

> 
>> +
>> +static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16
>> partid_i,
>> +                     u8 pmg_d, u8 pmg_i)
>> +{
>> +    u64 default_val = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +    WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
>> +}
>> +
> 
> per_cpu(arm64_mpam_default) won't be reachable until CONFIG_ARM64_MPAM
> is set.
> So I think both mpam_set_cpu_defaults() and __mpam_regval() need to be
> protected
> by '#ifdef CONFIG_ARM64_MPAM ... #endif'.

I'll move the #ifdef CONFIG_ARM64_MPAM up to cover these.

> 
>>   /*
>>    * The resctrl filesystem writes to the partid/pmg values for
>> threads and CPUs,
>>    * which may race with reads in mpam_thread_switch(). Ensure only
>> one of the old
>> @@ -36,6 +53,17 @@ static inline u64 mpam_get_regval(struct
>> task_struct *tsk)
>>       return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>>   }
>>   +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>> +                        u16 partid_d, u16 partid_i,
>> +                        u8 pmg_d, u8 pmg_i)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +    u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +    WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>> +#endif
>> +}
>> +
>>   static inline void mpam_thread_switch(struct task_struct *tsk)
>>   {
>>       u64 oldregval;
> 
> Thanks,
> Gavin
> 

Thanks,

Ben


