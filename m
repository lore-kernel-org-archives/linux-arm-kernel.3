Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF1DD767F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6PIJZh6N53zRAMro/3rimhFFkoWc3aNrISldLR6J/0=; b=3MeCA4j0GsdD2p5bWsKQprdijG
	vwTBUi6RCY/V49DWvYBz6zUtOe+GHTxGM09KLB0qZn9yz+QCkYvUIYpJ4pl5cB9W+LLnUJtn+/JVW
	gd2hUEVTvFucQOOGEHC/BzxDCMWqYtPBakmkBphtvfWX2ETReShMqiFMMnyVPHCIrhgbKlYNaLsbP
	6kRGRQV4u9YtUsWDxKYTHuQd9LJryXHo56sB/j4i9MlaFGthY4iRvdb7GadJNGLbk3HUVhw5YrkBg
	ESb36R4eBzN/6mIXzMS1t1CTcesy+Nuc5wX4Q33X1j3M6MMa4BSmK6qq86pOl7/m/PjnhSVU4m4mm
	FQsb+SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZ5v-0000000AF1S-1mvB;
	Fri, 19 Dec 2025 11:56:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZ5s-0000000AF16-0m0P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 11:56:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D44DFEC;
	Fri, 19 Dec 2025 03:56:15 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF2FC3F5CA;
	Fri, 19 Dec 2025 03:56:18 -0800 (PST)
Message-ID: <e959f679-9c3c-41d9-b607-ba2e59ed37ee@arm.com>
Date: Fri, 19 Dec 2025 11:56:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/38] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-6-james.morse@arm.com>
 <20251218104433.00002196@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218104433.00002196@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_035624_370932_3110AF74 
X-CRM114-Status: GOOD (  18.01  )
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

On 12/18/25 10:44, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:28 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Care must be taken when modifying the PARTID and PMG of a task in any
>> per-task structure as writing these values may race with the task being
>> scheduled in, and reading the modified values.
>>
>> Add helpers to set the task properties, and the CPU default value.
>> These use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval()
>> to avoid causing torn values.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> CC: Ben Horgan <ben.horgan@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>  arch/arm64/include/asm/mpam.h | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> index 86a55176f884..2960ffaf6574 100644
>> --- a/arch/arm64/include/asm/mpam.h
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -5,6 +5,7 @@
>>  #define __ASM__MPAM_H
>>  
>>  #include <linux/bitops.h>
>> +#include <linux/bitfield.h>
>>  #include <linux/init.h>
>>  #include <linux/jump_label.h>
>>  #include <linux/percpu.h>
>> @@ -37,6 +38,35 @@ extern u64 arm64_mpam_global_default;
>>   * A value in struct thread_info is used instead of struct task_struct as the
>>   * cpu's u64 register format is used, but struct task_struct has two u32'.
>>   */
> I'd be tempted to reorder this so the comment ends up near at least
> one use of task_thread_info(tsk)->mpam_partid_pmg. Otherwise it is even
> less obvious what it is referring to.
> 
> Easiest might be to put the mpam_get_regval() before the mpam_set_task_partid_pmg()

Yes, this comment positioning was confusing.

> 
> 
>> +static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
>> +					 u8 pmg_d, u8 pmg_i)
>> +{
>> +	u64 default_val;
>> +
>> +	default_val = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
>> +	default_val |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
>> +	default_val |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
>> +	default_val |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
>> +
>> +	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
>> +}
>> +
>> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>> +					    u16 partid_d, u16 partid_i,
>> +					    u8 pmg_d, u8 pmg_i)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +	u64 regval;
>> +
>> +	regval = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
>> +	regval |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
>> +	regval |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
>> +	regval |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
> 
> Maybe a macro or helper to build regval given this replicates the block in
> mpam_set_cpu_defaults.  Obviously ignore if this changes in later patches!

I've added a helper.

> 
>> +
>> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>> +#endif
>> +}
>> +
>>  static inline u64 mpam_get_regval(struct task_struct *tsk)
>>  {
>>  #ifdef CONFIG_ARM64_MPAM
> 

Thanks,

Ben


