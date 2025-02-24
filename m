Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSmks02sU0pz6NtlK+7aTkPg3Il2n2N4xYhuuXfu8rM=; b=4ermDKcQLZXzr+QucOuhKJg+5p
	YCx7ygJWfhJ+uw2LAXUSrejGgM8btLErmX83QjC8LaWD/S4YQ/YzBXZ6Jzf88dRsSwuFvL1vnP2wZ
	dYhUUK/PcVycjXR8pu/uzFIQPO8qigAwPCXrhPhJlOcV3nGQGbyof2IFHlAv5Dy6A0t5ihOCWgEiN
	kBe75WaDdvaYPAKuFf4bVNTIW0c5km2+zoqE3BWPaqEBKY3mRlAGhTdtcG1plOrBUxnIIdvH6uALd
	dRk77QDU2cReCj1CO2vbX36ssz/HNOAh3Z89uLVw62aNrOQ5SqywV8BAF1y8Dey/p7uN0J93Viq/Y
	owm5oRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW2a-0000000DCqM-3DK3;
	Mon, 24 Feb 2025 10:50:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW14-0000000DC9M-3Bcu;
	Mon, 24 Feb 2025 10:48:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439a331d981so36572385e9.3;
        Mon, 24 Feb 2025 02:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740394129; x=1740998929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSmks02sU0pz6NtlK+7aTkPg3Il2n2N4xYhuuXfu8rM=;
        b=Of8ynbjeAIUmFYQSziCHVufdLAF7JLclbI8lUz6JiKF2cEckqLqYO2xe6s1TaYOf8C
         dv9/E4pzqgCSaY63H0xSYHsGo7AFcTuLzBv74L7rCbheSG3attmyCtpyd4TQG2Kn5eT2
         JPd45XLRFudGnvozPNFWP7b3riMhhmblOmxCqBOuOVr2Ivtc4Y+J2oO9aDETXifSorgN
         XKn/ZgOIeqgz9tJpj+a79iNc1/R6WadYJX9YIQlaQ3OhOzfzq6bea6N9F11SxROtV2jW
         Hfuhxke+KRwYbQgEAblq2hCXw5HYCUsC3pkj3ozx4YlisPX1VPI2U5MN8tAXQkGpKZ9U
         3NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394129; x=1740998929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSmks02sU0pz6NtlK+7aTkPg3Il2n2N4xYhuuXfu8rM=;
        b=Avmb+2ppBDz5x/abKHkTMnFpyXfqe2xoHwCqnfamECMqMHYZ8riu5m9y/ChjecNQP4
         ID5yxf2W+i4qqybqTgF3qRBjJ+gyW79GTzq+7p+kXisM55+dSG2lwJC8ILJCeAUmPlXM
         mZXF+ALZtuv3WnY62pg2MHhA7wh7tLC+Lo/kkAAh83EKtrXEUYJPL69S01+k2DFotSFB
         DlImryNBlDQL5q6UIILnm5MreIF/LhhMMx9dXnIsO57k/IJxq1TrhMTp05JSOUpqjUPj
         gS8O25LWOfzgdPoHAfemuYacakufIOhMKeTwwK0EQyl6Vm0L7PO5LnmBxUAM1xEXHKpJ
         Sprw==
X-Forwarded-Encrypted: i=1; AJvYcCWN9+GWA/sbK7lE3BkLCEmAY8DMNf1AdfFIn0UpUUUbHGvd7EAu1oser2p8Ct5uoA2IIvi+mGXJD/+W@lists.infradead.org, AJvYcCWysOE17p78tDB1VKLPuyzNWAgbgRS1uL1TO9a4CsZwVtcMvCuLSBug3ClSUWkomN/amrn0L3Qqb2ZB5qlkK4IJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbmISHOjfEbeFC1BA51hbvi5kOkmTw/9732thvCIuEwdhNAma5
	nkpteZlJqeNJT6Td3VtQYkrpMB2geaz2Eh8T2y4PzqaRTPobxY3O
X-Gm-Gg: ASbGncsPm0ujLhGm7T0Asowvfr21Fv/jnzRzGChEsflyy0XN7atOkvH4HCEmQ4A2F2S
	qPhCNb8DG5FnkPbsjs4TrzTCZgE9f+jqajDGHYv2qVFNNlkZb5jYeK3l6zkLC8I8aYl0tHUIwGH
	alu6Jg9o70wXdbFb3MBmkULlmEXwcukVz6OLncsnCzoSeKjNw29adg/5RoK8Mb86iHVATRZ43bD
	srWywC9qMTKGQT3KkM/JbUaTjsiTUGPAxzgpq2+/mVsHg/kAQlSQLalEI+x0D2pEPpa4dzSl2PK
	9PswedyNgck6Q2XsFgP9O0SNLptX4Trvm8XryPppK4GuPxRx8JjeGOkyr3ioTpUlVaw=
X-Google-Smtp-Source: AGHT+IH22dUu6cq5GnZj2ahBsH99nikrHZTprN2kXwautV7u6WDRYUVZbgvuJyXenM0CCPaMHdFeZg==
X-Received: by 2002:a05:600c:154a:b0:439:44eb:2d81 with SMTP id 5b1f17b1804b1-439ae1f34f8mr103722245e9.15.1740394128909;
        Mon, 24 Feb 2025 02:48:48 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d53e8sm101787135e9.12.2025.02.24.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:48:48 -0800 (PST)
Message-ID: <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
Date: Mon, 24 Feb 2025 12:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_024850_833059_6032C241 
X-CRM114-Status: GOOD (  22.71  )
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

On 2/24/25 10:56, Krzysztof Kozlowski wrote:
> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>> intermediary between a USB controller (typically DWC3) and other PHYs
>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> You have undocumented dependencies which prevent merging this file.
> First, dependencies have to be clearly expressed.

They are, in the cover letter.

> Second, you should
> rather decouple the code from header dependencies, otherwise this cannot
> be merged for current release (just use clocks with long names, without IDs).

Sure

>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>> new file mode 100644
>> index 000000000..7d879ec8b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Exynos2200 USB controller PHY
>> +
>> +maintainers:
>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> +
>> +description:
>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml

It's not (I think). There's a few reasons I've decided to make this separate
from the usb3-drd-phy bindings and exynos5-usbdrd driver:

1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
for them, and all that is needed from it is to disable HWACG, assert/
deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
initialization can be done and USB2 works. If the USBCON phy is not set
up before the eUSB2 one, the device hangs, so there is definitely a
dependancy between them. For PIPE3 we'd need to control the pipe3
attaching/deattaching and then initialize the synopsys USBDP combophy.

2. With the way it's modelled, we need to parse phandles from eUSB2 and
USBDP to the controller. Adding that to the usbdrd driver would be...
weird. It makes more sense to model it as a separate driver, because
it functions in a different way.

I've described this in the cover letter as well.

Best regards,
Ivaylo

>
> I think there is no PHY between DWC3 and UTMI/PIPE. There is a PHY
> controller (so the samsung,usb3-drd-phy.yaml) which we call here the
> phy.
>
>
> Best regards,
> Krzysztof
>


