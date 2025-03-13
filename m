Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9CFC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UACylWACYq+MaYXZcL2+yGVsndWAy/wz/DmvGJrXiA=; b=lF549tEt9QOz0QBAu/OC641qd6
	viGV9LD5XiOTMAABpzqChJCtRTgyo2/2NTxkkjsfa9795fLD8lkWyNbUGr6xIRyrcxzYbd89xlkyM
	jqc/qcPfqIIWlm7k1PuErmnPI1HZ+nfQ5fY6tOUstE5yG57uneSa9m6Tmqf+eqnCb34G2FHrN3Rno
	SoyNWXRhWryR7/2eU6I3gvKhO1F8Iy/U5ON0OdqFtsXhN/3gAfFdBCWJzBZ3IQbR2KcJ3BQCF3mgR
	XtSK+mVjzGBZ8Pa1ql64WiUjNY4IHeNaCKuuo/A1ghxTl6PVOJm0bbkv2oTMYeBAVs7wixyIEu1ho
	Wt4OHMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9n-0000000BzAa-1yhX;
	Thu, 13 Mar 2025 17:15:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm40-0000000Bvvd-0AOk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:09:45 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGD7D6003932;
	Thu, 13 Mar 2025 18:09:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/UACylWACYq+MaYXZcL2+yGVsndWAy/wz/DmvGJrXiA=; b=B4CqnQjrifjsld/Y
	DaUYXKtWR6i45Ame6DKDoXrNii3EePe8ZddE1Ysiu37Upj0VTc+sEY+4E38WsO4X
	KJz/PxvRy8AKzWj+egbTF8nZjfWRfcrPS7Kk3O5iJOkgk7x4EPp72BGZ+I+G7A4d
	HQrZqxTbLhFKQY/GZBfqYYo0uF3VksBpXuALvM5SzIEsXsKaOGi/yoZkKTZsrUmq
	7nBaB+hbMpnAn2LPUpupn+V3qwG505VaUB/cHqRsmuW/jnjOnbpkM2nOk/vDv8QJ
	WOXT8xErxt7gNcXWCT1P+ia3f3yUzaAQw4TwcRWv+koTDEBsp4NFZu4BUghZPADQ
	ggjDsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2pf07mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 18:09:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1780B4004D;
	Thu, 13 Mar 2025 18:08:27 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3E4E589337;
	Thu, 13 Mar 2025 18:07:18 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:07:18 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:07:17 +0100
Message-ID: <c1cb926f-33b0-4433-b54d-954451ed32a8@foss.st.com>
Date: Thu, 13 Mar 2025 18:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] mfd: stm32-lptimer: add support for stm32mp25
To: Lee Jones <lee@kernel.org>
CC: <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
 <20250313164008.GC3645863@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250313164008.GC3645863@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-11_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100944_384944_A69A8E0A 
X-CRM114-Status: GOOD (  14.22  )
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



On 3/13/25 17:40, Lee Jones wrote:
> On Wed, 05 Mar 2025, Fabrice Gasnier wrote:
> 
>> Add support for STM32MP25 SoC.
>> A new hardware configuration register (HWCFGR2) has been added, to gather
>> number of capture/compare channels, autonomous mode and input capture
>> capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
>> supports a smaller set of features. This can now be read from HWCFGR
>> registers.
>>
>> Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
>> Update the stm32_lptimer data struct so signal the number of
>> capture/compare channels to the child devices.
>> Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>> Changes in V2:
>> - rely on fallback compatible as no specific .data is associated to the
>>   driver. Compatibility is added by reading hardware configuration
>>   registers.
>> - read version register, to be used by clockevent child driver
>> - rename register/bits definitions
>> ---
>>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++++-
> 
> Looks okay.

Hi Lee,

Thanks for reviewing,

> 
>>  include/linux/mfd/stm32-lptimer.h | 35 ++++++++++++++++++++++++++++---
> 
> Assumingly this patch is not independent of the others?

Please hold on, I'll submit a V4, with some additional bit definition
for the clocksource driver (see my last reply to Daniel).

Best Regards,
Fabrice

> 

