Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E19C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h+3Fpyke2tX7ZFvdKHeQ4JdNdIQdnDKWaAKP31G/a8=; b=QIxd3Bc9WKA5E7vA935nTzIHUA
	CVj/fFIUTUQaZi36lR2eBvbJXNstXiQVLpeVZdWn4Jx7k+2iJiD4Cp1zgQWEdnTW4Sv2G84Lm3/wK
	Rd1vHCFQkXONcwwmYdgwpVwn+Gxvynd+I6yjSMNFDqwrDBtO+V/4lz6G6Uxlh03fUVoTD07lA7YIN
	jPxBz94Fwq2eRcHFoSlMoJ4N2Z13tcO/9IQ1FWfpHCoSLDZiw11N/PdGxlMAK1oYIOE4bvQSsJiCX
	FJvC5yadMgX+fEz6ZchzF3S5rTLuuV3edzrIAAhGVoYftMWRB1ywPfZxB9tgwyf1zrVZw2snVYvYG
	PUsBp8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKz-00000003nCa-2Sib;
	Thu, 02 Jul 2026 07:59:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKy-00000003nBw-3HfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:59:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F15F43425
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120CD1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979196;
	bh=1h+3Fpyke2tX7ZFvdKHeQ4JdNdIQdnDKWaAKP31G/a8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S6849HXj9O8LKKQpSF70YZh+9LnvgLiloLIXi3sEDCfC+KICtsoGW3N0tkxc5Q/jJ
	 clOLMlBFcOTIWDnfiVrOkNyUXMduvxZLZ29m2iHF/b7TazlLMBXWn+SerOBlGmdViH
	 rckRTbr1lq2FcoCBZ4jxxxCNBDjej9tsKf1I/S0zA6WNEv59Brhfi9k1nn3QRheH3b
	 zsH4CD6rfskE90P5QQ6z85O5EojsIFh4dBgaz9BfJQ+4fEyoFO5fPxc7j7tNE3dHWx
	 GtLev8wny4rNPOTrTJim86RaIPoLmLZKYxNQhWErp1ikuaDakAXxP5PBM7cIQll7Ex
	 OnoAHNztJ8rKg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso1544502e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roq+38ndV7tvoj4FlpFnsekSJKKHfdjQpJG9uECFRtAAayLAceM+T5946AnuzDV5/epmIYquEt8meXnozHebO0F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+9ItjFcCsFagwfJyETn0e9hgSRCQ3cnerDeoCaxyxxUVI18wB
	CfveSwStQFS3TF4O4wxILXI7N20cd9rz39wWVj40d0V1TkHU5sn9W4s5uORxtEKUaqN80ceH3Pc
	GInkcEhE5/XrnmxqfLlip7zeAhhUMESk=
X-Received: by 2002:a05:6512:6482:b0:5ae:a3c3:f123 with SMTP id
 2adb3069b0e04-5aec67aa697mr1289406e87.25.1782979194864; Thu, 02 Jul 2026
 00:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:59:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLkOspcOBG9DU+OD-++M3kNEviq7pY109Pqpd6V=RoKUEA@mail.gmail.com>
X-Gm-Features: AVVi8CcU8tKaRId_dejrARm-i_U9g0OluvkGMZwVqH98hTd5N0_d2-ckQ2U3Yr8
Message-ID: <CAD++jLkOspcOBG9DU+OD-++M3kNEviq7pY109Pqpd6V=RoKUEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: nomadik: use dev_err_probe()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> gpio-nomadik depends on a few resources. In one case the reset is taking
> time to show up leading to a boot log containing:
>
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -=
EPROBE_DEFER
>
> Fix by replacing all dev_err() calls that might be made at probe with
> dev_err_probe().
>
> On nomadik platforms, the nmk_gpio_populate_chip() log calls might
> attach their reasons to the gpio or pinctrl device depending on boot
> order.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

