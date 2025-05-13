Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A3FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sViLI8RntaOLa10WapKCx2LzcmOjxe4Dc6R9zXvCEU=; b=U9PUfIUXgSvg2+mclS395wqFc2
	PDC7rB4/XRq5ZcsM31H0anjrd45k0X3Sg0Cy4GfJ0QR2u40MXXsmoYzm2cK/kKOlejGVnkedoKGdk
	81fsj6W2Jd8eZcX8ezCId+qW8GaW1webULCwPunVUla2HKXC+PV1RlS+6DnnBN7Ws1aAyU9aspdgw
	dZpZ2Dq3/+3ocyqmsFxvv9YpGbgUAirzhmHdfsr5P0i5d6Van3XPHA++vsv7y4biOyBIbxsQlcvSp
	cyedY4QhD4yhcJn8FYVhZ9YiH+EhspJMv2kuYv0pfF8GFQBdvm3Ia0xvy7zYrM5SUPiCy863cZp4M
	FSbPxjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjgd-0000000Ba3t-21PK;
	Tue, 13 May 2025 07:04:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjed-0000000BZpo-10Tu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 07:02:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZxS6n1Qcnz13LcD;
	Tue, 13 May 2025 15:00:49 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id EB1101402EB;
	Tue, 13 May 2025 15:02:13 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 15:02:13 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 15:02:12 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2 1/2] watchdog/perf: Provide function for adjusting the
 event period
To: Andrew Morton <akpm@linux-foundation.org>
References: <20250512130919.23915-1-yangyicong@huawei.com>
 <20250512130919.23915-2-yangyicong@huawei.com>
 <20250512160747.7c70fac79f4ecd929bf6b255@linux-foundation.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e4b0395f-5bbf-3661-f3c9-fbd3bca3e700@huawei.com>
Date: Tue, 13 May 2025 15:02:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250512160747.7c70fac79f4ecd929bf6b255@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_000219_575890_AAD77A39 
X-CRM114-Status: GOOD (  17.86  )
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

On 2025/5/13 7:07, Andrew Morton wrote:
> On Mon, 12 May 2025 21:09:18 +0800 Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Architecture's using perf events for hard lockup detection needs to
>> convert the watchdog_thresh to the event's period, some architecture
>> for example arm64 perform this conversion using the CPU's maximum
>> frequency which will be acquired by cpufreq. However by the time
>> the lockup detector's initialized the cpufreq driver may not be
>> initialized, thus launch a watchdog with inaccurate period. Provide
>> a function hardlockup_detector_perf_adjust_period() to allowing
>> adjust the event period. Then architecture can update with more
>> accurate period if cpufreq is initialized.
>>
>> ...
>>  
>> +/**
>> + * hardlockup_detector_perf_adjust_period - Adjust the event period due
>> + *                                          to cpu frequency change
>> + * @cpu: The CPU whose event period will be adjusted
>> + * @period: The target period to be set
>> + */
>> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)
>> +{
>> +	struct perf_event *event = per_cpu(watchdog_ev, cpu);
>> +
>> +	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
>> +		return;
> 
> Is this the right thing to do?  Would it be better to proceed with the
> alteration of the period so that the state is correct if
> WATCHDOG_HARDLOCKUP_ENABLED is later enabled?  (If that's possible).
> 

This is just a check to see whether we need to proceed. WATCHDOG_HARDLOCKUP_ENABLED
will be set if:
1. hardlockup is supported
2. user doesn't disable it by cmdline/sysctl

If WATCHDOG_HARDLOCKUP_ENABLED is not set the hardlockup detector won't be initialized
as well (in watchdog_enable()), then we don't need to adjust the period as well.

> 
>> +	if (!event)
>> +		return;
>> +
>> +	if (event->attr.sample_period == period)
>> +		return;
>> +
>> +	if (perf_event_period(event, period))
>> +		pr_err("failed to change period to %llu\n", period);
>> +}
>> +
>>  /**
>>   * hardlockup_detector_perf_stop - Globally stop watchdog events
>>   *
>> -- 
>> 2.24.0
> 
> .
> 

