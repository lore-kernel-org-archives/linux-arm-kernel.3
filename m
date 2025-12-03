Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F786D12696
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6wQSIrVYG8DUFW3hw4YI2m2i/45ZHAJi5HEHo3c3JA=; b=ZUcrohY8gbO9WzjswWU3JcmD6X
	0SXXk/nMzL58jxdrJmAtWJCN9vqurwk/4Ca4kXrLdHtUyhb91V9PZLqrEavQfgoi/nIkJBGMKUXUr
	68kGUMXei1Rnep3eIUtKqGHsGsj5rhG4Xf/kzH7xp0cCsWc0tjGiexTPPSRYMCLY3zu5gK+oMI2dI
	c0UEjWpNCM58uCcWMkYHHC1j0R+MR4HgKhvdBCjk3bLbFJ3H2JpK2N8clWcK+rBuAvEHU7KeWELn0
	TX1mWEyhgB1i1cOOyVfKX3+PzybUmmUWPjs6JiVgiVj0u3h+IfIGyFc4mjlRsuL8cCnsVbKjSfzG9
	bm5OJUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjPM-00000006OxW-0PRv;
	Wed, 03 Dec 2025 09:44:24 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjPI-00000006OxA-3efI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:44:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F6wQSIrVYG8DUFW3hw4YI2m2i/45ZHAJi5HEHo3c3JA=;
	b=H98lE/1veYxpI618FVYecifwjYeL5I8vpqQFVqsqKvTFioTzIBrUsex7/4KylLRTn+DSObrAi
	LspXewjrtVvBx4DC6MReLUMrrD6FYsj+Xx5fnKny3SUMQGi1bhjn8RRzdxpFK5A4Gm9rHJ20BlA
	uNofcWbBgSvu211poMcavys=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dLt2y2pfJzLlXs;
	Wed,  3 Dec 2025 17:42:18 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 39A9A1A0188;
	Wed,  3 Dec 2025 17:44:10 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 3 Dec
 2025 17:44:09 +0800
Message-ID: <71d202d7-4584-4328-94cd-b2fc0b3d7b04@huawei.com>
Date: Wed, 3 Dec 2025 17:44:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
To: Beata Michalska <beata.michalska@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <sudeep.holla@arm.com>,
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, <ionela.voinescu@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<vincent.guittot@linaro.org>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>, <linhongye@h-partners.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <aS2z0EURwHbbGZab@arm.com> <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
 <aS8GZOuaS1-j14MD@arm.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <aS8GZOuaS1-j14MD@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_014421_536493_4F0E333A 
X-CRM114-Status: GOOD (  30.37  )
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

On 2025/12/2 23:31, Beata Michalska wrote:
> On Tue, Dec 02, 2025 at 11:05:25AM +0800, zhenglifeng (A) wrote:
>> On 2025/12/1 23:27, Beata Michalska wrote:
>>> Hi,
>>>
>>> Apologies for the delay in reviewing this - currently in progress....
>>> Out of curiosity: what's the cpufreq driver used for testing this series ?
>>
>> I used cppc_cpufreq for testing this. But with some modifications in
>> processor_driver.c, or you'll find that the driver will fail to load with
>> maxcpus set. The modification below is only a temporary solution. I'm still
>> working on that.
>>
> Right, so overall the implementation looks good - thanks for that.
> There are two issues though with the cppc cpufreq driver.
> 
> One: as you have already noticed - it fails to register when
> cpumask_present != cpumask_online.
> 
> Second: it will mix the sources of the freq scale if not all CPUs within the
> policy have AMUs enabled/valid. This is due to the fact that at the time of
> registering the driver and initializing the FIE support policy->cpus ==
> policy->related_cpus. Assuming scenario when there are two CPUs within the
> policy, one being offline and missing valid AMU counters,
> the topology_set_scale_freq_source from cppc cpufreq driver will register
> the tick handler for both CPUs, whereas AMU support will (rightly so) register
> only for the firs one. When the second CPU comes online, the mismatch will be
> detected and the arch callback will get cleared for the first CPU, but the
> second one will remain unchanged.

Thanks for pointing them out. I'll try to fix these issues after this series.

> 
> That said, I do not think any of those issues is a blocker for this series.
> But both would need fixing.
> 
> ---
> BR
> Beata
> 
> 
>> ---
>> diff --git a/drivers/acpi/processor_driver.c b/drivers/acpi/processor_driver.c
>> index 5d824435b26b..2f286a1b0b02 100644
>> --- a/drivers/acpi/processor_driver.c
>> +++ b/drivers/acpi/processor_driver.c
>> @@ -33,6 +33,7 @@ MODULE_AUTHOR("Paul Diefenbaugh");
>>  MODULE_DESCRIPTION("ACPI Processor Driver");
>>  MODULE_LICENSE("GPL");
>>  
>> +static int acpi_processor_start(struct device *dev);
>>  static int acpi_processor_stop(struct device *dev);
>>  
>>  static const struct acpi_device_id processor_device_ids[] = {
>> @@ -46,6 +47,7 @@ static struct device_driver acpi_processor_driver = {
>>  	.name = "processor",
>>  	.bus = &cpu_subsys,
>>  	.acpi_match_table = processor_device_ids,
>> +	.probe = acpi_processor_start,
>>  	.remove = acpi_processor_stop,
>>  };
>>  
>> @@ -191,6 +193,21 @@ static int __acpi_processor_start(struct acpi_device *device)
>>  	return result;
>>  }
>>  
>> +static int acpi_processor_start(struct device *dev)
>> +{
>> +	struct acpi_device *device = ACPI_COMPANION(dev);
>> +	int ret;
>> +
>> +	if (!device)
>> +		return -ENODEV;
>> +
>> +	/* Protect against concurrent CPU hotplug operations */
>> +	cpu_hotplug_disable();
>> +	ret = __acpi_processor_start(device);
>> +	cpu_hotplug_enable();
>> +	return ret;
>> +}
>> +
>>  static int acpi_processor_stop(struct device *dev)
>>  {
>>  	struct acpi_device *device = ACPI_COMPANION(dev);
>> @@ -264,9 +281,9 @@ static int __init acpi_processor_driver_init(void)
>>  
>>  	acpi_processor_register_idle_driver();
>>  
>> -	result = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> -				   "acpi/cpu-drv:online",
>> -				   acpi_soft_cpu_online, NULL);
>> +	result = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>> +					   "acpi/cpu-drv:online",
>> +					   acpi_soft_cpu_online, NULL);
>>  	if (result < 0)
>>  		goto err;
>>  	hp_online = result;
>>
>>>
>>> ---
>>> BR
>>> Beata
>>> On Wed, Nov 19, 2025 at 04:13:53PM +0800, Lifeng Zheng wrote:
>>>> Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
>>>> even though they're eligible.
>>>>
>>>>
>>>
>>
> 


