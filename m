Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97979D41C21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcGprBaLKCSBZW08+GHjdVQn+0jdpvKT5jPnJ0YXUSg=; b=PDx89eVtk2cE1+p7oINSsxOlzu
	YwJwuh8QWMfVCV7s40ZZalSRJYWmYSq9UylrTZp1NyE+3LOdv9zx86IWs8IEuovqtFua80WqILxvq
	iJKTUy8+b0HKwuWE+mCwVsS+1xqHkb2/ijYhEpDWrek9FRSq2z275bN1gl96cRKZLD1PUtRyUQcuL
	W7yg/6Q1w93VzzLxxphcvVrrL4QA8LOHHcFlvOusN9p4nnr0LAS9zHLTlktUPWtX9bguEYmfmhov3
	APvii9jeFiQUddq5lYD34KAwhJhIvDWNiK8HlLtAXKf/ykOXWtTCTR28Fo+Ze5JwYtRecaGeDO2WE
	cXs2XKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTelo-0000000GX80-0GRQ;
	Thu, 11 Dec 2025 11:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTell-0000000GX76-3DHI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:23:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5903B175D;
	Thu, 11 Dec 2025 03:23:27 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F893F740;
	Thu, 11 Dec 2025 03:23:31 -0800 (PST)
Message-ID: <b922ff73-c583-482e-8925-ad7758280705@arm.com>
Date: Thu, 11 Dec 2025 11:23:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/38] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
From: Ben Horgan <ben.horgan@arm.com>
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-3-james.morse@arm.com>
 <0ea282be-c44f-4562-9104-1efe57348a3e@arm.com>
Content-Language: en-US
In-Reply-To: <0ea282be-c44f-4562-9104-1efe57348a3e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_032337_962859_E38482F4 
X-CRM114-Status: GOOD (  18.02  )
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

Hi James,

On 12/9/25 15:13, Ben Horgan wrote:
> Hi James,
> 
> On 12/5/25 21:58, James Morse wrote:
>> Now that the MPAM system registers are expected to have values that change,
>> reprogram them based on struct task_struct when a CPU is brought online.
>>
>> Previously MPAM's 'default PARTID' of 0 was used this is the PARTID that
>> hardware guarantees to reset. Because there are a limited number of
>> PARTID, this value is exposed to user space, meaning resctrl changes
>> to the resctrl default group would also affect kernel threads.
>> Instead, use the task's PARTID value for kernel work on behalf of
>> user-space too.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>  arch/arm64/kernel/cpufeature.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 5ed401ff79e3..429128a181ac 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -86,6 +86,7 @@
>>  #include <asm/kvm_host.h>
>>  #include <asm/mmu.h>
>>  #include <asm/mmu_context.h>
>> +#include <asm/mpam.h>
>>  #include <asm/mte.h>
>>  #include <asm/hypervisor.h>
>>  #include <asm/processor.h>
>> @@ -2439,13 +2440,16 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
>>  static void
>>  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
>>  {
>> -	/*
>> -	 * Access by the kernel (at EL1) should use the reserved PARTID
>> -	 * which is configured unrestricted. This avoids priority-inversion
>> -	 * where latency sensitive tasks have to wait for a task that has
>> -	 * been throttled to release the lock.
>> -	 */
>> -	write_sysreg_s(0, SYS_MPAM1_EL1);
>> +	int cpu = smp_processor_id();
>> +	u64 regval = 0;
>> +
>> +	if (IS_ENABLED(CONFIG_MPAM))
>> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> 
> CONFIG_MPAM -> CONFIG_ARM64_MPAM

Actually, this code is only run before the mpam enablement is finished,
importantly before the mpam_enabled static key is set, and so
arm64_mpam_current is still 0 for every cpu. For cpus that are brought
up after boot time this is never run.

As SYS_MPAM0_EL1 and SYS_MPAM1_EL1 are unknown out of reset we should
set them to 0 whenever a cpu comes online to make sure they initially
use PARTID 0 as that is the only one guaranteed to have sensible
defaults in the MSC. Once the mpam driver has configured the MSC we can
start setting other values.

> 
>> +
>> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +	isb();
>> +
>> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
>>  }
>>  
>>  static bool
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


