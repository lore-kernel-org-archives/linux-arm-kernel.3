Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFC7D5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZLXW3TH4fcm9KE+FjIOZQPmKBurAbTddrIKq6UPknc=; b=iKZL6iz/1/2VGqlVXZgTqoyblW
	ltBmlr6gKtj4VwX6hj2C3Js9hlHQrWdmVd1WKaeISVMgpqs4BhY6t0Ptr6hrrO/wfYPrXeagx3Hzb
	392ebgOkqTc69Ia5+3WOmXBWF73y7SA2FekgJ40F1579umjcTKrU+Ej/bf06mGIcGwReipIqdt8Np
	vvrOh/uF9O8IkL9l8HpgNqfMVO8hxVIEiDMDVrzgF2QSiyj0x7YTjxcmIYWFfcYR9iVODw/OPH3j4
	vOQygJwO9C5InV8LnmuRYT5dUlastc+ehJLIvecoyKtheqSUUXIXl3/6ZxUr5WLtsyX1OxJLWGFsQ
	52q8aBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5n3P-0000000Ei4P-3uj8;
	Tue, 29 Oct 2024 14:18:39 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5n1k-0000000Ehgv-1XWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:16:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XdC343RtGzQsBc;
	Tue, 29 Oct 2024 22:15:44 +0800 (CST)
Received: from kwepemd200010.china.huawei.com (unknown [7.221.188.124])
	by mail.maildlp.com (Postfix) with ESMTPS id 1CCAF140157;
	Tue, 29 Oct 2024 22:16:43 +0800 (CST)
Received: from [10.174.162.134] (10.174.162.134) by
 kwepemd200010.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 29 Oct 2024 22:16:42 +0800
Subject: Re: [PATCH v4] ACPI: GTDT: Tighten the check for the array of
 platform timer structures
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: <guohanjun@huawei.com>, <sudeep.holla@arm.com>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <rafael@kernel.org>, <lenb@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20241016095458.34126-1-zhengzengkai@huawei.com>
 <Zw+O4nZisbkdvNtz@lpieralisi>
From: Zheng Zengkai <zhengzengkai@huawei.com>
Message-ID: <3bf1fe29-e135-c1ba-2774-d1e98c8b92b3@huawei.com>
Date: Tue, 29 Oct 2024 22:16:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Zw+O4nZisbkdvNtz@lpieralisi>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.162.134]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200010.china.huawei.com (7.221.188.124)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_071656_931669_895662B6 
X-CRM114-Status: GOOD (  22.44  )
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


Gentle ping.

This patch still can be applied to upstream now.

Thanks!


ÔÚ 2024/10/16 18:01, Lorenzo Pieralisi Ð´µÀ:
> On Wed, Oct 16, 2024 at 05:54:58PM +0800, Zheng Zengkai wrote:
>> As suggested by Marc and Lorenzo, first we need to check whether the
>> platform_timer entry pointer is within gtdt bounds (< gtdt_end) before
>> de-referencing what it points at to detect the length of the platform
>> timer struct and then check that the length of current platform_timer
>> struct is also valid, i.e. the length is not zero and within gtdt_end.
>> Now next_platform_timer() only checks against gtdt_end for the entry of
>> subsequent platform timer without checking the length of it and will
>> not report error if the check failed and the existing check in function
>> acpi_gtdt_init() is also not enough.
>>
>> Modify the for_each_platform_timer() iterator and use it combined with
>> a dedicated check function platform_timer_valid() to do the check
>> against table length (gtdt_end) for each element of platform timer
>> array in function acpi_gtdt_init(), making sure that both their entry
>> and length actually fit in the table.
>>
>> Suggested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Co-developed-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
>> ---
>> Changes in v4:
>> - remove the tmp pointer to make the code more concise.
>>
>> Changes in v3:
>> - based on Marc's patch and reuse the for_each_platform_timer() loop
>> Link to v3: https://lore.kernel.org/linux-arm-kernel/20241015152602.184108-1-zhengzengkai@huawei.com/
>>
>> Changes in v2:
>> - Check against gtdt_end for both entry and len of each array element
>> Link to v2: https://lore.kernel.org/linux-arm-kernel/20241012085343.6594-1-zhengzengkai@huawei.com/
>>
>> Link to v1: https://lore.kernel.org/all/20241010144703.113728-1-zhengzengkai@huawei.com/
>>
>> Link to previous related patches:
>> https://lore.kernel.org/all/20241008082429.33646-1-zhengzengkai@huawei.com/
>> https://lore.kernel.org/all/20240930030716.179992-1-zhengzengkai@huawei.com/
>> ---
>>   drivers/acpi/arm64/gtdt.c | 29 ++++++++++++++++++++---------
>>   1 file changed, 20 insertions(+), 9 deletions(-)
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>
>> diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
>> index c0e77c1c8e09..d7c4e1b9915b 100644
>> --- a/drivers/acpi/arm64/gtdt.c
>> +++ b/drivers/acpi/arm64/gtdt.c
>> @@ -36,19 +36,25 @@ struct acpi_gtdt_descriptor {
>>   
>>   static struct acpi_gtdt_descriptor acpi_gtdt_desc __initdata;
>>   
>> -static inline __init void *next_platform_timer(void *platform_timer)
>> +static __init bool platform_timer_valid(void *platform_timer)
>>   {
>>   	struct acpi_gtdt_header *gh = platform_timer;
>>   
>> -	platform_timer += gh->length;
>> -	if (platform_timer < acpi_gtdt_desc.gtdt_end)
>> -		return platform_timer;
>> +	return (platform_timer >= (void *)(acpi_gtdt_desc.gtdt + 1) &&
>> +		platform_timer < acpi_gtdt_desc.gtdt_end &&
>> +		gh->length != 0 &&
>> +		platform_timer + gh->length <= acpi_gtdt_desc.gtdt_end);
>> +}
>> +
>> +static __init void *next_platform_timer(void *platform_timer)
>> +{
>> +	struct acpi_gtdt_header *gh = platform_timer;
>>   
>> -	return NULL;
>> +	return platform_timer + gh->length;
>>   }
>>   
>>   #define for_each_platform_timer(_g)				\
>> -	for (_g = acpi_gtdt_desc.platform_timer; _g;	\
>> +	for (_g = acpi_gtdt_desc.platform_timer; platform_timer_valid(_g);\
>>   	     _g = next_platform_timer(_g))
>>   
>>   static inline bool is_timer_block(void *platform_timer)
>> @@ -157,6 +163,7 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
>>   {
>>   	void *platform_timer;
>>   	struct acpi_table_gtdt *gtdt;
>> +	int cnt = 0;
>>   
>>   	gtdt = container_of(table, struct acpi_table_gtdt, header);
>>   	acpi_gtdt_desc.gtdt = gtdt;
>> @@ -176,12 +183,16 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
>>   		return 0;
>>   	}
>>   
>> -	platform_timer = (void *)gtdt + gtdt->platform_timer_offset;
>> -	if (platform_timer < (void *)table + sizeof(struct acpi_table_gtdt)) {
>> +	acpi_gtdt_desc.platform_timer = (void *)gtdt + gtdt->platform_timer_offset;
>> +	for_each_platform_timer(platform_timer)
>> +		cnt++;
>> +
>> +	if (cnt != gtdt->platform_timer_count) {
>> +		acpi_gtdt_desc.platform_timer = NULL;
>>   		pr_err(FW_BUG "invalid timer data.\n");
>>   		return -EINVAL;
>>   	}
>> -	acpi_gtdt_desc.platform_timer = platform_timer;
>> +
>>   	if (platform_timer_count)
>>   		*platform_timer_count = gtdt->platform_timer_count;
>>   
>> -- 
>> 2.20.1
>>
> .
>

