Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A9CD29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q9WKs1aXZtsnyO8MG81oNquNc/Lp0VBMnO7LSeZF24=; b=qZvipP6+AJ1suyJpOir1zr1FFl
	BU7J3QPOV+LwYBvyO2rWTnEnleVcJiN9TRvQ9jNGebD7fHMb4AMqSwaJgFi8L0fFbV8We9jldL/zN
	yKNHmjv895LGBnuEPHdZt7zbA90ImhfrEKlWSCf3BZKeL7P7fkMsWbWIga39tqOO5yFz5ObSGL+NQ
	sFVVth8znbfeqh1/wT56DsBcmOpmy/R9HJCsrfsweUm7docX+7htVYVv5HS7oyfs0GFmRRdr6Hu6h
	f7xM348EGB3Qh6qdDMCT6I9G51oz5IBTQ9j+7quNLOxZcekC32QdbiFugLETBfVWcwyTkFVQx47bJ
	fbu3r6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqs7-00000002JnE-0Yku;
	Mon, 19 Jan 2026 15:08:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqs3-00000002Jme-2an4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E5C8497;
	Mon, 19 Jan 2026 07:08:39 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CACF3F694;
	Mon, 19 Jan 2026 07:08:41 -0800 (PST)
Message-ID: <1389bd4b-494c-42da-84bf-89d0055e2d16@arm.com>
Date: Mon, 19 Jan 2026 15:08:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/47] arm64: mpam: Add cpu_pm notifier to restore MPAM
 sysregs
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
 <20260112165914.4086692-10-ben.horgan@arm.com>
 <5c79d642-cd95-4c6b-9eeb-bd055719ca91@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <5c79d642-cd95-4c6b-9eeb-bd055719ca91@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_070849_105135_D2B82AB2 
X-CRM114-Status: GOOD (  19.91  )
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

On 1/19/26 06:50, Gavin Shan wrote:
> Hi Ben,
> 
> On 1/13/26 12:58 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The MPAM system registers will be lost if the CPU is reset during PSCI's
>> CPU_SUSPEND.
>>
>> Add a PM notifier to restore them.
>>
>> mpam_thread_switch(current) can't be used as this won't make any
>> changes if
>> the in-memory copy says the register already has the correct value. In
>> reality the system register is UNKNOWN out of reset.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   arch/arm64/kernel/mpam.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
> 
> One question below...
> 
>> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
>> index e6feff2324ac..dbe0a2d05abb 100644
>> --- a/arch/arm64/kernel/mpam.c
>> +++ b/arch/arm64/kernel/mpam.c
>> @@ -4,6 +4,7 @@
>>   #include <asm/mpam.h>
>>     #include <linux/arm_mpam.h>
>> +#include <linux/cpu_pm.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/percpu.h>
>>   @@ -13,12 +14,41 @@ DEFINE_PER_CPU(u64, arm64_mpam_current);
>>     u64 arm64_mpam_global_default;
>>   +static int mpam_pm_notifier(struct notifier_block *self,
>> +                unsigned long cmd, void *v)
>> +{
>> +    u64 regval;
>> +    int cpu = smp_processor_id();
>> +
>> +    switch (cmd) {
>> +    case CPU_PM_EXIT:
>> +        /*
>> +         * Don't use mpam_thread_switch() as the system register
>> +         * value has changed under our feet.
>> +         */
>> +        regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>> +        write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +        isb();
>> +
>> +        write_sysreg_s(regval, SYS_MPAM0_EL1);
>> +
>> +        return NOTIFY_OK;
>> +    default:
>> +        return NOTIFY_DONE;
>> +    }
>> +}
>> +
>> +static struct notifier_block mpam_pm_nb = {
>> +    .notifier_call = mpam_pm_notifier,
>> +};
>> +
>>   static int __init arm64_mpam_register_cpus(void)
>>   {
>>       u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
>>       u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
>>       u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
>>   +    cpu_pm_register_notifier(&mpam_pm_nb);
> 
> Need we ensure MPAM capability exists in the hardware before the
> notifier is registerred?
> Otherwise, mpam_pm_notifier() can accesses SYS_MPAM0_EL1 and
> SYS_MPAM1_EL1 system registers
> which may not supported by the hardware.

Ah yes, I'll add a system_supports_mpam() check here.

> 
>>       return mpam_register_requestor(partid_max, pmg_max);
>>   }
>>   /* Must occur before mpam_msc_driver_init() from subsys_initcall() */
> 
> Thanks,
> Gavin
> 

Thanks,

Ben


