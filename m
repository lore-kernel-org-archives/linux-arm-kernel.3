Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3CCC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Joux94RVer4obsXCUHuN5iRDLcsS/cNq4oLOa+mGc7Q=; b=tlGmxy4c/LOlv+svQJf5m8WjNt
	9SlMjdT2agsD9uVcnXTYZ74L2WIwLjO5zpRghA5rAWdXeR2Uu585nEOtoGEfDg6L9hSttlpj1x/WG
	Acmc1aKuTSGSdxFumpCR1Z8/6rqjlaNW2U7WLfrcwx0n68iB/e5+WHa+ErclxHmK/tM134bVQiUH6
	XD2S6FYcZZjajMkFeaTTydpAP3nAftijqRny1Nyx2L/8jhaxDFJv0z0Q2pd1kt+M5dpo9qok295+a
	j0PFMdzrTgfsgjPZlf9xcdw0xEXkEl+GuKvbTiUhQidmb2B8nM0MdQNDbVNSiVPE69xoCY428+TMh
	hMcSM0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOF-0000000G8gw-10L0;
	Mon, 24 Aug 2026 07:46:43 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOA-0000000G8eu-3zu4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557598; x=1819093598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Olxp+XRfKg6I0jsffga9X3Ar1aUW0Q6hGRO0bE/66jE=;
  b=PlDWTztnCvB/alV8+SyINs9gsqdBN2R+mtIeDl3SOF1c6jcYN6e92Khd
   9XycMvL5l8RKV1KcSVNa4TqIFBNlweJQwsFJC9hjIkBEqw3RXP+MEmtAR
   FTL9ZDFRCMEBsDh82ldGRVij+szqtaGiHzvTZbCDH7w6MwdcGkAeuLqd0
   zzFH5xe4+FF5XleMr47EJkFszbZYThaynakI7RbvZn7VfkOXDNeRCMrOZ
   fIiP0psEEQoIOHEfT5vfVlwlSsDkudMNKE+vrRyEtuMC5oXzCQdtWSKZz
   We1xHtLK81salA79mc1YtakYFKWWzGHwWfBZB7hV5xf8zy5JReANmBB40
   Q==;
X-CSE-ConnectionGUID: eJHtpNg3TOyaLkV0TOq1Jw==
X-CSE-MsgGUID: Kwe5MH2BTh+YIur6hH5jbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203130"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203130"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: 1f9grLjMSU6YOJJSj8zBaw==
X-CSE-MsgGUID: e+SJP58XTj+0lDzAWmldlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887917"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CA7259E; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: [PATCH v1 3/4] pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:34 +0200
Message-ID: <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004639_036096_102B4987 
X-CRM114-Status: GOOD (  11.29  )
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

Since GPIOLIB provides a helper, no need to open code it, hence
replace that piece by fwnode_is_gpiochip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index dafa85c105a1..922b727c4b6c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -1075,7 +1075,7 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	int ret;
 
 	device_for_each_child_node(dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
+		if (fwnode_is_gpiochip(child))
 			continue;
 
 		npctl->nfunctions++;
@@ -1096,7 +1096,7 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 		return -ENOMEM;
 
 	device_for_each_child_node(dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
+		if (fwnode_is_gpiochip(child))
 			continue;
 
 		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
-- 
2.50.1


