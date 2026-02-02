Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE85E73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0puImds2Xyr4SRifSyMNH36CSpOJGKLxVMKRHwyWA4=; b=0zpcm9cJigwS00dtu4nlFeBpzR
	zlC0B8tjk/5dAqfVlMhHH8JKoqWAs7VJfUID2AIMQ9g+V8hVUG1oGUaGwePpzppXHdsDJB2QY8i75
	HqteDrzc/qX2v/yfxo900VR6a/fR30l3haistmR+If6fz3MgxE+/PhIK1nIiYRAoARmd/OM3vGGvV
	ZoDOQuUUGMwtfwXWK4LDZQ8kLhwNM29fJwEp+pjmkvRWe/59B72BGlZdcObeDR9q1S2C32dKlRHjC
	dlDv2M4OctUbXFBFx+5fUjxYfN/bSB9uXh+YlhSM/0FEjbyMC8ZTnaQ4FDh+oEWPIjZca0ZHk6SNp
	c60x4mZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMx-00000004q9M-2rMP;
	Mon, 02 Feb 2026 10:41:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrMu-00000004q6V-08pa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770028878; x=1801564878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+QWneqm1Q/Y2a3cTEPQgF9g6VaX9xp5QUX4JxM6PcQ0=;
  b=0DxvdLG1g/ndNk65bEsTq9Pa75/9lr1rMdYHK7Lp2W7K2/cmPNgJXdtr
   Fcp4uyKnjD0/2f7oCJoaSGxUe0WKzqWLgKEFWiQFlhhTg/+ZHVOWV49Bu
   gTsnrDEAkqm+VDE0WULowj693a7rLG+BzBu4DDyGZRuSBzXt5G3kiE4qQ
   4WmnYJo8k1uIRZXGnApaW3CCwXWyN5jzphs5akMmVdB+870jUES6IJV4r
   5nYcoNaHHsyx1RaPRY9uCv/C2oclCeTRV5rVD1OuQFisB6adAOmpuUKo+
   gSVfqAe1r9sls32HQHtPs4pPD8QrehhZ9yXXSzFo0/XP8iENEn82ry/MW
   Q==;
X-CSE-ConnectionGUID: 2J4f9FGyT5aY3iXJDJsmSA==
X-CSE-MsgGUID: nRUCAZQdTA6d9YeaU+9MPw==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="220077085"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:41:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Feb 2026 03:40:37 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:34 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/5] Update gmac clocks and devicetree for sam9x7 mpu
Date: Mon, 2 Feb 2026 12:40:20 +0200
Message-ID: <20260202104025.3781-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024120_138964_680E0C95 
X-CRM114-Status: UNSURE (   7.54  )
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

This series updates the GMAC clock configuration for the
SAM9X7 family. The current clock definitions contain inconsistencies
around the GMAC peripheral and its associated generic clock IDs, which
lead to incorrect wiring in both the clock driver and the devicetree.

Mihai Sain (5):
  clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
  clk: at91: sam9x7: Rename macb0_clk to gmac_clk
  clk: at91: sam9x7: Add gmac generic clock entry with ID 24
  ARM: dts: microchip: sam9x7: Remove the tx_clk from gmac node
  ARM: dts: microchip: sam9x7: Update the tsu_clk to use the generic clock with ID 24

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.52.0


