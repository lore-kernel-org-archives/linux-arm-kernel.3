Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2080C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23Zzwx8dQ7ApD2OL+JFkf/rOuLI+b6JbK1FtVimJKeY=; b=TyYGKAOZN86fO9yKIAugDPHqQf
	hMvD4OtvMTYssXX0qw6fr6WNGX7WKr05HXMAYZrvbAhdWUw9GYobRdlPh8K2tZRVaRFKJA3XCfeWE
	ugRL+d/o8oV+Ji14soLzNUw19MKJ5rdm3A2z0rzPwPIBnkJLQT/CkGXFcbhTBni3+rBk+FRmwNXZE
	6J8phQd6TeqBpoXXdB/qW2S6NS2lf6vOVN8NXElRV8wDU7KNiqJLG0APOaMLzA3Ym438NHEjyoFtq
	N/SLaA0zaOFhLk0uU/YAW9wMIjiI8q8DECbGEyqjfvGRSG7+2ED0NyPKI2Zb0pepN3lawmasZzNoG
	V/VaX1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turqN-00000008rsW-34ZJ;
	Wed, 19 Mar 2025 11:44:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turlJ-00000008r6U-3eUk;
	Wed, 19 Mar 2025 11:39:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso45738055e9.3;
        Wed, 19 Mar 2025 04:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742384343; x=1742989143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23Zzwx8dQ7ApD2OL+JFkf/rOuLI+b6JbK1FtVimJKeY=;
        b=KVb/gkrCX44MO+X34swsPVnesg4da0tT+n3oVNerLCRQhwL+lI5CiYryPla1nWbvG3
         AJFsNSqcmF92AXBLeRvqOTGL4v7yr2DjIP2YdA1pqwmEM85NPFkuWZPt89QM/2br1AOF
         uoVy+j7nSxEhXSnuvuJBk+m6dVdj9psm4qG0dxtAyZOUcgbu66c+IWTkrMrqSm+EMLsP
         7vD/BDl5dopEp9QatCBicgFtFwUh4K/UzBDNrP89b8l4oTpsSckw/vTAj1GsLZtYaam1
         2c8U/ev4E3Kr/HuaPTcUjqE/0Kc2DHLmyOqOIaL4XI26drvlWHvtLMyhw+26QE25R+kP
         OYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384343; x=1742989143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23Zzwx8dQ7ApD2OL+JFkf/rOuLI+b6JbK1FtVimJKeY=;
        b=UQAnKofrag9zHbqHx2Thb7W8JJSdF54D97aBv5TCxOJNgVW0JWT3EKb0tRr+OrRCqT
         r592qANqGEs2S2HS2dydRhjeqiAozHKZDX7jYhnqYnRLiubYgluBp86f37NkpcyIdiYo
         iWrGzownw1+Ecp9ZSjK3uVzExJuEeJdUZKkHnk64Fw/7SW/xtgFPXFqPryWt3/pa26KT
         wQALZWJvh/F79l3KQSWllJefNiX2kFz5zLfSuTLkmVBZ3Xs66/ACtwlSbxrJLX0gk5TS
         qSFTRzYqK6aPf/nPClIECYsDhF0850s5TC2t94C44EKnVQjPxyy6gthZoD31YSwVJ2va
         SrMw==
X-Forwarded-Encrypted: i=1; AJvYcCV8MeSqDfjKNhz5pjs/Hfwfm+N0xXEPWsEcz1Il3nRh9xGymcqSRvk/oUOrkD3rkCcO8Sv5VycM5e1D@lists.infradead.org, AJvYcCVKOEhbMqxv/CxbilHqO9D6an2SLgUdczo6EpEPLVq7BMH51OKEEdRy0f33gEoxP59A9qp6iFd7vMg8kbOZkBGK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk0WM21lcIgieFns9Wn76btQOgllBm7nZDw683MPJiKsg+HNau
	B9/j/yiJNTOLfnnsiw/M4THgTSxiI+hQ7xocsO1Pk6cqHBYoFoXHwBMW0A==
X-Gm-Gg: ASbGnctvs6sHzIuEvNgt7xxrKzoLFsFrubfyuAq6vtdzvS42ttRokWiUxK6F18AAASI
	ugh4HMy0pwYjZIahPsTdccZr4ttsrSRWSyOEQaj+JeXFC6/7xmBUCU3PfFp5VU9mW0gb1MMUKGc
	fONH/RK4dFST789z+msPMPcRj+eqLUpSgvfb+QKDzGxSD+CEJY3t4bwCCGZdFH+CUza69xBhZ6o
	+9EE9m7kJoD6fgKDp1JGZm4/FTu/YCfcfGYyyq01Vs7uWfvrkwQkdrmkXOyGa7+JemUPEN5G189
	O6fGleo0G3yW+MSWXp4v/wJz79f/5vJNnE7EDrEX49ec5VKuBguUTE2jfXi1Hd5mWA6RtwbP90v
	QFMdTobbKjb453ybHTcN/128=
X-Google-Smtp-Source: AGHT+IG/uReUa1PFDrYRs3h2HIwVSGTu7IcnjWIZm5iEXhoFmvhyCo2Cbk7y/wuCyXozf5+5PQwOzQ==
X-Received: by 2002:a05:600c:a4c:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-43d4378163cmr13761135e9.1.1742384343101;
        Wed, 19 Mar 2025 04:39:03 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae04a94sm23904475e9.0.2025.03.19.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:39:02 -0700 (PDT)
Message-ID: <8e8bbcde-8ed4-4239-ad96-6cffd8b9d65c@gmail.com>
Date: Wed, 19 Mar 2025 13:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
 <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043905_913508_684A9659 
X-CRM114-Status: GOOD (  17.77  )
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

On 3/19/25 13:08, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:24PM +0200, Ivaylo Ivanov wrote:
>> Some platforms initialize their eUSB2 to USB repeater in the previous
>> stage bootloader and leave it in a working state for linux. Make the
>> repeater optional in order to allow for reusing that state until
>> proper repeater drivers are introduced.
> Generally "works as it is setup by the bootloader" is a very invalid
> justification. Please don't do that. We should not be depending on the
> way the bootlader sets up the devices, unless that _really_ makes sense.

It does, doesn't it? We still don't even have i2c up on Exynos2200, so bringing up
the repeater before this patchset gets merged is a no-go. Either way, we should
follow what bindings say. I will change the commit description a bit.

Best regards,
Ivaylo

>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 4e5914a76..dcc69c00a 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, ret,
>>  				     "failed to get regulator supplies\n");
>>  
>> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
>>  	if (IS_ERR(phy->repeater))
>>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>  				     "failed to get repeater\n");
>> -- 
>> 2.43.0
>>


