Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57169E6916C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3nQSFIndLHlk5B599D4K9i6Wy/lcEPJpfLWck+sxXK8=; b=Fny4kFt2mvA9tEsjuVqnMXl+k4
	NI4XfdqnjR5zKbTdjDCsdy8e4rZriDXChgE8q/tO63lpuW5JNiBcTzYUU+MNkhEVmJWKphMtCS0X6
	Cq+m0/q/xRnoJFQhbt1PN/qNNd1LsWtnDf5FMsviv7oVNHlmRrNqarCTycE2/WYmVtVJWsfvV3w9P
	K7CYmgZboV3DzBM1cBqdNq6l/+mRh89bQ+QaTACBXV905e6XqNMj1rF0VVg7al+ONpD7zc1RGQ+hL
	llr6akRNUGLdIBxQjALLJSWRp4ghycQncJSC+JkXBBqDKYMOEQMaaRSoCFbif3P/bhBQtNuixTZ/+
	vS7YNTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWJD-00000002ngS-2pny;
	Fri, 22 Nov 2024 16:15:03 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWIF-00000002nVl-1xg0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:14:05 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 580BBA048D;
	Fri, 22 Nov 2024 17:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=3nQSFIndLHlk5B599D4K9i6Wy/lcEPJpfLWck+sxXK8=; b=
	V1hwB9KDoD7MK/AAh0RD4IKKiCgdZt9qaWNHb7qqVCixDSXpQ7NdY39maGKNEfM9
	VtJQ/Fem7fmGXY7yOI63l71zTmIMnIW8zKfPjDBhDffnOIREOy3qImsBrkvGO1tT
	YQtR0in3J5WUY/FQ2JfCq0Tl0H/hxb5ShX2J2/YmkyPhUBQ8H90X5qqSajs6bCmD
	IcfiNNDVH5UiM6yfhxPmG4gwRI3UN/ABfjo+N+kYAAYkK9awxJeAJ3tlLoXDg5gN
	tPIQ6RAbvvVBLlOM9SXA/+xbLi8tHwvlKtIkXAM33Rcp7pVBj8KfnMN+jK77aVoH
	cAM3CXVH3aAWpLx0bGwxqjhpUNOkuFGUJWL+c6DWmDwGbyevV0WFsK4WpH5KlMvX
	s7ZO8YChllnUILGnI/RPLG0wvDjU5ihsiXbp8FEKS5IMrx6wm9zJ4z/MI8DX2NvM
	dbjz7fIP9seh/PyPk+6XvRLo5iMEtsEaa4xB7pkWabrpyoRMOsLHuXPimgn0G74K
	VcDrNUly9Cd51BoTWgWrwZGDspFQ45oBYjwO4soVSrpjUeIhZiPWHTIDj0z0Jb1O
	6sROahwf/HfQtuU43jyTygaeWRGqQyuIjD2tfFy/sFq9YYV74fLF1IYDttTAg4F+
	Zui8qgO3hGGIALdSNn6o/2gRCMA7rLDYXqxYxRcZc1w=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Mark
 Brown" <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Chen-Yu
 Tsai" <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor.dooley@microchip.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Amit Singh Tomar <amitsinght@marvell.com>
Subject: [PATCH v5 0/5] Add support for DMA of F1C100s
Date: Fri, 22 Nov 2024 17:11:23 +0100
Message-ID: <20241122161128.2619172-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732292038;VERSION=7980;MC=955160253;ID=83447;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855607263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_081403_969675_683B75ED 
X-CRM114-Status: UNSURE (   9.46  )
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

Support for Allwinner F1C100s/200s series audio was
submitted in 2018 as an RFC series, but was not merged,
despite having only minor errors. However, this is
essential for having audio on these SoCs.
This series was forward-ported/rebased to the best of
my abilities, on top of Linus' tree as of now:
commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")

Link: https://lore.kernel.org/all/cover.1543782328.git.mesihkilinc@gmail.com/

As requested by many, this series will now be split in 2, the DMA and the
ALSA/ASoC codec driver. This is the DMA part of the series.

Csókás, Bence (1):
  dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA

Mesih Kilinc (4):
  dma-engine: sun4i: Add a quirk to support different chips
  dma-engine: sun4i: Add has_reset option to quirk
  dma-engine: sun4i: Add support for Allwinner suniv F1C100s
  ARM: dts: suniv: f1c100s: Add support for DMA

 .../bindings/dma/allwinner,sun4i-a10-dma.yaml |   4 +-
 .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi |  10 +
 drivers/dma/Kconfig                           |   4 +-
 drivers/dma/sun4i-dma.c                       | 208 +++++++++++++++---
 4 files changed, 191 insertions(+), 35 deletions(-)

-- 
2.34.1



