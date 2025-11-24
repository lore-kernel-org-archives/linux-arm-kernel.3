Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E16CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 02:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=; b=Q2MBVtpkjd/foBNPLKGPmMqUiM
	AKg241M/DibNj8zq8TKtz/lHktk1373srGbVJPqdA/DN0UI9Qm5sq2JQHbtTx50Dh/DUKMhpXg9sH
	/OF+/2RniqJbduAzWo1GzO8BNRwkFOi5zp1tZ6KeYzFRnLncCHY69ycqIjZ94DXlXcuyBoyOiS3DE
	p+qw0Dws2yotJxdrRgOa4IEMK9EAhj1f4N8lOed2mJpvSWz0L8pYjge/Dqzg0OZAaZPA1J0kVfDaV
	E24VzGNzGA+aqmHfzntH5oqpla1fcxAnuYO6tKLi1WkJyyF4yfRZ9TdD1AS3kikf3VhOA1pPjtc0+
	HgViCc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMP8-0000000AzB4-0e1W;
	Mon, 24 Nov 2025 02:34:14 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNMP5-0000000AzAd-1JL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 02:34:12 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78aa642f306so3603197b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763951649; x=1764556449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=PNH4zTAPemA/76ifPFWTYFA5hvpS7FgNmh1hoqa3BQMzegF0OtLy/5+b30DUkEMK0U
         tAa/tICU0guWgEDvDbPptNf1UubBQQcfd39WoUwBskQH69eLKzrjMzCpXgH+bXpwsVbg
         BtcPjX7AyZMyRo8rFS7AWPlqLa5KytWs7vr3joOFeOsNrFsXccFORU6wptzRl4WwAWPo
         gPL2drlAl9zwUVI8Luqm9/QR+gIwmfHyX/dJ5W1Kgh20SO2iL9FFyMS7U9aqjuAxfRVO
         qGZCkD+ObxqxIhTP8zgX7u3JzpqQV5JaxIKBWJq0crMkTyaRFVoI30X8IbApIaVpfhTt
         /A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763951649; x=1764556449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJnKQ9oJ9uOzEtfzk8AKk4PwanNXBUdVi5ibWSqh/IQ=;
        b=Kg+asSB487Pltv8/xJUB89Ne/72EvlirVbXqVhUoFn3aNBl4FadjqxvbvcQw6TePS3
         NwGpvsf1u0fcrbd+3BJmceQ0oGW5+yA9EftyR6wDcFtTmPn3j7ToHqchQHhXwIU33MLm
         Y9YrRlu/cW/K7Lmo+Xdtlym/QH6b4Zxpjq2B0udUAlqzpvCuMjAg+KOFIelDrAMq61IT
         dyA0hpM2xUjN3MXX3j84tR9aHm+6aoCNapUwk/v0p8YX1j2s/Y0wiZpIC1+kDu4R9iEc
         m/hoQf6pWz39EejopsOJvGeUqSYGxRP26qNnlfBdUlAKl6EcFMIWn+V7z7+OpSoEpCqC
         aGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVUP1Kjib9V1S2HfsFIYxnsIz2qSfhcsJvSbXuFlP0mBFSQXR0DXo548ndqPpg9azqS0F9BL2niop+nkbM8X9vq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/mbEBD1LhnkzppfWOPgYb/FMSfsDU6CyujSmyc2ruQmG/421F
	Nrar7wEkvOxOfaoMeMUaoi0fy8JuhEkjIdLSq8SNNc5ck/JMpg+cwjQhTkKq6AIXOA==
X-Gm-Gg: ASbGncscOWslF5eE5RpBZzIors61PJ1zXzzhAflKyvAhELqTsvLh5Uj4XuDThIBjMxi
	opsm95O06mGL9+OkfeG1auh58WWP1xzmJGcVOvIxR6wA2kfApEC+pFMyGFt39Q89PI06zjQ8HmP
	G+e1Pr9wneNqbc3c18XMIrOA7HtMz21CWPQce0ztjXKaPMMQugl2RQXHFAreZWc+xPwm9xFJQqt
	3Dg6cgv/zWVzj8OBJAZEEtlsQAs7w44xLYkYGl6CMCjuQS8X8lpE0xVnExBCgZJ1GdO9NHHyNCF
	xdKkqG04bvH5LO1LKL/X6mJWwrfDEj6hggTtsCX2QHKfeJoQyFtlFV2R6r2djgYxzZnhlzbSqHT
	IepsIxGQOBq7IAsqTz2LBKxPBSib0ImuBzX2tN+HhJVSd0HyG9wJHOrjv75yBDxRpKzKE90Bdas
	OKqv6MaJMXTnw28z3QYujSY0kCWafQZrbjQZA9SZK/wxI5QFo+xf9BDJ1yvTE=
X-Google-Smtp-Source: AGHT+IHxC+BdP7vzl95DrlP/y364+xUvzMJ0RS3cskY282bYh7RWJ066M6U+GDgwPwRF2d9d7KuiRA==
X-Received: by 2002:a05:690e:400d:b0:641:f5bc:699a with SMTP id 956f58d0204a3-64302b37d39mr6827251d50.72.1763951649099;
        Sun, 23 Nov 2025 18:34:09 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:1806:1fd4:facd:d088? ([2600:1700:4570:89a0:1806:1fd4:facd:d088])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5decsm40005717b3.21.2025.11.23.18.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:34:08 -0800 (PST)
Message-ID: <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
Date: Sun, 23 Nov 2025 18:34:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_183411_387271_3C5BBCD2 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Krzysztof,

On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add bindings for Maxim max77759 charger device.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> new file mode 100644
>> index 000000000000..71f866419774
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim Integrated MAX77759 Battery charger
>> +
>> +maintainers:
>> +  - Amit Sunil Dhamne <amitsd@google.com>
>> +
>> +description: |
>> +  This module is part of the MAX77759 PMIC. For additional information, see
>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>> +
>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>> +  applications. It supports wired and wireless charging and can operate in buck
>> +  and boost mode.
>> +
>> +allOf:
>> +  - $ref: power-supply.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max77759-charger
>> +
> This should be just folded into parent node, no need for separate
> charger device or is just incomplete.

Thanks for the review! You are right, the binding is incomplete. This
charger block actually listens on its own I2C address, distinct from the
main PMIC.

I will update v2 to include the reg property. I will also add the
standard properties `constant-charge-current-max-microamp` and
`constant-charge-voltage-max-microvolt` to configure the hardware
limits, as this charger device does not manage the battery profile
directly (that is handled by a separate fuel gauge).


Thanks,

Amit

>
>> +  usb-otg-vbus-regulator:
>> +    type: object
>> +    description: Provides Boost for sourcing VBUS.
>> +    $ref: /schemas/regulator/regulator.yaml#
>> +    unevaluatedProperties: false
>> +
> Best regards,
> Krzysztof

