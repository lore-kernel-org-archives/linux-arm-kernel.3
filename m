Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D4CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KymA8+qhuivqlmvHWy7Edwa9JHvf1YvMfDNIwxvE2L4=; b=tAFSiGsfI3WMCIdf5PajREMMoa
	BPVGNXwIMmIjpd2J0bermIA3RogMF8T+PKVgJI+Cpxb2C3ZtsxgE3Y7tOxa8L1NJ2JONLaBFva1PM
	IqdMM7KOxuOfcN9UD2f9Tr2AqlM0LYSHBomtsp0Ap2yN2ysKtHaXBqpa7TewXRkD8egLxX+6tKFPf
	AxHb30COBjryibMAMciffmT1fxN6IxYOyXZ0yuHjiaFFS17hD8iQ2V+v7pXpzQ0p2XruKAUWT8r1y
	U4cmFV29c2EzGAxMWVna311EhBeYliGZIXYCKXJuQF1/VawKQX+uJz/NR8rzl8IyJA97S7vRw+zs6
	8Dkayg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQhi-000000077UD-2EvH;
	Tue, 16 Sep 2025 08:06:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQhf-000000077Tl-1Oo6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758009980; x=1789545980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2HvgqnCWu6vD9o+dQNKrpVQGiN92X+M5lXcfuTr3M5k=;
  b=PTKaJdoIA53sEZsgIpxaaCchAy6W9avLw/B2UR1h2KybD09Aa0KXxNy2
   IEK5wcrvfMv4aQvvY5tSaZHQjazRm0LRQ7iDOOXIZ1dRHEVp3dqqZYNSM
   FNMskL57GkXhvogktbPQ6XpHqqzqzSx2Yqro6txmosyf6w2ZUgnffL7WO
   Sbrk38Wa7RswnLHkceUoHqmRflIoBjwy2rU2q9mYqR6y+ORMAszQpIR/D
   vpLFwUc3xEz1Wi3nZk2cO0kWBygiTucIq/RZmEyOfJrrOPsmUbzFBtz7d
   j89mzaAegy2UTqU6sFwZPbrByBhzccCfh18zzCj0Q+ul8W+4NvSo01Xs0
   Q==;
X-CSE-ConnectionGUID: IlaZyL1DRjGitiwYikcNJw==
X-CSE-MsgGUID: oPT62oZvQfyTdsjTrtimDA==
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="46559090"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 01:06:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 01:06:02 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 01:06:00 -0700
From: <nicolas.ferre@microchip.com>
To: <sboyd@kernel.org>, <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: microchip: clk for 6.18 #1
Date: Tue, 16 Sep 2025 10:05:44 +0200
Message-ID: <20250916080545.9310-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_010619_891298_3B3E498B 
X-CRM114-Status: GOOD (  10.75  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Dear clock maintainers,

Here are the first clk changes for 6.18.
I don't think they have conflict with changes for the deprecated round_rate()
to determine_rate() topic.
They are in linux-next for a couple of days.

Please pull. Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.18

for you to fetch changes up to e3130c2a9a0c8e549e044e659be6f762a1b1f725:

  ARM: at91: remove default values for PMC_PLL_ACR (2025-09-15 16:24:25 +0200)

----------------------------------------------------------------
Microchip clock updates for v6.18

This update includes:
- add one clock for sam9x75
- new meaning for MCR register field in clk-master
- use force-write to PLL update register to ensure
  reliable programming sequence
- update Analog Control Register (ACR) management to accommodate
  differences across SoCs

----------------------------------------------------------------
Balamanikandan Gunasundar (1):
      clk: at91: sam9x7: Add peripheral clock id for pmecc

Cristian Birsan (2):
      clk: at91: add ACR in all PLL settings
      ARM: at91: remove default values for PMC_PLL_ACR

Nicolas Ferre (1):
      clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register

Ryan Wanner (1):
      clk: at91: clk-master: Add check for divide by 3

 drivers/clk/at91/clk-master.c      |  3 ++
 drivers/clk/at91/clk-sam9x60-pll.c | 82 +++++++++++++++++------------------
 drivers/clk/at91/pmc.h             |  1 +
 drivers/clk/at91/sam9x60.c         |  2 +
 drivers/clk/at91/sam9x7.c          |  6 +++
 drivers/clk/at91/sama7d65.c        |  4 ++
 drivers/clk/at91/sama7g5.c         |  2 +
 include/linux/clk/at91_pmc.h       |  2 -
 8 files changed, 59 insertions(+), 43 deletions(-)

-- 
Nicolas Ferre

