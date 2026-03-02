Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC65EA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlT6LtFoMKT2IyQXHPMBy0hVizcZgf3VLdxPTGw5Vjk=; b=PS31H1DOJJykzP9i0odUbTm8QD
	iS+exjrGI7Weel2nT/q5p5kar6uy8MU6LA7JapoZKp2K7NceCAzkrrc7mgT6OvQR2+Km41S9gu+F3
	Mxv2YLUkc6m6M9Y4Ocn8uv6wS5iDF6VEbRo/0W/9UfHB/dAwThBsrWM5g1kKX4Pgo2eRnzyfkYIvU
	nE0BV9jfYR981MdtIBtX3DdpzK7FPLLS6ZH/5pbSAN/QFRAbt0y16oYswQv7QvZy2m9GBJae/Uipd
	894FN4l1MV/cvoX7o97FKUatFzr5BGqGEK2LhZ28SGaMuhls+hR+LW/CCqlDJgMS+9COSMFK/uw83
	vY6Yr4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48t-0000000DDhA-2PCA;
	Mon, 02 Mar 2026 14:21:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx48q-0000000DDes-0YNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461260; x=1803997260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF17STSmbvctX89fLvoNysQ2fmO08+e+Vz1+yaw54WQ=;
  b=w9i4+amAjQf14v4JR1/zrwL9+rRFcPQ9XDxhpMxzwds22crBULM7R6hg
   S0tIANbLKp5tHp1cEtnFKg036OTEfU7xi8JEkTzO81OrD0PJ7Hj9ZJ9E4
   bzXuJ2+pHWsgGdWcQTbFPIuGrrgSETXaxK/iXKG0pcXcJxh7NudoEfgDq
   4oIaSZhyWsQok1LaY6tQ+/N/aJRMQAaSrBgVwTpsrWole0GwimTJS+48s
   qPZ5KSv+VUPxBUAUnd+X63RwIXYyWhxQ+PGfCIItu0SEPGG22pljcZEZE
   TiAWIhCHYPttyCI/ooXxF35YQFhGPwO2nhYNQMyiUQcJI4NWGsGWdPwcl
   Q==;
X-CSE-ConnectionGUID: QKICduWAQ5ynFNkWd4cNxQ==
X-CSE-MsgGUID: /DLabcaGQkCQ3gmxXwN0Pg==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="221349854"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:20:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 07:20:25 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:21 -0700
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
Date: Mon, 2 Mar 2026 16:20:06 +0200
Message-ID: <20260302142008.3253-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_062100_231886_B123AD4F 
X-CRM114-Status: GOOD (  13.34  )
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


