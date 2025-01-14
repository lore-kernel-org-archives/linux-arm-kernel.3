Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5048E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mH6fSABIQjQfrOs63h7SZKqORCSvRUauMFwjb1MJz8=; b=O3jztFsKiJu14Q3y/1VIcN6tmj
	pZC9C4cMt0ZR4YACXAIyCv/s6vpR2dulHe+tzehYkYmW0QjZDZsxvT+l/7cQ8YO8n8napxiErZL58
	yQM7xWDUlJryvZj1/quB8CUoywYx9VD7vwD/IY8tWn6cz5ePgyzQ3HyWrZ7VP+SBQFUxy8DGCY81T
	3rvjob01kaod95s+Jb5haSrrAjMoDQlTVfHVhVa8PtIZifYjD4El7RpaAWnakNmolEUvm3zZzQYQ8
	sRzeCf4fUaeYh5owBlQZoOC5Pauy3eDKOMhUqe3ilG+gl7UmhZnDiUJwR6nxlRaJg5/nUdppyueSW
	I5t5I3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXedx-00000008BKK-05NJ;
	Tue, 14 Jan 2025 10:59:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeaU-00000008Ac5-2N3U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:55:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67bc91f87so82685566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852157; x=1737456957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mH6fSABIQjQfrOs63h7SZKqORCSvRUauMFwjb1MJz8=;
        b=YtJvxRD/ztRVDKX8C6hSd4C3aqyg3DCHPAGyfwmtMVN/0d9ailCfcTsC9GQ50Z286f
         9i88pwWZjsKXTEz/KkRfcv7/x81KmbatQsMqX/wxbLWKN96Otmykn2bbvjIblzEdCxXX
         Ur2e8MyBqbfp4g1+Tmteh2yxR0Xgy1bEWuC3L1RvEniIPG+2+Lx6FJB97gGd5iIGnhmy
         DKNHEjkXuBeWqw2oCtEqXCQpYoaxJ2ZRfdxbS5DIIoYYL+Lo2gTn2QrF97wuGEv52Vqx
         yhsA/Tafk0OZiIQKInlWev1DcWnGVRFrFrkqXYBasfcX7w2aEi6bPjfxpeFZlpe+i27Q
         3B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852157; x=1737456957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mH6fSABIQjQfrOs63h7SZKqORCSvRUauMFwjb1MJz8=;
        b=b3bn9jg9dQ9OWBl7qsvVtpUA7HIdw699wobMNkNY/4BtG989woaT/AUDSX/6DrWuO3
         oEXFh6wTC+gjNVkMvAKznHVxDadWS32fAzylVlISX0CgM872YSzkKoNhF/So+GpgLTHx
         nos9Kk34ygOHaSt2lgPADBqdDy16bhOrF6eofoQprch8NujURWPNBQkigO3Q6FBCvrau
         H1uJRy7pbXmDd9M2wDJVTn6PHFNU0E1PF9jryHHRBiunaYR8PwDj3l+Tx5JkUVeiYthq
         df+LkPkMJQ8aQTssbzgysU/iqhKds9hnl9jc/wnfA1CCODL5UmWK+kKH4SyfKAgA3JIB
         oKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwsv8a4g7t9cLFqHJolM9plgK7hvZju9fqTNQ1YNFi1+iCeb/2NVROadZw3pqq2GdCBb2hrrHzHfXdPO/VZxwg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/PVVCoaEwXAK8pC5i1L+89Z+4gJOTcZhB020rQOXaL0Z3g2kY
	/qp5TJ/mY/o5oqaAF93qm77FO9RcrtQu8hYNA+2o+Zdaf0E4p9hQxyPAWHCThGg=
X-Gm-Gg: ASbGnctwFakyzpRT9+nnSrZx16jRZ1g2PUR9oSkhVn+des7K7qPmGZ1xpqingHTiJNc
	sSWfwO39eBRFDn5c4nag0ffNCAltrjASnGdbfZ++0g15/tG9ZiTvVE8qibTqM8FLjGZFFmVTMUn
	JqJXvSbY9NJtGc5SZZYGtJv499UBiZPXUbx6y/a6KhAtmZ5oxPPfWwn8qsppv3Fwh0JSDqm1Lj/
	k69t3PAjJViJF/zLvB4rTuUmnpMOkNnTK8JE3SUuUPTrPZM8pyKSM06eApvgK8ov+q39l0=
X-Google-Smtp-Source: AGHT+IHbCyEQI2NTIiulDjFObPlITRIekk3IlqsgCYsJ1jdC7IGpxwnbidGWvk7wts9bxMRn/G9I1g==
X-Received: by 2002:a17:907:72c7:b0:a9e:c430:713d with SMTP id a640c23a62f3a-ab2aa3fc05cmr848583766b.0.1736852156861;
        Tue, 14 Jan 2025 02:55:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564848sm608081066b.125.2025.01.14.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:55:53 +0100
Message-ID: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025558_604033_8B2137C0 
X-CRM114-Status: GOOD (  12.49  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 3 ++-
 drivers/gpio/gpio-grgpio.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
-- 
2.43.0


