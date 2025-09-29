Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0043CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnJmbHYc6VLAgDjPtVQXctBBqBrkLl0S8aQ1M0AexxE=; b=q23oxsye0c2snrCrnt02pmePC4
	FC8HWAGZVKmHBUYGyHU46ugm4t75iBWH/rb5YxQmDltYDgGyai/x5BVPTNPAJHV3ute3D/QWORHUD
	GeSWE/yjQ4CGeC5y27IVWZG8X/tuDiSj/k9WGfRc1W0XELzLfeZGXv2wPlMl4upupgLQCxwtbYQhy
	q/Cv/7MAE6UvgtvMkT5aNC3boXANOe9P7UFUxI+rZl2art6UjtgYpV/my5kOdJuYZY0oQABzYHkDD
	oTazthWz+gjJPXg/gdqWExekRjrWaaiYgpraliZJHbRp39YUmOecfKsl2g0Aax05arAu2N0XRC0SY
	CKzKbYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HwU-00000003AQZ-3FPB;
	Mon, 29 Sep 2025 17:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hvo-000000039ze-20fu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:45:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F021CC4;
	Mon, 29 Sep 2025 10:44:51 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E5C33F59E;
	Mon, 29 Sep 2025 10:44:54 -0700 (PDT)
Message-ID: <2672f409-7923-4b9b-9009-bb5815205e57@arm.com>
Date: Mon, 29 Sep 2025 18:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/29] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-13-james.morse@arm.com>
 <aaefa134-b520-42d2-a700-4f7382b0318f@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aaefa134-b520-42d2-a700-4f7382b0318f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104500_644448_55894F69 
X-CRM114-Status: GOOD (  20.57  )
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

Hi Ben,

On 11/09/2025 16:31, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
>> interrupt, and when taking an IPI to access these registers on platforms
>> where MSC are not accesible from every CPU. This makes an irqsave
>> spinlock the obvious lock to protect these registers. On systems with SCMI
>> mailboxes it must be able to sleep, meaning a mutex must be used. The
>> SCMI platforms can't support an overflow interrupt.
>>
>> Clearly these two can't exist for one MSC at the same time.
>>
>> Add helpers for the MON_SEL locking. The outer lock must be taken in a
>> pre-emptible context before the inner lock can be taken. On systems with
>> SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
>> will fail to be 'taken' if the caller is unable to sleep. This will allow
>> callers to fail without having to explicitly check the interface type of
>> each MSC.

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 828ce93c95d5..4cc44d4e21c4 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -70,12 +70,17 @@ struct mpam_msc {
>>  
>>  	/*
>>  	 * mon_sel_lock protects access to the MSC hardware registers that are
>> -	 * affected by MPAMCFG_MON_SEL.
>> +	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
>> +	 * Access to mon_sel is needed from both process and interrupt contexts,
>> +	 * but is complicated by firmware-backed platforms that can't make any
>> +	 * access unless they can sleep.
>> +	 * Always use the mpam_mon_sel_lock() helpers.
>> +	 * Accessed to mon_sel need to be able to fail if they occur in the wrong
>> +	 * context.
>>  	 * If needed, take msc->probe_lock first.
>>  	 */
>> -	struct mutex		outer_mon_sel_lock;
>> -	raw_spinlock_t		inner_mon_sel_lock;
>> -	unsigned long		inner_mon_sel_flags;
>> +	raw_spinlock_t		_mon_sel_lock;
>> +	unsigned long		_mon_sel_flags;
>>  
> 
> These stale variables can be removed in the patch that introduced them,
> outer_mon_sel_lock, inner_mon_sel_lock, inner_mon_sel_flags. Jonathan
> has already pointed out the stale comment and paragraph in the commit
> message.

Yeah - I forgot to rewrite the commit message when I split this patch.
I'll pull those earlier bits into the now:later patch that splits the locking up.


Thanks,

James

