Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1753C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6Pvni7Zs0uwK3wQbi9OBXyIZ+nOBBx/+O2vZSvueFw=; b=x+79jSERaBQ7nM
	+ybrGu11ZcY3O5r9UfsGBQ7GzXIGWA+pwSt/Cqf5aMQqMhjC9yibRIdNBydIaQOxI9cLmKPTyvPm1
	WHghFQ9TRUzN0b0oIxIO87pHqMsStqZiqX15kLL6sDza9wBm3XRdjNG2WrTfM3gR6fr0iun/UcyI1
	ymjmJsNmgvJomgXZ+JmmNyF6u0F/V3g2sIrpGXKp2fLcwtjTQWKAUE/GxQn1IgyBidUFwJt5YqMum
	hBctxeN0WLa45CUs4COGRc8PxJaJejG7cKfYwJWDRQr71a7ddemW8sfSDkAqH9ITwmGgyH5qgfnRM
	Rp7hc2VYB2wHrCu9clug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV3i-000000077hD-3Kmr;
	Tue, 17 Jun 2025 12:04:58 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUyd-000000076cH-1RPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:59:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41717424BB;
	Tue, 17 Jun 2025 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750161571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W6Pvni7Zs0uwK3wQbi9OBXyIZ+nOBBx/+O2vZSvueFw=;
	b=Vt01Nre3N3weW1j5b6mpQKCevzIeBd8IhkGB7MqVOybqKY9vj63AhoAAM7WC57Q4KAjkmp
	JkIrbTnwWwU7PYOKFreWuVr8CQQrYDI/ukvTPvWM9+T5LlJ10dN9SmjQqTJ8zbmLmvFqG3
	L91iNkBE8nLA6i8YKx8UfBLl8qdVDVJ1KDST8pZdlQlB1B1QW6ZsqkMTFAymMfmt5m/whP
	HCB4H/38TSYm9RTLYkoQq/a6zHuCo9BlIxbC/C2+4JL4/XwwJ7m1D4XA04t2BQdqK2ugXA
	6rQKw00O6rpMAx98wmSV1Chvx9YUOwEZ6MWiAx+JNZzU4FUb+HE5K5Ne0+TxIw==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v4 0/7] Add support for BeagleBone Green Eco board
Date: Tue, 17 Jun 2025 13:59:23 +0200
Message-Id: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJtYUWgC/2XNyw7CIBAF0F8xrMXAlKcr/8O4KJS2JFoMNETT9
 N+l1cTX7O5kzp0JJRe9S2i/mVB02ScfhhLYdoNsXw+dw74pGQEBTjhU2JgOS6EJVQ1toZaoXF6
 ja/1tbTmeSu59GkO8r6WZLttvnykm2LWs1o5LV+ZgQhjPftjZcEFLQ4a3EkQ/FRTFQSoCwkim1
 b+qPhR9/aoWRZltrBSKsR81z/MDTtMZnwQBAAA=
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdefkeekjeevjeegffdtfeekkeetueejfedvtefgveekfeeifeejvdekfeetfffgnecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhug
 idqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045944_170562_1A0E4DB5 
X-CRM114-Status: GOOD (  11.38  )
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

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Also update the omap.yaml binding to include missing compatible strings
that were previously undocumented.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Drop model value change to avoid conflict with script based on this
  value like:
  https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads
- Rename ti,am335x-shc to bosch,am335x-shc
- Forgot to change to "Seeed" in BeagleBone Green Eco model description.
- Link to v3: https://lore.kernel.org/r/20250613-bbg-v3-0-514cdc768448@bootlin.com

Changes in v3:
- Update multi_v7_defconfig with TPS65219 config.
- Remove extraneous compatible strings.
- Replace BeagleBone compatible board name vendor to use "beagle" instead
  of "ti".
- Link to v2: https://lore.kernel.org/r/20250609-bbg-v2-0-5278026b7498@bootlin.com

Changes in v2:
- Add patch 1 to 3 to fix binding and devicetree inconsistencies.
- Rename tps node name to generic pmic node name in am335x-bone-common.
- Link to v1: https://lore.kernel.org/r/20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com

---
Kory Maincent (7):
      dt-bindings: omap: Add missing AM33xx compatible strings
      arm: dts: omap: Remove incorrect compatible strings from device trees
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |  23 ++-
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone.dts          |   2 +-
 .../boot/dts/ti/omap/am335x-boneblack-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |   2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |   2 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |   5 +-
 .../boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts  |   5 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/configs/omap2plus_defconfig               |   3 +
 21 files changed, 214 insertions(+), 24 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


