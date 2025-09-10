Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B335ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cD2RvLMG+55MKMTaVj+gRkDNeyhSX2LoO55xvqxN41M=; b=4GcTodsqqSjfrCevHJlhvhyTj6
	BUWuYPwyr0BQT05lfYrNVstGmD4czCuqzq/eFWrqu8jAXyaqnH481DalmU7icMtOnWOOJJziU0HLB
	1KgOQAHH1vKXdNBn9v2NInRal9Z0rX1HZf8VVfUQ/1RdUuBBUv5juVYp6PfZb/FaFYDv9q4zgdgW+
	R+O+cXaO1pLGoLpmEb1/FsoENP7PxM9p4+wG0bUe7ssvkuRHGl71GV+RkVuGo84vyb3y0NvcZ1vEm
	sZGoO2FhR4dz1gABKq782aN4d9xS3q2hpj/TrXRFYqbX9D8gM74RG0Fl5sfvNNvrSbKlEv0MgV+6D
	00NZ0TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOR9-0000000FjQ1-0RCe;
	Wed, 10 Sep 2025 17:16:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOR6-0000000FjP5-19HX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757524609; x=1789060609;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=LWiTpviXtSxA2uLJhCTluREzykCtzO584HqazV0nCCw=;
  b=2sKK+59eae+a6yNmVK9XYQkGOtmWHDssyBsuh9KGe5ESnPLGn2Wp4yKn
   ETq9vwJDibNkyC9scR/Ph/qByCqPS66uNl8zjCvslAoBEIsLvZy74SGxq
   6lB8oq8ebuFX4Ys48p4vAACQfKiyJCf3nhEQldyzl7g1qWz5ZnA9edx3R
   TWdVhCfbWKCJAgFlDFurQaRIGaH7XmDqgh8A0G42YkfEgzoEJVc/nFVzP
   xSEgMmjXryflb8KZGDcGLzhTgBIIC1mzQO0YmokshEJA//5U7qqubns/T
   QHLxhX+ejWSVEhcErz2+Nc1jr67aVmfGqutTRL+EQljOcUpHPlvAfbBqp
   A==;
X-CSE-ConnectionGUID: GzHJBcSSS/ufTmRbnewvdg==
X-CSE-MsgGUID: J9J1N0KkTMGJXEg7AK49uA==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="277704208"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 10:16:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 10:16:04 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 10 Sep 2025 10:16:04 -0700
Message-ID: <fa5d44ca-d1ea-4c72-a998-b10f098b25f8@microchip.com>
Date: Wed, 10 Sep 2025 10:16:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
 <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
 <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_101648_543924_D11F35CF 
X-CRM114-Status: GOOD (  20.52  )
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

On 9/9/25 23:25, Alexander Dahl wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Ryan,
> 
> Am Wed, Sep 10, 2025 at 08:20:28AM +0200 schrieb Alexander Dahl:
>> Hello Ryan,
>>
>> Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>
>>> Add the USER button as a GPIO input as well as add the LEDs and enable
>>> the blue LED as a heartbeat.
>>>
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>> index f091cc40a9f0..2fe34c59d942 100644
>>> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>>> @@ -11,6 +11,7 @@
>>>  #include "sama7d65-pinfunc.h"
>>>  #include "sama7d65.dtsi"
>>>  #include <dt-bindings/mfd/atmel-flexcom.h>
>>> +#include <dt-bindings/input/input.h>
>>>  #include <dt-bindings/pinctrl/at91.h>
>>>
>>>  / {
>>> @@ -26,6 +27,42 @@ chosen {
>>>             stdout-path = "serial0:115200n8";
>>>     };
>>>
>>> +   gpio-keys {
>>> +           compatible = "gpio-keys";
>>> +
>>> +           pinctrl-names = "default";
>>> +           pinctrl-0 = <&pinctrl_key_gpio_default>;
>>> +
>>> +           button {
>>> +                   label = "PB_USER";
>>> +                   gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
>>> +                   linux,code = <KEY_PROG1>;
>>> +                   wakeup-source;
>>> +           };
>>> +   };
>>> +
>>> +   leds {
>>> +           compatible = "gpio-leds";
>>> +           pinctrl-names = "default";
>>> +           pinctrl-0 = <&pinctrl_led_gpio_default>;
>>> +
>>> +           led-red {
>>> +                   label = "red";
>>> +                   gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>> +           };
>>> +
>>> +           led-green {
>>> +                   label = "green";
>>> +                   gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
>>> +           };
>>> +
>>> +           led-blue {
>>> +                   label = "blue";
>>> +                   gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
>>> +                   linux,default-trigger = "heartbeat";
>>> +           };
>>> +   };
>>
>> The label property is deprecated.  Please use the properties "color"
>> and "function" for new boards.  See devicetree binding documentation
>> for LEDs.
> 
> From a quick glance, this seems to be an RGB-LED, so I would suggest
> to not model it as three distinct LEDs, but make use of the
> "leds-group-multicolor" feature, example:
> 
>  59         multi-led {
>  60                 compatible = "leds-group-multicolor";
>  61                 color = <LED_COLOR_ID_RGB>;
>  62                 function = LED_FUNCTION_INDICATOR;
>  63                 leds = <&led_red>, <&led_green>, <&led_blue>;
>  64         };

I see, I was not aware of this feature. This would combine all of the
LED pins into one RGB light correct, it seems from sysfs that this is
the case.

Would having the default-trigger="heartbeat" still be allowed for the
led-blue node or should that be moved into the multi-led node? From the
bindings it seems that the default trigger is still in the gpio-led nodes.

Best,
Ryan
> 
> Greets
> Alex
> 
>>
>> Thanks and greetings
>> Alex
>>
>>> +
>>>     memory@60000000 {
>>>             device_type = "memory";
>>>             reg = <0x60000000 0x40000000>;
>>> @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
>>>             bias-pull-up;
>>>     };
>>>
>>> +   pinctrl_key_gpio_default: key-gpio-default {
>>> +           pinmux = <PIN_PC10__GPIO>;
>>> +           bias-pull-up;
>>> +   };
>>> +
>>> +   pinctrl_led_gpio_default: led-gpio-default {
>>> +           pinmux = <PIN_PB15__GPIO>,
>>> +                    <PIN_PB17__GPIO>,
>>> +                    <PIN_PA21__GPIO>;
>>> +           bias-pull-up;
>>> +   };
>>> +
>>>     pinctrl_sdmmc1_default: sdmmc1-default {
>>>             cmd-data {
>>>                     pinmux = <PIN_PB22__SDMMC1_CMD>,
>>> --
>>> 2.43.0
>>>
>>>
>>


