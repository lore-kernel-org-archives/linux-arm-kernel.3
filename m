Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A881BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuP2hz4+AAmK0hgkk1ltz/sdzsPjbchhks48Sx2DD3M=; b=rzUDAQ8oBnu7VMgh9dR+ypM4p2
	N8dEEXNAyGXpt1GU0z3NOAx5df1HhReNZPehUhEv8Jth4icf2LEUC7leqfyCwz0Oy5tbVemIFM5mf
	6Bulr2Fj3TK3NJga8oD1AS4OvqkB+dSPDBSTeCGo29G9DACGiSvWv5Ojh/wFlO/84b3qPgKwbrfhL
	zTweF55ZvCXCEV0m50UW99yg5vm2pAvyyxR6K0gSMuaGV+UcxvphYRwyO9UAgwH66OFC02wz75Ldz
	V8eEnAuVY2xmGSnc7XtWgU+JnjnisGTmEh5KBFdPY73TKh3BkxoH3bg1ucUARE4rja/xUVsE/mfYR
	ISDBUwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JbE-0000000HMkw-10fR;
	Fri, 25 Apr 2025 14:00:16 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IYR-0000000HBQ5-0N34
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:53:20 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7b9Ov005857;
	Fri, 25 Apr 2025 14:53:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yuP2hz4+AAmK0hgkk1ltz/sdzsPjbchhks48Sx2DD3M=; b=13kMQh3IKs5Bgb1s
	JKteJKieilegE2C1DugoLk1YyWfEDKw7R1oPQ+7oMP2wHmEj6Q7Jau2a9GIkSIUe
	+R3oO0hieOgT6eC8n63Ctx/zYYuIPA//LxRDRPZHa7O6hMcaWgES3NWy8ChhcvD4
	/Ns/6t9thac6hfd/EYYdZacVr5grSLwT6cl46Z+Hg7iXPMalBpY/j0fd2o2VoC+N
	osNiD60Qs5rvzSpzlpxALTZJkMxCnXNNVKj8DlwaLCSxysHDVRXDajFcye0+Eefm
	jN0faqt2jDTLdyj5/cTywRh5b15CGARz01oYw1Agloj2Caf4L/VbkoWbwUrYjGGR
	Wk6Z8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk3mkec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:53:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5872B40055;
	Fri, 25 Apr 2025 14:51:56 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 344329F78E9;
	Fri, 25 Apr 2025 14:50:08 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:50:07 +0200
Received: from [10.252.15.6] (10.252.15.6) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 14:50:06 +0200
Message-ID: <c78c1c19-cf11-4146-acda-fd435add6808@foss.st.com>
Date: Fri, 25 Apr 2025 14:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] mfd: stm32-lptimer: add support for stm32mp25
To: Lee Jones <lee@kernel.org>
CC: <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jic23@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
 <20250404144006.GB372032@google.com> <20250424130112.GD8734@google.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250424130112.GD8734@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.15.6]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055319_432220_5DF3BD0D 
X-CRM114-Status: GOOD (  13.96  )
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

On 4/24/25 15:01, Lee Jones wrote:
> On Fri, 04 Apr 2025, Lee Jones wrote:
> 
>> On Fri, 14 Mar 2025, Fabrice Gasnier wrote:
>>
>>> Add support for STM32MP25 SoC.
>>> A new hardware configuration register (HWCFGR2) has been added, to gather
>>> number of capture/compare channels, autonomous mode and input capture
>>> capability. The full feature set is implemented in LPTIM1/2/3/4. LPTIM5
>>> supports a smaller set of features. This can now be read from HWCFGR
>>> registers.
>>>
>>> Add new registers to the stm32-lptimer.h: CCMR1, CCR2, HWCFGR1/2 and VERR.
>>> Update the stm32_lptimer data struct so signal the number of
>>> capture/compare channels to the child devices.
>>> Also Remove some unused bit masks (CMPOK_ARROK / CMPOKCF_ARROKCF).
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>> ---
>>> Changes in V4:
>>> - Add DIEROK, ARROK status flags, and their clear flags.
>>> Changes in V2:
>>> - rely on fallback compatible as no specific .data is associated to the
>>>   driver. Compatibility is added by reading hardware configuration
>>>   registers.
>>> - read version register, to be used by clockevent child driver
>>> - rename register/bits definitions
>>> ---
>>>  drivers/mfd/stm32-lptimer.c       | 33 ++++++++++++++++++++++++++-
>>>  include/linux/mfd/stm32-lptimer.h | 37 ++++++++++++++++++++++++++++---
>>
>> At least the Clocksource driver depends on this.
>>
>> I need Acks from the other Maintainers before I can merge this.
> 
> Suggest you resubmit the set as a [RESEND] to re-gain traction.
> 

Hi Lee,

Thanks for suggesting.
I recently found I needed to add a small delay in clocksource driver. So
I just have sent a V5.

Best Regards,
Fabrice

