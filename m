Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00075D111A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAe7krNX/FWdcfazYkx0OEalo6w7fciX1p3CljsQHjE=; b=f5a5BuGla5U/1DTU5zJGviDTLI
	HM5LMzqB8N+hvaQg6/rGO8pdsE8IaOSUYi792uwGuQvqzmJ96qQn2+8T2UJb++KJ6+9XcBOVB5jtf
	3T1/BKh0eV4X2k4jZn0v9r4qExDFeEp/2mB95A7vvfAEtxczvMQha9E4bS7OrHCHYwW1vAq27cLP8
	ew9gzfGL3nkmTwq6RoX2EpDjAgH05QQPvkQrvdGGGsFzpebJ7tBaTNCGpbQdzOHPLvOsoXAjaIQdR
	uw+IPUHGEki9HKo49qJ/NT9/h5zFWTjyI97RxVE7LJTVzHNoP/dJYbjyqYWgqBTMxzzIymjbLKTFf
	DYv5Fg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMT2-0000000FdcW-0FvE;
	Wed, 26 Nov 2025 20:50:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMSz-0000000Fdc9-41R2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:50:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-298145fe27eso2973225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 12:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764190221; x=1764795021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAe7krNX/FWdcfazYkx0OEalo6w7fciX1p3CljsQHjE=;
        b=GVuxb1fn42KI8QMs+mTnRVY0UsyS3St7s2QYgu/rPrbryJ6zSjBRf4MsKmkuTJ9jYo
         Zb2TXrNTYVdBG9dNwk44ekJqUAtOEzdnhAZv0ln8J42+YP0mKkbUYUuItOwUZZ4NBIpl
         dVpFJayQ1m0j7qomYp/wOFrXzfOQzplJ3rd8xO5L7b3vuxXyKZqMjyLIx640sgO5A5Dt
         kOny1D856128fowCOmA6tF7/Syu5Ia8EKjs1ng5F57BSYZHtFLoKbn5wAFmRWn3WZu8G
         8tWGg0szKMUscsEkQjpK6mm1NwUOh6KZGjWzsUeLFCOdLHNdL0XJF8iY+vDF/Ic5eRXO
         K9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190221; x=1764795021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAe7krNX/FWdcfazYkx0OEalo6w7fciX1p3CljsQHjE=;
        b=M7slEvWYdM3rzlguZqxFGloygJ/6Nr4kOJOJS5Xbekt6bA1RjWDaQNU22A7cz/VXwu
         1VAPEUKql9HK/oXYxxCEj/oWp9yGndJlNZF2GvSH0XKfyQh8WkN0wuRkFrA7xz0UGUin
         dBHahVyUZVAqu88ECVJYZpM7xUuoxCvN9LWB5fTnPTJKIBxrJE24uFNYxnLSD3ZLEs+a
         LK++Maxg7cMqgl/S9Y2W6OdEZjE1AxNFbool0ZJSRYdGfqiqny5QsLtQrKRN3MY6bKqG
         DLN9e+K3rY3EbOOL4p4Np4gubfn/Cgty4J1//64SObRonOY3GUjBI1datdzdzikBHgY8
         OUPg==
X-Forwarded-Encrypted: i=1; AJvYcCUEoiTPkvmTmoYUvjezOy08+yNcIgVh4p9jXh3tGJtCEOe0DmcX1DSAfOeoTKTyqW/JszEPCzE73RcCUQbGISmL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Q8OnjR9ZN17Wcb9//m91pRtyxhDyoLy7/EoE3yNvHbjerZFk
	2MNPPxSCYQs79Fgn2VsrcWPHbg10vj4E2GoQ1Aq1Hg1ztM2Vom51XkWqrX3KZC0VzQ==
X-Gm-Gg: ASbGncu+WpGhvXDuqCfol7PXlC10gJ5ZLilG9GXyiLH931xjiCw/yyYm9QIst4V20zJ
	WJshojUluDbj0REcYNAnXfucxiQFaU/u44bOe5jsapzN2PFVOT6ElbBk58ptyRaWaWhG0OcYtos
	hlYn4c56nm6Pu0HnNzbWLPq0K0gdm10qVzkLG2RDgqWNTh4h2XMDhmbPYKzREqxI01I1OP1fMiW
	7b8ldT+i4MwSbwSrwC4acFkozF6TuAE7BYhLWQO1vjeS/ygtnFSc/4FJLVEN0PJmGUjiknm5Fqp
	FKQWrFn943Na7uGlVlydnRCvNrv49MJY/pQdTXlNmw/noWLvyebX+ORt3q8NmLYNeqjf8YVOs8v
	0llv+uazZrjBiLoy3VjHFfjh4xUQ+GBc0b1/uPabN57BmCNtGh5psTtHOJPLqfKmn6YpuavW1wu
	B+mbOS+63NKBZj2fawBSOwBoASWgui0jOC2IEcVmHU6WVworu7TORZH7PTodq+QWsvp+gb2cJ6a
	jnbrRqjAtWvA4UQs6XcMQ5U
X-Google-Smtp-Source: AGHT+IFjQZz19LkV6uSbQD7V0osJzTvl1J8TedsGIZ78YPP9aLGTQiFmGEhYv2+QMQ+JGAYgRK90Dg==
X-Received: by 2002:a17:902:d4ce:b0:295:596f:8507 with SMTP id d9443c01a7336-29baac9f621mr97893625ad.0.1764190220828;
        Wed, 26 Nov 2025 12:50:20 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm203367425ad.27.2025.11.26.12.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:50:20 -0800 (PST)
Message-ID: <3c72e1f3-7873-4f13-a5cd-0aecc5163aab@google.com>
Date: Wed, 26 Nov 2025 12:50:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
 <aSbP5OanDUGhEXXV@kuha>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <aSbP5OanDUGhEXXV@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_125022_032961_25796B9C 
X-CRM114-Status: GOOD (  21.10  )
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

Hi Heikki,

On 11/26/25 2:01 AM, Heikki Krogerus wrote:
> Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne via B4 Relay kirjoitti:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add a regulator supply property for VBUS when usb is in OTG mode.
> What is "OTG mode"?
>
> OTG is usually used to refer to the USB in device role, even though the
> specification actually defines OTG device as a device capable of both
> host and device roles. So the term was confusing already before.
> Nevertheless, the emphasis is always on data-role, _not_ power-role.

Thanks for the insight!


>
> Here it seems MAX33359 uses the term OTG as a synonym for "source", so
> power-role?

Essentially. The datasheet refers to the mode where VBUS is sourced as 
OTG mode.


> Please don't use the term OTG unless you really have to - it's too
> confusing. I know the MAX33359 datasheet uses it, but what you really
> do here is regulate VBUS. So please:
>
>          s/otg-vbus/vbus/

I will drop OTG term at least in the USB world and restrict it to the 
charger driver.


BR,

Amit

>
> thanks,
>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> ---
>>   Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> index 3de4dc40b791..a529f18c4918 100644
>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       description:
>>         Properties for usb c connector.
>>   
>> +  otg-vbus-supply:
>> +    description: Regulator to control OTG VBUS supply.
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -53,6 +56,7 @@ examples:
>>               reg = <0x25>;
>>               interrupt-parent = <&gpa8>;
>>               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
>> +            otg-vbus-supply = <&otg_vbus_reg>;
>>   
>>               connector {
>>                   compatible = "usb-c-connector";
>>
>> -- 
>> 2.52.0.rc2.455.g230fcf2819-goog
>>

