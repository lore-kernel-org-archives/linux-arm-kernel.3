Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3BDC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bZWyuOL8SA591HIjTGehPD7qpzMH/d16dAjcrfWvguA=; b=hBW056pevs9zYe
	b+3LxZCD20KYQhs57bZfq/DJKPkkfUY6gjRmitL94SFzEPHxwSqtdW33EcPljisDp+mBQyrI36fcL
	M3O8wo9EXCxPmK09BlzI1x02MiDqxo2vHfM2DWzJ4XNOJwSbGv2oxcAwn9GWLtkviklWn4gpUFP9N
	TDTGtPDp31XZM+GXxmObIEGPn3f7djco+IABeOgC2WslRRSX2hDxdiIY6VLOaLZ8MsDSqV6WAwzvs
	/s3gQsoh1r20ChUwPaVva15xTq1/aeHRNSlXpOXPL1siVjav3LW+ys9vjFX0jl85Vc90K2Zp+Q8N8
	D0qPkb5ILSxHa1YM99ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHai-00000007bKA-1Nv5;
	Fri, 07 Aug 2026 10:14:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHae-00000007bID-1mO3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:14:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D66A11A149B;
	Fri,  7 Aug 2026 10:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0E0D603F0;
	Fri,  7 Aug 2026 10:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A56411C3750A;
	Fri,  7 Aug 2026 12:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bZWyuOL8SA591HIjTGehPD7qpzMH/d16dAjcrfWvguA=;
	b=Q6xSDyFa/45A3fXTibyYzAtVCe4uidXsrpiI7l5AgSJ5Hxfh6wzBOkvsugFxwJIzVMtm0q
	Rt4rbR9U0qw4gVCUm9JI/ItaIorBfy6w+Hkc7Rw0HzA8bUdSxMT5GsTOcp3lxmK4WbvpFK
	XM39XUEm3SfpldmtcNIJxU8uK9mtIKDwj5sEiPVgYjHZuGUgN+X/OQSOZSXrH7rdMfdwIb
	De2WDwonUPTwzUHpRLVz8RUpLtKTFpr8gKB582eFMz1ZUnVteomuym2pbCUV2Q2MlByTQn
	G7LZePqo+cVC1ZL9v8LRn4Mv/fvVPCOyhZWJuEs5zFzn8s+4g2gJ12MZpOh7rA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/18] mtd: spi-nor: Massive QE handling cleanup and
 Winbond RV chips addition
Date: Fri, 07 Aug 2026 12:13:52 +0200
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PwW7DIAwG4FeJOM9VoGPQqJr6HlUPBJzVUwMZU
 LapyruP0ssOO+z4W7I//zeWMBImNnQ3FrFQouBrEE8ds2fj3xDI1cxEL156KXbwSX4M3kFRwCE
 tBD5EiAWMc5TrMlg0YuITl3pEVs8sESf6asTx9MgRP65Vyo8hmzEl06Sh2zdI9/Jv6L2AvaDx1
 wWKhB60EluNUim1ez6MIeQL+Y0N8+tdHk1CqGGmPHRFbQREy9n9hzOlHOJ3a114e+L/BQuv8LQ
 1yLXshZPmN8xO67r+AAKVO7dWAQAA
X-Change-ID: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031412_765137_213E7499 
X-CRM114-Status: GOOD (  19.67  )
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
Changes in v2:
- Added support for more chips that I received and could test. The main
  logic in the first patches is completely untouched.
- Fixed the name of a parameter (s/sr2/srs/) in the low level read status
  registers helper.
- Decided that there was no specific handling of the WP pin being
  strapped wrt the read check over the SR content. This would be new,
  and I don't think it is wide to handle it in the verify helper, but
  instead this should be let to the caller to decide whether it needs
  to hard fail or just degrade into single mode (typically if the QE
  bit has not been written). But this would require an extra DT
  property indicating the WP strap state which cannot be read back by
  software.
- Created a structure to store the flash specific opcodes.
- Proposed a rename of BFPT_DWORD15_QER_SR2_BIT1_BUGGY in favour of
  the _NO_1B_WR suffix.
- After checking, decided that the .name field is legacy and not part
  of any stable API, thus it can be removed. So added back a commit
  for that, removing the names for the whole JV family.
- Exposed all opcodes through debugfs, including the QE bit position.
- OTP and SWP writes are now read back like before.
- 2 known deviations are now explicitely stated in the commit log.
- I changed a little bit the QER field parsing in the sfdp.c driver, to
  limit deviations, as much as my understanding would allow me.
- Link to v1: https://lore.kernel.org/r/20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com

---
Miquel Raynal (18):
      mtd: spi-nor: Rename BFPT_DWORD15_QER_SR2_BIT1_BUGGY
      mtd: spi-nor: Create a structure containing the flash opcodes
      mtd: spi-nor: Refactor Read Status/Write Status support
      mtd: spi-nor: Add support for the new JESD216 rev F QER field
      mtd: spi-nor: Move the SFDP header structure to a C header
      mtd: spi-nor: winbond: Drop the .name entry of JV chips
      mtd: spi-nor: winbond: Add support for W25Q32RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q32RV-M
      mtd: spi-nor: winbond: Add support for W25Q64RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64RV-M
      mtd: spi-nor: winbond: Add support for W25Q12RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12RV-M
      mtd: spi-nor: winbond: Add support for W25Q51RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q01RV-Q/N
      mtd: spi-nor: winbond: Add support for W25Q01RV-M
      mtd: spi-nor: winbond: Add support for W25Q02RV-M
      mtd: spi-nor: winbond: W25QxxRV-Q/N/M: Add missing chips
      mtd: spi-nor: debugfs: Expose SR opcodes and QE mask

 Documentation/driver-api/mtd/spi-nor.rst |   2 +-
 drivers/mtd/spi-nor/atmel.c              |  52 +-
 drivers/mtd/spi-nor/core.c               | 790 +++++++++++--------------------
 drivers/mtd/spi-nor/core.h               |  71 ++-
 drivers/mtd/spi-nor/debugfs.c            |  19 +-
 drivers/mtd/spi-nor/gigadevice.c         |   6 +-
 drivers/mtd/spi-nor/issi.c               |   3 +-
 drivers/mtd/spi-nor/macronix.c           |  12 +-
 drivers/mtd/spi-nor/micron-st.c          |   8 +-
 drivers/mtd/spi-nor/otp.c                |  16 +-
 drivers/mtd/spi-nor/sfdp.c               |  58 ++-
 drivers/mtd/spi-nor/sfdp.h               |  21 +-
 drivers/mtd/spi-nor/spansion.c           |  20 +-
 drivers/mtd/spi-nor/sst.c                |   5 +-
 drivers/mtd/spi-nor/swp.c                |  58 +--
 drivers/mtd/spi-nor/winbond.c            |  96 ++--
 include/linux/mtd/spi-nor.h              |   5 +-
 17 files changed, 541 insertions(+), 701 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260529-winbond-v7-1-spi-nor-rv-addition-cea2f1f158be
prerequisite-message-id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
prerequisite-patch-id: b4c64eddd0cbb8a67a3ceb3d5a8fb7118ee8bbd3
prerequisite-patch-id: ea4fe4b14c3613b81a14c7af7ef5b7783c8cc633
prerequisite-patch-id: 4386d6ade3a3cd161669fec71550a9ccd96313f1
prerequisite-patch-id: c8a25a85853dc662591c1099350a37ff842d072b
prerequisite-patch-id: 74656376c96b96fc1b3cdc7074de6b3cb87d9ca7
prerequisite-patch-id: 90271b7e055db3079d3897546c3480a285b740c8
prerequisite-patch-id: 600c72d0a18dc003917f774209625f24c37d11d5
prerequisite-patch-id: e4543f8bf8f0fc69ce6dffc1b18858cf9ba6c04c
prerequisite-patch-id: 260a5ff56d2e5fc5583b875e0e0eca14786f23c6
prerequisite-patch-id: 2895240e7ee5b7d3f0792e7c964be474c583a4c6
prerequisite-patch-id: d429c7951d6bc134fb9f8990d72ff678b55e39d2
prerequisite-patch-id: 4733bf85a0015bf832f46909518c5c3b291824ff
prerequisite-patch-id: 876879d9ca584afcfda5ea388a39f71ba5e88847
prerequisite-patch-id: 849e3782c7a6263bce97a359f1e8521dc2b2ec77
prerequisite-patch-id: a4d9ceb8d99e527d9b9b184cbb1923c99e15fe1a
prerequisite-patch-id: 8c9246e1485d06429b1caaae7a1efb7af5122723
prerequisite-patch-id: 66880ad35a1681b724b51cb40e591270a65429ce
prerequisite-patch-id: a750eb3c350e1a88aef8749506332663fb44e007
prerequisite-patch-id: 6e9d4b20e02afb09defda703c74d56ea222d10c1
prerequisite-patch-id: 808ce773f9ecb493ba9362e088453638ee93b222
prerequisite-patch-id: 462a6751e3e9074102e8d31b23bf06140f6ee6e6
prerequisite-patch-id: 309ee450a2ac8eb24516c6839b944bc5f36a6db6
prerequisite-patch-id: 07059d14bb516ba19fc0a678a96b3224f91caf24
prerequisite-patch-id: 1e221a9bbfb1fc53982beaf75bccf48baaba491f
prerequisite-patch-id: 20ce5105adc4c7f8ebc6c779b107fd54def4f1f8
prerequisite-patch-id: cd8fddc6d97316419b52997207a198037b41b32d
prerequisite-patch-id: 759f747940c26df6ec85fecb4779fd54e0ea3735
prerequisite-patch-id: eaeebc9df5221bab68a6cabc64a97e9c2608899b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


