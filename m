Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4766CCEFCE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK1pjOZHgHUmALyetdFeD/XBzJb0zHryAM/HjnpXBsw=; b=tpn/z9WbuJQufZaXfLTYZYUbRU
	gfJvzRVOfy8EpUELd6BUanqUsXPIxCAO4gGbRNKM1QNMpaA2TE9INSNfix+QLQlAtHywa5KZgn9jk
	YlothwzLOSsf+3zl2OocN8oekggN5UAhY7cBS+DZqIbKt8TTcaA6zAQWMjFKHoM+4pqXFRFtAA/4s
	kyUnZx19RuI/mTD31+adtdJr/RDsPQJQTPveXdTXJg4QrkWfeHe+mIlOmPGwy2ChbSyfJ/ZFTZXiO
	b37abYdt12ice40sukZm9T2mBDfPt5MNusA5Ad77f7ig7e5N0ZgK8lJyArmtbxbMyvsKzHXThwjdC
	OXKE+rcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAZd-0000000DY1A-19FE;
	Tue, 06 Jan 2026 17:10:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAZa-0000000DY0h-2uQq;
	Tue, 06 Jan 2026 17:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CK1pjOZHgHUmALyetdFeD/XBzJb0zHryAM/HjnpXBsw=; b=BTjU7zXVaPTBCgdfTupnegVh5x
	spGEnvNDYbg3RYXwMnEjdKlxIBwBgicISdzhcMdGRegCutQ11QolnDgo5/ixuQ4nwV2KWBupqViNM
	OhON3+V7CCPPbSJ163hewlWzGY4ZFXMM7bZJLWwEMKQnHdJ6mNduhOHcUgyJ9MJ940JzGVw7+YJ0N
	SO92W8SEAwKgcYZVs4sJgEhLlvSKup4+B2gfit+1A25r34cxWszyBs10z/cZsTvUXZmEnDcOL0eNr
	GX+83mB7fdnB6/g0wjzRyZu4Zvd+HXFYmAsc4eVIxRHlxJFxcJMkM6g0rH8KqP+zb8VWf+40RVjUH
	BPXR7xww==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdAZT-001Gyr-JH; Tue, 06 Jan 2026 18:10:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Tue, 06 Jan 2026 18:10:15 +0100
Message-ID: <6940171.Sb9uPGUboI@phil>
In-Reply-To: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_091022_795542_E45C4F94 
X-CRM114-Status: GOOD (  12.78  )
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

Am Dienstag, 6. Januar 2026, 10:00:11 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Bartosz Golaszewski:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>=20
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>=20
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
> kworker/u16:0
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> 6 locks held by kworker/u16:0/12:
>   #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
> at: process_one_work+0x18c/0x604
>   #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1b4/0x604
>   #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x38/0x1b0
>   #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
>   #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
>   #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
> irq event stamp: 81450
> hardirqs last  enabled at (81449): [<ffff8000813acba4>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (81450): [<ffff8000813abfb8>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (79616): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> softirqs last disabled at (79614): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
> 6.19.0-rc4-next-20260105+ #11975 PREEMPT
> Hardware name: Hardkernel ODROID-M1 (DT)
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
>   pinctrl_gpio_direction+0x3c/0xe0
>   pinctrl_gpio_direction_output+0x14/0x20
>   rockchip_gpio_direction_output+0xb8/0x19c
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_direction_output+0x34/0xf8
>   gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_configure_flags+0xbc/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   rockchip_pcie_probe+0x98/0x380
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>=20
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



