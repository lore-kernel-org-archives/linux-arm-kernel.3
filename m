Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C859CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ge3mYYvanFf7VDYY5E620z5tgjBKFtjXT61OFvHXIQ=; b=QuO9BsCqzaf/EgshBeF1Haadqg
	IUeFfcXDGGljL5JuvqxDclb/RPVB8NKgHgkrvezfJtB/y9Bw3dLXPqS083+kM3+UdS5CxVDAmP57s
	X0CO5hWBYBsmHlOMwekaJ4OuAAAIoLgv44XU0IUNXag6oVcoReGbRmw3okmEf7LJmFFEMKr6TCNDy
	Eu0vUMzF+mDs0yfbUZF6FKoLb8NTmrJ3hVraAw1206q2WeIcIsk2Kdc+5kmDNOfXRG6U5G9q9H4sT
	d43aulJtJrgb11xNmlAbYfPqxO5yQC4HpmaqjKWRdamdQUB0FCUwrj0BCrj7fMWYUINWbrj/Z6xXB
	aEjgpPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNTT-0000000D3Ii-481e;
	Sun, 07 Sep 2025 22:03:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNFw-0000000D0FS-3Z5U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 21:49:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso31934335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757281743; x=1757886543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Ge3mYYvanFf7VDYY5E620z5tgjBKFtjXT61OFvHXIQ=;
        b=UgAdZ+G438oG7T7Kx19uKCvLrthdjxOOyCx+/S3cCgjHj7rIxpqgF2UQbgqSaU1HLD
         9fVLxPHuBII5uJIyR5VGKbxsPTtSJdwWieWo79yzodqTLiRaC1XB5eSl6BHcYQHe+ZeR
         qIQdvBYZM9T9P3eMw7CdniCxftsHcKLTFDYhyW9yk5nA6ZY8SeAgISznj79rebD+jeB0
         1YMaJBUKOUKYHuIw+uZzlegMavN5qf19qQU6NLcIIpE/X//t6wVInSMg9Fz9fiGM1zK8
         Wf+H0f3NI3XNe9da5HqYJ8FPgbzhEmsRbai16p2JKhL9l0LsTF6uOIn2Ur1a7Y/2pumN
         hacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757281743; x=1757886543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ge3mYYvanFf7VDYY5E620z5tgjBKFtjXT61OFvHXIQ=;
        b=YxwDyFRMvolpnx6MX/e/+/0N93wUaKZuKtvERhDPb0WfaEKg1FiB4k7Icvr0Q+uRR5
         Rz/JQoSG8F91SpNP6JnwLs0MHxIYLM9CeWajIxF3PaAxzCWoVWVUhT9Ve0TepUpVrE9n
         tbisXjNrCOY97ctFKY4grXu5wIVZwVV5sWKxLTQnpeJ8lIylaQFxZ4dNkKOz8zGHpy8r
         bFTFIbZIBgDE5keavIV4FNvEU0VIoAqyl7j6HxTYD3hRbn9PW4BWA7J1P3CLCEQ9wtK7
         2EbJ91x+dl3uwIAr8Ct2lY7fGrNaSpqShTMBx+3IOwFhOTnOc5qhoYtCq8AltK8p3mrP
         Y+vw==
X-Forwarded-Encrypted: i=1; AJvYcCWIqZ2U7euaPjEj3HQaSwpdVwMEsVfQFi/ADZyx4XrHj1Mwyeon64M15JuQbNnsHwfAt3lmw6y9Vl5FXJW2nklp@lists.infradead.org
X-Gm-Message-State: AOJu0YzKVuhes26fy8+mvS51xZm4ts3cxEmFtMqqmdFaYYiAw9ESwBOs
	8MCuaIwB+/Fk+p6H2qN9ZudqlG5LRBJnlM12POv7etwi/ftGrjMVKTC9
X-Gm-Gg: ASbGncscxzmmbFqwlPKoECzaS+PCSC3m+lBqL8KUcWjyeG+dPcPCfOJq5CqEOcQZCUd
	KOocemVX2lUTTrfqbwFOREuumGFG0tkFa9M1vmn/qvEQ6uoi6IciE46lsmExtwQItcIPERzwGJj
	YQ6TF2UfzRrIZbeYfxBXnfdcXwMJAykWH839a2T3+30/k1p4Wh9tvo/F4drYggukuZm8kajUqXs
	Yf3jnRSHGAGJkPNwLvOiW7IWeoNqUoMnZ0eR+2JWQGq/lc38byAo1631da3mxExUjKKVKqZ5qBZ
	gE1Hv6q6UKWBtmB30ISZ856OEGS38LlfYovyyyBeMPtA895fTgNx0tWIMoFqkqT8BR3z2x9qPAA
	3KqaibjVrUvcyIGedrfmL+K7Jp3hrFVRxW1dUPxY/sQyeHFSnV3b6qEHXmGmVQCksStyxeBWAAA
	YSGp0=
X-Google-Smtp-Source: AGHT+IGART8ckw/rGELA8KyB0cRV6LrY2FgEDmT8Z5h84zUWqCDLhM/f15gaQqI7S91xWlrnlxLxAg==
X-Received: by 2002:a05:6000:310f:b0:3e0:63dc:913c with SMTP id ffacd0b85a97d-3e2ffd7fb5emr8835207f8f.3.1757281742745;
        Sun, 07 Sep 2025 14:49:02 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddf1765e8sm70766305e9.22.2025.09.07.14.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 14:49:02 -0700 (PDT)
Message-ID: <bdfef146-9daf-4f95-9314-f41e7352cbb3@gmail.com>
Date: Sun, 7 Sep 2025 23:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: sti: drop B2120 board support
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
 <20250714-sti-rework-v2-1-f4274920858b@gmail.com>
 <CAL_JsqJ0ckZ529gm781uF52yR3-gj2ctHR11hUK=4q8_Eq65EQ@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <CAL_JsqJ0ckZ529gm781uF52yR3-gj2ctHR11hUK=4q8_Eq65EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_144904_892376_8A2193F1 
X-CRM114-Status: GOOD (  14.52  )
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



Le 05/09/2025 à 01:37, Rob Herring a écrit :
> On Mon, Jul 14, 2025 at 8:54 AM Raphael Gallais-Pou
> <rgallaispou@gmail.com> wrote:
>>
>> B2120 boards are internal boards which never were commercialised.
>>
>> Drop them.
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>>   arch/arm/boot/dts/st/Makefile           |   2 -
>>   arch/arm/boot/dts/st/stih407-b2120.dts  |  27 -----
>>   arch/arm/boot/dts/st/stih407.dtsi       | 145 ----------------------
>>   arch/arm/boot/dts/st/stih410-b2120.dts  |  66 ----------
>>   arch/arm/boot/dts/st/stihxxx-b2120.dtsi | 206 --------------------------------
>>   5 files changed, 446 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
>> index cc9948b9870f7f73629573149bfd342af75b07da..f57fc6dc48a00c9a9323b4508e5e4e161b197c47 100644
>> --- a/arch/arm/boot/dts/st/Makefile
>> +++ b/arch/arm/boot/dts/st/Makefile
>> @@ -13,8 +13,6 @@ dtb-$(CONFIG_ARCH_SPEAR3XX) += \
>>   dtb-$(CONFIG_ARCH_SPEAR6XX) += \
>>          spear600-evb.dtb
>>   dtb-$(CONFIG_ARCH_STI) += \
>> -       stih407-b2120.dtb \
>> -       stih410-b2120.dtb \
>>          stih410-b2260.dtb \
>>          stih418-b2199.dtb \
>>          stih418-b2264.dtb
>> diff --git a/arch/arm/boot/dts/st/stih407-b2120.dts b/arch/arm/boot/dts/st/stih407-b2120.dts
>> deleted file mode 100644
>> index 9c79982ee7ba8fadb1a2a92e732bf7f652b74c38..0000000000000000000000000000000000000000
>> --- a/arch/arm/boot/dts/st/stih407-b2120.dts
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
>> - * Author: Giuseppe Cavallaro <peppe.cavallaro@st.com>
>> - */
>> -/dts-v1/;
>> -#include "stih407.dtsi"
>> -#include "stihxxx-b2120.dtsi"
>> -/ {
>> -       model = "STiH407 B2120";
>> -       compatible = "st,stih407-b2120", "st,stih407";
>> -
>> -       chosen {
>> -               stdout-path = &sbc_serial0;
>> -       };
>> -
>> -       memory@40000000 {
>> -               device_type = "memory";
>> -               reg = <0x40000000 0x80000000>;
>> -       };
>> -
>> -       aliases {
>> -               serial0 = &sbc_serial0;
>> -               ethernet0 = &ethernet0;
>> -       };
>> -
>> -};
>> diff --git a/arch/arm/boot/dts/st/stih407.dtsi b/arch/arm/boot/dts/st/stih407.dtsi
>> deleted file mode 100644
>> index aca43d2bdaad44ef2a0e8a120c679c217709af44..0000000000000000000000000000000000000000
>> --- a/arch/arm/boot/dts/st/stih407.dtsi
>> +++ /dev/null
>> @@ -1,145 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (C) 2015 STMicroelectronics Limited.
>> - * Author: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>> - */
>> -#include "stih407-clock.dtsi"
> 
> Looks like this file is unused now too and can be removed.
Good catch, I missed this one, and it seems also that several 
compatibles within the file won't be used either.

I'll fix this promptly, thanks.

Best regards,
Raphaël>
> Rob


