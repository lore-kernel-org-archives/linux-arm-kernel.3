Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3994C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=; b=kEw67k+O3cJ1AbM6ESR55Ui+PJ
	gK8cSElks4KEqrXCUmKdd9nlREfeNFpWCZbp63W5/WGlAv3IlkgJEbOLE5hKvhqeD2cbv5mS2dcqB
	fZk/JjsAKR34MzOJpCtPZonsQ6puLR4wdDqSgUWVeCLD8VT1+A1V21ouOpUSI0TjNrmNawxUTB6b0
	TuoMLhf7PomYNMWM/I/C3U0yeKOA1mg8zO0S0w7WYF+dy/cR2qj/1G/6jFSguW5pZZQb/UMMJASj/
	gZjbfZsT27h3WQkIAGGnxlgD5h5oVhpg9+cfZzdzB6NJCtFsDvKXgg1oWu9J1Pn+DRs3QS/gjspSu
	TfnEy52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO9-0000000Dr49-3AQB;
	Wed, 02 Sep 2026 06:24:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO5-0000000Dr2S-3jke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:23:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso4063645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330236; x=1788935036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=Pm71bs/mIvW9xg+U/sLpxtR+LhhahUqNlAtwt54FuxnV4DmOAJ4rsyaaStXdCAxDwD
         SmypLVwNlt22+fogJZ2BnWUMcxdyY26A42xtFPGF1hHct93OjfPKl5CIxtpc+Sbi740N
         aZrrU+1hivmRpVeBA1KD46oVGlyvgv7gHV7bRsP2JlE5sa6oy47H9d2tYZwlmJMdWopy
         NPSzqstqFbTUjMZuymMrlUBZsUzN8DbLzlQNqr/2zUHnMpi47IN3YJj6sWWzFJvmj6+v
         3WTvMr65No+t34sO5DDZM5qLyKefxUIlHaYH8eaQ3dlwRlMsFtEUtbebkzgmPqLzwgr7
         W2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330236; x=1788935036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHOxVIY41WkMlz245AOFHdi0BnFepDxV94FL1AiaZ/8=;
        b=cztRAHRZAmCmwRWE66H6dgrL8qApgl2cSzIU9W+j+toh0iMVg133RiDufGWvA264+p
         6p+RXEoNlo7C2jhfHbuD8fGxjnIGI3253N8U2d9Fpi8RG1jmzpicsh4RsaxpQo3sBOup
         CzZGhHaPTmulCj2ht8Bt5/TD7yjXCUC/0wVBgDBMe9HhVqQVECK5Pwxn+ok7V4HwARl4
         LhCA9n0cOTjVztKlWUtgpFgdJ6mhO2an3sr95yppv+aLM1StwE9AaXxlFroBdlDmO9+z
         uoEXpNxfstjMqaoD23SywSgLCeUJIfxg0495JOUNlo2cCQTvxSF5p8r1jgq+jfpOo5If
         P5nA==
X-Forwarded-Encrypted: i=1; AHgh+RoT5lLLPsTroF5zUvoMzMCNshkiZv2Rpy3A56knG/DSgUlZZib9CPcnaNci5NLi03uDjSS9cja99FSvTm4OfAyj@lists.infradead.org
X-Gm-Message-State: AFuF++lMLTiMxDgkX4uZPVp9sjJqJxYl+I/E+SFv63ZU50IzXf53GsLv
	Vw5Y+EQgv0gtBaBSK1PAWUxpRPrESrpOD1pZF3PN6cEbD0lMM5+sUMpn
X-Gm-Gg: AR+sD11E+3IBZMt/UUvSH1EMPYaW7PpI0BTASpnu053Pi7aouOT/4N2pXRcAE698UYe
	SdNj1Q15A+9RLHfjEe9Qm/m9W5U08wvUpDN3jZc1daufX6ZOZE3TKhaEgjOrB3gxYDYLW3gfhHL
	s8XTrCAJlp5kc9Z3+vDjm6Eg91mbqax+6dxqdoOY76IP33eoJZ7pLc4ht+6SSU1930aN4WR69s7
	5qnCsYY3xhL1o8pATKS5xq1S7SHPudPFqL+wQawwtO2pL9iqKpa7hD1vEDvXN8g/LMmVceMCZCp
	FZfr/mvsgqH2HIJJTaxNhTnt4e0pA5ldOBFTbfEcSlbE00Oeyi2qXcUudgJL9nSH/ITk/dBNJoU
	pmZOtmEFNYspuGe9InrrEU0xehzdJR9rFzoc8svfSx5373v3KvdNA0oJdfVqXPk9XFZum22PqIc
	BIs/gIa1t/l5hXXXHPIiJCqkLLdyZs01R0cU1OdXSkjXiDBaJx0ApFT5INMX2ME5wn6w==
X-Received: by 2002:a05:600c:1d14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49ce583e94cmr33712895e9.10.1788330236108;
        Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
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
Subject: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:23:52 +0200
Message-ID: <20260902062352.3600368-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_232357_947765_6424C944 
X-CRM114-Status: GOOD (  15.79  )
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

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers already sets the direction through pinctrl, but leaves
gc->get_direction unset, so every gpiod_get_direction() call trips the
WARN in gpiolib and the initial line state is guessed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Install a get_direction callback for that combination which asks the
pinctrl backend for PIN_CONFIG_OUTPUT_ENABLE, the same way
gpio-by-pinctrl does it and mirroring how the direction setters are
forwarded. Pins the pin controller cannot answer for report -ENOTSUPP;
gpiolib ignores that when requesting a line and in the debugfs dump, and
such pins cannot change direction through this chip either, as the
setters fail for them too. The one caller that does not ignore it is
gpiochip_lock_as_irq(), which now refuses such a pin as an interrupt
where it previously had nothing to check against.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..b2aa74a734e4 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -365,6 +366,28 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc, unsigned int gpio,
 		return pinctrl_gpio_direction_input(gc, gpio);
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller
+ * (Vybrid: the OBE bit in the iomuxc pad), so ask pinctrl.
+ */
+static int gpio_mmio_pinctrl_get_dir(struct gpio_chip *gc, unsigned int gpio)
+{
+	unsigned long config;
+	int ret;
+
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -EOPNOTSUPP;
+#endif
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	ret = pinctrl_gpio_get_config(gc, gpio, &config);
+	if (ret)
+		return ret;
+
+	return config ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 {
 	return -EINVAL;
@@ -601,6 +624,10 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (IS_ENABLED(CONFIG_PINCTRL) &&
+		    cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND)
+			gc->get_direction = gpio_mmio_pinctrl_get_dir;
 	}
 
 	return 0;
-- 
2.54.0


