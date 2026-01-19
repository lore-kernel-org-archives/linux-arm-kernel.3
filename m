Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B42CCF2E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGK/JHtGxCZWFp0R8SxdcXdTEhWhNtsWilx8eiq1+lY=; b=Ec3C3o0RHHkGDSUGnDOKAITFTL
	w006TS2jbtOmbZ/akC7S9gUmGNsA0jIZRpzw/k7uTkaEPBA0QPQi5AU//4Oj+/OFf4GnbHw4Edjil
	O7BHHFjsUvmqb4LltZKwi1yEaf3Bln2HkdZVeVMB5ja+EtBtDfTMpeOTnOF3ESQOayRe/9KzuxAbT
	Q2nz2SxPSlHd3SZjk7TildCzRk+UV0hdqpYESFswcGYCirLYdmAI+ftlVWurJq4y8XuYsepGy8tVI
	+kuO+Q4Fpa56pAHXUPwhbW5sSPZiI5nCHcamKoEkHymqMbZHCJKG1VqF1wJIhgraBArJHIVdZrVzL
	CFXGG8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhod8-000000022qz-2JBE;
	Mon, 19 Jan 2026 12:45:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhod6-000000022qY-13v2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:45:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so27818475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768826710; x=1769431510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGK/JHtGxCZWFp0R8SxdcXdTEhWhNtsWilx8eiq1+lY=;
        b=gK/ks+ygLoz4NQSOU9ilHtA81xtMqFQ6mybpl92wSGqRjD0S0+L60dq89BoIWm5pEg
         eBHMaeeX9WbBldY24zJPFGe3VCcoDGvcEDT4WP/Lz7AlVigAgYoZQFlSnldads1+rkb5
         VYr0I3vMSbNXUx3NBdOo7Et9jl4PsyE2cYE7XNTy5xRc9rOaKu6EOIPfLl3MBxXd9NKh
         LskXB5Lh/MQU/DQz0Kodv825ZWb/nTprYZO6hzBeKOOZvDCS1Ho1r5A45pQAMq1S67XD
         lRigQGVivkITegX9qw/veri9vqzl6bK0039FQZLsN1HyEKh/p6JTXX7reVJ0ULRwMyrU
         DGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826710; x=1769431510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGK/JHtGxCZWFp0R8SxdcXdTEhWhNtsWilx8eiq1+lY=;
        b=Zg7MGPklEFxETVC4dHFsMogMYc1z52kIVY2+L4OjBjGogLIfT4hASskyBx8tk+wl3a
         W0n1oFSIeJgiWciviYctkb4R14dbT9rk/WiMJg4vTLX+u8xAm1dZS8Zn/wtY+N9bDYS3
         Ajx9cKwSyjr0r+ubd8hsnKitPNq1bpizWDV30ksbwZoRx2nfRIqksWgjdMaE2+AAqEdW
         KhJBr/bkJLt9uE0Jx/l3x5IuFWIQxQ0j0qPLgDiSJhJQbvSHA8LuayocfoeTuTq05PHm
         nGMNO9L32h/sieoeyFQxoyOdRlokTcQDo5Tk+g6SQDiOEzEI5Kgn/BaBYT5Vhu7l5/R/
         Extw==
X-Forwarded-Encrypted: i=1; AJvYcCXLBi0Q+2M67pv7k5JLTQeLiEBo7o99m9hqx+qw9mrBv36MF5eR7zapVNnkidGv7rSni7RSD3HMvweQ4GhTYqjq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl+vUcC0c6X/PxbhADSiS6Cjamn1srScBzj0p3sWf2qJFtu6nt
	pLZyICkY4RmiiHjK6bnU2JSktRlN+OdKorKQS/v4H3EZFnTZEV498T+nnjzIk4eqgbE=
X-Gm-Gg: AY/fxX7TpDD3S3VUKL5wIqA5TcDF0RA7YbLCUCUNdYN4MzEL0BnbNsBOj1WoYulPPRM
	Vv/ypOcsY2/GSkLPKa0EfQbadPImpr62m8nb21qxGUy/E0DMgClnzmDYcvyrxZlzkv5UlU2awhj
	0bSFrq54WatyExffJ3kZ9molOtF5xhwELSXex2/M2DjI0QX4CVqqMDa3ctRG9DGOzj2tMwXnMfi
	8996Myd2wKCFcfBKXwNAShJpDKP2fT4/WX8z5JjtFzcQAxT2Fe8HfHlB2AqJ8V9EcxluhM+vZFo
	TpCJqjuAxyFnm3Vd3mX5DNkoEskA0RsAXq3GJubIRuo/cs2E2uZLcktjJf6J3M8TdA7+EhCzylG
	UFsA471e9Q978CqzE15k/k89DbCx8uuc5upSJSTTGnThcq5o+IHckgFcsLXY0fNecnmr0MeZkzG
	Red8pXNn0JG8GTQ0cpC4tPEkKkV+XVm5aIrg==
X-Received: by 2002:a05:600c:6098:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-4803a7253d1mr13426025e9.30.1768826710239;
        Mon, 19 Jan 2026 04:45:10 -0800 (PST)
Received: from [10.255.242.87] ([109.166.183.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c197sm193288675e9.1.2026.01.19.04.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:45:09 -0800 (PST)
Message-ID: <10cb51ae-9cec-49a9-96c4-757cd1410d8a@linaro.org>
Date: Mon, 19 Jan 2026 14:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-1-cfe56d93e90f@linaro.org>
 <20260115-ultramarine-wildebeest-of-completion-ea1bc0@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260115-ultramarine-wildebeest-of-completion-ea1bc0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044512_338993_A3917A20 
X-CRM114-Status: GOOD (  21.37  )
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



On 1/15/26 3:32 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 14, 2026 at 02:16:29PM +0000, Tudor Ambarus wrote:
>> Add device tree bindings for the Google GS101 Thermal Management Unit
>> (TMU).
>>
>> The GS101 TMU is a hybrid thermal solution:
>> 1. Configuration (thresholds, hysteresis) is handled via the Alive
>>    Clock and Power Manager (ACPM) firmware protocol.
>> 2. Interrupt handling is handled by the kernel via direct register
>>    access.
>>
>> This binding documents the required resources, including the APB clock
>> for register access and the phandle to the associated syscon node.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 64 ++++++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ecf4a315ecf1ea0649c4e96a207d531c696282f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google GS101 Thermal Management Unit (TMU)
>> +
>> +maintainers:
>> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
>> +
>> +description: |
>> +  The Google GS101 TMU is a thermal sensor block managed via the ACPM
>> +  (Active Core Power Management) firmware. While the firmware handles
>> +  the thermal algorithm and thresholds, the kernel requires direct
>> +  access to the interrupt pending registers via a syscon interface to
>> +  acknowledge and clear thermal interrupts.
>> +
>> +properties:
>> +  compatible:
>> +    const: google,gs101-tmu-top
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: |
>> +      Phandle to the APB peripheral clock (PCLK) required to access
>> +      the TMU registers.
> 
> Drop all the redundancies, so:
> items:
>  - description: APB peripheral clock (PCLK) for TMU register access
> 

ack
> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: |
>> +      The combined thermal interrupt signal (Level High).
> 
> Drop description
> 

ack

>> +
>> +  syscon:
> 
> I feel like suddenly you sent something completely different than what
> have you been working for the past 4 years.
> 
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      Phandle to the device node representing the TMU System Controller
>> +      (compatible with "google,gs101-tmu-syscon"). This node provides the
>> +      regmap for INTPEND and INTCLEAR registers.
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
> 
> No supply?

It seems not. Nothing specified downstream. Couldn't find anything in the
schematics that I have either.

I addressed the rest of the feedback in v2.

Thanks,
ta

