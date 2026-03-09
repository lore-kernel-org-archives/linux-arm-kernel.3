Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C0EF36F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlT6LtFoMKT2IyQXHPMBy0hVizcZgf3VLdxPTGw5Vjk=; b=uBf7KtjawkGPog+vYuc8c/AVdh
	1+pD2s8br8z69cONrhr9SAWRU5K271Y3OljnffqFZ1hYDjGpM3mXbgd+mtmMtpqX7hD35jEtqaKqz
	5TBkfM5jw+70QlLcOT2QN2cQY//vjwtWeUXkUcO6j1TuNvArvEFlIilgzCw6tFP5mZmOJ5a9CF+b7
	HoZIcnyPOreMkQALefUWS7w9dYp6rt1Uh9CCld7TQGSWNAisb1Jpj3xJhj3qlBXDxt5dRSgd07UXm
	kEyOeFvhIDaJQYl892xv/IjSP2qj+lDAiiTfpkfIywMDl7C5JU9b65mU0GW20qr3V2ZYvplECAB6s
	OjIeHCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVRc-00000006qNC-0fWP;
	Mon, 09 Mar 2026 07:54:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVRZ-00000006qMG-2b2W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042865; x=1804578865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
  b=W26bRWpSzqTnRo7zUTkxLU6jtBp524YM9H4Aqjzz/3aoAVK9TaiDFvi4
   tja1kDGA0k4WforePg/DbGUj/16BEWl1DRykYksREhmw5TxTErICY7GwI
   UykPbW+nh0l8ToJSmeBK9sy4CD/ywL+wKChJxDAn1C9YfVPHpqCoo2bdc
   M6wmLkJS2Q/+pN3P+yCkK0Tt9SsJn4Pc/9WclAwTnOhQAw2tWYcxq/C6/
   azukZCiM4QOe2hgkCkqqNm1hYRK8D1MpqDgi3IwaRilfgDEDMZexeNoAS
   XNIpa0dRMV4+zfTpc3FTXrT4RkxUIspTAQ1W9SMoJIZ4RrZFe+MBI1aes
   A==;
X-CSE-ConnectionGUID: MQLX6i0wSQyzKKrNx9vzaw==
X-CSE-MsgGUID: a1zaP8o4T+mQSEDjrmPJpA==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="285774736"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:54:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 9 Mar 2026 00:53:53 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:49 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 2/4] clk: at91: sam9x7: Rename macb0_clk to gmac_clk
Date: Mon, 9 Mar 2026 09:53:27 +0200
Message-ID: <20260309075329.1528-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309075329.1528-1-mihai.sain@microchip.com>
References: <20260309075329.1528-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_005425_681022_B37B3042 
X-CRM114-Status: GOOD (  13.35  )
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

Update the peripheral clock name for ID 24 from macb0_clk to gmac_clk
to match the actual GMAC hardware block present on SAM9X7 SoCs.
This aligns the clock naming with the device tree and avoids confusion
with legacy MACB controllers.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 66aadebc51a4..32c082b4ca4b 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -387,7 +387,7 @@ static const struct {
 	{ .n = "dma0_clk",	.id = 20, },
 	{ .n = "uhphs_clk",	.id = 22, },
 	{ .n = "udphs_clk",	.id = 23, },
-	{ .n = "macb0_clk",	.id = 24, },
+	{ .n = "gmac_clk",	.id = 24, },
 	{ .n = "lcd_clk",	.id = 25, },
 	{ .n = "sdmmc1_clk",	.id = 26, },
 	{ .n = "ssc_clk",	.id = 28, },
-- 
2.53.0


