Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EDAD167E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ+UbzLQfsKUV8xCcCpW+28OK1UbglTqqUsOw5ELNcU=; b=YSau0OkZ4pmEcf+e9j/r/x/hLX
	XAtUlE4sGRL9VnATQRfPi1DznhovTtap0QAZuD8ZmFuS2hW4/Yu32rhutqP0mkuIryUUl3tbTTNK8
	DYf+JnBb4P00YvdD3rmj3PkwjtmYLbilt/nsmnBg25RbzaQOPEfG4i9ffiIeKhWp+7RjtvOh4kNG8
	JNKv6d7Exlxo27recfg4Wbv5ZXKKnMw0h0mjczAkhtFku3j2vxs2f0/KDmk5J4nB/04OPk8xlD46E
	jQ9gQ2oByTe2fP3eOluE3IQgYtCRAC+Lddg1Z36jxDvNl/+RgARx7hwiSTC1AzoU4nZ2zTsAiTOCd
	0ouB0beA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pX-000000021GU-18S8;
	Fri, 09 Jan 2026 09:30:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pU-000000021Fy-2uGs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5A7A4342F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45C8C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951047;
	bh=6LNdm3fUgjKNrloN/NydUJPrfwSNFkztsLyEogcqh/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hu7+oOeN1CG6qA4cqOd65h7eTJRVtcKJ3o8a7JrrBjmyiyeyd8g3/uch0eUalhG/d
	 EMWtRORiXIOoxHNQgaHvM6xf5UirHxHmfnPLE34i54UfeYOG8uD+O72ewmJOhQvrOX
	 Fb+82va25549OQTLb7sFjXJ/XnqKbDc8HRPdT94nLHFFMIUfIelVV1nbyR62IEBdWh
	 F7JvWPg5FoncdSX9Xa5XAbsWXyBDqD525oTOU20B3c6Ij+jiwfWqFVbIgJbGJvYG4t
	 YHSiWA4FzOKY/R+qjWIUt/kKXq1X5sjLS6SkjXfvNy/nFnZ4iDiHVqdcShysGAnU/v
	 IlWna3lwVNzVA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-790884840baso44388137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMJznnSOFcQ5ApTu/dkfWjKlO3xUeiwOwZ9ZVZRb8Jv7OYHfpvve5k5/nm+uJvCOA7scgiL6eM2aq92YK9a7ro@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXEjz5ctutzWM4Pk7D8l96Un7lL3jgVLXRxM3UC4ekwtjEamW
	XDmlRDhKMryqw12JYD/m2dMXPvwhtwOF02DbW8L42E3P7HfnYiq6SkrHkzeNxU6rRCm5YFmdEWH
	0mpT3zNDg8PLyAdeuCj2Wr8S8KoK6RsQ=
X-Google-Smtp-Source: AGHT+IHW9AloGVPNneim+o5wu5kst869KHt4MS2BcIEWf1BhFWXSHQH3d/MN0P4Js6T3JHk+sgUFV5uMx0nD8b2J3Z0=
X-Received: by 2002:a05:690c:6c08:b0:788:14a2:8bda with SMTP id
 00721157ae682-790b580708bmr83145167b3.38.1767951047030; Fri, 09 Jan 2026
 01:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:30:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
X-Gm-Features: AZwV_QifJwM8PVt6EB8CPnUaPiq8Laa3KkCYXyF0XiD2OsUIzet-cnQ9j7hifFk
Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013048_769087_41B082B6 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
> kworker/u25:3
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 46379
> hardirqs last  enabled at (46379): [<ffff8000813acb24>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (46378): [<ffff8000813abf38>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (46330): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (46295): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Tainted: [C]=3DCRAP
> Hardware name: Khadas VIM3 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_set_config+0x40/0xdc
>   gpiochip_generic_config+0x28/0x3c
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_config+0x34/0xfc
>   gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_transitory+0x4c/0xf0
>   gpiod_configure_flags+0xa4/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get+0x18/0x24
>   mmc_pwrseq_emmc_probe+0x40/0xb8
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

