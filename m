Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2A3C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei9n0mlSS+RGTUs8J62IILpUrlBM4z2gov+FvU4IE2M=; b=F/M1gkXxlCQYRttvgK4vT+iYXn
	qE/ngCwsCXoEXl+U0GLr7658Q/aAA4Wac/M0bZtnyig+av1eCZJUlT+X8QH81jH2UIJmQ0Dc7sTCr
	PPmhWR9SHMI6waheY29JXy8zrfysjzBTySZjCj1lnD+3QfimJ4Okj5dirDC7J3Hy61AQUVTdP5sQD
	85AjuPAKHU1lYwN7ZN696WWMebI8ePy9P717qeixsb1xqhK9Y2chPOzf6g7b2vn5DKrFrD7JcP4F2
	SfSymbhCnJr9DhBJmuxEc8xA6/Rr2HiXGQs4/hm6KkCJ45Moz/ApEixZqtC82uJ2JnJruaxU3P6/t
	ZS8UA3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ55O-0000000Gd70-3NZE;
	Fri, 13 Jun 2025 14:08:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4kt-0000000GYWZ-06lZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:47:40 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DB7mUP030978;
	Fri, 13 Jun 2025 15:47:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ei9n0mlSS+RGTUs8J62IILpUrlBM4z2gov+FvU4IE2M=; b=e9zj3QmwZlRjxEsa
	fHopqr4SFaF+DVyvbsh6ITrsy/VLyJfB/NPjT41IAjlqgnu4EyQqZ3Iqg4g1JUr1
	mu2E7lrj/oolb6LwgSgR/fHxGB95CYTStre9MZP4ae93ZjiaXLZw4zC2VkY/rRCr
	kW/nDiLYqdaEhu3vruKyVxvSvp1ppHtBs41ExJxJMvJRUIcnsGRaOpwJcltTaqIc
	cRSzwr2VR3hW2I+U4+qTUKqDIneClB8VVZOZw4VWsJbkwORPLXSw7P4HXtEOpCSP
	YCZlb1U3rJaJcBOHfLuFtcxCQWoOT5pgLRq9fBh5DEHRHRfvVGs/3IPPkwHJy6WI
	mhJttA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs364mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 15:47:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B8B04005A;
	Fri, 13 Jun 2025 15:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F05F2AE5D11;
	Fri, 13 Jun 2025 15:44:59 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 15:44:59 +0200
Received: from [10.252.9.77] (10.252.9.77) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 15:44:58 +0200
Message-ID: <c3208fec-53ac-46eb-907f-cc5b7a18b188@foss.st.com>
Date: Fri, 13 Jun 2025 15:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <wbg@kernel.org>, <jic23@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>, <lee@kernel.org>,
        <alexandre.torgue@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
 <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
 <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.9.77]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064739_572164_2672D50C 
X-CRM114-Status: GOOD (  18.08  )
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

On 5/15/25 11:24, Uwe Kleine-König wrote:
> Hello Fabrice,
> 
> On Wed, May 14, 2025 at 11:30:26AM +0200, Fabrice Gasnier wrote:
>> On 1/10/25 10:19, Fabrice Gasnier wrote:
>>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>>> new features along with registers and bits diversity.
>>> The MFD part of the driver fills in ipidr, so it is used to check the
>>> hardware configuration register, when available to gather the number
>>> of PWM channels and complementary outputs.
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>> ---
>>> Changes in v2:
>>> Address Uwe review comments:
>>> - Make MAX_PWM_OUTPUT definition less generic: STM32_PWM_MAX_OUTPUT
>>> - No need to initialize 'npwm'
>>> - refactor code, for *num_enabled to use same code path
>>> ---
>>>  drivers/pwm/pwm-stm32.c | 42 ++++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 35 insertions(+), 7 deletions(-)
>>
>> Hi Uwe,
>>
>> I think this patch still miss some reviews.
>> The first patches of this series have been merged.
>>
>> Is it ok for you to merge, or shall I resend separately ?
> 
> I have it still on my radar, no need to resend. I just have to find the
> time to look into it in more detail.

Hello Uwe,

Gentle reminder, I hope you may find some time to review this patch ?

Best Regards,
Fabrice

> 
> Best regards
> Uwe

