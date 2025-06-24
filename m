Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C72DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3CniGxxsvmkkoSAA/ViK2WcxzzKIsYds4QMQtIyU6A=; b=f/YCAvlDmgNkhUvQAkEGSVlx//
	zNwtRB1qEa2hO/HDlp2d9XK+qnHVqmaDltiR3q6/osvRWoTdQBBzvijEv/OCaeyexM4yLZPGxcrND
	6HVLV68/CKjxtqu6+VvMc6bw5YntchtM/AZYSpMXN/Pcd6TgvVfb7WrMzkLmYNu4rpukgcTFxyJK6
	nUYYEhtROwa/rtxNglSv6p4Rzf6jx0B/BId2+yBNMLUc55hPYl/88rAvlG4kzUrLnoYK98socKf8t
	LjmOA4S6swwbfoG+9uO5a2TFO19nmTf+LV4XoWGbQ2jZ2gzsjvijLiFVn3HOlwvyrz2+pJLcGx5F7
	X0x5VqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8XV-00000006Wk0-1dzg;
	Tue, 24 Jun 2025 18:38:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5GO-000000062U6-2RZQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750777724; x=1782313724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U9oBpf5k/2VA8D3h5A5m5gaTWpXc8Aart4fOHM4laT8=;
  b=XAuxEEi/d2F+NJvU2aaqiQPYkXutI/FIrTcQ1mytOYEgjzF9hV8IzRlt
   79KF6TaakS+8MG+EhWZgK56cXDxG8zFXuMmKBDYC2dzvD5qcZVAJZgNWN
   pZXXwmPOuOId+0xXK91kEY7e5I2WBt9aErxjAJASgQzNt1Y/dPXoIaFH1
   fGOnB8aVEqk+9WZZn7eueojZlDyv7D7b7zWl8Gj5YZFsg5z8FiV7RhU9h
   3ZRjgeqPHg/m8JVScfx1vFqO5ZFnMX1J6Va4mqACSeKrg7w4LwI4LfGAQ
   uGT+eM3B5t28qZCbEtdcBiJItpx07ZJFHR+nRW9CpjVLBeH9I/2sJYfh+
   Q==;
X-CSE-ConnectionGUID: 4+RzxTN1Qsa6vG3Bpty4nA==
X-CSE-MsgGUID: ITLVdiLFT6OeW9wi0pYzVQ==
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="42688166"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 08:08:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 08:08:36 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 08:08:35 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 00/32] clk: at91: add support for parent_data and
Date: Tue, 24 Jun 2025 08:07:57 -0700
Message-ID: <cover.1750182562.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080844_769476_97BDD97C 
X-CRM114-Status: GOOD (  14.71  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This series adds support for parent data and parent _hw on the at91
clock drivers. This also updates all the SoC specific clock drivers to
use this format as well.

This is a continuation of the V1 of this series here [1].

This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
SoCs.

Changes v1 -> V2:
- Remove all the small sama7g54 SoC driver changes and put them in their
  own patch.
- Add the SAMA7D65 and the SAM9X75 to this update.
- Add a patch to move all common used macros into the pmc.h file.
- Update changes from v6.6 to v6.16.
- Remove patches that where style fixes and include those in the update.

1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/


Claudiu Beznea (29):
  clk: at91: pmc: add macros for clk_parent_data
  clk: at91: clk-sam9x60-pll: use clk_parent_data
  clk: at91: clk-peripheral: switch to clk_parent_data
  clk: at91: clk-main: switch to clk parent data
  clk: at91: clk-utmi: use clk_parent_data
  clk: at91: clk-master: use clk_parent_data
  clk: at91: clk-programmable: use clk_parent_data
  clk: at91: clk-generated: use clk_parent_data
  clk: at91: clk-usb: add support for clk_parent_data
  clk: at91: clk-system: use clk_parent_data
  clk: at91: clk-pll: add support for parent_hw
  clk: at91: clk-audio-pll: add support for parent_hw
  clk: at91: clk-plldiv: add support for parent_hw
  clk: at91: clk-h32mx: add support for parent_hw
  clk: at91: clk-i2s-mux: add support for parent_hw
  clk: at91: clk-smd: add support for clk_parent_data
  clk: at91: clk-slow: add support for parent_hw
  clk: at91: dt-compat: switch to parent_hw and parent_data
  clk: at91: sam9x60: switch to parent_hw and parent_data
  clk: at91: sama5d2: switch to parent_hw and parent_data
  clk: at91: sama5d3: switch to parent_hw and parent_data
  clk: at91: sama5d4: switch to parent_hw and parent_data
  clk: at91: at91sam9x5: switch to parent_hw and parent_data
  clk: at91: at91rm9200: switch to parent_hw and parent_data
  clk: at91: at91sam9260: switch to parent_hw and parent_data
  clk: at91: at91sam9g45: switch to parent_hw and parent_data
  clk: at91: at91sam9n12: switch to parent_hw and parent_data
  clk: at91: at91sam9rl: switch to clk_parent_data
  clk: at91: sama7g5: switch to clk_parent_data

Ryan Wanner (3):
  clk: at91: pmc: Move macro to header file
  clk: at91: sam9x75: switch to parent_hw and parent_data
  clk: at91: sama7d65: switch to clk_parent_data

 drivers/clk/at91/at91rm9200.c       |  95 ++++----
 drivers/clk/at91/at91sam9260.c      | 136 ++++++------
 drivers/clk/at91/at91sam9g45.c      |  89 ++++----
 drivers/clk/at91/at91sam9n12.c      | 106 ++++-----
 drivers/clk/at91/at91sam9rl.c       |  63 +++---
 drivers/clk/at91/at91sam9x5.c       | 125 ++++++-----
 drivers/clk/at91/clk-audio-pll.c    |  28 ++-
 drivers/clk/at91/clk-generated.c    |   8 +-
 drivers/clk/at91/clk-h32mx.c        |  11 +-
 drivers/clk/at91/clk-i2s-mux.c      |   6 +-
 drivers/clk/at91/clk-main.c         |  16 +-
 drivers/clk/at91/clk-master.c       |  24 +-
 drivers/clk/at91/clk-peripheral.c   |  16 +-
 drivers/clk/at91/clk-pll.c          |   9 +-
 drivers/clk/at91/clk-plldiv.c       |  11 +-
 drivers/clk/at91/clk-programmable.c |   8 +-
 drivers/clk/at91/clk-sam9x60-pll.c  |  14 +-
 drivers/clk/at91/clk-slow.c         |   8 +-
 drivers/clk/at91/clk-smd.c          |  10 +-
 drivers/clk/at91/clk-system.c       |   8 +-
 drivers/clk/at91/clk-usb.c          |  41 ++--
 drivers/clk/at91/clk-utmi.c         |  16 +-
 drivers/clk/at91/dt-compat.c        |  80 +++++--
 drivers/clk/at91/pmc.h              |  66 +++---
 drivers/clk/at91/sam9x60.c          | 117 +++++-----
 drivers/clk/at91/sam9x7.c           | 330 ++++++++++++++++------------
 drivers/clk/at91/sama5d2.c          | 168 +++++++-------
 drivers/clk/at91/sama5d3.c          | 122 +++++-----
 drivers/clk/at91/sama5d4.c          | 129 +++++------
 drivers/clk/at91/sama7d65.c         | 116 +++++-----
 drivers/clk/at91/sama7g5.c          | 111 +++++-----
 31 files changed, 1110 insertions(+), 977 deletions(-)

-- 
2.43.0


