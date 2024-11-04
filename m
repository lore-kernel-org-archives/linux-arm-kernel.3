Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237A1D132A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJIIyWld/4qUn1AwmYOie1TxP8t7cmb0RJ1rcKUAN6A=; b=VZ8NZVUoKf8+fVxaCm7tRhioPO
	SFVG842ETCVBBbE78gmXBYbqv7RtrYBxJc0OvrDTppVnJ6DhKv/3jrbJM246UcX+sYRU1XI62CuuJ
	yiCV/jbAvq0hlFqo2R6rB9mnhO/3KrfpMjsGzeX5KvmZ8DgjyhV5z/ph0Sz7jMDmivt5QRbGSEyRC
	a7cyflePKeh+aF9M3N8mJIbCK20sFfx7+E4N/0D89Xqp+VGSGbsWIQqbx2dDjwU2i5osDU51tzQyX
	+oaIt971Usl+YODsJG0QQaE41Pw41N2BY+RxzRZEeBG8X6vohSqgi3QWb4UmSBZI6YrKXChnpCkrz
	auUm4gjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tcE-0000000DBxr-3I73;
	Mon, 04 Nov 2024 09:43:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tVY-0000000DAcx-1AMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730712984; x=1762248984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2TSS11EQDCPbhJt567UVr2avTbDJtRucAlK/U+ezRY=;
  b=ZZO3XuhUSdGmpWTVn/yb4dcYixbyhDZQwPdSCnsj5s0doykpXc0X4UYy
   1wDU01J9xjMSOv9R64s7UErTGzzmt0q1ZvOL3/LB2zbQCVE3Ch9evkUdr
   gDQgxaI60KA0nyHVJ3s20QreTik8B58o2xgjXqKhQmnmzXSlSMj+QURQE
   EuyIfTjeJ6sMo9mirk7oGDTGe5Frxj99e/5Y4oL0XDgXflIDiFAQM2ZKY
   pKvmVOiL0qMAI4MrHCHpW1R39IAtFczDTiooP4+n9bVVUZIvz+oA0HHZC
   PABlyBK04thyC9ofRBE1nffvm6OLGqCLr7JrbYXjxPhQoElOxuO+6Jp/n
   Q==;
X-CSE-ConnectionGUID: Jit9i6mATqy6wg6iHtlczw==
X-CSE-MsgGUID: Ky/5mNDxSwGChEGuDnOFyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30278764"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30278764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:36:16 -0800
X-CSE-ConnectionGUID: xcETve/0S9Oi+37Ks/vMog==
X-CSE-MsgGUID: 5KT7PbBBRW6rQeZEXFrhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83481190"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 01:36:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C48AB3B4; Mon, 04 Nov 2024 11:36:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Date: Mon,  4 Nov 2024 11:34:22 +0200
Message-ID: <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013624_627536_E2D74179 
X-CRM114-Status: GOOD (  13.69  )
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

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pcmcia/soc_common.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 61b0c8952bb5..1deb9960db34 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -204,14 +204,8 @@ static int soc_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 
 	for (i = 0; i < ARRAY_SIZE(skt->stat); i++) {
 		if (gpio_is_valid(skt->stat[i].gpio)) {
-			unsigned long flags = GPIOF_IN;
-
-			/* CD is active low by default */
-			if (i == SOC_STAT_CD)
-				flags |= GPIOF_ACTIVE_LOW;
-
 			ret = devm_gpio_request_one(skt->socket.dev.parent,
-						    skt->stat[i].gpio, flags,
+						    skt->stat[i].gpio, GPIOF_IN,
 						    skt->stat[i].name);
 			if (ret) {
 				__soc_pcmcia_hw_shutdown(skt, i);
@@ -219,6 +213,10 @@ static int soc_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 			}
 
 			skt->stat[i].desc = gpio_to_desc(skt->stat[i].gpio);
+
+			/* CD is active low by default */
+			if ((i == SOC_STAT_CD) ^ gpiod_is_active_low(skt->stat[i].desc))
+				gpiod_toggle_active_low(skt->stat[i].desc);
 		}
 
 		if (i < SOC_STAT_VS1 && skt->stat[i].desc) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


