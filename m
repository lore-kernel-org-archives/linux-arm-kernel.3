Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBFECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/je3/phVFkxTSj46mlyxqk6IelVNMtxa/1bdYhVDBUI=; b=vi18/kPK3bEbt+COP/X3bj5r8I
	wJdEikDRdjrHkqripRO+TeRxuyszgb5kYjzPRuc0p3oSmewYMSKFoUR1zyhFw75NFGyKWANXT6F7Z
	KKRJLt62BWL2WhYWuhSeuxMk+E0I/gxFyN8RysaLSolJm7Fb5sIT6u891/QiMD2/DkvIGAMNVAE7p
	Gb+tKg6oshWYUVWaafAsWwTuI+/EH/xzX+A6ql7K7NyuiU2z4QysR+wg+3ktg/tA558FDy0e11H2S
	035EhAaQ5+oc3ng17fAjEHWJ4LULs16wELmmpXyA+8FQt6rPrYWnzHKr44z0Lmee0iPrrcLEp3Wgk
	yZo0ADmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXupW-0000000AODR-40hi;
	Fri, 12 Jun 2026 05:53:22 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXupV-0000000AOCm-1Ydi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 05:53:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c858cc9870aso765731a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 22:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781243600; x=1781848400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/je3/phVFkxTSj46mlyxqk6IelVNMtxa/1bdYhVDBUI=;
        b=DAR9QrEkYjeFsMGr17BhNOZjga10U5VwHAUkfaG4xdHmsZ+adhiR7veJxzyI0Armsf
         nZ42NlHok2UiQSRcS0BWmm4V+EIBd1SAYvP7iloD1qkO/W5aTbyXC29mq/CKs76SyCje
         xbSgcnXGvE3ZfTbeuciKd0ltyNredPkITr2OVQVHBuqrsE15oz/w1r5bzBMZcmI4qyRJ
         OGm0UFROQMDf9nWLzRUO/pvFdC4qTfuQzSajB11zZBDSikAopzCeN9tBDn7fEkwjy6vh
         dqSZtn/bNSnaFZq3ji11OlInn69yl0/IoKh8LOhe0B0tPVVxcA8wKRlR3AyhkydrANds
         h9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243600; x=1781848400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/je3/phVFkxTSj46mlyxqk6IelVNMtxa/1bdYhVDBUI=;
        b=pXa4wzuAbeb769DD2MGcDbKk8TQ2BSzIQxQzhJQnoT/uwFkSJK4Sm2TQ4XWq9VFb6H
         MPffTdL0+dD3Ktehh7Xf7qmfagpZz6kJGc5HygtMxY+kdY9XDZvUKiVTAhALysZnGxnb
         Gubd8TNCYg2S6rYAK4SZ+Wh4//VXuDenGSayfISgP7D/r9HW8q3+iYmkch8iyPDqJllF
         EdeCc8txKBF2mF0M8LwPAlnwu2zpHVnI4lteMfIzJeOczI38GI2jrK6fIADNig8zs9/s
         XITQpEELksDqOfxonRP/Ijvz6jHlsHv0fsnEqUoJau1B0s4Vm/hCESm0cvLY9/U/Pd1P
         4Fzw==
X-Forwarded-Encrypted: i=1; AFNElJ9rDtLk93Tgr+Yh2GeJNvaV+YTV8YXLdXpnjnS9JWpHurlA5B+CcFF0YE2AexH4znwWY6DD15BsQsLBM10CR56I@lists.infradead.org
X-Gm-Message-State: AOJu0YwRbfEdEexYzTUWCrJQTkaqRinuWdblgYa4UcTPkvlCJbVzn/S6
	4tw7K7XTKfMHmi18CFhZLz5/Vvx9b027FA7rttE4snTikcrwS4ygtqj4
X-Gm-Gg: Acq92OGXFpcc6vA8MXmTAzX82/bl+Vvc/7qsNbakqwTeKU1+Lj09G1wav7Qf9jE1SNs
	mcEBGSRhEkt/bOzG1Ct2J4I5N4B2qvWdPdqTTMQAQt891dlMxG3dI50uKPGdZk//7bRbqpLSH9h
	pmRFN5NvRJ1Y+h/fkKsChLC0HgLgD6WAMMAyqu6JX63jomJe+ThBaSjWBJBj/PHfaXM+t18b+FD
	daI/tUatJF3gcQh8TJ929JIYZ33vJuI/qDE/NyE9c7ydBNBckV49juPUyAW4dUlFkT+NwIwqxPZ
	HVGZUG+NkVtI9MSyxupuBgxfh15fsFYJMAX4X5RCRON9PkraPYJcmElAR9vMonwM8pO+4FqvjXm
	H5fAf4cIrF3Hr16KYLM59X2CRM8CSZftmvfskge84dW6slQBlPZGr+fg5ohg2hdozxMMm6uTaO5
	TTKwInRmXNsm9tVP1RTO/4pY2g51ImmYWByo0pEaAtw0J1sEicwnCZiZVMi0Eo7sJti9Fab+Mgi
	Y+M
X-Received: by 2002:a17:902:e94c:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c3fca68d95mr18444785ad.18.1781243600085;
        Thu, 11 Jun 2026 22:53:20 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f24sm7915955ad.3.2026.06.11.22.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 22:53:19 -0700 (PDT)
Message-ID: <3730c4a3-ae0b-47dc-af4d-ac1ed800e952@gmail.com>
Date: Fri, 12 Jun 2026 13:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-3-a0987203069@gmail.com> <aiqWSGCuhAK7hoY9@vaman>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aiqWSGCuhAK7hoY9@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_225321_425311_DEF4615D 
X-CRM114-Status: GOOD (  21.95  )
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


On 6/11/2026 7:04 PM, Vinod Koul wrote:
> On 04-06-26, 18:12, Joey Lu wrote:
>> Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC,
>> intended for use with the EHCI and OHCI host controllers.
>>
>> The MA35D1 SoC has two USB ports:
>>
>>    - USB0: an OTG port shared between a DWC2 gadget controller and
>>      EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
>>      the physical USB0 signals to the appropriate controller based on the
>>      USB ID pin state.  The DWC2 IP is device-only in hardware,
>>      so host-mode operation on USB0 is handled entirely by EHCI0/OHCI0.
>>
>>    - USB1: a dedicated host-only port served by EHCI1/OHCI1.
>>
>> The driver implements:
>>    - Power-On Reset sequence with a guard that skips re-initialization if
>>      the PHY is already operational.  This protects PHY0 when the DWC2
>>      gadget driver has already run its own init before EHCI0 probes.
>>    - Optional resistor calibration trim via nuvoton,rcalcode.
>>    - Optional over-current detect polarity via nuvoton,oc-active-high.
>>    - For PHY0 only: a USB role switch that exposes the hardware ID pin
>>      state (PWRONOTP[16]).
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/phy/nuvoton/Kconfig          |  15 ++
>>   drivers/phy/nuvoton/Makefile         |   1 +
>>   drivers/phy/nuvoton/phy-ma35d1-otg.c | 264 +++++++++++++++++++++++++++
>>   3 files changed, 280 insertions(+)
>>   create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c
>>
>> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
>> index d02cae2db315..5fdd13f841e7 100644
>> --- a/drivers/phy/nuvoton/Kconfig
>> +++ b/drivers/phy/nuvoton/Kconfig
>> @@ -10,3 +10,18 @@ config PHY_MA35_USB
>>   	help
>>   	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>>   	  series SoCs.
>> +
>> +config PHY_MA35_USB_OTG
>> +	tristate "Nuvoton MA35 USB2.0 OTG PHY driver"
>> +	depends on ARCH_MA35 || COMPILE_TEST
>> +	depends on OF
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
>> +	select USB_ROLE_SWITCH
>> +	help
>> +	  Enable this to support the USB2.0 OTG PHY on the Nuvoton MA35
>> +	  series SoCs.  This driver handles PHY initialization for the
>> +	  EHCI/OHCI host controllers, including per-PHY power-on reset,
>> +	  resistor calibration trim, and over-current polarity
>> +	  configuration.  For the OTG port (PHY0), it also monitors the
>> +	  USB ID pin and registers a USB role switch.
>> diff --git a/drivers/phy/nuvoton/Makefile b/drivers/phy/nuvoton/Makefile
>> index 2937e3921898..3ecd76f35d7c 100644
>> --- a/drivers/phy/nuvoton/Makefile
>> +++ b/drivers/phy/nuvoton/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   
>>   obj-$(CONFIG_PHY_MA35_USB)		+= phy-ma35d1-usb2.o
>> +obj-$(CONFIG_PHY_MA35_USB_OTG)		+= phy-ma35d1-otg.o
> Have you considered reusing usb2 driver with a different power_on
> function? Or handle the differences internally in the driver. There are
> few similarities in two and some things are different
Thank you for the excellent suggestion regarding reusing the existing 
USB2 driver.

After further evaluation and local testing, I verified that it is 
entirely feasible to reuse the driver. Consequently, I will drop the 
separate phy-ma35d1-otg.c patch series and submit a new patch set that 
extends the existing phy-ma35d1-usb2.c mainline driver.

In the upcoming patch series, I will expand the driver's capability from 
a single-port PHY0 peripheral driver to a dual-port manager supporting 
both PHY0 and PHY1, while integrating OTG features.

BR,
Joey

>

