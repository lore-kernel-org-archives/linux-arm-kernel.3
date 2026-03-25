Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE1109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14O+rHUy9JUHv4nndxIKJLmJP+F4NFBUxwm3pxRAatw=; b=4pyC3FfNYiR5sYOugtV6hmvuqI
	SpBzRgUct7YNAuXyPPxUQHnIGdzkcu3rzU/bu+DMoDSaP/ZjOQ0TnZkkk/oQN1Ey4I6nLyEa0SiEk
	EJEq316NxIjOkF6/Qen59M35Vxo/AP+F00Cz7W09oCwYYYUXHOHUqILSU4IlYSMZ+/9RU7r7V0wL3
	fJpCj/fnWs6S+Bso7lojNqOUED8tRyYoDSd29vDgURvcXi1nsXxtNnaazYIN6URsds2hxlFHOF1CP
	TPAyIHkEAKecqSAwvqn51D2f9QkBgi8gJ5yKzA68LDjxXbv0x05nOnii3ZS/T9IyxXoilBVn0JkVb
	B02prMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Wmv-00000004N78-3Ent;
	Wed, 25 Mar 2026 22:33:21 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Wmp-00000004N6d-2jAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:33:19 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12a695044a4so804573c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774477994; x=1775082794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=14O+rHUy9JUHv4nndxIKJLmJP+F4NFBUxwm3pxRAatw=;
        b=dWvDWbsZtsDqbeF7qqkIqfAOV8X2jOLyAh+stnwweUfqsiPWTn9Yqtt+9c+NpsZ0NJ
         Ma2Hjaj8SLgVdi5NY26wgW0ckFpY6FkLoRmSH2xRmBOMzz2J04r3lblVOT8IbenG84/E
         HFBVvGkwU563KQX+yvlPq9y3f9YTLTZ7OGhbvxziiDT+T55XVrNjO2c2D1Ze3G3logXd
         TJLZZtt9ePkr51uRDBLJpJOkblWTSwb/AnHOyBfY6GyP+FEBQN7k6Usb45a9k2jHDCBB
         4kALjAO2ncuJZkBR+zfWjflGsDdeI64vIO0cJRzNd+6spiJ7u7Mx7IJ+xAahdVHPoC3b
         Uu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774477994; x=1775082794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14O+rHUy9JUHv4nndxIKJLmJP+F4NFBUxwm3pxRAatw=;
        b=NwAE4j+KzgbYW+jHf0GvlNli5N4iMJ/5OBmDYlIBSqkTcuM4VWD8Txk7uQJB6Xmul8
         Bz5XLKyZ0YKRvE7I/k2PHNohFKxgWuyMeFVdm9xprdG3Zf07A9nTkM1ZTiRgHd2ARP0w
         dgkogtP8GTCgBiXYPQV2ZmU8yNvkIjYUTk/wXz2d0YYwXgpqIdCAonEco3gMz2xpAFjf
         00DqpoiI13WWDJhj0WaRUCfv72w+ltJNaQjG+48nx4q7zJ3Ta7WRWIAF6nGBJUSd3/6x
         7fBKl7YG5ojomFB4BPg/21//dchCTyII+82Nb4pQl2+sUnmKi0M10ddv2+oFu8Igi2QK
         tsgg==
X-Forwarded-Encrypted: i=1; AJvYcCWunHWnC1A1BVsxZOJ5LewyEAcjRv8JqmaJlYjCIBjivNNV4czUhHaQtFnFjP9NV+gL8stQCdYbwAnh6tcdE2ot@lists.infradead.org
X-Gm-Message-State: AOJu0YylZdE8nXcFcDywQ5h5Q2ISaPgPefy+4aiv6mDI86MrUTxPxE7C
	YLSj2Wi6l90Ugu1crrRQLLQTGfYv7OM46RnxZkStpQjTMD7PI4b6LkRf
X-Gm-Gg: ATEYQzzckV3u++ZWwOdRis1Wm2/+sopfs8bmZof8UgeC8hVJsasQi0sI5U0XXxObBIi
	rKx0r8vXrNOTbDghFYM5vM0Am8Vg+kILKaxnS+g3Ekv8inHqAQbDjzb8LDSQCnWWUb5p15ZcgR9
	zmSbppsaN+hZuM6+4UuTmOMFfI3IK+Yp5zUPzmRsauBG8qk6TPXve65tOXYeoUXUlHW3hWvFxWJ
	sY70VpFxodTFUcX3UzgV+4STcoBkd8fIxIsG/lUegVYVG6zGyIKdzSG+CUhdOq/XpiJL8r5AjY6
	H9LmsDfRJ4/Tm/sQIInQXSfTnqDPsEuuEnOw4aXGV7FuJ9UK9wFlgTNl0l1jQ94qKLBUop1600f
	jTt1YB0uylcYPZ+pqxkXzqAy4tQ/rwcglTnlkYSstTNfcViVZ6prFa+t07JSTL4SyWHcjNy/OR0
	/Vv6m12he3GEc+csBmp37XRuh35WHpp4DbZGO3dneXBe/6crCWF/jLgL1+SXy/FjVi6IkODJ1y
X-Received: by 2002:a05:7022:402:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-12a96f04f69mr2620804c88.38.1774477994108;
        Wed, 25 Mar 2026 15:33:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm1567649c88.10.2026.03.25.15.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 15:33:13 -0700 (PDT)
Message-ID: <f016c567-dd37-4f1a-8c8d-5b8dc6a3b9a3@roeck-us.net>
Date: Wed, 25 Mar 2026 15:33:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Rob Herring <robh@kernel.org>, florin.leotescu@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
 <20260325215630.GA6513-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325215630.GA6513-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_153315_730748_FFD5F036 
X-CRM114-Status: GOOD (  18.71  )
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

On 3/25/26 14:56, Rob Herring wrote:
> On Fri, Mar 20, 2026 at 05:29:58PM +0200, florin.leotescu@oss.nxp.com wrote:
>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>
>> The EMC2305 fan controller supports multiple independent PWM fan
>> outputs. Some systems require fans to enter a defined safe state
>> during system shutdown or reboot handoff, until firmware or the next
>> boot stage reconfigures the controller.
>>
>> Add an optional "fan-shutdown-percent" property to fan child nodes
>> allowing the shutdown fan speed to be configured per fan output.
> 
> Why not a common fan property in fan-common.yaml?
> 
> We generally specify fan speeds in RPM (and then map RPMs to duty cycle
> for PWM).
> 

The problem here is mentioning "fan speed" instead of referring to pwm
duty cyle in the first place. It is not just misleading, it is wrong.

It is impossible to associate fan speed with a specific duty cycle because
that differs for each fan. It isn't even consistent for the same fan model -
one never knows what fan speed one gets for a given duty cycle. It depends
on the air flow in the chassis and on fan-to-fan deviations. It will change
over the lifetime of a fan. It may even change with the ambient temperature.
Fan controllers use a feedback loop for that purpose, but that doesn't
work here since, after all, this is a shutdown parameter.

I don't think anything but specifying a shutdown duty cycle is
feasible here.

> Also, we have (or can have) cooling levels defined. Perhaps we should
> define the cooling level for shutdown? Maybe other things with cooling
> levels need a shutdown level too?
> 

Unless I am missing something, the thermal subsystem does not currently have
a concept of a "shutdown cooling state". The driver supports registering
with the thermal subsystem, but it is not mandatory. Even if the thermal
subsystem would support shutdown cooling states or a similar concept,
I do not think it would be a good idea to mandate its existence or in a fan
controller driver.

Thanks,
Guenter


