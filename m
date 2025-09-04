Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40873CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCYvGu8J749YsacYFZ64mlVUY/4z5SWgZr5PhsPAO44=; b=sfYnzbuCrTlPH2BKJkGWiDIvWA
	NXChQ636bk3P1fd+Is1leL6fuFZ6hS9LoEPijGODUJhluIqrX1I5Dd9f9oa4l6GmSvuBprbGAFPuY
	lcVbjhqlv/pXcfuolyX2t4yY3AgfOz3I/pZQeFmfCG25Hc+P3KZpJDfW1txAvwneVGimFTJYUqWoB
	uGuu0KjcYQ4SIUtv60crcpxX6R2Y2YPPL8Wr42bcT8aI+woNWg/hcttkNOJs1h+Lr6qgZAdK+1/YN
	o9xF/L+yd2WH6fC1mWaD+l7NGrT+UYThGEf/d5g+bmwh43fWaPEiNP+NjHCJk6Q/pgrXkIbCoT5KA
	cxXW3o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCm6-0000000Crys-18S6;
	Thu, 04 Sep 2025 16:25:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9dN-0000000BksH-0Yzr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756991053; x=1788527053;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ipAlB8lz4YhXVB/PahY2cp8VjIBql6JOV7ukszx0QqM=;
  b=fklESbusAgLPO3AelpDfpotW0Q7WGPtO86Px6gme3pbr6ljK9C/pEKhJ
   ciGSj8AvaIxZ/dq/u8iz7jSN7hHynFCyOHb5Hfswg02aaIrwf+viRcCZg
   z9nt+Cz3MxauJi1sqGTE5FAYGNpLvITpxUXhklcPp5J/w0bes8DLXx1ER
   lqsGVV/EpQfXRIYw0AFm+TrwGP2zL5Td6Mx8gOr3mp8JWIs0JkdqOTAD8
   UJABGUcSVUsxObYmfKwCq7zPiIfeZFrIw5JPVjXQeCxi2xarcw384TXrf
   eWvI4rSr2GenGBwqLplQtLKnPr1mHwwH1xNFpPxmEv4alI9X+ZzH6Ns0w
   A==;
X-CSE-ConnectionGUID: z3Jne31hRHOgHqAJosZYCg==
X-CSE-MsgGUID: GYbBTcCDRgO2KYf+NwHHtA==
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="277443901"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Sep 2025 06:04:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 4 Sep 2025 06:03:53 -0700
Received: from [10.171.248.16] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 4 Sep 2025 06:03:47 -0700
Message-ID: <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
Date: Thu, 4 Sep 2025 15:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>, Robert Marko <robert.marko@sartura.hr>
CC: <linux@armlinux.org.uk>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>,
	<luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
 <20250902100254.GD2163762@google.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250902100254.GD2163762@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_060413_399925_7F5BE838 
X-CRM114-Status: GOOD (  14.16  )
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

On 02/09/2025 at 12:02, Lee Jones wrote:
> On Wed, 13 Aug 2025, Robert Marko wrote:
> 
>> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
>> avoid needing to update depends in future if other Microchip SoC-s use it
>> as well.
>>
>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>> ---
>>   drivers/mfd/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 425c5fba6cb1..8f11b2df1470 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>>   config MFD_AT91_USART
>>        tristate "AT91 USART Driver"
>>        select MFD_CORE
>> -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
>> +     depends on ARCH_MICROCHIP || COMPILE_TEST
>>        help
>>          Select this to get support for AT91 USART IP. This is a wrapper
>>          over at91-usart-serial driver and usart-spi-driver. Only one function
> 
> Let me know when the deps are in Mainline.

Hi Lee,

I have tags from other maintainers, how about you give us your and we 
make this patch travel through arm-soc like the other ones?

Regards,
   Nicolas

