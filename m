Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B6EC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bo7Ry6mzIWB/qA9ovodl95/Mu0KdFMc1KbU2mZ/UAsw=; b=3RoU1KGcy9c7Ff3Ueo5A7USa6A
	dhGuIR581R2gRymuX+qhXm/N2n5EkZM58mDfVtJ3b2JFaZjThUsWoqW9U84jHFdJeuu95L3lmCIBQ
	bNVhtzkxFpLzCwRlgLlIu9HStAkWUbvdI7+vtTVybs3oCfEJQmjr1JQRV/7kbvoaK2zAIoTm4zLGj
	g7aH/9Y7sC60WPflVvIinifriqcu8gyhbkUwDR+MEiNZgxLkbSTNclP5WMFUwhPXv2/WULDKzwfoK
	JeaNRQJ/ahgDi0FFxoVu2wziHvRc1mIO54O/X7f8ntd7a7w2yi2e3OPp7wPsNzISl1u8K1pDWB3Bl
	vSjsUZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77t-00000007I9K-126P;
	Thu, 06 Feb 2025 19:01:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Pr-000000078OM-19Oq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738865755; x=1770401755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SKD2TenQ+bwI8i63TXBEgYe65VNMUMjWKYtu7WqmTuM=;
  b=XnEfbRHYzrshIkamYq9EdFFXHS1e/rJadJAZI2+CEqKPHRIryaYiuzln
   FPWYWJL+tqCmqfmte4Ks3BaL+ondBDPXFSTpZOC+AAYXtwgNJlUsabWws
   TZ6rSBwP6U1/LAezHTXg+oxCTAJzMhBhzCRjBXuMaVbaq0unGdAlKkkDn
   3lEa673GgG8Iilzk9ETA/OzGjspDCt9kQHJe+TVOXo5bhnG+CMk3fUAso
   vwuzs/uWoV5x9J0IQK+y9vU91oi0ufV0L7GpMwgqpmqTa6tBz+r6+3STN
   qVvSEFu6W3K5g5qXHfpa2zcNzJxHjhhzLrBSVoBQkjZKN66bzMaUT8gaW
   Q==;
X-CSE-ConnectionGUID: RUzZ0s40Rb2+hOFS2V1Qww==
X-CSE-MsgGUID: mtkiLefeRM2SZn7B6gED8w==
X-IronPort-AV: E=Sophos;i="6.13,264,1732604400"; 
   d="scan'208";a="36973012"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Feb 2025 11:15:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Feb 2025 11:15:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Feb 2025 11:15:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mripard@kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 0/2] AT91 Clock Adjustments
Date: Thu, 6 Feb 2025 11:14:41 -0700
Message-ID: <cover.1738864727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101555_378266_1A024750 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This set has clock system adjustments for the AT91 clock system.

The first is to adjust the slow clock driver to account for the updated
DT node-naming for clocks and xtals and ensuring the driver is still
backwards compatible.

The second is a adding a missing clk_hw struct that is not added into
parent_data struct causing a incorrect parent for main_osc.

Ryan Wanner (2):
  clk: at91: sckc: Fix parent_data struct for slow osc
  clk: at91: sama7d65: Add missing clk_hw to parent_data

 drivers/clk/at91/sama7d65.c |  1 +
 drivers/clk/at91/sckc.c     | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.43.0


