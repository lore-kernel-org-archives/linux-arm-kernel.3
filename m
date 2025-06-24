Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9EDC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LowxC1XeO1Q3ptnV100NCfbZE/+FCacaRTlFDEZ7nw4=; b=xEOZhk+Xi2PCq8W+1LSEme31ln
	pQIPzB7uwkP1++5gcxbzsX3/wJ28q0lYQiGBL4b3gg7+pp0NGgbWaH498H1hsiLcBxoF8hEaynxoY
	n5HlNgoK0vnurEWVgIO5aU/3Zbrn4vWqCaxycmhHgvqVJst1BMUtg5JZr1mYtwWGee87G3MkQLLqh
	3ZnBSWdGhzjE0XC0mHpJwIM9iwgJjoavxO7wMhQIU0/Ds1DGu8QFnrwGmnOA7rWji1QMRZZE8ZR7W
	wwBJ/4ZGJOmlqu5uIcW/X3qDjKIVv/tJoCgnTnTcBn15efP5v2Kh8UKnyVopeuItST2eIi3ag7TCf
	zuoBFbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU22j-00000005S7u-1Wck;
	Tue, 24 Jun 2025 11:42:25 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1AA-00000005LYV-1T55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:46:07 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O89PlW018562;
	Tue, 24 Jun 2025 12:45:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	LowxC1XeO1Q3ptnV100NCfbZE/+FCacaRTlFDEZ7nw4=; b=NW+9A/iYDBIYOudx
	bupDVw7fFsOUiF1POCQhkWRdtrMnA2SQEgn3ffTStQz7psNYYvO1bykZpdgutoWy
	1WzDPo1HfRDTujMzGceUmoFF9dI3csRqk+OrSjX2U1Q82AHPZk0yuR9GirUQWEuY
	0uTXBDmqmhreOATOMkPOrAg+HFRtqZZO74LR/Kz8sUH5woYThZWMJktOCzrRuZP5
	jloxRIqQkKw51725g6fIFcIyiDtijqkG3NSDKgTMgLLmmSM6OD0+OHlCDgC/T3aL
	OBE2cZ+Obv2dvhAJpM9vhApHeFKzbOlpzSn/muvTc+F8R53Tnl46alaOILvOrx/r
	WA2Mzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjm6bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 12:45:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B79640046;
	Tue, 24 Jun 2025 12:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 974C5B51BAB;
	Tue, 24 Jun 2025 12:43:10 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 12:43:09 +0200
Message-ID: <5044c733-8836-43bd-85d7-0f552b000fb1@foss.st.com>
Date: Tue, 24 Jun 2025 12:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] perf: stm32: introduce DDRPERFM driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
 <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_034602_888547_B6C55FA8 
X-CRM114-Status: GOOD (  11.26  )
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

On 6/23/25 11:45, Krzysztof Kozlowski wrote:
[...]

Hi Krzysztof,

Sorry I forgot to address comments below.

>> +
>> +static const struct stm32_ddr_pmu_cfg stm32_ddr_pmu_cfg_mp1 = {
>> +	.regs = &stm32_ddr_pmu_regspec_mp1,
>> +	.attribute = stm32_ddr_pmu_attr_groups_mp1,
>> +	.counters_nb = MP1_CNT_NB,
>> +	.evt_counters_nb = MP1_CNT_NB - 1, /* Time counter is not an event counter */
>> +	.time_cnt_idx = MP1_TIME_CNT_IDX,
>> +	.get_counter = stm32_ddr_pmu_get_event_counter_mp1,
>> +};
>> +
>> +static const struct stm32_ddr_pmu_cfg stm32_ddr_pmu_cfg_mp2 = {
>> +	.regs = &stm32_ddr_pmu_regspec_mp2,
>> +	.attribute = stm32_ddr_pmu_attr_groups_mp2,
>> +	.counters_nb = MP2_CNT_NB,
>> +	.evt_counters_nb = MP2_CNT_NB - 1, /* Time counter is an event counter */
>> +	.time_cnt_idx = MP2_TIME_CNT_IDX,
>> +	.get_counter = stm32_ddr_pmu_get_event_counter_mp2,
>> +};
>> +
>> +static const struct dev_pm_ops stm32_ddr_pmu_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, stm32_ddr_pmu_device_resume)
>> +};
>> +
>> +static const struct of_device_id stm32_ddr_pmu_of_match[] = {
>> +	{
>> +		.compatible = "st,stm32mp131-ddr-pmu",
>> +		.data = &stm32_ddr_pmu_cfg_mp1
>> +	},
>> +	{
>> +		.compatible = "st,stm32mp151-ddr-pmu",
>> +		.data = &stm32_ddr_pmu_cfg_mp1
> 
> So devices are compatible, thus express it correctly and drop this.

Ok so I assume this comes with your comment in the bindings and 
basically don't get you point here.
Can you please be more precise ?

> 
>> +	},
>> +	{
>> +		.compatible = "st,stm32mp251-ddr-pmu",
>> +		.data = &stm32_ddr_pmu_cfg_mp2
>> +	},
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_ddr_pmu_of_match);
>> +
>> +static struct platform_driver stm32_ddr_pmu_driver = {
>> +	.driver = {
>> +		.name = DRIVER_NAME,
>> +		.pm = &stm32_ddr_pmu_pm_ops,
>> +		.of_match_table = of_match_ptr(stm32_ddr_pmu_of_match),
> 
> Drop of_match_ptr, you have here warnings.

Yes Indeed.
I'll also fix the pm pointer by using "pm_sleep_ptr".

Best regards,
Clément

> 
> 
> 
> Best regards,
> Krzysztof


