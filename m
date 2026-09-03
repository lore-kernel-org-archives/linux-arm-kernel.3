Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC54C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJKosOcUvZV9Jc2GAPrsEmXq7Dla2XoN1gJbr374+FE=; b=VR6gjFZoUaL4M8CCERITqL6V2l
	IlRpNiW4fwwFWJ+jaAd8QbuhwnyL6w2TMVlk/Lp7wkKV6QWKElDdB2VuYzr6w1Io+l64Qoje4d8tW
	IWEpbncY56okM0iU07RTLcstCDF04ZyL2kGxM0dqzeJDj3KVtfKcHFzbM9DhWtMtG5s25quCqXiWV
	a6xXn5NbncNArqWNmlRM5dnSECsekvvQlTFmlPxEwyt6tCrrQgbfO+ixhuWgnJfynPgWIyC3Opwta
	sTM3xAHxMuRtNsF9647c9I2sULRrAaGfpzMxo2ivD1a3fNGt4C8lc81TQhj1sTqKl7Ir3VBOSWWcD
	ex12UQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vZ-0000000Ga2Y-2Wu4;
	Thu, 03 Sep 2026 07:32:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vK-0000000GZx3-40MJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:32:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso14135365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420709; x=1789025509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJKosOcUvZV9Jc2GAPrsEmXq7Dla2XoN1gJbr374+FE=;
        b=rhw82Q6h88QulktJGjgRi/HSqYkLONc8vMIBw0FBUsuhD6YZCmHlGkCy4ieql/JOgZ
         dcgDPUab4N+tfEx6n0qNLeAVW7XsFSK+lNupinsb60WAn2XUFrYfz84NKsI9/cXvCcIh
         U59J6xrBWaV0XPc7yI9hHtoX9gbR2gHJPb/6tM1mWsys9yfkNMTpiBgZj1RdMH2oE2HV
         eLVoO08UWuhgW3UGUjrpPcJ3R9b19xjaLx39iGYZ9jbsV1T9CeomCHXZK/VpfJ1mTCpK
         h5OYe0TQrNfCS1sz0qPu8z7mvhYwwoi4zYwWTHWpOb9XRS0yvILBXRdox8qAP5ypm9GZ
         4zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420709; x=1789025509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJKosOcUvZV9Jc2GAPrsEmXq7Dla2XoN1gJbr374+FE=;
        b=BMWFjRygUSoZ2NtLYYyzyXWVRgvnqHo3N15C1fNSDWj5T1V899dc32irSyLmEMOTHy
         IrzDs0hXZJJSQ/ADgLZKfdyEWvJXzxJkNaJvRuvILy4m49SN/zRgdpwRGaDykdu1vAvB
         xxSYzxzqYaxB7QNeAb0DIVIZKMuznZm+k0fa8aZN6H2Mg8XXkmBu2t3uiZRR0oFHQoqr
         AEm/UofMjTzykSC91UsZTVmU2K3zGaCB+YSArE+xVVvJmToo0xsTrJ5aefAZJTki4qk0
         NlDRRy1LzQZvkl02wrymR5lmfo0/nGhz6Iqt7hLs0ilhxoQK58sO1Eorsi6LqakUL2/2
         aW4g==
X-Forwarded-Encrypted: i=1; AKwUvBy19CvZrhS+oAuT9goqigP52DP72uu6HssfciuS/nCH1xRD/uAgN6C7PbQPlbLlIuKqtB9yU51ftNZMkMKLCD2/@lists.infradead.org
X-Gm-Message-State: AFuF++kwvZ5IDj7S2zLGSVV8xJkNwo1xrh+5vRfLHA+su4Y0jzLURs63
	4iGdapYkUPT+6pKBqYml2xFEGkJoPzmIw8JHlY/8lr4LXEp7hD2WLQuk
X-Gm-Gg: AYBFou2gKmqcr8gQz9LN4EwQ7ZtQepmdeqYWEQpAc4HEd7T8cnlCmLpg1W98U4o2TCa
	3bDyPePekLGolG53Rkr3Klv4UFEjrI2X5hMFxgJeqtKyNnXRyygmcf92vzaext1fF4h2VjbOM67
	u+lRHgaDPEtsIEPRCnjuMV+S1+kE7SyiiRnIRqMSLptUHu94x4wovYD5qrkr7+Zx26PzwzOOOAO
	L69Eg2uYB65YRG9pA5mSpyaeUd5+aIafJpE+blg9sRh+0qBgjNxTlefFqQwINmINRoHhOwnZtg+
	rtmFdPGGbbBzT7TM3Ep9AWf2ahJn033tt56M2yHHFO4n30bVo6Q1lfRUiSHwtzEXwJOArbdmeqO
	lRfAEgU1Cw3kFuXvIF6yHcNY1+/AYUvfCUHcH5uv+mdpQMlTkXfjRhnRmxtVGn0lh7wjYQM5GwW
	wyH9sU6dC4q27TphoSvapRKHO6sEdsACZqRjg9An9ygKgXRVXgGo2Epbq8LYcqqxcRzw==
X-Received: by 2002:a05:600c:548b:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49ce5821208mr144915075e9.7.1788420708055;
        Thu, 03 Sep 2026 00:31:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:47 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:31:42 +0200
Message-ID: <20260903073143.2068494-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903073143.2068494-1-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003151_688326_2845CF56 
X-CRM114-Status: GOOD (  18.09  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A chip with a pin control backend sets a line's configuration through
set_config() and gpiochip_generic_config(), but has no way to read one
back. gpio-mmio needs that to learn the direction of a line whose
direction lives in the pin controller.

Add the optional get_config() callback, taking the packed parameter to
query and returning the packed answer the way pinctrl_gpio_get_config()
does, and gpiochip_generic_get_config() as the pin control backed
implementation, the mirror of gpiochip_generic_config(). Without
CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
so the helper answers -ENOTSUPP there instead.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/driver-api/gpio/driver.rst |  6 ++++++
 drivers/gpio/gpiolib.c                   | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a4f160b95089..5be217815c9b 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -134,6 +134,12 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+The optional .get_config() callback reads a configuration back with the same
+packed format: the parameter to query goes in, the packed parameter and
+argument come out. gpiochip_generic_get_config() is its pin control backed
+counterpart. Nothing in gpiolib calls it; it is for the GPIO driver's own use,
+for example to learn the direction of a line when the pin controller owns it.
+
 If a pin controller back-end is used, the GPIO controller or hardware
 description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..44328aed1646 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+/**
+ * gpiochip_generic_get_config() - read back the configuration of a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to query
+ * @config: the packed parameter to query, replaced by the packed answer
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config)
+{
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -ENOTSUPP;
+
+	return pinctrl_gpio_get_config(gc, offset, config);
+#else
+	return -ENOTSUPP;
+#endif
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_get_config);
+
 #ifdef CONFIG_PINCTRL
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed07..5c81cce69173 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -359,6 +359,10 @@ struct gpio_irq_chip {
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf. Must return 0 on success and
  *	a negative error number on failure.
+ * @get_config: optional hook to read back a setting. Uses the same packed
+ *	config format as generic pinconf: the parameter to query goes in, the
+ *	packed parameter and argument come out. Must return 0 on success and a
+ *	negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
@@ -434,6 +438,9 @@ struct gpio_chip {
 	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned int offset,
 					      unsigned long config);
+	int			(*get_config)(struct gpio_chip *gc,
+					      unsigned int offset,
+					      unsigned long *config);
 	int			(*to_irq)(struct gpio_chip *gc,
 						unsigned int offset);
 
@@ -708,6 +715,8 @@ int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config);
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config);
 
 /**
  * struct gpio_pin_range - pin range controlled by a gpio chip
-- 
2.54.0


