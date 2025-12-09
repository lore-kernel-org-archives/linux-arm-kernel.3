Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C236D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIMDpab70rssZ4mppB9Ib0RUPJVxrqGk5iJ7Qkvchdc=; b=KjPDdRi7z+3mygaou4iNo3vSMi
	UHKhr+sDm0YfAJe2Zy5XmMkS/Bj9OlE6VdL8H0Cj9uCPyc1E++WRZ9Bo6V+RZUJl6yCugVkqhJSfV
	B4Mk8TUhDMC3JnlXyAIgIlniBOK9fLj4+9oDNJxXWsWTyuowQBdcroxaMQYYbPyjQ3A861r77bjmO
	e4ytqX4cJFK7bwXCFfFCHYfR8Rxuy+2su4B6Wg84x/9dERGBwsWwC7PgSnZEiXkGPoqE9dxuBAPqg
	fyJDs8sUQxzscmiXDh30YK0wdQHpz7FSuKu2Qd0qBgGaHK6BhBlcX8G91IVfxqo4//ud375uP5QU2
	j5rreW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxhQ-0000000EJbq-3eHd;
	Tue, 09 Dec 2025 13:24:16 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxhN-0000000EJb4-3ITc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:24:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dQfcw70tnzcb1N;
	Tue,  9 Dec 2025 21:21:20 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 182F41401F0;
	Tue,  9 Dec 2025 21:24:00 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 9 Dec
 2025 21:23:59 +0800
Message-ID: <347f2003-1efd-44be-89e3-080ab169599e@hisilicon.com>
Date: Tue, 9 Dec 2025 21:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] cpufreq: CPPC: Update FIE arch_freq_scale in ticks
 for non-PCC regs
To: Pierre Gondois <pierre.gondois@arm.com>, <viresh.kumar@linaro.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<yubowen8@huawei.com>, <lihuisong@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
 <20251203032422.3232957-4-zhanjie9@hisilicon.com>
 <270216de-e7d1-4552-a04f-8b0fd7b79552@arm.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <270216de-e7d1-4552-a04f-8b0fd7b79552@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_052414_039546_7C2EF1DB 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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



Hi Pierre,

On 12/8/2025 6:08 PM, Pierre Gondois wrote:
> Hello Jie Zhan,
> 
> 
> On 12/3/25 04:24, Jie Zhan wrote:
...
>> @@ -236,10 +265,8 @@ static void __init cppc_freq_invariance_init(void)
>>     static void cppc_freq_invariance_exit(void)
>>   {
>> -    if (fie_disabled)
>> -        return;
>> -
>> -    kthread_destroy_worker(kworker_fie);
>> +    if (kworker_fie)
>> +        kthread_destroy_worker(kworker_fie);
> 
> Shouldn't we have:
>   kworker_fie = NULL;
> here aswell ?
> 
I don't think it's needed.
This is where we unload the cppc_cpufreq module.  'kworker_fie' will no
longer be used after this, and it will be initialized to NULL again when
reloading the module.

I can't think of any other buggy scenarios.
>>   }
>>     #else
> 
> 
> Otherwise, for the 3 patches:
> 
> Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
> 
Thanks!
Jie

