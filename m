Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B40C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEdV5Xs8ER2iH6ECRgXfLV1Fk4a++1FtqWHfmbg9CiM=; b=oVSTeGsylAEZhoe6U89Ou5CktY
	oJpbSEXhn6Ih+IQLrNprmyuC0MdH9tmtqZuxbseO02Ega0Rxp1TSGZhVfYEbOZ5edEUtmDYDK+4/9
	UPzYzVF4kHsihR63Pb12vA1iZXghql5V94xWSI7P6u0Y8HLmrXcaz2l5x/6SUdnpiMH04hDh5AZ2q
	Gxwljbmz5tXVnizPf4dzqcZjqxfIwoDa5u0GKjtKEWQOrG4A/tGauy3RJJ+IPFxEJkwcPo6YNSeL5
	Slt0dvsRVwy4ZnubjUgGkTGjXaN1P+eHyNOPsVkue7/dfJYRXjSXfXiA6eCDy3HvjzFXaRqkVOiHR
	7tiRAIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kV2-0000000FFng-2Wte;
	Thu, 10 Sep 2026 19:31:56 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kUz-0000000FFnE-2qTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:31:54 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so70542b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068712; x=1789673512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEdV5Xs8ER2iH6ECRgXfLV1Fk4a++1FtqWHfmbg9CiM=;
        b=sV9cX5bbjqj2dGMd8EN7crLcaCyFFttaUAczSX/XalDGSAANcwA6+Z3rwshun4jHhu
         HoJNvQYw3oPzjzMFzCYMZAOskhZHVEgRhGawi9UznuOuO4sUO+ERlZch12/uzUPR8TAe
         tL7xdswa43W015fnYxx+dYOBFYPYzk4FwynnXQHq1xFmQoOo37T8Ut96s8X4xtZ2lzHC
         /+83AyZDnVY3pqEUH1Osf7ly1jrMB+OhlkPCor/uHGEH/Z7M0OogneoBeTTOXyyNQ9eK
         jX5Qs9hVD4DtVddRl3ojo9lXcyiSHtWq8sv2rnyBvQo8nMcPgPuEPMfdGWMK0E8uZC2+
         +DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068712; x=1789673512;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gEdV5Xs8ER2iH6ECRgXfLV1Fk4a++1FtqWHfmbg9CiM=;
        b=tSYvss+a1Em7ZzHo1rZUbpCXoFB20xQE9lFexhHBo4iiC4oD95NBM7Nm2FDxKXeN/6
         OUvHeWvDjU/uW8KOqIkre/S9Z5amuD5mW0ZQ9rkuVjRBDMFly0nOeCJbe7EA0dzV44vT
         PsMNXJfyCk7HRWkVrSoYlUvVbtMQu5U7qvhm7x4Xf8OwWvlWoQJiXWavxfyYHsz8yGrl
         RqJVPDMSbKi2Op2wTg0rvEfEb9IbZz7lw2SysNd8wHZyrGlMrggM9IqpdfReNbEyqVN8
         aZHzxdAbO++kNk8fhmgbwMZ+YzvTpnPox1QYYqUVzWU24fDzJbgAJgmkwN5mCjlRSQGv
         HpyA==
X-Forwarded-Encrypted: i=1; AKwUvBwKQzT3sjjEGauqOVyn0bITphnX0XV44uTQGOkBqkoyP1JLO0HiKuUBo+FoMYnx9pxpKBex4wQU6lorOeI+3OV7@lists.infradead.org
X-Gm-Message-State: AFuF++nkMv5NsdvJ6v4JJvTPQVCZzCJdcK3TcRLr6CglJWS3tbTNXLor
	1Hs9PqDazPF6pX71XQ5oBc1yXjb+7gxG7tbjW0xa8kv4SXVfWUeZW4rZ
X-Gm-Gg: AYBFou08aRMUEQHvYuTaOoLptGhqc5BJlcPuVSWpNQHXN1WnbGTyLjpVs/eqEwsqcUo
	0fbwWj+/J2IetDK2pjkdUXrjT4fcKP99gQVOSVqIWyb8btok9FiJSiHQbpBFW0jmILEoQN2OtrA
	p4em2ZtQ92XNM5YRsfKnKEwxPHNv19kt0KlX9b+EoJw8rMZsRU2qwOsUrb2/KQelWNhv8gCpiaf
	TYfzJ9Pe0YzT9ibxdDXOmqqCuUwg+4l9Zq0N2MrkON+WARAdCYUe9/RlSuubjADp8fq2oCrTzOB
	V+7ag8ao48F6amInuH/pVnYXvSsjamzE1K8ChW2yM1zyYZlna7DdgWZli/rb2gSomP90IPaSyIc
	r6711XVHliHXV2pkBI2CRYQBL26iSaaUxRuWLLjA3+9u1fHQCcn4NGHkNP+ifqRzf7v/swMxI/Z
	mOgRfA3i/jDyqbuhYRV8rkMlgu2P6QUi/Ya122IVE2heYXAM/kHs6rvO+UkUtw39bIv1ve4neu4
	legmxVB8KyX9vp1rFEaNb64fL3DVZxE31+ED7HfjRrJ+OVH
X-Received: by 2002:a05:6a00:ba8d:b0:857:72ba:ff0f with SMTP id d2e1a72fcca58-86b34efaaebmr529838b3a.23.1789068712105;
        Thu, 10 Sep 2026 12:31:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm79353b3a.58.2026.09.10.12.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 12:31:51 -0700 (PDT)
Message-ID: <c5fd98fc-2cfb-434a-8a81-3bf589049670@roeck-us.net>
Date: Thu, 10 Sep 2026 12:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
To: Arnd Bergmann <arnd@arndb.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Helge Deller <deller@gmx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, mfd@lists.linux.dev,
 Michael Hennerich <michael.hennerich@analog.com>,
 patches@opensource.cirrus.com, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
References: <CAPVz0n0ryOns2sCJE_jFana9MVzwEj1QZuPEa8FNhGbHXnMB+A@mail.gmail.com>
 <11652e5e-053e-45b0-98a0-0c1cb2aeedc4@app.fastmail.com>
 <7a92a79e-e22a-4e34-9f11-4086b88f62cc@roeck-us.net>
 <e33b42dc-1561-4819-b028-b13af9e7115b@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <e33b42dc-1561-4819-b028-b13af9e7115b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_123153_728129_D2C5EC06 
X-CRM114-Status: GOOD (  21.23  )
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

On 9/10/26 12:15, Arnd Bergmann wrote:
> On Thu, Sep 10, 2026, at 20:38, Guenter Roeck wrote:
>>>
>> ...
>>> drivers/hwmon/ds620.c
>>> drivers/hwmon/f75375s.c
>>> drivers/hwmon/max1111.c
>>> drivers/hwmon/max197.c
>>
>> I missed the rationale for removing those, but then I don't really
>> mind either. I guess we'll hear if someone still uses any of those
>> drivers/chips.
> 
> None of these have devicetree support, and they are not usable
> with any of the remaining board files.
> 
>  From what I found:
> 
> - da620 apparently never had any users upstream, though it does
>    not require platform data and is theoretically usable with
>    an external dtb
> - f75375s was only used on iop32x (long gone)
> - max197 was used on x86/elan/ts5500, which is still in the
>    tree but cannot be enabled anymore because it is a 486 class SoC.
>    I have sent a separate patch to remove that platform
> - max1111 was used on spitz, which is on its way out for 7.4.
> 

As I said, I don't have any issues with removing them. Note though
that the ds620 driver (like many other hwmon drivers) does not require
devicetree or platform data to work just fine.

Thanks,
Guenter


