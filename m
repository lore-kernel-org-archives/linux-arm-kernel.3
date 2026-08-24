Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E75C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ56OVD1rQQ2xDFzrGSePW6KAJkEvNS3OmOF8SDk+jQ=; b=ORrdhb3M3xjZtiDYRZCJfCRip5
	BnYfLwwXuiDXathFtSxtH4G8IW9knhuXrjS8aDcQjtLKK7EBxm6Iv5sUUznwaoYI3mtfOQ6yRoYFH
	VUEw3GcH9i9q9f3XwexryNT485tmmPqlqcFCaYl+rLbnRF3+NbDivTxL684C2ZSiuBq1Fp58qXcJx
	eM0bsLI9Jed7rdwBqopkwe6ggNOqeZyrgP8FDRd76FCfMEfH4vjoxUD2H6+6Pcy+SdcGDFUr0t57h
	ySt5rbcskJV/ox7pTfz/QZxHysYWDSnNI53VEZbNDgQOmpMVSfwjUgPcI6MgWXO1e9AFD22I+2qKw
	psL03m6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOK-0000000G8kK-2Hmz;
	Mon, 24 Aug 2026 07:46:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPOG-0000000G8hk-3weF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557605; x=1819093605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZY2Htu/rT0PU7j0rX9JiBkzz3dP5AzcZ4eIyb1HCZY=;
  b=N06b675QO9anrtz0aNLTUrSmTR0+l4L540tmomBE5gdFlFhTd4z2N7Ox
   AZU3XWge6oOpmv+Qm9D8nARus0TnNy2y85j6naUGpRGAmgXEdyekj2P3p
   yeS0xjGnQVEilie6sS3/hpXGhP3GIrVXA5PT5BfTaEuox2ygzpo+ftGwP
   LohqaHu5s3vad5snmGeD1sT0492UIFTWgbYAtHDvr78Unt8dieXDof8kY
   K+T3uH4auvNB2t8lOd4JD91Bp3jg4iROGwW7PNrgCY24eOeeic7MZscnf
   qCtbX2YarDfo7mQgO1gWtkTW6wuCRjwp9juxA/i1Gu2nWHUXeSh6HFxHf
   Q==;
X-CSE-ConnectionGUID: 0Gqp3ljtRh2GJilIkZvzyg==
X-CSE-MsgGUID: LksIov6OSWaBY8TuqYdBnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88203140"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88203140"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:44:31 -0700
X-CSE-ConnectionGUID: JYz2MM0GQHSheyFtJ4v5Tw==
X-CSE-MsgGUID: IuY2Ujj6RuiNOBYFELQz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268887919"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 00:44:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C0E6B9B; Mon, 24 Aug 2026 09:44:28 +0200 (CEST)
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
Subject: [PATCH v1 1/4] gpio: Split fwnode_is_gpiochip() helper
Date: Mon, 24 Aug 2026 09:42:32 +0200
Message-ID: <20260824074427.3226457-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004645_405257_ECA420E3 
X-CRM114-Status: GOOD (  10.25  )
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

Many drivers repeat the same over and over. For clarity and robustness
split fwnode_is_gpiochip() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2ea21341adea..06d40fb77a73 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -879,9 +879,14 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+static inline bool fwnode_is_gpiochip(struct fwnode_handle *fwnode)
+{
+	return fwnode_property_present(child, "gpio-controller");
+}
+
 #define for_each_gpiochip_node(dev, child)					\
 	device_for_each_child_node(dev, child)					\
-		for_each_if(fwnode_property_present(child, "gpio-controller"))
+		for_each_if(fwnode_is_gpiochip(child))
 
 static inline unsigned int gpiochip_node_count(struct device *dev)
 {
-- 
2.50.1


