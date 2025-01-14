Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlqTUnZXimSv0OpNMeG8KSN6cDTihkE7gFuE8ClySV4=; b=Afv0tPrarRIvyu5LTXKOjjlHdD
	WC0BaVOAWQvappuKCEokj/EHsfJz8yzyrYLlcf2YQESs+3JmxrQ1iLB0dWceH4R0VvDrZSypdV8hL
	gnnA3AjZ0HtEMFffW46uLsOjw0nV/ElXpWeGgQP1BNvyvLzo/DlZ9b/yBDdC2ouTUE6wALkYY5mNr
	dJ8ET7mo+D1sNch/NNLIMkGs6znluR1ndvm6ZlevR9wbm0n6mUjTPMbRWv7ZPwqjAsvkTyDX37q/x
	/q65+YOcelO3FommZG0dqsRizBoVFUgyz6euQY6yd0BAI9IrrTaWe3vKyJbGxLqKtW/hGJNLTtrGK
	POulc33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXh52-00000008Xw8-28rC;
	Tue, 14 Jan 2025 13:35:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXh1e-00000008XCb-188n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 13:32:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so62767285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 05:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736861528; x=1737466328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlqTUnZXimSv0OpNMeG8KSN6cDTihkE7gFuE8ClySV4=;
        b=X+qG4u5J/VtEOLigdQkDlumO4Nb5CTLC4OP19yyO1HNRjMr0XZ8KHiVki2SELF2/ho
         YIt1EXvaWR7w5j41ZYmm8MpVuG/ZMuiWJqKXS/YQ57jV22wuf0GHlkWtES0spMq3bDT0
         5CCwqJVq6ORdNUkaY2NshlIGGkSuS2DHF8JtGlyWQBvzunL4abe54Vglz2PdjhKzniU5
         KE5PmJNJE2nQ3ek59HSpkVMEZcRaWYX8/MmeSG2OOUP7HoKonSi/obcn0zT+IcTLhooN
         hpaz9NoMz8MLrO4PLSa1kHBf3G0i/t+I9YsVogHTztsO0VAY2sQsussnEVHAGOS2Cygv
         rdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861528; x=1737466328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlqTUnZXimSv0OpNMeG8KSN6cDTihkE7gFuE8ClySV4=;
        b=wFYsPHYaii5gqhGOquH1wUMfDIycXZ05JHyxGgEEFqVDfWRXxP/vb7FNnZNMemSc4Z
         7hWxWvnZlpA92IZzYVNxF0tBh0JnnL05WmpiEObp9YzP20I2JhEn7mIizd3nKqZSY7dL
         S5JhpFZCf9VoSkk8nFagUxeTO86uKgq7r6gUrNWcyaVOQ8by3EvIFVDQCmfOe+ePBiyc
         x7bSrgzAh9DoGBT6KMr1d671KOxxyT9hxbT5pwRIjy9CRDvrP1YE75qLznE24QiGMtiE
         SMTnYq1zWmALlHiKvHt0vi+7rWLQiB/wiFeKff2OqnREzhs/RSYMICZeUbL4EGAs6o6M
         yELQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlohXfYtm1SrQ5RnqsRAT7fbP0dfKMiutdx0fr1Rg2/SWzdjf/LM1nVR3vP0/vJOHmeaAPz02ivMYjJUAR1HJT@lists.infradead.org
X-Gm-Message-State: AOJu0YzkyWUHDkk9JBxMILTiPhjXUjzn2dMBWRqL7Z3luETvE+ksvK3O
	+rSkh6FhWw1/rXrzhD2LW3JQ5lxu1vK0Q3IkpzWfGXs/dBv2OcP/xnjAX/OAMsA=
X-Gm-Gg: ASbGncuETTpzGtgDguBTXCF3sBXgl0Uko0mACor1lNYZYOZD1DwgI/gysbroLfxkZpP
	IxZNREWd8GgD1x9sFFCsEeYl8vjCoVeVXHBUOkMVDdnl+aCPNqhWs9WoOGvOJT1JLXr1/pcNN6i
	aIuOwI/wNUFknUdqUp3YYVW1ld+wIv8CrOz8s+AFTxF2xgRY9uiC7aXbgArw9f8ZQJKsc4slnnu
	2MR4ULt+/xCODEK/FpQ4GVqfLRYJaLa4mjVaRFlmPuIuiYl5wsMYBRf
X-Google-Smtp-Source: AGHT+IGX7/UMGlqtT7zZvRfxlsgQa+uEneORt172vk0+CI+jGXB6Xgxav5wRl12bJyoriN3HKN0zhQ==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr25876636f8f.48.1736861527841;
        Tue, 14 Jan 2025 05:32:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a8b0:e23c:79c1:dc2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c7aesm15154949f8f.53.2025.01.14.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 05:32:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Robert Hancock <hancock@sedsystems.ca>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: Convert gpio_lock to raw spinlock
Date: Tue, 14 Jan 2025 14:32:06 +0100
Message-ID: <173686152290.39040.17367940998093783534.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110163354.2012654-1-sean.anderson@linux.dev>
References: <20250110163354.2012654-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_053210_514292_A4E13ECE 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 10 Jan 2025 11:33:54 -0500, Sean Anderson wrote:
> irq_chip functions may be called in raw spinlock context. Therefore, we
> must also use a raw spinlock for our own internal locking.
> 
> This fixes the following lockdep splat:
> 
> [    5.349336] =============================
> [    5.353349] [ BUG: Invalid wait context ]
> [    5.357361] 6.13.0-rc5+ #69 Tainted: G        W
> [    5.363031] -----------------------------
> [    5.367045] kworker/u17:1/44 is trying to lock:
> [    5.371587] ffffff88018b02c0 (&chip->gpio_lock){....}-{3:3}, at: xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
> [    5.380079] other info that might help us debug this:
> [    5.385138] context-{5:5}
> [    5.387762] 5 locks held by kworker/u17:1/44:
> [    5.392123] #0: ffffff8800014958 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3204)
> [    5.402260] #1: ffffffc082fcbdd8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3205)
> [    5.411528] #2: ffffff880172c900 (&dev->mutex){....}-{4:4}, at: __device_attach (drivers/base/dd.c:1006)
> [    5.419929] #3: ffffff88039c8268 (request_class#2){+.+.}-{4:4}, at: __setup_irq (kernel/irq/internals.h:156 kernel/irq/manage.c:1596)
> [    5.428331] #4: ffffff88039c80c8 (lock_class#2){....}-{2:2}, at: __setup_irq (kernel/irq/manage.c:1614)
> [    5.436472] stack backtrace:
> [    5.439359] CPU: 2 UID: 0 PID: 44 Comm: kworker/u17:1 Tainted: G        W          6.13.0-rc5+ #69
> [    5.448690] Tainted: [W]=WARN
> [    5.451656] Hardware name: xlnx,zynqmp (DT)
> [    5.455845] Workqueue: events_unbound deferred_probe_work_func
> [    5.461699] Call trace:
> [    5.464147] show_stack+0x18/0x24 C
> [    5.467821] dump_stack_lvl (lib/dump_stack.c:123)
> [    5.471501] dump_stack (lib/dump_stack.c:130)
> [    5.474824] __lock_acquire (kernel/locking/lockdep.c:4828 kernel/locking/lockdep.c:4898 kernel/locking/lockdep.c:5176)
> [    5.478758] lock_acquire (arch/arm64/include/asm/percpu.h:40 kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> [    5.482429] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
> [    5.486797] xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
> [    5.490737] irq_enable (kernel/irq/internals.h:236 kernel/irq/chip.c:170 kernel/irq/chip.c:439 kernel/irq/chip.c:432 kernel/irq/chip.c:345)
> [    5.494060] __irq_startup (kernel/irq/internals.h:241 kernel/irq/chip.c:180 kernel/irq/chip.c:250)
> [    5.497645] irq_startup (kernel/irq/chip.c:270)
> [    5.501143] __setup_irq (kernel/irq/manage.c:1807)
> [    5.504728] request_threaded_irq (kernel/irq/manage.c:2208)
> 
> [...]

Applied, thanks!

[1/1] gpio: xilinx: Convert gpio_lock to raw spinlock
      commit: 9860370c2172704b6b4f0075a0c2a29fd84af96a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

