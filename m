Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4C8EB48F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89a03Krz2WgPBmxyubNEI/AG0SeyfV8Q49MHoEG2zP0=; b=R3ti17YKJMiDMUcAWQzmwBLlbl
	ubNkL7e6VP6PS3kkIzP29Tw1JyaFxfil+aIcv4oiObHKtFcenfqGf8VjBSGg/psF1LDnfVyjiWD4Q
	KO6VIkyJN/Iy7UgoPGiHqjZj2kyi/10jv906ZnDPXxnI6kxiUzikTlmvPIz7rkiv8jwnwnsIfglsW
	sB7EDVF5/+ePZuTw94VE+aEpfAYgI4IrRq7mBwxMTKVbXZ4XDOy8SSUTuMVDwsM2hZ11FYf9A4RAQ
	Hj7ociLNhpy9lzFqHw+EnSuh93xvcJTVAnc7TlteTOXh7HO0eEhdbBJZqsgy0fXhC6ZBr9T0rOxVl
	BHD8Ok+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTWd-00000001tHW-2JzD;
	Thu, 12 Feb 2026 10:02:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTWa-00000001tFB-1JPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890535; x=1802426535;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+XSdePmIxMkVcvmbkbSmvnwKwABGab5j+b7WmP5kNz4=;
  b=MFS3Zcfzf2ke4gKxaunwif6Iui8WgF/MxSf+BVFJHJix5hFSeO2OJzSh
   t5kjsxVBSqmWi8LWkIQdoOXQDAocF9KjgR1m52uXbsTPP+9dryQayo862
   bGJeXcuxhVGx/Fz5M8UfCBm2h68kXtNLyA0Lu8IZKolyhIH1p9iFyQs27
   oySi9VrzesLsm2xRC5xiY2fpyF9XCG0C3y1YCgDyaertmRyDRgfL+zGGQ
   OLZTifj1+ZTINy1YquYJnpy06jt/sJxc0Nuac8dYRdmHQ4anFoOTKhE8h
   8lbvj5Y7NF4v/pIkfTqoViz9KEILCkVf/c8NtYFhMo8wKJRXtcqbH7Zho
   A==;
X-CSE-ConnectionGUID: 9SO/Vbq8Qbun3JrOdaYeIg==
X-CSE-MsgGUID: hTJwjBEdSdK+h8m/oRJOZw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="60606622"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2026 03:02:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 12 Feb 2026 03:02:07 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 03:02:04 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 0/4] Update gmac clocks and devicetree for sam9x7 mpu
Date: Thu, 12 Feb 2026 12:01:43 +0200
Message-ID: <20260212100147.5007-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_020216_405170_7B8538F9 
X-CRM114-Status: UNSURE (   8.64  )
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

v1 -> v2:
- Add only one patch for devicetree with detailed description

Mihai Sain (4):
  clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
  clk: at91: sam9x7: Rename macb0_clk to gmac_clk
  clk: at91: sam9x7: Add gmac generic clock entry with ID 24
  ARM: dts: microchip: sam9x7: fix GMAC clock configuration

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.53.0


