Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6397C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPKKIl6b3EX8ev0wV8qzJhlhMCWNx423BGnboaaBEu0=; b=FrS0XISMA5XsPam9BnvvAhGAAI
	P6jhJLzyR0sIXUJIfCI8UVxCpi8OVajq4NWc6z/2kUE8haKZMTIIHzN8Y1KUWzJzqwFREs9GIFbnV
	JDo8qsz1+hG7uQwXi5S4ZQrHGbwaeuGEph3C3wyPuDTtojy8zHHaXkbrTjmarC6pWU5iF2KgQaVDr
	edOAMXQ+lsSvngSHyuQs+1Uu12Y/YLQUBKyo4GLo98xv2wNBgJA31NVZV/YICyytRbluMsp2gmwpm
	ST8noMXqfK2lhgwkHq7u9wsTgupAcpHiDRUwGOmdYaTxcLsYPlUY1HAonG1267p9RpVV1+15ZPoxe
	QVsSQKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Rp-00000003U3q-2ELr;
	Mon, 14 Sep 2026 12:06:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65RF-00000003TwE-2SaQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:05:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 537FD4149C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383091F0089B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387533;
	bh=EPKKIl6b3EX8ev0wV8qzJhlhMCWNx423BGnboaaBEu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l63j0eY3owxAwFmzW+uTH89IrGmFevi3NYadMmQhCCS1ss1AxvUwzPZhAM5U8lUSC
	 XVGeiEDAFdBs/HBm1LHiEt1Iu6qBqLULZ9TD/KS2mLUx+BGsKIdiy1FsJe24du76xb
	 oZz/FIhU47BOb8bxZ5OUSn854dyJHQTgX47StRGclbzw4BhtBED4rvhZ3K8rin9E2l
	 UewJ0rwo5JgjxAQJcdvwvJwTx0yj+GuEYBtMoyO5wEFlbI/vLlTOW6wbKnoEjqGPxr
	 EOOtGf2FBzOqf4plumIHiSmm8qwRBG3S64OkHX5Mnvw1o5X2D3icGLbmReQoFeuKNc
	 T1Z9yUPfxwEUA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so2091885e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuJXf0BMgaYsJpnbVqtW7k7BVlad4o0ORw8xRLp0EaTmYbyn/yVbL0qG8dWJeIaQEeMkvdnky4WVfJHI+2DFLx@lists.infradead.org
X-Gm-Message-State: AFuF++kzJDiTZVZQZP2b7pCuGb5Z+afqgBzQijwXGRjOJRzKHdE3QjNw
	ZLSLWyXLiUovWwF+fHPPwFyL5qZgEzSW6dPMd5jPKkWs6nvAqH6O0VK0cHzH0BLAgTA/bHKhMjs
	l0MJOvaFqBaeGxMvnzSxPG6VrK495Shc=
X-Received: by 2002:a05:6512:2242:b0:5b7:65c0:8b92 with SMTP id
 2adb3069b0e04-5b8ae68d987mr1247986e87.12.1789387531865; Mon, 14 Sep 2026
 05:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <20260903075940.2089367-3-mehmet.fide@gmail.com>
In-Reply-To: <20260903075940.2089367-3-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:05:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnhjQncaYeN-2KQT64AJ39iWa-RtHiX2MCvJxcD0KJ=GA@mail.gmail.com>
X-Gm-Features: AcwNN1XZ9uIL02Hv0f9jfHvvbR53KZbr_8sAwWaE8orQR7toy2YPXPWxkdZN7oo
Message-ID: <CAD++jLnhjQncaYeN-2KQT64AJ39iWa-RtHiX2MCvJxcD0KJ=GA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
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

On Thu, Sep 3, 2026 at 9:59=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com> =
wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> A chip with a pin control backend sets a line's configuration through
> set_config() and gpiochip_generic_config(), but has no way to read one
> back. gpio-mmio needs that to learn the direction of a line whose
> direction lives in the pin controller.
>
> Add the optional get_config() callback, taking the packed parameter to
> query and returning its bare argument the way pinctrl_gpio_get_config()
> does, and gpiochip_generic_get_config() as the pin control backed
> implementation, the mirror of gpiochip_generic_config(). Without
> CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
> so the helper answers -ENOTSUPP there instead.
>
> Nothing in gpiolib calls get_config() and there is no consumer API; it
> is for the chip's own use.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Excellent Mehmet, exactly what I had in mind!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

