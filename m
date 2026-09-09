Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB62C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=; b=I9oZqR3ySjNX4FmDoEmnCaa7Um
	yxu1OSkj2dPvTWqrFK+eI+v1KYCX6JE69JucJSkCAnRZ0bvkI3Hb5TqzKInQXhqnRkYQLEp5z5vox
	d8FgR6cZZBuxxXn8MlEsW/f/cH2L3yF9tVR/I9onLbqbConHshVkqU49SCdrMV9klWC3STjF8mZzG
	Y/ty/MKDLJSRjD7k6R4CTN3V0x9cQc4BgwVWfTXxA6RpB52FwsPR2ZZtiE9+GuJMHbgMIi0e/rOna
	8jxfUXF9mXSKoheJs+B1NhvXKuPilxIEklUFbFXYmJ2dduFoxUgULH58fMUpNL/+iWdrQj1QxDa7q
	eWuG7LqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ond-0000000Cnhe-0lxE;
	Wed, 09 Sep 2026 20:21:41 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ona-0000000Cnh1-31vQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:21:40 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3a468f4c547so41143091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985296; cv=none;
        d=google.com; s=arc-20260327;
        b=FKGRjFFIFy37NLYwdAtAEHfGycbn8VF+W1yrDWweCAqNNACbI4A6V8u8IkO2IIatg+
         EkIHQymgTB4mpWmvxG/Uey7ufh88QTmxRzaJFZUp8uIY5XISyXFUhPS6mdm+ekUxBLes
         vYbbcOZ0+BSSxd2ewfcjzjjCTr+L0CeQuu91vyVRZFS+xazRjI6HvOYJCuU1DGO66UON
         CkA9t5isiXyQvmz4wHCcwDWP8wl6SxNtnc8M3pwfj2AdQUia4g9b15MDa1krasqgxAXU
         OcS1bsBkjXuOghSlRFdNupqPISa21eep9cIWd6Jqv9fiyDTbhU7E2WhjQLd8n46c3NMs
         0LsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        fh=6OPCUoLBNa1q3Dxl9+ADfjzKy2har2ipRP8NrdgUEzA=;
        b=PI9gQvBcylq/GiKoIvctyQYsGpRo45kTjpAJyFOLAwslHUi8LfXj/W9AjrwYi3XpCd
         gjFg2eTR1OMlBhxeb5Fy2TXTKfzqy0gBi/kgMWfolSHObPenkeQaa+RJad7GZOdO9yFC
         XA91nS3DgQV/TpiNYfzZjFjRaYfTVI6r+x9elxp+t2iCouf+qZtqkc07VFlmSzAep28N
         du/WnUH4EugrdwOk5nDucR54OdJQA/3GGYbS04rCTK4wDJPES2o8H4rpiu0uN4f6b9gj
         kxS4GScNTlPi1qtEetdp2RZxA83UhH9Jl2Dovq2vM/sQijgn0UOvyrOMWjrbXDrIyQRI
         jkVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985296; x=1789590096; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=hY0h6ZOK09Iib+sCh+T8mam40rUneNMizBv0eVP+Pobb9QL7qAk8cwnSWTr5nFCrTT
         g/ZfMXUNmR3Nb+9jm09zzJ88XNHcBKILjiafkAy+L5pPBg4pL3OHvecLSXsuhaeNY3fE
         sFeVSyx8uO5a9gq9VQKpkXdkYtgZj3Wly8hSfFrCiB5htwWClS/73oBGCptJ7JtEAEI4
         pzRaheqvFfE/sijhbgp6d6pFvd5xqmV0Da+fPAPj0a4+WxsSutaaRCUj/3CNnCfhWz4d
         nh7+bgIpRfQY3iCH2FmdmM10ZYsWVSdVxfsUggohW5QKwJpp92KVfE/2OCCO2lSioUAw
         jZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985296; x=1789590096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=ne63FR76/W6ppTNqsRRBv+FhIR1ufR6fIbD2LEGc6rnaHCyGLCbK3DLxO12RMpHkMz
         yXb6Wn3lB/gNTOv5MQaCmCj8ct01p8l3r9ydE90cUurFUiDFJqc1+oUvIQcWxOM3uGBy
         A59mA6kuqJcluaQE3fcXAs80LPCNOtOo/5EsCLT+VzeemCuPjyrMrmaes+riQ+BwKOh4
         suHxf5b1jBWj+msSzCttxlaxxTVFSyj33PvuB1xlKuIlqYfAC4tpTg0aO4LgJLHZmb25
         8Z5wzveQOA8/5W4ULJdp4umR9BD9NU4ywoXxHTYEiNGEnVo1ILddziI8c6wr0NWz/BMH
         trNA==
X-Forwarded-Encrypted: i=1; AKwUvBw4wfBc6TYGYh1FMq1G9Efn70q3+wavKPipvspYRC1YTyCCzzrkEnuMCIs+apzdUSrJKinpsOfDNpQoG0Amp6m5@lists.infradead.org
X-Gm-Message-State: AFuF++msk9TLF0z/2osYyTpsW6Lm09aRN8n6+7Ku1dthuloFEj5d0Txy
	ljHQEdD4qax6T3juAIWTCB7Vdjf7ciKAAM9sNgA94c8Fk/srYs7BMeZpVQeVXwVu0CiWVPmvW3R
	aiZMP+pts2rRFpUPRqKmM11+G1D6vCQ0=
X-Gm-Gg: AYBFou2leucvfklh8CSdUFlhGkH11O7zAmnGLYGqt4r0si370KWYdqvdUqlm7Gc4rJz
	Kuj3Wgaho5FrcO1cweJ8rHW5o8qPZDQVHcKxQwbSig4iQuxppMps26jOKiJ8lMQV3HfhVJhlsoR
	bx2/WAtXE2kgAG9FBNBtcQQvkXut63s2/0CTcR/KOhLjptRRkrucgvAaqOdrVYTKCZvGFo5cz4s
	odWBngOGQTF/EhIWs+kV5N3rtFm8ipVnKIAP7V6xcHybhb+TJPlppCpX2NJBxeHx1NdX636vkHI
	wzsTvnth01CEb8+fEccRv8fkS0BuC5FsOjdEULvVHmVn3PCSkGawgv3zlW766F6/Vqh1U2D7XQz
	3dl6yLllde2sP9X6vKsXWSw0Ul1c1MukmnZezS+FINBk6
X-Received: by 2002:a05:651c:b0f:b0:3a3:749e:31a4 with SMTP id
 38308e7fff4ca-3a58d92c643mr3500071fa.24.1788985296110; Wed, 09 Sep 2026
 13:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:21:24 -0300
X-Gm-Features: AcwNN1XhCWWR_p45edJ2cAUvnO6YnDwGtKUGW17Fe3LwHfhT5TU0cNccQ42bU4E
Message-ID: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_132138_795876_F518B9BC 
X-CRM114-Status: GOOD (  17.20  )
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

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
>  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
>  arch/arm/configs/imxrt_defconfig              |   35 -
>  arch/arm/configs/vf610m4_defconfig            |   39 -
>  arch/arm/mach-imx/Kconfig                     |   27 +-
>  arch/arm/mach-imx/Makefile                    |    3 -
>  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
>  arch/arm/mach-imx/mach-imxrt.c                |   19 -

The imxrt1050-evk dts is used in U-Boot.

Adding Jesse and Giulio, who use this platform in U-Boot.

