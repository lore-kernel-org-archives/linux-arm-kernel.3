Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58458CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKlDqiJGzQbvaFYOnUUCWnIX/DZavJpQBiZ6Ek0uKn4=; b=V6uXEAUIQry9oEuVv8ba6kEMci
	6qqjq5zmxo6HYawemFfG9W77a7tqaKV6JQ5RHQz+TKyiF83gwJJpQrmnV9+E7UpkQ03Bxm04EeJsi
	JRNzCUzX2mqFqWjpHoM75akB3i1sxGsTGRe5C5HjAjTe3UdcjGKkJVvedNK2Mv37wRukjWkVBhByj
	Zg9eW/6/ZlE6urBu9T3jTFEWdRlGTp3VoBr+fGiYx41ak8/HcZqQ8+XUSN9Dmpq4kyzOlb1wWh1fr
	dvCcF+NcbkUyXsK7GcZSPmDqzJnEWO5n5eM3JZoBFixUgvb0/6QRiSc1HMfUyMzA7SrcNBAMV9ubA
	tIYCQtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9aH-0000000EFiI-2Tzy;
	Wed, 27 Aug 2025 06:24:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9XZ-0000000EFJt-34wo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 06:21:51 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cBZDW4XS3z14Mbr;
	Wed, 27 Aug 2025 14:21:31 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E6A918049C;
	Wed, 27 Aug 2025 14:21:38 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 14:21:38 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 14:21:37 +0800
Message-ID: <9465540b-44da-4f53-a8e9-97a648a0c023@huawei.com>
Date: Wed, 27 Aug 2025 14:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drivers/perf: hisi: Add support for L3C PMU v3
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <yangyicong@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
 <20250821135049.2010220-8-wangyushan12@huawei.com>
 <20250826141235.000028b8@huawei.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <20250826141235.000028b8@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_232150_099031_E76BF052 
X-CRM114-Status: GOOD (  22.06  )
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



On 8/26/2025 9:12 PM, Jonathan Cameron wrote:
> On Thu, 21 Aug 2025 21:50:47 +0800
> Yushan Wang <wangyushan12@huawei.com> wrote:
>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> This patch adds support for L3C PMU v3. The v3 L3C PMU supports
>> an extended events space which can be controlled in up to 2 extra
>> address spaces with separate overflow interrupts. The layout
>> of the control/event registers are kept the same. The extended events
>> with original ones together cover the monitoring job of all transactions
>> on L3C.
>>
>> The extended events is specified with `ext=[1|2]` option for the
>> driver to distinguish, like below:
>>
>> perf stat -e hisi_sccl0_l3c0_0/event=<event_id>,ext=1/
>>
>> Currently only event option using config bit [7, 0]. There's
>> still plenty unused space. Make ext using config [16, 17] and
>> reserve bit [15, 8] for event option for future extension.
>>
>> With the capability of extra counters, number of counters for HiSilicon
>> uncore PMU could reach up to 24, the usedmap is extended accordingly.
>>
>> The hw_perf_event::event_base is initialized to the base MMIO
>> address of the event and will be used for later control,
>> overflow handling and counts readout.
>>
>> We still make use of the Uncore PMU framework for handling the
>> events and interrupt migration on CPU hotplug. The framework's
>> cpuhp callback will handle the event migration and interrupt
>> migration of orginial event, if PMU supports extended events
>> then the interrupt of extended events is migrated to the same
>> CPU choosed by the framework.
>>
>> A new HID of HISI0215 is used for this version of L3C PMU.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> One minor formatting thing I missed in internal reviews. With that
> tidied up (check other patches for this as well)
>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>>   
>>   static void hisi_l3c_pmu_stop_counters(struct hisi_pmu *l3c_pmu)
>>   {
>> +	struct hisi_l3c_pmu *hisi_l3c_pmu = to_hisi_l3c_pmu(l3c_pmu);
>> +	unsigned long *used_mask = l3c_pmu->pmu_events.used_mask;
>> +	unsigned long bit = find_first_bit(used_mask, l3c_pmu->num_counters);
>>   	u32 val;
>> +	int i;
>>   
>>   	/*
>> -	 * Clear perf_enable bit in L3C_PERF_CTRL register to stop counting
>> -	 * for all enabled counters.
>> +	 * Check if any counter belongs to the normal range (instead of ext
>> +	 * range). If so, stop it.
>>   	 */
>> -	val = readl(l3c_pmu->base + L3C_PERF_CTRL);
>> -	val &= ~(L3C_PERF_CTRL_EN);
>> -	writel(val, l3c_pmu->base + L3C_PERF_CTRL);
>> +	if (bit < L3C_NR_COUNTERS) {
>> +		val = readl(l3c_pmu->base + L3C_PERF_CTRL);
>> +		val &= ~(L3C_PERF_CTRL_EN);
> Brackets not adding anything here and inconsistently applied.
> Please clean these up.

Sure, sorry for the noises.

Will fix that and look for other similar issues in the patches.

Thanks!

>> +		writel(val, l3c_pmu->base + L3C_PERF_CTRL);
>> +	}
>> +
>> +	/* If not, do stop it on ext ranges. */
>> +	for (i = 0; i < hisi_l3c_pmu->ext_num; i++) {
>> +		bit = find_next_bit(used_mask, L3C_NR_COUNTERS * (i + 2),
>> +				    L3C_NR_COUNTERS * (i + 1));
>> +		if (L3C_CNTR_EXT(bit) != i + 1)
>> +			continue;
>> +
>> +		val = readl(hisi_l3c_pmu->ext_base[i] + L3C_PERF_CTRL);
>> +		val &= ~L3C_PERF_CTRL_EN;
>> +		writel(val, hisi_l3c_pmu->ext_base[i] + L3C_PERF_CTRL);
>> +	}
>>   }


