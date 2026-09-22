Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10010C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlS/01WyyurIPf4QsRysWjeX/pYeyMHVRzkWTplgkuo=; b=tZV6zPOYP1kgujiELXkPgS02OS
	54XUnSkOXwmJO4zBgtUNllBf347rGiCtfurQ9gA+A5UAbiJMUYiQ6jiNVBUhbxgD38WaRrQEcCLQ9
	/j2UcKqtzPC2/LhJjY8tv1yDCq7XXBmysTys5zMmJ+IyuDKcK6eoaUklxD9yolDXvf90Up7U43iVU
	JPcJWrFeV/6fRs4DFx9UF257Ei/CH9r74FFMEPTPqpw+verAFleRf3FTPxsJCJZCq5XwNcZ4LErUz
	pcIMgzCu5jl1SWsV2W0QZVRLQUD+qW4XUxurcp0uFP5/xRTVShWW8GyVB2W3G31TwB50/M5EhyqoH
	rnTImXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uvp-00000004Vd6-0SIt;
	Tue, 22 Sep 2026 07:28:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uvn-00000004Vc7-3Rib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44CE760213
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05241F00893
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062127;
	bh=RlS/01WyyurIPf4QsRysWjeX/pYeyMHVRzkWTplgkuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OZp0caBbpefIvj9oDAZUhKHN7HmbUmSQEDEtJyByiNinpZk0O8y4fxtBhC2HvSwG3
	 nVn3uGo7rfGHO0FJAzg3l8b+9tkirrGKqpKntbc1kLUFH8BTKzyUGr51prwRh0TT8A
	 jmKeyXJeVqznfFEmqluszLaZuv8CtgzLp19JetSlzAJSToGilc4NUXKXeZrCz2xhe6
	 X7tA51sgsYuxNEbq10r+KXuYWZYb8M2U1qJxyJC9D5q3iqM8mHzzyusLZ8KQse/rV/
	 VtDcdTYWoki9oBne42YfmbwPaJv9I98IdOA4Xf4FTY/WfuzkM8U5IDrx7TAxDxmisn
	 0h0nFQkVVbtYg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c9954ccbso2177305e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzY+NBQDde8NYKbergSpoFPP/12USOJ1x5ldHa+Lqo+oSz4l7TS8NpS/CyxzSY3KDlTfWwUHJQAlXZ4hrnhpBe9@lists.infradead.org
X-Gm-Message-State: AFuF++nB0XgGVRW6cJOQ7TH0atElEpq+wHW2Y/k0NWg87fSE4zhOq+2n
	sfuNQSuI/EUTAC7Kl8vTOX01IYmXoRdKbG39FDI6/ylhJG/Lt9N5bzSAOOkphvEoILcCMA2s9W4
	hIehxzUj8P8gcERuIkbYo7azJr4QEu0I=
X-Received: by 2002:a05:6512:3d1d:b0:5ae:c8da:6254 with SMTP id
 2adb3069b0e04-5b8c18298d5mr3810337e87.22.1790062125682; Tue, 22 Sep 2026
 00:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:28:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnL5h2AD5rYvUYGT_TvQ=m9CQd6bh_NT=T28G7hDGFLDw@mail.gmail.com>
X-Gm-Features: AclHuK_pNJ1evLbofDMJ7O-GTWjLgf41H8iNHME4i3icaRDTTyzpN_Rs6YR6w7U
Message-ID: <CAD++jLnL5h2AD5rYvUYGT_TvQ=m9CQd6bh_NT=T28G7hDGFLDw@mail.gmail.com>
Subject: Re: [PATCH v8 15/18] pinctrl: ambarella: add CV75 pin controller
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
> Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
> tables. GPIO is handled by the PL061 driver.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

I feel I could just apply this patch.

> +       select GPIO_PL061

This doesn't matter so much, I can just assume this will appear in
the merge window.

If some bots complain it we can just ignore it.

Once the bindings are ACKed I will consider just apply the
bindings and this patch to the pinctrl tree.

Yours,
Linus Walleij

