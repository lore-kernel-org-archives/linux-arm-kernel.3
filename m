Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15723D3E2DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C1nIRdVvB18ebQ3for2XC65VIyhOskwKvhIjCaNvVI=; b=xvO6qnRjyXojzDV/6gebXMd1kY
	bMFln2gRk0BMQIz3b4lUQJWlpXahAdyVK0r373P589QIp+AZc3MVVXS1ht/90+3+iLeMwM6uK/f6S
	g+Ed9jOFAdqljk+ZjTLu1tOvwISWCD3E5+OP1v9Gg9l0h+bn44jSlTXGrKLjLW2vnR2znA2+4KBO6
	Q44FnmSyzIm3+GcjHhSA/LZD2RwoLhTFFhYe0Gr58JPcPynr0ot8whPfCEHzFYNiytMSKkWIkGJFq
	hsGm+WULRX0luKjXu3BMZj0sVlD+IqkmUPgymGMlvcpKK1l5C76yu7aWHLeUOxr+Ie/z2y5b5xfF8
	w8xwdlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h5Z-0000000DbBQ-1XHK;
	Tue, 29 Oct 2024 07:56:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h2o-0000000DaXh-3svy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:53:40 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53a097aa3daso4470527e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730188417; x=1730793217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4C1nIRdVvB18ebQ3for2XC65VIyhOskwKvhIjCaNvVI=;
        b=CMfp6w1Ijs8Veu8HWOeOUOOldlD0dVh1yJCB3KPNxSrYayqG6dTczZpwQiJQztEHcU
         q/dqYfWGig7fthsiQFlA7besoIbWQUquI/K6bTQhPPsXCc8TY0xNJVmye38Y5t6W2AMb
         ruIR6nldBeDNugRxS5zn+b8QW4uJOnSSgkn8H6PPNrWbDhe8LG2M/nxWJp6rt3lA9X3Y
         gN2YmejXhHse1Z6Pu2QtX9PqwQf1fLdcrbwKdeSm78hleg25EV0QNVudVFkzshc5N6JS
         73n8t8L7+py8pEt7lTQHzN7LzSpDasfdbC54tcDamfmQYMi0BxVeKzeFY0XwfYNILN5E
         wu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188417; x=1730793217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4C1nIRdVvB18ebQ3for2XC65VIyhOskwKvhIjCaNvVI=;
        b=VDTo/NzhI20mRQQRJAvzGmDKLMEd6YUC+a3yTmkR3stzeC3CLgDRUz+cqjuXGayKx3
         IUTLrWCPqeo3vYWPFTaNY4MNP/DYZ8CVynr/Alvpct8iZ3YvKaxgmRCopBN59TOGPCy0
         T+8y8mlFPqEZrld0Sun4zgQ4HfaADlZz+AioXhFkkXOgXTyd3Dvxy88wk2CNcAcN1rMa
         o2xiemo6twIUcO4QaSKGv1ASLA88rFofEtvWLaARu1GmKUPR45Dy2Dh9bFi8gxJPZVVC
         mXcyVpOcaeX19PCQXrmbWAJBzFatxL4kxgjcbidQJ7Z0YBcRUCr5M9ZhXZa68fDk/ptF
         aF9w==
X-Forwarded-Encrypted: i=1; AJvYcCXZRTfP1wZoQs6adFKSIiuQNh0Q/ISzyt4lIHGn/k61Ah3OMAKQcykIZP3Xbf0M9T7UX2h0F7kXAUI4KQNiOUpi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7eIodGNXad5uTQ7FaZaOU3YAyz0TDpx8RmINHaPgscuLY3UXu
	N83l12PLOI68JipUiJvAQ9wG34qXZRut++SIMXPkzrqQmSw4m51V
X-Google-Smtp-Source: AGHT+IFX3omEHoD4JMYIBlaDhHQFN4sNVOKfMjc39GiZe38I9QMTzCKzecpErYGK0y+EHQaRGeWtVg==
X-Received: by 2002:ac2:5683:0:b0:539:8fcd:51f with SMTP id 2adb3069b0e04-53b348deb3bmr5368808e87.30.1730188416343;
        Tue, 29 Oct 2024 00:53:36 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de04bsm1296446e87.247.2024.10.29.00.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:53:35 -0700 (PDT)
Message-ID: <f2bb661d-8ef5-43d4-aece-c7fec01ff9fe@gmail.com>
Date: Tue, 29 Oct 2024 09:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: imx: Add devicetree for Kobo Clara 2E
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev
References: <20241024142206.411336-1-andreas@kemnade.info>
 <20241024142206.411336-3-andreas@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241024142206.411336-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_005339_011154_2050C28E 
X-CRM114-Status: GOOD (  20.21  )
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

On 24/10/2024 17:22, Andreas Kemnade wrote:
> Adds a devicetree for the Kobo Clara 2E Ebook reader. It is based
> on boards marked with "37NB-E60K2M+4A2" or "37NB-E60K2M+4B0". It is
> equipped with an i.MX6SLL SoC.
> 
> Expected to work:
>    - Buttons
>    - Wifi
>    - Bluetooth
>      (if Wifi is initialized first, driver does not handle regulators
>       yet)
>    - LED
>    - uSD
>    - USB
>    - RTC
>    - Touchscreen
> 
> Add human-readable comments for devices without mainlined driver and
> binding. Such comments can e.g. be help to find testers if someone
> starts to work on the missing drivers.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

...

> +
> +	pmic@4b {
> +		compatible = "rohm,bd71879", "rohm,bd71828";
> +		reg = <0x4b>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_bd71828>;
> +
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +		system-power-controller;
> +
> +		clocks = <&clks 0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "bd71828-32k-out";
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-reserved-ranges = <0 1>, <2 1>;
> +
> +		rohm,charger-sense-resistor-ohms = <30000000>;

I am afraid that this one is _my_ very much terrible brainfart. Yeah, 
pile up the stones and start casting ;)

I am fairly sure the sense resistor is 30 mOhm (0,030 Ohm), not 30 MOhm 
(30 000 000 Ohm). (And I am the one who misinterpreted the M in some 
email/data-sheet in the past - and never questioned the sanity).

In short, AFAICS the sense resistor is added "in series" to the system 
load. Eg:

           --------
       ---| Rsense |-----
      |    --------      |
  ---------           -------
| VSupply |         | Rload |
  ---------           -------
      |                  |
       ------------------

Hence, by measuring the voltage drop on the Rsense gives us the current 
flowing through the system ( good old U = RI ).

I believe having 30 Mohm (30 000 000 Ohm) resistor there would not make 
much of sense... With a Fermi estimate that the system works with 
voltage magnitude of 1V and current magnitude of 1A and then applying 
good old P = UI and U = RI would give us wonderful results :) Quite a 
battery on poor Kobo, right? You'd better to not touch the battery 
termninals ;) Oh, and looking the driver code I've written for handling 
this property... Sometimes I really don't like mirrors :)

Well, now that I got this out - I suppose this could be
rohm,charger-sense-resistor-milli-ohms = <30>;
or
rohm,charger-sense-resistor-micro-ohms = <30000>;

I further guess there is no upstreamn binding doc for this property. I 
think there is also no upstream charger driver for the BD71828/BD71879 - 
only an early RFC and some downstream mess - but stil it'd be nice to 
have the property in place as the size of the sense resistor is needed 
when converting coulomb counter register values to current.


Yours,
	-- Matti


