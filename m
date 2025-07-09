Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05695C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LW+Hu/HhbWeKg1EpyA9iilwLRoOXma3zplbfRDKi78c=; b=u3hmG9IhNfUYf4sFmDxedReiIz
	GieT/5i+FxcgzQC0sDeejmX1WCDiXDUvmK+xoHz1vD9H4iRIacFeJO6ZxvGM4QygYl3kMvlxIhaKh
	1nahyk3mC7MQ9A5uAodTvNAnVdMHF739o+0Vlg4ia5eRpSnc5+Y8vGlGzDATlUWNBO+mA4uTH/uWH
	RbyEaaXYs+L+ggdR/aggsPaLdTX1Du5PMIaBC85rS6G5WxOAJlYt41CiumWUpagj2oOfctS/Sfq21
	00gpjlvEX+v5gvUjTUI3qF2t3TNHejXFLJfUyxjCjb3O1OusOooqfyxAhkA2+XTHBZ/2xHPAvDOKz
	cXseQMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOgv-00000007jaf-2pDn;
	Wed, 09 Jul 2025 06:54:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVU-00000007h4S-3ftP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so39187935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043335; x=1752648135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW+Hu/HhbWeKg1EpyA9iilwLRoOXma3zplbfRDKi78c=;
        b=ukI9FYVsgeG+KhI9sRlw8dy1Gmd2VvZgiKUZju78eXNUGO5aufQ9ox7rpEMKSVuH2I
         2rq+i7AoX9sijaGSyHQUWKJNyzK056epZgeyoMnPwSqi3E5yWfLT0ZrMUdrlY580zsHg
         1JeeDl7cY5EF/hg6nQF667pUYvTfqmly+3j185oHstsafeQlnP3344qcY6DB5vnkIe7J
         cxdn2SiC+ypZsOqWemvaY7p80p9MK4gQ0s6UZ/Q9dyqoi80vNrKky7/GsjSa0hnlxoOv
         buhTc8N+D9QzjaTPXjRTk74XFm+lS6nTnsKHdyXzbv3dAGZrtfjkYrkML5GmsY8iEwVD
         Kf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043335; x=1752648135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW+Hu/HhbWeKg1EpyA9iilwLRoOXma3zplbfRDKi78c=;
        b=VgI57c9Q1L9zSoW8AF9jN20KrxXqZfQB7EBF1xdUS9rMme0vH89JUAOQF1ZywikTZw
         zJjvBfoZN/qXHlwf38qEB644j9YjJjCJocLd6Nr3nyX5gDDKq6iqKMVBL2tho/Az7rrq
         wYlp+FSMgkEBoSwPau2odSMKJjWPcCKewTyWiLVCifY1XjYgrvwca5Y030vVRgZKAgpk
         ZsrY9bN0TTUOUsRQfqupF91nDD4nmDoVh52hZi0Z+IR3yhABKgGvTBFZ+/kn5bYhTbN6
         Ps1LzGsciqNvF6ct598YXlhJXXFMLcupaBZclUevB6E/tYAYqlhLd2/p3WsGIO6BvNjG
         G65Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4yi9FxWCO0xzNrJgCA51DsJUaA7Z+CrmVXZCB0EkYoZXYGLYL3Ot1G+2ua9FwNOaHdp3tBZnEAVBfyVJGWJrp@lists.infradead.org
X-Gm-Message-State: AOJu0YxhzAUbKaUOy8zlkfq34YnlXBnnemYu+18Vge+DvNAhQ4xB+W9e
	MJgVYa5m81TTBx3Fnu62WcqAF8vFA4bfjAxCdB+++bs+eodmxP541mEN7K6cT9tAsrc=
X-Gm-Gg: ASbGncv1BJlP6Z1bcgsaFllzDpz2Mdb/3NTrd0OHmP8GBRz0wv6PMTHMtn1bg/byme3
	sJqtHfOJISSIcKtmbsf5jhDvIPJRtuJbGyGYCUmR2NCJo3pTgajaG8XY/X+KdGv4QKEyxO64Nth
	uqD4biFtzxjHFD1akK8+XJzWSFIdtKfZj+hAjv8zjYrXVDoIFr0xPgVOdPdXW/wt3ogj+RjOU+J
	5O1CcavIIFxKu9iYCucJMeagCV8AUfSe3RvkyOghWgEhd37fvBeYq41wkE/0pK3GA7B8R0wsReY
	nrWVokFwttLwLB9Dbm0bXDXCJ9KBx5fxx+Y2JsYbB/WbYpwJbY4HoksM
X-Google-Smtp-Source: AGHT+IHgvh6CXMby82j1vAltxhiFw6v8vQf19rIED6oGm0S9ly39Pzz9ZDURftRRJZ+Ml5YyEH0bKw==
X-Received: by 2002:a05:600c:4f11:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-454d53a0109mr8730535e9.22.1752043335203;
        Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:38 +0200
Subject: [PATCH 01/19] gpio: vx855: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-1-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pSSyuz7QAfCuLFxeilP/Rt+eCdSSPHmUFgFx2q+Dd+s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9AKDS44pltDDmWoU7foyKSkab9u4k7TbIZE
 oIuKFsT3BiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQAAKCRARpy6gFHHX
 cvW2D/9yMYo7llA0ZmH2ampe2HCl2q7tO5e0ggNvThz1AN9/2JKAQTAMOX4gvm8NB2/koZvGSbL
 8gwOKfCihGNzldn8PfRqPI5kSnmR7irDNKzBw0S+9qoyBv4HhsjkhmlK4lV+16nDMrwZOLLG3Ub
 OY5MAfPNPapEZYFn0P4XyG+Nys06YSyLHTT2xT7Gnh6tfDYTjoMtG+GwlbZMIjahRhij/KORNUQ
 UBOd5A40hGi1cRvpnpNiW6FMsa5+aoJqJ7Sy5NdiUO7ANQkE6WUuMS7GVGYdSGni/PBrTln6IBf
 q+w4rCfV+fVu0y0uB+yQAvqU5HHRuWcpWMReBkLw5NpwMp1gOjQb0rJ8mZOiPqNRkcb7OlO14T8
 VraIJBmm+8lYWWM4xIyKpA08z4Q3Ai/Z0U6gUpFJCVvrlgw6HoyBzCH8CqdQuCCcm0oYiBC1f4K
 DPhyB3H72AKHOS19n3RAS003GN2UwebvMaOi1XIWFyobPs/EwRsC9YAlRJM5FIFOFlPXBqBqXsa
 KpSCLlgPiGGLMjaglpMuFTkB1VuVsUtHpfuER4uVEpTI1r/CRkWBVZFFne4KqqErNoHee1JHhEE
 2L9ZAv9rpf9KnK5jh5oBvxKlwyYZyWeHMw0z8iiZvg614LaRwpahQWlMsTmgB7pgdBUFhiuGDy5
 UL7Gqh/dwi53wlQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234217_189308_14864C1B 
X-CRM114-Status: GOOD (  13.35  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-vx855.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 8fd6c3913d6935da37454647cf7500d91c82e0c8..a3bceac7854c0632c2f7891783be41521fd1f53c 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -127,8 +127,7 @@ static int vx855gpio_get(struct gpio_chip *gpio, unsigned int nr)
 	return ret;
 }
 
-static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
-			  int val)
+static int vx855gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct vx855_gpio *vg = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -136,7 +135,7 @@ static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
 
 	/* True GPI cannot be switched to output mode */
 	if (nr < NR_VX855_GPI)
-		return;
+		return -EPERM;
 
 	spin_lock_irqsave(&vg->lock, flags);
 	reg_out = inl(vg->io_gpo);
@@ -153,6 +152,8 @@ static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
 	}
 	outl(reg_out, vg->io_gpo);
 	spin_unlock_irqrestore(&vg->lock, flags);
+
+	return 0;
 }
 
 static int vx855gpio_direction_output(struct gpio_chip *gpio,
@@ -215,7 +216,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->direction_input = vx855gpio_direction_input;
 	c->direction_output = vx855gpio_direction_output;
 	c->get = vx855gpio_get;
-	c->set = vx855gpio_set;
+	c->set_rv = vx855gpio_set;
 	c->set_config = vx855gpio_set_config;
 	c->dbg_show = NULL;
 	c->base = 0;

-- 
2.48.1


