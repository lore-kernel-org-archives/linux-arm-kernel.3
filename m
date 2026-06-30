Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32804C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vyBcI5TrDUOJsKRP78Qn4UY47KkKEgHkVpg0R4944I=; b=gagEunHQJeJTh8PxtSM5oe9aPR
	s354xzSf/Vt6AzmexNDgdAE/3f/7Mfn/8i6KrO8PwEfX725/lQgZxSA76tKDRPL5qUfS1bZL7hGah
	lIBkm6fSHUvzcsmld34HMBoR+UcWSl5wMR5DC0T4Jqvf2YPJ5AymgJ4rOkxDQnzTP8elKYoob3FsM
	+AuCD/NYeOAl8jpz9xxuYnZ2xgs5NvOMZ6dpZj/JH5wDW8f/QNX8ygJVM5i4ORn88zcVnkHFJiZmq
	KqGzDefSqe2042007j2NTDYFp9JXZcWmrZRUP9vLXR/eYgdueusifnqIxwLtxfh2ysAaSAjdJWMiE
	/xx1T9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegzd-00000000JVI-3qQZ;
	Tue, 30 Jun 2026 22:31:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegzc-00000000JUo-3LkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:31:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02A9F6014C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE43A1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858707;
	bh=0vyBcI5TrDUOJsKRP78Qn4UY47KkKEgHkVpg0R4944I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NaFJ1rIJVlJTeP3ijFYuHHLRJ2LVGBSp02a3unMxIHx/YqdVkwo9eSFZhBjTRjgU8
	 tKwPgYi2JnxPfWj8vtLQdcHbV6XGYaGmB8PQfhxjzVVls/a5q1yA75FYCG14qPXBuP
	 juQaLMme73XBDXgJ0ipPO8qeMLZ3J2kiR64TlBPdc6SX4nvZqlbcPSpew1wZYdsxWL
	 qiQftyANALt+OgbQcB+m9plrzrwUt2yWgjH3l3K5RNhqZK9Rn3Ma9gQvih2jlQxDhm
	 mTmGjnRKGoe7zo5ch3456UV2UtT/GGziMVK/1iOdgFp+EuhyvgVTjiR6tHcldNJ1KG
	 EaEc4MsCyUYwg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebae2f310so2018096e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpq4f0xwmK6h+OyVm1KuHarI3LeEPXHQzulzKDOszT48J47MyYrIaAZxhO6lvdCxZg+IXyDHCFe0cMlOyUFazXk@lists.infradead.org
X-Gm-Message-State: AOJu0YxMNji+EFInwqgV35wO22uN8Wenttgd/Sv6h3+5tCIcQh+6KJR1
	EY0frz19MraK7e8z4YTKcAl6Y15ulFZVizuQprewodRyrhXmSt8W+hrHIrYAsr9GjM3+7RU+g/7
	lLBWpzRjlXa4A6jMwUZk9hZG4R2ss/2k=
X-Received: by 2002:a05:6512:3d19:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aebdb7b9f3mr1476506e87.2.1782858706533; Tue, 30 Jun 2026
 15:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-3-v@baodeep.com>
In-Reply-To: <20260625115718.1678991-3-v@baodeep.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
X-Gm-Features: AVVi8CfDmpM_WBEsoCA-fJj4k4OCxE4dpL_nSqphbxmK4p2VO77ksQUbWW6IkQU
Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: restore non-sleeping GPIO access
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Jun 25, 2026 at 1:58=E2=80=AFPM Viacheslav Bocharov <v@baodeep.com>=
 wrote:

> Commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping") set gpio_chip.can_sleep =3D true to work around
> gpio-shared-proxy holding a spinlock across a sleeping pinctrl config
> path. That locking bug is now fixed in the shared-proxy itself ("gpio:
> shared-proxy: always serialize with a sleeping mutex"), so the
> controller-wide workaround is no longer needed; the meson GPIO
> controller does not sleep.
>
> meson_gpio_get/set/direction_* access MMIO through regmap. The
> regmap_mmio bus uses fast I/O (spinlock) locking, so these value
> callbacks do not contain sleeping operations. Since gpio_chip.can_sleep
> describes the get/set value path, restore can_sleep =3D false.
>
> Marking the controller sleeping also broke atomic value consumers such
> as w1-gpio (1-Wire bitbang): w1_io.c runs its read time slot under
> local_irq_save() and uses the non-cansleep gpiod_set_value() /
> gpiod_get_value(), which with can_sleep=3Dtrue trigger WARN_ON(can_sleep)
> in gpiolib on every transferred bit (from w1_gpio_write_bit() /
> w1_gpio_read_bit() via w1_reset_bus() and w1_search()). The printk and
> stack dump inside the IRQs-off, microsecond-scale time slot destroy the
> bit timing, so reset/presence detection and ROM search fail: the bus
> master registers but w1_master_slave_count stays at 0 and no devices
> are found. Verified on an Amlogic A113X board (DS18B20 on GPIOA_14):
> with can_sleep restored to false the warnings are gone and the sensor
> is detected and read again.
>
> This must not be applied or backported without the shared-proxy locking
> fix above; otherwise the original Khadas VIM3 splat returns on boards
> that genuinely share a meson GPIO.
>
> Fixes: 28f240683871 ("pinctrl: meson: mark the GPIO controller as sleepin=
g")
> Link: https://lore.kernel.org/all/20260105150509.56537-1-bartosz.golaszew=
ski@oss.qualcomm.com/
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

