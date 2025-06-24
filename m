Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD03C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViGLyGNizy0QYTUZPxOkCsquGI3jEpcpF5BqlIQ29KU=; b=ObdaEMc3xQsNbE7LuZ2L/WzHy4
	slnUl0CdJUHaq1hZezVXmYxLqY4IUAEtvcsSDOd7iDSy2nzAdziPph7/EgNivNwEI3iICxb4GbkBO
	ylbFKYsAC4GVuizfCpKZMXmIdUz0sxkitZM73pvILmSOMgqxN2/QGou0VqI7DWAGwckJm7/ZRCY/I
	vlgz2jHBSQE+21EaJ7GlZ7+aTF+fV7Q8HwIjsv7fOB+QalNCfqlkywRA2GtBGyri+cahN21qBQT+7
	XLZFMUvFqJQlOTg64D6oA14emsMU6MTmwDkeCKC7TzuNCZC3AjCbXqFg9nuCfpGUiil591Ls5xvsK
	3tDzK7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU41v-00000005mEB-1u1F;
	Tue, 24 Jun 2025 13:49:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gf-00000005i6X-2ei5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48824655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771664; x=1751376464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViGLyGNizy0QYTUZPxOkCsquGI3jEpcpF5BqlIQ29KU=;
        b=QPb+KaSm/6CwDWogmNqhp8F7HLdRlW8dgZqkjOcrnsMp1vsEYVqsY0l5SBq7Qu3b5t
         yzYmAloYHjCQ0WYLo4CQjNo7yIWWnNkKREfIZJ3rATVGLomrPTePYvq47T0A3eODs/h2
         qaXXpsMMg6c2GReMk9LGePBPgDCVSlaIeq5/9sAycvsOVPeq/05VDf3h8n3ZrzdLNeyg
         YR+SwwhhsR/btJdzLxAG/WYeVxydt90enPIPAxvDqSflkxpd10n1ikmf4p53H9WiJbFW
         SDS/TlE8b3Fb87kXWgNW9RY7ewG3+XvGY3xjxKu1IUFIbgwVCkjxNADKDFPuWW4diU3w
         CMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771664; x=1751376464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViGLyGNizy0QYTUZPxOkCsquGI3jEpcpF5BqlIQ29KU=;
        b=FpBM3BAQpzmsOxGt6x2/JyMaLlcc+KQtAH8ilWQF1nQEVA9vzmiOM9z7Ahq1al7ZFR
         Rxt1lFJO+2CMya2rB7+0HS7+kb5D/Iza6xQQsfnzlPeZbJZ3IQlf2/dMwMVRsBUNTRpW
         JuSM84asBcbsZxy6ipSOTerjMGQ0rBFQoXUJuQbTW/kDvN23CRFh62IyJmoM63h9tDIf
         713IWyNgSoWz3dj7xvg0BSnhUGjhGo+NFOOTanISJIqQ9Mu5due6rE1w/PUfHfwBv4fG
         8W5M6wsKjGc46BE5M4pynauLAR58TJchr+pWI4YMbzcNSXWy/AFnb2S4jg2Eu4D4iIus
         ZPjg==
X-Forwarded-Encrypted: i=1; AJvYcCWIb9F7Pfs640cCw6eAIy9UYz01wzJhiXLPIKvMtNkhF0RSKiJDmRxdY6U1q6BpO5OTKMZf55yseh41JMxgXFtU@lists.infradead.org
X-Gm-Message-State: AOJu0YxwXMHc0LBp2+yX6jFkLkSEPcky8qfZSAKvwa3Qj0qgE7b0UrMg
	ArAbs9MQQcUeX+MBC0cZSGQQk+6C44XK0rT5x5PSP2HK7qZimqyrbgKdqerCcSpv70o=
X-Gm-Gg: ASbGncuL22o6fVMdTpUg8sIYI+siQAj+9ewXhqusUi9t6oI6tiHP6mG+E1MwxATj1y9
	Jw9rTk+e4WKQGZWnWoeiB8+Qo2nMgl46OLOysPn6lE9N30/xDQ/IsivhiOIEs7v10O7XGDjGzkV
	bzPTdSXPW6/bMfJ2Hx2H3FzRI/m/MwltVdQtJ8MEpo0i+FOf3hE+syyVmu0yo6cyvdCN/p/TuSp
	A/cRvX1MhR6coUdF4JMWm95fr5ZioPACXilHlV14NjCEeCxXh0q1h6uVs9L0sCTzOEXdXKWOZ/w
	48cXOV3Xeg/Mcq6KCXK3XJR1f8lWlgrKU2xZIManMH34Zq3x2bwhBnE=
X-Google-Smtp-Source: AGHT+IFwjNIBSxB9Djyxg2017jgPe5XpKG4RaoQZrleIYKZHPAg5xyhP5XJ1Bsc4wsjkuIZtWkx4jQ==
X-Received: by 2002:a05:600c:468e:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-453653c7fa9mr168724465e9.0.1750771664123;
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:33 +0200
Subject: [PATCH 1/8] gpio: generic: add new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-1-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5912;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2Uvp/eEX5AyqzsuezJXXZ3qeRTnZz6y52I85deQ4hAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfLSTWdicAH2z0FU6X8jtwrvLIVkLujkFEax
 HAoM2ed9rGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnywAKCRARpy6gFHHX
 comsD/4lv3zDlkdjytyax7HaFblg0ADAsFlGDJo7wfFtQ62gWvl2FsoaHfUixcQPK2Av9g1jWbK
 CqNDXGKfbbNCNk5C1oxsj9jzsuqTIq2om2ot/JSH8YMf4bXljUnhrFD3DsY87AKnOsz/+prDt+m
 FT9w8FCypP0H2S0PvTnzAYtCThw7H/SyWBcf8Jst3Qhyi6XAb6xGGMyuznevtPKD1HOMSNLm0gK
 KhLZMcDFm3LPNZg6BIFa7OsE7zuqtSjQdrTAaumRNfjphmRgZT8lYJcfvAHAq7M70pecFNzUA49
 RCII9hn28meXXt2f1VPaua7Ze8z+NbzBw2kySmsWqu3beUbSh5I4GrtdOseZ1lb7plJgVo3zIxG
 aU+FWKN3DfVTE6aGD+LQUYs2MYvU/3fhOw7t9KR727eA5CqLo3EuUAeljDrhFhZpU1kPDq1U+Ti
 C1RqhgOQ4d0KY5d/7w+5IlDqMaugQM/pgjuos28/TNEGtHyzZhF7cKC0MZodyjCyPiUYCbdMs6l
 GZ/BZW4ikpSnvtC07UyOyo79eM9PEgimXIAlaMnmY7cadC+YroPAIhXnUFljr/0j2KeCsY+lynM
 0u5i7VknNFbDxIMxKvNjT1t2zaoJ7HDtvZCi0nFgUoCSMzRWo0/zkoctMEWWbppHVR4HW9NDyE3
 wxGKbw2Si8fB1iw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062745_704872_AE055805 
X-CRM114-Status: GOOD (  23.86  )
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

As the first step in removing the fields specific to the gpio-mmio
module from struct gpio_chip, we introduce a new set of generic GPIO
chip interfaces that are meant to replace the existing bgpio_ ones.

The new initialization function - gpio_generic_chip_init() - takes a
configuration structure as argument instead of 9 separate parameters.
This will allow easy extension if needed in the future. We hide the
locking details behind a set of helpers in order to be able to move the
raw spinlock out of struct gpio_chip without the users noticing.

For now, the new APIs just wrap the existing ones. Once all users have
been converted to the new interfaces, we'll pull them into gpio-mmio and
implement them in a backward-compatible way while also moving all fields
specific to the generic GPIO chip into struct gpio_generic_chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 120 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
new file mode 100644
index 0000000000000000000000000000000000000000..b511acd58ab0099b727bf929b7a4e9f9836cd5bc
--- /dev/null
+++ b/include/linux/gpio/generic.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_GPIO_GENERIC_H
+#define __LINUX_GPIO_GENERIC_H
+
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+
+struct device;
+
+/**
+ * struct gpio_generic_chip_config - Generic GPIO chip configuration data
+ * @dev: Parent device of the new GPIO chip (compulsory).
+ * @sz: Size (width) of the MMIO registers in bytes, typically 1, 2 or 4.
+ * @dat: MMIO address for the register to READ the value of the GPIO lines, it
+ *       is expected that a 1 in the corresponding bit in this register means
+ *       the line is asserted.
+ * @set: MMIO address for the register to SET the value of the GPIO lines, it
+ *       is expected that we write the line with 1 in this register to drive
+ *       the GPIO line high.
+ * @clr: MMIO address for the register to CLEAR the value of the GPIO lines,
+ *       it is expected that we write the line with 1 in this register to
+ *       drive the GPIO line low. It is allowed to leave this address as NULL,
+ *       in that case the SET register will be assumed to also clear the GPIO
+ *       lines, by actively writing the line with 0.
+ * @dirout: MMIO address for the register to set the line as OUTPUT. It is
+ *          assumed that setting a line to 1 in this register will turn that
+ *          line into an output line. Conversely, setting the line to 0 will
+ *          turn that line into an input.
+ * @dirin: MMIO address for the register to set this line as INPUT. It is
+ *         assumed that setting a line to 1 in this register will turn that
+ *         line into an input line. Conversely, setting the line to 0 will
+ *         turn that line into an output.
+ * @flags: Different flags that will affect the behaviour of the device, such
+ *         as endianness etc.
+ */
+struct gpio_generic_chip_config {
+	struct device *dev;
+	unsigned long sz;
+	void __iomem *dat;
+	void __iomem *set;
+	void __iomem *clr;
+	void __iomem *dirout;
+	void __iomem *dirin;
+	unsigned long flags;
+};
+
+/**
+ * struct gpio_generic_chip - Generic GPIO chip implementation.
+ * @gc: The underlying struct gpio_chip object, implementing low-level GPIO
+ *      chip routines.
+ */
+struct gpio_generic_chip {
+	struct gpio_chip gc;
+};
+
+/**
+ * gpio_generic_chip_init() - Initialize a generic GPIO chip.
+ * @chip: Generic GPIO chip to set up.
+ * @cfg: Generic GPIO chip configuration.
+ *
+ * Returns 0 on success, negative error number on failure.
+ */
+static inline int
+gpio_generic_chip_init(struct gpio_generic_chip *chip,
+		       const struct gpio_generic_chip_config *cfg)
+{
+	return bgpio_init(&chip->gc, cfg->dev, cfg->sz, cfg->dat, cfg->set,
+			  cfg->clr, cfg->dirout, cfg->dirin, cfg->flags);
+}
+
+/**
+ * gpio_generic_chip_set() - Set the GPIO line value of the generic GPIO chip.
+ * @chip: Generic GPIO chip to use.
+ * @offset: Hardware offset of the line to set.
+ * @value: New GPIO line value.
+ *
+ * Some modules using the generic GPIO chip, need to set line values in their
+ * direction setters but they don't have access to the gpio-mmio symbols so
+ * they use the function pointer in struct gpio_chip directly. This is not
+ * optimal and can lead to crashes at run-time in some instances. This wrapper
+ * provides a safe interface for users.
+ *
+ * Returns: 0 on success, negative error number of failure.
+ */
+static inline int
+gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
+		      int value)
+{
+	if (WARN_ON(!chip->gc.set_rv))
+		return -EOPNOTSUPP;
+
+	return chip->gc.set_rv(&chip->gc, offset, value);
+}
+
+#define gpio_generic_chip_lock(gen_gc) \
+	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
+
+#define gpio_generic_chip_unlock(gen_gc) \
+	raw_spin_unlock(&(gen_gc)->gc.bgpio_lock)
+
+#define gpio_generic_chip_lock_irqsave(gen_gc, flags) \
+	raw_spin_lock_irqsave(&(gen_gc)->gc.bgpio_lock, flags)
+
+#define gpio_generic_chip_unlock_irqrestore(gen_gc, flags) \
+	raw_spin_unlock_irqrestore(&(gen_gc)->gc.bgpio_lock, flags)
+
+DEFINE_LOCK_GUARD_1(gpio_generic_lock,
+		    struct gpio_generic_chip,
+		    gpio_generic_chip_lock(_T->lock),
+		    gpio_generic_chip_unlock(_T->lock))
+
+DEFINE_LOCK_GUARD_1(gpio_generic_lock_irqsave,
+		    struct gpio_generic_chip,
+		    gpio_generic_chip_lock_irqsave(_T->lock, _T->flags),
+		    gpio_generic_chip_unlock_irqrestore(_T->lock, _T->flags),
+		    unsigned long flags)
+
+#endif /* __LINUX_GPIO_GENERIC_H */

-- 
2.48.1


