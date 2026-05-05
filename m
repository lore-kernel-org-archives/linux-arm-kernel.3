Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B69CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=THu+B+6D2g+SFqLNJ4+H0rUKrVC0ZP29Tru13Dps+QQ=; b=QDXaLxbxxUxbNtl1oXih61C9uH
	YLO18aNU3FeJK6Hetkgp8hsCIPMkE4/SALr/ZgEa7HzxI2zbX6z8SeaHH+Lit+hkttntvcMQcbS4Z
	8Hfm3iF8wqNKwvajtKKVhtGd8bw+E5/nr64FZ+huh6dR+vHvvIm49tDS3+wQH3uIGIPz9C8i+rw6e
	5kHImjJJ4IdeyN9mlCQzgz92kcFXIFqW05PR8GgIOARyCjY6pawxwrHv+XrCte4p9RSh5WBAjv9t5
	InLFtMDaHO4b4scpiAgojfj1+RZZ2nK4948DwygRaVePsKyhVKgrHwAnmcm5+zbDH5moFs3DYNXrR
	iXH0TNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9yU-0000000FMuC-3vkr;
	Tue, 05 May 2026 07:13:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9yR-0000000FMtU-1tMt;
	Tue, 05 May 2026 07:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965223; x=1809501223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iwXssjVwXEDAaIusnOPanGw93zeO92i+J3UbzMTOgxg=;
  b=aUt7hcQF6RcCA+WbDcHlpEgtiO1Zh6togUueobzA4oiBEJBQhgsPA464
   BBOBx7UG+R2JbsKMUlL3GcYNHVjIQUkS9/xlfBFf/ochjKK2LxgQdaQXP
   4/Z0TS1Xokrsx6Qei03zkWGQAVgYEJMXeguZkWJXBKZCe/r9EM4SZ0HQk
   w4amG+ajTbYz2dAz/QBNKgcIl5dDi1QmNcgsG15biKTPyUQ4tCedysMh1
   3hWMYZkh8Fd4ojwNWqM464B/QFy/M5nR+nVv09furloHLqbEk285alVGf
   MPnFsLMtBjtwsqGB/Q2XhTcF84yYYDB5kpexe2GpGNUdJjGfgV3BRBwxY
   g==;
X-CSE-ConnectionGUID: PjmAzx6DT7WFLSUsQRH7eQ==
X-CSE-MsgGUID: y95fZyx9Qz2BMZILXZ8CqQ==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="57457000"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:13:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:13:41 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:13:33 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 0/5] Add microchip sama7d65 SoC I3C support
Date: Tue, 5 May 2026 12:43:22 +0530
Message-ID: <20260505071327.125787-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_001344_588051_FA5CE1D7 
X-CRM114-Status: UNSURE (   9.03  )
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

Add support for microchip sama7d65 SoC I3C master only IP which is
based on mipi-i3c-hci from synopsys implementing version 1.0
specification. The platform specific changes are integrated in the
mipi-i3c-hci driver using existing quirks

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Durai Manickam KR (3):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

Manikandan Muralidharan (2):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    required quirk

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 10 +++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1


