Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F0DCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twgbklWCuWhXeBiksd9/rL57cbscsnAsUSFdmL5j+vs=; b=hniZp+43aZeN1jMITaR8iYDu9D
	WeYf86caUeLNlUc+iu4v8cPsM+VhIFnFm2Fur6sdUbT+cvntwEo6+CNenyuA14jG9pYv8F0mS4+Fk
	/yK3RRMWGoWlSPTArRfaC6V0zq8KHHl0NUy0Fqkl4tRUVPS+r7h6ux0m5EUiFVd9+gzzG63Im6ZQ+
	lG9Hs5sKg6zQ/XH/kk34tQvv/fdZjfjtjJ6MV8YBanxnfy/gS7wUUPqNB2FF38XzO4r3T8g9oS/w1
	uNYc0mPxt4AGXXExK6FSOSZBK+ArRmDCA1EtwAAaow6JxmjN7hJI44anJaDToXW8ZWy8Ajp1pVJ/6
	oxgHNIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzubk-00000005Alz-3Pob;
	Sat, 20 Sep 2025 10:14:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzubh-00000005AlF-3vya
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 10:14:19 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cTQ8V4DL3zTh16;
	Sat, 20 Sep 2025 18:09:30 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AEE5180486;
	Sat, 20 Sep 2025 18:14:08 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 20 Sep 2025 18:14:06 +0800
Message-ID: <ed882938-41da-d7c5-8eb0-968f8d7de131@huawei.com>
Date: Sat, 20 Sep 2025 18:14:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm_mpam: Try reading again if MPAM instance returns not
 ready
To: James Morse <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <guohanjun@huawei.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
References: <20250910204309.20751-7-james.morse@arm.com>
 <20250916131717.2980875-1-zengheng4@huawei.com>
 <e403809c-195f-48ca-a8f1-9eb785f229e9@arm.com>
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <e403809c-195f-48ca-a8f1-9eb785f229e9@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_031418_287905_E594F80C 
X-CRM114-Status: GOOD (  23.74  )
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



On 2025/9/20 0:11, James Morse wrote:
> Hi Zeng,
> 
> On 16/09/2025 14:17, Zeng Heng wrote:
>> After updating the monitor configuration, the first read of the monitoring
>> result requires waiting for the "not ready" duration before an effective
>> value can be obtained.
> 
> May need to wait - some platforms need to do this, some don't.
> Yours is the first I've heard of that does this!
> 

I'm afraid similar platforms do exist. As long as one component has more
than one MSC, after first updating the component’s monitor every MSC
instance needs to wait for MAX_NRDY_USEC us before reading the monitor
result.

In fact, most platforms don’t have nearly as many performance monitors
as PARTIDs, so the monitors often have to be time-shared, which making
the problem even more pronounced.

> 
>> Because a component consists of multiple MPAM instances, after updating the
>> configuration of each instance, should wait for the "not ready" period of
>> per single instance before the valid monitoring value can be obtained, not
>> just wait for once interval per component.
> 
> I'm really trying to avoid that ... if you have ~200 MSC pretending to be one thing, you'd
> wait 200x the maximum period. On systems with CMN, the number of MSC scales with the
> number of CPUs, so 200x isn't totally crazy.
> > I think the real problem here is the driver doesn't go on to 
reconfigure MSC-2 if MSC-1
> returned not-ready, meaning the "I'll only wait once" logic kicks in and returns not-ready
> to the user. (which is presumably what you're seeing?)

Yes, exactly.

> 
> Does this solve your problem?:
> -----------------%<-----------------
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 404bd4c1fd5e..2f39d0339349 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1395,7 +1395,7 @@ static void __ris_msmon_read(void *arg)
> 
>   static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>   {
> -       int err, idx;
> +       int err, any_err = 0, idx;
>          struct mpam_msc *msc;
>          struct mpam_vmsc *vmsc;
>          struct mpam_msc_ris *ris;
> @@ -1412,15 +1412,19 @@ static int _msmon_read(struct mpam_component *comp, stru
> ct mon_read *arg)
>                                                      true);
>                          if (!err && arg->err)
>                                  err = arg->err;
> +
> +                       /*
> +                        * Save one error to be returned to the caller, but
> +                        * keep reading counters so that the get reprogrammed.
> +                        * On platforms with NRDY this lets us wait once.
> +                        */
>                          if (err)
> -                               break;
> +                               any_err = err;
>                  }
> -               if (err)
> -                       break;
>          }
>          srcu_read_unlock(&mpam_srcu, idx);
> 
> -       return err;
> +       return any_err;
>   }
> 
>   int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
> -----------------%<-----------------
> 

I agree with this modification: Reconfigure all MSCs first, then if any
of them returns EBUSY, wait just once for MAX_NRDY_USEC and re-read
monitor result, this guarantees that the monitor result is valid.



Thanks,
Zeng Heng




