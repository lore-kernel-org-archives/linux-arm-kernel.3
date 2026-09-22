Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ADCC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnWpQWAf2Ex2oJ3zXG70LBtRWnH3/op21r4JuH9R6k8=; b=FjkmMhlbOT3u6YGZ+vXh0b04Ys
	vf+JNR7v7o8e3v+yx76KS8nb7DGq83JTlXDkIdw5XikKN89AX2Fjv54/k37a+whqbYrCY5WeUU8jq
	xXO8y/AmcR/j02GAp1uqZ4yEO0BJ9gQOCUtjLA+RV4UL5b5jjiGfKpd9odeXj5Ya7jZUfzF7THTVI
	8cnn2N3/Mey55AMRuepwyysHzNQz1y4vOAXAGRL147P8N5egVelBtFDWXJWzXjxB6OKZDyo7ySWEY
	YZEJCNwwfrwldBHfhz1izmlbfolTSHLHQTjZ+QsHgo28Oyz1o3tfsEp3SBcMU/XOEP4rMhivxMz3V
	XMtnSqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8utK-00000004VHp-0rmM;
	Tue, 22 Sep 2026 07:26:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8utJ-00000004VHh-1tST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:26:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF61460DDD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A8B1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061972;
	bh=gnWpQWAf2Ex2oJ3zXG70LBtRWnH3/op21r4JuH9R6k8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpPaCgMfm7Z/l2fIA8loLyB5vdxzaW1ZDVozibGGyVLMyp4L34Hz7A2+B9/dcNKb5
	 07pLtUzBbf0bcXxMw6Nj384h0azqSOYWrria8j8hkyizjlWbHDUZtWZW76P3za9Gcz
	 ko2nZYFjmS34xykMS4YPRHkovdmkhNPF98xXFdMJVT7se1qNpephkhu5d3ybtQy/nf
	 HRkpnbN/WmnMPXDw8mbo/04rtkJ+i6dTaMFjRoG9OilOrxgp4KiHA4W1dxFZx5iNVr
	 ZxG+hOdUqrbk6++INNyy+0nyoXMH9py+prmwqWFvw4Y5XDo890pjLP8FFgFpoTPx/6
	 VMoIqNOq5sc1A==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso6059399e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7c3PXjY4A36dx/PbFKos/mQgOGrFsNHpvtqwyJnE9dmJkxjl1m1Pqp1JMeuhOSWNkqIB+dcR0Iyj3s+EbzSWz@lists.infradead.org
X-Gm-Message-State: AFuF++nHYf7rdSE8zK17Xu8ukqBdnG3vI8NxGuccrV7QQpTH5Ncz/vPB
	hDTv0IcpJApXv/V1Gqkj0W5hsqLWf8s9NxgLks04McqL1xQ5U9XxkQ6yYKwPZflJgi1tgLs6Mbm
	TRGAR4lrWwqzwnxcUafYUnWGh209yqe4=
X-Received: by 2002:a05:6512:3046:b0:5b6:183c:5ca2 with SMTP id
 2adb3069b0e04-5b8c195c05emr4518896e87.64.1790061971274; Tue, 22 Sep 2026
 00:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-13-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-13-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:25:57 +0200
X-Gmail-Original-Message-ID: <CAD++jLkAfQTGNGTqL_bMD7S_x-kRMtJY=nOEkVdHR4eEoUJVOg@mail.gmail.com>
X-Gm-Features: AclHuK_tzDtaJ_wl5w9PHnR3CExWinf1MCYYaeMXhkMyxrZ9pQpsY3Z4mhWO3ik
Message-ID: <CAD++jLkAfQTGNGTqL_bMD7S_x-kRMtJY=nOEkVdHR4eEoUJVOg@mail.gmail.com>
Subject: Re: [PATCH v8 13/18] gpio: pl061: switch data path to gpio-regmap
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Keep a custom irqchip and irq domain. The gpio_chip is owned by
> gpio-regmap, so gpio_regmap_get_chip() is used to wire the domain.
>
> Check the chained-handler regmap_read() return and always
> run chained_irq_exit(). irq_type keeps the MMIO write style
> and uses cleanup helpers from the previous patch.
>
> irq_set_parent() nests the GPIO irq_desc under the AMBA parent
> for irq_set_wake() and lockdep; checked with PROVE_LOCKING on CV75.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

