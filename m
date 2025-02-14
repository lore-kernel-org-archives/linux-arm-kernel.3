Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88E4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qw7XIK846oCUWiLOfnk5Jrq4uCGhW+CbWo1jUtxsbSc=; b=3MFx8PkqesedB0+lBKwNCbiw2B
	wh0udtd/8J3P9irlyvP+R4EZk2OE71xOxoIsjZA/Zb3IQRK0qbBmZpMdKCd9DgnGBk/b5bk5zVgyW
	jojg0kYe5UtyDki9OTMOFgN0F7/vGWnl/7zGix7Bnk8Ol9K4+BV0WR39ozJcLu3U7UDrDdZ/6EI3f
	PPlYE9JpoO5te+2RXRfUbs12EAkpPuD88eMlCNvq/kkwMp1kU/fd29AFall3Srzm32tDUT6i+ew9v
	gFOMJA3uff3v2TfWPZorle07lStFmmVl1SP9Ha9KkmS5YLcqAwG4D38mP1yKm/kADkM8ERTN8KMGH
	RnuQNnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tioqn-0000000Dm08-02F8;
	Fri, 14 Feb 2025 06:06:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiopK-0000000Dlkz-3hxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:05:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51E65E9V4158044
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 00:05:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739513114;
	bh=Qw7XIK846oCUWiLOfnk5Jrq4uCGhW+CbWo1jUtxsbSc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ho/Sxa1bQv3IKJlC684wTKz5EGQBl7q/G4t7WCcZ2uoZ2OesrcT78b/ESjjagB28v
	 r33YtHlV7Yp6EVrK9QTfMndgoyTHkrh38aJAY4zRDwTzLgmOviK11/T8qgY7g8kt0H
	 +JQOCqwyESXT09/V14jVNF7f5cgGZ/mYS6ZwegJE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51E65EVo053089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Feb 2025 00:05:14 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 00:05:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 00:05:13 -0600
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51E658er104524;
	Fri, 14 Feb 2025 00:05:09 -0600
Message-ID: <66f30c0f-dec8-4ad5-9578-a9dcc422355a@ti.com>
Date: Fri, 14 Feb 2025 11:35:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net 1/2] net: ti: icss-iep: Fix pwidth
 configuration for perout signal
To: Paolo Abeni <pabeni@redhat.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250211103527.923849-1-m-malladi@ti.com>
 <20250211103527.923849-2-m-malladi@ti.com>
 <3a979b56-e9d6-41c9-910b-63b5371b9631@redhat.com>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <3a979b56-e9d6-41c9-910b-63b5371b9631@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_220527_052965_8FB78EFB 
X-CRM114-Status: GOOD (  13.17  )
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



On 2/13/2025 4:53 PM, Paolo Abeni wrote:
> On 2/11/25 11: 35 AM, Meghana Malladi wrote: > @@ -419,8 +426,9 @@ 
> static int icss_iep_perout_enable_hw(struct icss_iep *iep, > 
> regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp)); > if 
> (iep->plat_data->flags &
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updqdzavl0dbisXOnfkDHxHqGlQUHEro3tgnljLa7x4DRPBIRKu8Nqm3bW1LeMtXFyqz6yM7_tLlrvUmslKj9m_IL0hUlNU$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 2/11/25 11:35 AM, Meghana Malladi wrote:
>> @@ -419,8 +426,9 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
>>  			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
>>  			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
>>  				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
>> -			/* Configure SYNC, 1ms pulse width */
>> -			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
>> +			/* Configure SYNC, based on req on width */
>> +			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
>> +				     (u32)(ns_width / iep->def_inc));
> 
> This causes build errors on 32bits:
> 
> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
> undefined!
> make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[2]: *** [/home/nipa/net/wt-0/Makefile:1944: modpost] Error 2
> make[1]: *** [/home/nipa/net/wt-0/Makefile:251: __sub-make] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
> 
> You should use div_u64()
> 

I see, thanks.
Can you tell me how can I reproduce this on my end for 32 bits.
Will fix this in v2.

> /P
> 


