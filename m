Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4A7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5uY6jQqkeSl7uiVV27dk2e2ndRObWC4Qz6fFQdPqYA=; b=rXyGaGzSh2wo0hxpzP4S9FX850
	8+YRWCYgZb/jc1tklqWmlTdElqk5IsXyg4pFQIYzTVuR89k1wWh+f1uzsAid9r72USBTeqYb/nYL/
	tWY9p1obGHywWJ5/ILvTiz0pyIlrZP3QfWxItMKptJQ7wkLMFvlWZuVGsXW0YyDg9s24Yvb4GM+BC
	QD7UfJsWZqGARd4ghcyPWNyse21KeTCpyL+O2Kv/r00DSXX0qaJW/qsjTyuMl0tfhlDOjIoaEyxTe
	RfaFi4id9c154L5W4r5EfZyFuiNPV9UMol93sbvhQErXyE92hjecLdxUwgLP49lbNjFzt+h6Injev
	5Dfpjipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkde3-0000000B3f2-2aJi;
	Wed, 19 Feb 2025 06:33:19 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdZY-0000000B2kL-33tR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 06:28:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6SZ4Z212251
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 00:28:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739946515;
	bh=c5uY6jQqkeSl7uiVV27dk2e2ndRObWC4Qz6fFQdPqYA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wIw3KPRASNCXDogScJjdjJicLQXwLY1p9c6FSca/g2JoLV6dcfOTPC4ly5vOI9rSy
	 1gp3ekA0gcWHpGXxWYjisSmGLIQoSCYNCjAkMQf61qlT/czEovbNoQLyPGax3rxV2r
	 l3YI7HzoQ5HmrfHunL4iT79IoByDBv/wQlLhLnQg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6SZdH003119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 00:28:35 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 00:28:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 00:28:35 -0600
Received: from [172.24.20.199] (lt9560gk3.dhcp.ti.com [172.24.20.199])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6SUMb081700;
	Wed, 19 Feb 2025 00:28:31 -0600
Message-ID: <09b55ba7-d7a2-46dd-a64c-56f2c02c8552@ti.com>
Date: Wed, 19 Feb 2025 11:58:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net 1/2] net: ti: icss-iep: Fix pwidth
 configuration for perout signal
To: Simon Horman <horms@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250211103527.923849-1-m-malladi@ti.com>
 <20250211103527.923849-2-m-malladi@ti.com>
 <3a979b56-e9d6-41c9-910b-63b5371b9631@redhat.com>
 <66f30c0f-dec8-4ad5-9578-a9dcc422355a@ti.com>
 <20250216161158.GH1615191@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250216161158.GH1615191@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_222840_857332_5D8F64D0 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Simon

On 2/16/2025 9:41 PM, Simon Horman wrote:
> On Fri, Feb 14, 2025 at 11:35:07AM +0530, Malladi, Meghana wrote:
>>
>>
>> On 2/13/2025 4:53 PM, Paolo Abeni wrote:
>>> On 2/11/25 11: 35 AM, Meghana Malladi wrote: > @@ -419,8 +426,9 @@
>>> static int icss_iep_perout_enable_hw(struct icss_iep *iep, >
>>> regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp)); > if
>>> (iep->plat_data->flags &
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the source
>>> of this email and know the content is safe.
>>> Report Suspicious
>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! updqdzavl0dbisXOnfkDHxHqGlQUHEro3tgnljLa7x4DRPBIRKu8Nqm3bW1LeMtXFyqz6yM7_tLlrvUmslKj9m_IL0hUlNU$>
>>> ZjQcmQRYFpfptBannerEnd
>>>
>>> On 2/11/25 11:35 AM, Meghana Malladi wrote:
>>>> @@ -419,8 +426,9 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
>>>>   			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
>>>>   			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
>>>>   				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
>>>> -			/* Configure SYNC, 1ms pulse width */
>>>> -			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
>>>> +			/* Configure SYNC, based on req on width */
>>>> +			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
>>>> +				     (u32)(ns_width / iep->def_inc));
>>>
>>> This causes build errors on 32bits:
>>>
>>> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
>>> undefined!
>>> make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
>>> make[2]: *** [/home/nipa/net/wt-0/Makefile:1944: modpost] Error 2
>>> make[1]: *** [/home/nipa/net/wt-0/Makefile:251: __sub-make] Error 2
>>> make: *** [Makefile:251: __sub-make] Error 2
>>> ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
>>>
>>> You should use div_u64()
>>>
>>
>> I see, thanks.
>> Can you tell me how can I reproduce this on my end for 32 bits.
>> Will fix this in v2.
> 
> Hi Meghana,
> 
> FWIIW, I was able to reproduce this problem running the following
> on an x86_64 system:
> 
> ARCH=i386 make tinyconfig
> 
> echo CONFIG_COMPILE_TEST=y >> .config
> echo CONFIG_PCI=y >> .config
> echo CONFIG_SOC_TI=y >> .config
> echo CONFIG_TI_PRUSS=y >> .config
> echo CONFIG_NET=y >> .config
> echo CONFIG_NETDEVICES=y >> .config
> 
> yes "" | ARCH=i386 make oldconfig
> 
> ARCH=i386 make -j$(nproc)

Thanks for sharing this, I was able to reproduce and fix this locally.


