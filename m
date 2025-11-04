Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25745CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhgDFV3NXn/IRH8qXjdRXYahylPUabXUbstxozU3bK0=; b=kXmna3UWf8ya48NvZYcQ7N1oRK
	2YJ2Kc4Yke63Q6bRq44xBz1zQfgSn+dx/FfQR3f1kVMpO2d++/mQ803apDg3Kmz5640TvgBPR72L1
	uV8OWfKsHIsnhp9b+aUA4LbY7LWCi7whlCGutXXKr7H8/ijkRyRcJQriL+W7Y9JenNZdRgpP3Lyqn
	YTKqVMHuee32En5JlmwLp/J9fOQtLMzP+jqbl21XcP0A5TOMQEJF+atJ3pf8hhXWRSDk9huUyXf3W
	95ORil7JGA9MJGxHSCstMTxaHbwZLY6X96pLR7sfV/H0CK13ZDT/r3S6xtYeayrgkL9gMSbW2CAfv
	EoBt8+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHPE-0000000Bud5-1cP1;
	Tue, 04 Nov 2025 13:49:04 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHPB-0000000BuZZ-0y0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:49:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HhgDFV3NXn/IRH8qXjdRXYahylPUabXUbstxozU3bK0=;
	b=juiqD+5rV0RJy9nL5jDwbDD+vWxjSfNoRfXvQQJVf00Ih5/L/8xPUq8UXXmrrCva3dMEBL/WI
	UhKAHGa8mMhBeZeeJgMhS7d4p3ZOOKFlGtLEf0gfhexs530LjVpByzGqb2f5qePfvb0zbBY6LHU
	sD3ai+GbhT8PPehn6vERIAw=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4d18sQ1Hflz1T4G2;
	Tue,  4 Nov 2025 21:47:38 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 91792180080;
	Tue,  4 Nov 2025 21:48:50 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 21:48:48 +0800
Message-ID: <40e9934d-4d19-5cea-e21f-d287584b71f4@huawei.com>
Date: Tue, 4 Nov 2025 21:48:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] arm64/mpam: Clean MBWU monitor overflow bit
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20251017185645.26604-25-james.morse@arm.com>
 <20251029075655.3284280-1-zengheng4@huawei.com>
 <b0ea1879-9e77-4eb3-8312-ce27d73cc1f4@arm.com>
 <f4518f80-8e17-e622-fbe6-e20a7d1c85fc@huawei.com>
 <293395d7-5766-45df-a2e0-1542fecda5a7@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <293395d7-5766-45df-a2e0-1542fecda5a7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054901_946362_DC06270F 
X-CRM114-Status: GOOD (  23.56  )
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

On 2025/11/4 18:24, Ben Horgan wrote:
> Hi Zeng,
> 
> On 11/3/25 03:47, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2025/10/30 17:52, Ben Horgan wrote:
>>> Hi Zeng,
>>>
>>> On 10/29/25 07:56, Zeng Heng wrote:
>>>> The MSMON_MBWU register accumulates counts monotonically forward and
>>>> would not automatically cleared to zero on overflow. The overflow
>>>> portion
>>>> is exactly what mpam_msmon_overflow_val() computes, there is no need to
>>>> additionally subtract mbwu_state->prev_val.
>>>>
>>>> Before invoking write_msmon_ctl_flt_vals(), the overflow bit of the
>>>> MSMON_MBWU register must first be read to prevent it from being
>>>> inadvertently cleared by the write operation.
>>>>
>>>> Finally, use the overflow bit instead of relying on counter wrap-around
>>>> to determine whether an overflow has occurred, that avoids the case
>>>> where
>>>> a wrap-around (now > prev_val) is overlooked. So with this, prev_val no
>>>> longer has any use and remove it.
>>>>
>>>> CC: Ben Horgan <ben.horgan@arm.com>
>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>>> ---
>>>>    drivers/resctrl/mpam_devices.c  | 22 +++++++++++++++++-----
>>>>    drivers/resctrl/mpam_internal.h |  3 ---
>>>>    2 files changed, 17 insertions(+), 8 deletions(-)
>>>
>>> This all looks fine for overflow, but what we've been forgetting about
>>> is the power management. As James mentioned in his commit message, the
>>> prev_val is after now check is doing double duty. If an msc is powered
>>> down and reset then we lose the count. Hence, to keep an accurate count,
>>> we should be considering this case too.
>>>
>>
>>
>> Regarding CPU power management and CPU on-/off-line scenarios, this
>> should and already has been handled by mpam_save_mbwu_state():
>>
>> 1. Freezes the current MSMON_MBWU counter into the
>> mbwu_state->correction;
>> 2. Clears the MSMON_MBWU counter;
>>
>> After the CPU is powered back on, the total bandwidth traffic is
>> MSMON_MBWU(the `now` variable) + correction.
>>
>> So the above solution also covers CPU power-down scenarios, and no
>> additional code is needed to adapt to this case.
>>
>> If I've missed anything, thanks in advance to point it out.
>>
> 
> No, I don't think you missed anything. You just didn't mention in your commit message
> that this is also fixing the power management case.
> 
> I'm going to post the next version of this series for James as he is otherwise engaged.
> I've taken your patch and adapted it to fit in with the order of patches.
> Does this look ok to you? The support for the long counters will be added later.
> 

Yes, I have reviewed the patch, and the related adaptations look good to
me.

> @@ -1016,6 +1025,9 @@ static void __ris_msmon_read(void *arg)
>          if (config_mismatch) {
>                  write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
>                  overflow = false;
> +       } else if (overflow) {
> +               mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> +                                     cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS);
>          }

Yes, the clear register operation is added here.



Best Regards,
Zeng Heng


