Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18716E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzrvKgo1IyT6WHqjVcffuKcEuBSenNM/mQjrjgfYqx8=; b=so16QKDKIzDAfCvEVMeYSK0WFP
	+WDHBXQgeOCf511M6a895cagIQo7AO+RFyWzkVzQKCkrIxu4k4Izx7DDbmum+DGeLwn2qELpsQtpW
	TnnGpfSpH6BEs7JnABugmMoIi8MFaZdHu6pIKRihe4pWQS/7MZJ3GknMi8koxm0Fx7PkdkUiXHIuA
	Twd9xBwRhslaRe4jbYLnSOPfRNEsy+3TKyjJwH1EVXJVc82nV+ouaggi2rWC5iu2NAGIQ6uAdYFVu
	IXv8PTMhH88a7NM+oPJXX+hm6uRfFjP8o5ixr0zx+s7n+rfW+AwKm1hu3iX6zY78EAbF7VL0a1CTy
	LhU7ynWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYxL-00000006sEF-114W;
	Mon, 09 Dec 2024 08:17:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYve-00000006rsJ-27Vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733732143; x=1765268143;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZcPczIrFdqcCCIC/8LP2IK2yKWfNDzsDd20ms77e/Ew=;
  b=r923RaE+oewlSjsO7nudEcvXUE+r80VL5oSn+iH+y6Bl6gOYGRl7eqCy
   Prmwk1SuBTPUnEETIk1jBL/uGmo1MUE0p6QApHlBzbpAyTUpUrhF6Hi8A
   UZpPo6Tkov3rwd2TMYXt/rll9fbdqLLz7Xi99+1qFOe3mBTRUdTI2IeCX
   4Njn3oOM7x7Dypyzek1K1FXDJ/PfbWateToetodfG0GIbjtwS1bDSTs9r
   JrLdOvXVd8ijceHoYQFHkBFiBzPkI5aDzYEqWu48D7ViaZ7DFKGUBIwJf
   Slx42lj4aBAAqET6HcaAAeRzuW+WfdRCLoY2DZk4BQRHPOU8ID0pR2YWY
   A==;
X-CSE-ConnectionGUID: fximzRWUQzq03/rIjTMi1g==
X-CSE-MsgGUID: NpHfH2OzRRyYYCqOHeO4jA==
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="35290676"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Dec 2024 01:15:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Dec 2024 01:15:37 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Dec 2024 01:15:35 -0700
Message-ID: <af867f52-37f9-4caa-ab6e-8d7e409bbc87@microchip.com>
Date: Mon, 9 Dec 2024 09:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
 <32b1ae9d-f55b-43d0-bb24-1fd486440ab6@tuxon.dev>
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <32b1ae9d-f55b-43d0-bb24-1fd486440ab6@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001542_570914_61C14FB2 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On 08/12/2024 at 16:48, Claudiu Beznea wrote:
> On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Change how the Backup Unit Power is configured and force the
>> automatic/hardware mode.
>> This change eliminates the need for software management of the power
>> switch, ensuring it transitions to the backup power source before
>> entering low power modes.
>>
>> This is done in the only locaton where this swich was configured. It's
>> usually done in the bootloader.
>>
>> Previously, the loss of the VDDANA (or VDDIN33) power source was not
>> automatically compensated by an alternative power source. This resulted
>> in the loss of Backup Unit content, including Backup Self-refresh low
>> power mode information, OTP emulation configuration, and boot
>> configuration, for instance.
>>
>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> I've added the fixes tag, s/locaton/location, s/swich/switch.

Thanks for your help Claudiu. Regards,
   Nicolas
> 
> Applied to at91-soc, thanks!


