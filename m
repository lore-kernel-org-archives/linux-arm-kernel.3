Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148AAC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5i5lXqZ3McDsQHtidOWrnYc+zoUHdx4o3FlLXgC03U=; b=JeDNXKsY4V7L+rdhZEEbs8qAjZ
	FH3X3WmnrVqEFbt6kcFGZurCPeAg0WvT/IXB/mhv91dLtVldKTMkkffOxYuIoVIFYywtSV8b9k3GN
	bfmZHQco1SKhu37AP+SK5WOBTXHXlJ+n/6dGWHGTn0H6RQ2zZ9+Kies63MF+ZXK+y/5uVtdZuOJcZ
	k4gLcE2XWB6XFJz3d89C9YDDHa0E7IiTLJNZ9LDQRVcgNh6f+zEx9Ida1gnsQaoyYLniC8ga6VAFr
	gH13x6AA6xHgZ2h6cuumRLzvXDWVFJwjP/6B19/3o4WPONhAdZhrDRMHy+UrpijR3teGxQylRl1Ol
	pX3sYlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4he-0000000Fifm-1Phi;
	Wed, 15 Jul 2026 18:51:30 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4ha-0000000Fibo-0cJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141486; x=1815677486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vlg6EucuLTzH2ahkQ9RKGxIHegwV5NfcPMCjCKbBPYU=;
  b=XD+Pao5ioEgTROMUm43kyInvMzQKEclnTujJBSuZS/au0263u0fu57Wv
   6g+UHSiIeqiDrvHMNfrTUajDxwmaVGr5zPFSyND8QMlbskSl19g4z15U6
   X24chEXKt5x7v/PwPBPPjDoSjTXXkQQedebiAyIMRWwiR+iv+TCrag/Xr
   rpGH7N/wLmX0EFSu4iyRnWMAy9KGLrBaTgRhCYOm7/UuhijdCDm46TTv/
   6iqPVV8kmcc7Q5PP2KLKet0qpi1IiC166qjfKtbepBmQN3/DlZm34uooV
   cGiaYUMD60fh6t53zNukcf7S6twLcDyJTkK8AhiREALI5iiirEUIv2xXW
   A==;
X-CSE-ConnectionGUID: PALjlIfDRRGBiz+qTmU9kQ==
X-CSE-MsgGUID: UAzFYC/bQwuTkAi0UyV6ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887511"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887511"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:22 -0700
X-CSE-ConnectionGUID: A6RZI7cwTZeYovAgsogMaw==
X-CSE-MsgGUID: k8B/RJ8pQo6fhlh4cldqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700294"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EEFE199; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
Date: Wed, 15 Jul 2026 20:46:42 +0200
Message-ID: <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115126_259070_9E562931 
X-CRM114-Status: GOOD (  15.20  )
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

Split em28xx_pctv_290e_set_lna_gpio() helper in order to deduplicate
the GPIO request and setting.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 31 ++++++++++++---------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 8482fc4045ea..ef148a27c94d 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -737,17 +737,14 @@ static void pctv_520e_init(struct em28xx *dev)
 				regs[i].r, regs[i].len);
 };
 
-static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
+static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
 {
-	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
-	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
-	struct em28xx *dev = i2c_bus->dev;
 #ifdef CONFIG_GPIOLIB_LEGACY
 	struct em28xx_dvb *dvb = dev->dvb;
 	int ret;
 	unsigned long flags;
 
-	if (c->lna == 1)
+	if (lna == 1)
 		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
 	else
 		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
@@ -761,11 +758,20 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
 	return ret;
 #else
 	dev_warn(&dev->intf->dev, "%s: LNA control is disabled (lna=%u)\n",
-		 KBUILD_MODNAME, c->lna);
+		 KBUILD_MODNAME, lna);
 	return 0;
 #endif
 }
 
+static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
+	struct em28xx *dev = i2c_bus->dev;
+
+	return em28xx_pctv_290e_set_lna_gpio(dev, c->lna);
+}
+
 static int em28xx_pctv_292e_set_lna(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
@@ -1920,19 +1926,10 @@ static int em28xx_dvb_init(struct em28xx *dev)
 				goto out_free;
 			}
 
-#ifdef CONFIG_GPIOLIB_LEGACY
 			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
-			result = gpio_request_one(dvb->lna_gpio,
-						  GPIOF_OUT_INIT_LOW, NULL);
-			if (result)
-				dev_err(&dev->intf->dev,
-					"gpio request failed %d\n",
-					result);
-			else
-				gpio_free(dvb->lna_gpio);
+			em28xx_pctv_290e_set_lna_gpio(dev, 0);
 
-			result = 0; /* continue even set LNA fails */
-#endif
+			/* continue even set LNA fails */
 			dvb->fe[0]->ops.set_lna = em28xx_pctv_290e_set_lna;
 		}
 
-- 
2.50.1


