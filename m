Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB903CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt6z83GlSHfdWO3Jk22aFxzg1DF1zAm2bjGCaVuvjiM=; b=VGBTQTXoV7uVG8LJ2itN0ejtZp
	zdZ91woChgJkAVfAJLpKexz7nCrgeZT1r76Lws37grGiIoOpdcLG2xD6+ii29xxJoEpw44458SSgs
	v0kn77W3uaJbyJUNlusgB/HuB0MTT4qpG9zIauv7iRga4opHP7vTXzwMj1ngJ68YBZYUV1pLN3O7T
	uagbzy32KhGR2UNhg04IMtZE34zd8SMaQU7L6g/4EpkORMbgT5ZXhLIIOzsEHapodztcvcWzMh3pQ
	HDDk5OMvVp88WAyc9qRUMYtKsYBGrmNbz7dnM0o/BVMOQtYmha2ILF1I1s1tPd7fy2cYyC7NDTcm7
	sMNV+/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywng-0000000Dt00-0DFu;
	Wed, 17 Sep 2025 18:22:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywnd-0000000DszY-3eZa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758133357; x=1789669357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2D1dA8/ICqE22MprhtcMFZ8x2OdHKcVhD8IYrqeaof4=;
  b=CgIRMGaGfQ8ZSlSeMQkZ6Vv5hBjua6UOSKNcnUINdwOV/2safFDNV6hO
   x573jmJVqJNzDLSvG1T0bIN9RLMwhu+Zl89IhTesd5DTLG6uolyw8jXhY
   5FYxphJ4LR8GEBxFDlC74MB+o+XoQEnoRs5hxPzxEsqL0T/Ul/PguO4Ci
   QpdYU4YBynHgcfiSFn/AGcZ3jVCrgfhXaiXwV/52lJ7K6TjV4a0XPD1Ji
   TC2zdqK1RLSoG9Gsm1tQus1f6IsBeMmnv05UIdSpTZltb6CbusQMXsi+g
   8+nb6lNom4EECDKLgjJiNWcDAH3/riL9vMB+GC6ni53gw76WMfSb9C6kS
   g==;
X-CSE-ConnectionGUID: 3YgLgpX/TcqRO1W0M7GsWA==
X-CSE-MsgGUID: nADc49kwQoOhLFWErGL+TQ==
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="278006773"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2025 11:22:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Sep 2025 11:22:30 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Sep 2025 11:22:27 -0700
From: <nicolas.ferre@microchip.com>
To: <sboyd@kernel.org>, <mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>
Subject: [GIT PULL v2] ARM: microchip: clk for 6.18 #1
Date: Wed, 17 Sep 2025 20:21:18 +0200
Message-ID: <20250917182150.93359-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916080545.9310-1-nicolas.ferre@microchip.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_112238_084425_4162BCD7 
X-CRM114-Status: GOOD (  15.07  )
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
In this v2, I address the issue highlighted by 0-day robot: build issue. I
added a patch that is already included as well in an pull-request to arm-soc:
https://lore.kernel.org/linux-arm-kernel/20250916150328.27015-1-nicolas.ferre@microchip.com/

v1 --> v2:
- addition of the patch "ARM: at91: pm: save and restore ACR during PLL
  disable/enable" as the first patch of the series to avoid build error if clk
  tree is merged before arm-soc. Branch bisect-able. Exact same patch
  in both trees.
- a new tag (clk-microchip-6.18-2) is created and deployed for this
  v2 pull-request

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.18-2

for you to fetch changes up to 652b08afba69d5d26fe91098eb832b1bcc0f91c2:

  ARM: at91: remove default values for PMC_PLL_ACR (2025-09-17 19:15:32 +0200)

----------------------------------------------------------------
Microchip clock updates for v6.18

This update includes:
- add one clock for sam9x75
- new meaning for MCR register field in clk-master
- use force-write to PLL update register to ensure
  reliable programming sequence
- update Analog Control Register (ACR) management to accommodate
  differences across SoCs.
- ACR management dependency with one ARM PM patch added beforehand

----------------------------------------------------------------
Balamanikandan Gunasundar (1):
      clk: at91: sam9x7: Add peripheral clock id for pmecc

Cristian Birsan (2):
      clk: at91: add ACR in all PLL settings
      ARM: at91: remove default values for PMC_PLL_ACR

Nicolas Ferre (2):
      ARM: at91: pm: save and restore ACR during PLL disable/enable
      clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register

Ryan Wanner (1):
      clk: at91: clk-master: Add check for divide by 3

 arch/arm/mach-at91/pm_suspend.S    |  8 +++-
 drivers/clk/at91/clk-master.c      |  3 ++
 drivers/clk/at91/clk-sam9x60-pll.c | 82 +++++++++++++++++------------------
 drivers/clk/at91/pmc.h             |  1 +
 drivers/clk/at91/sam9x60.c         |  2 +
 drivers/clk/at91/sam9x7.c          |  6 +++
 drivers/clk/at91/sama7d65.c        |  4 ++
 drivers/clk/at91/sama7g5.c         |  2 +
 include/linux/clk/at91_pmc.h       |  2 -
 9 files changed, 66 insertions(+), 44 deletions(-)

-- 
Nicolas Ferre

