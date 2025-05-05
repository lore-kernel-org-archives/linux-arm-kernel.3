Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3796C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNv4YiLlgQtzs0T1f6YhVskbVHM2VZaXMMv7y7lFYks=; b=epqx1/EhAcvb0u3iikQD3CiMbi
	F1Fk/RdMo/uLpPa/XwgN1GImhGiQNf2Cp5fasC4R4DFarsUei9VzXgPV03RyO9QQynjDOj/6nfjdf
	1mCoqRH9fYZzbjbI6FiFuuycfaHcKNqOv4wcBC0aMwjEPHK54kFwOrx6tppdGuHjlPkWPVtj2NPF0
	C2t1z/aSeJ9v/xVKWNYHF+N+IkAKJbWLvbQ4XRFEMfcPbWGG42V3f7V5+b1k5v94guUUzcwOuZyx6
	3Z5vmSNShYAg8xSRyhT04iO8MoMWL7etRYeyRCggXwjHo5frslb8nuaqASsW/iK4cU33FmayTjw1F
	3YUQZZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuv1-00000007JLH-3UIH;
	Mon, 05 May 2025 12:27:35 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuoK-00000007IP0-2VYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:20:42 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5459iofq026377;
	Mon, 5 May 2025 14:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vNv4YiLlgQtzs0T1f6YhVskbVHM2VZaXMMv7y7lFYks=; b=VcIPzoF7GvsOd/WZ
	rsEAtn10/CuuGxpRtZPvKcVSO7L+0Hjoxqjze9wOkJ9oZpbrrxZaHOXoUWI0qxhl
	5TqA8vbrHSzY4TszLkb9rxuxEC5JqBHyfzuTGQj46DDsopVDxMROJmXHMApay6iY
	ndorEak3fidDnUd5uf+bp9VwMhDKVc1IJp5KZAg5Vi9bc8h89XpZg4rNnLd6oZqP
	fLMl5nQp6KMHLwLMGOf8rLK5VrF4OskEJgbJb4IIJszd8dpt3DEUNIXifeP4dBoj
	/K7j8uKefrb9yibR31mFUYlRxanDfE7YmEBAyxqWzpvo03+OSgsyRkAqgMZ5HDzi
	u7+SPQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbekp93d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 14:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B78140048;
	Mon,  5 May 2025 14:19:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A9A5AF1E53;
	Mon,  5 May 2025 14:17:39 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 14:17:39 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 14:17:38 +0200
Message-ID: <c7a1b615-9171-4675-b5d6-fe5741f1ac0b@foss.st.com>
Date: Mon, 5 May 2025 14:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add STM32MP25 LPTIM support: MFD, PWM, IIO,
 counter, clocksource
To: Lee Jones <lee@kernel.org>
CC: <daniel.lezcano@linaro.org>, <alexandre.torgue@foss.st.com>,
        <tglx@linutronix.de>, <ukleinek@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jic23@kernel.org>, <robh@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <20250501131454.GO1567507@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250501131454.GO1567507@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_052040_915102_0093FB1B 
X-CRM114-Status: GOOD (  15.73  )
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



On 5/1/25 15:14, Lee Jones wrote:
> On Tue, 29 Apr 2025, Fabrice Gasnier wrote:
> 
>> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
>> clocksource low-power timer (LPTIM) drivers.
>> This new variant is managed by using a new DT compatible string, hardware
>> configuration and version registers.
>> It comes with a slightly updated register set, some new features and new
>> interconnect signals inside the SoC.
>> Same feature list as on STM32MP1x is supported currently.
>> The device tree files add all instances in stm32mp251 dtsi file.
>>
>> Changes in V6
>> ---
>> - Fixed kernel test robot warning
>>   https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/
>>
>> Changes in V5
>> ---
>> - Add a necessary delay in clocksource driver, when enabling the timer.
>> - Add collected Acks
>> - Dropped IIO trigger patch as applied by Jonathan [1] (no dependency)
>>   [1] https://lore.kernel.org/all/20250331110435.26157ebe@jic23-huawei/
>>
>> Changes in V4
>> ---
>> - Simplify IIO trigger driver as per Jonathan's comments.
>> - Rework clocksource driver: encapsulate mp25 changes in separate function
>>   after Daniel's suggestion.
>> - Add some definitions to MFD header.
>>
>> Changes in V3
>> ---
>> - Yaml indentation issue fixed, reported by Rob's bot
>>
>> Changes in V2
>> ---
>> - Review comments from Krzysztof
>>   - Adopt compatible fallback in dt-bindings and driver
>>   - drivers: drop "st,stm32mp25-..." compatibles when unused (e.g. no .data)
>>   - counter driver: no update (patch dropped)
>>   - defconfig: only enable the necessary config for upstream board
>>   - add lptimer DT node in stm32mp257f-ev1 board
>> - Add missing management of IER access for stm32mp25
>>
>> Fabrice Gasnier (7):
>>   dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
>>   mfd: stm32-lptimer: add support for stm32mp25
>>   clocksource: stm32-lptimer: add support for stm32mp25
>>   pwm: stm32-lp: add support for stm32mp25
>>   arm64: defconfig: enable STM32 LP timer clockevent driver
>>   arm64: dts: st: add low-power timer nodes on stm32mp251
>>   arm64: dts: st: use lptimer3 as tick broadcast source on
>>     stm32mp257f-ev1
>>
>>  .../bindings/mfd/st,stm32-lptimer.yaml        |  40 +++-
>>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   8 +
>>  arch/arm64/configs/defconfig                  |   2 +
>>  drivers/clocksource/timer-stm32-lp.c          |  61 ++++-
>>  drivers/mfd/stm32-lptimer.c                   |  33 ++-
>>  drivers/pwm/pwm-stm32-lp.c                    | 219 +++++++++++++++---
>>  include/linux/mfd/stm32-lptimer.h             |  37 ++-
>>  8 files changed, 537 insertions(+), 40 deletions(-)
> 
> Is it just the Clocksource Ack that we're waiting on now?
> 
Hi Lee,

Yes,

Best Regards,
Fabrice

