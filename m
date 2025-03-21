Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCAAC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJsB749pnTX72RwDRztsFQHu4pIA8A7ILSPDLgStd4o=; b=gqxoJMmJ7QgU1vN8qqwAODSZF5
	KTNnQ/wdYoSJI0jLqdp++kPuCLN9UyYDxOtFQPFIL6NsOdJiRWe20Qgry04QQXZrArGNI9WzE2Z7a
	QDSCxE0N0hGty6igEn0rdjWh/GofRW1HqZYAVVcbmNec5CAuuP+fnlPGb1tH4SUmyHA+lLdsBoiDx
	CAZunclqTIc2DPNjhoT/xXwFPZzeTDWpDwvQznJL8Psbp7fqDZi9HgHPQ1TETaSjw8tak6aFoCwiC
	C7ZRmroeAHSjDYkgTtksbuKQOlZaUpkazdVJ8OStXzjAZlVk6X9gerYsUAC+NzwWTF2I/2Kc079j6
	oXwU4Wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXiL-0000000EFSF-2L7h;
	Fri, 21 Mar 2025 08:26:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXge-0000000EFLL-0aCm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:25:06 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L7XAjn022991;
	Fri, 21 Mar 2025 09:24:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BJsB749pnTX72RwDRztsFQHu4pIA8A7ILSPDLgStd4o=; b=qw1wgFDZ4OU12BJK
	sxhLItBYLieB0GN9SwtUcs6S5dUjLJcjecgsdOZBykhcsvhRQa5hMsrLWsJx4Cwe
	pKXxuUYVLv5ldP8vmq+w2zYCkoAMPYPR2xNlsISpNyH+W2AHpIYTZBkAooVX2n0p
	+QEb0UDtgMVM4hft1BcZGRDzdEMmzxq4wCgh8uVveCt+dpLpZ+ui0VBDy9Foqz/g
	x3svWBaNPKP9mB0Qo4vWlz0sNHRwgdt+qJpW3d0JdzgE8kL0jC4uKKHiKnE4WalJ
	uskPxqv9deihvesTAN6IekfwhenzbkYL2p+SbLzAVS2RuN0q2GrJsGkWl+Qlfn2p
	mNbTmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45h3tqr7g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 09:24:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4153E40068;
	Fri, 21 Mar 2025 09:23:33 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABB387C6A8F;
	Fri, 21 Mar 2025 09:22:31 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 09:22:31 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 09:22:30 +0100
Message-ID: <4eddc37b-5164-453a-9b7f-c4331a7d6243@foss.st.com>
Date: Fri, 21 Mar 2025 09:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
To: Rob Herring <robh@kernel.org>
CC: Saravana Kannan <saravanak@google.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Shawn
 Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
 <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
 <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_03,2025-03-20_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_012504_800887_DA451840 
X-CRM114-Status: GOOD (  33.06  )
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



On 3/20/25 19:02, Rob Herring wrote:
> On Thu, Mar 20, 2025 at 4:23 AM Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>>
>>
>> On 3/20/25 00:04, Rob Herring wrote:
>>> On Wed, Mar 19, 2025 at 10:26 AM Arnaud POULIQUEN
>>> <arnaud.pouliquen@foss.st.com> wrote:
>>>>
>>>> Hello Rob,
>>>>
>>>> On 3/18/25 00:24, Rob Herring (Arm) wrote:
>>>>> Use the newly added of_reserved_mem_region_to_resource() and
>>>>> of_reserved_mem_region_count() functions to handle "memory-region"
>>>>> properties.
>>>>>
>>>>> The error handling is a bit different in some cases. Often
>>>>> "memory-region" is optional, so failed lookup is not an error. But then
>>>>> an error in of_reserved_mem_lookup() is treated as an error. However,
>>>>> that distinction is not really important. Either the region is available
>>>>> and usable or it is not. So now, it is just
>>>>> of_reserved_mem_region_to_resource() which is checked for an error.
>>>>>
>>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> ---
>>>>> For v6.16
>>>>>
>>>
>>> [...]
>>>
>>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>>>> index b02b36a3f515..9d2bd8904c49 100644
>>>>> --- a/drivers/remoteproc/stm32_rproc.c
>>>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>>>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>>>>>  {
>>>>>       struct device *dev = rproc->dev.parent;
>>>>>       struct device_node *np = dev->of_node;
>>>>> -     struct of_phandle_iterator it;
>>>>>       struct rproc_mem_entry *mem;
>>>>> -     struct reserved_mem *rmem;
>>>>>       u64 da;
>>>>> -     int index = 0;
>>>>> +     int index = 0, mr = 0;
>>>>>
>>>>>       /* Register associated reserved memory regions */
>>>>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>>>> -     while (of_phandle_iterator_next(&it) == 0) {
>>>>> -             rmem = of_reserved_mem_lookup(it.node);
>>>>> -             if (!rmem) {
>>>>> -                     of_node_put(it.node);
>>>>> -                     dev_err(dev, "unable to acquire memory-region\n");
>>>>> -                     return -EINVAL;
>>>>> -             }
>>>>> +     while (1) {
>>>>> +             struct resource res;
>>>>> +             int ret;
>>>>> +
>>>>> +             ret = of_reserved_mem_region_to_resource(np, mr++, &res);
>>>>> +             if (ret)
>>>>> +                     return 0;
>>>>>
>>>>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
>>>>> -                     of_node_put(it.node);
>>>>> -                     dev_err(dev, "memory region not valid %pa\n",
>>>>> -                             &rmem->base);
>>>>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
>>>>> +                     dev_err(dev, "memory region not valid %pR\n", &res);
>>>>>                       return -EINVAL;
>>>>>               }
>>>>>
>>>>>               /*  No need to map vdev buffer */
>>>>> -             if (strcmp(it.node->name, "vdev0buffer")) {
>>>>> +             if (strcmp(res.name, "vdev0buffer")) {
>>>>
>>>> I tested your patches
>>>
>>> Thank you.
>>>
>>>> The update introduces a regression here. The strcmp function never returns 0.
>>>> Indeed, it.node->name stores the memory region label "vdev0buffer," while
>>>> res.name stores the memory region name "vdev0buffer@10042000."
>>>>
>>>> Several remoteproc drivers may face the same issue as they embed similar code.
>>>
>>> Indeed. I confused myself because node 'name' is without the
>>> unit-address, but this is using the full name. I've replaced the
>>> strcmp's with strstarts() to address this. I've updated my branch with
>>> the changes.
>>
>> This is not enough as the remoteproc core function rproc_find_carveout_by_name()
>> also compares the memory names. With the following additional fix, it is working
>> on my STM32MP15-DK board.
>>
>> @@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc, const
>> char *name, ...)
>>         vsnprintf(_name, sizeof(_name), name, args);
>>         va_end(args);
>>
>>         list_for_each_entry(carveout, &rproc->carveouts, node) {
>>                 /* Compare carveout and requested names */
>> -               if (!strcmp(carveout->name, _name)) {
>> +               if (strstarts(carveout->name, _name)) {
>>                         mem = carveout;
>>                         break;
>>                 }
>>         }
>>
>> I just wonder if would not be more suitable to address this using the
>> "memory-region-names" field.
> 
> That would be better as you shouldn't really care what a provider node
> name is where-as "memory-region-names" is meaningful to the driver.
> 
>>
>> The drawback is that we would break compatibility with legacy boards...
> 
> So not an option.

> 
> I think I'll have to fix this within the reserved mem code storing the
> name or do something like the diff below. I'd like to avoid the
> former. Using the original device_node.name is also problematic
> because I want to get rid of it. We redundantly store the node name
> with and without the unit-address. There's a lot of places like this
> one where we hand out the pointer with no lifetime.
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 1e949694d365..cdee87c6ffe0 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -239,7 +239,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>                                                    resource_size(&res), da,
>                                                    stm32_rproc_mem_alloc,
>                                                    stm32_rproc_mem_release,
> -                                                  res.name);
> +                                                  "%.*s",
> strchrnul(res.name, '@') - res.name, res.name);
> 
>                         if (mem)
>                                 rproc_coredump_add_segment(rproc, da,
> @@ -249,7 +249,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>                         mem = rproc_of_resm_mem_entry_init(dev, index,
>                                                            resource_size(&res),
>                                                            res.start,
> -                                                          res.name);
> +                                                          "vdev0buffer");
>                 }
> 
>                 if (!mem) {


That's work on my side.
Could we have an OF helper to retrieve the name from the full name?

Thanks,
Arnaud

