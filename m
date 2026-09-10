Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7339DC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=; b=X5cGAvY1fMI51d+XyXUwtWxFbM
	896o0DY5TPDP1KtnXTcKntCXNOfEdvYplgBiuZG6qnssWDBIertNplyA80JaWWT1q/PCUdtOSdy7f
	+7omXDml/9ozTOUmVuxn8G9ed561wIEnaZRmc8bdYosh1j4wLVHLV3FQ8xW3CH/ORw7e1+oZKiEvI
	x04nxYa3QOeZLOglvAja1d2HAFEHs1fPW8oBMxVC2Sjdtg9YTagfQ5gEYL3Jil1hr3uVg6hLxzDh5
	AWaONpMjhBkuHirv71tf3j+KsNK31Whld5xBpb1RI1ufzkA3Xqo6jaqZ8KAn0sFhSmC8k8bvCgBom
	tLhrsPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i2I-0000000F0M1-3ZMo;
	Thu, 10 Sep 2026 16:54:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i2F-0000000F0LO-0E4v
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 16:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=; b=SYbkn85a6I30LLaN//GFF1y1bU
	tbVGjbKNbT50CJUxso/NoHmtDOLLZ+AyRGW54F4DADsk0J70JkVl96NbDewf3tAxpk/Y43Sd4LBD7
	PG/JHeXGMr8MBhA0bJu53xN4tGvyqM0krxP0S7H7cQzwJydrh1ixhRK+vybMZaZW3IgyYD4srqpYq
	NRHqp/MVSUII7ZqpKEixf8RWOWxA3XP1k4fanldAvQsfTWSoUjK4+AjY2W6b3602BTtYW67xTupVm
	95IhVZ5bOTp0hjyu7YrppQYvIwUV4IKp1ke9/tLeTr0l3gzG3bBlrXFKS36xJfmXTFj5VKTaJH9MF
	eIjwiXqQ==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4i2C-00000002lfr-0lU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:54:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so38791a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059238; x=1789664038; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=THfC/kzUlqqila5GRFvgamgTNLhpeg/u71jeMD6ZSTsiyQuZzWpB9aUD5d5sD75Rda
         pDvLaPivOIuQGc/OXeqATRYKxGTUr8d+Cud134j/quBnl+78zXnBFbVTDyxAErHQvoDq
         CQo9AeqODu/WtXaOpn9m5V5F4tfkN8PiMuGZ6U7NmTQsXAztknsXyWlrrFlvbngOYDmI
         NgFm4kCtKuqJrlEW2A3euRLFw8vlmAWfcLfdJVwMNKFsKG9iA7Wmu2GFIIeNyZ6BIEcV
         ybJSQQP57g+hwBBFuS8juBWLN3fQ1SJcFHEo24sU2YsPj4a/h8mVYfDASN+vcbGt+vki
         0WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059238; x=1789664038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=lknz3YNkCMrIgnOsWxzt/1uodD3L6Z5IcJus74blsIVLLAPUluOpMJiXdvsMq9a/aq
         oY6MvmDPjIgfOaUQe/Q5h68868JJ/O30+0SuOsrHpvUrhJ/oplGy+b5tA2Goc31QVVFx
         jncqp8jFNxxSYc2JRM8qpqhiT8d9xBRkB9aRzLIPnFE4lqUMyybQGRFDAcNNbIINZgh1
         ShOh9+B49hBQHPMDt7wYKhp5wU9lECkE4yd/NRD6eP08meR3I/+BurKuYpRNt3NCELk5
         CBPNfySzg/qHGTc8+ilasF+MYEXpQaApG9yv68IF6gyVsb0JKMjvZNjiYX4ESPg4g1Cd
         1bGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTPnhZLrFJaWGJCGg1LSQEV0Tfb+7LQwuk8dRczijiYZq2opviBGcPZumOGQ3VGJHKm/qZQPgy5eso+mm465jJ@lists.infradead.org
X-Gm-Message-State: AFuF++miFxk/0fJn1QhXiUPvvxIKigqsAnqARGF27wFs29tPGRQhl4xa
	q3AvFDoeCdK3OL2cjOv/VSNUOxJVa2HYO0S4ORaGS1vT5oG2H+aI2D5R
X-Gm-Gg: AYBFou1Nancxw+0x8Mq91kYv4NFEkJt78kgbzCDMs53ka7J2xjfobL3kBRdhYtXPQCA
	bBilgj4lATzK7HaI9ZGdCP0gtuQYNOn2FoAW3x9GaDfB9nQ2GIaZzKpM6n49jLPJ0/xbJx14omW
	wTwCpWxeX4J+LHIY7K9JrKJ105oxp9KflE9kIeBbF03SwGEUXDjGc+81YAzhn0whqEz/1pOudDR
	BEWlBBTbNjDVEZBaLZOu+Evv8RC34/Kg4mowpLTmP50EGgl1xrzaOFpikLtaUYhoyKUwarARLvE
	1FLdyhZ6P3OAsY3+rIL/oGYr59lctDQ5EGjlnVs34h0OdOZgxikEkAz/J0aUoj+9VYr/bY8UZcJ
	vU9D7IRqnN5SEupZh4JjukkvUjT48zfv2JXfTtrvcpwUUL2bCWDZwvknoL+Jk6yG5nirKLrDwrf
	pGFDocjDgDqjnw28BvqxZfvP/Fg/UjsWrZclndpEMb+cUNZfy5BKY33nUv67LK2zuJXjNPuHB2/
	BNae1dgfrrt9Wh5b1jJ4pXKX0FicqmmVEsxp1HqS8vDbb4VJTRzL30=
X-Received: by 2002:a05:6a21:1b85:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3da3a0af14amr66467142637.21.1789059237749;
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm10825a12.21.2026.09.10.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Message-ID: <1ae22be2-b72e-4c23-9aff-ef1052a10c45@gmail.com>
Date: Fri, 11 Sep 2026 00:53:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_175400_441523_4BD95C98 
X-CRM114-Status: GOOD (  17.66  )
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

> Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
> carrier board labelled NuMaker. Create a DTS including the SoM
> description. As a first external component, mention the SPI NAND
> connected to the Quad SPI controller.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
>   arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> index 3bc9787801a5..4c82109c885a 100644
> --- a/arch/arm64/boot/dts/nuvoton/Makefile
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
> +dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
>   dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> new file mode 100644
> index 000000000000..16c003998d3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "ma35d1-som-256m.dts"
> +
> +/ {
> +       model = "Nuvoton MA35D1 NuMaker";
> +       compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
> +};
> +
> +&pinctrl {
> +       spi-grp {
> +               pinctrl_qspi0: qspi0-pins {
> +                       nuvoton,pins = <3 0 5>,
> +                                      <3 1 5>,
> +                                      <3 2 5>,
> +                                      <3 3 5>,
> +                                      <3 4 5>,
> +                                      <3 5 5>;
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
> +};
> +
> +&qspi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_qspi0>;
> +       status = "okay";
> +
> +       flash: flash@0 {
> +               compatible = "spi-nand";
> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +       };
> +};
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


