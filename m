Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C6ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdMjE/IUNg9nUBZWSwSrF0HUJBl5tL7A+dP3nDcIACE=; b=aV9vrlj/Ehg82zjwlcoSkNVGiC
	8VIbjhD9PrfmOdH6Emu59blj0CYodqfdmMXh1NeJL+ytawalLbpJiFjd2R4jWk7vmvUdPdsrJZBc6
	U9xrs3JkMp4Ll5rtf3641LKdu2RfK++RGlVsNIgr7kIcelO9BD+gAipx2VTxFbOi3xY0TeW3KOBMq
	XCPRcthFSlEwJ0nH1mDt/l3lwxC7+6IsUEX0spCbnPEuQh4RB7v3nsoUF8FVGDDAS9zf9KGfQ5s1q
	U++bADW2smWXe9wFJ4HStXNQNtTBqGjC3jezwP+uYOlwdVRmt7f7ZzCDqURQYhi6wEoNHULybqUgn
	r5dVObIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqOX-0000000BVtl-1RTD;
	Tue, 26 Aug 2025 09:55:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5I-0000000BR2T-4BwE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso31262135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200919; x=1756805719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdMjE/IUNg9nUBZWSwSrF0HUJBl5tL7A+dP3nDcIACE=;
        b=nOT6YZHe/E5ywzUyujHqUdlOppmjvRGcSdkP5cJ0LgpD02ijiP4AL6MrTzIWbJggQd
         3zO8rPpi0kIFJbjAvWLOq53Nigfg9v9XwZ0Gx3mHGbS7m7L0DHLZUmRArHEyiMyKS7mA
         Blf+2CFKesfIgigGDNK9mnOHS9Mr/EoJcEXkWZLnT10Y6HKJbpxn4pJt68svGsii1KPM
         sjIj+ikMBtmVkL+7q/AdUTzem/hSFMMM36HszKkXMY93PU3yANjQi3O9CLbWvrSynGuo
         P/FgrJwIWGLeQLzb7wDqKuYcOuIU7NzI4atHdzRdJvZ2kMN496Lu0U+sGLosTe5Efs82
         fgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200919; x=1756805719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdMjE/IUNg9nUBZWSwSrF0HUJBl5tL7A+dP3nDcIACE=;
        b=lxdr9k8eZ/98kkp9VVSsqQ5+ykxCFrO/VSGY0MXk1xkO7WwYpuEJ/NTOT8r7sm5Vrh
         wZIhZRMEWm7HRHtwH3w0zn9XjRx+q0c2cyN9eHuTm8Lv1lgOvBNyUqOil4i33tk97GjW
         4IkpMD9UTQZhVgeOOT8Q4QLQmipiSXMtlNs72tdfszjd7QQ9OFx/w5z8tf8Jn1ywWNBu
         7VXgxFIjuN25XxtqSTCtzUiY7XZJ/4MHGAzsYviPyvuk22n1wbGI84iHE5WozT6ihWV9
         pca7M5cv8OIEPArJFnkq1nSSA9UaTBeukWSnAzl+65XTcS0tVlpWPpRMRks64j3UqWFI
         Y98Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4IKuAnmocrR2PeZHGHWymcqQkx1piGygSQL6uc3k8VPq2A3sR/M+U2sFO1SIbpUMcLK2/zx/HaE/uPbrY+2DN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv3pWRvZ08QQy5zsHqXz+cecHr39jtQedwlTB6gGCHqaMTbR+q
	6jOEvDdLg8VAV8W2L06r+8Il3o75RiOM7Asks0oiZY6ElgFIIzTsK8P4aYjS0A2oLfM=
X-Gm-Gg: ASbGnctYTndXIb5jv3pxneR55qGzx8nFcQETl0/VFeV7ayhyL78GFYHlneSZIkDaGwm
	vqC+pXH6RuPdLiXgaomnRzted3AKqYDfkYRsnpfZBE6f2ZC3TPYCCCnO/+/nyhrNjll9+HNis/0
	LambIshza/rn/eH1w5EWTWtZ2AVsyD937Vll6HjOp2bOo3cyoYd+y+0f9ya3sNblH8Xq0mpqq/N
	OvqfURCiNx6GSn3Gxc+kTXyjcNBNrsDhG2NafwuMUMbY4kdpqxxg0n/rHfUZY7S+qAVywMm4foY
	d63bUuZZxsSXuFj+4TFRr29UVuMnjVcGNofICJ/ihAzjRWc/3rgHxAGpUppCbnpgwreRnG5XBwf
	zw0egRtETzJ+OJsZjf0UZw2rXgg4=
X-Google-Smtp-Source: AGHT+IGFYppzg7ppfW2qCUHYBmIKcwWqnK+38KV0dVpWZJbB4VXKyNsvmKpRrAApETlF5QIhTbSsTw==
X-Received: by 2002:a05:6000:220f:b0:3c9:b8b7:ea3d with SMTP id ffacd0b85a97d-3c9b8b7ec0amr4709288f8f.51.1756200919352;
        Tue, 26 Aug 2025 02:35:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:08 +0200
Subject: [PATCH 07/12] gpio: ftgpio010: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-7-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5rbP7dwhRhfDrSbAgYMHtgCgxy4erM0JGqfIF8jsC5k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/N9SEBtr9CQED5vzENsLuHUQqYMiCsah98i
 +4dFAPqdECJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 cpDiD/4801Pac5QlHO6D9jKqnSPRvfkYUesEBYjOQoRoQO7T3lf+1NnMxw62VB+bKhsMavf0Pbm
 hO4Nf/NyHZpSXp3pPIPf9G+kVN6fcNQ5qBrs+gvi7JsR0X2JGRgfZlxh91Vk12yRTsW+NDErwPh
 JmL+8+8nQeFJ6q3ss63UDHJvgZILjabTP5RSIH0wb7M50VPU+8QwdjAhENUEiBirB8f9QNC6jNb
 goJ5DFK2XnM7sIEvMN5gTAz9sbtGbRZCKyoI/HbhHu+eITH4TGjUPJPRuPmZHXqnRFoa8nz0T7E
 cVm1uU1U7CDvOl9ovupCoxm+qdoi4XfEqjtS9aOP6J8pXUCn+WHqJTSDseqMZwEEy8x9eN1gYKE
 GzQRnaSgDGQdZmp5eheDhiV8FTP+ayHa9JLVmpT+Z85XPGz3YPLU7c/nrRHKNlM+n6XO7w3wqrs
 B4BGQ9Bnzs1NMsnAQ4IbStfy/yuv9BJrt64xwx96w2WkgjmViYp7gMuz+DfAprX7CHwjoVvR8Zz
 inkriWAohdiEy6QdfmfNRMyyzE8mbYJDNdWopcB8mztbZOHe+frPa5b3pRbzTNFsFcxOIedt0b3
 k2dPSKvKi5mp0nqiyLBCC+x3tg02ix1A+UI421kKbUVpGS36GNX4S99VMZqQFJwElEDaiuX68Md
 6dX8YoVapsqzaew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023521_056950_A2774E5B 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

For easier maintenance: put includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index c35eaa2851d8533309fe04a3e6265d9a7947606d..56666ca8889bc92b91b160751728b65e287b0123 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -10,12 +10,13 @@
  * MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
  * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
  */
-#include <linux/gpio/driver.h>
-#include <linux/io.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
+
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
 
 /* GPIO registers definition */
 #define GPIO_DATA_OUT		0x00

-- 
2.48.1


