Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296CCC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XwTPxRgU+fYFHTYoxwRr5IV8pHvdn98ivroHogPVzFs=; b=dy0MLtKyL+dMgc
	PtQLCOUoBqpbS49ClHS4KNnHLrwtjwdGZz9D8GxnG9ru09jrRPZzo2IXvPyCn1od5W00EQkzjFloI
	r5HJElmuj5M+m5Gyxx24ikaNL/Jb1FdRUISbFjryw5IkSWXmbSAmZLSQtBZhxOJ3KqM+TkbbkSuvd
	r8H5+kD40e1vRFo2RzbKxcTdjiDcdakvWM3o/bIt0UsuTmYHcVaTJaTc7TYZLecN0WIlZfDCPCe06
	5amLNfKLgOitAFeUmJ7Rug8zUBgtwgtTJ5wNqNReLZmOjDNoOT3yDBJiYVf8vw0E8XdKYY7wfW2Af
	RKTfT5UJbCZXyisk3ieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fOm-07fU;
	Mon, 14 Sep 2026 21:10:01 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw5-00000004fLy-08oI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:09:58 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46accbdfb21so2065710fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420195; x=1790024995; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XwTPxRgU+fYFHTYoxwRr5IV8pHvdn98ivroHogPVzFs=;
        b=bKLA1qQNdHZFkt/GX8YHGeqwxN03Hflh1PYb6+vYBWBgZKQHChRtzz/MH2qWNzs/tZ
         GP6jIBZ18p6LLWvxWJRSDVr0IpWpHR3zIZ9ablgNnlJVAeTNIHhGaUybzI8I5BJlM1rq
         Djqv/MXgmszovKeISnHRrey/7Xdln70FkM9veUlQPA3zGnEtW3zf+tEBY5LMkD8BTuLM
         YRIFC/yWnBakmAbnq2EdgdqYYvSn8ON6CCCQ/es0culLJK9Rsh62IgjfxWCMSr9pX/xt
         7lhN88dsLjtg/4sqI3EVDNXD9tKcpvlf8o823zxHuJxjp0ge0ZZ6WsafBWZ5plbtLNJ9
         9Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420195; x=1790024995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwTPxRgU+fYFHTYoxwRr5IV8pHvdn98ivroHogPVzFs=;
        b=lrLw53B9MkGSxtJBP1WbmhMGrbyqMgZOYOuGPblqBSFJrHthXjhVm7XiL+XbNCWXUw
         lZxiv4FPgoZG9YJ590ZWIhmalk2jE86sMb0D1Z0/16b4tTZ2H48nunkg1o40HlMzXUKP
         V2dasUCT5QjKo1VlMpRzcEi08QMwlxsb9no9kHHENOx4I0fftpwLxz2BdlLE0N+cBfki
         I7rvgo7ky5z581YvTOQXZyLM3+Nd2Odx8/Gyum8bzMo7Qou/ahlOs/lhe7D30gW6Ifjz
         vZ+0shQw/3bvN3TBPfI+HJUrxbOHgPRClT8o1VIl0CgY1es2LBDzBu/Zlw4rUikp2xBi
         du7A==
X-Forwarded-Encrypted: i=1; AKwUvBzNS/rVYrd3Sv/UHA+Td8BbH/glvyoBesniD4MkQmaSYyDw3pRSNqgyFImTD8n9wjijLghlrO2d0S8dHbx8ecIb@lists.infradead.org
X-Gm-Message-State: AFuF++k8YRgKLD4SjdQ7HzGOHN1AcCbnllaYrHDBASqQwAEcdDQFaBz9
	4cee3oK9y2ZcHSoXet54MB0bH+89mgMpxzNQH9F8Ms7okTn6yFfQtbJg
X-Gm-Gg: AYBFou2tjzvqnlKDsbsdTvrfzufAQCvTNNj6JVMM0Mh3wohIl1MjnA48nJpLoI//F3M
	xseQXI8FeZBIpV54F8yPQNHJZNYqzzdMwWzdAn+YgPeoJ8LIgaqhnmqHPh/TK4dBmEbLNaDqCR2
	Rko994SxRLx6WHAGLI0nOmHf7Og4800NYFe4eyPvW1GioYfYwW2Z9XriTN8lAx55TJaIglP4zoD
	qZGAv2uk/UfVSD95uT6yS/e2U0LQiohDp4rX8CmIYuuzBSjs4qNsL46Bd7aA5UM4SjnAbuMmXTE
	8G+9xEV5iNnlel88IhDLCRtZyMKtNhGqtW4/OZC22zHBRnz40+cmxP2Sp8f8MpMwFLt0gAOsp/p
	Y/RbitutEg9+w6oezFZfokg9JHjkEZL5cvBpquOeUVuMZGymDxTtFmDST9o45qppzL3j4ZGqjdx
	kt/cd1+Vry6Ft28wqs67DeT0PhL5ymJhmycXBFPCIE682dtRfWRggSBPVo4JB2pX+K8cO+rbYSd
	EtVR0tqQcN1B4WssjNn+yE/SWl9dI42TJVQWWqqgoU0Olx7ElLmVxk6jHIXeHC2q6iCrjbOwEBn
	XIqkykbCLnP4UnY7OHnvvGVV7f5K6jR+pLhJWTYSmMiYXorBqlITL2mzgdltT7TJAyA3xvQNK0p
	hdsFowKNXutJmg5Cz+hFnXaqxRsq7
X-Received: by 2002:a05:6820:c86:b0:6b7:318d:85d with SMTP id 006d021491bc7-6c5418508femr4548990eaf.25.1789420195159;
        Mon, 14 Sep 2026 14:09:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Mon, 14 Sep 2026 15:09:46 -0600
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTWrDMBAF4KsErauikcay3VXvUbIY/ThRiaUiO
 yYh+O6R00XdZuOCQDwYvjfMjQ0+Bz+wt92NZT+FIaRYgn7ZMXukePA8uJKZFFKLBgQfzqYPY/n
 iJfBI0fHJR5cyT8nwE13TeeQTcK8A0IGwtrWsYF/Zd+HyKPrYf+cifXo7LvoycQzDmPL1sckEy
 9y/S8sTHLVqKkWA5Nr3Q0/h9GpTz5bSSf6wrcDNrCysASlq7JAs1X9ZtWbbzawqbKMaa4QhqPC
 JxRULcjOLyxFIo/GuRSmfjlCtWbWZrQpbuxpA1Jp092vbeZ7vGO3hYEoCAAA=
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
X-CRM114-CacheID: sfid-20260914_140957_086661_2513A55A 
X-CRM114-Status: GOOD (  21.06  )
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

Keep ECC exception mode enabled for physical-pattern reporting. Uniform
physical steps can suppress hardware ECC errors, so classify them with the
vendor page check too and exclude their correction counters.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Start with fixes for interrupt/completion ordering, PIO OOB lengths,
per-step pattern IDs, read/write error handling, duplicate OOB program
confirms and the extra-OOB cursor. Follow these with the small-page
command fix and the DMA register-bank fix, then the OOB-helper cleanup,
binding and randomized-format support.

Use page-addressed reads to reposition small-page NAND in hardware-ECC
read paths, retaining transport errors and the existing geometry checks.
Select PIO for those pages because the DMA sequencer uses large-page
random-column commands. Large-page DMA and the on-flash layout are unchanged.

Bound H6/H616 DMA batches by the 128-byte user-data register bank.
Keep the existing default OOB allocation and ECC offsets. Fill the first
batch to the bank limit, then use one hardware slot per remaining logical
step: PAGE_OP generates later main-data columns independently of the initial
column. Preserve page-wide ECC accounting, DMA support and a single final
program confirm.
All of these fixes apply without the randomized-OOB property.

Finish with optimizations to combine contiguous unprotected OOB reads and
reduce repeated chip setup and register accesses without changing the
page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- retain the bank-sized first DMA batch, but transfer later logical steps
  individually to avoid PAGE_OP's absolute internally generated main columns
- keep ECC exception mode enabled for randomized reads on all supported
  controllers, using the shared physical-pattern classifier
- classify uniform-pattern steps even when hardware suppresses their ECC
  errors; skip their correction counters and preserve decoded buffers unless
  the page-wide zero override or vendor spare predicate accepts the page
- Link to v5: https://patch.msgid.link/20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com

Changes in v5:
- add a separate small-page command-handling fix: use READ0/READ1/READOOB
  with the page address for rereads and normal OOB access, and select PIO
  instead of the large-page DMA sequencer
- keep physical reread errors visible, preserve the OOB cursor and retain
  the existing ECC geometry requirements, including rejection of 512+16
  with controller ECC
- group the small-page fix and the DMA register-bank fix with the opening
  fixes, ahead of cleanups, bindings, format support and optimizations
- make the DMA register-bank fix independent of randomized-OOB support
  and the later register-access optimizations
- Link to v4: https://patch.msgid.link/20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com

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
James Hilliard (18):
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1178 ++++++++++++++------
 2 files changed, 846 insertions(+), 342 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


