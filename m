Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A779DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cElq+wtoOjfXL9zKsYRu09ghvKlD3Q+EYQSAGR5FBls=; b=SBwZK3G67Sx6pDLakzR1d2P3Y9
	Rg3miX7YN6hisUxVD0NxnLewBsQTxM/mGnWK2wQdp8LUSHVNt6Esot4CUaKFVIk3D+nog/gpjDrsn
	KZ6q3Vl+Y7LBCcgQwNDIobbIqlLmalf09MXr+hMttWgabZrZ/2aRjp2dyYRbqk/y2WTsOHrbbM3Gt
	NxsyTSFXdbD8oHOXm1Setz9ibQHQKbvCpgvkHIA/gHhRV4YQQQCqoNLu+tXA3jkwZ308LWOpM0TL/
	q+L1ANKYYzAOtu0iaN37swZ+Fq7OqvEhbC3duxDzDFkRoJHrHKCV12R4gJEzBzf7ScoDLDi4xlo78
	fjHNqJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6eU-00000008PDa-08Qe;
	Wed, 12 Nov 2025 08:56:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6eQ-00000008PDA-2bkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762937786; x=1794473786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sl+zfwNpML36ev1KM+JlgPIGMQCZVqEo/fI0Ku9iDIM=;
  b=fGALw/eLaZVSh94xsKsEmSEf+Jgfvg94Wfdf3CnLOAilqPx5Sk2fMp5h
   oc6OL1VWJyxDZBcEAgvWbmvCVBAnhFa1QA7GsVBi5Fk77ggskZbRf5+EM
   SFJ6PkyFBOd80+2TzAVDXi0mh4xy9V8rwf9m30EE+SoTDevrJNemJfkCH
   GcPlbv7loaXx3wbAUsxUeujVS8/lidWMiehlbNGFVES8P9fdnuxEtUiCZ
   WGJb8h4/xh+1vsHpNDd3r+PDH7Bv21ejMTcokQhMEteQb35FucbELuFf1
   W9/upKLS1FjlxyqM1tyXh+nRrCfzkHA4591bNONarKwoaT6dePGko8BB6
   Q==;
X-CSE-ConnectionGUID: NlOrHRerT6mWyLrJy0VtMg==
X-CSE-MsgGUID: MkPodEH3RJipSuKSBS6trw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90470260"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="90470260"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 00:56:24 -0800
X-CSE-ConnectionGUID: 6iy+RXr/QdiJ/GHS8641Ig==
X-CSE-MsgGUID: qqOSY0sjRGOCddFGLQVfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="188806184"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2025 00:56:22 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EC9B495; Wed, 12 Nov 2025 09:56:20 +0100 (CET)
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
Subject: [PATCH v1 1/1] PCI: stm32-ep: Don't use "proxy" headers
Date: Wed, 12 Nov 2025 09:56:20 +0100
Message-ID: <20251112085620.1452826-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_005626_669664_E8DE5EEB 
X-CRM114-Status: GOOD (  10.36  )
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

In this case replace of_gpio.h, which is subject to remove by the GPIOLIB
subsystem, with the respective headers that are being used by the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pcie-stm32-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.50.1


