Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1714AD6D22A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIiLdmpGJkGGEXCChzuAL02ZXBWn9IELM96VOlo5EK0=; b=HuoQvrsbPWXQXP/gy/Acj5GCvu
	x5GD2tzTfOP4Y+qa2JVwPStl8FenIkKUE4iYoJBhzg0X3i3+/Il0GblCbAwQOKW34Ag/OVycAy/pz
	xKu7hXMXdYWOf8zFdt8CwQ3+XYRaa/lmnbMlPkhq+h2hkzTkmXbh4vmmFr188cdcC7PX9r0GJ6Eue
	/2goxUmEj1+t90JnFccCgD1sTqFkB9MEqWNgoYUc7TnCpBVa/54zOjLJWfITRoU5HwBsxgWqLsVkj
	zFhoo7Ua8B4Yun6sREIfVhcO+fs2WOkgfp31gYKqS+5nf6kFN2yEpceXUM/DdzYTLx/614zX06s/p
	gBxSCDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFNP-00000008dsk-3rvg;
	Thu, 18 Dec 2025 14:53:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFNM-00000008dsI-1KV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2BDAFEC;
	Thu, 18 Dec 2025 06:52:55 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1EA33F73F;
	Thu, 18 Dec 2025 06:52:59 -0800 (PST)
Message-ID: <a1786f34-66b8-4620-b619-79e6013882e4@arm.com>
Date: Thu, 18 Dec 2025 14:52:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM registers
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
 <20251205215901.17772-2-james.morse@arm.com>
 <20251218103546.000070fd@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218103546.000070fd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_065308_443186_DA8DE7F9 
X-CRM114-Status: GOOD (  32.04  )
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

On 12/18/25 10:35, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:24 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> MPAM allows traffic in the SoC to be labeled by the OS, these labels
>> are used to apply policy in caches and bandwidth regulators, and to
>> monitor traffic in the SoC. The label is made up of a PARTID and PMG
>> value. The x86 equivalent calls these CLOSID and RMID, but they don't
>> map precisely.
>>
>> MPAM has two CPU system registers that is used to hold the PARTID and PMG
>> values that traffic generated at each exception level will use. These can be
>> set per-task by the resctrl file system. (resctrl is the defacto interface
>> for controlling this stuff).
>>
>> Add a helper to switch this.
>>
>> struct task_struct's separate CLOSID and RMID fields are insufficient
>> to implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID)
>> and PMG (sort of like the RMID) separately. On x86, the rmid is an
>> independent number, so a race that writes a mismatched  closid and rmid
>> into hardware is benign. On arm64, the pmg bits extend the partid.
>> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).
>> In this case, mismatching the values will 'dirty' a pmg value that
>> resctrl believes is clean, and is not tracking with its 'limbo' code.
>>
>> To avoid this, the partid and pmg are always read and written as a pair.
>> Instead of making struct task_struct's closid and rmid fields an
>> endian-unsafe union, add the value to struct thread_info and always use
>> READ_ONCE()/WRITE_ONCE() when accessing this field.
>>
>> Resctrl allows a per-cpu 'default' value to be set, this overrides the
>> values when scheduling a task in the default control-group, which has
>> PARTID 0. The way 'code data prioritisation' gets emulated means the
>> register value for the default group needs to be a variable.
>>
>> The current system register value is kept in a per-cpu variable to
>> avoid writing to the system register if the value isn't going to change.
>> Writes to this register may reset the hardware state for regulating
>> bandwidth.
>>
>> Finally, there is no reason to context switch these registers unless
>> there is a driver changing the values in struct task_struct. Hide
>> the whole thing behind a static key. This also allows the driver to
>> disable MPAM in response to errors reported by hardware. Move the
>> existing static key to belong to the arch code, as in the future
>> the MPAM driver may become a loadable module.
>>
>> All this should depend on whether there is an MPAM driver, hide
>> it behind CONFIG_MPAM.
>>
>> CC: Amit Singh Tomar <amitsinght@marvell.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> new file mode 100644
>> index 000000000000..86a55176f884
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -0,0 +1,74 @@
> ...
> 
>> +/*
>> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
>> + * which may race with reads in __mpam_sched_in(). Ensure only one of the old
>> + * or new values are used. Particular care should be taken with the pmg field
>> + * as __mpam_sched_in() may read a partid and pmg that don't match, causing
>> + * this value to be stored with cache allocations, despite being considered
>> + * 'free' by resctrl.
>> + *
>> + * A value in struct thread_info is used instead of struct task_struct as the
>> + * cpu's u64 register format is used, but struct task_struct has two u32'.
> 
> This comment probably wants to provide a little more info if it is to be useful,
> 
> Is it a reference to the closid and rmid fields under CONFIG_X86_CPU_RESCTRL?
> I'm not immediately understanding why that matters given you could slap
> a union on it without (I think) resulting in anything else moving.

Yes, the fields referred to are those closid and rmid. As James writes
in the commit message a union is an alternative, but it would be endian
unsafe. Unlikely to matter but lets not break things.

I'm replying for James as he is otherwise engaged. Thanks for the review
of this series and all your review on the previous MPAM series.

> 
> Now having it in thread_info moves it into arch header territory so
> might make sense for that reason.
> 
>> + */
>> +static inline u64 mpam_get_regval(struct task_struct *tsk)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>> +#else
>> +	return 0;
>> +#endif
>> +}
> 

Thanks,

Ben


