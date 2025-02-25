Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF2C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqgFWeoQivzhLETwW+Q6wbE8s0MXA+Zaes1DQ9N8L94=; b=wS2lhfRNnPlEBwZ/t6H+LZxrbj
	mC3aUiM2QEQJj2izqcV0Nx6Nj9t0AlGRAO2Y+B+6njtX2dDfftAPooi+hQc/WnLUtNTvVft8CFrkv
	hb2Yz4M8kgVOa49Inq7Ss5U2LiH4e78WSlnz1JnweR3CDctaAnFhPAKBGveY46oo9/F+gm8I+JSGZ
	zu9QupxXKkKwiSNcOIIBN/rFk8Ke8KYBaHZxiq8e1FSSz1Ia3Z7Zzb9gj/ki8O36GPYAttlZehXhS
	ai3cglJid+gAKfZPWWbFnKMTyqLMLXCaOMCWxDAawD/ZxnkDqoYbyWDZtTbYk8/sPt2oLui6dWDvs
	pbR1Bd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy41-00000000QK2-3pOV;
	Tue, 25 Feb 2025 16:45:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxiL-00000000CSp-33XU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:23:23 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PEsxG7025684;
	Tue, 25 Feb 2025 17:23:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wqgFWeoQivzhLETwW+Q6wbE8s0MXA+Zaes1DQ9N8L94=; b=OgoS/t3Lbxp32NRq
	naIljPbKwZjr091WEhth+xRTbwEvzSk/tLAsR8GGUbCX4EJcw45zSGkWEMsSAPA+
	0jtddvtuWP5j4x+EM/+zRbQ5H3tuh2T0m2tBFY5/xzcINPAj6K98NzjPP5CLF8Iz
	hjkTAM9heRqObmD4CLkTJUjb742v4ghuIoHFn5Dzl4p/lwrYH+dSK75Z4Jmd8rK6
	nSezAbmEvZT0YC6zTRBimbtDnvxlkax1p6AYWGCvDJhptSoGf+dsmLpHUrml1+Ca
	/K9GKj0gTA/WfKroXfTL3MjXE3YVlagShG2IX+/6axek79yU12tzinLvjxW6W80b
	zJImDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spvjyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 17:23:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2819E4006C;
	Tue, 25 Feb 2025 17:21:53 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3142E52CB63;
	Tue, 25 Feb 2025 15:58:26 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:58:26 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:58:25 +0100
Message-ID: <e309c016-4dcb-49e3-945e-54ddadfbddb8@foss.st.com>
Date: Tue, 25 Feb 2025 15:58:24 +0100
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
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250225-psychedelic-iguana-of-education-d5fff7@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_082322_067673_4D3DC1A5 
X-CRM114-Status: GOOD (  11.37  )
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



On 2/25/25 13:04, Krzysztof Kozlowski wrote:
> On Mon, Feb 24, 2025 at 07:01:47PM +0100, Fabrice Gasnier wrote:
>>  	}
>>  
>>  	return pinctrl_pm_select_sleep_state(dev);
>> @@ -246,6 +413,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_pwm_lp_pm_ops, stm32_pwm_lp_suspend,
>>  
>>  static const struct of_device_id stm32_pwm_lp_of_match[] = {
>>  	{ .compatible = "st,stm32-pwm-lp", },
>> +	{ .compatible = "st,stm32mp25-pwm-lp", },
> 
> No driver data suggests device is backwards compatible. Commit msg
> suggests not, so that's confusing.


The LPTimer PWM driver takes benefit of the MFD parent driver to feed in
data, e.g. 'num_cc_chans'. Number of channels is now variable, on
STM32MP25 (e.g. not a single channel). But it can't be hard-coded as
compatible data. (there's only 1 channel on earlier LP Timer hardware
revision).

The hardware controller is a bit different, hence the new compatible.

Best regards,
Fabrice

> 
> Best regards,
> Krzysztof
> 

