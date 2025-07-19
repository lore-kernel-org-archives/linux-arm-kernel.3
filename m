Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B0C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4wKBRcA9PhqguwrXQhkppLIguzkMgZyQtP9uk2Zx2c=; b=Z86EyVrzc7f0O374YxOkA3Kwfj
	/qIoStr5swomU/AfxmujcWaEuwRkyNKzBcagzlEt52Zes+il2pAi2wk5JUZ6QkcaJX/MvzvE7JI2L
	qusD00TMZv1WWTdIhsqSfilc00mduGpBg/dnCsDrB6QU56p7HAuW4dpvFL83nzwywHCYVwqlIBl/t
	/RxysghSukGh6DD3JANKJf1voMgXKCc0wRl9Vb9N8YLbbEBUaCU+J0t20VIWnGWfeNJ7XCIRe+a3R
	w/awcpYLHR4gJuH88MvB6AK1yUqs0KGLJ3p02VN7pDhZ02hgy+meTRgN2hQMXPc/pgQy6HJd+4Wn9
	0+83BtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5f3-0000000EBwc-0PxV;
	Sat, 19 Jul 2025 11:23:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5cY-0000000EBn5-3wNx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 11:20:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bkkgF3rS4z2FbN6;
	Sat, 19 Jul 2025 19:18:33 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 55DB31800B2;
	Sat, 19 Jul 2025 19:20:41 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:20:41 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:20:40 +0800
Subject: Re: [PATCH v2 3/3] coresight: tmc: Decouple the perf buffer
 allocation from sysfs mode
To: Leo Yan <leo.yan@arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-4-hejunhao3@huawei.com>
 <20250702170827.GB1039028@e132581.arm.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <32bbc3dc-d723-6034-ba39-bf01dfbcf81e@huawei.com>
Date: Sat, 19 Jul 2025 19:20:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20250702170827.GB1039028@e132581.arm.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_042051_362180_BD26230E 
X-CRM114-Status: GOOD (  20.16  )
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


On 2025/7/3 1:08, Leo Yan wrote:
> On Fri, Jun 20, 2025 at 03:54:12PM +0800, Junhao He wrote:
>
> [..]
>
>> @@ -1341,33 +1339,24 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
>>   	unsigned long size;
>>   
>>   	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
>> -	/*
>> -	 * Try to match the perf ring buffer size if it is larger
>> -	 * than the size requested via sysfs.
>> -	 */
>> -	if ((nr_pages << PAGE_SHIFT) > drvdata->size) {
>> -		etr_buf = tmc_alloc_etr_buf(drvdata, ((ssize_t)nr_pages << PAGE_SHIFT),
>> -					    0, node, NULL);
>> -		if (!IS_ERR(etr_buf))
>> -			goto done;
>> -	}
>> +
>> +	/* Use the minimum limit if the required size is smaller */
>> +	size = (unsigned long)nr_pages << PAGE_SHIFT;
> Please change the size's type to ssize_t, then:
>
>          size = nr_pages << PAGE_SHIFT;
>
>> +	if (size < TMC_ETR_PERF_MIN_BUF_SIZE)
>> +		size = TMC_ETR_PERF_MIN_BUF_SIZE;
> size = min_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);

Sure, I will do that.

>>   
>>   	/*
>> -	 * Else switch to configured size for this ETR
>> -	 * and scale down until we hit the minimum limit.
>> +	 * Try to allocate the required size for this ETR, if failed scale
>> +	 * down until we hit the minimum limit.
>>   	 */
>> -	size = drvdata->size;
>>   	do {
>>   		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
>>   		if (!IS_ERR(etr_buf))
>> -			goto done;
>> +			return etr_buf;
>>   		size /= 2;
>>   	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);
> Do we really need to scale down buffer size for failure cases?
> I would like a straightforward code:
>
>          etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
>          if (IS_ERR_OR_NULL(etr_buf))
>                  return etr_buf;
>
> Just a side topic, we know tmc_alloc_etr_buf() should not return NULL
> pointer. For a sanity check, the callers (alloc_etr_buf(),
> tmc_etr_get_sysfs_buffer(), etc) should valid a buffer pointer with
> IS_ERR_OR_NULL() rather than IS_ERR(). This can be a separate patch.

A new patch will be added to achieve this.

Thank you for your comments.
Junhao.

> Thanks,
> Leo
>
>>   	return ERR_PTR(-ENOMEM);
>> -
>> -done:
>> -	return etr_buf;
>>   }
>>   
>>   static struct etr_buf *
>> -- 
>> 2.33.0
>>
> .
>


