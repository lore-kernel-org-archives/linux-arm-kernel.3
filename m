Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECB5CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 03:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRu807sQVxHjOX7nnLXur2y1rZFK118rE8MYOwZywZQ=; b=XfKRA8srHpRPLm9Vw0YzHKaII3
	eCCyuvvHkuuBWYGJ+YDIr4Eb8PMdCvtlh/Sb1otiSB6veImi+BVq2rk7Wg8ijDsgrKd78yByLleki
	vn5u+VNmuQ38vXhb/jf2mV2foaP6xvLuKDPVCcwIcan7mZ/AYuoGPwzJluqiBS+eMqb6zPq1I3Fut
	/sNltc3ssfPSKklJzjThPZKNSerJASVqJHGXtnflMbTgXVe5Bz29UDZKQKoX0bHXr8ul0T+DYppug
	+I4T5jC17fSWvvbLsKxUU/CliO6JpwbFbptbMQYLIXWagQWG0gbgPb6NuRa1nwy82GlAfthWzztcV
	hSA9GY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1d8x-00000005Rfz-2Dke;
	Thu, 25 Sep 2025 03:59:43 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1d8u-00000005Ret-2YAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 03:59:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cXKdh531Sz1R9MK;
	Thu, 25 Sep 2025 11:56:24 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id EA4EC140135;
	Thu, 25 Sep 2025 11:59:33 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 11:59:33 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 11:59:32 +0800
CC: <yangyicong@hisilicon.com>, Yushan Wang <wangyushan12@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <liuyonglong@huawei.com>, <wanghuiqiang@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@h-partners.com>,
	<linuxarm@huawei.com>, <fanghao11@huawei.com>
Subject: Re: [PATCH v3 5/9] drivers/perf: hisi: Extend the field of tt_core
To: Will Deacon <will@kernel.org>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
 <20250829101427.2557899-6-wangyushan12@huawei.com>
 <aNFMUdPJeJo9XU1e@willie-the-truck>
 <3cc3fcdf-436a-9e73-a377-ed896d07a825@huawei.com>
 <aNPTwxnlXGbazFLR@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d1731acc-81a7-df59-b6ac-650f30e0e780@huawei.com>
Date: Thu, 25 Sep 2025 11:59:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aNPTwxnlXGbazFLR@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_205940_844210_ADAF69E7 
X-CRM114-Status: GOOD (  12.45  )
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

On 2025/9/24 19:19, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 03:31:15PM +0800, Yicong Yang wrote:
>> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
>> index bbd81a43047d..a52d98f1ed34 100644
>> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
>> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
>> @@ -57,6 +57,11 @@
>>  #define L3C_V2_NR_EVENTS	0xFF
>>
>>  HISI_PMU_EVENT_ATTR_EXTRACTOR(ext, config, 17, 16);
>> +/*
>> + * Remain the config1:0-7 for backward compatibility if some existing users
>> + * hardcode the config1:0-7 directly without parsing the sysfs attribute.
>> + */
>> +HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core_deprecated, config1, 7, 0);
>>  HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_req, config1, 10, 8);
>>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
>>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
>> @@ -95,6 +100,21 @@ static bool support_ext(struct hisi_l3c_pmu *pmu)
>>  	return l3c_pmu_ext->support_ext;
>>  }
>>
>> +/*
>> + * tt_core was extended to cover all the CPUs sharing the L3 and was moved from
>> + * config1:0-7 to config2:0-*. Try it first and fallback to tt_core_deprecated
>> + * if user's still using the deprecated one.
>> + */
>> +static u32 hisi_l3c_pmu_get_tt_core(struct perf_event *event)
>> +{
>> +	u32 core = hisi_get_tt_core(event);
>> +
>> +	if (core)
>> +		return core;
>> +
>> +	return hisi_get_tt_core_deprecated(event);
>> +}
> 
> Perhaps we should be stricter about this and fail validation for events
> that specify both a non-zero tt_core and a non-zero tt_core_deprecated?
> 

added in hisi_uncore_l3c_ops->check_filter() that hisi_uncore_pmu_event_init() will
call check_filter() to ask uncore pmu to validate the filter configuration.

https://lore.kernel.org/linux-arm-kernel/20250925033123.5836-1-yangyicong@huawei.com/

thanks.

