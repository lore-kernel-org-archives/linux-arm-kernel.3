Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A4FCD0AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 05:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mecvzu22KbglD3izUCGT3OLXAeINYWYPk4CPuzRFKaU=; b=XMkg984sx6Ws7DvJnYPGgNvyFq
	wMBKMoQC7PlVsKeiIj+2mxc5ZEDlzKq/bkvBS/JGin6mRAzDhSILVED32OcDg3IYhHvlk1SSouGia
	WPQlWlWhJ2UISujbONpUQY43Vy1rFWHHMbPMAJ952vleIO8f1UvvoMiqqNDUe6zhVYH+beJVgyhvE
	XKwx1B5m2DNlfMEJ+1iHQTk93RbAQ9Iv0/wkTVa7p/uz6ToUeba6Q/7BYSAapKzlmKgXoVrAKN1Bn
	OnvYIzzRNWlv3dv+Nq3JsCS27vjCWrMknfM/sF6SQjxPm9WHhQRnMTEDE50hl+3qZUrhZM6uuAuHV
	WHpZIwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jqR-00000007o2u-21to;
	Wed, 18 Mar 2026 05:53:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jqO-00000007o1N-1QNU;
	Wed, 18 Mar 2026 05:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813205; x=1805349205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2Xp9lzfJzR+MWEgYcbZSrGJ5MtteFy2ftN9oU8hZG/I=;
  b=dcNduz8JY3j22K/T+3q+n/1yA+3R2Wb5FDN0sEMVLUqVD5eRi0o6nIUW
   0AIvA7QJQqfiPR1imSNYjH+Dx1KL4dTb4xhrnVpYVm+dOUQ9rZusjUr5U
   AqwgwMaRg0ylTnXItTOtPD96FFIM4MF/nM4aJgijTNxsEuhB9WzmyvuMk
   zVocOh4egqa/Ser7DV4C65U748rXgF1UP2dJ5Y8crS6zb9TZlYM85ryOB
   KTdVBwvS2Kg3B5ghWjNj5qTlq+lUDe+OD4GBm3OFI6SPtxeyyuXV3JoS/
   4UggfuDImoLWcTlwvBfhGzJdUfap4DfCJ6BZrq0fGvPqQ0ZSZqAcwYCLV
   w==;
X-CSE-ConnectionGUID: TZ/u7H+YTQiHBRAlQQhOfg==
X-CSE-MsgGUID: waZvmdF3QgqL84434mEKJQ==
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208449"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:53:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 17 Mar 2026 22:52:49 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:52:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 0/5] Add microchip sama7d65 SoC I3C support
Date: Wed, 18 Mar 2026 11:22:25 +0530
Message-ID: <20260318055230.307030-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_225324_498979_FBCEF722 
X-CRM114-Status: UNSURE (   8.72  )
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

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 26 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 12 +++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  1 +
 6 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.25.1


