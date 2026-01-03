Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBA7FC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHyG145kzFXnOFjXe++Sub24U1Sr0jpUyn5t+Vf48Jw=; b=MlOSBRXRHMKz5Sb7pCtd5dULS6
	uES/p0vLO8v1GVnmfJA0N+fNl0ksKgZHu2r/44vjtGXYA30SQnE7U4VLwPqWYzaH+airWMW+vyCOq
	IoTcAsYsFo7tn+7IRcxJ9IW4ewRP6RWfHqunKgUanFWvIsM6SSZjmvLqy845YkOVwEWsPL4xetCo7
	2evLuVnrJprWz1RBHrqF41s1RZM9Ko+nfoMHO+w/6qpl0aGVd3barm4y0R4z3oh8v6uoPr70CLCJG
	E6Nz4plVqtaLHpPQrC1MRFd6cPBPsXeVJsXjxnzB2y7Tf8cWYVtJ24ubuclB8EAkKs2pH+TtFFRGg
	nDSWpXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4z-000000096eD-2Uba;
	Sat, 03 Jan 2026 08:33:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4w-000000096cc-3bxm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:33:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0f3f74587so179364295ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429222; x=1768034022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHyG145kzFXnOFjXe++Sub24U1Sr0jpUyn5t+Vf48Jw=;
        b=GVLWGlsRXXTgC5LEP1O2ZR0fVDwZ4K/Z5FJSzdjd4k2dKk+k6yklEWcxr7bbumFIxH
         Sb87pVezvkGYXcZ+Xd5Z7kcbe6138tucFzLsM1PV+DEktDWijRvqjZn9lJrC+5jPuQY1
         IMtO3rtptKaSoT4HOIdlzYg5vtlPloWtXy3hAmVz9PNV2w+dGb5wS99WpWsYgqKz291C
         dZ2IU/Pfi+l4uPQRc0opH2x+HMIci8pMA6U4V797p6a2o8N9Iz+NL2udwePvgLLFdjse
         kzPptiCIRR8Lqzcwoqmf0yzHhdrX/j5Gj8m/0rvEogl0Fk6gAVsiUa8r8OUv7A8SkWjT
         KKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429222; x=1768034022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHyG145kzFXnOFjXe++Sub24U1Sr0jpUyn5t+Vf48Jw=;
        b=HHcDycv92LlUXHwS039XEWEWnUF5qoOAOxPF0HsOS4S1OPXvvPI3B1UzhKci9Aa73l
         Uu21ewd5IA1n/ZP3PT6/KhLiKXXcgMURTEBWa3xSB0RJc6u0gIhC3RLg8gp2ayPtd9BQ
         tostz+KfllQAtxwba3+XzNDDI1hfp4Zy8iFWG8UsLQNvH8wb7JSslsJ3BWgnaxzjrPba
         AX7AybwCXg/oEa8tvmCEP/dM2lGJoCI/4YEBHCTVgY5rKY3wiU5fMTJjrrhPD+QEZQwT
         KhM8SL6nl3nkG2v7VK+JmG+V0qKRpxGKREuNAPItkJh024eE13vLAerS5UyzBrRzj6R8
         bxQg==
X-Forwarded-Encrypted: i=1; AJvYcCWGmTONzVTfS3/x4dnxk0CYXSZCrP8DHY6qK/xz2+KqfSKoDAaE31LcGYirvEDcTHOcbglwL2Ntdak+1axo6Vao@lists.infradead.org
X-Gm-Message-State: AOJu0YxX4PL4o7iWP/aLk66zSGOf4/cLhWknsszgYqfMLEbnAs0ZPEjI
	TIT3OYuVCC2Cyopgw9UyHWAyFZRYvUQQlWPz9vBWQSD4YWWrN+EJ/Z5E
X-Gm-Gg: AY/fxX519ftM3PjWq67gJRhSQMKI5MK7qptfeKQCYczSL7h22aiDxY9iB5HPupzSi8q
	YPZ5brtTXYIQXwFax059Sgkb+buBEDqgrFhjJFPsPJF2x1vmAyU+zE9gRPSUsjaCuKhVlX/uNFk
	VFy8sElyU1MFikWlddZVNYQ6zSwFDONj0V5ZvcH3tveGt8vwMfZrsjLfPW5Q3B4ZHV71cVhmh5N
	SdByRo2lM9tYnftTK7FibKEjZKRuWcAZexBCYMcjFZWETiOTc+ZvtF/4vtt6rwd32qYrbLEbD6P
	d+p2t+ODp+w7o0HNXkyoOmc1tnbPet2tbcF7aCm/slDBqFC3UD88N30IXGAuEHu+++49jihjQPN
	CQIfEb+HiA8OPKRlIsvJtilnVduZGpm8dvH4TAkHqNuFAHhM32NrQBGnTNLl8gQgUcN1kS+clWk
	toxuaeAA==
X-Google-Smtp-Source: AGHT+IHxDotaAPgTf9hDSRmjhQO/IAis4W0EptEfWvNWpf1X8rcKBg8E34x8vTt2toQFaw/FLYg8Jg==
X-Received: by 2002:a17:903:1c7:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a2f2830f94mr467517465ad.30.1767429221879;
        Sat, 03 Jan 2026 00:33:41 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:33:41 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
Date: Sat,  3 Jan 2026 14:01:19 +0530
Message-ID: <20260103083232.9510-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_003342_908071_E6027769 
X-CRM114-Status: GOOD (  14.25  )
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

The fusb302 driver triggers a "BUG: Invalid wait context" lockdep warning
under certain configurations (such as when CONFIG_PROVE_RAW_LOCK_NESTING
is enabled). This occurs because the interrupt handler, fusb302_irq_intn,
attempts to acquire a regular spinlock (&chip->irq_lock) while running
in hardirq context can lead to invalid wait context reports if the lock is
considered "sleepable" or has incompatible nesting levels with the
underlying interrupt controller's locks.

lockdep warnings:

[   38.935276] [      C0] =============================
[   38.935690] [      C0] [ BUG: Invalid wait context ]
[   38.936106] [      C0] 6.19.0-rc2-2-ARM64-GCC #2 Tainted: GT
[   38.936716] [      C0] -----------------------------
[   38.937129] [      C0] kworker/0:0/8 is trying to lock:
[   38.937566] [      C0] ffff000112c04190 (&chip->irq_lock){....}-{3:3}, at: fusb302_irq_intn+0x38/0x98 [fusb302]
[   38.938450] [      C0] other info that might help us debug this:
[   38.938953] [      C0] context-{2:2}
[   38.939247] [      C0] 2 locks held by kworker/0:0/8:
[   38.939670] [      C0]  #0: ffff000100025148 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work+0x224/0x4b8
[   38.940645] [      C0]  #1: ffff8000800fbd90 ((work_completion)(&(&host->detect)->work)){+.+.}-{0:0}, at: process_one_work+0x24c/0x4b8
[   38.941691] [      C0] stack backtrace:
[   38.942010] [      C0] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Tainted: GT   6.19.0-rc2-2-ARM64-GCC #2 PREEMPT(full)  bd73c5afc1bd41f04ef9699c14f0381f835f4deb
[   38.942017] [      C0] Tainted: [T]=RANDSTRUCT
[   38.942019] [      C0] Hardware name: Radxa ROCK 5B (DT)
[   38.942022] [      C0] Workqueue: events_freezable mmc_rescan
[   38.942031] [      C0] Call trace:
[   38.942033] [      C0]  show_stack+0x24/0x40 (C)
[   38.942041] [      C0]  dump_stack_lvl+0x90/0xd8
[   38.942047] [      C0]  dump_stack+0x1c/0x3c
[   38.942051] [      C0]  __lock_acquire+0x5e8/0x9c8
[   38.942059] [      C0]  lock_acquire+0x134/0x280
[   38.942065] [      C0]  _raw_spin_lock_irqsave+0x80/0xb0
[   38.942072] [      C0]  fusb302_irq_intn+0x38/0x98 [fusb302 634bac905a09c450b54f88b96019accd2820228f]
[   38.942082] [      C0]  __handle_irq_event_percpu+0x138/0x3f0
[   38.942088] [      C0]  handle_irq_event+0x58/0xd8
[   38.942093] [      C0]  handle_level_irq+0x108/0x190
[   38.942099] [      C0]  handle_irq_desc+0x4c/0x78
[   38.942106] [      C0]  generic_handle_domain_irq+0x24/0x40
[   38.942113] [      C0]  rockchip_irq_demux+0x128/0x240
[   38.942120] [      C0]  handle_irq_desc+0x4c/0x78
[   38.942127] [      C0]  generic_handle_domain_irq+0x24/0x40
[   38.942133] [      C0]  __gic_handle_irq_from_irqson.isra.0+0x260/0x370
[   38.942141] [      C0]  gic_handle_irq+0x68/0xa0
[   38.942146] [      C0]  call_on_irq_stack+0x48/0x68
[   38.942152] [      C0]  do_interrupt_handler+0x74/0x98
[   38.942158] [      C0]  el1_interrupt+0x88/0xb0
[   38.942165] [      C0]  el1h_64_irq_handler+0x1c/0x30
[   38.942170] [      C0]  el1h_64_irq+0x84/0x88
[   38.942175] [      C0]  arch_counter_get_cntpct+0x4/0x20 (P)
[   38.942181] [      C0]  __const_udelay+0x30/0x48
[   38.942187] [      C0]  mci_send_cmd.constprop.0+0x84/0xc8
[   38.942194] [      C0]  dw_mci_setup_bus+0x60/0x210
[   38.942200] [      C0]  dw_mci_set_ios+0x1c8/0x260
[   38.942206] [      C0]  mmc_set_initial_state+0x110/0x140
[   38.942211] [      C0]  mmc_rescan_try_freq+0x154/0x198
[   38.942216] [      C0]  mmc_rescan+0x1cc/0x278
[   38.942221] [      C0]  process_one_work+0x284/0x4b8
[   38.942225] [      C0]  worker_thread+0x264/0x3a0
[   38.942230] [      C0]  kthread+0x11c/0x138
[   38.942236] [      C0]  ret_from_fork+0x10/0x20
[   38.969307] [     T11] rockchip-dw-pcie a41000000.pcie: PCI host bridge to bus 0004:40
[   38.969995] [     T11] pci_bus 0004:40: root bus resource [bus 40-4f]

Following changes resolves the lockdep warnings and aligns the driver with best
practices for I2C-based interrupt handling.

Cc: Hans de Goede <hansg@kernel.org>
Cc: Yongbo Zhang <giraffesnn123@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 870a71f953f6..089722b52fbb 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1755,9 +1755,10 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}
 
-	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			  "fsc_interrupt_int_n", chip);
+	ret = request_threaded_irq(chip->gpio_int_n_irq,
+				   NULL, fusb302_irq_intn,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+				   "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		goto tcpm_unregister_port;
-- 
2.50.1


