Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0A2C77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id+f7kVLppAX20HAP2AURqNW1tLLgPJWhJTti78Nq48=; b=DpjgbmNoJ/GrWIckf4YbxEiyhD
	mvz8i04q0JNGcok7e7VjxqzgaYLfiwk4UK/fPiQSRaAg4j8o66K/ribNjj/f5vRjPrkh7cFrlut/N
	+i47wlSz0ayxWMCjJ49kb+z4g43rfsOsEqEdE85D2wj5VsrBRdG29fguD6163zDpwnbaJtdqCP6UT
	icGGqP7l96bl3QFp+kMOYp12rC2a7CaEGEOYc1CM87XTmN/+Y2jWcaWupZQKabAI4cBANWKdhthje
	EqDmnDogwc5HP9gmCzdzIUMkBQZdVOsSOGou8b9mf+EFvRN836N7eRitBMnwhYg2u2PwjpQxHKgMR
	A3W/m64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBT-0000000Dy5v-4B77;
	Thu, 19 Jun 2025 18:40:24 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI8e-0000000DcfR-2Jum
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:29:22 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-407a5b577f8so221274b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750350559; x=1750955359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Id+f7kVLppAX20HAP2AURqNW1tLLgPJWhJTti78Nq48=;
        b=oJcXH4iGOtr/JF9BoC4VOOPidghuq1085JA/VxYuoa44BEMR7LHrqIATcRSm4BjL5I
         nA2HTor6onDPORRQZvetQC37kAg2Up/t0iwUUAl3xMiPOp33NwWOhcQ5oeFzKasuXKWs
         YnUWWkMv8aUDkz6OqCcZcstvRn2BcZ1w7zJoKk2wVcW+tAGnmve+YGEH4purZnyEcuDr
         crfr0fS9/9Z05TgLrXxCB20OSkFwcgUbW2LG+8vp1c5cn1J6/8Gbay/fAJMFknr4Jy8C
         SdX56URc0wwpjWsy4sPuJ+/vaWDyfas7hlzp0ykEhTi4MLkDhhsq/dIMAEfIWylTus5m
         CcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750350559; x=1750955359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id+f7kVLppAX20HAP2AURqNW1tLLgPJWhJTti78Nq48=;
        b=cD7ppQBj+/N/qRxCb5VtfkY3HwJ/YsP5WAwOkufSUBsbrTKnnb+rEN7rDSxd0p1nQQ
         KcDYXUdVeyZQWCcwm9u7GVjMTMSLp2ncUiKThgl9gx0yfVmHiOktCZXf49+9TOA8mSzi
         vgnu6gVkmCIjXxRrLZTBdJy+V5ripN0AAELG9T1bJeafcK7ej5JhDdi7yQHSRR8/LTEP
         CfmgrVt76qrQectQdY+bSkx+ib79SiWCK9d4VibLz+kztWzzc1mLZGTVxbR47qUhpQhz
         Eo7juwCUkonxtlSco5yxfh703qd2aFoMouA0wPzcOJehnEOb0uZYlUxnDOzX6Hk/mrQc
         GT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUglzQLn9b5pvZXB9aKn7+t3mel/xmOlcG4iXZHXRGYoM3V/3RTswzTAKK3123Kc39A0xJk4MgMpsl1fXAjKA1z@lists.infradead.org
X-Gm-Message-State: AOJu0YyH/z2lc5OoszVKRmbwtYV98CLdqQxKGUZdmz+um37o0Kq2pCYJ
	rYJzuuLKRdpd/9uSAmi8mL5vX1OYC4+cLkKUdQ4KTryJr0Yigp5KACvOpB5G6NhvGxY3H/6uLYI
	05ScD
X-Gm-Gg: ASbGncslKE3AEU7Du8yojyLvlxkLhBCsTgksx6znB53hiVmRc9sdzl1x1R+gUvM7+lc
	IhYgrngMduoRv4Vye/Fsjr7T481Az5bZKQjhPyIgULhsfC5MCfN/72V06ME2QlAVHrgzUWTDZPd
	ojdraRO7X8WnOu8SULsvHDdQJvUvH2mc+vVGYqCnPY/bRGxl347qz/QhUdlPjyEzthi8sm9Pzhk
	si8kOPmfwjpBY2QygnUjMbkt0dvXJZQgQQK8cTtEgM0tkJoS8BiiicXcZyePgXG3+wi3bQlQoHj
	laoIwJt6nHT75dE90x4DaRYMkLo+ZBm4upiSGTvl7ENhhFjsZlOaSo1N6qq7D2NexLD3Fcs2xFa
	LyNif589eoworGOrSDjAYWI+CUEL4emFTWEHAEWg=
X-Google-Smtp-Source: AGHT+IE3wykgtpudCLPxyYXHgot19QH7CguFGEPEsZeTABHQ1Nd9aytQtOo9OtA4EGXFPZmqiX54mQ==
X-Received: by 2002:a05:6808:189c:b0:40a:56e7:1e59 with SMTP id 5614622812f47-40a7c17ecdemr15537482b6e.5.1750350559492;
        Thu, 19 Jun 2025 09:29:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5504:5211:6fc4:c093? ([2600:8803:e7e4:1d00:5504:5211:6fc4:c093])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a74172cb3sm2790979b6e.25.2025.06.19.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:29:19 -0700 (PDT)
Message-ID: <b27c6aab-e363-45df-8521-e85c2b3f4421@baylibre.com>
Date: Thu, 19 Jun 2025 11:29:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
 <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
 <cdeb54e8-0624-42de-bac2-25b151c37872@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <cdeb54e8-0624-42de-bac2-25b151c37872@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092920_830057_6A7596DA 
X-CRM114-Status: GOOD (  16.54  )
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

On 6/19/25 11:20 AM, Sean Anderson wrote:
> On 6/18/25 14:27, David Lechner wrote:
>> On 6/16/25 5:00 PM, Sean Anderson wrote:
>>> Add an example of the spi-buses property showcasing how to have devices
>>> on both the upper and lower buses.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>>
>>> Changes in v2:
>>> - New
>>>
>>>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>>>  1 file changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>> index 02cf1314367b..c6a57fbb9dcf 100644
>>> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
>>
>>
>> In addition to changing the example, we could also extend the
>> spi-buses property for this controller since we know this controller
>> has 2 buses.
>>
>>   properties:
>>     ...
>>
> 
> OK, but this property is for the slaves not the master. I'm not sure what the right incantation is.


I think using patternProperties, like in Documentation/devicetree/
bindings/spi/spi-controller.yaml

patternProperties:
  "^.*@[01]$":
    spi-buses:
      ...

> 
>>     spi-buses:
>>       description: 0 is the "lower" bus, 1 is the "upper" bus
>>       maxItems: 2
>>       items:
>>         enum: [0, 1]
>>

