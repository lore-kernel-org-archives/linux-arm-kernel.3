Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D4FCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mI8RJyZEWdQPWipyhU5oi8LYU908r35UXOl0PDE2pw=; b=laT8O0nVEiFgvwqp0SYFIK2bF8
	dim6Geuv2JOaY1DX4PXkG5Paqj2OVyt66KDN9FjJ1CyjB0Wa/VvPxSqQ9aUbevvoOkmqnLV3r/cLL
	JRqLHyTFcY6diT9KNnkNUkwe3SXMRr/UvLQcwGEc/Objttt7eCpigxZ7sSz2EipEAqBFH4gj3XEk5
	kymvp0eM4BVNE7xuqy/LBPHMQ1ZjYiRbV9i+xyFIAY+FyOmv6/1hFWWXxcH3tUh43FH2h72N8W/uf
	CT/DEWozjvB2BO1xHOOzs9l6XHn/sjttAlstI20dNzVGX7ixnWN/exOO4ubX2F4CJ9Rb5lf6MwvDa
	kSEoBhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwFf-0000000H0VK-2Abf;
	Wed, 29 Oct 2025 02:49:31 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwFc-0000000H0Ul-0jpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:49:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8mI8RJyZEWdQPWipyhU5oi8LYU908r35UXOl0PDE2pw=;
	b=RKXstXVvw/LZpzS0fSWou1gFKYhepNujxLVzFYfqP/hVNROwao9fAijMpqJ7aS2SgivbxlhfV
	QMGUxARIOAMjVw6Sr30RakvQ7BOQ/KPwPrHSYOQbxXZARvw/4pSVDE9j/AGg6tTvLv6MKiioztN
	wi2bSSDa1/ZveTTJQE0yqoQ=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4cxBWw6rCfzLlSH;
	Wed, 29 Oct 2025 10:48:44 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F10E180043;
	Wed, 29 Oct 2025 10:49:13 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Oct 2025 10:49:11 +0800
Message-ID: <d2aa99f8-dbdc-dc13-1ba3-0e273913221f@huawei.com>
Date: Wed, 29 Oct 2025 10:49:10 +0800
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
 <1c037f72-485a-567b-bf8f-489255330de8@huawei.com>
 <56f7f2df-fd94-48c8-aaa0-97a71b3108cf@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <56f7f2df-fd94-48c8-aaa0-97a71b3108cf@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_194928_918461_6E852A53 
X-CRM114-Status: GOOD (  14.23  )
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

On 2025/10/29 0:01, Ben Horgan wrote:
> Hi Zeng,
> 
> On 10/25/25 10:01, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2025/10/23 0:17, Ben Horgan wrote:
>>
>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>>> ---
>>>>    drivers/resctrl/mpam_devices.c | 8 +++++---
>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>>>> mpam_devices.c
>>>> index 0dd048279e02..06f3ec9887d2 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -1101,7 +1101,8 @@ static void __ris_msmon_read(void *arg)
>>>>        clean_msmon_ctl_val(&cur_ctl);
>>>>        gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>>>>        config_mismatch = cur_flt != flt_val ||
>>>> -              cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>>>> +             (cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS) !=
>>>> +             (ctl_val | MSMON_CFG_x_CTL_EN);
>>>
>>> This only considers 31 bit counters. I would expect any change here to
>>> consider all lengths of counter.
>>
>> Sorry, regardless of whether the counter is 32-bit or 64-bit, the
>> config_mismatch logic should be handled the same way here. Am I
>> wrong?
> 
> Yes, they should be handled the same way. However, the overflow status
> bit for long counters is MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L.
> 
> I now see that the existing code in the series has this covered.
> Both the overflow bits are masked out in clean_msmon_ctl_val(). No need
> for any additional masking.
> 

Yes, I’ve seen the usage, except that clearing the overflow bit in the
register is missing.


Best Regards,
Zeng Heng

