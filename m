Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542CAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBPDGgewSNgcI2i1mzNeBC02hYe/trS4eMTdpa/mBVA=; b=TDliktC4oTXeeI/9vsZWJOhqhj
	2lYSFkjBW2kYLZzFuowo6/eLeKugjcUpepksTExztFiR2hypSItI568TqZ9vF7u5YbpnD+AkCRAZk
	r3hHPc4r6lq5QreoX6Hzfx9d1LKeUbRupWER3OePlXdcnaz1VhoD7e9PdFRro47HtCgW/nRHdJ258
	mvC1DTTLkirxeiSQaf4VxgLoR3fBj3ltOkCJ18mpw/WTdcaoeegWNFCYedDCNbskuAw20lr1OaG/D
	PrXxHHKmu9Dabvvb/R2+Mn+hgAVnFmq0s4ZnGC0wzKriAFLIlaIwr+vnaHhGZRR0P6+gh3P7Db1i3
	rJzdcUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hd-0000000FieQ-3UbR;
	Wed, 15 Jul 2026 18:51:29 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hY-0000000Fib0-2vAg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141485; x=1815677485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FDPjXoCgRJnJSh11Yjsc76ru2V/iRZPQNxJkLKiuzdo=;
  b=jS7fxJUMa71xYJtWPuyN7iNM5ZWFfdtxb110bCdrJ8ZJheK3om4+7vO6
   ISUlcIn1q24kL8pT9KmAqBKY+wXBPh7LwrQ5xuw/l8CRBkPvbwNkGrFrZ
   Bkuxxr2wyvyjTUnhyFl4NaENWp7DwFBDfMSVrUE2dp4HpB/4LIElfxjFe
   5234nT0yhXBGWhU+w2pfV10mYvKwSFOLXTZDmp9qNzgPo2wvQelOZEXkl
   rVRYh/qL8Bk2xgiut5pczICMA0DxXhzuQYHCT8engMg0OSZmeqc2NIjGT
   0Wd83Ljuk5//AkI3vPK6tfGQ3WIut/5nvWrQZM9OP/x/IVL9Omwt98Oo9
   A==;
X-CSE-ConnectionGUID: s+zyw4FnT1W+YPNbowVuVw==
X-CSE-MsgGUID: JnCrKMbvQIKCsGqPfO4Qrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887474"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887474"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: c0ePlU7xTLe50ZfQ5a0cZA==
X-CSE-MsgGUID: 2XWh0XIhRhen6eEpbG1r2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700291"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 039AE9D; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
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
Subject: [PATCH v1 4/7] MIPS: BCM47XX: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:44 +0200
Message-ID: <20260715185112.1323510-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115124_782768_D046FAC3 
X-CRM114-Status: GOOD (  13.32  )
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
 arch/mips/bcm47xx/workarounds.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
index 745c6228eb2c..9148d2c219d1 100644
--- a/arch/mips/bcm47xx/workarounds.c
+++ b/arch/mips/bcm47xx/workarounds.c
@@ -9,11 +9,13 @@ static void __init bcm47xx_workarounds_enable_usb_power(int usb_power)
 {
 	int err;
 
-	err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
-	if (err)
+	err = gpio_request(usb_power, "usb_power");
+	if (err) {
 		pr_err("Failed to request USB power gpio: %d\n", err);
-	else
+	} else {
+		gpio_direction_output(usb_power, 1);
 		gpio_free(usb_power);
+	}
 }
 
 void __init bcm47xx_workarounds(void)
-- 
2.50.1


