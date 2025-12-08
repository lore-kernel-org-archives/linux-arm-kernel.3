Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CFCEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm5csJ49xFWPISnBtA1aavtaKokzIRL+BIW2mPrMziY=; b=iAZwW/wobTlMTmyg+OdG1Jv/nM
	p5OJOCKjOkomQIf77W1YUCPyVuRD9NaeN+POFPgbj3CrQjvMcubhfFmbmaZUdHZ3dWkfa5AUyVjLl
	m9sPP8ab52u+x6tVaFObjvw6KLCF0hsgytfmuD+oLVoEEUuE+AlseNnUcSPs9bvXnJXDhV0WaJ6Kh
	7rZMyAw6ovwH/a9bRV4rXeUwmyiwBaJPTThGDVEeUplhKx7c0iZx4nNF3sv4qRpwk6xSosk+CMRBb
	uiYFtDW5RU8U5DVAuxwZvIhGxSDuSGxFZnwaG/ZUUADbBq/mHHwNDZPtqIxTntz2xy2T2JiDHI6Rn
	wJzD9zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSSJ-0000000CYXL-17jp;
	Mon, 08 Dec 2025 04:02:35 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSSG-0000000CYWR-0IaB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 04:02:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dPpD56YczzKm4s;
	Mon,  8 Dec 2025 12:00:21 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 968C01A016C;
	Mon,  8 Dec 2025 12:02:17 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Dec
 2025 12:02:16 +0800
Message-ID: <adeb19a3-da4a-41e9-948c-dac7002d034a@hisilicon.com>
Date: Mon, 8 Dec 2025 12:02:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ACPI: CPPC: Factor out and export per-cpu
 cppc_perf_ctrs_in_pcc_cpu()
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <viresh.kumar@linaro.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<zhenglifeng1@huawei.com>, <linux-pm@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yubowen8@huawei.com>, <lihuisong@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
 <20251203032422.3232957-2-zhanjie9@hisilicon.com>
 <CAJZ5v0jvk+gs+h+76__LLZDa=OGzLxQQsWEMDHXzeV8aV6UYsA@mail.gmail.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <CAJZ5v0jvk+gs+h+76__LLZDa=OGzLxQQsWEMDHXzeV8aV6UYsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_200232_273198_6D90DEA3 
X-CRM114-Status: GOOD (  11.36  )
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



On 12/5/2025 11:13 PM, Rafael J. Wysocki wrote:
> On Wed, Dec 3, 2025 at 4:25 AM Jie Zhan <zhanjie9@hisilicon.com> wrote:
>>
>> Factor out cppc_perf_ctrs_in_pcc_cpu() for checking whether per-cpu CPC
>> regs are defined in PCC channels, and export it out for further use.
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>  drivers/acpi/cppc_acpi.c | 45 +++++++++++++++++++++-------------------
>>  include/acpi/cppc_acpi.h |  5 +++++
>>  2 files changed, 29 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
>> index 3bdeeee3414e..aa80dbcf42c0 100644
>> --- a/drivers/acpi/cppc_acpi.c
>> +++ b/drivers/acpi/cppc_acpi.c
>> @@ -1422,6 +1422,29 @@ int cppc_get_perf_caps(int cpunum, struct cppc_perf_caps *perf_caps)
>>  }
>>  EXPORT_SYMBOL_GPL(cppc_get_perf_caps);
>>
>> +bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
>> +{
>> +       struct cpc_desc *cpc_desc = per_cpu(cpc_desc_ptr, cpu);
>> +       struct cpc_register_resource *ref_perf_reg;
>> +
>> +       /*
>> +        * If reference perf register is not supported then we should use the
>> +        * nominal perf value
>> +        */
>> +       ref_perf_reg = &cpc_desc->cpc_regs[REFERENCE_PERF];
>> +       if (!CPC_SUPPORTED(ref_perf_reg))
>> +               ref_perf_reg = &cpc_desc->cpc_regs[NOMINAL_PERF];
>> +
>> +       if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
>> +           CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
>> +           CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
>> +           CPC_IN_PCC(ref_perf_reg))
>> +               return true;
>> +
>> +       return false;
> 
> Why not
> 
> return CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
>           CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
>           CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
>           CPC_IN_PCC(ref_perf_reg);
> 
Yes, that would save a few more lines.
Thanks!

