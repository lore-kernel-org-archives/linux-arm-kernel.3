Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F98C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV2n3+CLnbeCuZtQ8iB/PugFIDY5N/D9dFFtC0TMj4s=; b=Szj9kRuPgZ2BlwGzSMhjOqmisI
	FEhfWoKihY4gpySF9qV7iXdiU5Tz9AvPcLlD4x/71UO6WtkEWMPiKd8IE/5HGat45FSe0Wjq5mKDq
	4YKeo6nZCaiUoXeJk3I6dWzaOBmJa2AEpOqEJXSiMkimJtloY8TJvKUfKHCVV79orKLTLmafOpt+D
	O4ZwqxYezMtIE3k7GB8QeVohdkKXGaMHRIrPkFr3WuQQlgC5Kf6WXIf/NZKlzYlhKd7Qo+8toTWP9
	G1psydPq7jJz9Pl1p7oNGMFZEHsIZ/Si4K04qLP06cfIe9GUM81+0WH8sWhFxCsaHgsng5kk5SO/G
	+gzWRg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOHo-00000005Ne1-1pER;
	Wed, 26 Feb 2025 20:45:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOGF-00000005NOU-2SPT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 20:44:09 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QJm0Bh012384;
	Wed, 26 Feb 2025 21:43:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dV2n3+CLnbeCuZtQ8iB/PugFIDY5N/D9dFFtC0TMj4s=; b=T5jWUNLPIgzUEWCO
	YsFZP+CS4VMpbQ/xEFui0SEFnCAKNbGI5QmWXBBkQ+ZyxKd+J4h0xxNIV7Gl1o7T
	fcDnzMkrWCJlwfxc4lmtKKgMS5GF3MNzYxMsR5pY4rXev0anmqlz1fv9iTLMt7Vx
	TDjypI7+ml3QH9ddILkqT1ZrzZBI8Li0fvYWNy4ElqHvfrXPFWO9U2luOHnK8aTG
	iOqp2P5EQQburyIRHp3sEfmpsK1S7Ys57FN4nyJLkOqrGGEwc3kpyy1d6u7vj+X0
	gAOZRUq8HMaqAIPQZhUogRgcbBqmOr0ziPiycE2AInccwaZWouaGfqPVw8ZRwS6q
	r/QS6A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv6unw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 21:43:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8444C4004F;
	Wed, 26 Feb 2025 21:42:40 +0100 (CET)
Received: by euls16034.sgp.st.com (STMicroelectronics, from userid 89)
	id 61EB44EECF2; Wed, 26 Feb 2025 19:14:28 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2078A41E191;
	Wed, 26 Feb 2025 19:14:28 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:14:27 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:14:27 +0100
Message-ID: <c38324ea-0cf2-49f0-8d3c-2cd0ffd958b2@foss.st.com>
Date: Wed, 26 Feb 2025 19:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] pwm: stm32-lp: add support for stm32mp25
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
 <20250224180150.3689638-6-fabrice.gasnier@foss.st.com>
 <20250225-psychedelic-iguana-of-education-d5fff7@krzk-bin>
 <e309c016-4dcb-49e3-945e-54ddadfbddb8@foss.st.com>
 <e15754dd-5f4e-424d-a3a9-308dae814708@kernel.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <e15754dd-5f4e-424d-a3a9-308dae814708@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_124407_933282_CDBC291B 
X-CRM114-Status: GOOD (  17.29  )
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

On 2/26/25 08:54, Krzysztof Kozlowski wrote:
> On 25/02/2025 15:58, Fabrice Gasnier wrote:
>>
>>
>> On 2/25/25 13:04, Krzysztof Kozlowski wrote:
>>> On Mon, Feb 24, 2025 at 07:01:47PM +0100, Fabrice Gasnier wrote:
>>>>  	}
>>>>  
>>>>  	return pinctrl_pm_select_sleep_state(dev);
>>>> @@ -246,6 +413,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_pwm_lp_pm_ops, stm32_pwm_lp_suspend,
>>>>  
>>>>  static const struct of_device_id stm32_pwm_lp_of_match[] = {
>>>>  	{ .compatible = "st,stm32-pwm-lp", },
>>>> +	{ .compatible = "st,stm32mp25-pwm-lp", },
>>>
>>> No driver data suggests device is backwards compatible. Commit msg
>>> suggests not, so that's confusing.
>>
>>
>> The LPTimer PWM driver takes benefit of the MFD parent driver to feed in
>> data, e.g. 'num_cc_chans'. Number of channels is now variable, on
> 
> This means this ID table is useless. You do the matching via parent
> device, so stop growing the table and call it deprecated or something.
> 
>> STM32MP25 (e.g. not a single channel). But it can't be hard-coded as
>> compatible data. (there's only 1 channel on earlier LP Timer hardware
>> revision).
>>
>> The hardware controller is a bit different, hence the new compatible
> 
> If it works with old compatible, it's an easy proof that it is
> compatible, so please counter argument that with something specific.

Ack, I'll drop the "st,stm32mp25-pwm-lp" compatible, as match through
the parent device is achieved here.
Alternatively, reading directly the hardware configuration register
could be used to retrieve the 'num_cc_chans'.

Thanks for reviewing,
Best regards,
Fabrice
> What is different that driver cannot work with new device using old
> interface or old features?
> 
> 
> Best regards,
> Krzysztof

