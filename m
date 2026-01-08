Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0829BD148A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz+I3TlvkqdtvqoAnUtxiFGmqULr8gJgkdFek+BL8Ks=; b=NwgVkdJk/6dKBRuHNKbEb7kkl6
	CV5I5VSLlk+OlyeCLM9fsgyDruvfnKXSFXfJDjKLYPBt7aUY8kETM7HZsLB+hhTZi6HT87Yw+z7Yj
	Zk34uyIlC1u9+OBozF8HU52EJ9oVOgT59ZhaDu3jEi8ip6vH14SdzAAYPsOwlmj7jNu0ptnltN+o2
	ZTLMXGtl355n/Y86ByCuG5u1W38Ssgq9FVy8QZNoWuebm81nkdmDC+0Mge8IpRT14ONIF31Nwf/ID
	R+yBWfI3+7ZRTCAkzRBZGP97+AxTWh5IJIzBgWxRzcmTEaRZGi/cNQrBE19Bdokuyb5z9I6yl2duF
	DwUDqzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjwO-0000000G2aS-0AkR;
	Thu, 08 Jan 2026 06:56:16 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjwL-0000000G2Yx-0yeo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:56:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so4470565a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855371; x=1768460171; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz+I3TlvkqdtvqoAnUtxiFGmqULr8gJgkdFek+BL8Ks=;
        b=Hr8CuR+HEjWXE37U2KJWAoBVUMivQmAppYqHSBBjQwDsYr7CV2Lc0v7YxX9Av1IqbW
         APUGGTATvckmsf9jMlidh/OtcK/ogMySMNyyfnmY9ZZ5oe0s2hj67/9BqA5K6fqP4Jwb
         FwSkC3k3Neo/Sm7ynXR4BYIEgOOtxT6RNUfyI16BMatX3+GW3POaJqEuA9BETKME81jB
         pxCTy0/hSRTlj9Kv0fmRn8FCn3tt+zmV5WowRmVXUVbdrVTSU7HPbQPeRHVVOt1GyMiZ
         ehYrlgsvRwlcDXA4vUyiEGwTI7TO2HgNcgZ/dvRGbz8QLNbJ948PUxD3vcEpSKcTNMIy
         R3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855371; x=1768460171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz+I3TlvkqdtvqoAnUtxiFGmqULr8gJgkdFek+BL8Ks=;
        b=XiFtdfXQrp15pWYdu+tZu5LNR+DoekliqLuWu2GyWaoMGWyU5lkMagni1HaN17UIfC
         4dKsBRr0LfeHJ+UYy9dGaDGK/QDXzZankdEk2wsea8Y/GraqTyzOrNe6kdEP9yxLgwxX
         B16/zbtOPbG0LynF2y5YBDNa7wGe325d0FYsd4xgtlbNey+oJjSfWPVqUFdb0RNoe1Ch
         MnfJCkY7JKnXfhFR18MKExTVh4WRyxTK+SwMfGBF8n9eSD9aVpuiCC62RVqm2sRf5DXo
         XgRxmoRA5YFqjYe9Oh+Mal3vN0fn7vEL9mPT43mshpXlEIg3t4kUfBh0OLVX67+VBayY
         ADVw==
X-Forwarded-Encrypted: i=1; AJvYcCXVlJYAWA6MDVpf2cDOB9hVPTTq7pjLg4brdDpT3a6JFgFNTCrbFpuRJPCJ8/OGJkII1N6H/ib8KGqNuwM3H3iY@lists.infradead.org
X-Gm-Message-State: AOJu0YzImvsyv3Vmdzcn2GbPJlfUQuMcg8GZ/W7tBpc4e/S6TKxMj9sW
	VmJSHpkIyEConwQCUuSwrdqHaOA5nzBqUSKdmKH871frQjuxqhejFWNF/g1eMy+qTp1ydjN/RZZ
	1Bnh1RBwsll9HSILoq0CdTIwYwQdvZ/w=
X-Gm-Gg: AY/fxX5RppbVRMqEFuvspF3h32Vok2OXPL1UcpJzc4mB0lilLx2mZiqDG8mM6PueDSh
	5LREWiP3kk0s3MSHWEdDvcnuIjG67KXUX9n+kkAh3FAtU8VY8EopvuBW2QuMNZr2NJIn8fbYrfH
	vmqbsnAmXqbUCKR+jdpKDuN9uVgMRfIOd4lt1hYGapBWVcT2Dhj38/N2zb0QHBdnzdyqR0R9koO
	tt8S3isZDbfHNuqTZfc9Xzo9+yY4gXAYaSyxgtw4iRIVA9iJsGSiSNU9mtCd9CGQcJX0L5xBJol
	cQ==
X-Google-Smtp-Source: AGHT+IF8dpj868EOsGJb+4D50v33yMK/G8PE2Tazbt1MvZq6b0GNtVU+VS/8Jx2HyWsCH96l8MkdkOx+6HRCMqq4N8E=
X-Received: by 2002:a05:6402:1475:b0:64b:6a7b:5996 with SMTP id
 4fb4d7f45d1cf-65097e8b70cmr4694594a12.30.1767855371139; Wed, 07 Jan 2026
 22:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
In-Reply-To: <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:25:52 +0530
X-Gm-Features: AQt7F2p8dx0bZz2eHy8PaUQEvJMZHRzQalglH2FIV--KXLcHz9v3RkQ98BQ5OF4
Message-ID: <CANAwSgSjCm+mXxdH5jgN==zfHSvFASxOy4dQkhhLs6hrXAtf-w@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
To: Hans de Goede <hansg@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225613_296078_61E60238 
X-CRM114-Status: GOOD (  33.62  )
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

Hi Hans De,

Thanks for your review comments.

On Sat, 3 Jan 2026 at 17:32, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 3-Jan-26 09:31, Anand Moon wrote:
> > The fusb302 driver triggers a "BUG: Invalid wait context" lockdep warning
> > under certain configurations (such as when CONFIG_PROVE_RAW_LOCK_NESTING
> > is enabled). This occurs because the interrupt handler, fusb302_irq_intn,
> > attempts to acquire a regular spinlock (&chip->irq_lock) while running
> > in hardirq context can lead to invalid wait context reports if the lock is
> > considered "sleepable" or has incompatible nesting levels with the
> > underlying interrupt controller's locks.
> >
> > lockdep warnings:
> >
> > [   38.935276] [      C0] =============================
> > [   38.935690] [      C0] [ BUG: Invalid wait context ]
> > [   38.936106] [      C0] 6.19.0-rc2-2-ARM64-GCC #2 Tainted: GT
> > [   38.936716] [      C0] -----------------------------
> > [   38.937129] [      C0] kworker/0:0/8 is trying to lock:
> > [   38.937566] [      C0] ffff000112c04190 (&chip->irq_lock){....}-{3:3}, at: fusb302_irq_intn+0x38/0x98 [fusb302]
> > [   38.938450] [      C0] other info that might help us debug this:
> > [   38.938953] [      C0] context-{2:2}
> > [   38.939247] [      C0] 2 locks held by kworker/0:0/8:
> > [   38.939670] [      C0]  #0: ffff000100025148 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work+0x224/0x4b8
> > [   38.940645] [      C0]  #1: ffff8000800fbd90 ((work_completion)(&(&host->detect)->work)){+.+.}-{0:0}, at: process_one_work+0x24c/0x4b8
> > [   38.941691] [      C0] stack backtrace:
> > [   38.942010] [      C0] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Tainted: GT   6.19.0-rc2-2-ARM64-GCC #2 PREEMPT(full)  bd73c5afc1bd41f04ef9699c14f0381f835f4deb
> > [   38.942017] [      C0] Tainted: [T]=RANDSTRUCT
> > [   38.942019] [      C0] Hardware name: Radxa ROCK 5B (DT)
> > [   38.942022] [      C0] Workqueue: events_freezable mmc_rescan
> > [   38.942031] [      C0] Call trace:
> > [   38.942033] [      C0]  show_stack+0x24/0x40 (C)
> > [   38.942041] [      C0]  dump_stack_lvl+0x90/0xd8
> > [   38.942047] [      C0]  dump_stack+0x1c/0x3c
> > [   38.942051] [      C0]  __lock_acquire+0x5e8/0x9c8
> > [   38.942059] [      C0]  lock_acquire+0x134/0x280
> > [   38.942065] [      C0]  _raw_spin_lock_irqsave+0x80/0xb0
> > [   38.942072] [      C0]  fusb302_irq_intn+0x38/0x98 [fusb302 634bac905a09c450b54f88b96019accd2820228f]
> > [   38.942082] [      C0]  __handle_irq_event_percpu+0x138/0x3f0
> > [   38.942088] [      C0]  handle_irq_event+0x58/0xd8
> > [   38.942093] [      C0]  handle_level_irq+0x108/0x190
> > [   38.942099] [      C0]  handle_irq_desc+0x4c/0x78
> > [   38.942106] [      C0]  generic_handle_domain_irq+0x24/0x40
> > [   38.942113] [      C0]  rockchip_irq_demux+0x128/0x240
> > [   38.942120] [      C0]  handle_irq_desc+0x4c/0x78
> > [   38.942127] [      C0]  generic_handle_domain_irq+0x24/0x40
> > [   38.942133] [      C0]  __gic_handle_irq_from_irqson.isra.0+0x260/0x370
> > [   38.942141] [      C0]  gic_handle_irq+0x68/0xa0
> > [   38.942146] [      C0]  call_on_irq_stack+0x48/0x68
> > [   38.942152] [      C0]  do_interrupt_handler+0x74/0x98
> > [   38.942158] [      C0]  el1_interrupt+0x88/0xb0
> > [   38.942165] [      C0]  el1h_64_irq_handler+0x1c/0x30
> > [   38.942170] [      C0]  el1h_64_irq+0x84/0x88
> > [   38.942175] [      C0]  arch_counter_get_cntpct+0x4/0x20 (P)
> > [   38.942181] [      C0]  __const_udelay+0x30/0x48
> > [   38.942187] [      C0]  mci_send_cmd.constprop.0+0x84/0xc8
> > [   38.942194] [      C0]  dw_mci_setup_bus+0x60/0x210
> > [   38.942200] [      C0]  dw_mci_set_ios+0x1c8/0x260
> > [   38.942206] [      C0]  mmc_set_initial_state+0x110/0x140
> > [   38.942211] [      C0]  mmc_rescan_try_freq+0x154/0x198
> > [   38.942216] [      C0]  mmc_rescan+0x1cc/0x278
> > [   38.942221] [      C0]  process_one_work+0x284/0x4b8
> > [   38.942225] [      C0]  worker_thread+0x264/0x3a0
> > [   38.942230] [      C0]  kthread+0x11c/0x138
> > [   38.942236] [      C0]  ret_from_fork+0x10/0x20
> > [   38.969307] [     T11] rockchip-dw-pcie a41000000.pcie: PCI host bridge to bus 0004:40
> > [   38.969995] [     T11] pci_bus 0004:40: root bus resource [bus 40-4f]
> >
> > Following changes resolves the lockdep warnings and aligns the driver with best
> > practices for I2C-based interrupt handling.
> >
> > Cc: Hans de Goede <hansg@kernel.org>
> > Cc: Yongbo Zhang <giraffesnn123@gmail.com>
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> If you look closer at the code then you will see that
> fusb302_irq_intn() is effectively doing its own threaded
> interrupt handling this is done to be able to delay
> the threaded part till after the i2c-controller is
> resumed when a fusb302 irq wakes up the system.
>
> See commit 207338ec5a27 ("usb: typec: fusb302: Improve
> suspend/resume handling") for details.
>
> And if you look at the fusb302 git history then you'll
> seen an earlier change the switch the interrupt handler
> to a threaded IRQ which was reverted (mostly due to it
> also making other undesirable changes).
>
Yes, I have gone through the change logs
> This change is different though. This is actually quite
> similar to commit cee3dba7b741 ("mei: vsc: Fix "BUG: Invalid
> wait context" lockdep error"). Where I fixed more or less
> the same issue in the same way. So I guess this change also
> is ok.
Yes, ideally, all the CPU cores should handle the IRQ.

alarm@rockpi-5b:~$ cat  /proc/interrupts | grep fsc_interrupt_int_n
 59:         15          0          0          0          0          0
         0          0 rockchip_gpio_irq  12 Level
fsc_interrupt_int_n

>
> Still ideally we would solve this in another way then
> switching to a threaded IRQ handler.
I don't know but this could be related to
>
> As the commit message of the mei-vsc fix mentions
> the root cause of these errors is typically an interrupt
> chip driver which uses IRQF_NO_THREAD disabling the auto
> threading of all interrupt handlers in RT mode.
>
> So the first question here would be to see if that flag is
> used in the interrupt chip and if yes, is that flag really
> necessary ?

No, I did not find this IRQF_NO_THREAD flag being used by Rockchip SoC
i2c
[1] https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-rk3x.c#L1310-L1325
gpio
[2] https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-rockchip.c#L520-L582
pinctrl
[3] https://github.com/torvalds/linux/blob/master/drivers/pinctrl/pinctrl-rockchip.c
pinctrl power management IC
[4] https://github.com/torvalds/linux/blob/master/drivers/pinctrl/pinctrl-rk805.c
>
> Regards,
>
> Hans
Thnaks
-Anand

