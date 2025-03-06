Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F23BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THTPti0GSVkJ4Cd75xheL2m4nwMeiJGZ76Ql1T7hNSg=; b=Sx1DXPrWcfmdg8VN8ztU2h8Udo
	ILi3/bbX5YzK/cD7WWBVEetht/T2u1mwgmx7aZb9XeMbM+XJ0zF3xtiKW5NwuOVMnWpcEs8uzjOLf
	P18hITbmkDwHPfr+hQA4ZSNwihGF4/Pz51+4UmZ1gReZvA9msunv6wxr0+RypckoZgVuhhIY/WdZm
	4sHy1OIGDfB+iKjDfJiUPkbk8rPD3COKEvnK2LIyQzUlV2a6XYJ21Dy39EeQ6WYiG+phhylRtoWg0
	ZECk2LHweQ/0Eiap/JLFsT4ccSpadeSKrZUDuNehBBNyojdKfE/RSA2CjcA9Ro3YOtWaE5IXNBHIw
	gyRpOVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6mP-0000000AMiT-3gUg;
	Thu, 06 Mar 2025 08:40:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6kX-0000000AMOb-3UjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:38:39 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52675g1x027727;
	Thu, 6 Mar 2025 09:38:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	THTPti0GSVkJ4Cd75xheL2m4nwMeiJGZ76Ql1T7hNSg=; b=RRnXXZamHslG4g3e
	Uj+5ddeHAS1FF0PnwSRao4wSH4kqc1blP1txTUwJjJ1OVy5EIqkdi2gabTmdPF28
	UAbwr3nRHkwDUN2laKtxlY4xfiKlVQtDdXBavK4Sn57Hs5+DwHVzQvXq24kizUp3
	rI9XT0Em724nOCx2sDMTh9kBwcS0LzZsaP1aiJc5bS6o86AVz+JFBdmWCed+ETkW
	ADpZLcqFMXsMTW7u2l+WJyZ6ek2QHy5Q8urrPmrgxU3TFNF1HO9TXUlW4dNSsLy4
	h19IrDtz40YnMlhQ/J4lMc5tZ9zS3uPi7c/Hm2+Ets5anIUPnCmc1LswiPHZ6F5S
	7ZaMHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 454cp8x3cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:38:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6EF8740049;
	Thu,  6 Mar 2025 09:37:38 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC809411871;
	Thu,  6 Mar 2025 09:37:16 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:37:16 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:37:16 +0100
Message-ID: <4081d99c-1283-45a4-9cb8-8e6f8dbd635d@foss.st.com>
Date: Thu, 6 Mar 2025 09:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: stm32-lptimer: use wakeup capable instead of
 init wakeup
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
CC: <alexandre.torgue@foss.st.com>, <olivier.moysan@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250305125146.1858978-1-fabrice.gasnier@foss.st.com>
 <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <a7489f16-ca31-4530-8ef1-33079b3c99a9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_003838_174793_D17AD428 
X-CRM114-Status: GOOD (  13.37  )
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

On 3/5/25 18:23, Daniel Lezcano wrote:
> On 05/03/2025 13:51, Fabrice Gasnier wrote:
>> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> "wakeup-source" property describes a device which has wakeup capability
>> but should not force this device as a wakeup source.
> 
> Is that a fix to be carried on ?

Hi Daniel,

Thanks for reviewing,
I just have sent a V2 with Fixes tag, and have CC'ed stable.

Please review there,
Best Regards,
Fabrice

Fixes: 48b41c5e2de6 ("clocksource: Add Low Power STM32 timers driver")
> 
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>   drivers/clocksource/timer-stm32-lp.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-stm32-lp.c
>> b/drivers/clocksource/timer-stm32-lp.c
>> index 96d975adf7a4..f08baa6720f8 100644
>> --- a/drivers/clocksource/timer-stm32-lp.c
>> +++ b/drivers/clocksource/timer-stm32-lp.c
>> @@ -186,9 +186,7 @@ static int stm32_clkevent_lp_probe(struct
>> platform_device *pdev)
>>       }
>>         if (of_property_read_bool(pdev->dev.parent->of_node,
>> "wakeup-source")) {
>> -        ret = device_init_wakeup(&pdev->dev, true);
>> -        if (ret)
>> -            goto out_clk_disable;
>> +        device_set_wakeup_capable(&pdev->dev, true);
>>             ret = dev_pm_set_wake_irq(&pdev->dev, irq);
>>           if (ret)
> 
> 

