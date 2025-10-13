Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E37CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2RyQ0BZqfJNNorz1+3EwoqjS9NWv3BQ8KZXZnhmywM=; b=AGOD/lzmIAApI0aFbwsq8bjyMb
	C3Nw4zosow7IQ3XJGLuV/zpjfTXBsn7we/9xgb/VGxwXg36STekk1Ts0ReX+vOHvfaXX5FG2w2yCt
	u546YIGXqCscIFYkQ45HXjfOPgRtXOLwzE8NATDfoZ6fWMxvB/t6DgNDvfyMtU8gwCRRIktNDmHyG
	BLQ56QQP2ft7LmXYiFuUHkvHeXf8eVLrsPwCzF0ZR39if0uUMA/QHcSdZ+ejHMb3pdivBQbcK8D0m
	low++/hbqo69FpvY6HrnY0hTX5T3IzmmJ6aDKQuLvH6tBy7DHXEAZ1MaF78BwkNROMQGCqqxlgGkc
	ROv1lhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LQL-0000000DsPP-3FoP;
	Mon, 13 Oct 2025 16:29:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LQI-0000000DsOY-3xkQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:29:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 594C0113E;
	Mon, 13 Oct 2025 09:29:12 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25ED93F738;
	Mon, 13 Oct 2025 09:29:15 -0700 (PDT)
Message-ID: <8c75d1a5-42f8-4adf-a1b1-74aa668b1a30@arm.com>
Date: Mon, 13 Oct 2025 17:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] arm_mpam: Track bandwidth counter state for
 overflow and power management
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
 <20250910204309.20751-25-james.morse@arm.com>
 <53eddf53-a610-4420-9021-658fdf31aebe@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <53eddf53-a610-4420-9021-658fdf31aebe@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_092923_114341_235403C9 
X-CRM114-Status: GOOD (  21.81  )
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

On 12/09/2025 16:55, Ben Horgan wrote:
> On 9/10/25 21:43, James Morse wrote:
>> Bandwidth counters need to run continuously to correctly reflect the
>> bandwidth.
>>
>> The value read may be lower than the previous value read in the case
>> of overflow and when the hardware is reset due to CPU hotplug.
>>
>> Add struct mbwu_state to track the bandwidth counter to allow overflow
>> and power management to be handled.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 1543c33c5d6a..eeb62ed94520 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -990,20 +992,32 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>>  		mpam_write_monsel_reg(msc, MBWU, 0);
>>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>> +
>> +		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
>> +		if (mbwu_state)
>> +			mbwu_state->prev_val = 0;

> What's the if condition doing here?

Yes, that looks like cruft....
It took the address of an array element - how could it be null?!


> The below could make more sense but I don't think you can get here if
> the allocation fails.

Heh ... only because __allocate_component_cfg() has lost the error value.
Without the outer/inner locking stuff, its feasible for  __allocate_component_cfg() to
return the error value directly.

With that fixed, and ignoring a bogus ctx->mon value - I agree you can't get a case where
this needs checking.


I think this was originally testing if the array had been allocated, and its been folded
wrongly at some point in the past. I assume I kept those bogus tests around as I saw it
blow up with nonsense num_mbwu_mon - which is something I'll retest.


>> +
>>  		break;
>>  	default:
>>  		return;
>>  	}
>>  }

>> @@ -2106,6 +2227,35 @@ static int __allocate_component_cfg(struct mpam_component *comp)
>>  		return -ENOMEM;
>>  	init_garbage(comp->cfg);
>>  
>> +	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
>> +		if (!vmsc->props.num_mbwu_mon)
>> +			continue;
>> +
>> +		msc = vmsc->msc;
>> +		list_for_each_entry(ris, &vmsc->ris, vmsc_list) {
>> +			if (!ris->props.num_mbwu_mon)
>> +				continue;
>> +
>> +			mbwu_state = kcalloc(ris->props.num_mbwu_mon,
>> +					     sizeof(*ris->mbwu_state),
>> +					     GFP_KERNEL);
>> +			if (!mbwu_state) {
>> +				__destroy_component_cfg(comp);
>> +				err = -ENOMEM;
>> +				break;
>> +			}
>> +
>> +			if (mpam_mon_sel_lock(msc)) {
>> +				init_garbage(mbwu_state);
>> +				ris->mbwu_state = mbwu_state;
>> +				mpam_mon_sel_unlock(msc);
>> +			}
> 
> The if statement is confusing now that mpam_mon_sel_lock()
> unconditionally returns true.

Sure, but this and the __must_check means all the paths that use this must be able to
return an error.

This is a churn-or-not trade-off for the inclusion of the firmware-backed support.
I'd prefer it to be hard to add code-paths that are going to create a lot of work when
that comes - especially as folk are promising platforms that need this in the coming months.



Thanks,

James

