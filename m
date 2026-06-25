Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AAACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykp6VmAk2mKFL4rc0E+upkmKkYloT8JNECQx0fEbsnw=; b=kOaJCxTYXr5HUbjMxQFvl/MK2j
	kkDtyOiZX9UuanFBze/CuTeYdjXMH/2kUEUUk18+3mbvnFcahpD4CB1cjvk56NOBnx0AU6wHpwzFE
	RgNKq2Slakyn+zQwdG7kT679c5bSLxc4XFtg0UsIGsGgDAlPVy65Csd8wxxZ/uZIOyvcKZkjgIoFz
	6ofXfXtZPTM6oNhnFfNISLp3c36VbZZXmFlvyNrsv4TXq9Enf/0RBXz+G4GyezNIgUJEKOYiWAfXk
	NLYlJRoQHgRGH+zR42w8Vx4tNmyeJC5NHl3XApyV1ivSi41ZxjvawcIRtlApDkIlytozUMAZsl/dd
	ugcfgUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchvC-000000094E2-488T;
	Thu, 25 Jun 2026 11:07:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchv7-000000094As-1WA2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:06:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8452a597afcso1493384b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385616; x=1782990416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykp6VmAk2mKFL4rc0E+upkmKkYloT8JNECQx0fEbsnw=;
        b=RbYf/jofp/DCbdhOMZpoiK9RN2v+Z/hvIIXiOiOUuiZ+BriHwaXMrLqj6FzkBQ+1qk
         4gSZ+U1ENBCRcgBSsZ9zY3+cNs3cA0AfWji6om3HBW2s4mP48zdjsmMCRB14qUmVO3NP
         M7Fs9/msjQ0hO7Sbv+P3uEUgPgD4k3nx6AS8VUebfVCPfuzoEjkEwLkxsGCVnCEuo6bL
         McdPoalcm3Axv2+/4y6IAB+ge/W1LRIDCz73wnpeYNwNyOxritcO+AXpSGwiCsTF5qew
         TOmivZrxo++KoeY5WV++flXMJARzx2cbQpl4TphF1UHJd8cen5nU7oNGThu3YnJOsDvi
         HoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385616; x=1782990416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ykp6VmAk2mKFL4rc0E+upkmKkYloT8JNECQx0fEbsnw=;
        b=htMFgAwjWwmK6QqO/vu47oIi39Vzn0ERlx4PiQLzvN9amturBcg8NjzQWRGtKgH4v+
         Nb+hpNGwbT8LiHEJmJtzwJ+uKkoliKBRqNmP+qerC6fi2LEDsXm4wX0nGHgBazdA48Wv
         oTPdsvFKQxYp4u3VC4zDhspCzCf/bfvpLh6QthgZgftqT0zESboDGVxjhLznEg7Jg65S
         ivlQVswmzBZVSlm9PWQqg9zNfYHabHaO8yDfX3zlFI9RLRmNLf+CuiANpfaI11EnTvos
         6qACqMSPvapuufoKogJFXYA1V1N3dRWLTEkIcrEsBwk6jouwrWaGDUx4rlmTW9GmYpDZ
         T13Q==
X-Forwarded-Encrypted: i=1; AFNElJ+WoDuaXi7Uv42CUA6MrFagvNG8T/dSHfZnU2e++UoFBc0wAKJQDwDouUE2XSc3hyS+dfxMWbZJ4GHMdCaeilu4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72kPWzxdCfjt7OFjc/6BWY0I2kYL9SFfXrzLG914sHPpBN2hT
	bTLbHwLMT663rhpiqHPmgkkmbBSqZh5J07600urpv+/+2cdawCBAxgqI
X-Gm-Gg: AfdE7ckaukO0NptEZNC+HPqIcccw28KEV8DYZJxeJTZv6fhVYXzz4skx1tr4vi2h4XJ
	TLNhhn9yQFh65UoXthkRUKDMv9FxFkcQJd9JKjgUk9FDFJpdAgzzNpkywlNdTo/ASrfn43OZVax
	0o0K9lFA2puKKYUGFdvAZs9FFuh2QD+yinFbS9u+3LmrxLUnqd5vaBp9+YcJLbEfIlMpGHaz6SI
	y55bUEUQdvs7IMVe6y9C9zZ0C75RHGQcFfZj+sGGR9VO9hLRtYzsfMLmG2EQHp54Gbd1XMKW/Dy
	Cc85C7TyoTGVffOBWU+LoV47LshaI95LFsrg+uHUKclq5TDhwR8QlbYzAnf9Rpvri5+xqya+/iM
	pFkJFk0xzm+LAerRUj+i02k1tKXm10yt6TD/5HbRWzukJ8JUQQcJ5JsuBjhV8b2O4uTS9MdGVfR
	K0U7GGUT2GzYcckcwSczpgZUMXNuJozXWvzzntJzb5PPvUfGdwW/CyTOOfP6RsT2j0GCeDir1m8
	go=
X-Received: by 2002:a05:6a00:1382:b0:845:3b98:5fd6 with SMTP id d2e1a72fcca58-845b39afbb3mr3190486b3a.1.1782385616266;
        Thu, 25 Jun 2026 04:06:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm4412759b3a.22.2026.06.25.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:06:55 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Thu, 25 Jun 2026 19:06:38 +0800
Message-Id: <20260625110638.38438-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260625110638.38438-1-cwweng.linux@gmail.com>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_040657_439269_0C654DA0 
X-CRM114-Status: GOOD (  25.92  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add an IIO driver for the Nuvoton MA35D1 Enhanced ADC controller.

The driver supports direct raw reads and triggered buffered capture. The
controller end-of-conversion interrupt is exposed as the device trigger
and is used to push samples into the IIO buffer.

Channels are described by firmware child nodes and can be configured as
single-ended or differential inputs. Since the differential enable bit is
global, mixed single-ended and differential buffered scans are rejected.

DMA support is intentionally not included in this initial upstream driver;
conversions are handled through the interrupt-driven path.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/iio/adc/Kconfig       |  10 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/ma35d1_eadc.c | 636 ++++++++++++++++++++++++++++++++++
 3 files changed, 647 insertions(+)
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1c663c98c6c9..43409999a94b 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -981,6 +981,16 @@ config LTC2497
 	  To compile this driver as a module, choose M here: the module will be
 	  called ltc2497.
 
+config MA35D1_EADC
+	tristate "MA35D1 EADC driver"
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
+	help
+	  Say yes here to build support for MA35D1 EADC.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ma35d1.
+
 config MAX1027
 	tristate "Maxim max1027 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 707dd708912f..7b9b38688223 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LTC2471) += ltc2471.o
 obj-$(CONFIG_LTC2485) += ltc2485.o
 obj-$(CONFIG_LTC2496) += ltc2496.o ltc2497-core.o
 obj-$(CONFIG_LTC2497) += ltc2497.o ltc2497-core.o
+obj-$(CONFIG_MA35D1_EADC) += ma35d1_eadc.o
 obj-$(CONFIG_MAX1027) += max1027.o
 obj-$(CONFIG_MAX11100) += max11100.o
 obj-$(CONFIG_MAX1118) += max1118.o
diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
new file mode 100644
index 000000000000..0c075126e139
--- /dev/null
+++ b/drivers/iio/adc/ma35d1_eadc.c
@@ -0,0 +1,636 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton MA35D1 EADC driver
+ *
+ * Copyright (c) 2026 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bitmap.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+
+#define MA35D1_EADC_DAT(n)		(0x00 + (n) * 0x04)
+#define MA35D1_EADC_CTL			0x50
+#define MA35D1_EADC_SWTRG		0x54
+#define MA35D1_EADC_SCTL(n)		(0x80 + (n) * 0x04)
+#define MA35D1_EADC_INTSRC0		0xd0
+#define MA35D1_EADC_STATUS2		0xf8
+#define MA35D1_EADC_SELSMP0		0x140
+#define MA35D1_EADC_REFADJCTL		0x150
+
+#define MA35D1_EADC_CTL_ADCEN		BIT(0)
+#define MA35D1_EADC_CTL_ADCIEN0		BIT(2)
+#define MA35D1_EADC_CTL_DIFFEN		BIT(8)
+
+#define MA35D1_EADC_SCTL_CHSEL_MASK	GENMASK(3, 0)
+#define MA35D1_EADC_SCTL_TRGDLY_MASK	GENMASK(15, 8)
+#define MA35D1_EADC_SCTL_TRGSEL_MASK	GENMASK(21, 16)
+#define MA35D1_EADC_SCTL_TRGSEL_ADINT0	\
+	FIELD_PREP(MA35D1_EADC_SCTL_TRGSEL_MASK, 2)
+
+#define MA35D1_EADC_DAT_MASK		GENMASK(11, 0)
+#define MA35D1_EADC_STATUS2_ADIF0	BIT(0)
+#define MA35D1_EADC_INTSRC0_ADINT0	BIT(0)
+#define MA35D1_EADC_REFADJCTL_EXT_VREF	BIT(0)
+
+#define MA35D1_EADC_MAX_CHANNELS	9
+#define MA35D1_EADC_MAX_SAMPLE_MODULES	16
+#define MA35D1_EADC_CHAN_NAME_LEN	16
+#define MA35D1_EADC_TIMEOUT		msecs_to_jiffies(1000)
+
+struct ma35d1_adc {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk *clk;
+	struct completion completion;
+	/* Protects direct conversions against concurrent register access. */
+	struct mutex lock;
+	struct iio_trigger *trig;
+	unsigned int scan_chancnt;
+	bool scan_differential;
+	char chan_name[MA35D1_EADC_MAX_CHANNELS][MA35D1_EADC_CHAN_NAME_LEN];
+	struct {
+		u16 channels[MA35D1_EADC_MAX_SAMPLE_MODULES];
+		aligned_s64 timestamp;
+	} scan;
+};
+
+static inline u32 ma35d1_adc_read(struct ma35d1_adc *adc, u32 reg)
+{
+	return readl(adc->regs + reg);
+}
+
+static inline void ma35d1_adc_write(struct ma35d1_adc *adc, u32 reg, u32 val)
+{
+	writel(val, adc->regs + reg);
+}
+
+static void ma35d1_adc_rmw(struct ma35d1_adc *adc, u32 reg, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = ma35d1_adc_read(adc, reg);
+	tmp &= ~mask;
+	tmp |= val;
+	ma35d1_adc_write(adc, reg, tmp);
+}
+
+static void ma35d1_adc_set_diff(struct ma35d1_adc *adc, bool differential)
+{
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_DIFFEN,
+		       differential ? MA35D1_EADC_CTL_DIFFEN : 0);
+}
+
+static void ma35d1_adc_config_sample(struct ma35d1_adc *adc,
+				     unsigned int sample, unsigned int channel)
+{
+	u32 reg = MA35D1_EADC_SCTL(sample);
+
+	ma35d1_adc_rmw(adc, reg,
+		       MA35D1_EADC_SCTL_CHSEL_MASK |
+		       MA35D1_EADC_SCTL_TRGSEL_MASK,
+		       FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK, channel) |
+		       MA35D1_EADC_SCTL_TRGSEL_ADINT0);
+}
+
+static void ma35d1_adc_disable_irq(struct ma35d1_adc *adc)
+{
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0, 0);
+}
+
+static void ma35d1_adc_hw_init(struct ma35d1_adc *adc)
+{
+	ma35d1_adc_disable_irq(adc);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL,
+		       MA35D1_EADC_CTL_ADCEN, MA35D1_EADC_CTL_ADCEN);
+	ma35d1_adc_write(adc, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_INTSRC0,
+		       MA35D1_EADC_INTSRC0_ADINT0,
+		       MA35D1_EADC_INTSRC0_ADINT0);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_REFADJCTL,
+		       MA35D1_EADC_REFADJCTL_EXT_VREF,
+		       MA35D1_EADC_REFADJCTL_EXT_VREF);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_SELSMP0, GENMASK(1, 0), 3);
+}
+
+static void ma35d1_adc_hw_disable(void *data)
+{
+	struct ma35d1_adc *adc = data;
+
+	ma35d1_adc_disable_irq(adc);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN, 0);
+}
+
+static irqreturn_t ma35d1_adc_isr(int irq, void *data)
+{
+	struct iio_dev *indio_dev = data;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	u32 status;
+
+	status = ma35d1_adc_read(adc, MA35D1_EADC_STATUS2);
+	if (!(status & MA35D1_EADC_STATUS2_ADIF0))
+		return IRQ_NONE;
+
+	ma35d1_adc_write(adc, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+
+	if (iio_buffer_enabled(indio_dev)) {
+		ma35d1_adc_disable_irq(adc);
+		iio_trigger_poll(adc->trig);
+	} else {
+		complete(&adc->completion);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int i;
+
+	for (i = 0; i < adc->scan_chancnt; i++)
+		adc->scan.channels[i] =
+			ma35d1_adc_read(adc, MA35D1_EADC_DAT(i)) &
+			MA35D1_EADC_DAT_MASK;
+
+	iio_push_to_buffers_with_timestamp(indio_dev, &adc->scan, pf->timestamp);
+	iio_trigger_notify_done(adc->trig);
+
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
+		       MA35D1_EADC_CTL_ADCIEN0);
+	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_adc_read_conversion(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      int *val)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	long timeout;
+
+	reinit_completion(&adc->completion);
+
+	ma35d1_adc_write(adc, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_SCTL(0),
+		       MA35D1_EADC_SCTL_CHSEL_MASK |
+		       MA35D1_EADC_SCTL_TRGSEL_MASK,
+		       FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK,
+				  chan->channel));
+	ma35d1_adc_set_diff(adc, chan->differential);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
+		       MA35D1_EADC_CTL_ADCIEN0);
+	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);
+
+	timeout = wait_for_completion_interruptible_timeout(&adc->completion,
+							    MA35D1_EADC_TIMEOUT);
+	ma35d1_adc_disable_irq(adc);
+
+	if (timeout < 0)
+		return timeout;
+	if (!timeout)
+		return -ETIMEDOUT;
+
+	*val = ma35d1_adc_read(adc, MA35D1_EADC_DAT(0)) & MA35D1_EADC_DAT_MASK;
+
+	return 0;
+}
+
+static int ma35d1_adc_read_raw(struct iio_dev *indio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
+
+		mutex_lock(&adc->lock);
+		ret = ma35d1_adc_read_conversion(indio_dev, chan, val);
+		mutex_unlock(&adc->lock);
+
+		iio_device_release_direct(indio_dev);
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ma35d1_adc_validate_scan(struct iio_dev *indio_dev,
+				    const unsigned long *scan_mask)
+{
+	const struct iio_chan_spec *chan;
+	bool have_single = false;
+	bool have_diff = false;
+	unsigned int count = 0;
+	unsigned long bit;
+
+	for_each_set_bit(bit, scan_mask, indio_dev->masklength) {
+		chan = &indio_dev->channels[bit];
+
+		if (chan->type == IIO_TIMESTAMP)
+			continue;
+		count++;
+		if (chan->differential)
+			have_diff = true;
+		else
+			have_single = true;
+	}
+
+	if (!count || count > MA35D1_EADC_MAX_SAMPLE_MODULES)
+		return -EINVAL;
+
+	if (have_single && have_diff)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35d1_adc_update_scan_mode(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	const struct iio_chan_spec *chan;
+	unsigned int sample = 0;
+	unsigned long bit;
+	bool differential = false;
+	int ret;
+
+	ret = ma35d1_adc_validate_scan(indio_dev, scan_mask);
+	if (ret)
+		return ret;
+
+	for_each_set_bit(bit, scan_mask, indio_dev->masklength) {
+		chan = &indio_dev->channels[bit];
+		if (chan->type == IIO_TIMESTAMP)
+			continue;
+
+		if (!sample)
+			differential = chan->differential;
+
+		ma35d1_adc_config_sample(adc, sample, chan->channel);
+		sample++;
+	}
+
+	adc->scan_chancnt = sample;
+	adc->scan_differential = differential;
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int i;
+
+	if (!adc->scan_chancnt)
+		return -EINVAL;
+
+	ma35d1_adc_write(adc, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_INTSRC0,
+		       MA35D1_EADC_INTSRC0_ADINT0,
+		       MA35D1_EADC_INTSRC0_ADINT0);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_REFADJCTL,
+		       MA35D1_EADC_REFADJCTL_EXT_VREF,
+		       MA35D1_EADC_REFADJCTL_EXT_VREF);
+	ma35d1_adc_rmw(adc, MA35D1_EADC_SELSMP0, GENMASK(1, 0), 3);
+	ma35d1_adc_set_diff(adc, adc->scan_differential);
+
+	for (i = 0; i < adc->scan_chancnt; i++)
+		ma35d1_adc_rmw(adc, MA35D1_EADC_SCTL(i),
+			       MA35D1_EADC_SCTL_TRGDLY_MASK,
+			       MA35D1_EADC_SCTL_TRGDLY_MASK);
+
+	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
+		       MA35D1_EADC_CTL_ADCIEN0);
+	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int i;
+
+	ma35d1_adc_disable_irq(adc);
+	for (i = 0; i < adc->scan_chancnt; i++)
+		ma35d1_adc_rmw(adc, MA35D1_EADC_SCTL(i),
+			       MA35D1_EADC_SCTL_TRGSEL_MASK, 0);
+
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops ma35d1_adc_buffer_ops = {
+	.postenable = ma35d1_adc_buffer_postenable,
+	.predisable = ma35d1_adc_buffer_predisable,
+};
+
+static const struct iio_info ma35d1_adc_info = {
+	.read_raw = ma35d1_adc_read_raw,
+	.update_scan_mode = ma35d1_adc_update_scan_mode,
+};
+
+static const struct iio_trigger_ops ma35d1_adc_trigger_ops = {
+	.validate_device = iio_trigger_validate_own_device,
+};
+
+static void ma35d1_adc_init_channel(struct ma35d1_adc *adc,
+				    struct iio_chan_spec *chan, u32 vinp,
+				    u32 vinn, int scan_index, bool differential)
+{
+	char *name = adc->chan_name[vinp];
+
+	chan->type = IIO_VOLTAGE;
+	chan->indexed = 1;
+	chan->channel = vinp;
+	chan->address = vinp;
+	chan->scan_index = scan_index;
+	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+	chan->scan_type.sign = 'u';
+	chan->scan_type.realbits = 12;
+	chan->scan_type.storagebits = 16;
+	chan->scan_type.endianness = IIO_CPU;
+
+	if (differential) {
+		chan->differential = 1;
+		chan->channel2 = vinn;
+		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d-in%d", vinp,
+			 vinn);
+	} else {
+		snprintf(name, MA35D1_EADC_CHAN_NAME_LEN, "in%d", vinp);
+	}
+
+	chan->datasheet_name = name;
+}
+
+static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
+				     struct device *dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	DECLARE_BITMAP(used_channels, MA35D1_EADC_MAX_CHANNELS);
+	struct fwnode_handle *child;
+	struct iio_chan_spec *channels;
+	int num_channels;
+	int scan_index = 0;
+	int ret;
+
+	bitmap_zero(used_channels, MA35D1_EADC_MAX_CHANNELS);
+
+	num_channels = device_get_child_node_count(dev);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENODATA,
+				     "no ADC channels configured\n");
+
+	if (num_channels > MA35D1_EADC_MAX_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");
+
+	channels = devm_kcalloc(dev, num_channels + 1, sizeof(*channels),
+				GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	device_for_each_child_node(dev, child) {
+		u32 diff[2];
+		u32 reg;
+		bool differential = false;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, ret,
+					     "missing channel reg property\n");
+		}
+
+		if (reg >= MA35D1_EADC_MAX_CHANNELS) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid ADC channel %u\n", reg);
+		}
+
+		if (test_and_set_bit(reg, used_channels)) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, -EINVAL,
+					     "duplicate ADC channel %u\n", reg);
+		}
+
+		if (fwnode_property_present(child, "diff-channels")) {
+			ret = fwnode_property_read_u32_array(child,
+							     "diff-channels",
+							     diff,
+							     ARRAY_SIZE(diff));
+			if (ret) {
+				fwnode_handle_put(child);
+				return dev_err_probe(dev, ret,
+						     "invalid diff-channels for channel %u\n",
+						     reg);
+			}
+
+			if (diff[0] != reg ||
+			    diff[1] >= MA35D1_EADC_MAX_CHANNELS ||
+			    diff[0] == diff[1]) {
+				fwnode_handle_put(child);
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid differential ADC channel %u-%u\n",
+						     diff[0], diff[1]);
+			}
+
+			if (test_and_set_bit(diff[1], used_channels)) {
+				fwnode_handle_put(child);
+				return dev_err_probe(dev, -EINVAL,
+						     "ADC channel %u already used\n",
+						     diff[1]);
+			}
+
+			differential = true;
+		}
+
+		ma35d1_adc_init_channel(adc, &channels[scan_index], reg,
+					differential ? diff[1] : 0,
+					scan_index, differential);
+		scan_index++;
+	}
+
+	channels[scan_index] = (struct iio_chan_spec)
+		IIO_CHAN_SOFT_TIMESTAMP(scan_index);
+
+	indio_dev->channels = channels;
+	indio_dev->num_channels = scan_index + 1;
+	indio_dev->masklength = indio_dev->num_channels;
+
+	return 0;
+}
+
+static int ma35d1_adc_setup_trigger(struct iio_dev *indio_dev,
+				    struct device *dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	adc->trig = devm_iio_trigger_alloc(dev, "%s-trigger", dev_name(dev));
+	if (!adc->trig)
+		return -ENOMEM;
+
+	adc->trig->ops = &ma35d1_adc_trigger_ops;
+	iio_trigger_set_drvdata(adc->trig, indio_dev);
+
+	ret = devm_iio_trigger_register(dev, adc->trig);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register trigger\n");
+
+	ret = iio_trigger_set_immutable(indio_dev, adc->trig);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set trigger\n");
+
+	return 0;
+}
+
+static int ma35d1_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct ma35d1_adc *adc;
+	int irq;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+	adc = iio_priv(indio_dev);
+	adc->dev = dev;
+	mutex_init(&adc->lock);
+	init_completion(&adc->completion);
+
+	adc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(adc->regs))
+		return dev_err_probe(dev, PTR_ERR(adc->regs),
+				     "failed to map registers\n");
+
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk),
+				     "failed to get and enable ADC clock\n");
+
+	indio_dev->name = "ma35d1-eadc";
+	indio_dev->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_TRIGGERED;
+	indio_dev->info = &ma35d1_adc_info;
+
+	ret = ma35d1_adc_parse_channels(indio_dev, dev);
+	if (ret)
+		return ret;
+
+	ma35d1_adc_hw_init(adc);
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_hw_disable, adc);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_setup_trigger(indio_dev, dev);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, ma35d1_adc_isr, 0, dev_name(dev),
+			       indio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ %d\n", irq);
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      ma35d1_adc_trigger_handler,
+					      &ma35d1_adc_buffer_ops);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to setup triggered buffer\n");
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	ret = devm_iio_device_register(dev, indio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register IIO device\n");
+
+	return 0;
+}
+
+static int ma35d1_adc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+
+	if (iio_buffer_enabled(indio_dev))
+		return -EBUSY;
+
+	ma35d1_adc_hw_disable(adc);
+	clk_disable_unprepare(adc->clk);
+
+	return 0;
+}
+
+static int ma35d1_adc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	ret = clk_prepare_enable(adc->clk);
+	if (ret)
+		return ret;
+
+	ma35d1_adc_hw_init(adc);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_adc_pm_ops,
+				ma35d1_adc_suspend, ma35d1_adc_resume);
+
+static const struct of_device_id ma35d1_adc_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-eadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_adc_of_match);
+
+static struct platform_driver ma35d1_adc_driver = {
+	.probe = ma35d1_adc_probe,
+	.driver = {
+		.name = "ma35d1-eadc",
+		.of_match_table = ma35d1_adc_of_match,
+		.pm = pm_sleep_ptr(&ma35d1_adc_pm_ops),
+	},
+};
+module_platform_driver(ma35d1_adc_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 EADC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


