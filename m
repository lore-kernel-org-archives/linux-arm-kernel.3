Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60630C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ4953DYX730X6Pl4pCdKBLcok8eGFLQghf6CkEicDE=; b=t4FPmIQFADQrz2Lnta6mIOmYgf
	SEUl7C6OL529BBdphCCZI8LSZeR/z1P7iKHPcqTn4JIz5WqBS8oFc3IK6mZE4w8en4HfpGPfKAhgK
	sJFTosK/R9DNvglf5W5LPoAXT9YoFOFL5Bzo366wwDhPA0hZ59tFeSEVC8ANOavpJOSm4e/jtV7H1
	dDh1zyW7wRmu39VL5uRC5lw2oARY2KrT5in3KHljn9bF4n7s5lglXmP0PBKqrLIvlxYe848pCTSgn
	6MNtpu0E/bz5J2aah/+g8jrjvo9DFRFVvmOEWAgdKYlRINdJg5+XaTlFbGs8M+Cal7VwaJOBtehM5
	H3M3jofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtxb-00000007o94-14CE;
	Wed, 02 Jul 2025 09:40:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfV-00000007kaX-1XR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a54700a463so3987146f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448136; x=1752052936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQ4953DYX730X6Pl4pCdKBLcok8eGFLQghf6CkEicDE=;
        b=FPQRDk2Etid7zylzS4ZZ0jw2i3vNPb7iynItx4ALMYRCFqk+AVBeBdV0mD8XnbA+/N
         OHQL4p4bJOdhtkiwvXAzs/nX+aqfYZE1ij1qvV9kOeM3b4X/0JcWFpeONjvC18zvuxea
         PnMln70AETNwowS6oi4NY6HszpSNPNgzjSadBw06THUlm/bhUiEMozsSbpAMLjWdKqpM
         pTN0NyhRWUep/hSoUxPLCDPLv5BxljjRxfgYrnrA56kYf8m77FZndS2rec7W0XIEH4XW
         aP9XfhM1bnR+ZnVOyqu0M8vIsHSmGqaNWf6GfmDfH/FpjcgV7WVJqQ2+FSvEr/GCA3qm
         7kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448136; x=1752052936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQ4953DYX730X6Pl4pCdKBLcok8eGFLQghf6CkEicDE=;
        b=ivsJsBpbQbxX5WXbIz/L6TtvUumgqNMLob3xsyEc3SqVdMoR7wnHEHmadyIaQu4c9d
         uttMFxio1Wq2utVT30eMgw7/iqmHlzC1XprDegbTR7o8OGI3oby4dRfvbvK5YMfhppyu
         6aGI0X3lvc6VGlFcFD3atV6gbzanAMIIqmTVX6m5OeLa3s5kFjZeHjxB4Yriq9siq6ag
         xP1iRuUclR66fhr6vQP11uU/kVcqr8gaBLyY5UndLVUWamdn+ANgi5AVgAklOG6w8HP4
         q+sdPzPM9Kuacmjg1wYXkjR+zAK6Udz0awD9KuwiYumExnc8XSP+cysE9lGjcCgr0gS3
         KLvg==
X-Forwarded-Encrypted: i=1; AJvYcCUlUE9TEClMSaVKlDO+D1Z6vEUqAII2rpv0l7shDUNQ3ZIiGhR5z4i6FwKRR9ufV4+2z8DgqH9RXS+wfvDf5xgK@lists.infradead.org
X-Gm-Message-State: AOJu0YwpAOgyg/msEQFiCa8CqXfKY2VabZReGo8qG1Ujwbi8Bq7NWsfA
	0Q87YO3qNFHyzwj3UtdMfasrgVBBJOpSvliecuhUZm2kNcA2jtX9Ji5jST6MV0nu/Bc=
X-Gm-Gg: ASbGnctPTXX+wbc+Z5tmRgpYHwrFWHA4nimNiWVlo7g+kUIGZGmVMyAt2/k0eSd2Fyn
	aE45VgrfpOEyEaFRAXbRis7mms7z3kH7epE1oCb/R/f1yCA93rik8qV6YnyQg8b5pwdAyElryxT
	1knPeGWUVrqLm/3WLHOlwIpj7r3eTlWP8SkRQroIlUCbgz2NDKkWPQ4kA37rmhtLL1VcsB7LiGF
	B2iwAy4CagaxxgO769u24cjiGCOJNQB+EvDfg+JGi4YXxRhJpvbYB8JVVv8GBu0YjTUYZI+UcDW
	vJntHzwnR8pOCavTbw8UFX4swz3LN01YFyKM3NuB8uZl678w2bMZtw==
X-Google-Smtp-Source: AGHT+IFy+dbKnRMVyYVM9ja1MDJ2jsqlQp/nEGAueozbl8hzF+fw2nR7L/R/qjacSv5mPDCxKpcWjQ==
X-Received: by 2002:a05:6000:248a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3b1f7ae6ee0mr1649457f8f.14.1751448135688;
        Wed, 02 Jul 2025 02:22:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:08 +0200
Subject: [PATCH v2 1/8] gpio: generic: add new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-1-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5967;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pB2Xuhhwxk5LYCzli8T80nbGaaOUFOOv5AWJwibECv4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEU/2fp9wrpMS14IJmNecxSGbWX4sGcofEa
 IgAdrNk+BiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 cjPgEADBIdI3NwEpid9TDAiABxWhTsVPd5UOMc7dqo1CxnLpB1ra9kx2TuHCGnyaefSiKZAqbOx
 ZYT9begIVywJahkysJ+PDjKI6FLO/TNG1YfDJiQ2mHq6KVfeKAGMZaAQrQzq9ApQcKAO4nPkUht
 w2XSSsz84qOuBO2EGMt/U3z2YS3b7eJMPEK4zgdSFUO+OP+nEttwWrn/t4s7cO40TfhvjYCLLeu
 vfrcWLovH97g55wx7fyJtWTimMHX4WbLSc+xikqtN6JXMJY+4Kk1wfWYeKnpOl0HnekJfEnHUqi
 0AUbPcd1V+hCc71mnIbX6erwQH/FcPKI+XPnU1fLhMoMaAs8wDKf7WT8DXyQrK4+Ov4JcjV6jh1
 25YWIAT2JDTZFlZnUoKDX6mj086XBsUNxaZixzt0OBmBCSJ53+ORQKqDbYqwocOPEhQ0+T0Sert
 gbhX1YkvDimVnt7lOEWw+qjfTGS49ULiBjr/0sLlAWqSRKVDskKD2cqQMqDuQohmBk7v4Pd4mj+
 p22ivAuf2iVnrLoyEr+QiBELgFhPlKRfeRVZ5wtZwompJ6OaMZgqRTUJlh1DWwNTe/oQH7haCPh
 BHYs0xbiubt880Od0nrMgvFPonaX+K+D3YV7g7jnlnjzZNX1o/MMirclzFYGXRCb42NIWd/KY7I
 041ci388PceItXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022217_415577_6C512451 
X-CRM114-Status: GOOD (  25.11  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


