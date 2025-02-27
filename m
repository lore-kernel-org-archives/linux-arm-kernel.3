Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A82C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pua2zXp1jw7grNnA4fzr8f5cpwKZpduTsNicfAzkgmQ=; b=YvE4c3wpTnPOyzHGz+QTnBqx4F
	uhIusZPXwOGAitc0Vr2RzMYTnFWMuNLhTBYSer7MiqwBUCKVsMy+9k47ZX3/qzsqBQzBYuupGGaMT
	y7lIeW77zIfv491vCVns8UaEhoIAx8Kq8VuDzZN06DYI+Oi0Q0kbea5T68aStX8jCReTP5bUNKNA+
	yGQ8meAyS9a+PjfNRDy2tBTF6tU0+Arj2YMcJmtrynC/umh02lWK6gru9JWgFvkxKoZp3fq571AYo
	5XFIyjgSsDVkK6m/c4+NSym4qdWXcBhlWtFuFTjVPKkAvz95WWOAl3ZnfaQ9NF3JBNTmhE0Ln5Bu6
	sHWBPFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWjI-00000006Olg-0W4D;
	Thu, 27 Feb 2025 05:46:40 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWgK-00000006OJw-18J9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 05:43:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R5hPKN2268666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 23:43:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740635005;
	bh=pua2zXp1jw7grNnA4fzr8f5cpwKZpduTsNicfAzkgmQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c+Ux8MC4eV0fM8InaCXSdNF40HxIzMUiL1yfobXxQFc9jDVrYjB2/orVl2aseDbf6
	 R5/B/5upL7VWp4jgAhg+hLA23jxgeBJCRrGXLB6N06hXuHHRK09ysCeIoEdFPjD9ss
	 8TMxqG5oRK7t+bvbL4a+Hj0MFeMK/cvbWc1hbvoA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R5hPOo016976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 23:43:25 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 23:43:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 23:43:25 -0600
Received: from [172.24.27.144] (lt9560gk3.dhcp.ti.com [172.24.27.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R5hMcN038150;
	Wed, 26 Feb 2025 23:43:23 -0600
Message-ID: <f1d61696-a5c0-4727-ab52-526294a2a5f9@ti.com>
Date: Thu, 27 Feb 2025 11:13:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>
CC: <quic_bjorande@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        "Anwar, Md Danish"
	<danishanwar@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
 <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
 <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
 <1982291f-4a02-4ed2-b4bf-778a2fe0ad9e@ti.com>
 <a3fc706c-3825-49fc-beea-3fea7d9c0038@linaro.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <a3fc706c-3825-49fc-beea-3fea7d9c0038@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_214336_515064_D4751E51 
X-CRM114-Status: GOOD (  21.14  )
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



On 2/26/2025 5:36 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 12: 54, Malladi, Meghana wrote: > Hi Krzysztof, > > On 
> 2/26/2025 4: 18 PM, Krzysztof Kozlowski wrote: >> On 26/02/2025 11: 44, 
> Malladi, Meghana wrote: > > > On 2/26/2025 1: 35 >> PM, Krzysztof Kozlowski
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updgPX1FFo0b4GXEXdPDfwTBSgIATJM2ZirviWBzo9UAByA7dipk7rbevgVn7EQb6- 
> DBhdHMpW7WhdxsrgH8RrHp6HnyASM$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 26/02/2025 12:54, Malladi, Meghana wrote:
>> Hi Krzysztof,
>> 
>> On 2/26/2025 4:18 PM, Krzysztof Kozlowski wrote:
>>> On 26/02/2025 11: 44, Malladi, Meghana wrote: > > > On 2/26/2025 1: 35 
>>> PM, Krzysztof Kozlowski wrote: >> On 26/02/2025 07: 18, Malladi, Meghana 
>>> wrote: > Hi all, > > Apologies in >> case you are receiving this email
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the source 
>>> of this email and know the content is safe.
>>> Report Suspicious
>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>>> updq3RaPV007wGXFFrPD30z5a3GGYjpJweyhUcIfUTTaUs-8q0QpC4Yk9azBiFp7cBAf2Knk6fnVs4Fs-zRjTMEn8kmpiGo$>
>>> ZjQcmQRYFpfptBannerEnd
>>>
>>> On 26/02/2025 11:44, Malladi, Meghana wrote:
>>>>
>>>>
>>>> On 2/26/2025 1:35 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/02/2025 07: 18, Malladi, Meghana wrote: > Hi all, > > Apologies in 
>>>>> case you are receiving this email for the second time. > Any reason why 
>>>>> this patch hasn't been merged yet. Other than re-basing > this to the 
>>>>> tip, anything
>>>>> ZjQcmQRYFpfptBannerStart
>>>>> This message was sent from outside of Texas Instruments.
>>>>> Do not click links or open attachments unless you recognize the source 
>>>>> of this email and know the content is safe.
>>>>> Report Suspicious
>>>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>>>>> updgnZav1ue7gKXOnHOpH5hg8gLmw9Osqsqh- 
>>>>> KTLRTnBEurV_VetrG7mzU898vB_5xFrYgbRkkuuFMBobM-uhFAmUgccRSk$>
>>>>> ZjQcmQRYFpfptBannerEnd
>>>>>
>>>>> On 26/02/2025 07:18, Malladi, Meghana wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Apologies in case you are receiving this email for the second time.
>>>
>>> BTW, Arnd when responded with Ack described the process.
>>>
>> 
>> Yes, I wanted to re-confirm before posting it again (just in case).
>> 
>>>>>> Any reason why this patch hasn't been merged yet. Other than re-basing 
>>>>>> this to the tip, anything else which needs to be addressed to get this 
>>>>>> merged?
>>>>>
>>>>> I don't think you sent it to your platform maintainers, so no one would
>>>>> apply it. Usually people ignore emails they did not receive, although I
>>>>> am here an exception tracking missing-DT-patchwork things... :)
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> Hello Arnd/Krzysztof,
>>>>
>>>> Thank you for the replies :)
>>>> Was having ambiguity since this is not TI specific change. Wanted to 
>>>> confirm before re-posting. Will post v2 patch including TI platform 
>>>> maintainers.
>>>
>>> It is not TI specific? Then which upstream boards benefit from this if
>>> not TI?
>>>
>> 
>> This change enables generic HSR protocol support in the kernel which is 
>> required for HSR driver support in TI boards. When I said "not TI 
>> specific" - I meant this change is not internal to TI driver. Hope this 
>> clarifies the miscommunication from my earlier mail.
> 
> Yes, sure, but this defconfig change benefits and is sent for certain TI
> upstream boards, so it is TI upstream maintainers field. It still fits
> the "Submitting Patches for Given SoC" in SoC maintainer profile.
> 

Okay, I got your point now. So as long as this defconfig benefits TI 
SoCs, it should be sent with maintainer profile. I will keep that in 
mind for future patches as well. Thanks for clarifying this.

Best Regards,
Meghana

> Best regards,
> Krzysztof
> 


