Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98141C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgiouULxaavrRvEyeFGZnpHW8o/taKt6WxSeZJbXgG0=; b=CrenFYmpfxHjhED+Oy7D0hZqNq
	ZXNsaryJQ9lkssPumdWQ3C36F9qzkupNrInDLKlAlzJLtA4jRJC1LmEquOCwx4VFDauESjRIEml13
	GKvCh3zD4E8oWgCRtKmmRpQbFLcUt4K4iikIErDocc6uhSIQSmpUmDHtKOacSzSZvnaSUngQMdd7+
	Bc2i76MZ7Zo6blK5aPTYbJtCTq0PzYXx1nnZo2MYXzMj3lIs4GzUxpJ+xMGT12YfoGwMN7BV7nWVW
	AEOex7wjufpHzVLr6fbU/XYA8+o+ljL18HqyV8+d8ujc2bkWxnneln3W4+VMRIPv/7Jzqyv5U5x3i
	2a0/Xz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79W6-0000000B7Jo-1ivW;
	Thu, 17 Sep 2026 10:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79W4-0000000B7Jb-3nsN;
	Thu, 17 Sep 2026 10:38:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D40E43604;
	Thu, 17 Sep 2026 10:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A81F000FF;
	Thu, 17 Sep 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641536;
	bh=GgiouULxaavrRvEyeFGZnpHW8o/taKt6WxSeZJbXgG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZZOmYDHsEtXapaWj6BjVYo0Egq6UJf0CFI9XwUTH/0eYaTz4mTdcF2MbSXQGd35U
	 os/YSIJxati+HoBjFScUoJWKlIIxg62pWo1ux3sIdGM9TGBeZfAk9XUSop0SjFmMj8
	 HZqMSbAXCdDy5rCvHnJxyFpHEk1xVMKfU55F7chtZ35w0jjJFIYgwEHb/jQ7/EP7n5
	 obNutBYZxKY7GJG11PIC7YaEHuvjjyIflrt8nrHxQ/OQH14964wmRYaCbFgEckUnWl
	 GBzHV6xw+JI5nrWC5vVf1U91z7fqSPN1np3uwU6z5QUXiq6AEUaiVqO9ZBvAgP4JnF
	 MvwXFE+Ha9CFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix HSMC clock leak in legacy
 controller init
To: "Wentao Liang" <vulab@iscas.ac.cn>, alexandre.belloni@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, claudiu.beznea@tuxon.dev, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com, bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at
In-Reply-To: <20260917102804.2146887-1-vulab@iscas.ac.cn>
References: <20260917102804.2146887-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:38:55 +0000
Message-Id: <20260917103855.934A81F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mtd: backward goto in error handling path violates kernel style
--

commit aad96ec48f9b270598811f4065826c70f378687c
Author: Wentao Liang <vulab@iscas.ac.cn>

mtd: rawnand: atmel: Fix HSMC clock leak in legacy controller init

atmel_hsmc_nand_controller_legacy_init() takes a reference to the
HSMC clock with of_clk_get() and enables it, but the error paths
that follow only release the device node, so both the reference and
the enable are leaked whenever the controller cannot be fully
initialized. Add an err_disable_clk path that disables and releases
the clock before jumping to the existing out path.

> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index 8a19408abb635..bafc8c995e376 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
[ ... ]
> @@ -2260,6 +2261,12 @@ atmel_hsmc_nand_controller_legacy_init(struct atme=
l_hsmc_nand_controller *nc)
>  	of_node_put(nfc_np);
> =20
>  	return ret;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(nc->clk);
> +	clk_put(nc->clk);
> +
> +	goto out;

[Severity: Low]
Does this backward jump to the out label introduce a regression in standard
kernel conventions for error handling?

While functionally correct, jumping backwards instead of structuring cascad=
ing
error labels so that the success path exits or jumps forward over the error
handling blocks introduces non-standard control flow in this function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917102804.2146=
887-1-vulab@iscas.ac.cn?part=3D1

