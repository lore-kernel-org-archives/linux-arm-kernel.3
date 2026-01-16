Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36986C98304
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nDe6DlhUZ99UcxFZkHLhE+7JONs+24VJVFtKR1JEekI=; b=ZqkoMxmR2+15UsPDzNarW326AU
	Gu7E1znBqzRskXD9CHzjp0mER3sV4RaivOvt1gw2NTdHqh3tWbeJNt8xQtZiQ9prvTWYB6uf0z/Ky
	h/mBlay65uRW1jKUtiA4OHA4S0EB0QqnZNSNeHw1O3FLV3U/1gni6kylVDAmTKjqf6ZipihUf0Kw0
	YB655yfzKjoJL+9jQ1dRfCZrg9LVIlFb3sQwbnfGN30NP3I/nr9FZ+HiT/qba9vUAZa4inTaMojIY
	yDtrG28kb9BS5colmeVLfRQtJ9jaZJmX3uawyvV/wR9DmMecyHRbeER0N2VximCc1HnEq9N8X/fyl
	bN2Dc6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6X-0000000Ek5j-0GvJ;
	Fri, 16 Jan 2026 20:07:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6P-0000000Ejy3-0vXM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594045; x=1800130045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Un8zLv2FoiIl5H2AOAWw2PcOrYODM0MvdE9ONc7dFAw=;
  b=sQu/2J5Eprg0nx22j2Vik++X+BMMTeF41v6b6CKn9J3HgT2x1HDHVpdI
   xbK3MEZ1PFeJtNYbdLlYyXXCqYrki19S1m2ZBJ6xopDPWus9JdM8PBuAG
   iRsBpXfUAxzPDqx2ID2wCP0Nps5C+oGg/bdvlbldm0cpjMyLTeKtePM6J
   UXyIczYVSCy6nVoxHqeUTCjpUGbOKQ2UvycT9DrDUKU0Kaqa9dVGjvJaM
   kBOzTc3dli3PPOeqnhu+uumi9w7owp9R8ExV8vQ9rGL+Tam8Kay62XOJk
   Y5pMRqhhrhVPgm2qxLGgLzQCSGTtnRlGGeeZoj8JfJsm0UyA4/pNQd2Va
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: lGprxQS5S6i7v0+fJcCNYw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042226"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:03 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:03 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <ryan.wanner@microchip.com>
Subject: [PATCH v5 00/31] clk: at91: add support for parent_data and
Date: Fri, 16 Jan 2026 13:06:53 -0700
Message-ID: <cover.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120725_269695_CB4562EE 
X-CRM114-Status: GOOD (  18.47  )
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

From: Ryan Wanner <ryan.wanner@microchip.com>

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

Changes v3 -> v4:
- Adjusted the AT91_CLK_PD macros to not use the index and use the name
  and HW.
- Adjust the commit message for the sam9x7 to descibe the changes
  better.
- Remove the usage of clock indexes and use of_clk_get_parent_name().
- Adjust commit messages to better describe the changes.

Changes v4 -> v5:
- Update commit messages to make them more clear.
- Correct formatting issues.
- Remove unnecessary parent_data parameters.
- Remove the incorrect change to the xtal naming.
- Keep the check for the different naming of slow clock.

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
  clk: at91: clk-plldiv: add support for parent_data
  clk: at91: clk-h32mx: add support for parent_data
  clk: at91: clk-i2s-mux: add support for parent_data
  clk: at91: clk-smd: add support for clk_parent_data
  clk: at91: clk-slow: add support for parent_data
  clk: at91: dt-compat: switch to parent_hw and parent_data
  clk: at91: sam9x60: switch to parent_hw and parent_data
  clk: at91: sama5d2: switch to parent_hw and parent_data
  clk: at91: sama5d3: switch to parent_data and parent_hw
  clk: at91: sama5d4: switch to parent_data and parent_hw
  clk: at91: at91sam9x5: switch to parent_data and parent_hw
  clk: at91: at91rm9200: switch to parent_hw and parent_data
  clk: at91: at91sam9260: switch to parent_hw and parent_data
  clk: at91: at91sam9g45: switch to parent_data and parent_hw
  clk: at91: at91sam9n12: switch to parent_hw and parent_data
  clk: at91: at91sam9rl: switch to clk_parent_data

Ryan Wanner (3):
  clk: at91: pmc: Move macro to header file
  clk: at91: sam9x75: switch to parent_hw and parent_data
  clk: at91: sama7d65: switch system clocks to parent_hw and parent_data

 drivers/clk/at91/at91rm9200.c       |  79 ++++---
 drivers/clk/at91/at91sam9260.c      | 119 +++++-----
 drivers/clk/at91/at91sam9g45.c      |  73 ++++---
 drivers/clk/at91/at91sam9n12.c      |  90 ++++----
 drivers/clk/at91/at91sam9rl.c       |  49 +++--
 drivers/clk/at91/at91sam9x5.c       | 106 +++++----
 drivers/clk/at91/clk-audio-pll.c    |  28 ++-
 drivers/clk/at91/clk-generated.c    |   8 +-
 drivers/clk/at91/clk-h32mx.c        |  11 +-
 drivers/clk/at91/clk-i2s-mux.c      |   6 +-
 drivers/clk/at91/clk-main.c         |  16 +-
 drivers/clk/at91/clk-master.c       |  24 +--
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
 drivers/clk/at91/dt-compat.c        |  80 ++++---
 drivers/clk/at91/pmc.h              |  68 +++---
 drivers/clk/at91/sam9x60.c          | 101 +++++----
 drivers/clk/at91/sam9x7.c           | 323 ++++++++++++++++------------
 drivers/clk/at91/sama5d2.c          | 153 +++++++------
 drivers/clk/at91/sama5d3.c          | 104 +++++----
 drivers/clk/at91/sama5d4.c          | 112 +++++-----
 drivers/clk/at91/sama7d65.c         | 155 +++++++------
 drivers/clk/at91/sama7g5.c          | 111 +++++-----
 31 files changed, 1115 insertions(+), 842 deletions(-)

-- 
2.43.0


