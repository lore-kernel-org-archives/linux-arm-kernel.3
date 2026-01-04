Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1ACC2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMRS1hawpXjSE/jqEs1wFYAMlU20xkQy7Yxg3/tOt8M=; b=laVJyZS4AU/REbjWSB2tWkCi3n
	Ne8hNtj1W3B/oB/wOcNyKB33wXwWOnJ8NpGik4smqWJZYDJuveQrydLzD1DXTPKmVHtwcvtdhwCQH
	Cdusvb9MtaGQzIWUhNYomOlouR1ZmzJOr7k4YxEDII+FTAefAWH4UlrDPHvsACycvxvbSeQtYhI9l
	5+ap7KHzzvMuoBc/jRfkeu/Q93UglgQWgxBEEfopzMJvfg/mwUgbF1RE+gB5Hnte5kBAHAvlYLWge
	HnmeeCeg9Fbq4lpxfDy2mZQE1ZLv96aEp6MdB7ohdRcVX6JYiJAGX/vKiZTpJZT/y7IANa96py+sL
	VTxgWM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMgZ-0000000ACvO-1wzu;
	Sun, 04 Jan 2026 11:54:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMgW-0000000ACuk-37gQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:54:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3EA2441F2
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C942AC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527651;
	bh=AcdRLvhNh8FGlzW+TOR1NqwjouA0EJJ3chB+HVQXgi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sLJTDnXkODOe54DMJPdkGdMjK7+W+FDQTWtC76a2OPbF207Hkfy5bx3ckBzBHKLyj
	 miINtekufMc9Ljcjnt5+rNJTNLzXcdnhtuQF47x2zhdZ2ECk4b6T38waUlOnrOFgrj
	 s3u5rkHHFyVr7bsYCLT4eML3Yc+t2dq9DHc7SMNxcdbIlB9vgCdC6Y8+EFnDdtqxWB
	 fkawMUjfVMEl4FA2xWwp/j6l4V0XzCLT7dWLYFbd7npCTAIVIzObe9BANJ1tcCSCI/
	 juq2qYkAD2upk/VXWejTMWDF/faqBP4zXoZAupF/51fJs0q2QOMwC+6JPMe0mK2rfE
	 IAnF8Y50bOxvA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fdb90b670so84188407b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOJK6p4vDazi56YHoGJadhS5DrBMl/mFWFRji0F7Zwa3A6oYl+gdLtCLg1RQleJZ9v8NER+j5K+ueYvTQ92zCk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cJNp3kMhwiO9b5G/gPLbm74LHfMgHuB+6BCyU1bk1xo/kkDC
	ALHZCXaOz2r+ylxjNLZtl4YJPjcOjmxDy4bIhndKk7IrDaqJDGGIq+Srvh44Jllh9Zy1GKuezYa
	j4Nh8y7cLJlT/Zgldf+GAVAQIbqDXVGM=
X-Google-Smtp-Source: AGHT+IGi7QFbFfC9+u8deXvEkGUtUoDMSC7p+FUi+Vu2ikgFZWwDkuLdG6m590kIpmNyayCsx7hnVPTUXHZ7MMSOHHM=
X-Received: by 2002:a05:690c:6c08:b0:786:7aaa:a070 with SMTP id
 00721157ae682-78fb400fb2dmr389515767b3.10.1767527651098; Sun, 04 Jan 2026
 03:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-4-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-4-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:54:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWRy_i7ergPouu4LK+r4g_a-ry+iN0m+jgSGn3+Zhjdw@mail.gmail.com>
X-Gm-Features: AQt7F2oL3yzobHab3UPIxoHqEHXwAO3naOHfp6yFtxa1dYpd6Lg-Kfe1G-jLF64
Message-ID: <CAD++jLnWRy_i7ergPouu4LK+r4g_a-ry+iN0m+jgSGn3+Zhjdw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: rockchip: rv1126b: Add pinconf and
 pinctrl dtsi for rv1126b
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_035412_814075_D9A7DA42 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Ye,

thanks for your patch!

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +       /omit-if-no-ref/
> +       pcfg_pull_none_drv_level_4_00: pcfg-pull-none-drv-level-4-00 {
> +               bias-disable;
> +               drive-strength =3D <0x2c>;

Normally drive-strength should be in mA, it is very strange to use hex
for an SI unit.

> +&pinctrl {
> +       aupll_clk {
> +               /omit-if-no-ref/
> +               aupll_clk_pins: aupll-clk-pins {
> +                       rockchip,pins =3D
> +                               /* aupll_clk_in */
> +                               <7 RK_PA1 1 &pcfg_pull_none>;

This looks better as:

pinmux =3D <7 << 16 | RK_PA1 << 8 | 1>;
bias-none;
drive-strength =3D <...>;

It's just weird to have the phandle at the end of the
pins creating something "necessarily different" from what
everyone else is doing.

I would change the bindings, driver and whatever script
generates this to use pinmux.

I understand this scheme looks comfortable when just doing
Rockchip all day, but as subsystem maintainer I need to
take into consideration how this will look for people working
with multiple SoC:s and maintenance, and anything different
from standard pinmux =3D <>; is just a big pain.

Yours,
Linus Walleij

