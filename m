Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34627E66891
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dujOI2TT6e3gi1lU7A039EXgDE+5/C7cKeGjiT8Q7MQ=; b=JrW1A4qzDF4hHwXK+xA+xw+R86
	pnN96QxdKzoXDoO1q7fxZauE1EYjklSD4TD1ZttETh5dkjeIeVXFKDbw3YseEEg2lASAdJW02/lPp
	SI9rSrDgCcZKl/jyyqto0iYmdSQQxl1il9VsD0eAh8kpEgd62GicZFTQaUbaV5DvHPuRZZs6vkTUA
	zVS6Sqe/Q2TFzIDrXEW4b6Lo3S6rJU3I2PIEvBQ1jfpVOS3OiZtjfgQmYAzfLZjAU7kou1t5Qnk7q
	k+ACYqrkEGy45+ymUGqANYE6i2bMbu2W76Vi2V+UFQCEMYGiJGIVTzZbilxCTGai+Hj3dwkENM0NG
	vgjPJgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiJy-0000000B1AF-2qx4;
	Fri, 19 Dec 2025 21:47:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiJv-0000000B18P-2rS7;
	Fri, 19 Dec 2025 21:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766180849;
	bh=J0JZN9btX5IntQvXc3g0n63OJUhRt99u/M67OILxuGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LZiRjbAO701Rrvy5fiSovth0XMG/INbBQfH4WlR99AdYtPf5gufJXvBQJzICIrFOD
	 88oSywnRjtECCYbSMIJ8JIyJf8qsY82kemu1ggrkwvBf/mjarh5A1gfqFieWMXDdQM
	 It8gVYNviIe1/37z/7OlnfYVbzTJl1Qil0MrmIjZ7BgfFMfg3DrZH7/50aWE1kFXqY
	 qZmtFygLCrv/sQvkzw+d9+MiJiSGiMbRo1xuzF5nBxgRAmZCxDYig2fJrV2eOe94E9
	 1Pohpz2bMRrf5VudQ7rLkNUMyRGUUUSahu4zmWmPNiYI7FspJeUJDVUa4lEfsfaMnb
	 4DFOgSGwBqJzw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D01C117E10DC;
	Fri, 19 Dec 2025 22:47:28 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 19 Dec 2025 23:46:58 +0200
Subject: [PATCH v4 1/4] uapi: Provide DIV_ROUND_CLOSEST()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-rk3588-bgcolor-v4-1-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
In-Reply-To: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_134731_883501_12143454 
X-CRM114-Status: GOOD (  11.71  )
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

Currently DIV_ROUND_CLOSEST() is only available for the kernel via
include/linux/math.h.

Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
a common definition in uapi.

Additionally, ensure it allows building ISO C applications by switching
from the 'typeof' GNU extension to the ISO-friendly __typeof__.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/math.h       | 18 +-----------------
 include/uapi/linux/const.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/math.h b/include/linux/math.h
index 6dc1d1d32fbc..1e8fb3efbc8c 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -89,23 +89,7 @@
 }							\
 )
 
-/*
- * Divide positive or negative dividend by positive or negative divisor
- * and round to closest integer. Result is undefined for negative
- * divisors if the dividend variable type is unsigned and for negative
- * dividends if the divisor variable type is unsigned.
- */
-#define DIV_ROUND_CLOSEST(x, divisor)(			\
-{							\
-	typeof(x) __x = x;				\
-	typeof(divisor) __d = divisor;			\
-	(((typeof(x))-1) > 0 ||				\
-	 ((typeof(divisor))-1) > 0 ||			\
-	 (((__x) > 0) == ((__d) > 0))) ?		\
-		(((__x) + ((__d) / 2)) / (__d)) :	\
-		(((__x) - ((__d) / 2)) / (__d));	\
-}							\
-)
+#define DIV_ROUND_CLOSEST __KERNEL_DIV_ROUND_CLOSEST
 /*
  * Same as above but for u64 dividends. divisor must be a 32-bit
  * number.
diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
index b8f629ef135f..471877322f47 100644
--- a/include/uapi/linux/const.h
+++ b/include/uapi/linux/const.h
@@ -50,4 +50,21 @@
 
 #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
+/*
+ * Divide positive or negative dividend by positive or negative divisor
+ * and round to closest integer. Result is undefined for negative
+ * divisors if the dividend variable type is unsigned and for negative
+ * dividends if the divisor variable type is unsigned.
+ */
+#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
+{							\
+	__typeof__(x) __x = x;				\
+	__typeof__(divisor) __d = divisor;		\
+	(((__typeof__(x))-1) > 0 ||			\
+	 ((__typeof__(divisor))-1) > 0 ||		\
+	 (((__x) > 0) == ((__d) > 0))) ?		\
+		(((__x) + ((__d) / 2)) / (__d)) :	\
+		(((__x) - ((__d) / 2)) / (__d));	\
+}							\
+)
 #endif /* _UAPI_LINUX_CONST_H */

-- 
2.51.2


