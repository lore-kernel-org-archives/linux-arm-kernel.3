Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFFECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2QWqrDHNaCM0EKufj47pbE+xenKx4d12hE7vL2Dp8o=; b=PG7WZ50w1ae2jEs/nz7NNc0SyT
	9bD/Zy5165NURPczmopHzirkoutJHsuIxcbwHkRwZg/LA03HkaymwvhQNcFFoCPN3DRd+AY2+OtWm
	7KqqmYH1CIrH4fKnnquo2XWK6XJqLxt9ZUxtuu5gsxIeq9bE8QEpg9q9NOEehus6fTJ7UtaCOvs60
	AI0dpP9HZqKJsLLjmJKcPd5v4l0Z+0buM8OwzTtQNvWgjITq7jrFGBRQUw7j+IoK+zyVJeeMviQs4
	jyRoZIobHubd4TQh4vCt2gr/T8piFlyyP1ApT7S1u3/nwhElQjJPUOMwva45zt+S0da0GAtY5JabR
	U2kkDSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ru1-00000000k1O-1ubW;
	Mon, 06 Oct 2025 20:33:49 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rty-00000000k13-44jA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 20:33:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57a604fecb4so7058312e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759782824; x=1760387624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2QWqrDHNaCM0EKufj47pbE+xenKx4d12hE7vL2Dp8o=;
        b=VvdPOuKYnsWGMPhL2DQ5oSYo4wXS5Bc9wmI8HmxQPYTd6kmA4HnwOQh2c5z/dQkho9
         nJUEturpIBl9VZFfKuwwx91WLCYNtwwflC115DJ06ihsRqqugAvUbrsX6bKIpjgMXAo+
         5ytRx6kuHNNjkSTTjKrgHK+EFKuYKye4PJr1OZgiY/b17CJiAEd/Qo4IEnN94G19fui1
         bKCoh2MsIfF0ibhnfvPBFWZ9t8OdNMziIveiR1SYPYrhUt5x6DMnUGssLLU7lYk4y2u1
         vvgSlhcQ5NaSKbfVVWdIH1pED427iH+gsVQgzidg5flS7gW9zM3SsmDDGBWy5hqrIW2b
         Vhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759782824; x=1760387624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2QWqrDHNaCM0EKufj47pbE+xenKx4d12hE7vL2Dp8o=;
        b=pjuh11OtJCI5lzOTPvOROsnA47mFMyhnTQwfjn2OMClXlSAO7kigWMRSbd9xfHyC9l
         WzcvX/EyB+zFTunJ+6QyNWirEYKpXnScAewQqnzu/7NMlxnEAcHZiSsAd3cgNTcSQAfr
         pJ+0/D3F9Vpn1bpdaa29YjReLTMLgY8xpk86JkR7Xo0zNI6ztqYXXexhKCav6YnWt2Ia
         fDU8Al3ZqaQeHeHt1AKWe4l8wJltJXxOTMGnWh7m1541f6pvvbJxypZgZs7kOKRAwuD/
         6go5PyBOoUSi0gHXHtPsetUsYuDlpXOq4jjcyiQjExuwIFAYiA62Qm4kSuUXAAHywLOh
         5gTA==
X-Forwarded-Encrypted: i=1; AJvYcCUHUcpMMB/EZHUH1UQkkQrLjiJxZ04IxO4biVLPboA0ht9SRucYYmVrsX2v0oB0IHDCUZ1QozSwsEj9qLLOIwfx@lists.infradead.org
X-Gm-Message-State: AOJu0YyeSXpYPPpI1XJ9/7ZxXRTouvRJtssDcMhBGnUQvDl/EZrkCZSI
	do2sNNK4KVQbN6QzV6lef2Me4Vbik1Vdw/OUo5mZ/Ow7IDSe7IfCo9Lc
X-Gm-Gg: ASbGncs9m9an6PetpIa1OslbblPiekGZRm87/BHRMuCjpP4ewo4FvkOFfHr3c0u649t
	xvDt6waZ023NUuHxcEOEUr3Gx9/DZgD86lA7La0r1Tl+kZZq9L9Ok1BKo7D1Gv0VVv+0yNFKlmi
	7Jkn40/EfLbzsyeBbd2iUqU1NG6I1b1XpOMRgTZKoonORnDO09qT8rQg9ZHyRtOt/7b1gIML6qp
	oWPUAV+/bZaIJf7bvaXP6haZZBoDBWCwLkJ1I/v+JGuFhikn/xeZD7UqZSitraREpz5WGteB1Ph
	SzFkxbS2uV570MN/v3GpsT8OTeWHauFxsfHvJtTRCIj4oAeYqsMKlOaohiey45n/3kmw0ec7ZPl
	CWUFbnTItfrFZfUQRh1MYf4uMcJ/sST/7azdsrzxZlLA=
X-Google-Smtp-Source: AGHT+IGP7H4CeQgnqwLaIvURAOJuF89I16Suj4RwwpNnlJOSc2xPjhQOIbGb5BfPZwbLhB8/VYyAYQ==
X-Received: by 2002:a05:6512:b9a:b0:577:f5cf:ce5e with SMTP id 2adb3069b0e04-58cbc1af20fmr3994399e87.45.1759782824123;
        Mon, 06 Oct 2025 13:33:44 -0700 (PDT)
Received: from [192.168.33.7] ([89.151.31.85])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b0118d863sm5360178e87.70.2025.10.06.13.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:33:43 -0700 (PDT)
Message-ID: <8f0b1ea5-6c38-4b7b-a8a0-724f7e317d65@gmail.com>
Date: Mon, 6 Oct 2025 22:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM53573: Fix address of Luxul XAP-1440's
 Ethernet PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20251002194852.13929-1-zajec5@gmail.com>
 <4fcba9c1-ff83-40b5-b7eb-758fd43ea978@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <4fcba9c1-ff83-40b5-b7eb-758fd43ea978@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_133347_030112_920EFAD3 
X-CRM114-Status: GOOD (  16.20  )
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

W dniu 6.10.2025 o 18:09, Andrew Lunn pisze:
> On Thu, Oct 02, 2025 at 09:48:52PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Luxul XAP-1440 has BCM54210E PHY at address 25.
>>
>> Fixes: 44ad82078069 ("ARM: dts: BCM53573: Fix Ethernet info for Luxul devices")
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>> index ac44c745bdf8..a39a021a3910 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>> +++ b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
>> @@ -55,8 +55,8 @@ &gmac0 {
>>   	mdio {
>>   		/delete-node/ switch@1e;
>>   
>> -		bcm54210e: ethernet-phy@0 {
>> -			reg = <0>;
>> +		bcm54210e: ethernet-phy@25 {
>> +			reg = <25>;
> 
> Does this really not work, or is it relying on the PHY responding to 0
> as a broadcast address?

Invalid PHY address was breaking Linux's support for Ethernet device.

Before this change:
[    0.986560] bgmac_bcma bcma0:5: Found PHY addr: 25
[    0.991913] mdio_bus bcma_mdio-0-0: MDIO device at address 0 is missing.
[    1.024512] libphy: PHY bcma_mdio-0-0:19 not found
[    1.029358] bgmac_bcma bcma0:5: PHY connection failed
[    1.034514] bgmac_bcma bcma0:5: Cannot connect to phy

