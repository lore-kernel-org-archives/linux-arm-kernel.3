Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42293CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vyUxyP5gZaT2qGm7a08VKFmvCfpvDeHxeR+PC1uIn3c=; b=Nx1CZ6n48UoJvK
	TATbLhM3aoM9G1LSlbg/pw3Sj8Wkz+OKMnnlqn4xx5TkcYqKWQluPDzz3beAQE4pRz8GQo33UiUOF
	0BGcRPTzQae4QYwx1GXZqD5IllnZLZ5CDHQOqoWGTYhw8fWe/gDt3PBybBwwveeVAQ5wtlv0Gc0al
	X9U8m8Ou3Dq77B1eP/dNcl1esYhe+9+MzbGdZSltK7q1pj3Ac4K5D1jf4lvL/VKJA1waMwZZ/RF0k
	p0gx5xStmBsw2MSIspgu9FreX/Fo2Sa6eMrUzT2ptjiSz8qLfOHBHiKmF46mzvKwwXPNb1pcErnHm
	8XAlWOVyId/Ir7fm0NZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4s3-00000000dDx-2wmj;
	Thu, 18 Jun 2026 05:00:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4s2-00000000dDn-0INs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:00:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27B4943FC3;
	Thu, 18 Jun 2026 05:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133171F000E9;
	Thu, 18 Jun 2026 05:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758853;
	bh=vyUxyP5gZaT2qGm7a08VKFmvCfpvDeHxeR+PC1uIn3c=;
	h=From:Subject:Date:To:Cc;
	b=VklzBwsc01IeU3y5Q0U1iZ/UkbtV1eyaMSg+wVFiJfs1m7m4j+q32rwlNmGKAyGJn
	 7XG9QIn+F79kTNk8tURp4j7m2DZnv/BOX6McqRfFCP7ZaRn5ezVHhasMuRYXFvkrW0
	 i9zTKd2Qd1B+h+zKfgnYuNQVmo0+zSBeC2n/It+6lXH4wHpu4kfyXa0gWBo3XcEAO1
	 GBcqq97y7zqUDgfWditNHqzfZkX4iLA92BZHQEjVUmtaBuEAnd5v4pcJNAuFWEc999
	 5pAXNhHfwLRPUQTCNz5BZ/2Yq1qY0RFFe7df+GZvj88bkjTXUOH3leAa/SE7oWJo1N
	 6McfzbHRndf7A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 00/11] pmdomain: st: ux500: Implement ux500 power domains
Date: Thu, 18 Jun 2026 07:00:46 +0200
Message-Id: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgNpRa1eRRykjZrBVlr8AfHuF
 sdveO+BxFE4QV88EPmUJMFnqLIAu05+YRSXDZp0Q40yeNw1Ee7h4ogubJP4hGeLCivbOepqo43
 VkPM98iz3vx7G9/0APODuGmoAAAA=
X-Change-ID: 20260618-ux500-power-domains-v7-1-3c9d095828c2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Today the Ux500 SoC specifically DB8500 is using what is called
"EPOD regulators" (EPOD = Electric POwer Domain) to control its power domains.
This was done like this because at the time, power domains did not exist as a
concept in the Linux kernel.

This patch series completes the ambitious work started in
commit cd931dcfda5e ("ARM: ux500: Initial support for PM domains") which added
a dummy domain driver for Ux500 in the following steps:

- Convert the old Ux500 power domain text DT bindings to YAML schema.

- Extend the bindings with all the 16 power domains actually existing
  in the hardware.

- Add these domains to the existing ux500 power domain driver (still as dummy
  domains).

- Add the power domains to the DB8500 SoC DTSI file.

- Move code over from the EPOD regulators to the actual power domain driver.
  Since the two drivers now control the same hardware, make the drivers
  mutually exclusive.

- Modify the MCDE display driver to use the power domain instead of
  the EPOS regulators.

- Modify the DMA40 DMA controller to use the power domain instead of
  the EPOD regulators.

- Delete the old EPOD regulators.

- Implement regulators activating the VANA and VSMPS2 power domains for the
  power domain voltage rails that are routed off-chip as external supplies,
  re-using the existing EPOD regulator bindings.

- Delete the references to the unused EPOD regulators from the device tree,
  keeping the references to VANA and VSMPS2.

This is a bit of brain transplant on the Ux500, and the series is not very
boot-bisectable.

For simplicity, the series can be merged in separate paths and subsystems as
there are no build-time dependencies, as long as the result ends up in kernel
v7.3. Once the concept and patches are ACKed by the power domain folks, I will
send the patches that can be split out individually to each maintainer and
it can all be merged in parallel.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (11):
      dt-bindings: power: Convert Ux500 PM domains to schema
      dt-bindings: Add the actual power domains on U8500
      pmdomain: st: ux500: Implement more power domains
      ARM: dts: ux500: Rename power domains node
      ARM: dts: ux500: Add power domains
      pmdomain: st: ux500: Control DB8500 EPODs
      drm/mcde: Use power domain for display power
      dmaengine: ste_dma40: Use power domain for LCLA SRAM
      regulator: db8500-prcmu: Remove EPOD regulators
      regulator: db8500: Add power domain regulators
      ARM: dts: ux500: Remove DB8500 EPOD regulators

 .../devicetree/bindings/arm/ux500/power_domain.txt |  35 --
 .../power/stericsson,ux500-pm-domains.yaml         |  46 ++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               | 134 ++----
 arch/arm/mach-ux500/Kconfig                        |   2 +-
 drivers/dma/ste_dma40.c                            |  97 ++--
 drivers/gpu/drm/mcde/mcde_clk_div.c                |   4 +-
 drivers/gpu/drm/mcde/mcde_display.c                |  11 +-
 drivers/gpu/drm/mcde/mcde_drm.h                    |   2 -
 drivers/gpu/drm/mcde/mcde_drv.c                    |  63 +--
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   1 -
 drivers/mfd/db8500-prcmu.c                         | 239 +---------
 drivers/pmdomain/st/ste-ux500-pm-domain.c          | 353 ++++++++++++++-
 drivers/regulator/Kconfig                          |  22 +-
 drivers/regulator/Makefile                         |   3 +-
 drivers/regulator/db8500-prcmu.c                   | 501 ---------------------
 drivers/regulator/db8500-regulator.c               | 221 +++++++++
 drivers/regulator/dbx500-prcmu.c                   | 155 -------
 drivers/regulator/dbx500-prcmu.h                   |  55 ---
 include/dt-bindings/arm/ux500_pm_domains.h         |  17 +-
 include/linux/regulator/db8500-prcmu.h             |  38 --
 21 files changed, 748 insertions(+), 1252 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260618-ux500-power-domains-v7-1-3c9d095828c2

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


