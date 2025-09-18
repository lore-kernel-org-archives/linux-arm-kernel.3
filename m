Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30B0CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGB23x1uvhVVtONJ3cbKAgq6VEG8XJAOyXTGF0jxwIE=; b=S8CiZA56N1jf4Eqbc6V31eL04S
	7cPQ8bmp4G71zl2Hlf9xbqhKaVoxThpBgIhWc1LIx4emW7C+rpmKzrKYAyQ2gzRncZxFAm655zGdM
	srr6RzpNwVpkHslgD1WwOBmMs66TK8NBxnvTCwMec6tukk2rvTq0jqlZLxnYupqPnPg3GfcQ9hqId
	gAgDcsK5OIcbIv+PBgLqdpNO7cZZFcO6yRs6haF9ryeTSr/tkLGWWt22qVhhanvUka3CmGecYGbvx
	mieD4M3zwgNbTQ5KgWwkKKA02fE8YpJ2yDG90mx0AAfdalBtPveCw27srXHMb670b77cC4rZFb1L9
	bXzms2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzO-00000001CDA-0qYU;
	Thu, 18 Sep 2025 21:16:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLzL-00000001CBG-1rlm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758230184; x=1789766184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bAu3PgIQmosp5/ybiTOCAKIVX/WWS61AIso35P5GwqQ=;
  b=Gwa8TESM500UTZSdPEqT3P9HuD6PYBupYOVJBGkmUPs0wl0UEgq6ZALA
   vvDxLIkwIa/Nx+rX5TAGW0WTISPWvF3htL1KqwEA25CPusye1NjviDe1e
   SAgbiPOr+Yg3xeiA2kTZ4zRAnyK/a3D3IeG9WmsLOgA5KJVJ9/nI2tE6i
   yZRXDeC5Reu9nHZ1FhUjoAoPPmPMegtE2NvUaLcMzC4VwQ1mLPY0xfrgp
   yYA8WJ9OYnxJqi1AH4gYfh0V3k7vWZm7LAPpkKjvbbkOVNBQw81h+KXqt
   zFedhtdcmM0d4hAo1mbX7CQF7pwYn6DUkhh9i9AiyesqvcA+Jpo1UujxR
   g==;
X-CSE-ConnectionGUID: 31sRM3ybQuOqhqj3gb2ViA==
X-CSE-MsgGUID: cMqbRIUSRbavarYgWwmabw==
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="278071374"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 14:16:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 14:15:50 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 14:15:50 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 00/31] clk: at91: add support for parent_data and
Date: Thu, 18 Sep 2025 14:15:42 -0700
Message-ID: <cover.1758226719.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141623_708975_E4C4560C 
X-CRM114-Status: GOOD (  17.63  )
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

Changes v3 -> v4:
- Adjusted the AT91_CLK_PD macros to not use the index and use the name
  and HW.
- Adjust the commit message for the sam9x7 to descibe the changes
  better.
- Remove the usage of clock indexes and use of_clk_get_parent_name().
- Adjust commit messages to better describe the changes.

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

Ryan Wanner (3):
  clk: at91: pmc: Move macro to header file
  clk: at91: sam9x75: switch to parent_hw and parent_data
  clk: at91: sama7d65: switch to parent_hw and parent_data

 drivers/clk/at91/at91rm9200.c       |  79 ++++---
 drivers/clk/at91/at91sam9260.c      | 120 ++++++-----
 drivers/clk/at91/at91sam9g45.c      |  73 ++++---
 drivers/clk/at91/at91sam9n12.c      |  90 ++++----
 drivers/clk/at91/at91sam9rl.c       |  49 +++--
 drivers/clk/at91/at91sam9x5.c       | 108 +++++-----
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
 drivers/clk/at91/sam9x7.c           | 315 ++++++++++++++++------------
 drivers/clk/at91/sama5d2.c          | 157 +++++++-------
 drivers/clk/at91/sama5d3.c          | 112 +++++-----
 drivers/clk/at91/sama5d4.c          | 118 ++++++-----
 drivers/clk/at91/sama7d65.c         | 156 +++++++-------
 drivers/clk/at91/sama7g5.c          | 112 +++++-----
 31 files changed, 1124 insertions(+), 848 deletions(-)

-- 
2.43.0


