Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB183C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKQBgVh4dMXj/89RoCxPNCzDIKYwxikBOWBC4WjpLls=; b=WbIFPNMeVLaao02ayuWjH3aqfv
	6gA6PHRHJaH5qfMoozs/uQZGN+esPaZSB5h4M1jSxx4iw/8l6s6brDUKOxt7tV4exUO4fdsdJLnsb
	5NAVk32afMblIcncKnqcRm/xTIGBx+3FOYHLPCl0kOxYFEEQcgBJIEFtRCHBgaPGv0Q8hsFPWnZTh
	ykcC0mGwNGdkIS4OaTKyEcAYSEAwRzal645yN6wlkRXD7igw1KKXyRyCLZgq3qZd7KSZRzvMC2OPZ
	JXjR1t/bszKUw4kjDXIlezoCxaKe+6rk2AgXQDmtBTYC2pk5jXXf/AYIRrERg+JOHDhZ7s/hZdcwt
	PAZA9uYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBbR-0000000HXBu-1xQV;
	Mon, 31 Mar 2025 09:38:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBZj-0000000HX2l-1QjK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743413819; x=1774949819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dWMf0zWm9DMcuVxBQ2kWb+B/eofdaEh5V43hOzHRsX4=;
  b=hOuhAaOIfjVwxuSuwP96nLKxOwjeHLcIQGpgi8l25XyztVFFRWXTVJKa
   GpR+HeH69QFKYP1dh2QsPlMO4x4A55sHOVHlvfEt6Qdjb0pbeErqOmE8p
   Z3eY3upm8NsRGZQLvFg8be0bYddo3moaQRJbEIXGkCUuv0yFyuPIj4joP
   t3zLHWoKXzJruKBgsReMG530Y0oJvx7LWyBCMPlTlV0r6EkkbZCKt9sqe
   nf7L4mZABu8388O6sP0GTOP0O04/TLLd38IEpziyq14hRUq6QsuaGZx7i
   B9GthR7hykbPzgpA0f0y9Cobk4J93bPHnkwC9fnVdcb1VGEro6U9zk8r1
   w==;
X-CSE-ConnectionGUID: oUUx1BTXQiuOcQlZXGVCKQ==
X-CSE-MsgGUID: YiKpO2nLQfCyUo7/fsc8Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44581832"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44581832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 02:36:56 -0700
X-CSE-ConnectionGUID: hstVzWFBRcO4ohhrEvb02A==
X-CSE-MsgGUID: Ddp38qlwR5uOkKn7Dt6a4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125856501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2025 02:36:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 817FF1CE; Mon, 31 Mar 2025 12:36:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 1/1] ARM: s3c: stop including gpio.h
Date: Mon, 31 Mar 2025 12:36:50 +0300
Message-ID: <20250331093650.4028999-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_023659_421542_70F980DD 
X-CRM114-Status: GOOD (  10.88  )
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

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..79fdb52c4a6b 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -11,9 +11,9 @@
 // Samsung - GPIOlib support
 
 #include <linux/kernel.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
-- 
2.47.2


