Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D1FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx1O75jqKMARjEbw4xneNk7aG4r2yfuJioWVDgA4Lp0=; b=FuXgV452M76W0rPX13JcZ3VDG9
	Z2BNECiN5kHRe7ZtHy06Gi+MY3Ghqmz/pRSf+bgBlfwfgVoVSl8+YMfP06/CxGal/GKQRfZS9iyT7
	C1R5f2IDm/3MxFtG5j+qxVJs1io1r4UKyD/AJaKtmdbEtHKw6pFmYOEykQdyMxF3dtJdE/28mMYzz
	PvRGtS87cQ2wrUyCRjdliaodgmBj/3CLnJPPHGNE36JUp6PIzizsMwgdiMoxrHudb5b53WeDCrJXh
	PAY0hCrju8QrGFO0CGaHrv345KSP2N5vrFL9o9iFFwSiWekyQaM6VS5Gv9jcJaia2AQu2i76yw9oU
	/8sOnp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephz-00000000x6s-2Djr;
	Wed, 01 Jul 2026 07:50:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wephy-00000000x6f-2mMc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3695643CFA
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0931F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892210;
	bh=dx1O75jqKMARjEbw4xneNk7aG4r2yfuJioWVDgA4Lp0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j2DcNdYdADDJu+D3REmFeOGs5cw/wVRDCtpWACgDuKjqrOOLm2M4y5DN23480AZ1+
	 vdbHErYbb2InVSGUdjvxGuamb9E+yPRsBVjhCVCiXyKaOxignCJrhJJ+sCulqREuj2
	 JZxBrhhL8M2bGYMeKhgzQoRiW4OCC68fnAE12cgLy2w3/40ruKeTVw7/mHAPBTxFXf
	 MW3RIJTIy2p3JhCAAmsgmH3SkxgQcdyu4tbovvpGx2pi551ZcwYmfASnsbjb8Sy5Am
	 u1HrtfRlZkc2/+8NNkXk6EuHohgDRlqIW5fn+gweETKl82yJ2QHYPWNfZQsisst93n
	 oOXXzvbJsIhvQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b14a7e53aso3399301fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RojRUr0Q2erRLNslcpJ20hOw09VZBHzyuX7N6vwSmML3n/HV9/b4MifZJhk71SVyBHycztioO/1sxzuMPc1RyNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwuikFRZeKuLN6ZnyHbGuLxHtFr8Xn9295PrDM72J+uIbiLu1Qv
	O06MW6FyT1W1ldRpCqJj2kNCrW5Gzvsgree3TnvCCiP5XNzynon9WsyK8IEtFCsuhyQ/6flK1z3
	q9mrUdQMgpZZahaYrVT6+s2hf3+5VRng7V6dMSxkuPg==
X-Received: by 2002:a05:651c:1593:b0:39a:f75e:a147 with SMTP id
 38308e7fff4ca-39b340d882dmr882981fa.34.1782892208779; Wed, 01 Jul 2026
 00:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 00:50:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 00:50:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 00:50:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZEw4P3LS9HzaS5W1qonGWkdvCYaEvFiY8m6sm98aWjA@mail.gmail.com>
X-Gm-Features: AVVi8Ce65ZHRsdwHuQE2lkQelFQAZtLRoTaOMFpaCpGigaio81APEbQW62eUHbc
Message-ID: <CAMRc=McZEw4P3LS9HzaS5W1qonGWkdvCYaEvFiY8m6sm98aWjA@mail.gmail.com>
Subject: Re: [PATCH v12 5/6] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 30 Jun 2026 14:54:02 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> GPIO data access and direction handling are implemented using the
> gpio-regmap library backed by a virtual regmap. The virtual regmap
> translates the gpio-regmap register model to the underlying SIUL2
> registers: MSCR for direction, PGPDI for input values and PGPDO for
> output values.
>
> The existing pinctrl GPIO callbacks are used for the request/free path:
> they switch the pad to GPIO mode on request and restore the previous
> MSCR configuration when the GPIO is released.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
> https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com/
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

