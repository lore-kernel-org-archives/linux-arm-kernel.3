Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D55C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyAAmzRd4ACr//ZBtdwhdaSbEwuX2K9tOqctWHmBUDM=; b=NZ1o8j/9ElWBPKJ4tAdSicMmGQ
	t/K4EBTtxRvi2oVMFQfs/4WRfxoQl9BhFAx03a/vprN0ByaBzlwwVZaSsqQG588xhasFrfn3NodBv
	VVPFMYluqd5nuF+pHGSbfnWMML0p7t8UYb5EYEgO+zcw/dVFM1D15QAfjplNMjIftBuM0TUpMKuoY
	xMTXCxnZpd3jsiVet24e89KvzdkqWD/LArTp6Kca6XViYnxUrfiLUi8HFEo5z4Jjj3mPGezSTtpOc
	2f4XpZltoQnFjvguQT7WvF8JYKtvpAR1a61EJo547bXU8SVKuciWqJxAAJV0G/BdfA6aVc8issv9u
	oyS4Weug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSX8-0000000CjxS-37Wb;
	Thu, 03 Jul 2025 22:35:58 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXPeQ-0000000CMoQ-1iKf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 19:31:20 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563JVBcC108295;
	Thu, 3 Jul 2025 14:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751571071;
	bh=EyAAmzRd4ACr//ZBtdwhdaSbEwuX2K9tOqctWHmBUDM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hbg+t8G2c+PJbpP3mdlaPPXms6ITfVf8IMgdGLXzweIxJNLK29vYIKmNsixnYju4H
	 PNrnUDr6Uz5/ZmpbjJ4l1VwJ9UhADPIZF0oFopbr2rvG89+3tK/3hEekjiFa0X50IB
	 IfcZHU0ozK3rtBOEQhRgpcCAHSOe+gA84WDeIhwI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563JVBMD2640475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 14:31:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 14:31:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 14:31:10 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563JVAZQ1364345;
	Thu, 3 Jul 2025 14:31:10 -0500
Message-ID: <049171d7-d4ee-4499-8414-4b66b2c6e5b2@ti.com>
Date: Thu, 3 Jul 2025 14:31:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: ti_sci: Add LPM abort sequence to suspend
 path
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <d-gole@ti.com>, <vishalm@ti.com>,
        <sebin.francis@ti.com>, <msp@baylibre.com>, <khilman@baylibre.com>
References: <20250627204821.1150459-1-k-willis@ti.com>
 <20250627204821.1150459-3-k-willis@ti.com>
 <CAPDyKForKeb=uTkOXWcJea-P9c+7wQ3ZRWFYpTXk=xLoQPsQaw@mail.gmail.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <CAPDyKForKeb=uTkOXWcJea-P9c+7wQ3ZRWFYpTXk=xLoQPsQaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_123118_591906_5042BDC7 
X-CRM114-Status: GOOD (  28.17  )
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

On 7/2/25 07:06, Ulf Hansson wrote:
> On Fri, 27 Jun 2025 at 22:49, Kendall Willis <k-willis@ti.com> wrote:
>>
>> Create ->suspend_late() and ->suspend_noirq() hooks to add abort sequence
>> to any driver within the PM domain with either of those hooks. If a driver
>> fails to suspend with those hooks, add a call to the DM to abort entering
>> the LPM. The suspend hooks of the PM domains driver inserts itself into
>> the suspend path of all devices connected to the TI SCI PM domain. So if
>> any device in the PM domain with either a ->suspend_late() or
>> ->suspend_noirq hook fails to suspend, the PM domain drivers suspend hook
>> will send the abort call to the DM.
>>
>> Adding an abort call in the ->suspend() hook is not necessary. TI SCI
>> suspend sends the message to the DM to prepare to enter a low power mode.
>> TI SCI suspend ALWAYS occurs after the ->suspend() hook for all TI SCI
>> devices has been called.
>>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>   drivers/pmdomain/ti/ti_sci_pm_domains.c | 46 ++++++++++++++++++++++++-
>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
>> index 82df7e44250bb..975defc16271d 100644
>> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
>> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * TI SCI Generic Power Domain Driver
>>    *
>> - * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com/
>> + * Copyright (C) 2015-2025 Texas Instruments Incorporated - http://www.ti.com/
>>    *     J Keerthy <j-keerthy@ti.com>
>>    *     Dave Gerlach <d-gerlach@ti.com>
>>    */
>> @@ -149,8 +149,47 @@ static int ti_sci_pd_suspend(struct device *dev)
>>
>>          return 0;
>>   }
>> +
>> +static int ti_sci_pd_suspend_late(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
>> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
>> +       int ret;
>> +
>> +       ret = pm_generic_suspend_late(dev);
>> +       if (ret) {
>> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
>> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
>> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int ti_sci_pd_suspend_noirq(struct device *dev)
>> +{
>> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
>> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
>> +       int ret;
>> +
>> +       ret = pm_generic_suspend_noirq(dev);
>> +       if (ret) {
>> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
>> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
>> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   #else
>>   #define ti_sci_pd_suspend              NULL
>> +#define ti_sci_pd_suspend_late         NULL
>> +#define ti_sci_pd_suspend_noirq                NULL
>>   #endif
>>
>>   /*
>> @@ -264,6 +303,11 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>>                                      pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
>>                                          pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
>>
>> +                               if (pd_provider->ti_sci->ops.pm_ops.lpm_abort) {
>> +                                       pd->pd.domain.ops.suspend_late = ti_sci_pd_suspend_late;
>> +                                       pd->pd.domain.ops.suspend_noirq = ti_sci_pd_suspend_noirq;
> 
> This doesn't work as pm_genpd_init() is assigning the
> ->suspend_noirq() callback, hence overriding the callback.
> 
> Moreover I am not sure this is the correct thing to do, as having your
> own ->suspend_noirq() callback would mean that you will be by-passing
> genpd's internal reference counting to understand when it's fine to
> power-off the PM domain, vi a the ->power_off() callback.
> 
> Can the LPM abort be handled from a ->complete() callback instead?

Handling the abort from a ->complete() callback does look like a much 
better solution than adding the ->suspend_late() and ->suspend_noirq() 
callbacks. The only problem with it is that there doesn't seem to be a 
way to tell if system suspend failed in order to call the abort sequence.

However, the abort sequence just clears the LPM selection in the DM 
which the DM already does upon successful suspend/resume. Clearing it 
multiple times shouldn't be an issue, but I will have to look into this 
more.

Thanks,
Kendall

> 
>> +                               }
>> +
>>                                  pm_genpd_init(&pd->pd, NULL, true);
>>
>>                                  list_add(&pd->node, &pd_provider->pd_list);
>> --
>> 2.34.1
>>
> 
> Kind regards
> Uffe


