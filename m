Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F96CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4ASQoh434snTg3oMZ4ODV7u1T3gn7WlDG1A0nKTWBQ=; b=loogkZXTFOYlgQ1eUx1ydAS3c7
	+3FK1f9rdZ7qKdiG9Abnnp8krWj7YwyJOpzHaxlJUel+XJmjoyw8gTLSuMDlZFZTo4CngZKpiLIzK
	gIW4DC7MIsqwwQ6S+6O/f3EhtjNoKAAwAVZlaLl4zyQq2OXBRm0z7GAU23YIVbUZWyZ/kgaPX49ac
	gBg9TePkzTvaDFqkHx0cE+796I4Wkd5qcHK7SUMgvCyREZFM0sHSlmU3Vxkc0UYbY5Gmu0NsJD4Gg
	x0uRjRfgsIqNhaTBOFWmto0bDiOEEofCkGEAfNUrwxbh+bwKnvSqRBJMOndhkHolEzw0W1rr7Z6eb
	CkUSMY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jxc-0000000B3K4-2d0k;
	Mon, 22 Sep 2025 17:04:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jxZ-0000000B3Jf-1D1I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758560657; x=1790096657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mA1m6W7VuxwY07ZYn6w/N7eCuR3fCYoMpUyjqB9ZPjQ=;
  b=tLKeEkf4oItVf1M3CS/i686Uxmv25UKffkAui/FAo+aX9/Xz9bpiDegN
   h9A3aX/spuL/iWQ0G0Y6lA/aXSzZQCWOm2uFVDojG9p2jWOAOkmPofMio
   AAR3ZpCPt/4rd4SYqucJIz5c1w5zhWd8Hn7wtEcVM16obZjIl1EgNkK9I
   NofxTAq1AgDmtocQOzsd3pUA2zyX/SIS6a04qYLXk0L7ve38s/yWQhFaI
   BgIAuckvF6x0wC4d/08prKsh7eMuxLssI+E+C3ONvy0e1CkQnLjvdtNPE
   omhLGjmLUQZpskPaMkjFytdb+cZbxDl7Iqi+9+GmCnKeIoPnBDlrR2n0e
   w==;
X-CSE-ConnectionGUID: ARBJErZ/SGCcBWIaab2tJw==
X-CSE-MsgGUID: Dr/xhLz+QTq3bkZGgcAj/g==
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="52732392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2025 10:04:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 22 Sep 2025 10:03:55 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 22 Sep 2025 10:03:53 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Ryan Wanner <ryan.wanner@microchip.com>, Dharma B
	<dharma.b@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: microchip/at91: dt for 6.18 #1
Date: Mon, 22 Sep 2025 19:03:45 +0200
Message-ID: <20250922170346.40876-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_100417_502230_A43837D7 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Dear arm-soc maintainers,

Here are the first dt changes for 6.18 which contain some little node additions.
The QSPI node has its bindings accepted and going with the SPI tree:
https://lore.kernel.org/lkml/20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com/

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.18

for you to fetch changes up to c656932c3ece3eebe6240bb20e5c1d8aa0d7ecb0:

  ARM: dts: microchip: sam9x7: Add qspi controller (2025-09-22 18:20:34 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.18

This update includes:
- sama7d65 and curiosity board: addition of gpio, leds and usart3
- sam9x75: qspi node
- one cleanup

----------------------------------------------------------------
Dharma Balasubiramani (1):
      ARM: dts: microchip: sam9x7: Add qspi controller

Krzysztof Kozlowski (1):
      ARM: dts: microchip: Minor whitespace cleanup

Nicolas Ferre (1):
      ARM: dts: microchip: sama7d65: add uart3 definition for flexcom3 peripheral

Ryan Wanner (1):
      ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs

 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 53 +++++++++++++++++++++-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            | 21 +++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 17 ++++++-
 3 files changed, 89 insertions(+), 2 deletions(-)

-- 
Nicolas Ferre

