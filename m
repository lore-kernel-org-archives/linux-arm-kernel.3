Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BA6D58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=; b=1EoHApmNbb+NaTuu2Ou3gVOP5Y
	A2a/XKA/JedvWKXkxYLTgLDy41wl5uD7k3G+JN+8uI2Sa5c87nsaPdrm/Q3+qA6ZEYimmb5vcwyjE
	6HPlggPHjgvPA8+zF8honKzuvbW8scFZLyI85Rc6lhtA8ynpCUIDxlHmegQy+8fe3nKqlX0tzgJiV
	BoTM9FdZj7ADNSziUm3GcGGzZagrcdYFy5TEJHEs7HlvTtd+v4ae02u5sqYtcjI3Im+ie8bbTrm6f
	fP9UWxVOmj1dPpo5rvjLVZ4hEwI87MYkdvZMD5V72hJrHiIOlnK5F6uySaVaSqy0gLpQ//L/YxAsw
	O9a9xnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFadO-00000008Nq0-35oU;
	Mon, 25 Nov 2024 15:04:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFacQ-00000008NfI-3ksm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:03:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-724f81aff1bso1212667b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546998; x=1733151798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
        b=hccPN2WRWz7n9qbZ98IgAttLCvI//aa5b5dH15Z+5H7rR3lfWeHefQMpnN+Dyzyrj7
         TLnbujb2/MAI7gTiD1y06ya0T4NcKvx3svhsFKvCiA6ZZdma9QiAdRv40xFidHtwah1L
         2cDPPanYPwMbSztjB9BJmJZ/OfpHha9QUyOdmnDDbORgL8Ttr3cCyj8qbrsRWbRgswqj
         0ogw5DtdCnxNl8JGL5xK61iVm5B+zd6U/YRLRlq5ofb+LBdcDcqwQ0UjgJCVHjfC7XvP
         cT12tF1GKrppzgdHyz+CXgdTqDAbDU5U9zx6FwCewOt1imwBjsyHSGazQD/NylOKbQMY
         bHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546998; x=1733151798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
        b=EdWZLBvPAatFr4h7If+Hn56D7GOh/vZP+bX8OIcKdX8EvZSU48dHH/qnouiz8hTipu
         aW5rE6uiXLGmWMC6F+tlad8ABgoXzPqw8NXhtlM23skbmx8dFabsjcK9UOqiwXoU8wEZ
         pGYlU2yKwd6sgWGCQUegUvf8zxIlZdxXw4ZZ1GzzBmW7GToDT6ZnBEyO9x10D3aBk98v
         BkAkUb1nLfkhlxMv+sWNBgzINRfj0q76hSQL9AMDtxp/AD/tRfU1MAU1orObxUJdBztk
         SagyvY3mztzO6YRMn6weUplecWai0fIO6aYDIHXXVlzFcWohlQPrralR5YoEPzR4tORQ
         rJhw==
X-Gm-Message-State: AOJu0YwBU0DY+2CRC2qdVH7U/qQIfxcESoNmKm5OQ9z68XFw6/3nuwD8
	M69vxIXEQHb5muY11H7kWD7mibe098OKg9WfdCDDJQehIJQzIDeY
X-Gm-Gg: ASbGncswg4h1E5pzZNq0aGjhNbKopzHPfAHkH++JXEboSAIlzmIdhFfvwkon9Iv9T+4
	HWTkugCU+WLBeGH4ER38txhatCUwwc3mWAqRovA4P2Fernd+wFx75l3PMBLZiIelmM4POv5pp9X
	2EHT0b/Uq7UnfP5toj1PlP8tX5i4ElH8g95Ap3uELfxlYhk6267ZjzwQjL9JzHzBhQr9oLoeWFD
	aJI2aHy1uYnU8jM/brkI39dpVjV36qz1SG8TveLD0ChcFJSMPSOIfMZ3ZzD6slU2aJc
X-Google-Smtp-Source: AGHT+IHjE12H/V8uAi6iwwQjPB/2bgurIjFDNLyLcSpLqK6GVZz5bJq2Vpx8P1om4SM6YiL6JRFESg==
X-Received: by 2002:a05:6a00:b45:b0:724:db17:f975 with SMTP id d2e1a72fcca58-724de984d1bmr23000668b3a.12.1732546997897;
        Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454aacsm6498521b3a.11.2024.11.25.07.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Message-ID: <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
Date: Mon, 25 Nov 2024 23:03:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit
 LCD
To: Krzysztof Kozlowski <krzk@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_070318_934975_EFD91DFB 
X-CRM114-Status: GOOD (  17.28  )
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



Krzysztof Kozlowski 於 2024/11/25 晚上10:49 寫道:
> On 24/11/2024 23:29, Sasha Finkelstein via B4 Relay wrote:
>> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>>
>> This is the display panel used for the touchbar on laptops that have it.
> 
> 
> ...
> 
> 
>> +static int summit_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct backlight_properties props = { 0 };
>> +	struct device *dev = &dsi->dev;
>> +	struct summit_data *panel;
>> +
>> +	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>> +	if (!panel)
>> +		return -ENOMEM;
>> +
>> +	mipi_dsi_set_drvdata(dsi, panel);
>> +	panel->dsi = dsi;
>> +
>> +	int ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> That's an undocumented property, which suggests you did not test your DTS.

Actually, testing the DTS would not have caught this issue. For more
context,
all summit panels found in touch bar have a max brightness of 255, but the
summit panel in Apple A11 devices like the iPhone X is latter found to have
a max brightness of 2047.

However, A11 cannot be properly supported right now due to not having a
driver
for the DART IOMMU.

In the meantime, max-brightness could documented and be made required,
and the
default 255 brightness could be removed.

> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Best regards,
> Krzysztof

Nick Chan

