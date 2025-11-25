Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BDAD1036C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvscaJfwgdQ/hGiq+gLyeXsz4eE6z2MvV6KE287vjdk=; b=1WN9byiMi2enX0S90x9xW31dwz
	0sfjxTD3ORmpbUGV8324ykdRAcrSGeAMEu7RBjuFJ1cugPebd7AXwcWOveAsv5KD9zX4WbVmJHUeE
	vP1FAzH4Mzqv0otzvMXAMJMX1s8n+JiA+zM2mRQPog+ZvlPRyqKghG93bFGqczMp1BzJZIe5jNmJP
	oF9UH+/ChucPbjIkP0JSW/F+fZpfWeXlg88h0b1f/l/jpOx3gR4or1Y50g+6RLAz5EyX+Q503q1yG
	BNWJG7bOT89yUvi1OcMRZNutFOdgKnsbguV7+XoMvAuu0y0bFZmfUQDC9t1CHuqvvPtm0SMzKGKAS
	SWHgFkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2lx-0000000E5YD-2SYo;
	Tue, 25 Nov 2025 23:48:37 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2lv-0000000E5Xm-1gcF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:48:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-299d40b0845so97737015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 15:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764114514; x=1764719314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvscaJfwgdQ/hGiq+gLyeXsz4eE6z2MvV6KE287vjdk=;
        b=mLEYXCb95yrxzV72V2gW8ll4/uVfewv6Voi3fgEsgNqjPGRkCXia6/VjxyiTCCE6rw
         sshiLjWZZ9xL5kSNT4AIdM4BKAqfJaf15v7tbq6B7I5edEoSgt5t6GkTeO/xIiJ9Pe9z
         E4FSqNfSFGqkbX7VjXwWu2mwn8kSQ3P7k3krVO63D6508YPuS5SNWj00igGie8SgFKWB
         zPVvLgm4ZtLxRS1Y9QilqjNkHA+erjzuR09u+i0WCe6VxB81RdoF/W+FMJJrBSLQ3hwf
         YUq/QV6ZfPfF0mcan6fvpYruWE6RbgP6Yq/EPFdQKms1lJOHhss7Bq5NLR0YbKVR72Xo
         4TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764114514; x=1764719314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvscaJfwgdQ/hGiq+gLyeXsz4eE6z2MvV6KE287vjdk=;
        b=ENUczhypbmf+7u6nGRdo16FhBmc+nLWEDzeAG/c+yc+YSGkcNsECERedJQWCZLzLmM
         dfhCUV+W+EXxQOLQ+Cjz+rENXtU9RwmulhXnrE4N3Pwy0P8iPLssMfy2qkPqego4CFzL
         a8DC8zWV5TtoXcOgDkRSAxc8UQ+0md82OZOtqKs+zLgKG01v+cnl1Nhj6IdDkQpmLO6F
         FNtfPkbEdZxipG3uFVLAKRUI3K2Xv/MBaV6GQ0HnradZl1rJ4Rqf/L1GerUg1H4INP7h
         SLb9RFWEKj+LvDlrtwHRBkXVgIbG+mDcP83v75K5g3zEil6U7HF9yJfzySSdFBUbuz4r
         tuGg==
X-Forwarded-Encrypted: i=1; AJvYcCU+2haOHOwIUjdp3ES9We4N+xh5TNQoWKBASuSt13S7JDobnXVzt6bzj0/QhLAS+pOxYLhZsFqqPT+0k+XRur0d@lists.infradead.org
X-Gm-Message-State: AOJu0YxAap/uqa1HbqnrkYHAnTNxv+eq0ERrPclVKPoGLza/xLFNaFso
	uW4O3qBJqUtBjz9l6wTIZ/vTRFiufa2FCSpmm3gZf6zPJD/oj/QDtUuVEKwVNKZI7Q==
X-Gm-Gg: ASbGnctm7bhFr13M9HdMftEqRNEQvJBnzzxJjOqBNUm4QJxxJH3+rRW9rYM8y7pXSvZ
	6VfDGFAk1WtPRYO9gA4dNOTZr2ME3uXOceqp/qJkAwSaJbEHJiu7iZGBfCOZnvaxQZQ0N7Uy6ww
	Z1QMGGfUTsCcyRE61ZK+g58L3sLZkL/sbt3S4MPNQd62j/kACSIhE3j57QBgTApLxVMXi1ST1BM
	bS0PGXuvxAkFXu4zVA4xTanZCKQOn1EOOt3peNBfuKVmmWwcE6/bljakXM2OXwGGciR/Nj8Z7/f
	fKrk3Lr3z6daQ5NC2Ku2FbQ7xK07NTG+gtDBeqGYDJoYC5NgGW35HAw3tqnFhGEv/Jz+IUaxUY8
	N6RAmLxpNyzhHpefmjWBvGlAlsgx8Opc6EfahS23ZP4mBrfoPV7w/28Zt3z9h9AbRfCFyMPFr71
	LJqGo4bB3olIyd5SsTdd6xPi0dNdORdXAFxJPDD08t5NBYH0z8gEaAecJhiyY0IUpFtD/40b3NH
	sxHZFmb9g0UlXyECD/K6MAe
X-Google-Smtp-Source: AGHT+IFNoWpHHgr9DMjNpMFfmlPDcxXbJRHzRrtGLWmztsEVr2SiPhFDxdBsTEMKUGnJfCeOhy8LQA==
X-Received: by 2002:a05:7022:4583:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11cbba58e50mr3870990c88.46.1764114513885;
        Tue, 25 Nov 2025 15:48:33 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30? ([2a00:79e0:2e7c:8:c98d:9e96:d0be:bc30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm89670760c88.10.2025.11.25.15.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 15:48:33 -0800 (PST)
Message-ID: <7ad91325-e881-461d-b39e-6ff15d98b3c5@google.com>
Date: Tue, 25 Nov 2025 15:48:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
 <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
 <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_154835_448983_69462C9C 
X-CRM114-Status: GOOD (  26.94  )
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


On 11/25/25 1:56 AM, Krzysztof Kozlowski wrote:
> On Sun, Nov 23, 2025 at 06:34:05PM -0800, Amit Sunil Dhamne wrote:
>> Hi Krzysztof,
>>
>> On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
>>> On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>
>>>> Add bindings for Maxim max77759 charger device.
>>>>
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>> ---
>>>>   .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
>>>>   1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>> new file mode 100644
>>>> index 000000000000..71f866419774
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
>>>> @@ -0,0 +1,36 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Maxim Integrated MAX77759 Battery charger
>>>> +
>>>> +maintainers:
>>>> +  - Amit Sunil Dhamne <amitsd@google.com>
>>>> +
>>>> +description: |
>>>> +  This module is part of the MAX77759 PMIC. For additional information, see
>>>> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
>>>> +
>>>> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
>>>> +  applications. It supports wired and wireless charging and can operate in buck
>>>> +  and boost mode.
>>>> +
>>>> +allOf:
>>>> +  - $ref: power-supply.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: maxim,max77759-charger
>>>> +
>>> This should be just folded into parent node, no need for separate
>>> charger device or is just incomplete.
>> Thanks for the review! You are right, the binding is incomplete. This
>> charger block actually listens on its own I2C address, distinct from the
>> main PMIC.
>>
>> I will update v2 to include the reg property. I will also add the
> AFAIK, the main (parent) device schema does not reference children via
> any sort of addressing, so reg here would not be suitable.

I agree that currently nvmem and gpio devices (which are children of 
PMIC device) are not referenced using any address. But I was guessing 
that's because they share the i2c client id with the PMIC and sharing 
its address space (implied).

The charger device while being part of the MAX77759 PMIC package has 
it's own i2c client id and address space that's why I proposed "reg". 
The underlying assumption I made was separate client id implies that a 
"reg" property required. But maybe that's incorrect.

I can understand the argument against having a "reg" property. As the 
i2c client id will remain same for a max77759 charger device (as it's a 
chip property and not a board property) it will always remain a 
constant. I will drop the "reg" proposal.


>
>> standard properties `constant-charge-current-max-microamp` and
>> `constant-charge-voltage-max-microvolt` to configure the hardware
>> limits, as this charger device does not manage the battery profile
>> directly (that is handled by a separate fuel gauge).
> Well, still, what's the benefit for the bindings to have it as a
> separate child? Kind of depends on your example, which is quite small -
> one regulator and supply. Grow the example with battery and other
> independent resources (if they are) to justify it. Or show arguments why
> this is re-usable.

The primary reasons for keeping the charger as a distinct child node are 
to model the hardware topology for the power supply subsystem and to 
house the OTG regulator provided by the charger block.
The charger needs to be referenced by the Fuel Gauge (which handles the 
battery profile) via power-supplies. Additionally, the charger block 
provides a regulator for USB OTG VBUS, which is cleaner to represent as 
a child node of the charger rather than mixing it into the top-level 
PMIC node.

The final goal is to correctly represent the hardware connections so 
that I can use it for [2]. The dts would ideally look like this:

```

maxtcpc: usb-typec@25 {
         compatible = "maxim,max77759-tcpci";
         ...
         otg-vbus-supply = <&otg_vbus_reg>;
};

pmic@66 {

         compatible = "maxim,max77759";
         ....
         chg: charger {
                 compatible = "maxim,max77759-charger";
                 power-supplies = <&maxtcpc>;
                 otg_vbus_reg: usb-otg-vbus-regulator {
                         regulator-name = "usb-otg-vbus"

                 };

         };

};

battery: battery {
     compatible = "simple-battery";
     ....

};

fuel-guage@36 {
         compatible = "maxim,max77759-fg";
         ....
         power-supplies = <&chg>;
         monitored-battery = <&battery>;

};

```

[1] 
https://lore.kernel.org/all/20250915-b4-gs101_max77759_fg-v6-0-31d08581500f@uclouvain.be/

[2] 
https://lore.kernel.org/all/20250507-batt_ops-v2-0-8d06130bffe6@google.com/


BR,

Amit

>
> Best regards,
> Krzysztof
>

