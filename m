Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E18D4336F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoKP4FvjWmj/xuLKYgy3zX1TUA438pRcKqaj3PckC3g=; b=i0ZeQkhTDTPFZaSLAnlVkwxYkw
	iTHQMgkqV/uGVxf/mAf53a+xaLlV2GA5uUrgYiqoecNUaZILojwOD9r/hyQFydsyAKx9rhfjMLot/
	ucWpe9FY+ci9N/58QTGwC5wCmOt/mKbKtSkeY3Mmxcwq7528DQZBe0XS8W9YVzfWRuFZIgn3eE4Kh
	/Hza9LO31kf6f3HT3lyFFeTBbfOzbZInHnwvtsHl8Y7+1ZUn4tqX3UHQOZu79+pEJdBaCWeNfV/vu
	pRRX6ztzTELgMixL4KkmcskYhJAB52z9J3CKaAnu7d++e+sdDubKFyxn2RcDEt3ndeghrjy9VfCxZ
	jmTufT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2I7-00000000WZb-3bMd;
	Fri, 12 Dec 2025 12:30:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2I4-00000000WZG-4ABV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:30:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D60FEC;
	Fri, 12 Dec 2025 04:30:23 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C1E63F762;
	Fri, 12 Dec 2025 04:30:27 -0800 (PST)
Message-ID: <e5dfd85d-c431-490d-8946-54ebad81a0e4@arm.com>
Date: Fri, 12 Dec 2025 12:30:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM registers
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
 <20251205215901.17772-2-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_043033_171149_0B8D4A25 
X-CRM114-Status: GOOD (  28.46  )
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

On 12/5/25 21:58, James Morse wrote:
> MPAM allows traffic in the SoC to be labeled by the OS, these labels
> are used to apply policy in caches and bandwidth regulators, and to
> monitor traffic in the SoC. The label is made up of a PARTID and PMG
> value. The x86 equivalent calls these CLOSID and RMID, but they don't
> map precisely.
> 
> MPAM has two CPU system registers that is used to hold the PARTID and PMG
> values that traffic generated at each exception level will use. These can be
> set per-task by the resctrl file system. (resctrl is the defacto interface
> for controlling this stuff).
> 
> Add a helper to switch this.
> 
> struct task_struct's separate CLOSID and RMID fields are insufficient
> to implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID)
> and PMG (sort of like the RMID) separately. On x86, the rmid is an
> independent number, so a race that writes a mismatched  closid and rmid
> into hardware is benign. On arm64, the pmg bits extend the partid.
> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).
> In this case, mismatching the values will 'dirty' a pmg value that
> resctrl believes is clean, and is not tracking with its 'limbo' code.
> 
> To avoid this, the partid and pmg are always read and written as a pair.
> Instead of making struct task_struct's closid and rmid fields an
> endian-unsafe union, add the value to struct thread_info and always use
> READ_ONCE()/WRITE_ONCE() when accessing this field.
> 
> Resctrl allows a per-cpu 'default' value to be set, this overrides the
> values when scheduling a task in the default control-group, which has
> PARTID 0. The way 'code data prioritisation' gets emulated means the
> register value for the default group needs to be a variable.
> 
> The current system register value is kept in a per-cpu variable to
> avoid writing to the system register if the value isn't going to change.
> Writes to this register may reset the hardware state for regulating
> bandwidth.
> 
> Finally, there is no reason to context switch these registers unless
> there is a driver changing the values in struct task_struct. Hide
> the whole thing behind a static key. This also allows the driver to
> disable MPAM in response to errors reported by hardware. Move the
> existing static key to belong to the arch code, as in the future
> the MPAM driver may become a loadable module.
> 
> All this should depend on whether there is an MPAM driver, hide
> it behind CONFIG_MPAM.
> 
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
[...]
> +
> +static inline void mpam_thread_switch(struct task_struct *tsk)
> +{
> +	u64 oldregval;
> +	int cpu = smp_processor_id();
> +	u64 regval = mpam_get_regval(tsk);
> +
> +	if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
> +	    !static_branch_likely(&mpam_enabled))
> +		return;
> +
> +	if (regval == READ_ONCE(arm64_mpam_global_default))
> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
> +
> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +	if (oldregval == regval)
> +		return;
> +
> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	isb();
> +
> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
> +	write_sysreg_s(regval, SYS_MPAM0_EL1);

SYS_MPAMSM_EL1 needs to be written here too to account for accesses
generated by SME loads. Also, when in streaming mode, SVE and FP loads,
stores and SVE prefetches.

SYS_MPAMSM_EL1 should also be considered in initialisation code too.

> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
> +}
Thanks,

Ben


