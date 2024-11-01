Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F89E6B251
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR7nhijIFPqEwqWUXxfWpQdSj2cyoar1EyPI7jC4FfI=; b=eJdYaGOLYdXkYNYf8WctsFppzO
	N8ALyIsXBlKeRrVSTgZjGgVKfRIpjtusKXXZ0YV8w4tg7wzjln9WYCKCFyyqINWtNDH1lHcMKRlV/
	McahCxyDkUkHOpMf8wzMxd3v5Of3xJEXYYv2hU4R2PI0LoNuKq+vvnpkys6WccnzxG1mkfV4waSCN
	swZcyvHcTl/GAL3n14jBRmOfNLmbODywC6YhnO396a19Fpsn+LOIPKbw0pw4IetMnmNfobxVtrNyB
	Oi7IJou8gsTyxE3MImz/QwDFnnj89rOVqBoj1buxwnUDlhkOOaUjT6VC9IqFbkHKKMzbNZvovFRot
	6nMFo6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qZV-00000006vzw-1liC;
	Fri, 01 Nov 2024 12:16:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qGK-00000006pFC-3E4W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:56:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c913aso3129774e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462178; x=1731066978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR7nhijIFPqEwqWUXxfWpQdSj2cyoar1EyPI7jC4FfI=;
        b=aApLo7uLmbQusb+c31S2kiF1V86HZmxOmUtY9DfglPmbjk5Cq+QutR+AB/UB26dkIT
         PSG3m6XkETVbxvlRy4B8+upcc1L51Nqcmvn64J+XpES9Nsl/edE+v7iNSgOaLpDxyy6N
         kP3wv+91RDzfLMSsbJvwCQZsoeCnmukp9IgKfcJo8Yno8vElCrz0vDS0LvpGRkjLL3qn
         G6zevUYn/PiUcNhIoGNPqWLTuer+8eqpQj4n5LtHVWnCV74t9eNCgKwWmTE/Mynj/lp/
         fbhzBL33/T3/R9J52iauYvL6wY4i2goYKrTQ4qhmZ5hA2UbF+Nj0UiMi06qIVN+igj9g
         Apmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462178; x=1731066978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR7nhijIFPqEwqWUXxfWpQdSj2cyoar1EyPI7jC4FfI=;
        b=IKS1+dUmyzX1S+s/N7wbQ50+OqkY3tZ7dcHaOVq6JJLM1zreqsSBAgzqXfm60Cb4hp
         7sDbaP8UAFNlnT2vrmRHdejBQcT1LwsnCnql3GUONJ17VYcATab2UvtpdlyNLszDTSkE
         K7owDT9e35p0qXzJwMcR8Xk8YfrT3P7AbU3vorgVrAEl1InnhhC1ZM0imMk3RjsUuAGF
         24d6EDmCm/42mQmR9JhClzbXRkdZh5OVQUCpzUfckvcbwqhdj9abCTTWf2Mnbf0kJ7sR
         jAmV2NCezcgaTIpzreslQ3pr5VRRd5KjMzGGGlYFjpsSxpJqIrYX0487X6xjzduxaCEv
         /sxg==
X-Forwarded-Encrypted: i=1; AJvYcCUAK+CLmYkIkn8Y2j1xzkVKJIbmd2teeXj+E0Vp9pcr/q3aikGMRVPUCX0f3kC2HXLY4C61QKTHs7tfD4v05YzD@lists.infradead.org
X-Gm-Message-State: AOJu0YyrrDRXCuQFfyahFiYf7ziWX/aLy1w6vUNPsA09Q2A1xh1Kzm8E
	YTQ9M6JxuOloqNquetTXqRHYiUUhGk4ZQbwp16V2Pg5DjZQyj70NAonWqLSxhJ8TstGzeusQN1u
	Gy7EhPqpxnTB9bgsWu2u8qkdhZmtgV3rvkuzcrA==
X-Google-Smtp-Source: AGHT+IG201tjRpH4xAJy3js1MXvAZgMS+IPv3AAVo1TZLrpjjIYjlw9AiqUvvc+CIbPttUv3zlvfcUINXBzKPHjno0Q=
X-Received: by 2002:a05:651c:211a:b0:2fc:9550:d658 with SMTP id
 38308e7fff4ca-2fcbe004950mr124110461fa.24.1730462178345; Fri, 01 Nov 2024
 04:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:56:07 +0100
Message-ID: <CACRpkdbFQ6f6xg906ZREOgDifSWwfFWdxCqDxcLALZdYg6PWWQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: siul2-s32g2: add initial GPIO driver
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045620_847600_4F7AC4DD 
X-CRM114-Status: GOOD (  12.26  )
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

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Andrei Stefanescu (7):
>   dt-bindings: mfd: add support for the NXP SIUL2 module
>   mfd: nxp-siul2: add support for NXP SIUL2
>   arm64: dts: s32g: make pinctrl part of mfd node
>   pinctrl: s32: convert the driver into an mfd cell
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: add driver for GPIO functionality
>   MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver

How do you want to merge this?

Can the MFD and pinctrl parts be merged separately, or shall
it all go into MFD or all into pinctrl?

I can certainly merge it if Lee ACKs the MFD patch.

Yours,
Linus Walleij

