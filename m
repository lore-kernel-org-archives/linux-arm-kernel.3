Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E3CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVFzQkChyd+UXTmzf+EsGWF7UuykP0xo5LCpzHLq3/I=; b=oOwpINsX68ZAoJBYUncnzA1q+b
	civPVhOnaGHOoQsum9lmTemtEF9c+j01EZ6aotwwIXmKlBmkro/H6mXHFG7QXi1h5pRRwr/YONMXf
	yYKBI3PgTo3HrzLpigU0aqK9jOxB3NFxo4JoLFXHO8ZMhbi7h5XBU5gaFru6Bxu76BoUwANhfdxvC
	enmzICYeVCYnYMd6a6tUEr77Dt7k1tRHiBHWVqzzOX/lVpo2o2t2coYQiy6ZBfwSSn3OQdOR5J5Xg
	g2rZBopPo2Vi4meCNliXouC86AncLxbRrGFmK1E26VZRvsE2bqfDCV/mHJ1wt9iOVadHlhseDvBzW
	IuEL9I2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjag-00000005uGT-1PjY;
	Wed, 03 Sep 2025 09:15:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPs-00000005LkY-0l2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso24236415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886427; x=1757491227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVFzQkChyd+UXTmzf+EsGWF7UuykP0xo5LCpzHLq3/I=;
        b=iAvdrULnpJnO98YeCpCr9iEXwz023FQezB15W1aTuhweUAI7a8RAK2Bb6vAhlW29NA
         aQAt+1undhPYjRZ6poo4etSAO4hCvSrCbST/Je9e7ABBe7VpmLen547b27so8YFo0+7d
         xbZjRvEtJ4L1t4bRFEgMkdAiOzYQ8azQh4A7mQyAw2/LYH+682uJvZ+no6XgwG0u0wj5
         jvomuCVIuMeG+6SnwZsjERn8fSmcna3eFfzR+yBpXqSK08wwy37LY60EbZoihOCXoEXH
         IkDsM4IztkuRojb/9FSWQ9BL63B0u9pTjRHU/FLzoVi0PRpG0O7EgQmhGRih7HJ+9hAB
         KTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886427; x=1757491227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVFzQkChyd+UXTmzf+EsGWF7UuykP0xo5LCpzHLq3/I=;
        b=qAbTBS/9PbcUEjcgeTFiMESH1SBqQwkAqY0Dpj//tRhvPGBujG77CbTRLl4LRVWfLE
         kzGnq0mwFAPBHgMKsHCIDJu+0uztHbpvrSYn+PI5j99T6f5InPWN4ZQw1Ez4CNUTVesd
         eXb4YTx1UucjJAEu7oTGt8wCKE7sC3HR3Pmcdg4p6iNP5gwv2IgW2KIG2hM62y9D9UBO
         roqtU969H57zTTbCkD8wE4d7dAgx3DGWGsthaR2oI9BHDwwFLbHWoclJz1Ov/iojJzw2
         HJwLIKluPVXakVKfAS2cLUHzkSGBYRHOTlYzhvCXi69aaq39xki8aWpsURLM1sVA9dQF
         85pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK8em9KCXngivWc1UIHKTK6YGaU0uWQBm9UOZcMsR92pKAwVt07edvI16cVHdCQZsS4Qbt/azP29qPLL8ftf5g@lists.infradead.org
X-Gm-Message-State: AOJu0YzH6LzAAnl9YgUuYM0nDsb3jsdvfrWCA8KFNf6tB83iYKtTx4/k
	NZ2Yhp141sp1ORLdd5HrmYPvc2G/zIB18afvlQiDTbvxA32c9bsiXZuC9Tl8ZAnWUiE=
X-Gm-Gg: ASbGncvvYv14VDw6E1ZfrePCkqD6i6Fjv3CWXfN3dR1V1CqLpaTkdBDBqD5TfnisbhM
	u2cZuikhjISksh/guRA/sGI/rbetSvmLBFi6SA0BDPZP625Nmj5XNV/LPnM9Sy1YeKL0NNWkTc4
	A+mvFWDB9iCmJCQrw2QzG89IxusiBb6jWnCC36JKkP+1NLQnvxt0EiZlqzzGrf5YJk/lhGJ0jBP
	pQ53ZOyriA3MPpKO2y4k6aaCwRHlYCBKy3Xq+KmGP/KCE0hk3iIgCfWWtcORIsOKw8iSHaUWGdO
	s+Zm0tR8NeDUe0BaI/sPi49l6YNyXucq4VFdeC9ViVOFSX0s1RNVwCGWb8DzUBogWwYbXWJRlRc
	J4WZVn64Gs2PVHSRf
X-Google-Smtp-Source: AGHT+IGq1DLgS9RobB4HREo9vO50WwmuNievMGfbOF7OziIxKdJPrcqmgePSVYo8F6jx37Btbjg6Iw==
X-Received: by 2002:a05:600c:a44:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45b8557c9a1mr120153075e9.29.1756886425764;
        Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:09 +0200
Subject: [PATCH 05/12] gpio: tb10x: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-5-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKK3o9s7sBkrHAIKP++kKb6hradf8icS6yfA8KQr9HA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WRk2iQOIWKe0p/kN7bUllcUQHzjZ9KLefoW
 sroPD9j5hGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 ciZ2D/9S4qDq+ty2QVf8sh7eHtke1y3AZIAl8EpZ/S0paaKLbc2KYgItDPXimDcZFnYwgMiLPE/
 42tDBAqb09ZsD7/t9sMW7cgiaBlTLx3a+Q4taUYrv/N5o9OJmnb0pjA8S2vb6ZkdpEm/BcEYQ8q
 vIlonycX1Tr3ooqgieWEOaqEan+xXL+UK06CMlNmQieVYfLljKSFEMaOazUwh0XVyoPeNmNk/Be
 pASf5Ks9KxWqi/7sivZbREzBAkSFtmuAcuiAqY8ijLcO+VBTmlQwbL3GLXbVwM4F+I8OjBwyNV3
 5WEyzDOs0yqOEunJIdtengR8nKFyjMxXjlZmevPUDxGrDRdsdlDwUtHp8QUise949CkMa8ec7g0
 wEhbrUOWOZ16DvJNiera05bP/aP+Dusswdp8GjNhbJLhKzWD/g8h2V5fqfdJ4xYuReizJmz70om
 SIDDFy7LRDPfLGwR29AdLEoeZrqNFHoyoghgOXYOCBBac3kKBnFwiZ3x8Br5mEmDzAtCKwEzE/S
 ixziiJsSmxGLFaCzXl5qvhM5MK2XdGgjn4xrkuE/jwCq9QqG/pDsKYNgaGpOgqpDNPxihymk5VD
 ClTxwQS8HyF5zuzav+iVJCEa4isMUlcP0GCG7AgKTc6CIhKO0OZO2knLyHxn8buMWRaoEfjCn/j
 VAEoGrK8mJtpf+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010028_252052_3AA74E8C 
X-CRM114-Status: UNSURE (   9.90  )
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

For better readability and easier maintenance, order the includes
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 1869ee7f9423efb31045a3394343e404db102faf..356d0a82e25f29f60c43801cee6c6803ea7a22c2 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -7,20 +7,20 @@
  *          Christian Ruppert <christian.ruppert@abilis.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/spinlock.h>
-#include <linux/bitops.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #define TB10X_GPIO_DIR_IN	(0x00000000)
 #define TB10X_GPIO_DIR_OUT	(0x00000001)

-- 
2.48.1


