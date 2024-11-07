Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD6DD43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7+yPYeLID1DbEMFP9nT9XfRSnJ6csySVpPugTxcMgQ=; b=g1sx1stn8WwK4EXFag7wB/4skl
	RsxtC9sXIXRe/hda/bSYAgBY4FgoPhYxUpiNQDJQOGQvF+bJyOlx6zjyjPkETjuPN/akvbEIyluMS
	7Nkm7iHy9PE/HCjr3bCrwQwgxLLIjAi9R3S8E0NkmJfTboRayFuZwxG/e3Pme2TZD2xIYBazj3pP5
	bazCrc3NEjbLX8s65IqkrviCu7BeIS3jPAkzGYajV6LDc5tRdRmgUOtB4dgMcoPRyiv0MGG6ICUTX
	LPcjaOd3GqVcXiYejj3ORaKTqdvkgZaH9D97pPZMifjbCQgCaa7sZnnuNtf78agXayTZc/+3NRB1O
	A4Q1XthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Vs-00000006fSt-0NYk;
	Thu, 07 Nov 2024 11:17:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Td-00000006ecG-016i;
	Thu, 07 Nov 2024 11:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x7+yPYeLID1DbEMFP9nT9XfRSnJ6csySVpPugTxcMgQ=; b=al0xVa8c/ZfGha7dymiAeo7ULL
	mZ557N3+NN5cHwKLG0t2XZ3x4dC/+60wGCbthKVXj/C1ovntgfEYMlgJbs8h4glLa3GvVFlkNERfV
	mP01UzMQd5Lp+rQjQCEc4U+Mndh11FRjD99nvOVKn33sFx3DfEtOScavklckJyjgLgZBFHqX9SA8L
	UZz8AxLdpE7Awyw4YRFJ1wq4WcdoW7fdi/j9nTbJdAU+IIt+4FJP6HdZnoTO9orYfTDL/6ZOUQVYf
	lruDUOEWgmIQQrwk9DY8SiA8EzUwFBFHd7AMj+lc4Bdckwcj5o3ZqaQoO1PPsooekbJFXpX3j3K6T
	L/eOTIGA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90TZ-0000000C7Ha-1lYp;
	Thu, 07 Nov 2024 11:14:59 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XkfZW6h0nz20snH;
	Thu,  7 Nov 2024 19:13:23 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id EF6A3140136;
	Thu,  7 Nov 2024 19:14:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 19:14:31 +0800
Message-ID: <8364b0cd-5171-7e76-d450-6593395dce61@huawei.com>
Date: Thu, 7 Nov 2024 19:14:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] PM: EM: Fix wrong return value in
 mtk_cpufreq_get_cpu_power()
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>, <viresh.kumar@linaro.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<hector.yuan@mediatek.com>, <lukasz.luba@arm.com>, <qperret@google.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20241104113615.1397410-1-ruanjinjie@huawei.com>
 <786c90d1-29e7-72a7-acc6-394b3bbaeb75@huawei.com>
 <CAJZ5v0jC9_03euACrmahnDRBgU=0O60p0rkChR2BVOxx0J2Pzw@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAJZ5v0jC9_03euACrmahnDRBgU=0O60p0rkChR2BVOxx0J2Pzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_111458_182093_1C0AA422 
X-CRM114-Status: GOOD (  12.57  )
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



On 2024/11/7 18:58, Rafael J. Wysocki wrote:
> On Thu, Nov 7, 2024 at 2:50 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>>
>>
>> On 2024/11/4 19:36, Jinjie Ruan wrote:
>>> mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
>>> em_create_perf_table(), the later zero check for power is not invalid
>>> as power is uninitialized. As Lukasz suggested, it must return -EINVAL when
>>> the 'policy' is not found. So return -EINVAL to fix it.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
>>> Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> Hi, could this be merged.
> 
> It's for Viresh to take care of and please replace the "PM: EM:"
> prefix in the subject with the proper cpufreq driver one.

Thank you for your kind reminder.

> 
> Thanks!
> 
>>> ---
>>> v2:
>>> - Fix the driver instead of em_create_perf_table() as suggested.
>>> - Update the commit message.
>>> - Add Suggested-by.
>>> ---
>>>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
>>> index 8925e096d5b9..aeb5e6304542 100644
>>> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
>>> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
>>> @@ -62,7 +62,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
>>>
>>>       policy = cpufreq_cpu_get_raw(cpu_dev->id);
>>>       if (!policy)
>>> -             return 0;
>>> +             return -EINVAL;
>>>
>>>       data = policy->driver_data;
>>>

