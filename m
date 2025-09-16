Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0CECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NP8/HGaW8/RYNStDxsuTP0RSMPUKqDyHHmfhNEVTnwQ=; b=nqAVdXGPgfbPNqa2F33JoAEHE4
	Qmp+E8d9UMOpyU1TSzPM4KCDKExgWD0ztYQKyEo+TYjKzAKi6zOe2wR3Pv7zcZXfw6OLagIrsUjgP
	NHW60f3zxWLx+NrhxNeAZPLn2Kn86Vrmoc1tBDEw7o1Ioe7GnK9iXbFYcFK2GGqccMKnwIBr5v6E2
	uNQjmCV0T6xvydfly3WjW2LG7fgBzhHef+2mL++lLYjdbS/WYT5/pvNh2e+McH8L+GhvnD2QA6Wgv
	63Fk9teUun8GnoI0tSRAeN3OydK5s9ZH0vPu1kDRtbB3AHNxdTH3uf29bPSVmgtWOZ7sXGcC2czEz
	GOTb4mUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXEk-00000008EP6-0PxS;
	Tue, 16 Sep 2025 15:04:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXEh-00000008EOQ-2rwC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758035091; x=1789571091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=22msJI66Kn4S5p8RuJrtuGtfpaKspAeILuZQoci+SlQ=;
  b=YiNzQjovVDKu/5k5yqQzW07bDXHab3NG8R+4aIbb1XSCAilZr+DvHXG0
   hUG7Lw2mQPiJMe2eEwae6OeyI0xHUTZFPNQEMazJREu6Pwy0uI1jqW5dp
   AiR7UO7i3HUpewlMeUoOjIcsQONiWwp1NpOeAN3cvcRJ8oZ24RsAy61B8
   1StGE0v0SHk/+GzH5miJqbimAr9TvajUy20ltKah8PTZyHC0RjKowQPuw
   bRZVmireSTH5Dolm6rhemejhYIKF338954CMsiYCRWI8margekXRZjk6/
   cA5seBKTDMr7GOswb5lzNDPDw70WjFU+PKhHBCrgTF2mgoBDqfgX2OFNc
   A==;
X-CSE-ConnectionGUID: 37c0yGb2SSCtsg11K/lYzw==
X-CSE-MsgGUID: 1trTaR7qScuOZQidJ24XAg==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47114855"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 08:04:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 08:03:32 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 08:03:30 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: microchip: soc for 6.18 #1
Date: Tue, 16 Sep 2025 17:03:28 +0200
Message-ID: <20250916150328.27015-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_080451_757150_23DA8435 
X-CRM114-Status: UNSURE (   8.23  )
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

Here are the at91 soc changes for 6.18. They are move specific to at91 product
line and are all related to PM code.

Please pull. Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.18

for you to fetch changes up to 747436750bc0ef73be32391bd5d0d7dcd185da7f:

  ARM: at91: pm: Remove 2.5V regulator (2025-09-16 16:57:03 +0200)

----------------------------------------------------------------
Microchip arm-soc updates for v6.18

This update includes:
- low priority fixes to the PM code, in relation to recent addition of
  sam9x75 or sama7d65 SoCs
- removal of the 2.5V regulator for low power modes since this is
  no longer supported

----------------------------------------------------------------
Nicolas Ferre (3):
      ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
      ARM: at91: pm: fix MCKx restore routine
      ARM: at91: pm: save and restore ACR during PLL disable/enable

Ryan Wanner (1):
      ARM: at91: pm: Remove 2.5V regulator

 arch/arm/mach-at91/pm.c         |  2 +-
 arch/arm/mach-at91/pm_suspend.S | 41 ++++++++---------------------------
 include/soc/at91/sama7-sfrbu.h  |  7 ------
 3 files changed, 10 insertions(+), 40 deletions(-)

-- 
Nicolas Ferre

