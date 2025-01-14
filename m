Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQ6kl1euqxUXFmiD96nPxmfZ3b58EO9sP3qhQv0QOX0=; b=Nm9Zx2eA/LWkoPBqKNFp7RV9l0
	KaoUwyas1bbx51M6JbTv/jOO2M2HcDiw1Q6WCaSbry1AaOQCcS3ire+tT8tTLKIDRSOr0zqqqi9st
	v7Q7980PHTJBzmT+X8bGtMznwOKOuOCa4QvyegLA/lrIiuE6zkgd0CRJl2V56QtXZxuengm+Y6+eL
	2urRam/85h8/kfs3f6jIgtEbUFW30iybwm4Vj6X1GjiO+Jo98/ZcCUeAZgFNGFggJGNPvE+6DwQO3
	z5l39BQPmsU8Z2A5d33BU7lhULYiMFfUZ/uynh+r9h950Y2CCyc/hmMeHegq38wAS+E21lrK8M5RP
	47N/P71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnLr-00000009eEa-0woA;
	Tue, 14 Jan 2025 20:17:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmNC-00000009VOs-1lDH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:14:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385db79aafbso487251f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882085; x=1737486885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ6kl1euqxUXFmiD96nPxmfZ3b58EO9sP3qhQv0QOX0=;
        b=u9FUSz+bbP+gS8TksWJ1juwLvJbJwg8bsI7cWMO+dCCfMyEImh1aCfyi4KdHl7SZZk
         ZecsWo9g6wrsWtfSkVVmbXXWksQKPyBWRrGK9FEFwJnzA29sMn+mnl4WwuhAlFknqVar
         Cpu+r+RlLPoCjr2DwsG2DCQwCm1mR5N4B1W+REiKRWm0+BeZpHgRVnpzJlx+RPHLaKKi
         aMOoArXNLj5GzTzX23QtvkFjIob3M448GWU4VlETUMlI+Om98HaEy9VH873Orc0xlSMx
         +PIxQsjhKe3DXvVKlqVHXWBMgpbemenxC9dAfWPYUNDvA0LBUHAG2F+1NwONrbi7CSoT
         Gfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882085; x=1737486885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ6kl1euqxUXFmiD96nPxmfZ3b58EO9sP3qhQv0QOX0=;
        b=gSRmJEP+J0xvTuPJ9hHrY/Q9sTs13i4iCYKEIKL3IsLEKu5p4J/pL8zPBK/on+rFLf
         UKjJzDbwnEjzExtLePakB3EnL0kCrYe/9zlkIqfCweTq/0PVtVXCWQgATbyOD7OYWnYs
         2Na48E0y4+Tdvqr4YJTNBaSn5H3pxrCX1nfx/7EKKVD0jr2QEAO7cjD+VK2tXoepOc/M
         6k0+27G42NgUsBGDhf9d/oEJffDlyWoza8fX2+Mh3+hwi5nFyM+wBKLTviEDDe+wtdqu
         6/uGMcfyVYREcguRKOZQZ7UFW7FvLluusvDvQ4FybbShTtVUvd3RsTTadSBClmcbH2bA
         obqw==
X-Forwarded-Encrypted: i=1; AJvYcCVP1MD1c0jjan8iYTdIVAFpTFnhtkhHXergSudpHixCwvOCf9MI5xt2CDKp0rwZAhcwUoULieGbLJ1MoU6Vfg1b@lists.infradead.org
X-Gm-Message-State: AOJu0Yzati4C3hTCWAZWJ39RiX2KMeVTdmZlUh60AjcYjXrHHihHLS0z
	MKtlsJG30lLfCRgLcEF+vg8SLa+8muCCPLk8srVsZEC4tZ+GPDUPWrEoWcQRbgQ=
X-Gm-Gg: ASbGncvuw2sMCWm4MoJZc295o0wDNXE0+be7t6zhkA22IiOtNBX2hVflcqnZC5f1686
	mg7vzxVtW6Qukj2QfocbqfQwI+2KbZcJC3mrBA7XqsVu6TAmncbArqDPD3mzYpeN5scU/1sHKpL
	smu45TtlZkzU+NWKW1WEx4YzBgMx2fbTkstZ5k3Mib+6wc4JsHCjSip7M9MrqErqIh4GjznHdVA
	P/om8ljsi04spYTAPEJ+Ow2PD0ArfUGh0pmX2LxJR2Jq7t/NfV8qwub6tPXHXxe/zH2B4w=
X-Google-Smtp-Source: AGHT+IH1zV4TdpuGEzXlmDKzlhTZeOglE/e6Vh0NhLYPgPb3r+w0Yshbz4UIzt3sqXZwggicjeJV+A==
X-Received: by 2002:a05:6000:18a3:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38a872d2e1cmr9347396f8f.1.1736882084522;
        Tue, 14 Jan 2025 11:14:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm15415992f8f.80.2025.01.14.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:14:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] gpio: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:14:38 +0100
Message-ID: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_111446_466589_8864D437 
X-CRM114-Status: GOOD (  14.40  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Many more files changed.
---
 drivers/gpio/gpio-brcmstb.c     | 3 ++-
 drivers/gpio/gpio-crystalcove.c | 3 ++-
 drivers/gpio/gpio-grgpio.c      | 3 ++-
 drivers/gpio/gpio-mvebu.c       | 7 ++++---
 drivers/gpio/gpio-nomadik.c     | 3 ++-
 drivers/gpio/gpio-stmpe.c       | 6 +++---
 drivers/gpio/gpio-wcove.c       | 3 ++-
 drivers/gpio/gpio-wm831x.c      | 3 ++-
 drivers/gpio/gpio-xra1403.c     | 3 ++-
 drivers/gpio/gpiolib.c          | 3 ++-
 10 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 491b529d25f8..ca3472977431 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -9,6 +9,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 enum gio_reg_index {
 	GIO_REG_ODEN = 0,
@@ -224,7 +225,7 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 		ret = disable_irq_wake(priv->parent_wake_irq);
 	if (ret)
 		dev_err(&priv->pdev->dev, "failed to %s wake-up interrupt\n",
-				enable ? "enable" : "disable");
+			str_enable_disable(enable));
 	return ret;
 }
 
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 25db014494a4..56effd0f50c7 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #define CRYSTALCOVE_GPIO_NUM	16
@@ -317,7 +318,7 @@ static void crystalcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip
 		offset = gpio % 8;
 		seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s %s\n",
 			   gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
-			   ctli & 0x1 ? "hi" : "lo",
+			   str_hi_lo(ctli & 0x1),
 			   ctli & CTLI_INTCNT_NE ? "fall" : "    ",
 			   ctli & CTLI_INTCNT_PE ? "rise" : "    ",
 			   ctlo,
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 169f33c41c59..30a0522ae735 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GRGPIO_MAX_NGPIO 32
 
@@ -438,7 +439,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	}
 
 	dev_info(dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
-		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
+		 priv->regs, gc->base, gc->ngpio, str_on_off(priv->domain));
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 5ffb332e9849..363bad286c32 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 /*
  * GPIO unit register offsets.
@@ -907,14 +908,14 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 836f1cc760c2..fa19a44943fd 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include <linux/gpio/gpio-nomadik.h>
@@ -430,7 +431,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
 			   gpio,
 			   label ?: "(none)",
-			   data_out ? "hi" : "lo",
+			   str_hi_lo(data_out),
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 75a3633ceddb..2e22e1eb7495 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
@@ -273,8 +274,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 	if (dir) {
 		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
-			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo");
+			   gpio, label ?: "(none)", str_hi_lo(val));
 	} else {
 		u8 edge_det_reg;
 		u8 rise_reg;
@@ -343,7 +343,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %13s %13s %25s %25s",
 			   gpio, label ?: "(none)",
-			   val ? "hi" : "lo",
+			   str_hi_lo(val),
 			   edge_det_values[edge_det],
 			   irqen ? "IRQ-enabled" : "IRQ-disabled",
 			   rise_values[rise],
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 94ca9d03c094..1ec24f6f9300 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 /*
  * Whiskey Cove PMIC has 13 physical GPIO pins divided into 3 banks:
@@ -393,7 +394,7 @@ static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_printf(s, " gpio-%-2d %s %s %s %s ctlo=%2x,%s %s\n",
 			   gpio, ctlo & CTLO_DIR_OUT ? "out" : "in ",
-			   ctli & 0x1 ? "hi" : "lo",
+			   str_hi_lo(ctli & 0x1),
 			   ctli & CTLI_INTCNT_NE ? "fall" : "    ",
 			   ctli & CTLI_INTCNT_PE ? "rise" : "    ",
 			   ctlo,
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index f7d5120ff8f1..61bb83a1e8ae 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/core.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -234,7 +235,7 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		seq_printf(s, " %s %s %s %s%s\n"
 			   "                                  %s%s (0x%4x)\n",
 			   reg & WM831X_GPN_DIR ? "in" : "out",
-			   wm831x_gpio_get(chip, i) ? "high" : "low",
+			   str_high_low(wm831x_gpio_get(chip, i)),
 			   pull,
 			   powerdomain,
 			   reg & WM831X_GPN_POL ? "" : " inverted",
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index dc2710c21c50..842cf875bb92 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/seq_file.h>
 #include <linux/spi/spi.h>
+#include <linux/string_choices.h>
 #include <linux/regmap.h>
 
 /* XRA1403 registers */
@@ -140,7 +141,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
 			   chip->base + i, label,
 			   (gcr & BIT(i)) ? "in" : "out",
-			   (gsr & BIT(i)) ? "hi" : "lo");
+			   str_hi_lo(gsr & BIT(i)));
 	}
 }
 #else
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..be3351583508 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/srcu.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -5007,7 +5008,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 			seq_printf(s, " gpio-%-3u (%-20.20s|%-20.20s) %s %s %s%s\n",
 				   gpio, desc->name ?: "", gpiod_get_label(desc),
 				   is_out ? "out" : "in ",
-				   value >= 0 ? (value ? "hi" : "lo") : "?  ",
+				   value >= 0 ? str_hi_lo(value) : "?  ",
 				   is_irq ? "IRQ " : "",
 				   active_low ? "ACTIVE LOW" : "");
 		} else if (desc->name) {
-- 
2.43.0


