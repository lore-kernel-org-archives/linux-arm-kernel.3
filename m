Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EFDC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds5+8iM4sRf0Jo4IyqmV53NfBcmFz2cJwNiJZ/wCrmk=; b=PSZNQmoXGOnIQz2B/JJ5610riK
	9jVOI6qxw6jMPht5D94Pgl4pxLmV+x5X1lfObVaI6X79HkFnjBHblK9neukKpp6ESYhUCWKnHqSn6
	+OkIMl/Ej2VwLoHNKz1i0Hxw7lZmjtlaUNgdvsvFIdVjMnwSq0Pfc0j8AOEs5mWcDRi228/OgI+k4
	WsBwAISi3425k+UbObZZx+Yki75RpyCgZzEEGuM6AUYAA/4sInexCUSL0gAabXqdA9gnrg3xLaQMS
	JhPKThZpQiLkIDCM3YQpKwLOMIWCnR3NbU2jaswo92vM5YEL5UFf0ddwEM0FdOFmBKqywRop8grrJ
	UWnFh9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8NH-0000000EfBp-0QpJ;
	Wed, 14 May 2025 09:26:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7S0-0000000EV1M-0FoM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:26:53 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7vtKW023076;
	Wed, 14 May 2025 10:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ds5+8iM4sRf0Jo4IyqmV53NfBcmFz2cJwNiJZ/wCrmk=; b=pMGlMrFN7CKCc5l+
	/xUdEV5gxnTpRkg4FOuwGXS51BtuZ1kYDbW2LqiQMA2nhQSxwBFpjwLYCC2AhmDk
	msfLU+TozS7alcR8HZhZhXZb623TTILmwa7sKOnjfrj5H6LqzSSBzRZvyWS96QXC
	IWewdZXh737I31ekESxstCKDAXVXyOg1jGM5JpXfULiVEi+6tUDx4AHPQbn9ke2c
	LGDbfmqBSsPHm40wvkDE9bbbYeAJlHl5fGiH4T7HQpRId+2j7ux8/eK9Vy/8e4s8
	2DWJq5H67SsCDvyIICQi6YLh8xDI53BVvYN7sh5Yup55vf0X5feVmbg0IB1O8w3z
	+IM2dA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdxtj5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:26:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C8B5240044;
	Wed, 14 May 2025 10:25:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C3FDB3A736;
	Wed, 14 May 2025 10:24:03 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 10:24:02 +0200
Message-ID: <7f79af9a-2b42-48c0-98c5-6bf2afc61206@foss.st.com>
Date: Wed, 14 May 2025 10:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset)[PATCH v6 0/7] Add STM32MP25 LPTIM support: MFD, PWM,
 IIO, counter, clocksource
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <daniel.lezcano@linaro.org>,
        <lee@kernel.org>, <tglx@linutronix.de>
CC: <ukleinek@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <robh@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012652_621126_0716E4A7 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Hi Fabrice

On 4/29/25 14:51, Fabrice Gasnier wrote:
> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> clocksource low-power timer (LPTIM) drivers.
> This new variant is managed by using a new DT compatible string, hardware
> configuration and version registers.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC.
> Same feature list as on STM32MP1x is supported currently.
> The device tree files add all instances in stm32mp251 dtsi file.
> 

Following patches are applied on stm32-next:

[PATCH v6 5/7] arm64: defconfig: enable STM32 LP timer clockevent driver
[PATCH v6 6/7] arm64: dts: st: add low-power timer nodes on stm32mp251
[PATCH v6 7/7] arm64: dts: st: use lptimer3 as tick broadcast source on 
stm32mp257f-ev1


Thanks
Alex

