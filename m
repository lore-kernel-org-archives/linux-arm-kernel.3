Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86438107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvpzVosN3fzG6HUFZ5xf0+PeJenGWuukw2/bPevXNSU=; b=NbBCTkyru4c6H74XEJQtimZ9Ef
	kliZjkMhGpCfY6Jn19HI9h7IUnGLqyAYCgCQzvd84iO/PgxgDcRxWgz1wL7nKvmZnKHdxPAsCdU0j
	wypqDD6bynkTdUeJHcPWr4222xcOWHED0jceZLCA+B0XInMPRj6wvxQngVTznbivM9tGuUdPE3J9Z
	5axEpU5MTI80I0wwMwgYHeWIrkXbQjVL0ZjX78yvdhLW5gY/58Xuvv38GKNKGS7vm40KynGKW2eHV
	yOfHnyIesH/J9B4+jPhcAqhzWg+e2DudjTwYCFU6pMvmnIKgAIky08LCUFA/sHuPpR58ASvKkjBJe
	7eG+lB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16zz-00000000rf8-0rIa;
	Fri, 13 Mar 2026 18:12:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16zw-00000000re2-12D8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:12:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829abaaa92bso1651964b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773425549; x=1774030349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EvpzVosN3fzG6HUFZ5xf0+PeJenGWuukw2/bPevXNSU=;
        b=JjeXU7ZDvYHIva0FXmzr201329COEUaqFVm3TqdW7RjAbXh4C+Slb3INvv4j9pfYUk
         GQLKdpwfDTBIm7rZw3BqF2n9lING+C7X7oZ1S8i3wsqVAY+Oyp5ZtBfY/m/w8tJFv+3x
         DVv5Ml60KcRVJHlbSHZsINOsIIZVUUFzOJKtK1hyA6A8mRpyo2UjHwoADahtQO++h3V+
         yXpGi6dStmoKtf/eip+SRKz9OWbk4rSx1X/ZM+NPhDY0HiSwTndSDW6Eao0F+KkOmt/y
         PIKLBd+70ZQkUbVZ0x8NNZknXWXI2jFLFAclcmNC9W+1MUu4FpzVShFkcbrBjbBnU8An
         dh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773425549; x=1774030349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvpzVosN3fzG6HUFZ5xf0+PeJenGWuukw2/bPevXNSU=;
        b=ZoMx3JD6xiQi1OJQS6cdMJgHaITXiHlw1LFWHIkfp3EbqH7CtJTsqsNk+JwShJal+8
         oFz+ExmD4X+R9mf8VIu8UgRSDPUNtMqZU6utcx+/FsbBCH3kJsMMi7j1xdkaeRGmcFyG
         gT7P/jHPqiQaxgSW+x7VrAzgWQ3/cSh1yQ96fvA1rdR4pX3Zdq/EolwfX4yoC/GLnOis
         3lhTbFBlxMGxf8qCEWKMuJCWztKS7qHo3cFeukX54hPeZM//S+iibQCi2BuL2tA1QDzb
         Tbqf/SeR0EzyyDIPiFdND3lOqaB0KRj9vu7yrxrvTUaXl0juLRMWW+/LTRh913Usq7Yw
         7djQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtWpBj33IhtTxTZVe0VMAbsk9lXXzY9MnoxMqFgGX3GUCnCFIwHA0olfnl5SfJmRxxAn2x8qLUZi4mU4I403Ph@lists.infradead.org
X-Gm-Message-State: AOJu0YwygBBHjflkscR1NFY2q4ECHGg02zVEdUovIT3jkimqJjD/9hfv
	8Dpggcne6LHrzxa5lEIcqBOIIL329/cVI/IjeTskqo01EdldQpqqycRy
X-Gm-Gg: ATEYQzyCvMbJOQ2RaW7h6udAE1vMd90AuUfr0uUor9p3ZPEI/lCP5l4HskXWSY93/fI
	1OomZRAuFpQVeRuu51t5atJix/sp+FvzYBx8Y1eicTktdXoHpG9pxgWSzUOS1tFsWw7eesXWVpM
	tHV5m/qKEFDvuPYPg2oav9eW8IkBsvgfm5fXm9r2I8XPa3yKmsNTqGv1KhcnNGaAsn9/g1VLcYq
	SfOb8lEcN1mk9WFPdtnshysVrZP8VLMyuMYrAGT5AOVVMkz6sCr1X0OPNR3Nhl+I/o71E8/VfHb
	tB0GEKYyE86f1y1hCR3tS0BXDDTMf4x7966DibwyJTQtjCY0SDuATFsBI0TqYiy4ZHP1rhrb0WW
	ODMM3Rj+4zDDiEYN9d0eYWxIWTZQy83EMWSISjxATGh/uwpFGR+HZxpmabIOvMg97JEXduhMrlx
	HQYeiUrgpoWFB9xJfE8021TLkifgWdeZPc/C8s95VLXAfoTqqq54+Gu9G2kn77Zg3DbMaZKr8z
X-Received: by 2002:aa7:88c2:0:b0:81e:c67a:1a79 with SMTP id d2e1a72fcca58-82a198661cemr3988947b3a.25.1773425549120;
        Fri, 13 Mar 2026 11:12:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07240f25sm6667100b3a.5.2026.03.13.11.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 11:12:28 -0700 (PDT)
Message-ID: <cbc1d09e-25b1-4b94-a59c-6b5e54af01f9@roeck-us.net>
Date: Fri, 13 Mar 2026 11:12:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Conor Dooley <conor@kernel.org>,
 Florin Leotescu <florin.leotescu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
 <20260312-triage-shallot-1b3d9f07d250@spud>
 <abRF+TPKuXFDJc55@ro-kernel-workstation>
 <20260313-mulberry-glamorous-6afbfc52e42f@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260313-mulberry-glamorous-6afbfc52e42f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_111232_301169_D7C917D7 
X-CRM114-Status: GOOD (  23.26  )
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

On 3/13/26 10:38, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 07:14:33PM +0200, Florin Leotescu wrote:
>> On Thu, Mar 12, 2026 at 05:37:51PM +0000, Conor Dooley wrote:
>>> On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com wrote:
>>>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>>>
>>>> The EMC2305 fan controller supports multiple independent PWM fan
>>>> outputs. Some systems require fans to enter a defined safe state
>>>> during system shutdown or reboot handoff, until firmware or the next
>>>> boot stage reconfigures the controller.
>>>>
>>>> Add an optional "fan-shutdown-percent" property to fan child nodes
>>>> allowing the shutdown fan speed to be configured per fan output.
>>>>
>>>> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
>>>> ---
>>>>   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> index d3f06ebc19fa..7bcadfab9fc4 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>>>> @@ -54,6 +54,12 @@ patternProperties:
>>>>             The fan number used to determine the associated PWM channel.
>>>>           maxItems: 1
>>>>   
>>>> +      fan-shutdown-percent:
>>>> +        description:
>>>> +          Fan RPM in percent set during shutdown.
>>>
>>> This sounds like something generic, that other devices might need and
>>> should be in fan-common.yaml?
>>>
>> Thanks for the feedback.
>>
>> The property name was reused from pwm-fan.yaml where it already exists
>> with the same meaning. I kept it local to minimize the scope of the change.
>>
>> However, if you prefer it to be modelled as a common property, I can adjust it in the next revision.
> 
> I see. Makes me wonder why half the properties in pwm-fan aren't also in
> fan-common.
> 
> I suppose there's a reason for it, carry on I guess.. Can be lifted if
> there are more users other than you and pwm-fan.
> 
>>>> +        minimum: 0
>>>> +        maximum: 100
>>>> +
>>>>       required:
>>>>         - reg
>>>>   
>>>> @@ -80,12 +86,14 @@ examples:
>>>>               fan@0 {
>>>>                   reg = <0x0>;
>>>>                   pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
>>>> +                fan-shutdown-percent = <100>;
> 
> Also leads to the question of why these devices aren't pwm-fans. Too
> late now to change anything, I just wanna understand why.
> 

They are dedicated fan controllers, with an internal tach -> pwm feedback
loop. I don't mind modeling them as pwm controllers if there is a use case
(such as someone using a PWM output to control a LED), but I don't even know
how modeling them as pwm fans using the pwm-fan compatible would even be
possible since that would exclude the tach -> pwm feedback loop.

Also, if that were to be done, we might end up with two hwmon drivers
for one chip: one to report the fan speed, and one to report pwm values.
On top of that, even if it is not currently supported by the driver,
controlling the tach -> pwm feedback loop would become awkward.

Yes, I understand, there is a strong push to model everything with
a pwm output as pwm controller, but si far no one was able to describe
to me how to model a fan controller, and especially its feedback loop,
in such a scenario. That becomes even more complicated if temperatures
are used to control the feedback loop.

Guenter

>>>>                   #cooling-cells = <2>;
>>>>               };
>>>>   
>>>>               fan@1 {
>>>>                   reg = <0x1>;
>>>>                   pwms = <&fan_controller 26000 0 1>;
>>>> +                fan-shutdown-percent = <50>;
>>>>                   #cooling-cells = <2>;
>>>>               };
>>>>   
>>>> -- 
>>>> 2.34.1
>>>>
>>
>>


