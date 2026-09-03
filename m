Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD28C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=; b=JhySXKjE4tV3f7sFe2kaedzHkg
	pwz5bVd2drjTO2CWRdnYCb3L4oVFZwv5KFwVY+KreIya9fZ99I6C1A89/bQ5l2LACew92CB42tKmH
	qBXffkQ5LwxeZgC9C0CnPDgtz1YaXjy+S2YOZCPtIxSre68DPmmAsfEpLwQkYj6BnEdzToliK8cwu
	kqTkPKVTNmc9P8F8ePNtvjjBDQ7OfAXmPiW1lnOtyRDoWBQuB9wK0Q9wpPXNzQA9/wtCZqMb9T7RS
	/BuoMPcC7Mqo8YB5AqWjYAoLpCZvRFECYSd+jmdNLvI/GkUoJ+8xkcMnO03wxdc+J6zAPJCjHn4Yy
	KA142Gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MR-0000000Gid0-2lQz;
	Thu, 03 Sep 2026 07:59:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MO-0000000GiZX-2oO9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=; b=jZ+M08DSy9F7utyCJq2mNMi9Sz
	tkDkdHoynaVaJMg5iIHh/f2/R+kFFY0t34NGaDFn/EHA6fKweMIgZiTt6QMV/pG9PT+9HDtPmSOFG
	4dMtzFObPOCAchDLdyU4PfLL62W27g0RQ83JolvUvzqOC8YI6YJ256mtg2/LPAiSLctTp2Q1d9oVq
	Fda2FeURtOdEXImtxMj1T31QASoY7C1YsDc55B7GeWJTEijoY8C7+VBbQXoipwlyJ9Quyuw5/QIzW
	8n/8UIMYCVTJbA7BNt0bKuOonWs71NzyP7vgZoSCgkhKgxDgGFvlmhi8dMmIS5rXsz00mzlrV9IL/
	RmWXZBsg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22ML-0000000CpUP-3tPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso14838305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422384; x=1789027184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=ja37MEFysK5WvbSl0LAEmKUtlzpVYRaGbQ16WofCXixD9k8l528IGqmh255+uz3CQD
         0bNhRvIQuntOCkiALV2r/ubLK8U5JO0R9KKXsYiqL3+cffVEYoI2b/lSq6bmraIB9B43
         ZgqP0D9G2tzTZ6m8eky04sw1SGkZaoJAmIZ/s9F2QigKtnewUSpsfFBQN6QqA3b+R10y
         /MnB3MI3YC7bPZeFGCu2NyflmrWtMVFyagQJBP3IAiffSlWiH7X+2hZ22FsOKEJi4pA0
         f0uSmrP3ioqjMPOYIcpvPZV1nzaYfpRNq3Tq0Z0FLeg+OPqzmvsSIIyD8wru6Fhz2e6r
         yQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422384; x=1789027184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=jU33PaCW4lH2UwD+aALi0hwATveIpI+UHMs9yj7cekjXC7ac2HoFDcHJXfeAExlbXJ
         vATDQVYBVaxwu3Kdj+oCoQnEDetTg4AR+D1QwOxmUSjFzWZWYwjZ1PflNUK0xnLarHaD
         MlaOutEC+gpyZU+ebt+NOB5Xxi+76m8nQ8JD8d4Jz546HP4VgwOzkhHjefS0ItxuX8hI
         U9Y5zJ8GpgBqfCd0jOXCPTolPRzambQvo4h4OCKaK+CS2MlUq6d1lqMwhv5VitwdPL2L
         AIusZTqLzG0cOKsiDoznWxGgbeBYEh8KlY+Z6UW9RXSC5Dp7kV4H4eE5ZxpBqcV8YQH6
         bOsw==
X-Forwarded-Encrypted: i=1; AKwUvBwMHSceIo1Sm7llaKqHQngH8Fs4PKFpXD6w97ypwkx+92JRabhl+EjSja/c4cjSUfI1FPv5AHr8CjdN0vlM0wAY@lists.infradead.org
X-Gm-Message-State: AFuF++neVcc9tTKhtJSl6ZyTLKJQ0lucsYrqC60uFWHwsZv57eNBRqIB
	kTgHXiX6ARc5HCFNvLjeAp3iTU9PkvSixI+iZnea511xRBZlx2OiaJWXnlyA3FuB
X-Gm-Gg: AYBFou3GETm1iGBvdsgt5KkcTO9aRp1q/QA3r/uDSlkT4tgQ/hB5qjQ8FqBScu9RxQR
	1EpGV+TSaoftyLF7jIb89Geexjbk0pYD1itSdFJfkZ1QZQTDZ7kPgY7mLwMDJ497BYVc8nvxYlR
	KUglNLjqqM3COV4OLKlIWbSyFyb65+zTKwdoJN3tU0W8zKRuGfE9KM177RXruXYP9PahPVVYvw6
	2MDly7tDiZGyGipednvHKZ2XPD2UOghDay8nQiIPG59tlrdb201Rj/pospDSuCToYk3LRG8qrWS
	RL/0h7Kr5+kYSVnzx5n0j1JDZ068APRPW+unzqCRssv6+VtvGjVUiYAM1Tw/Tlbnw0JmW/UeAPB
	Mvl3GytCKNdq6IlvSyEEvIOqtvYJP+P70iSMBuockraqO3yS5RbxDK134ovRbXVHyp4vFT5Qpnp
	e/ndEp0pslWBXEMueD+6NgPVnM+XEYclVc0icJan9xz8AkfPN6x4EJNN0QakjuR0LxlQ==
X-Received: by 2002:a05:600c:1c27:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49ce57fd7bamr166027785e9.8.1788422384199;
        Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:43 -0700 (PDT)
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
Subject: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:39 +0200
Message-ID: <20260903075940.2089367-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085946_143463_95CC9E61 
X-CRM114-Status: GOOD (  17.55  )
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
query and returning its bare argument the way pinctrl_gpio_get_config()
does, and gpiochip_generic_get_config() as the pin control backed
implementation, the mirror of gpiochip_generic_config(). Without
CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
so the helper answers -ENOTSUPP there instead.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 39 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a4f160b95089..3e53374c7e9f 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -134,6 +134,13 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+The optional .get_config() callback reads a configuration back: the packed
+parameter to query goes in, its bare argument comes out, the way
+pinctrl_gpio_get_config() answers. gpiochip_generic_get_config() is its pin
+control backed counterpart. Nothing in gpiolib calls it; it is for the GPIO
+driver's own use, for example to learn the direction of a line when the pin
+controller owns it.
+
 If a pin controller back-end is used, the GPIO controller or hardware
 description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..fb3ef6754a9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+/**
+ * gpiochip_generic_get_config() - read back the configuration of a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to query
+ * @config: the packed parameter to query, replaced by its bare argument
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
index 17511434ed07..4077dc678cae 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -359,6 +359,10 @@ struct gpio_irq_chip {
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf. Must return 0 on success and
  *	a negative error number on failure.
+ * @get_config: optional hook to read back a setting. Takes the packed
+ *	generic pinconf parameter to query and returns its bare argument in
+ *	the same variable, like pinctrl_gpio_get_config(). Must return 0 on
+ *	success and a negative error number on failure.
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


