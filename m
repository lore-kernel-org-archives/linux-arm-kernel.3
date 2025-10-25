Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698EACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXyAFA5Wbi47ZBAxqv5Bu/yKif771bwawPjOvd+jr7w=; b=arqBdq+vMvVknd3BVS6/vfsbVl
	SqNiC4whA5IbkowZ6UclzVcx9tJpB4sSnceSMgr/5305/ScI9oqMWixgPedmd96bwbWpcy2aTlv1i
	UFYiCMGkP93cToblOHiBB/xpFUFaN8CLvdgjGNdJl2zIswKb2Gjg6R+csSmhiKSgmKM6M5C340wev
	iXLv7+g8kJ/1JczzS+y/a5TXb4Qbugtb+0ipJ8aOnIbNKMGVjBWMYNtrj++8I6agKbirC5WYs93Ej
	ZpDXW6UCqKKdHkM7aXusXGfZEOfjInJLBVLj2DMkj5+ogjxJSaicHkHkduh0gRauRkXcbW1FiYCDQ
	cein9yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZuO-0000000B8KW-3VPL;
	Sat, 25 Oct 2025 08:45:56 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZuL-0000000B8IL-2HRg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 08:45:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WXyAFA5Wbi47ZBAxqv5Bu/yKif771bwawPjOvd+jr7w=;
	b=lNsJIeyYZiwTBahxj1BEFLlccwGR1V9DsvyWON/GCcWZ0vZkcYf9mxKmA25qQgxCoo8FWZHr9
	TdUvkijvAfvZLy3SxFzpspBtHZMaEq3uxfIdWVSVZ6fShrIwswyZQXJ54yughkIXwSfMwxIbi4p
	C+HOhZTTeGQO9FtdhQasgZ4=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cttcm03srz12LFQ;
	Sat, 25 Oct 2025 16:44:56 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 78B6B180B71;
	Sat, 25 Oct 2025 16:45:35 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Oct 2025 16:45:33 +0800
Message-ID: <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
Date: Sat, 25 Oct 2025 16:45:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH mpam mpam/snapshot/v6.14-rc1] arm64/mpam: Fix MBWU monitor
 overflow handling
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
	<guohanjun@huawei.com>, <jeremy.linton@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20251017185645.26604-25-james.morse@arm.com>
 <20251022133913.629859-1-zengheng4@huawei.com>
 <8e22c81e-5e78-41e0-a81e-0f9826e5edf0@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <8e22c81e-5e78-41e0-a81e-0f9826e5edf0@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_014553_884197_52001D05 
X-CRM114-Status: GOOD (  11.63  )
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

On 2025/10/23 0:17, Ben Horgan wrote:
>>
>> Also fix the handling of overflow amount calculation. There's no need to
>> subtract mbwu_state->prev_val when calculating overflow_val.
> 
> Why not? Isn't this the pre-overflow part that we are missing from the
> running count?
> 

The MSMON_MBWU register accumulates counts monotonically forward and
would not automatically cleared to zero on overflow.

The overflow portion is exactly what mpam_msmon_overflow_val() computes,
there is no need to additionally subtract mbwu_state->prev_val.

>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0dd048279e02..06f3ec9887d2 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1101,7 +1101,8 @@ static void __ris_msmon_read(void *arg)
>>   	clean_msmon_ctl_val(&cur_ctl);
>>   	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>>   	config_mismatch = cur_flt != flt_val ||
>> -			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>> +			 (cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS) !=
>> +			 (ctl_val | MSMON_CFG_x_CTL_EN);
> 
> This only considers 31 bit counters. I would expect any change here to
> consider all lengths of counter. Also, as the overflow bit is no longer
> reset due to the config mismatch it needs to be reset somewhere else.

Yes, overflow bit needs to be cleared somewhere. I try to point out in
the next patch mail.

Best Regards,
Zeng Heng

