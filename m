Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495B8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gxQFyJw5oEPlJrNAKF6ERcGuSNk0FxInJ0AAbQCAlg=; b=O4KldDDGpk+dsm9xjNDiJQ+pp+
	pLaTq2+Efbo5EiozPkFqoHWF76i9Sg7B8p12CAwRghdmlU/5EiPxfuRv68Jb4uXMQWaYa7FPWWOkk
	YvcFyqSKTSsMUPLM6FTzwwaWxtwJrAuzk3Ieuaxj36AyDeixv3lXJQyXTVUuS7e4gYWdIXg6HIf5K
	Xz0Fdy/Uw3AFLN2EJv1RYWt3oCZN6fZoXBBm0QDpqpY3Tj7Nd8pYwQZcspbSQNmah/Ugy1vntYX1/
	neOM0m/gSHLTrrGpQpRwlKvPfESpi2G0MirTxnTgUfbu5VzoBbQKWOgiyR7CxExjV+uhxddq20g7a
	ydI9koxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy40-00000000QIR-36Kk;
	Tue, 25 Feb 2025 16:45:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxhm-00000000CPw-1cjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:22:48 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFCrWC016958;
	Tue, 25 Feb 2025 17:22:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5gxQFyJw5oEPlJrNAKF6ERcGuSNk0FxInJ0AAbQCAlg=; b=OxOtEUAEemJ7xmT+
	SswcTnH0XnACl/+5vGnoJ91/aKrxA90SM9ZdHJqoMEaEudZ6bsOJwu3/FOree1r0
	u1sILtXwawuzUyOXgy6Jc9aDmZ6KlMF99ul6mlrxWrDoN70HPnZgGdpmLaTDtyUT
	Be5TL9/MWjIHuQwsgg36J5fqS1JNCfg55zZRsRzTEhA/o4B8OE9IauTObLlzdED/
	0abBmAfOzmyTgTLs0wV0WbBMFaaWYlHD2p/BGylTlISso2/VYqTLrALQ0iBLKg/H
	sNfysYZ7fk0TpBRr87LV27Iuy2hijSOzD07iIvkSIgSKxp3Ewg0n4p9dd3NKjTdB
	lNE8Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sqvfhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 17:22:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 88F5240046;
	Tue, 25 Feb 2025 17:21:13 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2597C5C0CD7;
	Tue, 25 Feb 2025 15:57:51 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:57:50 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:57:50 +0100
Message-ID: <2df7bdd9-5072-4a9a-b142-1e1e3f20130c@foss.st.com>
Date: Tue, 25 Feb 2025 15:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] clocksource: stm32-lptimer: add stm32mp25 support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
 <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_082246_877719_D5E341AE 
X-CRM114-Status: GOOD (  15.20  )
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

On 2/25/25 13:02, Krzysztof Kozlowski wrote:
> On Mon, Feb 24, 2025 at 07:01:46PM +0100, Fabrice Gasnier wrote:
>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> Add the support of the new compatible for STM32MP25 SoC in driver, as
>> described in Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
>> and used in arch/arm64/boot/dts/st/stm32mp251.dtsi.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>  drivers/clocksource/timer-stm32-lp.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
>> index a4c95161cb22..db055348e2cc 100644
>> --- a/drivers/clocksource/timer-stm32-lp.c
>> +++ b/drivers/clocksource/timer-stm32-lp.c
>> @@ -197,6 +197,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>>  
>>  static const struct of_device_id stm32_clkevent_lp_of_match[] = {
>>  	{ .compatible = "st,stm32-lptimer-timer", },
>> +	{ .compatible = "st,stm32mp25-lptimer-timer", },
>>  	{},
> 
> Same question.

Oops, I just figured out I have missed a change to this driver, to
enable interrupts, in order to comply with the LPTimer spec, starting
with STM32MP25.

E.g. with earlier STM32MP13, STM32MP15 or even STM32H7:
* The LPTIM_IER register must only be modified when the LPTIM is
disabled (ENABLE bit reset to ‘0’)

On STM32MP25:
* The LPTIMx_DIER register must only be modified when the LPTIM is
enabled (ENABLE bit set to 1)

I'll add this as compatible data in next revision.

Best regards,
Fabrice

> 
> Best regards,
> Krzysztof
> 

