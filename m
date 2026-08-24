Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF60C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAHkWYAegvhgqD9/VtmBkq4lMxLhsFZIonFqw/Nooew=; b=cSCbeiS5I73dGIA29xFjExGXJj
	KlNAW6iQSVgYlOaFELX49GUu7MaDx4Uu7dJbpbdB8Sl/Jl8NOAK0fdOEYdNqsgfPTkb97QuMIMVHk
	5tL3/sWK37gaoY1r5FweGNbfhPSgdbsirWK6rJMIqo8wnuzRtz4kbugsU/kBdRUt4oMLTCqkha/Go
	LeeS3hOcXLv7vSF6pssmiHf+ngY4KsVte9RTDX/T4qf3ayJo7J2EBI7GSFpX8pk+6QjswFcpcXapV
	psHkEdPM1QbDI1BGRfibjccbr7/Nk68Qeb/49m5abXYsEHHsOp+Oo7GWUlKrfn7VXBnYArfjgxYre
	xrgL76wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOK-0000000G8jv-1RV6;
	Mon, 24 Aug 2026 07:46:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOE-0000000G8eu-1TSY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557602; x=1819093602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SfYrQ2QKNXdOFKEip1SaXqsAWbFTT1Kd/H9i9iakMRg=;
  b=BBoo/f1AMV3jDpGzvj5nwj2bG0vDeOq94Y1u4w4kdP9d4cQy2KF2Pcdn
   0E7TJmlDz2p4zDOJzD6XTFNUyQIarpzlxdFR6y2CdnXYdV108ZsyOgp+O
   ZFSQPsUWcGn1g1HYji0NApQtG9qrOy0qUVg95aTSuFjXE/r+R09lYUqEc
   rDHK+KFvmD0hRwziWGyWBOZJ4HIVOXLMgLgFNvwn7iBTTITE8VIq/s7qG
   ZNOSw5JE90symIH5YFkXViIO8+Oh2vErYqfskzMyuUd0adXoOXjYwr9nT
   aPyGZ9j/b1hwzqGHgEtFK1qyVS1ikgTidgRWAs1bkeda/jn76A7vaJaHE
   A==;
X-CSE-ConnectionGUID: OYMtVx1DQi6VpyJeDR4xAw==
X-CSE-MsgGUID: CKXHzh4QSEOxA/XMRjTR8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203139"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203139"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: ElgUfOHJSCOAaDyh2ok0JA==
X-CSE-MsgGUID: 9f1Xj5qtT0uRzXnQIU+PVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887915"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CE932A1; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
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
Subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
Date: Mon, 24 Aug 2026 09:42:35 +0200
Message-ID: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004642_456288_CF797344 
X-CRM114-Status: GOOD (  11.34  )
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
 drivers/pinctrl/pinctrl-pistachio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index cc5cd2a538c5..32463733f7d7 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1383,7 +1383,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 			goto err;
 		}
 
-		if (!fwnode_property_present(child, "gpio-controller")) {
+		if (!fwnode_is_gpiochip(child)) {
 			fwnode_handle_put(child);
 			dev_err(pctl->dev,
 				"No gpio-controller property for bank %u\n", i);
-- 
2.50.1


