Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14FD29C57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/iFQ+cGrDnzb99VgFwhl/BYFJFd6sdYEbVS6eQMIFs=; b=i2unEAMIACSOTowmW7nPEzh5Ox
	dYHmpHaEzbt3Dc074TpgQYHXvsRgl18pjz4tx3I6ldgKRJajIG0mIoG268gHU09O6g2OoHlRKCvFG
	g8BT74jk/pqRldpYTFXR5fgS0ql1z4nLpsrDyUneYG6utCFyW0Cw/fyNSrpWX53+/YmZ3KxAjlij2
	K06LQTRSWFP3AXTM4rGkV4XtAbSbDyZwcF/do9v2IP07m0HaAAVk7oI+MUnmlJvAJolZa39QMky8d
	EA7gnQEVI7OfqdWXv3l3OqWuovTywKktRYFfeKEyRrF7U6uRlXjJsvS424EDIxXa2/E+i+YuBQj+1
	jb9BSu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhti4-00000002gnO-0D4W;
	Mon, 19 Jan 2026 18:10:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhti2-00000002gmv-47FB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 18:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k/iFQ+cGrDnzb99VgFwhl/BYFJFd6sdYEbVS6eQMIFs=; b=YJQmx4r2/PeXAnS6QJgy27zeLH
	4XJBtqP8sIOTc4YOhCOofmwN6pI1nFqNflrRwAHQ4RLwKTWAMpa5ZXswGR46Mr43hzj0uKef195Ki
	9jQ6tubZRGENQQnVy7cezSuA1L6yv4SqsPhXYzdXAhzeB/XaA6oGLBs65OE46fQNreYRJwmpl3Sug
	MzxZvMFseZwY4uAl4PjdFjEV45uH4hw1QqelN78yGgJlODrfd65GfeTW8E5NBq6uTnTOCZntFzXge
	hO5eAuHs2IYUe0Jgu9E7nodtSMVdUZOM4YiRadR9uR9MoCa5qvALIJLCfDlB9ctIag4hWJWmpYbVn
	QXxDJFxQ==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhthz-0000000CkgN-0q8w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:10:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b87677a8a96so89056866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768846233; x=1769451033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/iFQ+cGrDnzb99VgFwhl/BYFJFd6sdYEbVS6eQMIFs=;
        b=P3jrrHnhy5Q8CRIf17FdU5ruMu0b6549E4miCJCSYgueXqxXSQ+Dk1wReCjXgQdk0v
         IaLvLiW+HpAW6DAQvvUpfxmOX/9KoC/TppzttDIimGQ6e6MWYMR6W1Blapi0e7NsUJl6
         dx7YwAC13wCQqJoKYXDkpQ2uj4W0TyZp4iIVgQdu02Twgwr4KMS75gMKfUE+q5sqnTYP
         RaVZghEkU2nVN41KgBRtKRWMPk/5UOU15/US7gyD+aCXZuLVY96gMlLYD/U73O6H4Y67
         8lglum63EmW19DXOylyVZ1GocQ0251u569CjEfP3zzwiUjW6V/nRKRGZY8aEb1TgoQ+Z
         DVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846233; x=1769451033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/iFQ+cGrDnzb99VgFwhl/BYFJFd6sdYEbVS6eQMIFs=;
        b=ivcpha/3t/9MdA+8g+7GUjnM8MKigvKplbcXH7Jpd+jZ2i7fy/u//8/mL0z8OhUV7A
         VkppN86/dg0q43jnUsQ0a6h9p3KkpQ76taBLwfc73nxP45y0Qt0UzXCvW0/GQvQJrulC
         ZNDo1wEEVyVnF3oc/S5h8NXvSAXO1SN2WpFhpqh+nbUwasNPLkDyPAch2g0QVWNlAOp3
         itX4qjPhyU/uYMx0Ft6yrKKNG+nvdlXtYOBLhx7mydxMrTXoUb4GxKZNaFytUb7yb7Zl
         N3LIEobzVE0hcv/kWRJr4AJjYsVQdzhManQjXhj9U2Rr8ciAmgH7jienGSFVnNtvUTdS
         zNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyH4sAqc21PvfDZyeYxTAkcRgftGG6NSttmlWhUodV1qWcAOCJLp8JDAw130cAAXQxD1k9zKJigaIkJ/In3A2U@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2iR8dIznDf30uuCHuwOLIN7zw4IwOOmHqUcti9S3DD/SZQCZU
	7Ja9qJnK++7rRVBDGJuTy2rFQhFicQ386aOOuXBKOwuu/etPfKmWVSJhuXib3A==
X-Gm-Gg: AZuq6aLAm6JWy4c9vJo+SD8pjxr8TOJt9ei2rYlOWMkMFFM3/Ec6M1sc1oed1n5o84q
	hq4/9itB3rg50hkLGjzulkUwfym9CJ2AOR3yyKNRXdiAQwNNUGHzyAlVH/Y7axQgQ3TOepZKcVK
	TODtVIC+vggjgmiKFqK3sccb7qEgn2qwb7Wh2u0Siih/QuTktvh/hq4/TUAeBmdKBlUzj/LKvU8
	LPJ+jIwMiI6t5kmccx+cd1oI1PULU8OQQ4DrGoUf9svF9zcczgSm+mqY8KoAa6zKtRZLh49SVMf
	G+PTutrOBpAJd3e4jp896QpGMF203n40a9l22vnpOldtRhFYYhjm/T7LT3ixVH9I6HRgSPF3O1N
	ceekRb9B4bWBKt9waIasQNyJbnT/Vq2L9tf1xZ5Yqd3hI3O992NTeSKd5qn4jYFKDFXr6zr4SkS
	j4gEGB6MsYDqP6XRKEOROVvS8U9yTWHbUmZgy2w5C95b6RzvgPWw==
X-Received: by 2002:a17:907:7b93:b0:b87:301f:6172 with SMTP id a640c23a62f3a-b879323cac9mr694566866b.6.1768846232600;
        Mon, 19 Jan 2026 10:10:32 -0800 (PST)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fb973sm1141170966b.53.2026.01.19.10.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 10:10:31 -0800 (PST)
Message-ID: <e4ebdde6-4073-4dd6-aef2-abf2c293a48d@gmail.com>
Date: Mon, 19 Jan 2026 19:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3036: remove mshc aliases
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de
References: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
 <c4c17773-1146-4db9-bf2f-a7500a8bd734@rock-chips.com>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <c4c17773-1146-4db9-bf2f-a7500a8bd734@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_181035_317360_989FC0B0 
X-CRM114-Status: GOOD (  19.39  )
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



On 1/19/26 08:08, Shawn Lin wrote:
> Hi Johan,
> 
> 在 2026/01/17 星期六 5:05, Johan Jonker 写道:
>> The use of mshc aliases is deprecated for some while,
>> so remove them from the rk3036.dtsi file.
>>
> 

> I noticed that the alias property is still listed in the
> documentation[1]. Could you please share where it has been formally
> marked as deprecated? I may have missed the update.
> 
> [1] Documentation/devicetree/bindings/mmc/mmc-controller.yaml

Mshc aliases driver support was introduced 2018 in dw_mmc.c only and before that a undocumented copy paste entered somehow into dtsi files.
The mmc-controller.yaml file change in 2020 mentions a fixed index mmcN format.
A generic alias name "mmc" is now preferred instead of a "mshc" driver specific.

As suggested by Arnd Bergmann and others, the newly added mmc aliases
should be board specific

Discussions about Rockchip aliases started around 2021
https://lore.kernel.org/linux-rockchip/CAK8P3a3_uO23Y0tyfdh26tmCVcyp6XM+ur0WUd4khGUoBb32Hw@mail.gmail.com/#t

https://lore.kernel.org/all/CAPDyKFp1zMBUfK7LteW0yEfTpqtU+P+EybLsJBFx_r54HwFdMg@mail.gmail.com/

[PATCH 0/4] mmc: dw_mmc: start deprecating mshcN aliases
https://lore.kernel.org/linux-rockchip/20211124184603.3897245-1-john@metanate.com/
====

Nov 24, 2015
ARM: dts: rockchip: add core rk3036 dtsi
https://github.com/torvalds/linux/commit/faea098e1808729e4785cdba3a3fc52fae49f1ab

Dec 19, 2015
ARM: dts: rockchip: add the sdio/sdmmc node for rk3036
https://github.com/torvalds/linux/commit/187d7967a5ee630ae062fb543655e59d2f0f91fb

====

Feb 27, 2018
mmc: dw_mmc: Factor out dw_mci_init_slot_caps
https://github.com/torvalds/linux/commit/a4faa4929ed3be15e2d500d2405f992f6dedc8eb

====

Sep 7, 2020
dt-bindings: mmc: document alias support
https://github.com/torvalds/linux/commit/1796164fac7e348f74a0f1f1cae995b22d002315

Sep 7, 2020
mmc: core: Allow setting slot index via device tree alias
https://github.com/torvalds/linux/commit/fa2d0aa96941e8dc347e49a04c75468e3002ee20

> 
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>   arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
>> index fca21ebb224b..78afae42f8b2 100644
>> --- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
>> +++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
>> @@ -23,9 +23,6 @@ aliases {
>>           i2c0 = &i2c0;
>>           i2c1 = &i2c1;
>>           i2c2 = &i2c2;
>> -        mshc0 = &emmc;
>> -        mshc1 = &sdmmc;
>> -        mshc2 = &sdio;
>>           serial0 = &uart0;
>>           serial1 = &uart1;
>>           serial2 = &uart2;
>> -- 
>> 2.39.5
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>
> 


