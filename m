Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32899C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FmjOPqcaSgOCi/9ya/DEiNHkW/DQmRDIocf1JDp9+8=; b=jzDS0DAPd48Zoy3hCCHYSj5zgM
	tjYJCPE1MXwY1px8nf0iVqgLHYQty1URQiqkkuBAxW+YDFm6ZmZ7FlMOhUID+4eNYaw2hSVvN+njm
	m338sr8dbzftPIJOBwlnu44UEZsPDbOeANXtgJkMsmo+hSaYqb6oeU9QYRxc3Be2ai4a2FfgsTQ6t
	9bBHnie4YNTpq1GNLdQKvjpj1XM5WjhBYqV96LE/PSuhL10UHh7bD3b0P42p4lyUn+YaebM8DQJCl
	slFbCe5YyPhHJpniNH9gMthb2NEE4CtjtkjC7JxxY4+SiBsM9aiWbSy4sksBxW3I2NiWhMI/c+9xJ
	SlrzCNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twef3-00000002mX7-3f4O;
	Mon, 24 Mar 2025 10:04:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twebc-00000002lsW-1unw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 10:00:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-399744f74e9so2455977f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742810427; x=1743415227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FmjOPqcaSgOCi/9ya/DEiNHkW/DQmRDIocf1JDp9+8=;
        b=mxf1VI6cnc3hMiRXBjHci33aIgJYGHf+YgfvSs5OaE7HPRISJ80KV6BB7sntCjNXsu
         tZTDYmI5T1NOrehBOvZIBqQXtG6ax/pH/S7VcwCCoylZWzzv8bkb+VbC7TY5JboL6ATf
         tj6v0NWNelAySMB/wuAMs4mHrDwBC2Ou4cWK5i907Zdq89O7ruDtJgiI0AUpH8+j034j
         5/L+GHpSEA+idwmpJLz/DMe9+zJM+/MlqvFSAA6GuipdVbD9YZjupt/AKmiXUef4OfRU
         0EfKoatAROmBPk6CBz79QxRtxDGC/nKZjg419NYkHGDp7Y9CDpD9SZJHjE7lvlf0ulAO
         W//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810427; x=1743415227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FmjOPqcaSgOCi/9ya/DEiNHkW/DQmRDIocf1JDp9+8=;
        b=Kdml0bM2fsbqUXifQj0dak1wIz9Bw8tpfrkFTDzhq7XpV35cDNL4IohbNN1mnYLFtk
         k6R7ObG/VplRK14DDGOy92XpoKP4GhWmAsOcUP6Y6KDmp03Pl6OMaP2CHV6/iyav9Vq6
         FNj5kGnzZQCAo1/LmV1MnvZLWx2as03InrZdR1+sMYPr0liM5NcgyqF1fgGJsRKXQ6ut
         jb7/hEBtt1KnYWo3pWUdCfXiQ0KhaUrsHI8y1hkPW8VL6CPiol5Uj4yti6UAWmUAvXfM
         NUcyZrBWAFCj5SuQYx/2bzY/G6u+0M3O6OSEFIaujETwjbUsvY0t9RHDkVY4azePC8Uz
         Txhg==
X-Forwarded-Encrypted: i=1; AJvYcCXCcqqjnL+VJlUz50B+FKM6DIKkyyh/UpgGQN5pxXWDIp1/4clqev2LLZ1b0b3BMDpB7lHHpceMygHTdNUsZHuR@lists.infradead.org
X-Gm-Message-State: AOJu0YxN5lOpytyuoTJslZZFS4X8YrGQ4NeNyxZdg8O+P/BaRUjWnZig
	iL5EoNFifHfNSkKzOX5ryOeP2tOv8eC80JUIOqKoXwXunw0UtKizm96wWJTmjIQ=
X-Gm-Gg: ASbGncv/NcosyXelaJgBvMYM0jfaKwHKJwfdnhE9YeXqMqRvgfIn5n9y2sFFwgo7oL5
	SfbYznWG2XjwV6xsaIUemYejuH3fVtMJZPN13Id/5T9wuPG0qbN8oxNlJvC1MVKDLIj7xU6Eo9H
	LmvzkTmfzutbXlo56gjtt+DLPvnYKAs0+8cKr5mZWV5qdWOHgNm1Ult/V4DG4XJJI8ZByG6MeyV
	2iAm8rIvRlhHUVXW5027AALxBX/pRx/zYnbMBLTxKOa0F269NIB7dTnegkruFcOL8sK3obG5DgJ
	wNloqHB77Zjp15mZXFV4PpZvoLxLdgoQsv384LiJJcReXlhaNA4kK7+8VtvssZUvLkKBUnk=
X-Google-Smtp-Source: AGHT+IGVcrLVHoOTq4/wluY4r9/7ywY6Fvcgq3Q6i6IZAu6RWwf0g5/FYB/5JvHPK57ITvhCpfeXbw==
X-Received: by 2002:a5d:5846:0:b0:391:4559:8761 with SMTP id ffacd0b85a97d-3997f94da30mr9523006f8f.36.1742810426550;
        Mon, 24 Mar 2025 03:00:26 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995611sm10625933f8f.15.2025.03.24.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:00:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Thomas Fossati <thomas.fossati@linaro.org>,
	Larisa Grigore <Larisa.Grigore@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer Module for the s32g platform
Date: Mon, 24 Mar 2025 11:00:06 +0100
Message-ID: <20250324100008.346009-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_030028_514639_5CC7D97B 
X-CRM114-Status: GOOD (  32.06  )
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

STM supports commonly required system and application software timing
functions. STM includes a 32-bit count-up timer and four 32-bit
compare channels with a separate interrupt source for each
channel. The timer is driven by the STM module clock divided by an
8-bit prescale value (1 to 256).

STM has the following features:
    • One 32-bit count-up timer with an 8-bit prescaler
    • Four 32-bit compare channels
    • An independent interrupt source for each channel
    • Ability to stop the timer in Debug mode

The s32g platform is declined into two versions, the s32g2 and the
s32g3. The former has a STM block with 8 timers and the latter has 12
timers.

There is a special STM instance called STM_TS which is dedicated to
the timestamp. The 7th STM instance STM_07 is directly tied to the
STM_TS which means it is not usable as a clockevent.

This driver provides the core code to support both platform but only
the s32g2 is configured. Adding the s32g3 STM support is
straighforward.

The first probed STM is used as a clocksource, the second will be the
broadcast timer and the rest are used as a clockevent with the
affinity set to a CPU. The rating is higher than the ARM architected
timers, so if they are enabled in the kernel configuration, they will
take over and used in place of the architected timers. The plaform
data is used to specify if a clocksource, a broadcast clockevent or a
per-cpu clockevent is desired thus allowing more flexibility in the
future to configure the STMs on the system.

Cc: Thomas Fossati <thomas.fossati@linaro.org>
Co-developed-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Co-developed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig         |   9 +
 drivers/clocksource/Makefile        |   2 +
 drivers/clocksource/timer-nxp-stm.c | 524 ++++++++++++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..e86e327392af 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -763,4 +763,13 @@ config RALINK_TIMER
 	  Enables support for system tick counter present on
 	  Ralink SoCs RT3352 and MT7620.
 
+config NXP_STM_TIMER
+	bool "NXP System Timer Module driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	select CLKSRC_MMIO
+	help
+	  Support for NXP System Timer Module. It will create, in this
+	  order, a clocksource, a broadcast clockevent and a per cpu
+	  clockevent.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 43ef16a4efa6..c3a92e6b9f94 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -92,3 +92,5 @@ obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
+obj-$(CONFIG_NXP_STM_TIMER)		+= timer-nxp-stm.o
+
diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
new file mode 100644
index 000000000000..b67e438487ae
--- /dev/null
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018,2021-2025 NXP
+ *
+ * NXP System Timer Module:
+ *
+ *  STM supports commonly required system and application software
+ *  timing functions. STM includes a 32-bit count-up timer and four
+ *  32-bit compare channels with a separate interrupt source for each
+ *  channel. The timer is driven by the STM module clock divided by an
+ *  8-bit prescale value (1 to 256). It has ability to stop the timer
+ *  in Debug mode
+ *
+ */
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/sched_clock.h>
+
+/*
+ * Each stm has 4 channels which take 0x10 Bytes register space
+ */
+#define STM_CHANNEL(n)	(0x10 * ((n) + 1))
+
+#define STM_CCR			0x00
+#define STM_CCR_CEN		BIT(0)
+
+#define STM_CIR			0x04
+#define STM_CIR_CIF		BIT(0)
+
+#define STM_CMP			0x08
+
+#define STM_CR			0x00
+#define STM_CR_TEN		BIT(0)
+#define STM_CR_FRZ		BIT(1)
+#define STM_CR_CPS_OFFSET	8u
+#define STM_CR_CPS_MASK		GENMASK(15, STM_CR_CPS_OFFSET)
+#define STM_CR_CPS(x)		(((x) << STM_CR_CPS_OFFSET) & STM_CR_CPS_MASK)
+
+#define STM_CNT			0x04
+
+#define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
+
+struct stm_clocksource {
+	struct clocksource cs;
+	int counter;
+};
+
+struct stm_clockevent {
+	struct clock_event_device ced;
+	unsigned long delta;
+};
+
+struct stm_timer {
+	void __iomem *base;
+	unsigned long rate;
+	union {
+		struct stm_clocksource scs;
+		struct stm_clockevent sce;
+	};
+};
+
+static DEFINE_PER_CPU(struct stm_timer *, stm_timers);
+
+static struct stm_timer *stm_sched_clock;
+
+/**
+ * struct stm_instances - a set of counter for the STM initialized
+ *
+ * @clocksource: an integer giving the number of initialized clocksource
+ * @clockevent_per_cpu: an integer giving the number of initialized clockevent per cpu
+ * @clockevent_broadcast: an integer giving the number of initialized broadcast clockevent
+ * @features: a set of flag telling what kind of timer to initialize
+ */
+struct stm_instances {
+	int clocksource;
+	int clockevent_per_cpu;
+	int clockevent_broadcast;
+	int features;
+};
+
+#define STM_CLKSRC		BIT(0)
+#define STM_CLKEVT_PER_CPU	BIT(1)
+#define STM_CLKEVT_BROADCAST	BIT(2)
+
+static struct stm_clocksource *cs_to_scs(struct clocksource *cs)
+{
+	return container_of(cs, struct stm_clocksource, cs);
+}
+
+static struct stm_clockevent *ced_to_sced(struct clock_event_device *ced)
+{
+	return container_of(ced, struct stm_clockevent, ced);
+}
+
+static struct stm_timer *cs_to_stm(struct clocksource *cs)
+{
+	struct stm_clocksource *scs = cs_to_scs(cs);
+
+	return container_of(scs, struct stm_timer, scs);
+}
+
+static struct stm_timer *ced_to_stm(struct clock_event_device *ced)
+{
+        struct stm_clockevent *sce = ced_to_sced(ced);
+
+        return container_of(sce, struct stm_timer, sce);
+}
+
+static u64 notrace nxp_stm_read_sched_clock(void)
+{
+	return readl(stm_sched_clock->base + STM_CNT);
+}
+
+static u32 nxp_stm_clocksource_getcnt(struct stm_timer *stm_timer)
+{
+	return readl(stm_timer->base + STM_CNT);
+}
+
+static void nxp_stm_clocksource_setcnt(struct stm_timer *stm_timer, u32 cnt)
+{
+	writel(cnt, stm_timer->base + STM_CNT);
+}
+
+static u64 nxp_stm_clocksource_read(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	return (u64)nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static int nxp_stm_clocksource_enable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+	u32 reg;
+
+	reg = readl(stm_timer->base + STM_CR);
+	reg &= ~STM_CR_CPS_MASK;
+	reg |= STM_ENABLE_MASK;
+
+	writel(reg, stm_timer->base + STM_CR);
+
+	return 0;
+}
+
+static void nxp_stm_clocksource_disable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+	u32 reg;
+
+	reg = readl(stm_timer->base + STM_CR);
+	reg &= ~(STM_CR_CPS_MASK | STM_ENABLE_MASK);
+
+	writel(reg, stm_timer->base + STM_CR);
+}
+
+static void nxp_stm_clocksource_suspend(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_clocksource_disable(cs);
+	stm_timer->scs.counter = nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static void nxp_stm_clocksource_resume(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_clocksource_setcnt(stm_timer, stm_timer->scs.counter);
+	nxp_stm_clocksource_enable(cs);
+}
+
+static int __init nxp_stm_clocksource_init(struct device *dev, const char *name,
+					   void __iomem *base, struct clk *clk)
+{
+	struct stm_timer *stm_timer;
+	int ret;
+
+	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
+	if (!stm_timer)
+		return -ENOMEM;
+
+	stm_timer->base = base;
+	stm_timer->rate = clk_get_rate(clk);
+
+	stm_timer->scs.cs.name = name;
+	stm_timer->scs.cs.rating = 460;
+	stm_timer->scs.cs.read = nxp_stm_clocksource_read;
+	stm_timer->scs.cs.enable = nxp_stm_clocksource_enable;
+	stm_timer->scs.cs.disable = nxp_stm_clocksource_disable;
+	stm_timer->scs.cs.suspend = nxp_stm_clocksource_suspend;
+	stm_timer->scs.cs.resume = nxp_stm_clocksource_resume;
+	stm_timer->scs.cs.mask = CLOCKSOURCE_MASK(32);
+	stm_timer->scs.cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	ret = clocksource_register_hz(&stm_timer->scs.cs, stm_timer->rate);
+	if (ret)
+		return ret;
+
+	stm_sched_clock = stm_timer;
+
+	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+
+	dev_set_drvdata(dev, stm_timer);
+
+	dev_dbg(dev, "Registered clocksource %s\n", name);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_read_counter(struct stm_timer *stm_timer)
+{
+	return readl(stm_timer->base + STM_CNT);
+}
+
+static void nxp_stm_clockevent_disable(struct stm_timer *stm_timer)
+{
+	/*
+	 * The counter is shared between channels and will continue to
+	 * be incremented. If STM_CMP value is too small, the next event can
+	 * be lost if we don't disable the entire module.
+	 * Disabling the entire module, makes STM not suitable as clocksource.
+	 */
+	writel(0, stm_timer->base + STM_CR);
+	writel(0, stm_timer->base + STM_CHANNEL(0) + STM_CCR);
+}
+
+static void nxp_stm_clockevent_enable(struct stm_timer *stm_timer)
+{
+	u32 reg = readl(stm_timer->base + STM_CR);
+
+	reg &= ~STM_CR_CPS_MASK;
+	reg |= STM_ENABLE_MASK;
+
+	writel(reg, stm_timer->base + STM_CR);
+	writel(STM_CCR_CEN, stm_timer->base + STM_CHANNEL(0) + STM_CCR);
+}
+
+static void nxp_stm_clockevent_irq_clr(struct stm_timer *stm_timer)
+{
+	/* Clear the interrupt */
+	writel(STM_CIR_CIF, stm_timer->base + STM_CHANNEL(0) + STM_CIR);
+}
+
+static void nxp_stm_clockevent_irq_ack(struct stm_timer *stm_timer)
+{
+	u32 val;
+
+	nxp_stm_clockevent_irq_clr(stm_timer);
+
+	/*
+	 * Update STM_CMP value using the counter value
+	 */
+	val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->sce.delta;
+
+	writel(val, stm_timer->base + STM_CHANNEL(0) + STM_CMP);
+}
+
+static irqreturn_t nxp_stm_clockevent_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *ced = dev_id;
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	nxp_stm_clockevent_irq_ack(stm_timer);
+
+	/*
+	 * stm hardware doesn't support oneshot, it will generate an
+	 * interrupt and start the counter again so software need to
+	 * disable the timer to stop the counter loop in ONESHOT mode.
+	 */
+	if (likely(clockevent_state_oneshot(ced)))
+		nxp_stm_clockevent_disable(stm_timer);
+
+	ced->event_handler(ced);
+
+	return IRQ_HANDLED;
+}
+
+static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+	u32 val;
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	stm_timer->sce.delta = delta;
+
+	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
+
+	writel(val, stm_timer->base + STM_CHANNEL(0) + STM_CMP);
+
+	nxp_stm_clockevent_enable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+        return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
+}
+
+static int __init nxp_stm_clockevent_broadcast_init(struct device *dev, const char *name, void __iomem *base,
+						    int irq, struct clk *clk)
+{
+	struct stm_timer *stm_timer;
+	int ret;
+
+	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
+	if (!stm_timer)
+		return -ENOMEM;
+
+	stm_timer->base = base;
+	stm_timer->rate = clk_get_rate(clk);
+
+	stm_timer->sce.ced.name = name;
+	stm_timer->sce.ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	stm_timer->sce.ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
+	stm_timer->sce.ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
+	stm_timer->sce.ced.set_next_event = nxp_stm_clockevent_set_next_event;
+	stm_timer->sce.ced.cpumask = cpu_possible_mask;
+	stm_timer->sce.ced.rating = 460;
+	stm_timer->sce.ced.irq = irq;
+
+	nxp_stm_clockevent_irq_clr(stm_timer);
+
+	ret = request_irq(irq, nxp_stm_clockevent_interrupt,
+			  IRQF_TIMER | IRQF_NOBALANCING, name, &stm_timer->sce.ced);
+	if (ret) {
+		dev_err(dev, "Unable to allocate interrupt line: %d\n", ret);
+		return ret;
+	}
+
+	clockevents_config_and_register(&stm_timer->sce.ced, stm_timer->rate, 1, 0xffffffff);
+
+	dev_dbg(dev, "Registered broadcast clockevent %s irq=%d\n", name, irq);
+
+	return 0;
+}
+
+static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, const char *name, void __iomem *base,
+						  int irq, struct clk *clk, int cpu)
+{
+	struct stm_timer *stm_timer;
+	int ret;
+
+	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
+	if (!stm_timer)
+		return -ENOMEM;
+
+	stm_timer->base = base;
+	stm_timer->rate = clk_get_rate(clk);
+
+	stm_timer->sce.ced.name = name;
+	stm_timer->sce.ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	stm_timer->sce.ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
+	stm_timer->sce.ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
+	stm_timer->sce.ced.set_next_event = nxp_stm_clockevent_set_next_event;
+	stm_timer->sce.ced.cpumask = cpumask_of(cpu);
+	stm_timer->sce.ced.rating = 460;
+	stm_timer->sce.ced.irq = irq;
+
+	nxp_stm_clockevent_irq_clr(stm_timer);
+
+	ret = request_irq(irq, nxp_stm_clockevent_interrupt,
+			  IRQF_TIMER | IRQF_NOBALANCING, name, &stm_timer->sce.ced);
+	if (ret) {
+		dev_err(dev, "Unable to allocate interrupt line: %d\n", ret);
+		return ret;
+	}
+
+	per_cpu(stm_timers, cpu) = stm_timer;
+
+	dev_dbg(dev, "Initialized per cpu clockevent name=%s, irq=%d, cpu=%d\n", name, irq, cpu);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
+{
+	struct stm_timer *stm_timer = per_cpu(stm_timers, cpu);
+	int ret;
+
+	if (WARN_ON(!stm_timer))
+		return -EFAULT;
+
+	ret = irq_force_affinity(stm_timer->sce.ced.irq, cpumask_of(cpu));
+	if (ret)
+		return ret;
+
+	clockevents_config_and_register(&stm_timer->sce.ced, stm_timer->rate, 1, 0xffffffff);
+
+	return 0;
+}
+
+static int __init nxp_stm_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct stm_instances *stm_instances;
+	const char *name = of_node_full_name(np);
+	void __iomem *base;
+	int irq, ret;
+	struct clk *clk;
+
+	stm_instances = (typeof(stm_instances))of_device_get_match_data(dev);
+	if (!stm_instances) {
+		dev_err(dev, "No STM instances associated with a cpu");
+		return -EINVAL;
+	}
+
+	base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base)) {
+		dev_err(dev, "Failed to iomap %pOFn\n", np);
+		return PTR_ERR(base);
+	}
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq <= 0) {
+		dev_err(dev, "Failed to parse and map IRQ: %d\n", irq);
+		return -EINVAL;
+	}
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Clock not found\n");
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable STM timer clock: %d\n", ret);
+		return ret;
+	}
+
+	if (!stm_instances->clocksource && (stm_instances->features & STM_CLKSRC)) {
+
+		/*
+		 * First probed STM will be a clocksource
+		 */
+		ret = nxp_stm_clocksource_init(dev, name, base, clk);
+		if (ret)
+			return ret;
+		stm_instances->clocksource++;
+
+	} else if (!stm_instances->clockevent_broadcast &&
+		   (stm_instances->features & STM_CLKEVT_BROADCAST)) {
+
+		/*
+		 * Second probed STM will be a broadcast clockevent
+		 */
+		ret = nxp_stm_clockevent_broadcast_init(dev, name, base, irq, clk);
+		if (ret)
+			return ret;
+		stm_instances->clockevent_broadcast++;
+
+	} else if (stm_instances->clockevent_per_cpu < num_possible_cpus() &&
+		   (stm_instances->features & STM_CLKEVT_PER_CPU)) {
+
+		/*
+		 * Next probed STM will be a per CPU clockevent, until
+		 * we probe as much as we have CPUs available on the
+		 * system, we do a partial initialization
+		 */
+		ret = nxp_stm_clockevent_per_cpu_init(dev, name, base, irq, clk,
+						      stm_instances->clockevent_per_cpu);
+		if (ret)
+			return ret;
+
+		stm_instances->clockevent_per_cpu++;
+
+		/*
+		 * The number of probed STM for per CPU clockevent is
+		 * equal to the number of available CPUs on the
+		 * system. We install the cpu hotplug to finish the
+		 * initialization by registering the clockevents
+		 */
+		if (stm_instances->clockevent_per_cpu == num_possible_cpus()) {
+			ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
+						nxp_stm_clockevent_starting_cpu, NULL);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct stm_instances s32g_stm_instances = { .features = STM_CLKSRC | STM_CLKEVT_PER_CPU };
+
+static const struct of_device_id nxp_stm_of_match[] = {
+	{ .compatible = "nxp,s32g2-stm", &s32g_stm_instances },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
+
+static struct platform_driver nxp_stm_probe = {
+	.probe	= nxp_stm_timer_probe,
+	.driver	= {
+		.name = "nxp-stm",
+		.of_match_table = of_match_ptr(nxp_stm_of_match),
+	},
+};
+module_platform_driver(nxp_stm_probe);
+
+MODULE_DESCRIPTION("NXP System Timer Module driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


