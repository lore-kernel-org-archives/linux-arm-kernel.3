Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E275CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kS+v7UxhH3NIRfcFBUgh9cjGXshVr2JyUKKPIyxO3A0=; b=0gHvwIYy5SwjGbq+UIj3uzpfJx
	s5LezZB/dT/SeLSwDgapkY0exIrwdJWE4Zdx4h55sMrT8Xf4v8ZKRL7v81L0Sez29Dga21EdDa/zr
	71Y2BciABKXmuPI5f4D3mfvATFFoRYPl0Z131DBg84qua4K7xhWb5UT9gb11XyesGKL9RZpHujAAh
	WRy/FSKaDFHc4Wa//O0/f2JKBp/2JggvSk3ykxrqDuA2liqey6jHWNWUJhbK0/hEEizaR5Fc9eOdG
	cJLniCoebnd4tStlq/2+PpsOhvdJPT/96zjZsbcjWvrvVzv83xW6mfNTKxSOwLt7xPQOFfuj3/COZ
	Tm1QNDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFT-0000000FQPu-1Hqs;
	Tue, 28 Oct 2025 07:36:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFO-0000000FQOG-3nQz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 07:36:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81C24C0BE98;
	Tue, 28 Oct 2025 07:35:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FF69606AB;
	Tue, 28 Oct 2025 07:36:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AE70102F2511;
	Tue, 28 Oct 2025 08:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kS+v7UxhH3NIRfcFBUgh9cjGXshVr2JyUKKPIyxO3A0=;
	b=e628aea8rtzS7HMfOueonC377QxRQ8Kym+dGULqdTzFtYF6atHkETnXomz5YoWuTMq0eZL
	tk41px3Vj9dCl5lttpveLS1T9Q2/ex3MRuF8np9QSc/c+A9P5aNZz/Re0fWt8f+B36M0e7
	J1o0Sp0TEOEePjWxBdfjfn0xAVd9kOSOVRcMUIm2OoSVUSBYtno7/CD/b0dG+IUyvV5Yig
	Qi7vLyjP5a9K5eNSwSSrzOTkw7XyTB26L0hlYFwgLK7kXgKRXP0kJgu0ZJkpd/Gk9NhVOw
	RywNA517kYC0l8fZRxpXa++PSHGtQB7fomey5bqpUgapWnGYV3di6OcciGdEQg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 00/16] Introduce Allwinner H6/H616 NAND controller support
Date: Tue, 28 Oct 2025 08:34:53 +0100
Message-ID: <20251028073534.526992-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_003604_117138_79EC0591 
X-CRM114-Status: GOOD (  17.53  )
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

Hi everyone,

This patch series introduce H6/H616 NAND controller support (but not yet
the DMA/MDMA part).

All the work was done on a H616 board with a Kioxia TC58NVG1S3HTA00 NAND
chip.
ECC is supported, as well as scrambling.

H6 SoC has not been tested, but it shares all registers with H616, plus
some registers dedicated to Embedded Crypto Engine that H616 lacks.

This IP has quite some register fields modified from the A10/A23, but in
the end, it works more or less the same.
Main differences with A10/A23 are:
- The need for 2 more clocks (for ECC and MBUS)
- The use of a new USER_DATA_LEN register
- More ECC strengths (44, 52, 68, 72, 76 and 80 bits / 1KB)
- MDMA based on chained buffers
- some registers layouts have changed (mainly due do the stronger ECC)

Patch 1 introduces allwinner,sun50i-h616-nand-controller compatible
in order to differentiate from the A10 and A23.

Patch 2 removes a superfluous call, and is independent from the others.

Patch 3 replaces the hard coded value '4' used for user data length by
a more meaningful define

Patches 4-14 are paving the way to the introduction of H616 NAND
controller support.
They are small, without functional change and easier to review than a
big patch.
They move a fixed value (register offset, field mask, SRAM size) into
the struct sunxi_nfc_caps when this value is different on H6/H616.

Patch 15 introduces the support for H6/H616 NAND controller.

Patch 16 adds the NAND controller node to sun50i-h616.dtsi

Changes from v3:
- fix patches order by beginning with binding patch and finishing with
  dts patch
- add a patch to replace user data length hard coded value by a define
  as suggested by Miquèl
- un-break a line in patch 5 as suggested by Miquèl
- update Geert's series link to v5
- update patch 8 commit message with a mention to Geert's series
- address Miquèl remarks on patch 15:
  - change // to /* */
  - remove statics set to false

Changes from v2:
- add missing 'status = "disabled";' in nand controller node.
- factorize back clock/clock-names in binding.
- pick-up reviewed-by

Changes from v1:
- reorder patches to have dtsi/bindings patches at the end.
- reorder nand-controller and pins nodes to respect the order.
- add /omit-if-no-ref/ on pins that may be unused.
- remove pinctrl from nand controller node (this should be added to device
 DT).
- rework dt binding.
- fix H616 comment on chained descriptors support.
- add missing mbus_clk description.
- make ECC clock mandatory for H6 (because it's indeed mandatory).
- harmonize new clock retrieving error messages with older ones.
- harmonize commits subjects (mtd: rawnand: sunxi).
- reword commit messages to use imperative mood.
- pick-up reviewed-by

Thanks Krzysztof, Jernej, Chen-Yu and Miquèl for the reviews!

Regards,
Richard

Richard Genoud (16):
  dt-bindings: mtd: sunxi: Add H616 compatible
  mtd: rawnand: sunxi: Remove superfluous register readings
  mtd: rawnand: sunxi: Replace hard coded value by a define
  mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_user_data in sunxi_nfc_caps
  mtd: rawnand: sunxi: rework pattern found registers
  mtd: rawnand: sunxi: add has_ecc_block_512 capability
  mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce random en/dir in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
  mtd: rawnand: sunxi: introduce sram_size in sunxi_nfc_caps
  mtd: rawnand: sunxi: Add support for H616 nand controller
  arm64: dts: allwinner: h616: add NAND controller

 .../mtd/allwinner,sun4i-a10-nand.yaml         |  41 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  52 +++
 drivers/mtd/nand/raw/sunxi_nand.c             | 407 +++++++++++++++---
 3 files changed, 426 insertions(+), 74 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.47.3


