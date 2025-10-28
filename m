Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7159CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1PdDvG/KeJpqKGd1tfgCijlINZezjk7eE6swMkFShY=; b=zBYNcodWFUZ4zjYzEZmLVT7GVU
	ob5yc7/j1GQcLK3NsoxX91S9Y9K6nxt3GFDx/BzkgGalbZ7cZKpiAArBgZ649H7YnDsOfRJw6xj3l
	Is3PPfRM8zfFTAI1/KOvL78xv3vrPtRgWd6UqX4YH0nObKbpTPh3aMpGRjJgY3ZuOjKtHK24KDmFK
	JRGFb4IPWV3dZ6wmEcSSvyvtPtPj5ZBtJlXNL1I584x76SrEvR2JKTx6c5Guwb3Ob798V7Bdq3g3K
	0dgFZycptotfNLKkwGCPCopH6QI9413Ndb6mSJ+mL56fB9hSAiEQN53sE5+TR665besAXIJjoaiza
	nHGXJIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn82-0000000GNCd-0c5g;
	Tue, 28 Oct 2025 17:05:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn7y-0000000GNBw-2Rik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3CDB168F;
	Tue, 28 Oct 2025 10:04:47 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5E763F673;
	Tue, 28 Oct 2025 10:04:49 -0700 (PDT)
Message-ID: <4d77f16c-eeb7-40bc-ac37-2639308f8484@arm.com>
Date: Tue, 28 Oct 2025 17:04:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mpam mpam/snapshot/v6.14-rc1] arm64/mpam: Fix MBWU monitor
 overflow handling
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com,
 quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com, wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20251017185645.26604-25-james.morse@arm.com>
 <20251022133913.629859-1-zengheng4@huawei.com>
 <8e22c81e-5e78-41e0-a81e-0f9826e5edf0@arm.com>
 <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_100458_908180_053B6A2B 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Zeng,

On 10/25/25 09:45, Zeng Heng wrote:
> Hi Ben,
> 
> On 2025/10/23 0:17, Ben Horgan wrote:
>>>
>>> Also fix the handling of overflow amount calculation. There's no need to
>>> subtract mbwu_state->prev_val when calculating overflow_val.
>>
>> Why not? Isn't this the pre-overflow part that we are missing from the
>> running count?
>>
> 
> The MSMON_MBWU register accumulates counts monotonically forward and
> would not automatically cleared to zero on overflow.
> 
> The overflow portion is exactly what mpam_msmon_overflow_val() computes,
> there is no need to additionally subtract mbwu_state->prev_val.

Yes, I now see you are correct. The 'correction' ends up holding
(counter size) * (number of overflows) and the current value of the
counter plus this gives you the bandwidth use up until now.

> 
>>>
>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>>> mpam_devices.c
>>> index 0dd048279e02..06f3ec9887d2 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1101,7 +1101,8 @@ static void __ris_msmon_read(void *arg)
>>>       clean_msmon_ctl_val(&cur_ctl);
>>>       gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>>>       config_mismatch = cur_flt != flt_val ||
>>> -              cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>>> +             (cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS) !=
>>> +             (ctl_val | MSMON_CFG_x_CTL_EN);
>>
>> This only considers 31 bit counters. I would expect any change here to
>> consider all lengths of counter. Also, as the overflow bit is no longer
>> reset due to the config mismatch it needs to be reset somewhere else.
> 
> Yes, overflow bit needs to be cleared somewhere. I try to point out in
> the next patch mail.

I had misunderstood before but the current code in the series doesn't
make use of overflow bit and just relies on prev_val > now. Using
overflow status does give us a bit more lee-way for overflowing so is a
useful enhancement.

> 
> Best Regards,
> Zeng Heng
> 
> 
Thanks,

Ben


