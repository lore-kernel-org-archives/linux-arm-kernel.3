Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55062C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXz/daQoPl9vRa9N4mM+seFELokRLIOzCneeJp1maXM=; b=bmpfOV39c7rBh1h01Ht7wb1CYA
	2yMGjGXvBmqVqN8k6sPGMS0HTBOmuFLQf1CUic6egLa6Zg/gxs1G5TKQyYTVJtsr7NkiDLjb/nsAE
	aJapR3RkpLX9d7DS9D9yRzxCufCj13FnOcDIJr+rg5B7KdsII2FK2d9rZnkwkEOxP0WVkZAShtaiR
	+5OfXULlP+iUNns/uIdpN+mfkyJHzhkgPG2U85pXESWMyYpE12Pd9U98CvkdZJXO44vZKiGYeEhnU
	jt6ETwiwuBDWgIrNUFonbFzcgy9eWWeYlDZV5Z4/BySki6b9zIb+vRHjdCvjikjkExEp+qoR9snsd
	Vsu9Mu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy44-00000000QP2-3un8;
	Tue, 25 Feb 2025 16:45:48 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxiX-00000000CVL-409g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:23:35 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF69IC022886;
	Tue, 25 Feb 2025 17:23:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PXz/daQoPl9vRa9N4mM+seFELokRLIOzCneeJp1maXM=; b=VAucme6bAbNWdggq
	b0PvGfNYPnsbc2ydRLnri3S16Bo1Fx9tWERsEoZ49Fd+yVHacE22cDmcv8tUCtRd
	AxXho4yG7VSaMv84JB5yspb3Pf+ErNOL7hMkA20VnqEwGtHf5Xq6Wz5oFM/UhO8Z
	iCCNX27M6wR83ph58WaV54kbx5cFN4aIC7EG350RuuGX9ksPpAoRISe2R4CBbOlx
	GJzs66XcVVsuvOn9pnlKrKms4FLsy3r7tIWhYh0UloJqermZbkGZ2ExwJyEH3jCy
	jPOf5nOPUjlYZMEtKTFziwd/BDXkyMhbpfK8H7TI7U/BIzfbzK2HAHU4Imgz6j4F
	NucuTg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4kbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 17:23:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0290540074;
	Tue, 25 Feb 2025 17:22:19 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBEE141878C;
	Tue, 25 Feb 2025 15:58:48 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:58:48 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:58:47 +0100
Message-ID: <4ffc3fe3-78ab-43b2-b0d5-8f9cb545f9c5@foss.st.com>
Date: Tue, 25 Feb 2025 15:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] counter: stm32-lptimer-cnt: add support for stm32mp25
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
 <20250224180150.3689638-7-fabrice.gasnier@foss.st.com>
 <20250225-pelican-of-pleasurable-might-e9a7e8@krzk-bin>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250225-pelican-of-pleasurable-might-e9a7e8@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_082334_299722_A677FF7A 
X-CRM114-Status: GOOD (  17.51  )
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
> On Mon, Feb 24, 2025 at 07:01:48PM +0100, Fabrice Gasnier wrote:
>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>> this new HW variant, even if no major change is expected on the counter
>> driver.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>  drivers/counter/stm32-lptimer-cnt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
>> index b249c8647639..a5dce017c37b 100644
>> --- a/drivers/counter/stm32-lptimer-cnt.c
>> +++ b/drivers/counter/stm32-lptimer-cnt.c
>> @@ -508,6 +508,7 @@ static SIMPLE_DEV_PM_OPS(stm32_lptim_cnt_pm_ops, stm32_lptim_cnt_suspend,
>>  
>>  static const struct of_device_id stm32_lptim_cnt_of_match[] = {
>>  	{ .compatible = "st,stm32-lptimer-counter", },
>> +	{ .compatible = "st,stm32mp25-lptimer-counter", },
> 
> So fully compatible? Why this change then?

Hi Krzysztof,

I should have mentioned it in the commit message:

Currently, same feature list as on STM32MP1x is supported.
New capture input stage is now available in the hardware. It's not added
yet to the driver.

The Low Power Timer (LPTIM) hardware isn't fully backward compatible,
hence add a new compatible to properly support it.

Best regards,
Fabrice

> 
> Best regards,
> Krzysztof
> 

