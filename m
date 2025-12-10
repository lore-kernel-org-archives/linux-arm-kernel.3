Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A29D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 05:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQnnf4/i1gXmHnGWWjHqF82jQwF8lJyYevfy5KcRtwc=; b=n6SEY2uEw5feFcPh3TprYDa5ev
	TyPRSRWTR44C22HB1sRG4L9+8mgUSwaOsNqk8GW8ldJdAi+wu55tbPajoEXdlB3OusPGe/SjHwAE1
	fHl50gW6M+lFvQh5RUiM6UjNHIEktfYASz095XqZQRYmgb/c2EhoyiqHi3lms2WY/NyVB2OLguWR4
	ULoKqPmPdDSeWELdRcYo5OkVtNx+aSdFZUl+KfTBaNHJNE11dn5Qvd8EBi4quHNUHJzGoZW/QfdtX
	hjAeiEnHgGNtpqrJ+sLTJnY3jSp9H7SpDT8m1VTIXaxD6W+Ru1ZlCmrV9g235k65OEhq6GXsWnPAh
	GwjvJjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTChb-0000000F89E-1DBt;
	Wed, 10 Dec 2025 05:25:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTChX-0000000F87g-2bx6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 05:25:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso84769745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 21:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765344322; x=1765949122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQnnf4/i1gXmHnGWWjHqF82jQwF8lJyYevfy5KcRtwc=;
        b=T1xUcB1TBxaF+ajicXJe3wf2H0zXbekmCYW3568naQPUD4qYqWC4aDWZVQcmcGkRtF
         oszXY0CZwTEmtGIeSI6EUmJM91DOzrf8w7o1ugdFZGxEsRQ/ZWBFNFswOOMsWQ7VuJHK
         MEX+Ujr3GBOnkmEQcWlNmLnTIiTi/nFWEqI1/Eu4sEpPJJ4vanzqcjVFISNVJNBKAIBX
         97LE7qjYx5lnUkjftwtJVtxqWaWUQZJNxB91SJXMyAYlmiShVpnj21IOj8x8K+/2tQG1
         JDo3oJBYmsI1PttQkACfF8Ljb1zqud/DD2n3L+S/0OLNGVj4z8q6PTkQ5vr63QUrtRSq
         id8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344322; x=1765949122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gQnnf4/i1gXmHnGWWjHqF82jQwF8lJyYevfy5KcRtwc=;
        b=ox3AMU8Hzf+1h2MeFvmaL8Nia78XrdCpm9I3MmOrAxXK5pmxobsGa5DVxIHyWsARjZ
         p02DjUWDu0tFhfytGazv8co7WKUMFscvL0EdzVltkRaU8e0HeE93WWioK4Z8U8w4aX/S
         AdYET2OegBZliIftJErFHknrIlCD1XYx2wHInViyOESFL2D/SqWsqS3U1krII9K3FJ2K
         IZCqUqUOniASpsbPh3DVkL6Q+3+LYd1Z7usfXV86WNhjTZUWmGqZgN1P82q2P/nAJmd7
         ggTrILPLLov2gflN/4UcI7KztPmEDWG/6WyleN4uHMTj6jVUB3dE9ZNiKgAf80R/80wm
         AdnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU936Ccz2vVEAiELmFmK1GljEncz080M+eBZy4D8sVgLyxdzaxC3hgJsL/UYhPSQc5oxj2q8xrje78YoK3SEU/S@lists.infradead.org
X-Gm-Message-State: AOJu0YyRkQQW33Uezwk7IUM3VYNewbWXFJNl6U6b/+tBax/ac2r55HIj
	Ai6Q0zGGhi5SQf5A2A3VA9SqFsxtWoxuByrFrPLbe+omkNysGDNkmnj8G8OZNZ8VQeM=
X-Gm-Gg: ASbGnctBZan4fbC/ahOKiW3X2WfMUPW/e57FhWEcoY3IVqj4N37t5jQYF/hSLAgmv3U
	h7tOBefZrv2msNY5EDFy/GXLzbkWkZ/e5f2ybmko+soWGwylcJwi7oMHhl5ZdPfu3R8AZC5gdwP
	/FOG62jEd3901KriMO1kvfTKn9c6S3qPRFoQDIjI8GtDDmH2tSk0m3o5f6sXtwqNJUW2BlN8ZdN
	4IspyhHu4UqZJ1U6jPJ26Exp08bMZnSv8lZ4GwRqWdv/TPC2Mu2g1fkRzzoAUEuDdQ3Wol+J8NN
	2eXdUui8bRpiB+6d/QqZ57VIFGfy0X/wgzM+RKQZYirTLlfmJbQtrAylpfTleybDgi4oGMcFfOj
	nryN6tqOZY8iD6FUn9ZdohIDYS2lfVpS2MiwJ4XUelIitmY/Oajzppai1co+OAGsxgSmsKO1MDG
	0Mj9DfUx64dv03WcR5F63HzGSeJqqh2tk=
X-Google-Smtp-Source: AGHT+IHtTQZQEOi/01wtyusFyCfqsqk26GiFjJ4zfoTrpC3Xwr4N2SeeP+sZkYfgwOyzvXl9xv3NXg==
X-Received: by 2002:a05:600c:4ec9:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47a8380b2e6mr10228405e9.6.1765344321760;
        Tue, 09 Dec 2025 21:25:21 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4fde:b93c:87db:86e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d3a75a3sm33485695e9.6.2025.12.09.21.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:25:21 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org
Cc: s32@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v2 3/3] counter: Add STM based counter
Date: Wed, 10 Dec 2025 06:24:47 +0100
Message-ID: <20251210052449.4154283-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
References: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_212523_720494_063986CC 
X-CRM114-Status: GOOD (  24.20  )
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

The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
three Cortex-M7 cores, along with a large number of timers and
counters. These hardware blocks can be used as clocksources or
clockevents, or as timestamp counters shared across the various
subsystems running alongside the Linux kernel, such as firmware
components. Their actual usage depends on the overall platform
software design.

In a Linux-based system, the kernel controls the counter, which is a
read-only shared resource for the other subsystems. One of its primary
purposes is to act as a common timestamp source for messages or
traces, allowing correlation of events occurring in different
operating system contexts.

These changes introduce a basic counter driver that can start, stop,
and reset the counter. It also handles overflow accounting and
configures the prescaler value.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/counter/Kconfig       |  10 +
 drivers/counter/Makefile      |   1 +
 drivers/counter/nxp-stm-cnt.c | 386 ++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/counter/nxp-stm-cnt.c

diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index d30d22dfe577..bf5b281f194c 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -90,6 +90,16 @@ config MICROCHIP_TCB_CAPTURE
 	  To compile this driver as a module, choose M here: the
 	  module will be called microchip-tcb-capture.
 
+config NXP_STM_CNT
+	tristate "NXP System Timer Module Counter driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Select this option to enable the NXP System Timer Module
+	  Counter driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called nxp_stm_cnt.
+
 config RZ_MTU3_CNT
 	tristate "Renesas RZ/G2L MTU3a counter driver"
 	depends on RZ_MTU3
diff --git a/drivers/counter/Makefile b/drivers/counter/Makefile
index 40e644948e7a..196b3c216875 100644
--- a/drivers/counter/Makefile
+++ b/drivers/counter/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_I8254)			+= i8254.o
 obj-$(CONFIG_INTEL_QEP)			+= intel-qep.o
 obj-$(CONFIG_INTERRUPT_CNT)		+= interrupt-cnt.o
 obj-$(CONFIG_MICROCHIP_TCB_CAPTURE)	+= microchip-tcb-capture.o
+obj-$(CONFIG_NXP_STM_CNT)		+= nxp-stm-cnt.o
 obj-$(CONFIG_RZ_MTU3_CNT)		+= rz-mtu3-cnt.o
 obj-$(CONFIG_STM32_TIMER_CNT)		+= stm32-timer-cnt.o
 obj-$(CONFIG_STM32_LPTIMER_CNT)		+= stm32-lptimer-cnt.o
diff --git a/drivers/counter/nxp-stm-cnt.c b/drivers/counter/nxp-stm-cnt.c
new file mode 100644
index 000000000000..4b310dbbc76f
--- /dev/null
+++ b/drivers/counter/nxp-stm-cnt.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2018,2021-2025 NXP
+ * Copyright 2025 Linaro Limited
+ *
+ * Author: Daniel Lezcano <daniel.lezcano@linaro.org>
+ *
+ * NXP S32G System Timer Module counters:
+ *
+ *  STM supports commonly required system and application software
+ *  timing functions. STM includes a 32-bit count-up timer and four
+ *  32-bit compare channels with a separate interrupt source for each
+ *  channel. The timer is driven by the STM module clock divided by an
+ *  8-bit prescale value (1 to 256). It has ability to stop the timer
+ *  in Debug mode
+ *
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/counter.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define STM_CR(__base)		(__base)
+#define STM_CR_TEN		BIT(0)
+#define STM_CR_FRZ		BIT(1)
+#define STM_CR_CPS_MASK         GENMASK(15, 8)
+
+#define STM_CCR0(__base)	((__base) + 0x10)
+#define STM_CCR_CEN		BIT(0)
+
+#define STM_CIR0(__base)	((__base) + 0x14)
+#define STM_CIR_CIF		BIT(0)
+
+#define STM_CMP0(__base)	((__base) + 0x18)
+
+#define STM_CNT(__base)		((__base) + 0x04)
+
+#define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
+
+struct nxp_stm_cnt {
+	spinlock_t lock;
+	void __iomem *base;
+	u64 overflow;
+	u32 counter;
+	u8 prescaler;
+	bool is_started;
+};
+
+static void nxp_stm_cnt_enable(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	reg |= STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_disable(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	reg &= ~STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_ccr_disable(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(0, STM_CCR0(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_ccr_enable(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(STM_CCR_CEN, STM_CCR0(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_overflow(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(UINT_MAX, STM_CMP0(stm_cnt->base));
+}
+
+static u32 nxp_stm_cnt_get_counter(struct nxp_stm_cnt *stm_cnt)
+{
+	return readl(STM_CNT(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_counter(struct nxp_stm_cnt *stm_cnt, u32 counter)
+{
+	writel(counter, STM_CNT(stm_cnt->base));
+}
+
+static void nxp_stm_cnt_set_prescaler(struct nxp_stm_cnt *stm_cnt, u8 prescaler)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	FIELD_MODIFY(STM_CR_CPS_MASK, &reg, prescaler);
+
+	writel(reg, STM_CR(stm_cnt->base));
+}
+
+static u8 nxp_stm_cnt_get_prescaler(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg = readl(STM_CR(stm_cnt->base));
+
+	return FIELD_GET(STM_CR_CPS_MASK, reg);
+}
+
+static bool nxp_stm_cnt_is_started(struct nxp_stm_cnt *stm_cnt)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_cnt->base));
+
+	return !!FIELD_GET(STM_CR_TEN, reg);
+}
+
+static void nxp_stm_cnt_irq_ack(struct nxp_stm_cnt *stm_cnt)
+{
+	writel(STM_CIR_CIF, STM_CIR0(stm_cnt->base));
+}
+
+static irqreturn_t nxp_stm_cnt_irq(int irq, void *dev_id)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_id;
+
+	nxp_stm_cnt_irq_ack(stm_cnt);
+
+	spin_lock(&stm_cnt->lock);
+	stm_cnt->overflow++;
+	spin_unlock(&stm_cnt->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void nxp_stm_cnt_start(struct nxp_stm_cnt *stm_cnt)
+{
+	nxp_stm_cnt_ccr_enable(stm_cnt);
+	nxp_stm_cnt_set_overflow(stm_cnt);
+	nxp_stm_cnt_enable(stm_cnt);
+}
+
+static void nxp_stm_cnt_stop(struct nxp_stm_cnt *stm_cnt)
+{
+	nxp_stm_cnt_disable(stm_cnt);
+	nxp_stm_cnt_irq_ack(stm_cnt);
+	nxp_stm_cnt_ccr_disable(stm_cnt);
+}
+
+static int nxp_stm_cnt_overflow_read(struct counter_device *counter,
+				     struct counter_count *count, u64 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&stm_cnt->lock, irqflags);
+	*val = stm_cnt->overflow;
+	spin_unlock_irqrestore(&stm_cnt->lock, irqflags);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_overflow_write(struct counter_device *counter,
+				      struct counter_count *count, u64 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&stm_cnt->lock, irqflags);
+	stm_cnt->overflow = val;
+	spin_unlock_irqrestore(&stm_cnt->lock, irqflags);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_reset_write(struct counter_device *counter,
+				   struct counter_count *count, u8 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	nxp_stm_cnt_set_counter(stm_cnt, 0);
+	spin_lock(&stm_cnt->lock);
+	stm_cnt->overflow = 0;
+	spin_unlock(&stm_cnt->lock);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_prescaler_read(struct counter_device *counter,
+				      struct counter_count *count, u8 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	*val = nxp_stm_cnt_get_prescaler(stm_cnt);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_prescaler_write(struct counter_device *counter,
+				       struct counter_count *count, u8 val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	nxp_stm_cnt_set_prescaler(stm_cnt, val);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_count_enable_write(struct counter_device *counter,
+					  struct counter_count *count, u8 enable)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	if (enable)
+		nxp_stm_cnt_start(stm_cnt);
+	else
+		nxp_stm_cnt_stop(stm_cnt);
+
+	return 0;
+}
+
+static int nxp_stm_cnt_count_enable_read(struct counter_device *counter,
+					 struct counter_count *count, u8 *enable)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(counter);
+
+	*enable = nxp_stm_cnt_is_started(stm_cnt);
+
+	return 0;
+}
+
+static struct counter_comp stm_cnt_count_ext[] = {
+	COUNTER_COMP_COUNT_BOOL("reset",  NULL, nxp_stm_cnt_reset_write),
+	COUNTER_COMP_COUNT_U8("prescaler", nxp_stm_cnt_prescaler_read, nxp_stm_cnt_prescaler_write),
+	COUNTER_COMP_COUNT_U64("overflows", nxp_stm_cnt_overflow_read, nxp_stm_cnt_overflow_write),
+	COUNTER_COMP_ENABLE(nxp_stm_cnt_count_enable_read, nxp_stm_cnt_count_enable_write),
+};
+
+static int nxp_stm_cnt_count_read(struct counter_device *dev,
+				  struct counter_count *count, u64 *val)
+{
+	struct nxp_stm_cnt *stm_cnt = counter_priv(dev);
+
+	*val = nxp_stm_cnt_get_counter(stm_cnt);
+
+	return 0;
+}
+
+static const struct counter_ops nxp_stm_cnt_counter_ops = {
+	.count_read  = nxp_stm_cnt_count_read,
+};
+
+static struct counter_count nxp_stm_cnt_counts[] = {
+	{
+		.id = 0,
+		.name = "stm_cnt",
+		.ext = stm_cnt_count_ext,
+		.num_ext = ARRAY_SIZE(stm_cnt_count_ext),
+	},
+};
+
+static int nxp_stm_cnt_suspend(struct device *dev)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_get_drvdata(dev);
+
+	stm_cnt->is_started = nxp_stm_cnt_is_started(stm_cnt);
+
+	if (stm_cnt->is_started) {
+		nxp_stm_cnt_stop(stm_cnt);
+		stm_cnt->prescaler = nxp_stm_cnt_get_prescaler(stm_cnt);
+		stm_cnt->counter = nxp_stm_cnt_get_counter(stm_cnt);
+	}
+
+	return 0;
+}
+
+static int nxp_stm_cnt_resume(struct device *dev)
+{
+	struct nxp_stm_cnt *stm_cnt = dev_get_drvdata(dev);
+
+	if (stm_cnt->is_started) {
+		nxp_stm_cnt_set_counter(stm_cnt, stm_cnt->counter);
+		nxp_stm_cnt_set_prescaler(stm_cnt, stm_cnt->prescaler);
+		nxp_stm_cnt_start(stm_cnt);
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(nxp_stm_cnt_pm_ops, nxp_stm_cnt_suspend,
+				nxp_stm_cnt_resume);
+
+static int nxp_stm_cnt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct counter_device *counter;
+	struct nxp_stm_cnt *stm_cnt;
+	struct clk *clk;
+	void __iomem *base;
+	int irq, ret;
+
+	base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Clock not found\n");
+
+	counter = devm_counter_alloc(dev, sizeof(*stm_cnt));
+	if (!counter)
+		return -ENOMEM;
+
+	stm_cnt = counter_priv(counter);
+
+	stm_cnt->base = base;
+	stm_cnt->overflow = 0;
+	spin_lock_init(&stm_cnt->lock);
+
+	counter->name       = "stm_counter";
+	counter->parent     = &pdev->dev;
+	counter->ops        = &nxp_stm_cnt_counter_ops;
+	counter->counts     = nxp_stm_cnt_counts;
+	counter->num_counts = ARRAY_SIZE(nxp_stm_cnt_counts);
+
+	ret = devm_request_irq(dev, irq, nxp_stm_cnt_irq, IRQF_TIMER | IRQF_NOBALANCING,
+			       dev_name(&counter->dev), stm_cnt);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
+
+	ret = devm_counter_add(dev, counter);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register counter\n");
+
+	platform_set_drvdata(pdev, stm_cnt);
+
+	return 0;
+}
+
+static void nxp_stm_cnt_remove(struct platform_device *pdev)
+{
+	struct nxp_stm_cnt *stm_cnt = platform_get_drvdata(pdev);
+
+	if (nxp_stm_cnt_is_started(stm_cnt))
+		nxp_stm_cnt_stop(stm_cnt);
+}
+
+static const struct of_device_id nxp_stm_cnt_of_match[] = {
+	{ .compatible = "nxp,s32g2-stm", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxp_stm_cnt_of_match);
+
+static struct platform_driver nxp_stm_cnt_driver = {
+	.probe  = nxp_stm_cnt_probe,
+	.remove = nxp_stm_cnt_remove,
+	.driver = {
+		.name           = "nxp-stm-cnt",
+		.pm		= pm_sleep_ptr(&nxp_stm_cnt_pm_ops),
+		.of_match_table = nxp_stm_cnt_of_match,
+	},
+};
+module_platform_driver(nxp_stm_cnt_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Lezcano");
+MODULE_DESCRIPTION("NXP System Timer Module counter driver");
+MODULE_IMPORT_NS("COUNTER");
-- 
2.43.0


