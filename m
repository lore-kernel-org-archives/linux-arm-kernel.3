Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D92AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwqaFQ8ta774Od/giScBMq+pGLs67O+6YYSzVsHWz8U=; b=o+8wFLQiMTqESPfdI7bTdcjr4P
	bbljedB/v74+C7+TGSUFLW0RYrBGaY4s6LrtYW+lOn/ZBNp6qRzQnPlRbJDcnQSGMNrIWCPynCHFT
	aN/S9c4rloMpESzMxQDqehetdeZR6kHhc+YqEr/zfxEsUQ6eqEtFcrknIA6PjXrl9pvme6SN7lZRU
	tzVifv/+vAcXaCtFgEM/GITlm834W2W57H/0UTmJ603ac4+SCvE/UJi95DJ2tRREb2Tm/jwVar2Fp
	jOAdbyJHZMqVjWYRwTWzUq9/vPzyJe29dCCmu3a6tQRJUNTggH33vYgD/6ZBAbyjnnEHEwXUVbdyp
	gvde/Ycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYrb-0000000ESig-1B1Q;
	Wed, 07 May 2025 07:06:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYk7-0000000ERYu-0Dfz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:59:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-30a99e2bdd4so1208465a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601138; x=1747205938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwqaFQ8ta774Od/giScBMq+pGLs67O+6YYSzVsHWz8U=;
        b=YnUWgPhyFl/8GVnVmcotpFDhgzzrq4+XUtnqmR4eemtzlDjo8Yk9bx60cyLmV6eeff
         hcN6YAuZ+4HapCXWdqv1UD+IoucPBqmw/fEJpiJI6RoZ/NZRHuff2utF94HJ8JfikfRm
         hth7vd1k2ylpj1aJFpsHeSvIz9BLQruhV2FvkmH+GnO/IQn47CmV9D4bYknvEwCBrrCR
         CwXcSBaesYVXIn5NijCbuHx5P1iOzb1x3JtIcvfXioF4FrAPc1nXf2mbtH/J4kFbJlGr
         iycwMU9ht9EKsreXaN44RrhjEA4uMCA/G1b7eQicEF9zBg7luxqMko9wFKYcZgosHUvd
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601138; x=1747205938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwqaFQ8ta774Od/giScBMq+pGLs67O+6YYSzVsHWz8U=;
        b=RQ1LMP+J3lQceeDOP8JibP0zWO9lJkrtssOzXsEU5zWVCER8aaDQ1xNtwojGWdJmHQ
         B6KhjH6o4o5J7RZAGGw/zdN2IPgyw3Heywy9yRAenMMva+IHHKZy9b81ToQ7xz4kAF6e
         K5b6DmTTLXv1LaEEoQU+dvkILXLk72k5ym5sWJJyVrP6B7KcsZUMGJqXYiV34NH7bEmQ
         Tp0PeaTsXzmfmgsq35+UNY4Dgw5SFKvMxk0cU76uwAeL1JJ5Ip925XzAJ7ecPJoFFze2
         ofsJXSZFciwUa3mUWbeClcB2C/Fb+VRYz2J5OdCESCfhhWnkc6eikqcNAwPlUAVF0kvP
         6NXw==
X-Gm-Message-State: AOJu0YwDb0mSehEHzhCVbVnKS/INmxpFrIN9cqkS+raT/e988Oa152m4
	JMscywp75VJ7amYfSA9FJSB48A3HUNjRCxt1IuuG7paHvcc5GD6Y
X-Gm-Gg: ASbGncv3TxE7Z2KVD6ldHTAtTBQQ7CBI+pAlyfEejYOYC7oPN0NLulsbqcQyexqcsRZ
	+fwWMpwm9M/66QEbonZcWdnjF/w1ZeQ7jZnDIjkjsVxZEtbYwClbMvBq1AVJta1/ADnka5vwjSc
	ZSManSVKTwxE8fn9gJJN0svPKtmoV5glTBJY2ejgT5VNdVLmKx1+1k2blZdsCitbHg24C8PoLnX
	Fs7vMY+Wvo9KkEfFOozIHQ0iBbCUSe+C8phKl3ekmr3ud8sGft46uVclUYqG+8AW0h093K5He7+
	QKyUMnwQzPlioZWziakBXY/ye1v0Tv8N9IQEcUfP1x+QzOpst7Rp
X-Google-Smtp-Source: AGHT+IGaP59zSzmHsRzTedrW0PoLslMePgrQ205Ilt53DZ9ptJ+jiAmMSHZMCXtZEn5exXudS80wEg==
X-Received: by 2002:a17:90b:4a82:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-30aac1b3322mr3482753a91.16.1746601138036;
        Tue, 06 May 2025 23:58:58 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:32 +0400
Subject: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=5490;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=M8A28/FCgOo+Deh18WtLaw69mM3yhAAB9vBej8CvPmM=;
 b=DTwPvujc+dzWl1IVbzguAeSoM1aBFWO/ppre0b9GS9cnvyG6K+kcbZYTdwUB/upwnCr7nKc0/
 oFc/Z7V/5n6DkVxk9TTqEF8yGx30u2xWnIfr5K4U5/7iwkB1NgkRYiQ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_235859_097486_FEF0D4D8 
X-CRM114-Status: GOOD (  23.31  )
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

VIA/WonderMedia system timer IP can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obvously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and match register 0 for watchdog
respectively.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/Kconfig        | 11 +++++++
 drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++++++----
 2 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38603dae485db71cfc7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -181,6 +181,17 @@ config VT8500_TIMER
 	help
 	  Enables support for the VT8500 driver.
 
+config VT8500_TIMER_WATCHDOG
+	bool "Enable VT8500 watchdog functionality"
+	depends on VT8500_TIMER
+	depends on WATCHDOG && WATCHDOG_CORE=y
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device
+
 config NPCM7XX_TIMER
 	bool "NPCM7xx timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..4128c4f19adc2e02b6df2d0aa2dca4659f62fba7 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -22,6 +22,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#include <linux/watchdog.h>
+
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
 
@@ -55,6 +57,9 @@
 #define MIN_OSCR_DELTA		16
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -81,15 +86,15 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sys_timer_ch)
 	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -120,6 +125,40 @@ static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	u64 cycles = wdd->timeout * VT8500_TIMER_HZ;
+	u64 deadline = clocksource.read(&clocksource) + cycles;
+
+	writel((u32)deadline, regbase + TIMER_MATCH_REG(0));
+	writel(TIMER_WD_EN, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	writel(0, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static struct watchdog_device vt8500_watchdog_device = {
+	.ops			= &vt8500_watchdog_ops,
+	.info			= &vt8500_watchdog_info,
+	.max_hw_heartbeat_ms	= -1UL / (VT8500_TIMER_HZ / 1000),
+};
+
 static int __init vt8500_timer_init(struct device_node *np)
 {
 	int timer_irq, ret;
@@ -131,7 +170,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +181,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -163,6 +204,16 @@ static int __init vt8500_timer_init(struct device_node *np)
 	clockevents_config_and_register(&clockevent, VT8500_TIMER_HZ,
 					MIN_OSCR_DELTA * 2, 0xf0000000);
 
+	if (!IS_ENABLED(CONFIG_VT8500_TIMER_WATCHDOG))
+		return 0;
+
+	if (!sys_timer_ch) {
+		pr_info("%s: Not enabling watchdog: only one irq was given\n",
+			__func__);
+	} else {
+		watchdog_register_device(&vt8500_watchdog_device);
+	}
+
 	return 0;
 }
 

-- 
2.49.0


