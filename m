Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B09CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nEwkoaSrhnsbUPn/W2K1YlkPDVmI9P/QGqBveL8J29g=; b=e+o847TnayVLA0GG8068U9Kwwx
	pzQyk8rznekike8+hm9GjyoXxyYhM+DgKTb3zhfitsarhUwCDw8xTy36V7QBrZOl+R1sH2T33elhq
	TNA/dgi+edU+69/1IVjc3+xybc53iZKhOb02+ks5z2JQdXC3lcF/NZCXziLEtCZtHPKhrirOICLEG
	moelRNb5CHVpBkZZyQB1D621rDa5LVoF04SBMrXHrWAoF6SCFHFl3tsk54NOwBGLXrzE53WHaEtop
	9SdaJpk07T4VCNMgBYAcsuNskf8ga9ywKq0WdwifAcErZyOU+5jWI54v/5ZYdj9ZXtEAxYRTGquEo
	SiReQBNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utv2b-00000007gea-0sO0;
	Wed, 03 Sep 2025 21:29:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrNP-00000007CNO-1bbh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 17:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756920871; x=1788456871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j9uoBR2bCWVLPcGuSh21m2aRxS2t6SdQg9H9h9+omF4=;
  b=HHnh4GwHIu6SjQ3uRkDt1rpaE74SqOMdbMs9RIox2SsD6vVBcOZlns2x
   PzjM5EBpBiqxIBp9y/8GUo++zWDTEc3izGoNm7ZztyxTxEWz95uwUHWj7
   1pucAofmIbGLR/c7w1LHr2++1quqKesw48Uj1SgiNvS4Q+B77kWRl3aR+
   /hlsuku1EMVsD/H2ZvTtWsZFkOC2alT9Px+phaIhCBxUzvLH5+T9WP4ot
   koiW3hiCzRKqkwgtngXwd9/mMMUfVKlxNqtJvvFlI89ZI9qwxTp9z4NpZ
   oqGc8BbEXdJNpxn+HA6QXlkdZ/oaFXMLUrSWaC0i2uF6D9kxZ6eaFWWhJ
   g==;
X-CSE-ConnectionGUID: oKJd4GHmSRGRULZoo4t0VA==
X-CSE-MsgGUID: nliAKuDLT7KKBBDAlGntcQ==
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="45463451"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Sep 2025 10:34:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 3 Sep 2025 10:34:26 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 3 Sep 2025 10:34:24 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Vinod Koul <vkoul@kernel.org>, "Alexander
 Dahl" <ada@thorsis.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: at91: fixes for 6.17
Date: Wed, 3 Sep 2025 19:33:55 +0200
Message-ID: <20250903173403.113604-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_103431_699469_23187FFB 
X-CRM114-Status: GOOD (  11.55  )
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

Here are the fixes for 6.17. The addition of the Kconfig symbol is taken from a
bigger series by Robert here:
https://lore.kernel.org/linux-arm-kernel/20250813174720.540015-1-robert.marko@sartura.hr/
It is needed because one patch of this series was taken before that symbols were
defined properly (queued for 6.18). You can read the discussion here:
https://lore.kernel.org/all/bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev/

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.17

for you to fetch changes up to 217efb440933bf97a78ef328b211d8a39f4ff171:

  ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode (2025-09-03 18:52:08 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v6.17

This update includes:
- adaptation to the SDHCI capabilities on sama7d65 curiosity board DT as
  SDHCI quirks are not in place yet. SD/MMC don't work without these
- addition of one Kconfig symbol that is already used in DMA tree for
  6.17. XDMA cannot be selected if not present.

----------------------------------------------------------------
Robert Marko (1):
      ARM: at91: select ARCH_MICROCHIP

Ryan Wanner (1):
      ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode

 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 ++
 arch/arm/mach-at91/Kconfig                              | 4 ++++
 2 files changed, 6 insertions(+)

-- 
Nicolas Ferre

