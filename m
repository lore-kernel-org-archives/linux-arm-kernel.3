Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F9DCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG87avWDvYFoGPnCxGXtYfkNymSrwnb7XNMJgIjYo74=; b=YdTkPIJVmNSsjyfBRs/Mm0HUPB
	uGDX2fniWLGZqM2X6SVyyAGJcLkwpi7rS6BrAZzhMhOHlYhOEVcjg3de6A/mFUCrjsLh+zWtjeq57
	4AkzwsAltV4nsCpkg2G0pv5jgzSqPkqshnYm4gs7rNRadEwc/S5hNz/fvE/4waIsB2OEwxi7WSS7q
	IMsTPYumPnC5nGGC/ixAxCh0EY1SI7OznLs37zQKvwA3d99Qu1xFaBnDgNx6ITfIW6CYtueoUG9Pz
	XVnzGcQ7dKU/d4TW0bTBH6XnaRwH+hYSwfpgDr3xuBS+664zF4ZPa/78UTePCirJ9re0aJFN8WcVK
	ERwMxL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy7F-00000006q3G-3pxF;
	Wed, 30 Sep 2026 17:29:13 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy7C-00000006q1v-0T6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:29:11 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afe3b2383so889198f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789348; x=1791394148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG87avWDvYFoGPnCxGXtYfkNymSrwnb7XNMJgIjYo74=;
        b=ScBp+wM//StdUs6nzorO8ypdzyAhPDXIO5jZatDjj4QLPHfwNncnYbYof342Od32fn
         vJlXsPxCI6UaW2xLuc3Q3lkxdAVKK5k1Af24StLENU9ACxzK8ZHl0xqeFiPDU/CYjeRB
         XEpaKt2bbl1L3cFslJwVWLtv0K2B2CXmDXoOU/q6t4kDkdKnHBDpBYxIauSA04LhPmdX
         AGTlSB+irji1RnXWzr3SPPXUUA/w72y60LLQyPcY2S5PbkQ19AnyWLlfFV1YYuDHpiBo
         noOm/JOwdQlNI7DElsssUtCvmR5bjtGI7Uo3YslZynJ/8p0g7FgTeG2h3RX6Jwv4MYLC
         UItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789348; x=1791394148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG87avWDvYFoGPnCxGXtYfkNymSrwnb7XNMJgIjYo74=;
        b=XINf+5lbVarvjkbWkVY/AVYBAT3gjHxfn/4UQ5y6sEHQvtYI6EclVKQCu2FeFho2wi
         HgGKlEBi5Gu1S9SiBrjsXEQblhmCjhwXXNHw31fddbAx3F4jln3BunrhJGtQa1F1iTuh
         hYb8EDj1XH51A84RIEkYw57TdfkGWhIQrXICBPto+biUQQ3gJEr9yhgWpZ5rNuqn3Snu
         r3NxMzInaQUmnGHoeCLwM8VhLx3TA4PjbPE4T2UOsOr9chpIt8n2Cq6BT+eAGWkV9wtF
         HwF5IQMzvAbpuuli81DD/rB6cBWlV7hqJ8l+m7Eobq+HvZZVlrcgLUd56BnKRmuMGdcI
         Q7Sw==
X-Forwarded-Encrypted: i=1; AKwUvBzeR3Enor03ptnJ4ePCwfg9kSLFicG3lSayq4ZD+G/r9YZEFRscK1zM0hOW25fnZAR8qfd8dXaBqPp8vmcMm4QT@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1IQCfAQQggYK4hcl+q7TxRwL/MgT/P5vEA2fuWx8tBfYWjAmO
	2xjPqGg1MVoQ2bQ10ewDXkAtb94kGI/e2CXxeA793duF3tgkRCOu5M+A
X-Gm-Gg: AYBFou1n8/IkiY4IQnF3gMT24G6Zw4CIzzc8ug3y+y8nTC9oVMK0rKPDDkpc08xBhCo
	sSjG5h8axF4LRBxeTVPFM1+WPseoL6nnJxvB8k96Vqn8+ctL4dtG6T3oQUwrqwMDvZ2rOU5Ho1X
	AcDI2SzA19muO0Orc1HGgRGvPff9rtkyE467MgaDTn5r7gwtio2zcJ53qNeJMRXtoIGLSq7KXAb
	lymK0dRpIT2I97Dpc3e0q8JFwVyyxskThWt+sqpur5F6uvIH5up1fxhrGa2WxcLlpieydQMU2PG
	XWVGZ/CdXxkE2o76YM7fwIMJOrw+96AntK9SjF+OF12M/Zw7vlBGlM2es4gPmARdPW0FrjcUE3H
	W4Js2VFGz820zEY6U6CT8mxeHH+cpyUkH4tKr2u+4DPe/Zdh+14J3m61vQsP+Eo5YEXYuaAfn8h
	fAId49syxg64TcW41Sz02ut+OXqr8q3qU08Hzl3sFjDVGAnV33XZ6Q82zKbp4jvAj3+I+4q3qdu
	GhDl7fHWTn/sxXS/xJSCw25rfvwih+VUAuNfpQyUQA=
X-Received: by 2002:a5d:5e8e:0:b0:488:83b1:16a1 with SMTP id ffacd0b85a97d-48b0242562emr4834485f8f.7.1790789347964;
        Wed, 30 Sep 2026 10:29:07 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2fca3sm527144f8f.34.2026.09.30.10.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:29:07 -0700 (PDT)
Message-ID: <2872a37d-4f24-4429-aba5-34f020740821@gmail.com>
Date: Wed, 30 Sep 2026 19:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rtc: Add Raspberry Pi 5 RTC driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com,
 Dom Cobley <popcornmix@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
 <20260930095203.492949-3-sander.speetjens@gmail.com>
 <7441de5b-e9a6-4080-b312-d6c7123fdcde@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <7441de5b-e9a6-4080-b312-d6c7123fdcde@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_102910_166994_D17FFC38 
X-CRM114-Status: GOOD (  23.86  )
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

Hi Stefan,

>> +    // Check if our model is a Raspberry Pi 5, as the RTC is only 
>> present on that model.
>> +    if (!of_machine_is_compatible("brcm,bcm2712"))
>> +        return;
> I don't like the comment, because it doesn't check for Raspberry Pi 5, 
> the code checks for a BCM2712 SoC which could also be on a CM5 or a 
> Raspberry Pi 500+ 
I changed it to BCM2712, but isn't RPi 5 the generation/platform name 
and RPi 5b the specific board?

>> +#define RPI_FIRMWARE_GET_RTC_REG 0x00030087
>> +#define RPI_FIRMWARE_SET_RTC_REG 0x00038087
> Was there a specific reason to not include these defines to 
> include/soc/bcm2835/raspberry-pi-firmware.h as all the others firmware 
> tags? 
No specific reason, this is how Raspberry Pi originally did it, I moved 
them to raspberrypi-firmware.h

>> +
>> +enum {
>> +    RTC_TIME,
>> +    RTC_ALARM,
>> +    RTC_ALARM_PENDING,
>> +    RTC_ALARM_ENABLE,
>> +    RTC_BBAT_CHG_VOLTS,
>> +    RTC_BBAT_CHG_VOLTS_MIN,
>> +    RTC_BBAT_CHG_VOLTS_MAX,
>> +    RTC_BBAT_VOLTS
>> +};
> Hm, an enum suggests that we simply can add / remove items, but that's 
> not the case. The Raspberry Pi firmware defines the values.
Should I also move those to raspberrypi-firmware.h or is this not what 
you imply?

> In case rpi_rtc_set_limits() fails, both limit would be initialized 
> with 0 and this always fail. Maybe we should dev_warn to 
> rpi_rtc_set_limits()?

I added a warning for failing to set the min and max values.

> Just to be sure, both calls are optional and not critical for the 
> drivers function?
> Why does rpi_rtc_set_charge_voltage have a return value at all?
I removed the return value

>> +MODULE_ALIAS("platform:raspberrypi-rtc");
> Is this really necessary for module autoloading?
I'm not sure, it was used in the previous versions when using the 
platform device register on the register_clk driver before it had a 
custom dt node.

Kind regards,

Sander Speetjens


