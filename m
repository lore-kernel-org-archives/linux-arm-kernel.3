Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33A7CF3185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfndK+hCfMsdWh7JHa38ulm58SLTP8RHDiOwm+GFEUk=; b=OJvA5TsScwi2IC/oVEM2AX7USZ
	xfCk4chPG3fgMR02Kckr+yrXHFCZKVL0/rgrZdHGdjEyywY56SbfNW3/cO1lMu5FsJ75bR1yWAunG
	ux4oT0M0MxQD2mbq//GZISmLQ6eijet9DL/riMFQcA/h9Ma87Sr7XW6cYOqY6MzvjOSdsGXn8TcUh
	5LxvsiQ36G0a0T46AXKBVmB02LMyymM7EXpIDWcjE6eFkx2JmmT4rQTWDN5OQ7Pp075JPaKvOJY5f
	y3yl7691EkbaMlx/uCkbB5xZ0C7WZdg1fa8Wi/5liuRHYzmPhrNolFYKz42gK3lFNIRRQLrWs72GB
	OqZfAU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfAx-00000002wZS-2ImP;
	Wed, 19 Nov 2025 10:12:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfAu-00000002wYq-47bg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:12:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F5EFEC;
	Wed, 19 Nov 2025 02:12:24 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AF733F740;
	Wed, 19 Nov 2025 02:12:27 -0800 (PST)
Message-ID: <d13bb673-a033-4020-a984-19b4ab560be9@arm.com>
Date: Wed, 19 Nov 2025 10:12:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/34] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-16-ben.horgan@arm.com>
 <bb238bdc-1870-4888-874e-b3fa466d264b@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <bb238bdc-1870-4888-874e-b3fa466d264b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_021233_149974_FE89B5CE 
X-CRM114-Status: GOOD (  22.35  )
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

Hi Fenghua,

On 11/19/25 04:13, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 11/17/25 08:59, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The MSC MON_SEL register needs to be accessed from hardirq for the
>> overflow
>> interrupt, and when taking an IPI to access these registers on platforms
>> where MSC are not accessible from every CPU. This makes an irqsave
>> spinlock the obvious lock to protect these registers. On systems with
>> SCMI
>> or PCC mailboxes it must be able to sleep, meaning a mutex must be used.
>> The SCMI or PCC platforms can't support an overflow interrupt, and
>> can't access the registers from hardirq context.
>>
>> Clearly these two can't exist for one MSC at the same time.
>>
>> Add helpers for the MON_SEL locking. For now, use a irqsave spinlock and
>> only support 'real' MMIO platforms.
>>
>> In the future this lock will be split in two allowing SCMI/PCC platforms
>> to take a mutex. Because there are contexts where the SCMI/PCC platforms
>> can't make an access, mpam_mon_sel_lock() needs to be able to fail. Do
>> this now, so that all the error handling on these paths is present. This
>> allows the relevant paths to fail if they are needed on a platform where
>> this isn't possible, instead of having to make explicit checks of the
>> interface type.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Tested-by: Carl Worth <carl@os.amperecomputing.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com
> 
> [SNIP]
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/
>> mpam_internal.h
>> index 768a58a3ab27..b62ee55e1ed5 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
> 
> [SNIP]
> 
>> +/* Returning false here means accesses to mon_sel must fail and
>> report an error. */
>> +static inline bool __must_check mpam_mon_sel_lock(struct mpam_msc *msc)
>> +{
>> +    WARN_ON_ONCE(msc->iface != MPAM_IFACE_MMIO);
>> +
>> +    raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
>> +    return true;
>> +}
> 
> This helper always returns true, never false. And this may cause issue
> later.
> 
> On the bottom line, this causes confusion in the comment and when later
> its return value is always checked by callers.
> 
> It's better to improve this helper?
> 
> Option 1: warn and return false when ris->iface is not MMIO. No changes
> in other patches which call the helper. Seems this is a better fix.

Ok. The return value checking is intentional so that the locking for the
firmware backed interface can be easily re-instated to the driver later.
I'll return false when ris->iface is not MMIO but we won't get there as
the probe will have already failed.

> Option 2: warn on non MMIO iface but no return value. Other patches need
> to be changed when calling the helper.
> 
> Thanks.
> 
> -Fenghua

-- 
Thanks,

Ben


