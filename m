Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B707CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZlLpGEBDVkUhlyl/pkfsydiKAmq3vfuscGjMaOS1uo=; b=Xc8ZJMa3ay7BfslCvBfbXXKNDc
	XKx7iNi/Pe2EHDwelWTZ5DBBCSYC75hNQUVJAHj3xRFv1fO1EFKm1+elSzv7N66Y1RGoU9AdVGzQN
	PgQqevUrLQKpWrpay/sy3w5r9snLGvfyOUUjFjJC/sFn7hgw+CxHrJd8DEy7RAfKiQdJA+sFwEP+y
	kUrmCmrIaqXXOUwkMb5+WMQlpNKxHE6Co2+JkwwIBkWw21+fIRzrrsqJ5mK8SqhSO2uSu0Ycgqau/
	193KZNKFRcSagUtL8rqh7uOIByF0pUaRLsW1YjWoZcm/w3buKe4fi/KdItgNN5TzuQy/ZheoVY6Oj
	QxKp/5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyH-00000000EAO-1AaK;
	Wed, 06 May 2026 08:51:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyE-00000000Dp9-2NWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057466; x=1809593466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=33pv8jkngV/TubJ8dKVNRz9O4JXzuX0rI0t9g4vltyc=;
  b=AvyWsyn5FRwShzWXyX7dYpTaJQzZt0Rvv6kxbrdf4bnJ1GnQiP7ZG7sa
   VBQhji3xZLhvrwshqESUEG6knaufK8yt7hhPg3FrwPWBoBVAmEj8Jvvj5
   wpODcoXXqxdY0Ng3c9ro9qB6vxuR7cL9I9I91WvvHw/nEo+UZtlmFMRdj
   5fTq94es5AO9BelW1HB3GnDfdhidMRDsenZEtG9i42imF0Tavetlt9UiY
   LheTEehEoIDfCt1pGX17jsJTV1/XbP9X0JLN4xsIz0CDo/QGgvBB4wZaL
   P9gjhIqNarlEWBcULOzub6Vhq/pms+gkCvv2D9g4C4FD3Y1w27V/DyoQ+
   Q==;
X-CSE-ConnectionGUID: tcpkMPxrTDe7w2Hd4GhCEg==
X-CSE-MsgGUID: R0sMsdqjQJGclVjHT4yIBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78869752"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78869752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:49:05 -0700
X-CSE-ConnectionGUID: 3CJfSjmzQTWsSJhOShrycw==
X-CSE-MsgGUID: /FDid8XlQLGSbXFNVEcoYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259510104"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 01:49:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0321699; Wed, 06 May 2026 10:49:00 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Niklas Cassel <cassel@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v1 2/4] PCI: designware-plat: Drop unused include
Date: Wed,  6 May 2026 10:47:25 +0200
Message-ID: <20260506084858.867884-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
References: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015106_643715_EE584FC9 
X-CRM114-Status: GOOD (  10.15  )
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

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index d103ab759c4e..7d896752d43c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -8,7 +8,6 @@
  */
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-- 
2.50.1


