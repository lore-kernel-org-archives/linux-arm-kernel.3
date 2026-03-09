Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D392EF36F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kIFwjD4GwsnzNGdOG/mwijpxCKJChD6AnBK5cOib7wA=; b=JbGYnM+v9q8ByYa5rtGotjwh/q
	w1HaXt1RX7l6UCtGH5ytpH0/u8B30bDFSYfoyxYwa76KRDDwpnH1LOJDw76B0Fp4iR+Lb5B7c0TPn
	YRr+eszJujZv9J+BuGco7i1yHkdijVxbwXKj3m5llf+TEU6IAKJoGCtzX6M+W0DUN7FrEden8prNl
	3wXhn5i/lOqyv2jw3zvzXWoyy4xeaixgeVWDF5yTOL3L7PCcSpvxtzXb8XFG5B6tHYEjTHektAnCa
	Eg3OmQSRZi9pfmrDm6m6Jx4Wlz/J1oe6h6NsCY4n5VdND5C64uoVDQYE+1dY5ZXMgLT4pMgYUzA/D
	s9WtTIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVRA-00000006qHH-2BxY;
	Mon, 09 Mar 2026 07:54:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVR8-00000006qGh-0W3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042838; x=1804578838;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QntaU4iicWXzgHMvjcDEMFDc8eb5pgaNlUYW7f+yomU=;
  b=q/dGZosmjSa6lFq3kiTONs85K/QZvtrAusQ2LpJadU53ewwYbZpXgECI
   8XtGuP50xuKGuqugW00pKx3ozqh2wPt+hDSQIsieXvzlCqDMNS4X7xu3z
   KM6qsDiFEKhFqKqKhczWjMcNDvbVkjU3KzLSQx10636V6ZP476v5cVJ76
   c9Toc+gHjStx4bYnboQxSeD+f1IU4yopLwQxeXMGlz+Rj99S0EO5vrGA1
   U9mL8GqpZvVc43EE2U2A9kkrH9FShxu373J0+V/6GYnMiNSSAFu6q8lZ/
   +nWDS0H9HcXnN6J1qFYCcXEcUnkUJWsAy8xupJgDMQVzSGjUYEi84sKrD
   w==;
X-CSE-ConnectionGUID: u8JTaPxxQWWCViC89H2kCA==
X-CSE-MsgGUID: PkjVoswoS9OuKpH23vt/kQ==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="54818266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2026 00:53:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Mar 2026 00:53:45 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:42 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 0/4] Update gmac clocks and devicetree for sam9x7 mpu
Date: Mon, 9 Mar 2026 09:53:25 +0200
Message-ID: <20260309075329.1528-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_005358_332393_4A57BB79 
X-CRM114-Status: UNSURE (   9.05  )
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

Changelog:

v2 -> v3:
- Rework patch 1 and 3 based on Claudiu's comments

v1 -> v2:
- Add only one patch for devicetree with detailed description

Mihai Sain (4):
  clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
  clk: at91: sam9x7: Rename macb0_clk to gmac_clk
  clk: at91: sam9x7: Fix gmac_gclk clock definition
  ARM: dts: microchip: sam9x7: fix GMAC clock configuration

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.53.0


