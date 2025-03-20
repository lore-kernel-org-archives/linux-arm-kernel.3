Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66791C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crexQWu4l57R3sbdMnceBIPuj5iuismgQR90iwJhOlw=; b=Q7lw4ItcotlsC8Iws+3t/hZ4yE
	AFJhAD7jfuflXGNN8fl13HBtc8ssB5HuiQ3m2SUhyj0uAXpFukIoKAR8nsID/JRRU4SU6kaMmHgHE
	tLiKfU5pUyocf+eVBKGBcsWfCIoSUqctJUO8aTRyi8tp4ew7f9fyDeAvm4rw2MJl4BdCSZ8JU8jOM
	ak4bs9irKmIlWgx8z7Jvsdh+f18Ba3GQb5caydVQLvcPuD7qlOffUgOIZbAMc2Wf+KR34gWH2b8J4
	6a8/AVlyVCpvfSJ5337dwOaTHBRQ2R45dwl5waTFVJGDGsbOisOi7lYnPPqU9jaLkSlNgYulpq8RZ
	3QGUoncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvC9j-0000000BgPt-41nA;
	Thu, 20 Mar 2025 09:25:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvC82-0000000BgG1-1tsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 09:23:56 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K9HKHq023149;
	Thu, 20 Mar 2025 10:23:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	crexQWu4l57R3sbdMnceBIPuj5iuismgQR90iwJhOlw=; b=SAdDYbMG9niyLueX
	EmzCVR2UEw3l/kOQ0MwvxKZXvC+VsrRFslJFtNFw82j4ojfMLQ7c/92hs5wpdQZb
	4pJLqvivmJP1npces5+rUxcaO0ZP3VD7BMgzU3HKp7ROvOQKo3UhrvVAfger3DYR
	MG4YNVl28gSKPE6+LEulzoavrtjdTEz9mK/8Xpw48mBVW8GV8FKYTRiUbYxeNa85
	aS+uag6Ka/MqzZ/37uKVx+RJDvG+1NW9JzBYrDDai9hCSaHR8ixkozxXbtNJmNXv
	a1O013eA5hu5sFUBAG+IpUImoCNXg5hKNSAnPQLtGsak+EYIMDBetGbOgE+tP5m6
	uCZcUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45d1u84m7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 10:23:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAD0D4005D;
	Thu, 20 Mar 2025 10:22:13 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEE927C1EF4;
	Thu, 20 Mar 2025 10:21:28 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:21:28 +0100
Received: from [10.252.18.22] (10.252.18.22) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:21:27 +0100
Message-ID: <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
Date: Thu, 20 Mar 2025 10:21:26 +0100
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
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.18.22]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_022354_977600_1EE81AEA 
X-CRM114-Status: GOOD (  23.57  )
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



On 3/20/25 00:04, Rob Herring wrote:
> On Wed, Mar 19, 2025 at 10:26 AM Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hello Rob,
>>
>> On 3/18/25 00:24, Rob Herring (Arm) wrote:
>>> Use the newly added of_reserved_mem_region_to_resource() and
>>> of_reserved_mem_region_count() functions to handle "memory-region"
>>> properties.
>>>
>>> The error handling is a bit different in some cases. Often
>>> "memory-region" is optional, so failed lookup is not an error. But then
>>> an error in of_reserved_mem_lookup() is treated as an error. However,
>>> that distinction is not really important. Either the region is available
>>> and usable or it is not. So now, it is just
>>> of_reserved_mem_region_to_resource() which is checked for an error.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> For v6.16
>>>
> 
> [...]
> 
>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>> index b02b36a3f515..9d2bd8904c49 100644
>>> --- a/drivers/remoteproc/stm32_rproc.c
>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>>>  {
>>>       struct device *dev = rproc->dev.parent;
>>>       struct device_node *np = dev->of_node;
>>> -     struct of_phandle_iterator it;
>>>       struct rproc_mem_entry *mem;
>>> -     struct reserved_mem *rmem;
>>>       u64 da;
>>> -     int index = 0;
>>> +     int index = 0, mr = 0;
>>>
>>>       /* Register associated reserved memory regions */
>>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>> -     while (of_phandle_iterator_next(&it) == 0) {
>>> -             rmem = of_reserved_mem_lookup(it.node);
>>> -             if (!rmem) {
>>> -                     of_node_put(it.node);
>>> -                     dev_err(dev, "unable to acquire memory-region\n");
>>> -                     return -EINVAL;
>>> -             }
>>> +     while (1) {
>>> +             struct resource res;
>>> +             int ret;
>>> +
>>> +             ret = of_reserved_mem_region_to_resource(np, mr++, &res);
>>> +             if (ret)
>>> +                     return 0;
>>>
>>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
>>> -                     of_node_put(it.node);
>>> -                     dev_err(dev, "memory region not valid %pa\n",
>>> -                             &rmem->base);
>>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
>>> +                     dev_err(dev, "memory region not valid %pR\n", &res);
>>>                       return -EINVAL;
>>>               }
>>>
>>>               /*  No need to map vdev buffer */
>>> -             if (strcmp(it.node->name, "vdev0buffer")) {
>>> +             if (strcmp(res.name, "vdev0buffer")) {
>>
>> I tested your patches
> 
> Thank you.
> 
>> The update introduces a regression here. The strcmp function never returns 0.
>> Indeed, it.node->name stores the memory region label "vdev0buffer," while
>> res.name stores the memory region name "vdev0buffer@10042000."
>>
>> Several remoteproc drivers may face the same issue as they embed similar code.
> 
> Indeed. I confused myself because node 'name' is without the
> unit-address, but this is using the full name. I've replaced the
> strcmp's with strstarts() to address this. I've updated my branch with
> the changes.

This is not enough as the remoteproc core function rproc_find_carveout_by_name()
also compares the memory names. With the following additional fix, it is working
on my STM32MP15-DK board.

@@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc, const
char *name, ...)
 	vsnprintf(_name, sizeof(_name), name, args);
 	va_end(args);

 	list_for_each_entry(carveout, &rproc->carveouts, node) {
 		/* Compare carveout and requested names */
-		if (!strcmp(carveout->name, _name)) {
+		if (strstarts(carveout->name, _name)) {
 			mem = carveout;
 			break;
 		}
 	}

I just wonder if would not be more suitable to address this using the
"memory-region-names" field.

The drawback is that we would break compatibility with legacy boards...

I let Mathieu and Bjorn review and comment


Else with the fix in rproc_find_carveout_by_name(),

-for the stm32_rproc:
reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
tested-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

- for the st_remoteproc
reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud


> 
> Rob

