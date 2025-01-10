Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BBEE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9Ojh4fi+Aury5PIzpaOVh6/pBCJ3O4TsGOr7mgb28Q=; b=Hq4YiOYytGxpv53l7DmpnPhloG
	JFPsFXl06tOddk07eYwpe5RUFPb8qE1+WPfF8jDWvMlxJxSbL30RRP1Cg211Jk/rgk2CZwhks+Azy
	W8vZuQXdNtltyKVdUejmWn398ybXYLx9bHVwBoKsZYMRNo7ig69Wk+XilvXMIYQ3UuS658eIz1dLt
	2qCXExIEWw27bO01vIhsBonjeWHSgKoqEdYgHiF8Eq3JzejfzA5UT2TrPpu98RS0thyzYJShXAYRr
	KvNjrcDGtlPskT9/szf/CFWZ8p3f2/9ayz6QMXOsneYpAOSd09QyvOpWjJ/sl/dNYYN2kHRZsPmnu
	gpPgdFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAVV-0000000EYfE-0t9E;
	Fri, 10 Jan 2025 08:36:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWARO-0000000EXcw-2JyW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:32:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43621d27adeso13083195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 00:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736497945; x=1737102745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9Ojh4fi+Aury5PIzpaOVh6/pBCJ3O4TsGOr7mgb28Q=;
        b=CsfFzs60EoutXZZdApbv37rYgk4ILJnlbiq+8PW10Zo/1sn09E/1CkeevQWd0HUbtR
         GA1i8RH4rQ8ya+MSfG/4Z7xhQvFgnbJ9amaQvaxdBRXBIFOnnviMMV9NAbLhYvY6B/vf
         cMO0gVMfaVCja7CicqrN0/hDNPuop4snrzKPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497945; x=1737102745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9Ojh4fi+Aury5PIzpaOVh6/pBCJ3O4TsGOr7mgb28Q=;
        b=vbkDmzQaGDx2ib3w/qp0uQUGLjfFXoBRuP56rsSRtSLcYuFo2vm6hlPe9Q0U9TzU3l
         VYzbE/fW9ujy+I+NFS1I+typHzVcxTyudp925HVAggRBDX5MCDU4cuKoH+Q7f5fySUCM
         C3favsCfDyeq4bS/afr332uW+jI2Id2qkwYGOuhi5z3Gq+Fdfjj0mNY0chlAOWwlXq9e
         7bcltv8PsR5J3aA7e7uAsxKAEWGwdE7KpxQf0dKY78WqnxY5fC4xLTW7eEu3zXpU/pB0
         dykfM/ypEet1RllfEb02toyL////Wu7+iRwfj+/KuXJdOgM8IEw+FtDgbhvksANgaqol
         tUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCURcZuQW8IddYGyQMNnFS/hJIiR6Tsv+PEIjUcnqUdF/HcFaKasqC4frCCW/1OfUCGN++in3pllFanIUGmojJb9@lists.infradead.org
X-Gm-Message-State: AOJu0YxqlEkhEHjnMG6FJoo+fm56R7OYhba0eKaPYA4S4rKobXwyjAGL
	vGhNGe42poja6r6QOL9CcvpFvCLiK/lpBque+Hg1wFbjcUuuAE+0NW8axkoezwQ=
X-Gm-Gg: ASbGnctvgb7gFOGT4IqIvSpl6EhcG9MUfRcWWZCh/n5iupaiOHJ73HCHlfci7pqZACE
	ISCy2Qkk2HbvHbEGmdZX6+VTwtRPmgmvGRaey+2uuXFSTr3YipBfafldbmc+HNKxUj52/tkkuBD
	U/gaBy81a5LETyEsTOvtBPLk7nhK6dzi4Qi6b9W57hjPnpVaNKLP0AYkmMqcvF/3UpNacBvMqcf
	y3ARZQ6ukT1urF8BAhvxCEUFL8MMpSZv5UHIm8dy8On23LSaaz0NMJJvgLg5UeflUAnvl8kwAHr
	mQ8kxFFxprfY0N4NpFk2bH1VU29lK0NoJWNyMjZprHKDq6NCS06hUVz4OgFbh6WGQQAOpgOtJdQ
	dF+1IwLzIstBpVKH/
X-Google-Smtp-Source: AGHT+IH5ep0YHccYyrjPGJ5OrRVVN6hg5ebfZqa5FUuFAYVb+0R1lAsp5xq987HIYz3aWTj1I0Yytg==
X-Received: by 2002:adf:b1d9:0:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38a87308c2bmr6760599f8f.41.1736497945025;
        Fri, 10 Jan 2025 00:32:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf78sm3872696f8f.48.2025.01.10.00.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:32:24 -0800 (PST)
Message-ID: <aae4c192-40b8-4f93-ab3a-7ba1da3a0a23@smile.fr>
Date: Fri, 10 Jan 2025 09:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, kristo@kernel.org, vigneshr@ti.com, nm@ti.com, afd@ti.com,
 Romain Naour <romain.naour@skf.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
 <8ff7ca4f-227d-40c5-867d-497e03bef72a@smile.fr>
 <begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_003226_860922_0FACE04B 
X-CRM114-Status: GOOD (  21.83  )
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

Hello Siddharth,

Le 10/01/2025 à 09:15, Siddharth Vadapalli a écrit :
> On Thu, Jan 09, 2025 at 02:51:23PM +0100, Romain Naour wrote:
>> Hello Siddharth, All,
> 
> Hello Romain,
> 
>>
>> Le 09/01/2025 à 12:49, Siddharth Vadapalli a écrit :
>>> On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:
>>>
>>> Hello Romain,
>>>
>>>> From: Romain Naour <romain.naour@skf.com>
>>>>
>>>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>>>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>>>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>>>> provide refclk through PCIe_REFCLK pins.
>>>>
>>>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>>>> module's PAD IO Buffers.
>>>>
>>>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>>>> ---
>>>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>>>> applied on vendor kernel for BeagleBone AI-64:
>>>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
>>>
>>> [trimmed]
>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> index af3d730154ac..32a232a90100 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> @@ -5,6 +5,7 @@
>>>>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>>>   */
>>>>  #include <dt-bindings/phy/phy.h>
>>>> +#include <dt-bindings/phy/phy-cadence.h>
>>>>  #include <dt-bindings/phy/phy-ti.h>
>>>>  #include <dt-bindings/mux/mux.h>
>>>>  
>>>> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>>>  			reg = <0x4140 0x18>;
>>>>  			#clock-cells = <1>;
>>>>  		};
>>>> +
>>>> +		acspcie0_proxy_ctrl: syscon@18090 {
>>>> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
>>>> +			reg = <0x18090 0x4>;
>>>
>>> 0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
>>> locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
>>> registers, in which case the CTRL_MMR region needs to be unlocked to write
>>> to that register. On J784S4, that happens to be true, which is why the
>>> proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
>>> which is the "PROXY" register on J721E as well, i.e. it can be written to
>>> unconditionally.
>>>
>>> [0]:
>>> https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/
>>
>> Thanks for the review!
>>
>> Actually the Proxy0 vs Proxy1 choice is not really clear for me. We have two
>> proxy to reach the same register:
>>
>>   CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
>>
>> From my testing both addresses works (maybe since my SoC is a general purpose one).
>>
>> When and why Proxy1 must be used?
> 
> Yes, both Proxy0 and Proxy1 work, but Proxy0 is the default access path
> when we look at it in the context of J784S4. On J784S4, instead of
> calling out Proxy0, the register is called ACSPCIE0_CTRL when it falls
> in the Proxy0 range, while it is called ACSPCIE0_PROXY_CTRL when it
> falls in the Proxy1 range. Therefore, from the perspective of the naming
> convention followed on J784S4 for which a compatible was first introduced,
> Proxy1 address would correspond to the ACSPCIE0_PROXY_CTRL register.

Ok, thanks for the explanation.
I beleive it's worth to add it to the commit log.

Best regards,
Romain


> 
>>
>> Otherwise I'm fine to use  0x_0011_a090.
>>
>> Best regards,
>> Romain
> 
> Regards,
> Siddharth.


