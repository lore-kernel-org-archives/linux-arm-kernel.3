Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3203FED2C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnedHzAYlPQKd7QJbPUan0F8bZqTEegvPKwIKwzWtW4=; b=ukxhaksI39lLDHMkgNqdpfaGA1
	TW5QI+GjDm50QmiF+T479oe+ylu/tx9mCE8MlJ+kaUgoBUsbs7xFd5fCpTpCqPTlAe0sJf1atlkYe
	sKs5i+ddU7pmoTpC3yRhdvcHLwQUiEBTWerES/OhJensLxw1V30eg8xl9/IwqmXmlhmao7yOLSYWV
	odVkuoHJ7nWUQUUlAm5j0uwLF/L5CW5Ux3jmMkS2g/pJQe9cZfJJm7czj0fb1NbnSEOHMErWefDks
	R0QsP35uv4iUsjekQ4/5WSXaTQThL9sHpCEj4y6lHAir3uGwFI+jYx0Sg1KL42R8H5Z+rhP3o+nca
	r3WZQAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XYR-0000000DFJg-2o6k;
	Thu, 12 Mar 2026 04:21:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XYN-0000000DFHg-2eFY;
	Thu, 12 Mar 2026 04:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289301; x=1804825301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wdI0p60YaCgXLrj/iUxMmmz6VvOV20Yk+z+tHEbhKv8=;
  b=PLN4to3W/1YDU9sAsu8eFmA5rk/ib03I84KrVn+00DUayIXdPsQV7dlc
   V9dHABu2FgMNqIX/sg0cY0a8UYcVYHkZ4M+WvA1qcTyTJIQf+BBbQjSja
   3TvVrwpTkrNwJB/fKmhbmqCG5ytQkApGKa9DNzMH2JHQhRxsiC4BP2q78
   OHVbA9/OUJhvReBXEahU8w+NkNkrEhomw/fEgAjfGxhCSifTtzOl9sO4Z
   WPiw8C0TUExix1SL+CmAOZnqhyZhqa3fuJGK+6hWhLxt7icS6snOw40QK
   yeJTwYHyI2qrVEwh6xXZ1W12M3r4ewcrXZ8iiFbq1RXHEtwb/QrS+Ueti
   w==;
X-CSE-ConnectionGUID: uJrHAOLBREOlPHbMYZOtwQ==
X-CSE-MsgGUID: R7IJWLvAS6qm15x3KGqO0g==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="53801522"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Mar 2026 21:21:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Mar 2026 21:21:10 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:02 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/5] Add microchip sama7d65 SoC I3C support
Date: Thu, 12 Mar 2026 09:50:51 +0530
Message-ID: <20260312042056.309237-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_212143_728591_2187E2EA 
X-CRM114-Status: UNSURE (   9.69  )
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
existing mipi-i3c-hci driver by introducing a quirk

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Durai Manickam KR (3):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

Manikandan Muralidharan (2):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    appropriate quirk

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 22 +++++++++++++++----
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 +++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 12 ++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  4 ++++
 6 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.25.1


