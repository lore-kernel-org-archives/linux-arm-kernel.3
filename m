Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+FBOfRqqWTe0v+4MSdrEhF6Hays6kDuw7fm6xqCZT0=; b=A3fxVrqFB4L8dhahEhOP0NLncp
	LTM23nzJsq22QuqtyYtYGasXV8GntBlNzljMpM5Fuyd/qssNV/fcp9U1Ki5dhsXrvzk25b7GKr0sW
	vRal2nmvi746WNAb6XeLEcCZ6OIBhK8o0CRgqSVczEW2gsxGj5C3Bta5u+XcJ7BVIebF8V4vjNl/O
	ZtrDt0hLWUxnO2zEdznvWQ0RYryL5vh6etMhuvQSN6O5f6Vt2CbY7P6rjHtWgs5LTp9Am/KfScUWc
	hapuYSbANEzyBYpcZFpqQppYrhI/4QjQJ8PF82ze9ZrliTtqTJbnOfLrqq6Y3+3m1kXqGZb9VR+YU
	L5WFyuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzX8-0000000D8WM-0n7p;
	Thu, 10 Jul 2025 22:14:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYk-0000000Ct48-0L0a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N+FBOfRqqWTe0v+4MSdrEhF6Hays6kDuw7fm6xqCZT0=; b=L/cSlwNvRhTYLySKTbuN8OJkny
	M8nbUiuZ7YSx3k/z7MkinpjGR7+dj5PmBdd5zwHns+6EWJ0U7tok5nDjqg6/bXVry7vMI6OdZKKAf
	voHNWJpUg+dCsZWzAWlNmqpycUKkzCu00/4HPjSYslz2Tu325JYXCFk1iaXr8aQZw36PJ+aHepRnU
	pq/U/g4nj7oOIcXjmJtSB7AAo76Vnf5SP/qEHuL9c5/PH1kzyCi1Tj36GlwG062k3ftpe1CPEgpNp
	udMg7DD6i0oayD0Q35QkT/TImW6yu1lTCSiium5RiN7bgA0hy1TkedkokAsrVouGDiVwrCrXaNvXf
	DuPmgoLQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYf-000000098p4-37cA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178073; x=1783714073;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ynLEXTV9etWCmaTp9hJxD+i62WVpqyZqxsuR5myYfmY=;
  b=kH4kN82K5VxVaVhTp0RlaeYTi2xQMiObnabN/pVd11IPtm2R2aUmHpuQ
   nIexPnyLtHb7SLCbi0fo+mwXkX3dGsN4j9/Y4uqiRZ6Ng7KrpyakUUdqN
   DbTpa25QQZW+hxS/Ba+HpAnJe1gcfvjKwv0XUpts1/RRZc1XUW8mrbxmJ
   02Me5kYKPzVC0o50vPA9dpY4O5tB9pEveOuWMDvQ4Io9hLQiENhEJj16g
   igcpzxZoDxMlyB5mxUYvIyXT1exVZufWwNNDpGAon+MkSw9XL6T4e6LYa
   A4AmNFEViI5xh47WRQHp/tIyueqWYPbXUgzhGfwh2A42w8EoMvnwZ7ukO
   A==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: VK/4oCWZTe2MmqdZJVcdvw==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448155"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:30 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:30 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 00/32] clk: at91: add support for parent_data and
Date: Thu, 10 Jul 2025 13:06:53 -0700
Message-ID: <cover.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210754_479225_477AB474 
X-CRM114-Status: GOOD (  15.48  )
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

Changes v2 -> v3:
- Adjust each patch so they are fully atomic.
- Add a patch to have the SAMA7D65 systemclocks use parent_data and
  parent_hw.
- Add a formatting cleanup patch for the SAM9X75.
- Adjust commit messages that no longer show invalid information.


1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/


Claudiu Beznea (28):
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

Ryan Wanner (4):
  clk: at91: pmc: Move macro to header file
  clk: at91: sam9x75: switch to parent_hw and parent_data
  clk: at91: sama7d65: switch to parent_hw and parent_data
  clk: at91: sam9x7: Clean up formatting

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
 drivers/clk/at91/sam9x7.c           | 328 ++++++++++++++++------------
 drivers/clk/at91/sama5d2.c          | 168 +++++++-------
 drivers/clk/at91/sama5d3.c          | 122 ++++++-----
 drivers/clk/at91/sama5d4.c          | 129 +++++------
 drivers/clk/at91/sama7d65.c         | 156 ++++++-------
 drivers/clk/at91/sama7g5.c          | 111 +++++-----
 31 files changed, 1134 insertions(+), 991 deletions(-)

-- 
2.43.0


