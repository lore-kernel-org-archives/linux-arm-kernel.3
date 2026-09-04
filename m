Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F22C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=; b=ajvNjjhmGUUM9k
	P1IugFigHNBJ5YEMarnZvilFZADaUOaSQvXxI6WtaTM9DCIrRjaxh3Vy+w/S2ljLZrYgPVJHUjiM4
	kWuWlOiyJxbDzHDQWvCknL97LMqP905qfsjQrjd6F1b+jOf1ccrRwxfBsI68KZbamPFK9nVDGn7Tk
	juGHfu6LPHvcIBapXeAbccgF/bcDgWyWKZHi69vH2HRpTF4+P78jyKickAakfONZZTmTWDDrl5vdL
	sFsrmDEg96K5UJYTb4wUDApzGaAGYWIaXk1u5kuz1Z6GzfajC3i790/RLncwXFQhwmRxxftYuppoO
	DQHUYbbkbkm0c9UlUI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNr-00000003Jd5-1d6d;
	Fri, 04 Sep 2026 21:23:39 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNo-00000003Jaf-49OF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:38 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b34face6d0so886617eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557015; x=1789161815; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=Elput1FWBC1zEwwrR2qfsfMtzf5dxgUPwKTiRAcik87VNqRFNsdERRJRqR+B1KG3qe
         Yy8jxz3kaqrAtQsgEKq+u3rGKltqRzW3GUom+7UxzYAg/sNlcI3Nj52jri4HZfcv6agG
         L9CUA2YxPJTrcbMu228Xc2yLI2VLug8taG7JpfHBr5Ozpzsc97ezUm6lxyFPxm5hg7RT
         wWEPX958rawl4DQgj0tQHC7ci/kcqaAci4OeCLWcPpTow8o50WfDuAJQBV5kESFrB6lS
         U5Q3WHlwyBTSoWXanK+inyQgiK0noSHfbZZLYso4Qp8TFfW1rOzUpu+iReoIXYAYeoOh
         Dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557015; x=1789161815;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=A3amlTetjcqD9KinBwCEexbvwQ1ICPTW3lOjcrNCE4wTXpq/EkrnFufAy/YwK9UUw6
         P3LKTSqx1uUTmuoaZAAX1s4eLpDTuoyw3tX5ScJOFu+W6EUcm5x1UKhaR/1Fc7xsddbe
         YcJ3ywT0scS0sAeTsdjQBP79AY2OU47oQiIJk4cdQJAHZIoUHrmkBJfQo1rp1Sx0ZjBm
         lMvPhvwAG6PkAeHJhBF4Y2Y+T3vAB/2+8GcFymGA7uGbwN5xfy85OH8yM7PKrDnmyLb2
         zxT4kjxFGrPTNwmd17kUB1AGJvTplnPcOTxzZa2fHnjOV6zdCF9OcWdPgn75FS1oCdqh
         nBTw==
X-Forwarded-Encrypted: i=1; AKwUvBx/cmqZ8+cLBauG10pDfZHWrLGUS5sj5isGQfPuG+DPo7w3vxBKJkxlLLJXPgUI7mbBSnhGKYxZmiPRoJ3FyAh1@lists.infradead.org
X-Gm-Message-State: AFuF++kHafvjPZNTVDtQrBYQJ/KZcIUaVGAtzNO0OVh8DgVP/CKqXTEY
	KlSbonzgCchlUkJrBUYy2hTF/6YzF2E/E8VQ2NuIPt++gyvnNxY8/mioJRXDOg==
X-Gm-Gg: AYBFou1FjH1KvtQPs2pCE2LrcR7nHkGlzsFTFZOWb3zBzR567TgILvAq7nfvW8zSDkB
	QckgZ9bxOBRHQyyppusJnNaRYPxHwelkVlMuBGCGntvx1G8cFxHb1LqZioGG0AAFTuWgZXjEEUn
	kBvxiNhWeEfc3kbMSRpje5CwEGZWhPdlDhSjo4b2fXi/lTOfYAKYIGos0RmwspGrQzKXae4Y36f
	8f+EmebtgtTacsmpexD0jDMBr4RIKM4gjfrilg6l6iQxRNhGrZCBcgbxPhmFut8+XRfjYnFHP//
	3BiATEjlS7dLZwLc6/oPa9vPYe9TnqoiGJoI5Y+h5wqdcVozcnx9/mnDnjBB/64f5q+PszJFsO5
	MNsAgOGdPNHLOeYoMS9RO3zNVHdL/DFdK1pB4HdazCHlrC+A6LrQNWD0/HvSH+SKFRw0ecvu6Pi
	pZx3A3PcJikv5ibgb33JN90lQQL6hY1R6dP6YwoTGhiCDMeVHSsjREyTdL4x4pS9Ez4cg+JiqKA
	uDnYJbY66LcpvrG7PhYcxTGQ/H4Oqih7MsMoMBxtIB7Di2BSvfMmbDfGElKzd4pOy3WqWlkWvIS
	2Wo0dcPmzl0EYO3cnXD8UUreomp9UJJ+CLXPAmgY+NICnDfrBIczzRSY8HUhjTALycjfeJHPgq9
	Oa9yHj6MIMlozaN5lVAQ=
X-Received: by 2002:a05:6820:618:b0:6b5:ec3f:4981 with SMTP id 006d021491bc7-6b71fe45f4bmr3369775eaf.28.1788557015327;
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Fri, 04 Sep 2026 15:22:10 -0600
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryJZd0qiVrSr3qO4iMlUp2hSkhgU8
 e6N9gSFgc+Dz/uzMY+O0LN7tjGHkTxZkyC/ZEwN0vQIpBOznOcVrwUHP3cThRRmITDSaIhotHV
 gbQejXO0cIArAQohSC65Uo1iSfRy+aDmHnu2Pk+mNKhz2ozGQD9at5ydRHL2/R9NxKKuivhVSl
 FI3j36SNF6VnVi77/sXCzwag+4AAAA=
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_142337_052807_88BDF8DA 
X-CRM114-Status: GOOD (  17.65  )
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

The sunxi NAND driver applies page randomization from its normal
hardware-ECC page callbacks. Each page starts from a page-dependent seed.
When protected OOB bytes are transferred separately, the driver uses
precomputed randomizer states advanced according to the ECC step size.
Erased-page detection and its physical-data fallback also live in these
callbacks. Randomization is therefore part of the driver's hardware-ECC
page format rather than an independent MTD access mode. MTD_OPS_RAW
continues to bypass both ECC and randomization and exposes physical main
and OOB bytes.

The mainline format compensates the bad block marker before writes and
after reads so that it remains plain on flash. On H6 and H616 it also
fills the OOB space left after ECC with protected user data. Allwinner
NAND firmware instead leaves the marker in the randomizer data stream
and, on H6 and H616, uses a fixed protected user-data placement. These
choices produce incompatible physical OOB layouts.

The Allwinner BSP implementations for the SoCs covered by the two older
mainline compatibles (sun4i, sun5i, sun7i, sun8iw3 and sun8iw5) likewise
pass their protected user-data words to the controller unchanged while
page randomization is enabled. Their 128-entry seed tables match mainline,
and those controllers have the same fixed four-byte-per-step user-data
layout, so only the marker handling differs on those generations.

Add allwinner,randomized-oob to select the firmware's normal-page format
for the configured controller hardware-ECC geometry. The property marks
the NAND as requiring scrambling for normal hardware-ECC transfers, omits
the marker compensation, and selects the controller-specific protected
user-data placement. H6 and H616 use four protected bytes per 1 KiB ECC
step, capped at 16 bytes, with the complete protected region placed before
the first ECC step. Older controllers keep their already matching fixed
user-data placement. Assuming the standard ECC geometry is configured to
match the media, these choices make normal reads and writes compatible with
BSP-derived images.

The property does not change the per-operation raw-access behavior. Raw
accesses continue to return the physical representation, including a
randomized marker when that is what the firmware format stores. A physical
marker cannot be both plain and compatible with firmware which stores it
randomized. Normalizing only the marker in MTD_OPS_RAW would make the result
non-physical, while enabling full-page de-randomization would make it a
decoded access rather than a raw one. Preserving both the firmware format
and existing raw semantics therefore requires raw access to expose the
randomized physical marker.

The raw-NAND core's bad-block and flash-BBT paths remain on decoded
accesses: nand_block_bad() uses ecc.read_oob(), OOB scans use
MTD_OPS_PLACE_OOB, and BBT data reads use mtd_read(). They therefore receive
the logical marker and BBT contents through the hardware-ECC/randomizer
path.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB read through /dev/mtd6 completed without
reported ECC, timeout or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     | 10 ++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 56 ++++++++++++++++++----
 2 files changed, 56 insertions(+), 10 deletions(-)
---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


