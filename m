Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961A0C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVGcGwgGocGvDThhgjKImAp7VlPU961t7vGnbLRU7dY=; b=pwN8qYNK/7JzjCv9Y81KzA9rEu
	drtfkSredjwCPiP3sy4K522ZZgqjamK7vMNOhHUV/rFWJHHxqfm812Uk59O9H3Qe/I20AS7swXsGY
	0w5zr42lKkbLndF1HUYkF782DAeVejmKybdYp5gVvPvW63MtriLO0OE18mShBypIKEs5gWvAc8M1e
	tgP0BmWGqmv2iTzF8tzgwgr04hevH05NWO0lfGQtHo1zGb8rdu2bbe6difOo7s2HdQ4e2iIYMQUrM
	P4Rfpy8RLYhP1QbE+jNCnU9f+dM+1zkTeg3N/sY6CM1oiljmsj5MlCUrKL/Z6e23+8mdO9+Xd4di6
	E9gyQ1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWA6O-00000001e4l-1NbR;
	Mon, 30 Jun 2025 08:43:00 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWA1g-00000001dG1-0yxf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:38:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bVzwB6FHWzdbqt;
	Mon, 30 Jun 2025 16:34:02 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DBEDF14010D;
	Mon, 30 Jun 2025 16:38:02 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 16:38:02 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 16:38:01 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>,
	<akpm@linux-foundation.org>, <dianders@chromium.org>,
	<sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [RESEND PATCH v2 2/2] arm64/watchdog_hld: Add a cpufreq notifier
 for update watchdog thresh
To: Will Deacon <will@kernel.org>
References: <20250619114805.16968-1-yangyicong@huawei.com>
 <20250619114805.16968-3-yangyicong@huawei.com>
 <aF66T0dgV8IpvlF_@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5ae8dda1-d466-fe47-18da-631007d9f0e1@huawei.com>
Date: Mon, 30 Jun 2025 16:38:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aF66T0dgV8IpvlF_@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_013808_437417_FCC85E43 
X-CRM114-Status: GOOD (  13.82  )
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

On 2025/6/27 23:35, Will Deacon wrote:
> On Thu, Jun 19, 2025 at 07:48:05PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
>> to convert the watchdog_thresh to perf event period. cpufreq drivers
>> like cppc_cpufreq will be initialized lately after the initializing of
>> the hard lockup detector so just use a safe cpufreq which will be
>> inaccurency. Use a cpufreq notifier to adjust the event's period to
>> a more accurate one.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
>> index dcd25322127c..e55548cb26df 100644
>> --- a/arch/arm64/kernel/watchdog_hld.c
>> +++ b/arch/arm64/kernel/watchdog_hld.c
>> @@ -34,3 +34,61 @@ bool __init arch_perf_nmi_is_available(void)
>>  	 */
>>  	return arm_pmu_irq_is_nmi();
>>  }
>> +
>> +static int watchdog_perf_update_period(void *data)
>> +{
>> +	int cpu = raw_smp_processor_id();
> 
> Why raw?
> 

smp_processor_id() also works for me, since here's running in a per-cpu worker from
smp_call_on_cpu() so we won't violate the check in smp_processor_id() when
CONFIG_DEBUG_PREEMPT=y. I might think the raw_smp_processora_id() is okay since we're
known to run on the local cpu so the unstable raw_smp_processor_id() is fine.

thanks.

