Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B8CCE8D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 19:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AM4YMoJ67S7ZxGgdt7TY4R9yJmNncn8E6GOY0QsrGEk=; b=O5EX5Nutv794AAFpxg83hn1QFu
	FyMOqLraF0ZM3UJYG3hid7+5MlgV3ZmL+rWnfNrHKPFpe7qGK4EiKbLkxWsBEf0NLMlMpksWd4DWA
	LOdxOsVTsGalROAsQigaddbuc/ESEOJo3k0FeyUe0wExqxfOA49GpKg1KrWiDd6qvRY/ck98cGOkx
	8IthoJ7lnr/7SOcVEj8HOQ4jzh/48d6JuSM2m2hsL87MWtjyN/jKB7aS7W/xITLg03zznvZTCvN+6
	4jSQVs9n9m3oHZPFr7i40ta2XkpzLYLbDamHm2EAzN7KgrPUCTW3ei0RZcE4Rl70HJviA5X/Ogdyu
	P3ne3yiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz5I-0000000Czux-1esi;
	Fri, 14 Nov 2025 19:03:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz5G-0000000CzuY-0apl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 19:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763147026; x=1794683026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dym/pfPU9DLIbudGmaXmsPCZxOSh2XiLLb064rHEO3A=;
  b=PaEvLBoyD+4ABTjNh3zeZRZGt/HOmgiNNqlMBNR88yPT92CX0I6RicBc
   CDMLaty8q7Q2UvBNrvXVMxO49imA2/94pUTn0iWM5vq1jrl3rK2GilMNr
   2PqAwxEm4+KIN53VyZR8rnvPSmqUZAbenlUeRNzvWFg2OLeog9XxGYoro
   C3PRrMmJiQ9MjTw6f1ZHeRM/HD9Lsv+rdcKB/gbIDwAlHODpwrkCwyr46
   hWvinyilZJca2WadFQ7rghUIJwxx4dOqNJyjwxVgIpQnY39eABcA0+EPF
   dORXHR86XvX14j1eBxV3LuYshZHb4AR45+EogyyIlB29EwaBIhhQdxBjQ
   A==;
X-CSE-ConnectionGUID: MQ/m6Ve8TkKDJG9YxZD8dA==
X-CSE-MsgGUID: K3rUhzqSQ5yBnDVZYm2MCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="87896164"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="87896164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 11:03:43 -0800
X-CSE-ConnectionGUID: Y3M1gm+YRxme2H3VOXGn5Q==
X-CSE-MsgGUID: ZFiGynYVRpC+9bZ21AGmqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="195002153"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 11:03:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B1D2F94; Fri, 14 Nov 2025 19:55:36 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v2 1/1] PCI: stm32: Don't use "proxy" headers
Date: Fri, 14 Nov 2025 19:52:01 +0100
Message-ID: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_110346_218007_743A386D 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

In particular, replace of_gpio.h, which is subject to remove by the GPIOLIB
subsystem, with the respective headers that are being used by the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: took care of pci-stm32.* as well (Christian)

 drivers/pci/controller/dwc/pcie-stm32-ep.c |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c    | 14 +++++++++++++-
 drivers/pci/controller/dwc/pcie-stm32.h    |  3 +++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 3400c7cd2d88..2b9b451306fc 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -7,9 +7,9 @@
  */
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 96a5fb893af4..a9e77478443b 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -7,18 +7,30 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/irq.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/stddef.h>
+
+#include "../../pci.h"
+
 #include "pcie-designware.h"
 #include "pcie-stm32.h"
-#include "../../pci.h"
 
 struct stm32_pcie {
 	struct dw_pcie pci;
diff --git a/drivers/pci/controller/dwc/pcie-stm32.h b/drivers/pci/controller/dwc/pcie-stm32.h
index 09d39f04e469..419cf1ff669d 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.h
+++ b/drivers/pci/controller/dwc/pcie-stm32.h
@@ -6,6 +6,9 @@
  * Author: Christian Bruel <christian.bruel@foss.st.com>
  */
 
+#include <linux/bits.h>
+#include <linux/device.h>
+
 #define to_stm32_pcie(x)	dev_get_drvdata((x)->dev)
 
 #define STM32MP25_PCIECR_TYPE_MASK	GENMASK(11, 8)
-- 
2.50.1


