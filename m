Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34398C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Oa+YOncmCkkVL2k0GTFisduj2Byb339ftd8reg9zeE=; b=Q7m3jJjPZQYh3n
	n7m7FzkKqvn7Tm/AFJ8TkMwFfNnI4DvOme3VAWQ9GSsSEfpqZE/rEzTeQHbktmk4+yigfkN/VnMoc
	6pgNKtCxzOa81T+KnClhODEIrEwM7ESls/uOK42Q4otl/iUH1BBh31ZH6FoED4obYTrDAYwKqP8h8
	J83h+5JNk/8dcmCB6bQMXQbBeihVYkeIOzQC/a24+ymUMo7/lyvnr0yHWugUvQH3B33HjMzLP+0kL
	TAJjn0/4E0x5zN1oNa1zniK4HDSh+DXATmddRZoFaTcD+dZDm81LvD3RXSrQsXqdZ0Yy7HugHletb
	VRWG+aievFFiWzQLWnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSq-00000001MC6-16Ii;
	Sun, 13 Sep 2026 04:05:12 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSm-00000001M9u-2Xw3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:10 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c0766cbe64so691351b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272307; x=1789877107; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Oa+YOncmCkkVL2k0GTFisduj2Byb339ftd8reg9zeE=;
        b=nWhNeHNZyAhYC4MI8kgEE3/ohCdT/1MJc9em1dvyYDcLfMbI3hgj1KxEOSXtmoFLOr
         ZN0jl0VqjVwurwXCUdqebI141QWcwsfdSd3kt2k6z04Ah250narW8gzD1I98zpGaFlxq
         fVDiO9tdVXVWxeJKZW+myxwn4OTwRznwPrRi/RpeFVohVzdGB8c+g9b7jzt/AxdBpaIT
         HFcLifR8Lys4MVPulXDoOBfiFTF9sMi1q0Jjyf1r2at7ovkI/IHkjwaKY7WwTimSo/gW
         IF//KjdGXLG+MmPdAHZlUG5z2E5M7A8HI6hs07EgHhCd9Lfy3wwtxFrBhbv3rCTg7E5e
         uilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272307; x=1789877107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Oa+YOncmCkkVL2k0GTFisduj2Byb339ftd8reg9zeE=;
        b=n86jWd5gm27HNo3Qi9PURxBhqDs5c5IVge3CVQttQUpH8bSyP+gp0cVQSFJ3Uv2pDu
         acqW+VUGVbCrfJsLRpkFcBfDG5EsflQ8cn0Hg5ZNyXfFAf7KBrmFHb3X8RRvGgWE+Me9
         s20TLKFBhpCuqDWkfe9h4TjqKtYlbcCH/+Pjic2hqaHf8ATBfAu/IhAa8hO7ymuTrSJr
         pWSuW4uDWTRgdhziQIYML0TOSxAHs3ToNJnWcvLct1RrbcY8+GIsU7eUQiKT1JQArXTE
         b5qD3lcv5FcSN369FHKr98E9k+eSO8lqGD9lARNU9ymQQC+ovKAM56rUbQiSBTWGqTam
         0tYg==
X-Forwarded-Encrypted: i=1; AKwUvBzdqwcN8BmAlfvXoSQd6aeQ4hfkGzYCEKxjF7dysyI9dQ/HNEeHCDsY2Jf2DIx7qVbggcsLPG3pdtbTu0nWVI7u@lists.infradead.org
X-Gm-Message-State: AFuF++mTj2ybP4W+6Eo3IkaegFE1Odun8N3+JWS5XbhSx/QEvbDZmaWT
	TIP2UC8mkrGN7khCrUNXxoAFIe96RLS078buBpUm9zF31454URFIaOmuTqMheg==
X-Gm-Gg: AYBFou3OqKeuHd5sgOo1FZDi+lx0q4RzXUPf/dFJr+zH6QsUwA+pJV7x9MlE7usb6j+
	aqa3CtBuP91UZED65u9Poct5ndZ5fGZMVhFgGBqkO9ujb+jzUjM5/sCptl52PuS4Ug08bhAebs2
	Rmk51KjZknxhrBnmkSY0gep4C2/gYzO/qRyHj7B1iZNad7yescMBIGGq0sn7D+cDy8+jA8TjfNC
	WpFvJFew8QAY13V+sx/tBtHnxJBc4kvWfRtm00zc5Ekf23pCirZHV21FSqEJ3ApjObRie/+GYKS
	UQFipe+bvt+4dwVnoUZbL6hNSSkiRRPFMbQOv3aFzOnt1OWaQNMZDQzrfmtpu66HWPMDdpPEko3
	rHne5QsANmKS6ew4bJKNHSS4yZCBd6Y/qakztih0IEJEcJjUCXH/7M1Y6lhuobjSj7cyK8U7E2z
	8w2iPfQsdx2EcoR5S6DzUj1z/yvlqV4im121pj3vpCtnPI2HWSCTSHV2JWCETPhCf46fT63MytO
	sqT0q5/p0LnWRA+MBBonPaUwost6bE/yqeg/8zQvIaumpIdb3O+29ZG2RXfPKSiXwIhdBKv3QpR
	crXJHCi3VLZVCDuuyPXntqDmkgXKvUCPloXXzOar51tqsLe7NK/oE64NmrED2XDkscl5S9AM9sL
	Wa6y7YwPZ04AQz4H8BP7f1lji6CPU3lToqOy3rv0U
X-Received: by 2002:a05:6808:6807:b0:4c2:2fb4:3676 with SMTP id 5614622812f47-4c31bdfc3ccmr17088364b6e.16.1789272307014;
        Sat, 12 Sep 2026 21:05:07 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 00/17] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Sat, 12 Sep 2026 22:04:51 -0600
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOz2oCMRAG8FeRnDslk0Td9eR7lB4mf9QpbiLJG
 hTZd29WD7Y9WRgYPhh+39xECZlDEZvFTeRQuXCKLZi3hXAHivsA7FsWSqqV7FBCOduBx7bihSF
 S9FBD9ClDShaOdE3nESpC0IjGo3Sud6Jhpxx2fLkXfXw+cpO+ghtnfb44cBlTvt4/qTjf/bu0j
 QSz0t1SExry/XY/EB/fXRrEXFrVk+2leZlVjbWo5NrsDDla/2X1T7Z/mdWN7XTnrLSES/OLnab
 pG+X8tRicAQAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210508_694483_2E8F79BD 
X-CRM114-Status: GOOD (  18.48  )
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

Allwinner NAND firmware leaves the bad-block marker in the randomizer
data stream. On H6/H616 it also places all protected user data before the
first ECC step. These choices differ from the mainline format, which
keeps the physical marker plain and maximizes the H6/H616 user-data area.

Add allwinner,randomized-oob to select the firmware format for the
configured hardware-ECC geometry. Older controllers keep their fixed
four-byte-per-step user-data layout; H6/H616 use four bytes per 1 KiB
step, capped at 16 bytes, packed before the first ECC step. Without the
property, retain the existing marker handling and OOB layout.

Normal hardware-ECC accesses use the controller randomizer. MTD_OPS_RAW
continues to bypass both ECC and randomization and expose physical data
and OOB, including randomized markers stored by firmware.

Address the ECC-error paths as well. In randomized-OOB mode, use the
controller-specific vendor spare-byte erased-page heuristic on the
protected user data from the original hardware read. Older controllers
use exact erased-spare checks, including their first-page and page-127
signatures; H616 requires byte zero and at least nine of ten spare bytes
to be 0xff. Accepted erased pages return all-0xff data and OOB without a
raw reread. An all-zero physical page instead returns a bad marker and
an ECC failure.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Prepend independent fixes for interrupt/completion ordering, PIO OOB
lengths, per-step pattern IDs, read/write error handling and duplicate
OOB program confirms, followed by OOB-helper cleanups.
These fixes also apply when randomized-OOB mode is disabled.

Also combine contiguous unprotected OOB reads and reduce repeated chip
setup and register accesses without changing the page format.

Finally, bound H6/H616 DMA batches by the 128-byte user-data register bank.
Keep the existing default OOB allocation and ECC offsets, reusing hardware
slots across batches instead of changing the format or falling back to PIO.
Preserve page-wide ECC accounting and a single final program confirm.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- prepend an independent fix for completion reuse and IRQ timeout races:
  initialize the completion once, finish IRQ register updates before
  signalling success, and drain timed-out handlers before clearing their
  interrupt state
- add a separate fix for aggregate protected-user-data register overflow
  by splitting DMA transfers into bounded batches, retaining the existing
  OOB layout, ECC offsets and DMA support
- distinguish logical page steps from batch-local hardware slots, retain
  page-wide ECC accounting and avoid retrying partially transferred writes
- Link to v3: https://patch.msgid.link/20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com

Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Boris Brezillon <bbrezillon@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (17):
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1158 ++++++++++++++------
 2 files changed, 827 insertions(+), 341 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


