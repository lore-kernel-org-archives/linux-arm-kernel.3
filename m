Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5155EC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=; b=aggp5wsFmCLZ6qZfJOv2r/REhf
	TZyae2RQdM5WwwqWP+OLI4q2ytpETiB+40kpy9CxEM95P7kUIatGWjmNF/VioTk+B+Tm0K9WD3EZh
	qCnzS7/qJOey27LJxy8o1iizhCu/XrEMuPrxITWOC8DiL5YwVkHxva0dphgokGAvU7vkrHDq8jb7l
	mf5e4ACqk4McaYqUVgqi9YY+4Lbbw5/nPtihY0Iutf9W4ktu+s/A0tLw77fggShwfi3OEBSq2G8Pb
	zcBgWxCjs32Yyoq4+sq2Fhn3iTMhCUdM/2O2aY9me3aMt0ee5NvvoSXIzA6w29GVsoGk+QiWVdeRd
	m5741YvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAH-00000005ZMM-0Cjl;
	Tue, 15 Sep 2026 08:05:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAB-00000005ZKE-43Wc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=; b=EgDx/+GzYPWYHLGF3CBH6H3uAM
	Nc0hyFNRwWAq7sAz6Y4wrYFKZwbG+6lNgGnV5G24lL6OU7bqstSdKHcrV0CbhKLhtvLOoDkA7y+rM
	b4LTwabcloZJGzi41KB8udrDVyQJOs9RWC39ttoL5VLysRnOwk3qTRHrVDMq11pl8SRjLxE0mfKSs
	RxzXFJ65x3hlP6Yt6kVs1xeLYle8Oa6I9EwhgE+fJP68jYxfcxcDUhF0N/qDdMduDy+EIN9En/qp9
	4UUrNSOs7w/aiRCJDdh/nZs3YLy7xMuSzOZBwnFnFUJkcBW81PEDBHE452IrlAfxHh0LeIbRWi+sH
	kOmFIySg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OA8-00000006PQh-1fjL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:05:10 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso23113325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459507; x=1790064307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=roHAN1d0sJdv6odgmXR7HltF4LGdKR44OTboQFW+fcD/3GDZa7GRoEmVi0QHR1/hJL
         Q4CPjjP8ODsQOK8nkpB2PaRyfw9ioOCiQx6OrKCHqfG5eOJO4iVnKgxdi1fC0+mq43Au
         afhgTkVWgzeLozk+15tbpXk4Cyio7P4Gx3w4wira4kmPnej9fv765P6EG31j1tkqtTee
         /ReMYPGSIEhRl05m5UIZFD40xAE9wV+BpwkqlB+/lQujEPhJiztZ3Of7U+Gqu82RBpZv
         9hvcGszjUw9l80SCTf/5n5opGfga4MmPvAUtT1s2oEhzeZNwil5bCYtLO3gqOaoBgLRl
         XrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459507; x=1790064307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=CGdrXp8NfjzhPqdNdMFEynOBYBGvaPe9xOgf6sMYTegXBPkNYzBIX86A7+KDO9fosF
         lZjvjv5hFJ/DIG7WAo9yG5smPDJNNaxUBm5u69qPlfGFvf1/WLv4MGA/lcQkWI5J/hpK
         lf0OeOQ3k/4aPD8Ytv4n69vm4EbgvKTGpnZStSU270U//yQYBZNJFx0F0AjlUcM0JfFU
         61H1Bkxhr5YO0zRO4eFE4iTLWtyD7/KgXXrTMG77pUuskRXi3S4CNRPuY0NtEo6N9qSZ
         9nJ7EqtM1Dnj9qtdYtSJR5q9qVgmQBIytjnm7Qlwiwd/sVq456lJt9ICpsS/2Y5BnTcU
         c6zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqJgtWk/P974uPW0kZsNHmzOsFog+8fVehrblYZaA058fDuN5CnZyvU5ltIH8ZXzoUPvbJwjh5dqkJr7On4G1H@lists.infradead.org
X-Gm-Message-State: AFuF++kA9Wy8wSOlp9JxDTqOYMBzNwswJT8P8uqr2oE6PCMF6Zqu8LB+
	dYwtUQjeIucTo0ReVcvHOyDIMR00IUjQWc1RemBc7XOtgPw6A2lFhWxO
X-Gm-Gg: AYBFou15pwWa+9mKMzdZr7MpfgXN8BMxE1v2WI3SgB8GXVO2ZkSuef2XROHV0xfWW94
	EtsXzo6h/Rl92eczWlBY/yyhati3lj6m08jG2bqGVNl0U6EvowXDfEzXnnW0kgo0numNja++syw
	ElI6nHZS9arQE3Um6EMTCMwGiclSlBqSiGP578DJckHDR4otFnZZ9yBtEhfV35q2Z1wDG/phkwh
	nQnaPdgiQrJBPbOhvJ2qaw6gF7PzeWLyOwNRgI9tbtVSWYK1RogbXYU/FAd0Ma6mJj2jOKwEo8L
	h0+gazThw0WpkA3Z3SZC1UplpUbUdBIW34zwB2c9k7xmU6LgUG7eUrocjaDj8eTIId6FbmibD/j
	kVIx36HNOztdLWJwEM+T5b9Lx9mj9JRKxPVaG+WbRLhdI0Vg6E5cdA2A8ommg8ZoFZyYdy+WGEG
	mSp1Mx/DCtKPAXoawf4Aa/d+tgAxiYrCG/CtRUE5hiU8pRz1rmzVPkd8fcSYUxmAXT73U1cIUU9
	mQJ
X-Received: by 2002:a05:600c:860b:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49e7a6489bemr67096545e9.10.1789459507015;
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Tue, 15 Sep 2026 10:05:00 +0200
Message-ID: <20260915080501.329424-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090508_792446_9345AE5F 
X-CRM114-Status: GOOD (  17.94  )
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
implementation, the mirror of gpiochip_generic_config(): a chip without
pin ranges, or a kernel without pinctrl, gets -ENOTSUPP.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 37 insertions(+)

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
index ef8ccaf17c9c..0586fc1f9564 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,27 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
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
+#endif
+
+	return pinctrl_gpio_get_config(gc, offset, config);
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
2.55.0


