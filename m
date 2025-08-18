Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC54CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrMH3SB1Lk0TWtcGskbizL8CHJwognrV8tAWHyAvW4Q=; b=n3jhgCNTvNefCPOKW6n1pm4mzQ
	00YAHLlG8ZIXbgxyo7tT/a+DU5tOY8r5mGWmngNj1ap7mc2MnpcVYrb7eaNdTF3r0zuT6z/u5AsXH
	fwg7gSNAsWoGudEC4Z/QBiN4MsEOpNlDDSFjZT4P+kMpkI6VFdRl74yPSf+es2Ai5yMl6QvaNXHoV
	jc+CNrNg/R4gOiM34nb9IY/OtRrxzRbIbPJRAb8JmzN5l6ZzVjU0blxiVnap9N/82HaoUOFTUx7Om
	rNuBIsMBBzv0GM1fQi6rH13Ty4IESa5RUD0gHH/WPesQhlWKxIlzJJ7gmMREqx7iGBE+Kqo4De573
	3j0yqAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ay-00000007htU-3ZMF;
	Mon, 18 Aug 2025 14:12:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0TK-00000007gkL-1an4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 14:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SrMH3SB1Lk0TWtcGskbizL8CHJwognrV8tAWHyAvW4Q=; b=g61lq3WT/byG/B/zWrtJ3rdDGh
	4MpvXrRL3rXwQA+TfJrpW26gWBHKCz06vHtLFjMq1+zQqa1ZkmdMnNcrbaP5cl6DGj8fRdt8vKAWK
	nh56LzrrUnRVMZyuQwC3QVHhK2QOJS+cbKRSn36gB0jg6KQGtP9k9krvDx8ts4aheIW+97yQwR2qE
	JOm04AYyWf6aaX3mbohXQ5fPMHWS1KsWUNFeOm4a5wkxBVlhbD+vPt/G0uoZmyA3rHEqIZdWbaTAh
	np1Zu8WUfLpxm8yh/1hem79Xb2tyFYJ6004j0xe2d6TXNyCZEozKk4DB/37MWRl/q2doWamkzq0lM
	TWujD4+w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0TG-0000000HOcf-44Vf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:04:24 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IDFlnc021385;
	Mon, 18 Aug 2025 16:04:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SrMH3SB1Lk0TWtcGskbizL8CHJwognrV8tAWHyAvW4Q=; b=LSkl7hrwGpJl1uPA
	IrjZ+Qwc1jbo+MVCSaB5vRbb8wdQQR77lPH5ESudCq+I5qggaWEX24lNvAmNtaDx
	QoOdOU+pCtS2hYv4yDwundMwZUCtCGYc1lHhfzTaMOe+K+TXOy4NnrrtmOncAIIL
	DOsyrNL0ULZBcmgsOwyjgwK50zAKV6XuW3yU/c4sN0smn1tMfdR/CFstFmN0NpaW
	0vgEHiMbdByKcEeT+zYJH4ph6LeQTV3tdHYAI9IEKwHH03h1zYCtdMoOw4Mkr9lj
	jp6kU5ewO+U1dGUbCiLYiVkz5CLvSImFslxncyKpX0s5Y27kW1le8ab7S++KQ3PK
	oysCLA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmmefk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 16:04:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D7E640048;
	Mon, 18 Aug 2025 16:03:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFDFA7383ED;
	Mon, 18 Aug 2025 16:02:48 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 16:02:47 +0200
Message-ID: <c390d61f-7f07-43d5-b212-92a5936dc16a@foss.st.com>
Date: Mon, 18 Aug 2025 16:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: sti: removal of stih415/stih416 related
 entries
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Alain Volmat <avolmat@me.com>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
 <20250714-sti-rework-v2-2-f4274920858b@gmail.com>
 <b80cc04f-aa80-4124-97de-846bebc271a2@foss.st.com>
Content-Language: en-US
In-Reply-To: <b80cc04f-aa80-4124-97de-846bebc271a2@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_150423_131028_D5043B3D 
X-CRM114-Status: GOOD (  13.77  )
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



On 7/28/25 11:25, Patrice CHOTARD wrote:
> 
> 
> On 7/14/25 15:49, Raphael Gallais-Pou wrote:
>> From: Alain Volmat <avolmat@me.com>
>>
>> ST's STiH415 and STiH416 platforms have already been removed since
>> a while.  Remove some remaining bits within the mach-sti.
>>
>> Signed-off-by: Alain Volmat <avolmat@me.com>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>>  arch/arm/mach-sti/Kconfig    | 20 +-------------------
>>  arch/arm/mach-sti/board-dt.c |  2 --
>>  2 files changed, 1 insertion(+), 21 deletions(-)
>>
>> diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
>> index b3842c971d31b80edaf88ab907f4377bea0a2af5..e58699e13e1a55ce46e68908c7ef51e18b040dc9 100644
>> --- a/arch/arm/mach-sti/Kconfig
>> +++ b/arch/arm/mach-sti/Kconfig
>> @@ -19,31 +19,13 @@ menuconfig ARCH_STI
>>  	select PL310_ERRATA_769419 if CACHE_L2X0
>>  	select RESET_CONTROLLER
>>  	help
>> -	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
>> +	  Include support for STMicroelectronics' STiH407/10 and
>>  	  STiH418 family SoCs using the Device Tree for discovery.  More
>>  	  information can be found in Documentation/arch/arm/sti/ and
>>  	  Documentation/devicetree.
>>  
>>  if ARCH_STI
>>  
>> -config SOC_STIH415
>> -	bool "STiH415 STMicroelectronics Consumer Electronics family"
>> -	default y
>> -	help
>> -	  This enables support for STMicroelectronics Digital Consumer
>> -	  Electronics family StiH415 parts, primarily targeted at set-top-box
>> -	  and other digital audio/video applications using Flattned Device
>> -	  Trees.
>> -
>> -config SOC_STIH416
>> -	bool "STiH416 STMicroelectronics Consumer Electronics family"
>> -	default y
>> -	help
>> -	  This enables support for STMicroelectronics Digital Consumer
>> -	  Electronics family StiH416 parts, primarily targeted at set-top-box
>> -	  and other digital audio/video applications using Flattened Device
>> -	  Trees.
>> -
>>  config SOC_STIH407
>>  	bool "STiH407 STMicroelectronics Consumer Electronics family"
>>  	default y
>> diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
>> index 488084b61b4acafb569ee9c51f5769393d55a9ce..1aaf61184685d754de57b487aef9a6b45a759b23 100644
>> --- a/arch/arm/mach-sti/board-dt.c
>> +++ b/arch/arm/mach-sti/board-dt.c
>> @@ -10,8 +10,6 @@
>>  #include "smp.h"
>>  
>>  static const char *const stih41x_dt_match[] __initconst = {
>> -	"st,stih415",
>> -	"st,stih416",
>>  	"st,stih407",
>>  	"st,stih410",
>>  	"st,stih418",
>>
> 
> 
> Hi Raphael
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
Applied to sti-next

Thanks
Patrice

