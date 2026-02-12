Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125BEEE3697
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dHvyyUWufcDUYZZiGp+OreXyUiQERICvMqjauxJsIBk=; b=P7WDRDo5jwHPTO
	RBKKCPuP0G+JkfBqHTN59UDxfYUA45srUpYmrLCysWaxt1Ln+zPKgWfJg4GU53v6xEYaP+3qb/otY
	7AcGl3+YEFntDGIeDz35RZGANyCIBmP7gOtziI4VVsvdOA+tbhxbY9Jx9FdT/VO7AxKKhpO6Uq/7S
	SuDubGO8lKfFdPw4WqzcqKy9IMdcjovPHF/0xB/VhulrUQE8GXyWtTEPyfJjS2pMN55z/99G4YO6P
	igJixomASQtQw9LymXpuuj8VSCDxBDvy4RBjSkL5+MmLhT+kxP+q9kUA+6CF962UVJc7jKGi83Q0r
	z4dFuiLX7F/GMMWIrJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYbi-00000002GPA-1R19;
	Thu, 12 Feb 2026 15:27:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYbe-00000002GOP-2qzr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 15:27:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 256164E40CE3;
	Thu, 12 Feb 2026 15:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52B1606CA;
	Thu, 12 Feb 2026 15:27:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B93211971B05;
	Thu, 12 Feb 2026 16:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770910061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dHvyyUWufcDUYZZiGp+OreXyUiQERICvMqjauxJsIBk=;
	b=ty5AZIWryFiAUKJgZh1PETyZ8lFIYeqVUbpKQhtDJxPHr/JwgpMbPPcB53R8n/K6KZjwS8
	ninJ9z0cWJeqAbqDof4AO4YOPwe0yeRvKZ+PQTxU1Wc779c1SKTSiJhR8NlyR16UIBEaWK
	N39q7624FEF6agoGTyQX3WqUBvVxdyNzfE7zMAcj8OP0aflhhotMdegJRUJgV2h253MOin
	ZX3QJ2jdjnnYV1iMM2fvrEgG+VMIXHgieid02uwD6urvC++cY19tvgoZKjuIt6/IlE7bQ5
	wFJ4RK99iQG8I2xmpHibRFgW64xPwInIqSxdg2tSX9Hy+OY81cs88Y0R9tyEIw==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Subject: [PATCH 0/5] Add support for Seeed Studio BeagleBone HDMI cape
 overlay
Date: Thu, 12 Feb 2026 16:26:14 +0100
Message-Id: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABbxjWkC/x2MWwqAIBAAryL7XaAbPa8SEZlr7Y+FVgTi3ZM+h
 2EmQiDPFGAQETw9HPhwGVQhYN0Xt1HJJjOgxEaiwtLSct2eZq2z6yvsWqmRjK0hJ6cny++/G6e
 UPjBq33NeAAAA
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_072750_854616_7A00B05D 
X-CRM114-Status: UNSURE (   9.28  )
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

Add devicetree overlay for the Seeed Studio BeagleBone HDMI cape, which
provides HDMI output via an ITE IT66121 HDMI bridge and audio support
through McASP.

https://www.seeedstudio.com/Seeed-Studio-BeagleBoner-Green-HDMI-Cape.html

This overlay requires the recent tilcdc cleanup patch series that was merged
to drm-misc-next to function properly:
https://lore.kernel.org/lkml/20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com/

With this DRM tree dependency I don't know if this series should land in
DRM tree or in OMAP tree.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---
Kory Maincent (TI) (5):
      ARM: dts: ti: Enable overlays for all DTB files
      ARM: multi_v7_defconfig: Enable TILCDC DRM driver
      ARM: omap2plus_defconfig: Enable ITE IT66121 driver
      ARM: multi_v7_defconfig: Enable ITE IT66121 driver
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

 arch/arm/boot/dts/ti/omap/Makefile                 |   8 ++
 .../boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso    | 157 +++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig                |   2 +
 arch/arm/configs/omap2plus_defconfig               |   1 +
 4 files changed, 168 insertions(+)
---
base-commit: 40c1ccc1a3b86259e455a9a5082d5c8e0f944d62
change-id: 20260212-feature_bbge-932870b2edf5

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


