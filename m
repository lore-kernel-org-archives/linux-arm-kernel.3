Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AbIisObweaikverU/R1oPGcmbKvCO5ExRZlJhyzMgQU=; b=m0jaYTui279ggY
	a8JuxLM5Y31KYutWDAPL6IeoJnjyAw35DYJw1YYL+3d483tygyeVP3+8RJxERgiEwQFYns0O+hHnP
	2sa6ab5oG6QiXiw82E2rqYcfT6PrnoTTpaGWmubzC5NyfTo6Clxz1RxA+yxLZJXwH0PESUq2neSxK
	YaI6M08F8P3nwWWTSUZ51Qmj/AnAqNiIk+kF9cmTQEY0Vl8aKC6IYXA+3t6/JV/DFzvaSjGTZXpTI
	fF2zIVSPTfFgLKwQTZ4ZZF4q36y+HlIB1byC0nZyBP4uUIIVeNeipCFHeM3cSXuFWNnQ9q8XUI2/Y
	C+/QIbfD5HCjjrAPHXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzj9-00000007pVp-0UF5;
	Fri, 29 May 2026 16:06:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzj6-00000007pUz-00cq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:06:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6855F4E42D90;
	Fri, 29 May 2026 16:06:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B6B6601FA;
	Fri, 29 May 2026 16:06:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F6A10888CBC;
	Fri, 29 May 2026 18:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780070780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AbIisObweaikverU/R1oPGcmbKvCO5ExRZlJhyzMgQU=;
	b=K5Ao63fKm2DgxyLbgKOUm197YybOnuWarpj3GIUqAicz0AYamf+GHRVgBYFMa7mVUWTjf6
	HnnEineggGBP/GfAIcFCVB3sLWX0c3WNWjAg0jmJsi+SF9LiOeLDNkHhZ3gAKkWE4qyokY
	2bLD5XQeustofpf48C6osX/77EuZH6tUNC9zWQ2J2Yg/RdQd+G0mZQJ6LW6daw1RPpalgH
	Pq21pepQFN4GxWv7tyzFTAtkvd4O5zh2npeZ2JQwiEzxBLUsoFrZ4p0jldLcTcgynb2rg0
	dM9dWWPMwiIfgGYd98Gd+4RKQgCufQb1ofhNzH+Tp3d5QkZbI3QwelVNpfxbEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] mtd: spi-nor: Massive QE handling cleanup and Winbond
 RV chips addition
Date: Fri, 29 May 2026 18:05:45 +0200
Message-Id: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQWrDMBBFr2K07gSPYsmOCSX3KFnI1qidEkuu5
 CiFkLtXbgredfkG5r1/F4kiUxJ9dReRMicOvgC+VGL8MP6dgG1hIWupayUPcGM/BG8ht4CQZgY
 fIsQMxlpeyjOMZKRDh6obSBTNHMnx92/i7fzkSF/XUlqexy3UVyWjELHZMhqwgzhurXSbodPK7
 rVrnD6oPus1M1FK5s9y/H/tZ4bxQsZfZ8gINXQtFR1KKZvmNISwXNjvxjC9rt7BJIICEy99lds
 drmPE+fH4AU0dHqE7AQAA
X-Change-ID: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090624_297690_65C3D8AC 
X-CRM114-Status: GOOD (  13.10  )
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

Hello,

Following my "software protection" enhancement series, there were
several comments about the need to simplify and reorganize the handling
of the QE bits, which is strongly impacted by the various read/write
status register capabilities.

The first patch is all about this. It is a massive cleanup, everything
is explained inside, the how and the why. This is a commit that must be
tested, so if you have a SPI NOR chip with one of the not yet tested
SFDP QER configuration, please consider applying that patch (just patch
1 is enough) and boot. If your chip is recognized, it's probably all
good.

Then I add support for JESD216 revision F and its new QER field.

Finally, I propose two Winbond chip additions (from the new RV family)
which makes use of these new capabilities. 

There will be more chips to come, but that is all I can test at the
moment.

Thanks,
Miquèl

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (5):
      mtd: spi-nor: Refactor Read Status/Write Status support
      mtd: spi-nor: Add support for the new JESD216 rev F QER field
      mtd: spi-nor: Move the SFDP header structure to a C header
      mtd: spi-nor: winbond: Add support for W25Q02RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-M

 drivers/mtd/spi-nor/atmel.c      |  50 +--
 drivers/mtd/spi-nor/core.c       | 702 +++++++++++----------------------------
 drivers/mtd/spi-nor/core.h       |  54 ++-
 drivers/mtd/spi-nor/debugfs.c    |   1 -
 drivers/mtd/spi-nor/gigadevice.c |   6 +-
 drivers/mtd/spi-nor/issi.c       |   3 +-
 drivers/mtd/spi-nor/macronix.c   |  12 +-
 drivers/mtd/spi-nor/otp.c        |  16 +-
 drivers/mtd/spi-nor/sfdp.c       |  55 ++-
 drivers/mtd/spi-nor/sfdp.h       |  19 ++
 drivers/mtd/spi-nor/spansion.c   |  16 +-
 drivers/mtd/spi-nor/sst.c        |   5 +-
 drivers/mtd/spi-nor/swp.c        |  58 +---
 drivers/mtd/spi-nor/winbond.c    |  59 +++-
 include/linux/mtd/spi-nor.h      |   5 +-
 15 files changed, 401 insertions(+), 660 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
prerequisite-change-id: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695:v6
prerequisite-patch-id: 41fa5f57751ccb1324c31df8d0c7d2b327fa1a17
prerequisite-patch-id: 31b2eb1f1148054d1cd45e488c0e973e1621f44c
prerequisite-patch-id: b376391b7772443e75b82d9ceb4d6c564371330a
prerequisite-patch-id: 8d5bfc3369cf6080eb60b7a32de5bfbde4475431
prerequisite-patch-id: 6fad316bee00a8f453527a1f338538540b7356a2
prerequisite-patch-id: c16390e544c15e2ae78ab67ab536cc424ac7c620
prerequisite-patch-id: 3b619f843842f6c00048c90a34d615bafa37ca23
prerequisite-patch-id: a3b7f9516e4eb69e4feae624059c5985b189a9b2
prerequisite-patch-id: 90bfb22a3519fad4d490c7016b6fb8137c1ade08
prerequisite-patch-id: c9375e2a9cf35e00e29a3feb8673db6102e2bafd
prerequisite-patch-id: 283bdc0412147df8f87f823ae2f876667dd00b4c
prerequisite-patch-id: 4e324cb821c96ddffd5b68889f7fb4f340df4b0b
prerequisite-patch-id: ff00869a1a045f279657de31495773594b0aca93
prerequisite-patch-id: 594980c7c187274761a6a10b1803c630976d8290
prerequisite-patch-id: 0ead288e109031e5653558e809778b8561862b28
prerequisite-patch-id: a74f5deb8e8df344c35757adae5072964a5289f5
prerequisite-patch-id: 6dab8d535c34e1c1e84a295c70e48c3bc6dac9f5
prerequisite-patch-id: 09b411dfea1e51b8a33ebcf0887260b5d05fdbc5
prerequisite-patch-id: 83aeb811574fc5242b3709335120854423e60173
prerequisite-patch-id: 0366883be8924559d19c4732d99d3b9df4db7dd1
prerequisite-patch-id: c0a80c658297b6dad22be20efa14e53e928a0f80
prerequisite-patch-id: 6883cb379f52c055d4d1cdc4ea798c7b775d0dd8
prerequisite-patch-id: 2fa7c195a618e53ba5181f308a467817e7efcfca
prerequisite-patch-id: e100bc5f348900a1c976932e3dc6482ae7a5dda9
prerequisite-patch-id: ee34be9e4b9a3d2333a22cd7643a292a45de2c0d
prerequisite-patch-id: 3024fbd42edbc8c246805c7533e314e5a1462ea7
prerequisite-patch-id: d8271437833307db86abf5a952bc0227562c9283
prerequisite-patch-id: 2f65c33b74cce2d0b891974ffe68babe0e829894
prerequisite-message-id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
prerequisite-patch-id: 90271b7e055db3079d3897546c3480a285b740c8
prerequisite-patch-id: 600c72d0a18dc003917f774209625f24c37d11d5
prerequisite-patch-id: 2a40afdd885392bab2b93035db111670016b16e5
prerequisite-patch-id: 840643fd3e1c3d725c1db2ec3ec9f056c0b59203
prerequisite-patch-id: 7d7af1e7bcc2efa8194805a58524b63bcdcaf388
prerequisite-patch-id: 010fd4751671a20d249ecb772bea9d16bf58c76d
prerequisite-patch-id: 0a269f09cd1a9c6597533ef6814141ffd7bca37c
prerequisite-patch-id: c11657122b4e8aac7d93fee35bc6bb8afddc84cb
prerequisite-patch-id: a8d07b1ee7c8d91991531baf7b12294e849ce767
prerequisite-patch-id: 7d822caac76012627ed5e8889011088d721a7bd4
prerequisite-patch-id: 1b688642b8795aecfedd833b4606a992795c4007
prerequisite-patch-id: 7c23d56ea0f3cf6edec6e849bc923ff99a8b68e5
prerequisite-patch-id: 0a9d35ce50c6a2c45b1adca4796766e3eeae79c4
prerequisite-patch-id: 6bf63b2dcd7105e1833117a8d7c40b9bbf4b3669
prerequisite-patch-id: 462a6751e3e9074102e8d31b23bf06140f6ee6e6
prerequisite-patch-id: 4e8a8ccadb8ed079d8e5271bab44e03050024adc
prerequisite-patch-id: 94455a1cc1ba7fac00a1be1fa961f1597878fe85
prerequisite-patch-id: 7e731eebba360dd2f5263aea13b697a1488a6283
prerequisite-patch-id: 78dac39c5737a166cfd2b04002a5e0a131ee8940
prerequisite-patch-id: 0dc8b0344e8b29f298c856477bc5acaa61d3967a
prerequisite-patch-id: a46684d4159abe1e3fd8f76c45001ecf52a92973
prerequisite-patch-id: f07c3b16f229881d2e17f4a8addf3e79835bd641
prerequisite-patch-id: b67fe113cd46f03786adcb69eaf86190eac1d33f
prerequisite-patch-id: ea181a86120f14b48e9ec77e467cd2cce8ce208e
prerequisite-patch-id: 20ce5105adc4c7f8ebc6c779b107fd54def4f1f8
prerequisite-patch-id: 34ed2ebf8e08b20e9443fb95591478840a530b36
prerequisite-patch-id: eaeebc9df5221bab68a6cabc64a97e9c2608899b
prerequisite-patch-id: fb220fdab1d5722ef18827e1629f466f32b14a3e
prerequisite-patch-id: f80c10737ffd66f4b4d700149efe2e354ffd7b46
prerequisite-patch-id: b0cb24cc785ea0f871b60effc6b8334c91aaa0f9

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


