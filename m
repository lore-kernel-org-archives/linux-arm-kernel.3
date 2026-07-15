Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920FBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRSMvCaiiS0yMcGdAT/An6rBd9a4xBsDxg7UHvgZW8g=; b=b8XaaxGpgNkU21wzIhLHs9I2F7
	I1z3i2/VQGCwKd/8oYXnBDmVWu308CJCpD1p1sH6qYEZbLtqvleCdio6jg1dW+To/Tq52tlwhu2bo
	7qoYVKTrj81QGfdujr/diyv3BwHtyitlOq2qM/v5S10iSMPj/djoqT61NuQc16kLVPCGdUH4Ml9Ww
	ruRBoE+W7PwfdnXTfIRhD8GbJZdgAtqO56qhm1jkuUIq65VcHzPnjvjpHv+2mRGQgIwis4Xhr4/3+
	i6C9VoUcQCsNBv/X6GFr1LrnuA2/ka4dZ2BfsPkWquvLUUvqAAdL4F37SC4bvS2Tqwozg2GjUEhV3
	3JewhTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hw-0000000FisQ-3WsC;
	Wed, 15 Jul 2026 18:51:48 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hb-0000000Fibo-49yA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141488; x=1815677488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vikGjvYqHQWSfjuEaJ2t/Txz7aeo0TD65SJMynOCRv8=;
  b=b4RBA2rKP4+0SAVXOdsjacZzgjT8g+mqNur3nR1M53y7OX+apaeEfRY7
   NtJp62ToGduEF/7yrtvF4T8n3C/iM7jNbPga/CczHJbABTfdxR16eha0b
   JbnmN2/vQyLu+BFbw6sSib9J0mtuD2Yg7VeCUnrMsPMWfAF0l3RdngTOc
   yHWIjee1S33YJXCRIyBiERkHYqFHOep2cPJkrLQEgH4EgVQBVzoNS/6hm
   oVlK7nrW+ky2g4aSQKJXWvMYkLg89eEDv9DgLP5cmUve20LyE8XJNTg1k
   hTLIMnXbQqr32CcLii0T2b8KNeU5ZqaF229fHXq6Tn6cZKh/AeGWDWlzo
   w==;
X-CSE-ConnectionGUID: 9DDhsr5tSg6Js3VaQdOU2w==
X-CSE-MsgGUID: DCXgtr98RPqfqMiPNAUaUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887500"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: qVpOBhYWRcKlc5QbkDdKdA==
X-CSE-MsgGUID: hu45xtIQSaqwTUt4K9bhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700293"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F3A5C9B; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
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
Subject: [PATCH v1 3/7] media: em28xx: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:43 +0200
Message-ID: <20260715185112.1323510-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115128_074527_0D27A121 
X-CRM114-Status: GOOD (  12.87  )
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

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index ef148a27c94d..d7f8dcf27900 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -742,18 +742,14 @@ static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
 #ifdef CONFIG_GPIOLIB_LEGACY
 	struct em28xx_dvb *dvb = dev->dvb;
 	int ret;
-	unsigned long flags;
 
-	if (lna == 1)
-		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
-	else
-		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
-
-	ret = gpio_request_one(dvb->lna_gpio, flags, NULL);
-	if (ret)
+	ret = gpio_request(dvb->lna_gpio, NULL);
+	if (ret) {
 		dev_err(&dev->intf->dev, "gpio request failed %d\n", ret);
-	else
+	} else {
+		gpio_direction_output(dvb->lna_gpio, !!(lna == 1));
 		gpio_free(dvb->lna_gpio);
+	}
 
 	return ret;
 #else
-- 
2.50.1


