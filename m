Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F288BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV7eszTt+uVyWZ8/R4I4rK7iMpTvNomzRzxe8SS4zGY=; b=hj+iUhjLzSivAs84CxAg9NSzTc
	9j/Ls0eAoaqL/8o1QIpKT0FXj67Nr953QHRxd7nU4gkxzEeM06qM7IQnRbMV8VfvuOJuRfkX9YyIW
	nqT2zebCoJQSuRBuQ0vehb52sackwjlhNhwDqRhNIP2aRKWhQ4rwFL5o4eXvbGFyRYkHydZRbB2lD
	PaotD333XuDdmdgbjFuQAkAjBWaYGlxNHAjvkxEv38zquhyeqrX1Hro+6LcbpewXLfR66b2Hj4LeS
	2teT9TpHo1IatLVK5NnNiB88NfYOiEYSzF3xoL8Th/r/fwYNKzKn6N5MEGvd9LQezvnNf5Y5GT8+v
	j1KwNi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPb-00000003EXW-3zHd;
	Thu, 07 May 2026 08:48:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPZ-00000003EVl-3G1X;
	Thu, 07 May 2026 08:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143730; x=1809679730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kZaxAe7GqvE8k6Al143lFuofzhY+cZKHS1Uk0P/PuwQ=;
  b=AC+5N0zYrRbHyh2K3jpUonwpJXCc8Ofk6c3lzRIGdh/4kYsWmUY8r/to
   7jRPMwdGAuaNHK8+o0Ut+N1Fsm2TQCOLBN3qMJ9jh2eb/g1XW94jXdiAy
   2xjUIQXZV0vHe9UOvywRA5LRWLYPYIEFNlK7zmQP6f5jXH4UeHo79au0u
   jTwwAuXzgiEjIzTksS36oq8s5CKt7VfaKF1tIsTL1Un0iDNYLLWkTjMq8
   DiK1ayvODNa1sMxDatxJDyPunKZTdxuQgp4rIGgg6HVkpOx9djaqmOCTD
   Rut5BGWSZNENP3MDEWjU4P4FT2+b6gkgsGhJNM4X2rQ+XRJt7lk1s11f1
   A==;
X-CSE-ConnectionGUID: fLd/3yl7QJG0Akpq1sa2Kw==
X-CSE-MsgGUID: aZr4Z5IkSvWO+pCroOj05Q==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="57163815"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2026 01:48:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 7 May 2026 01:48:48 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:39 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <tytso@mit.edu>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
Date: Thu, 7 May 2026 14:18:03 +0530
Message-ID: <20260507084805.481737-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507084805.481737-1-manikandan.m@microchip.com>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014849_843379_4218BD38 
X-CRM114-Status: GOOD (  15.60  )
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

Add support for microchip sama7d65 SoC I3C HCI master only IP
with additional clock support to enable bulk clock acquisition

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v6:
- Reorder local variable definitions in i3c_hci_probe in descending
  order of line length

Changes in v5:
- Remove HCI_QUIRK_CLK_SUPPORT quirk and call
  devm_clk_bulk_get_all_enabled unconditionally

Changes in v4:
- Remove the clock index variable MCHP_I3C_CLK_IDX

Changes in v3:
- Make use of existing HCI_QUIRK_* code base
- Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
  and system generic clk in bulk

Changes in v2:
- Platform specific changes are integrated in the existing mipi-i3c-hci
  driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
  specific quirk files

 drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..093a85eedfcb 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -969,6 +970,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
 static int i3c_hci_probe(struct platform_device *pdev)
 {
 	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
+	struct clk_bulk_data *clks;
 	struct i3c_hci *hci;
 	int irq, ret;
 
@@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get clocks\n");
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "microchip,sama7d65-i3c-hci",
+	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+			   HCI_QUIRK_RESP_BUF_THLD) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
-- 
2.25.1


