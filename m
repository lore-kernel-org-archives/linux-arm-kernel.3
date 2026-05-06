Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E43CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg716LpoecIwfcaBhuvl/9GeUERSx9WostwzK4ifL60=; b=G+dNFZ7DAOXucYP82+Yj8Zq3y/
	H8H3DRDiPBafbk3nj3DC29LS6S/YRs9IEPekpKq1vIhJpwWxrt9GXiV1vjjVk+32cj8lG25+SzKZ6
	vphcjSVwtp7JnHYCdwGtQ/Z2UgvzlVAk3u8NG0e5CRtLdGe5Tn25rvqKxbyyhzx1HzpkCIjpQ6wjZ
	mVtR7fpv8h6SYwt9FxQySqizwBBV2pUo3FfjaCB+aoO4j5PxXfkznPpUy6U6F9fg5bZFYuEtG41Q3
	ObyCRldVjxLEijns3tDiSBWokUB7012dFlpDzo3vrznUiqP98t56b1IMcyHQQZcnt01HrL4G/bOtP
	TlBB5uJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyH-00000000EAC-0mgj;
	Wed, 06 May 2026 08:51:09 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyE-00000000DpI-28Xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778057466; x=1809593466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6kR3uTc3wV+vVyP9HWWBDu8ffUDgMM0mq6fvvjzt3A=;
  b=IWAouchgKXY8Fe3+pyTsEPDFQhH84YP6iae3zD1LdEpewrzlVckZ7ecM
   /CEJ6v0gLJPkVYIfUp9qqQoJOdaafaZHytFPc8q95H6xHsPLQZ5tqz7xI
   PDUZanTUNT8xA/4tEMDe3Xb2GovnR3I/BVmC1XfybE3Fk+fFIzVAFAU3B
   BGRWQDzl83qBaO6+h0yQhS98r9HkUnYNh8vMpNL6L7Vv2KdcQYlmj1NKL
   N6iFBpx1QORA5b/hG/3xIPVxzyg8Zrbr13hlbMFNk0RgJxDM75swO8MSc
   ZNBg7ZwUn/+AQhs4a2SehnQ5ALuEHgN3IaDjDzSJE5bUHr+X6dPpqlrE3
   Q==;
X-CSE-ConnectionGUID: bswl5SHiRQWeEGLJYkHHRw==
X-CSE-MsgGUID: sB3APpSpR7eMW5gGfT8W2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89681539"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89681539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:49:05 -0700
X-CSE-ConnectionGUID: XkQ951pgTUODUrYDoeuEVA==
X-CSE-MsgGUID: K/2w+vp/TaSvDynXEzl+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240412779"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 06 May 2026 01:49:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0B9AC9D; Wed, 06 May 2026 10:49:00 +0200 (CEST)
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
Subject: [PATCH v1 4/4] PCI: visconti: Drop unused include
Date: Wed,  6 May 2026 10:47:27 +0200
Message-ID: <20260506084858.867884-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
References: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015106_556618_28AE1189 
X-CRM114-Status: GOOD (  10.37  )
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
 drivers/pci/controller/dwc/pcie-visconti.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index cdeac6177143..f21775c3b3a1 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -10,7 +10,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
-- 
2.50.1


