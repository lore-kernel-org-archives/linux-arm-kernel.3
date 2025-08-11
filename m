Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25A0CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=; b=KHKczvipo3dY7G/pBE/H6WFIbj
	rd9f8OmcoNJC7Tx0GjJRTpO9XJJzlyWOEeEv7AI6cOju5CmRaThH6nzkLNqdSNI/Rk2q9HtgFdQ/o
	5A6COAtAnleTuGEfxpaT5oB26NSENrsnchV2VY5hf4NeHzJLYMmI6K9tpzqOanMjogylEdtdRv+NJ
	SxpzrRsYQ0mwlRevhrr/hgYu6qiNgFg4qgyuxIRpe4ehzhCq2L2CXQmjtYNy/V+YdotQzTbBWfKeA
	6djpEZ2fXjNFMmX+lIiuiUcORqrcwOyg9tyYppPsQd4eclEZSgZVJmbTh3gWKFmM7Hi/3+LVWrEC3
	uCqnOgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWDo-00000008XWz-1BSx;
	Mon, 11 Aug 2025 17:22:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2L-000000087kH-3skd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:02:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so44545565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924528; x=1755529328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=IxfPi3rI3t70SsYctZahqpo0bmXa9jmbUbXP8LOkffTww3Jvpb+MB/Xt2n8YGNFDrl
         VGM0I9Vq8Igl4ZcMAJ697uBvsS4x/Sdbk1wh+eQs9UjLH9Qd+tT5ncdElW8/sqwjDS6C
         w9MEFeHVviLjmtGXOSALP1h4uo9rDhQ/b+6FkOda9dTrlSrex+48kwEN4d9gddNO7c9k
         ICyu0aEbrpgDJbi9EISZCJR6IwuO7TxXCAyDQ72JPXE5A1jJO/7Dv4Iqd1p4Kg049rnB
         rzZ2iNHrnMNBKv26sis8UYQ3isi3huTIwIhlrTSfxjj2fAyL/gxxeh8DL3RPNoFBG6yI
         ppRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924528; x=1755529328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=eN+mGu3M7cxXcasVV6DvY3sLsK5hwQYc49s3meMtbylBIVgAVliRGh08lgb4ZMgqWr
         4gRtXMnc54j8ZW5TPehPGH2wAGNILnKlB0MXaLFnLaSHkizn8MnbfcMdFUSMi1IVBKhk
         /Rr8ZgNNWEpkdSgqpYRRJJP3bFBhbs5elEk/I7qg2XGovD0G0jwhWoaV+nvmgmFbVZ0h
         pfLJimAiPxATIF+O4bS9OLDJ2FGlSzzGTY+zmzTBcgpVmwSNddAQ+jS+RNQZ/coKC44I
         Pv/a3pKtjbjjX1w8LGL7encNIP8Nlt46T6p+hgfP7J3cuqgmfE41HAXuAoI4fPufmq9S
         iHPA==
X-Forwarded-Encrypted: i=1; AJvYcCXoG2dqXmwE4V6myZ+QcJKoQ0+Z1TPHFKJnLS0qHPuulPsdnYggkoVbN1r44NEK+OD4i+/mTt4oZVVqeCQDn5ln@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjy/hcgK+Aw9z5Wjc59grxS5f8fHE2RCczmmio7nCeETVAOamB
	h1SpMelYiWhUeJqwZzUefgNva/hC8k/qD1lyH/8bOl9ArwXrOJc/SXHWj1hnoWDxFr4=
X-Gm-Gg: ASbGncsE+U72TNJWNCKG0y96OX0TCfBa+GlzWOW4UQ6BA5IrfCIVzWOsSPkaha1wCOg
	S50cox2Rc6AhbyQ29Yy7zEcwCkMMn/5QUZpzswWGIckVQMxToQVUL+uN+gZucnSvTS8EC3In4ur
	10bfnm9/QuYWfClFSPyXBy/adHMmraHlXvwMxS29ziEkkNxkffTCs+JteD8zb3KDfjjZ4/BJyRs
	uo7zNCraw35I76GjlT5Qbw1odyrQlbYQM0GxQz6ao28REIChFufmIpsU6yMxp+bBRDxqgdC7tSw
	n2TVc+BfeX6t1VyM0x6MfTvjxxCcigTpvstn8MQb2E5UZ8Jfe4BJ887UL/iB1oflngKUjeR0WiA
	wbozh6Kqg8+664XZ3
X-Google-Smtp-Source: AGHT+IF+THEVCFuwYQu8m6VAawSu2em0TIQUS3g6fESwp8AcQJ26VNGTNiQ2rv1tKPajap4Wv9a2Ng==
X-Received: by 2002:a05:600c:1c2a:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459f4f3dc83mr97971385e9.7.1754924528440;
        Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:00 +0200
Subject: [PATCH 1/5] pinctrl: stm32: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-1-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TAuKojjyD6nAKERqSGd5+r/u4OVzV5ZEvxmxS/gEado=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXshqBLlfnYFEFYK7uY0jFJFrmHe39l05Pcs
 k4vccla8yeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7AAKCRARpy6gFHHX
 cg7AD/9pgOoPP+pShNjLjROnRjG6ynKjPXowGdW0ABn5sAkUvwA1fgSz4BPTxcdOu2W+Mj2vZHY
 XAcoX6QuhsYKer2Ij7zEVCFDSd2+udUclQR6z/1sd9VJkcvIU/Cxmh6o9S7S0eDGNlXT12iVKcH
 M/EkMJ1nvsruX4Gt7mIphpAl++6vvrv1+745OgmVHhYKFicEpzEly2P+jLkiVq0tISzg986/vRM
 xFCBolAsRNun3fiE99GiiaYkwrse9aR+2q5bpAwjohDzgbwv7ePgGXUzf3KRK6d9zHvxvqa7e12
 mO1pIUTCB+/Omb/OzwjvQUMJO/mPYXkjGI1HfCz1gUZvJgCVyU64A4HjqjN0eneS0mZCRO2jbpO
 /Rhq++1FNkVt7HV086RTI0wGxd2K39LvS3fGyOnmmCc4LIpwL2edcBYSL+hEpZHA6JnTJLGGiMN
 atUmuiciLUCWrgWjBsmur3+KrCq38mMzE2A4bifdCDU78T41+OZ6jq+hvXNGpfE+TG2htol6EjV
 0U2MhDMYKV0jSaBCcphL9S+4OBxXL5+APecu01nQ+aNi7mmSNo7JzdDRQGVXvXCd0pq25kpcZiN
 mVTFPFtmbX3ShdoJ3x9oS/g9h9rgCONYNuSoHzUQZdGFjsaxJE0IFwgrNrOHSNgUIG7b27lX5wn
 kWen1t/i4XapRRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080209_983892_0905BC70 
X-CRM114-Status: GOOD (  15.03  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566bb21f7691fa14fcf684957eb6549b..dea49b9aabf2aebbaaa3cb33c8add9926972ed9f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -45,7 +46,7 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
 	const char * const *func_name;
@@ -603,6 +604,7 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
 	u8 version;
@@ -635,21 +637,25 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
 
-	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
-	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
-	hdp->gpio_chip.can_sleep     = true;
-	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+	hdp->gpio_chip.gc.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.gc.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.gc.can_sleep     = true;
+	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	err = bgpio_init(&hdp->gpio_chip, dev, 4,
-			 hdp->base + HDP_GPOVAL,
-			 hdp->base + HDP_GPOSET,
-			 hdp->base + HDP_GPOCLR,
-			 NULL, NULL, BGPIOF_NO_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = hdp->base + HDP_GPOVAL,
+		.set = hdp->base + HDP_GPOSET,
+		.clr = hdp->base + HDP_GPOCLR,
+		.flags = BGPIOF_NO_INPUT,
+	};
+
+	err = gpio_generic_chip_init(&hdp->gpio_chip, &config);
 	if (err)
-		return dev_err_probe(dev, err, "Failed to init bgpio\n");
+		return dev_err_probe(dev, err, "Failed to init the generic GPIO chip\n");
 
-
-	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip.gc, hdp);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
 

-- 
2.48.1


