Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AEEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRcCr0UxfopUNgxK+5pqGpdPNVgXj21wPiyLC3kd8PM=; b=Dy/EA+djuS3BRoUWPUIkNO/rY9
	dagqbJ61UbvrdS+MlXlsV11AsBzGlph6pRrrCvqdQxIx75bBhRUFV8wJW/v+v7P2oXo9NbuQ+KY1a
	Ml1T9Vqv0cd3TsHKzEV1tRmwrhzOBGy41tdi90UJ9fL/W4/M1al0HVtCZrSNAD1jIfqdZh97dFSqf
	sFu1Ss+vvAFapoDxecRdFQ7mkJzj9chUZ9DibLEtBPXCHiTJ1ISXzmT1+N5eNDLDbHWZTz3n7i6XS
	4D4+u6caMtYyQ5g4HNWZeTex3OWyWaa7ew9CyJOwrY5YAekymI/sm/qraZhOwgI6vv/giEE+Vl4HP
	xw6OtOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00bP-00000006adF-3Xgm;
	Wed, 02 Apr 2025 16:06:07 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Ze-00000006aQ6-0pvI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 16:04:19 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3f8d2f8d890so3970753b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743609857; x=1744214657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YRcCr0UxfopUNgxK+5pqGpdPNVgXj21wPiyLC3kd8PM=;
        b=hQz5WSScrOAX9tuQWYYZZKaWLAntdhhGIvzpzmyDwu72A/oD3N8otAw1IobUhChcsD
         p2U82ixBKun4vC+p0M3iVx6i2CQjuqlk3W8oMoeNlA4K5WsPOQoA9RiJXg6+n77yrMqX
         6qsBGrslV2Ek2of29TCGjxnoalhrnC+EOz97U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609857; x=1744214657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRcCr0UxfopUNgxK+5pqGpdPNVgXj21wPiyLC3kd8PM=;
        b=plnilFhUGEB6nIHPVJyQamvb6+Ni5icHygUidq+HuZKkL6mfnEYKpf33k+SYTUTtDm
         Ak8hw8Zl5IODOlmyxRXikLJye3UbG6Jv/lckH1T1suQK+HWk/8OE8AObomlh08RPJjI6
         in0EMoTBy8FbLfFrktTatPe27+WcMKYHo0Dc3eEt20KIzqapGPKTPYCrmVPqqVh5lfzl
         wT7ttWbF4Uxr9SHvS1kSXut+ioL7tqp8QB0mBrjf+0o9QfwJ7Od+sTIt3cS761RMkstf
         JOkix6O9ugcIqCxNuTuz+zfF+xc+8jy1nOLHPqMjXHJHlry0AMQDAZlwv2+u4Cc2iC8f
         So3g==
X-Forwarded-Encrypted: i=1; AJvYcCUkSLxAlENxVsylGROEXxR6MHCanOk9jS4odrNt2h4qiO22Mqh8zNUL4bTqkkiczhcS+ELVJA0nw8ec0A7eQ5bz@lists.infradead.org
X-Gm-Message-State: AOJu0YzUr+Rlpmq2j0Huds1VI6vYEX6G/GzruZ4VgMXtE6r4Vxjh7CxJ
	znZcDJpjNv9uaTpVvXobevzNE0VSOpmpxc/AszxpaxtJBdGgvj0Haj4HGcGCnw==
X-Gm-Gg: ASbGncuA/S42h1rKQEshtpeiwUtEsBCaE6Oyq7y7LklGyiVt43vQj5OiRGtelR+12Ur
	FuoR+ILn9iDFxXj1UjtgJQg9UqqO4Pui8Fqz29qV0nTfI3JqPLmSQWE76F3dvGgIY2N/nCBWA3P
	3gfyjGp9jlBWniRxPxNQ6xmvTObG0V3f8cqzwi9XrpOQ+Uc1QC4xHiJTtW6bstejtlhjS/Qg1j3
	d7HxW2iGjPy92BknTL7L3TjqJ6bt5NfVZiup4PCEJ57kl9hIS1F+0alu6yPLng/UJgrKVDDJIo3
	nSUO3Bph3aHzj4avJLO0VrgIQPRbyKmp1y+CwyjRm0iyo/TeYPxp7UJmqv92DoyqvR+/e4z0jzb
	rfKjpDX2E
X-Google-Smtp-Source: AGHT+IHPcEIEeitdzKDC8eD3T4OZh19nJpylEp0BpW6lGH0e8ZiOIghhnDLC5eL8MJ+Po1Uy950RiQ==
X-Received: by 2002:a05:6808:1524:b0:3f9:43dd:a054 with SMTP id 5614622812f47-3ff0f5f4c6dmr11055882b6e.34.1743609857169;
        Wed, 02 Apr 2025 09:04:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff0529650esm2399237b6e.48.2025.04.02.09.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 09:04:15 -0700 (PDT)
Message-ID: <92d95675-5d4a-4bc1-b2a2-8f2f1668a640@broadcom.com>
Date: Wed, 2 Apr 2025 09:04:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: bcm2835: Restore native CS probing when
 pinctrl-bcm2835 is absent
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
 <CAMRc=MeiALzO3XAmH9BLjxrB3EA1br1tpzHd5Qucw2NCVQ2q7g@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CAMRc=MeiALzO3XAmH9BLjxrB3EA1br1tpzHd5Qucw2NCVQ2q7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_090418_423909_C7EE9414 
X-CRM114-Status: GOOD (  29.65  )
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

On 4/2/25 04:44, Bartosz Golaszewski wrote:
> On Wed, Apr 2, 2025 at 1:37 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> The lookup table forces the use of the "pinctrl-bcm2835" GPIO chip
>> provider and essentially assumes that there is going to be such a
>> provider, and if not, we will fail to set-up the SPI device.
>>
> 
> Yeah, the consumer driver itself is an unfortunate place to define the
> provider data. This could potentially be moved to gpiolib-of.c quirks.
> 
>> While this is true on Raspberry Pi based systems (2835/36/37, 2711,
>> 2712), this is not true on 7712/77122 Broadcom STB systems which use the
>> SPI driver, but not the GPIO driver.
>>
>> There used to be an early check:
>>
>>         chip = gpiochip_find("pinctrl-bcm2835", chip_match_name);
>>         if (!chip)
>>                 return 0;
>>
>> which would accomplish that nicely, bring something similar back by
>> checking for the compatible strings matched by the pinctrl-bcm2835.c
>> driver, if there is no Device Tree node matching those compatible
>> strings, then we won't find any GPIO provider registered by the
>> "pinctrl-bcm2835" driver.
>>
>> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/spi/spi-bcm2835.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
>> index a5d621b94d5e..5926e004d9a6 100644
>> --- a/drivers/spi/spi-bcm2835.c
>> +++ b/drivers/spi/spi-bcm2835.c
>> @@ -1226,7 +1226,12 @@ static int bcm2835_spi_setup(struct spi_device *spi)
>>          struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
>>          struct bcm2835_spidev *target = spi_get_ctldata(spi);
>>          struct gpiod_lookup_table *lookup __free(kfree) = NULL;
>> -       int ret;
>> +       const char *pinctrl_compats[] = {
>> +               "brcm,bcm2835-gpio",
>> +               "brcm,bcm2711-gpio",
>> +               "brcm,bcm7211-gpio",
>> +       };
>> +       int ret, i;
>>          u32 cs;
>>
>>          if (!target) {
>> @@ -1291,6 +1296,14 @@ static int bcm2835_spi_setup(struct spi_device *spi)
>>                  goto err_cleanup;
>>          }
>>
>> +       for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
>> +               if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
>> +                       break;
>> +       }
>> +
>> +       if (i == ARRAY_SIZE(pinctrl_compats))
>> +               return 0;
>> +
>>          /*
>>           * TODO: The code below is a slightly better alternative to the utter
>>           * abuse of the GPIO API that I found here before. It creates a
>> --
>> 2.34.1
>>
>>
> 
> The fix is good for now but I'd still try to move this out of the
> driver at some point.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, I will see what I can do on that front, but if you don't hear 
from me in the next few weeks, don't hesitate to ask again :)
-- 
Florian

