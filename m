Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B69CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2LfQHmTz/gIk7TdBkiuV/KAlqRI6jbaNC88xtoz3GBE=; b=mcBarcsWqQh3GacggY+vlSYieM
	GkdRBaeFRa5vRWBtqhyKW1LyUUIgUoYaSfIhYGiijFuciI1F3HrT48dWBlx4LA0Ct11fTyJdADOOG
	F+2LIzBBUUev3fhvnW7kGgVNsSDCqmKpus8wJZjTmtH4PTfhmx9X0cL4bHz1GR0EtPfSfWRnuLoxq
	xEAdVAcptBivc7IQQj/fQk6R6CVStU5EbIwcykR0TX9p7FvzSOh6Rw9MPkssNn3gXJqI2Iy2UGVIG
	AD/fTSu1xilJkobdLfXv32Eo4DZhSzMr9gdeeB79DDy8xVUdH/6eueAuKZeyQhccalg8KYSGm3Fm9
	CZoVno6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUv9-00000002Dlz-1elJ;
	Wed, 22 Oct 2025 09:14:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUv6-00000002Dka-2gcD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1761124452; x=1792660452;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qcS+K1bmBeQE86BuzfqFQqSfV1A2G1hZGYBYEBDMwck=;
  b=FJsB+o9y08D1dHU4jwmvQzptri5XTo1tyObo+pA0ZliAexyilfCKNqg/
   CIFB7vK73CmaaGwfJu5d2/87i9Xfh40DqpsMu5J/Aw1LBFAMUyCvdIkgv
   oRqIsSAKZ0LzbXDvcLFF5h7RitviHSb0ZRe2y78lPFOLBxIla9M/DiDzQ
   UU9sfYK/zdm5BBusISdbc875RRORHrWTXjxVruipz/hAPfPHHudLbcv6W
   ULdK/TM9sv0BO73UU76jkJgRWJ8ToQyivPobtM+Ayy2nftewgoYt1D9aw
   tr0lmjslhHveuUtQW0oshpb0oshCCuoKMWOQPyokLMm3wvcic5IhYFzUA
   g==;
X-CSE-ConnectionGUID: sQh31e/WR3uMWyklH0AEwg==
X-CSE-MsgGUID: dmOl+ZzSSDafFvA0GS/R0A==
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="48111526"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Oct 2025 02:14:11 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 22 Oct 2025 02:13:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.27; Wed, 22 Oct 2025 02:13:51 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 22 Oct 2025 02:13:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, <dharma.b@microchip.com>
Subject: [PATCH v2 RESEND 0/3] Add LVDS display support and PLL handling
Date: Wed, 22 Oct 2025 14:43:48 +0530
Message-ID: <20251022091351.472331-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_021412_890297_18B2DB45 
X-CRM114-Status: GOOD (  10.77  )
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

Hi all,

This patch series adds LVDS display support for the Atmel HLCDC driver
and introduces proper handling of the LVDS PLL clock required for such
panels.

The Atmel XLCDC IP supports multiple output types — Parallel RGB, MIPI
DSI, and LVDS. While the existing implementation handles RGB and MIPI
displays using the LCD generic clock (sys_clk), LVDS panels require the
dedicated LVDS PLL clock (lvds_pll_clk).Configuring the LVDS PLL clock
rate automatically based on the panel pixel clock, eliminates the need
for assigned-clock-rates entries in the device tree

Change logs are mentioned in individual patches

Dharma Balasubiramani (2):
  drm: atmel-hlcdc: add support for LVDS encoder type
  drm: atmel-hlcdc: set LVDS PLL clock rate for LVDS Displays

Manikandan Muralidharan (1):
  mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 86 +++++++++++++++++--
 drivers/mfd/atmel-hlcdc.c                     | 16 +++-
 include/linux/mfd/atmel-hlcdc.h               |  1 +
 3 files changed, 95 insertions(+), 8 deletions(-)


base-commit: c1a7cc00cd412505e070eb4e62bc0b0ca85243e0
-- 
2.25.1


