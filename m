Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2ACCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jI+Ive4AxdeL0phc/iy7IBSWWLYJLEaf4nq97ulSuEE=; b=ZmoY+O3XS2hGZo
	Nxqu9slwTjf0/ZvKZj9AZkjQOW1RzOqY3ZrQ9ktxT7kg4bRiBK+OJPmQFMZQTkNgjCucEo4oBo6pv
	wPc3AT8UhlA64Z85cQCC6/9yrvC0/u0KKexzyGu2fosqN9X1hsiQfvHtvhgnNsKJHGg7Zs8aOrNaX
	cn6mI1MZOAf+nirI1OWzpVZ4xXqu6JeRZc+xoF1ZSmwhkD7vFjru9LQeaNjghVZOQsuJ5k3SlGgMt
	0UoteSX53uxTxDL5rVyLCCqc3Drha/4loG5o5u2L/hg+5t8Tnb3pCnq84BOSzEvv/GA9Vd9ZkXO0R
	LwixKHrre6u+HTsvyGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMI-0000000GY7D-0dQk;
	Thu, 15 Oct 2026 01:34:14 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAME-0000000GY61-3pnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:13 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so582260fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028049; x=1792632849; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jI+Ive4AxdeL0phc/iy7IBSWWLYJLEaf4nq97ulSuEE=;
        b=gqxFF8IaA6raMneo52a7gHfo6A1QkdRw2rQcwQmFLjtsPknUZifkcmk+oQ3Ak91rs2
         dBpvLsNjaXrLSifiK/vEkt5lblBsz1UJ3BLONpbKOMI9Se7W1A9F0+Wczdh7KlnL2shM
         v20FPbz/zJx0XRsdSQmkfEiqjGhF306fm/vwY47XDC2gF/RElT158pwi4jXMVpXsIkQP
         mM6LVomnYqVOcFmWnyLPx1G8H3emw+S0dDRtjvbtFHICl1wNrktDTYBYlKzwARWzcOzS
         +bXzIPZCHsf5AwrAFHzJ35RZ4tmf6+HteWHfJinO9qxd/JhF93DddUm74Z9/01FIIHQ8
         sxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028049; x=1792632849;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jI+Ive4AxdeL0phc/iy7IBSWWLYJLEaf4nq97ulSuEE=;
        b=UtX4QE+p4bfpG3TljuWVNfKDx0VPXU0YWtIACe96wQtZ85CD6iort61AanMBW+sKIL
         ZfO8ri5IG9qdIcG5hSr3gM7cZrGH2R9yYMVu10Y0eTxUqMKZc0r879gnimI4hdSl05XB
         yfYeOaSNZ/UJj4VMDjzZ2BIybI/zGDgt5ZfbGIldmQTakRP5FkTK7/DPyaLuCSdY91xV
         5hPMLXFRhrImpc57eZykbnTPP+IIDCZjVAcYWzZiN7WgrnKbIc7uK2WuJS6xdwYFxivi
         vy1XWe3IQMHtOUNyubTfXQv4vX1j0L8/WsCA3WLD6zkd1FalN1urKZhRC0i5A+wDsnFx
         TuPw==
X-Forwarded-Encrypted: i=1; AKwUvByh6vZ25gEvpQ8rdXdi7QQPRjsuLeRqecrvdl6gVj+cm2Ta0F14SmTDH3fAi5/eIz5rz6HnEuu4+b8iiufeGifS@lists.infradead.org
X-Gm-Message-State: AFq9FYIUDytIPVmsGGJLnGs0UjI16ME1zPidHA3coZYLtifcUNxq/MLe
	BeyO/q0neo+hpjgAKBqAA9VbiPhHE14645sPALzEyMtQxVSqILUI9rVV
X-Gm-Gg: AYBFou1g+AS41iLNV00zw15DsoDCp7m3maP1UZywosHgoVJ2F3uOU709V+s/37TBDKF
	8fn47kCpEUKatIVsH+2G6yIc+nPFhmdte/JLJDyEhaQzzr57UDrZi6Dkc7lBA718NrnDuNNxoDC
	bJN5fcMLg9DAC/VF6XrCeXroL3gLv54iH9rsjJS7aQZI7ipm9CUSY/KrlI96VI2PQvK7WmZcj5O
	oVpu3mjTPmgRDek9qf5Iq5UR+QxoRV3nmsclZXycS6hi/8nzm+NuXl/7BU+ntwCZGyvO1kwzvu0
	QBLgZOp+6gh+iCbPpI8sK+JSa28Rxyj8gS0ip/1pfgVcy0UAsGrR+m4/73tml3Fz76hs5C7z85B
	HdU0GPmDPGSGF3lRDJSMejwdF7Ajqu58zca4ewDCsnRRQAXFqLeO0cB/36KPE5pF5UMUJGjdsqL
	4WB7RGLIf2wwnVCvgW+cFOVTXPRfAzoB5Ef6FAi5fR++q+fqzKhP0ZuCD3id9EIXmLvPD8Xh3Yx
	VLguNYGlEJ2dFfi6ZbgsYXRyikxp7WnfnTHIBxid8I44oZ+ojEjsvCgxOLfiw+1vOAL8zmyhGPX
	2weiCBoYk8yrRc/tLVCY127vy5aqswWs7yml+6tLZbiFnJZA1dl+UsII2o68XGaS6pdtns0pZy3
	Q/yHN/bqBNaQ7s/bxOKZ/
X-Received: by 2002:a05:6870:b2d0:b0:493:7742:f0f7 with SMTP id 586e51a60fabf-4a2a896b22bmr15664913fac.11.1792028049365;
        Wed, 14 Oct 2026 18:34:09 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v7 00/16] mtd: rawnand: sunxi: fix transfers and support
 randomized OOB
Date: Wed, 14 Oct 2026 19:33:47 -0600
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTWrDMBAF4KsErasyI40lO6veo3ShPycqsVRsx
 yQE371yuqipNy4IxIPhm+E92BD6GAZ2PDxYH6Y4xJxK0C8H5s4mnQKPvmQmQCioEfhwtV0cy5d
 ukSeTPJ9C8rnnOVt+Mfd8HfmEPEhE8gjONY4V7KsPbbw9F71//OQifQY3LvoycY7DmPv785IJl
 7l/Ly0POClZV9IgGd+8nToTL68ud2xZOolftgHazYrCWhSgqSXjjP7LyjXb7GZlYWtZOwvWYEU
 bllYsit0sLSUYRTb4hoTYlFCtWbmbrQqrvUYErYxqN9eqNbu/W1VY0VqoqQ2gK1yz8zx/A8liD
 TGhAgAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183410_975369_4C114B72 
X-CRM114-Status: GOOD (  19.65  )
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

Patches 1-14 address the existing driver independently of the Allwinner
randomized-OOB format in patches 15-16. Please review and apply that prefix
regardless of whether the format extension is accepted. It preserves the
existing on-flash ECC geometry, bad-block-marker representation and raw
callbacks.

Patch 1 centralizes OOB handling without changing behavior. Patches 2-10
fix logical-step lengths, read and write error handling, completion reuse,
pattern-ID selection, duplicate program confirms, small-page read commands
and the H6/H616 user-data register limit. Patches 11-14 then reduce repeated
status reads, column changes, chip setup and length-register accesses.
The pattern-ID fix precedes status caching so correctness can be reviewed
before the register-access optimization.

Here, "user data" means ECC-protected metadata in OOB, not the page's main
data. PIO reuses hardware slot zero for each logical ECC step; DMA can
transfer several steps at once. The patches distinguish logical steps,
hardware slots and packed register offsets, and explain their triggering
conditions independently of the format work that prompted the review.

The IRQ fix retains timeout-only disable_irq() and explains both the
forced-threaded PREEMPT_RT race and the unbounded cleanup/no-priority-
inheritance tradeoff. The small-page fix is limited to read-side
repositioning within existing geometry restrictions. DMA batching preserves
the installed OOB layout rather than capping its allocation.

For devices provisioned with the Allwinner normal-page format, support is
required compatibility with existing flash contents, not a preference for
another layout. Its bad-block marker is randomized: applying the existing
plain-marker compensation can make normal OOB reads and bad-block scans
interpret good blocks as bad. Switching formats is not a transparent
kernel upgrade.

Patch 15 documents the opt-in binding; patch 16 implements the format
through separate OOB callbacks and an attach helper. Its geometry,
page-wide classification and contiguous parity reads stay together.
Without the property, existing format selection and callbacks are unchanged.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v7:
- Put a behavior-preserving OOB refactor first, the correctness fixes next,
  register-access optimizations after them, and the binding and Allwinner
  format last. Keep 16 patches with no external prerequisites.
- Keep logical-step length, read recovery, IRQ lifetime, write failures,
  pattern IDs and DMA limits independently reviewable. Correct pattern-ID
  selection before introducing per-transfer status caching.
- Update both DMA callers with the protected-OOB helper contract in the
  logical-step length fix, before the later batching change.
- Isolate format policy behind its own callbacks and one opt-in attach
  path. Fold packed H6/H616 geometry and contiguous parity reads into the
  final patch, leaving existing format callbacks unchanged.
- Use scrambled_plain_bbm_oob for the existing scrambled profile and
  allwinner_oob for the firmware profile. Keep shared randomizer helpers
  generic and name the H6-generation spare predicate after H6.
- Clarify protected-OOB terminology, logical/hardware indices, transfer
  failures and the limited small-page read scope. Explain the RT timeout
  mechanism and disable_irq() tradeoff discussed with Miquel Raynal.
- Explain installed-format compatibility and that the spare check re-encodes
  ECC-decoded protected OOB rather than rereading physical bytes.
- Drop the standalone OOB-helper renaming cleanup and explicit stable Cc
  trailers; retain Fixes tags and Conor Dooley's binding Acked-by.
- Rebase onto current MTD nand/next.
- Link to v6: https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com

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

---
James Hilliard (16):
      mtd: rawnand: sunxi: centralize OOB handling
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: reuse ECC status within each transfer
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support the Allwinner randomized OOB format

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1537 ++++++++++++++------
 2 files changed, 1065 insertions(+), 482 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


