Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD13CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlGWUhva3kGs1RISxq/rd4pyC6pmuyqH7UPyu/eBX5c=; b=VN7ReIIaF0UTT9
	mjUrJkGQTEvZ34LXtZ3XhCX4kYHqrubIdg4W46nAxlGvnMzpJF8sfpjSkx1q0FdLjNisJcwuw5qiI
	XEf9yar5MtzS1Zl2MuZag7reW84oMWEHjL5PnynTs6CkQwVO40EgH+6k2GKd+FYxAdjgKH8LLBhUk
	LRrh1rE/9sXxOyuynMiqr5z5r5tcIkSLrXvdTBtRIKBMl/BKNW8WqBkWi9IsX+z0nywfymE4I2vil
	XA63rtwMIGhm+q9AIL0/yNHZrlPHBTLSJ6MUIYl0Udr7VQZLUMrWAGTIJUrITw2n8tOhcXCx6Fa3o
	QaeMCtCwn+cD1aNuTjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfKO-00000004faD-3hIX;
	Mon, 09 Jun 2025 16:26:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOegh-00000004Z2c-48va
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:45:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF461F65B;
	Mon,  9 Jun 2025 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dlGWUhva3kGs1RISxq/rd4pyC6pmuyqH7UPyu/eBX5c=;
	b=Q1xfhvoZ8rA/smOkbSOAIh7DQTHIBcSCZnvb2wZBDuYUiLJMo+tWWVQvepnf/92ocriULE
	4ETt1WPgrZJ6TSCZrJD8IQKeBXJY9l7k8WNOK97vDmWNLpkvjBbZ6jyhMkp/9z3msaHeCp
	1n71iZxTpar0LbHtJ7DHAbKMQzm//vmM0dGnVLZ5XbVCzkdSx7kjK3AbhSVV5cU0qtu6jM
	ewqiGIaZZNHbpFh4psTkuCT6Mw86KKrwNFg/Nl5u9n6pgffY8Zxw+ElhLQaG4IurDREfo5
	qKiYq2PyGj/o1JDYs7aFmxTb8lJxk6Bu8itNvjmPVE5l+I5qMGhjm6sqSopyPg==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v2 0/5] Add support for BeagleBone Green Eco board
Date: Mon, 09 Jun 2025 17:43:50 +0200
Message-Id: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADYBR2gC/1WMQQ7CIBREr9L8tRigItaV9zBdQPtpf6LQQENsG
 u4udufs3mTm7ZAwEia4NztEzJQo+Ary1MAwGz8ho7EySC4VV7Jl1k5MXzsubqNw0mioyyWio89
 hefaVZ0priNshzeLX/v+zYJyhu5gOlcaahw1hfZE/D+ENfSnlCxzCmgeYAAAA
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevudetfffgkedvhfevheeghedtleeghfffudeiffefvdehfeegieeivdekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084528_641555_69C6190B 
X-CRM114-Status: GOOD (  10.74  )
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
Changes in v2:
- Add patch 1 to 3 to fix binding and devicetree inconsistencies.
- Rename tps node name to generic pmic node name in am335x-bone-common.
- Link to v1: https://lore.kernel.org/r/20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com

---
Kory Maincent (5):
      arm: dts: omap: Remove incorrect compatible strings from device trees
      binding: omap: Add lots of missing omap AM33 compatibles
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      arm: dts: omap: Add support for BeagleBone Green Eco board
      arm: omap2plus_defconfig: Enable TPS65219 regulator

 Documentation/devicetree/bindings/arm/ti/omap.yaml |  39 +++++
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
 .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |   2 +-
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/configs/omap2plus_defconfig               |   3 +
 10 files changed, 219 insertions(+), 6 deletions(-)
---
base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
change-id: 20250523-bbg-769018d1f2a7

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


