Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B92CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bp4qSoeurc+zb/cXTuIz6Vj7/ZGa5Ff9XbKKrTbAoFw=; b=1NZsAagLFpoaWvq0ufqu1yW7yM
	IRLTHK0U2wSbySWNdANfJCCXPEmPRYAZVdo4zKOnpSJcCy3r9TQ1qaVnKVI7D+ztjkIwyle9OK+XS
	BqLiwpCtZ/lbIfoNc2MJicY8xdQhJg9c5PoUumrtR18e5/X+9qbPZ6efpaDBu1vWaa0qyKVSqLYZY
	fAWjJAagFmQRyfF3Pxssz3v6b4O5P+uta1NiHS68iWDx8n6xna+fQWkuUsuOg10QLyFFCJjKO3cai
	gj30Soq5DegC2VaAR/ul9/jKKZ8j2R1eXtXJ7tg/Q18DtWAYuHVjT3m5Aw8dBRhUndLNZs8OFoVRH
	1aCTf8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLuz-0000000HMSE-0yPn;
	Fri, 07 Nov 2025 12:50:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLuw-0000000HMQB-01kw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB99441720;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A997DC4CEF7;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762519812;
	bh=aMU6lI+FXL9SA5HsmuUzM3T7gQp8a2xCL/Hf/lasg3A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ljh97CZBI6OC9sIkYb4Vvo4mx2A1FxY6tAjq2uobVWjFskdJ1UVjKj73F4q14OI2K
	 4Wdbbc8PLlDPEi8IPvwHK3yKYmbt6QcQbfhKMRpKdCT560VbUKXZi2V3yLjHnbyZgw
	 ZnfP+iR067L99XL2aoNvk2epcLSOPDxk7GzZRBGm9sfYpP0g0FAfhwk2HfBByym4/O
	 lr17aQOuSKLaNi64R1QbHhGJ3nBDBpfVL729d5tJq4GgnD2GGIxMSrdXh1pO5UGHQ4
	 KXZrGyFRQwLH2rhCPr+KeKg6JCOq6LDc8M7vrY/KPO3T2qou60hOP8EzNTXN1wpiQM
	 Ce+e4RrntDCJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F413CCF9E3;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v5 0/4] backlight: add new max25014 backlight driver
Date: Fri, 07 Nov 2025 13:49:57 +0100
Message-Id: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXqDWkC/23NS47CMAyA4augrAmy8+hjVnOPEQs3dSASNKMUV
 SDUu49hJFoJdnHk7/ddjVwSj+prc1eFpzSmPMjgtxsVjjQcWKdeZmXAeKhMpc90lRc67QzUvkV
 Gil7J+m/hmK7P1M9e5mMaL7ncnuUJH7//kdr4JTKhBg3chMCt9Br+PuSQh0vJp9Mu5LN6lCaz6
 AbblTaifexr4g4dMn3UdtEt4kpb0T3Y6LgjW/vPt91LI8D6thNdUd8ZAiLr45ue5/kPQ42L+F8
 BAAA=
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=3392;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=aMU6lI+FXL9SA5HsmuUzM3T7gQp8a2xCL/Hf/lasg3A=;
 b=tHu4Cu2n2geb7CXzMfQZdheXEYSEHLIEAHda4GTiB9rSeI4w1XX8+DhtQ6cGKxl6Pk6zCuWEa
 5iC7I71JaikDQXYf6oiFrknLfgaFfSZNdahLsuimPV+N1iJRv6RdxHQ
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_045014_107228_1D7583C1 
X-CRM114-Status: GOOD (  15.42  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v5:
- moved comment about current functions of the driver to the actual
  comment section of the commit
- fixed the led@0 property, regex patternProperty is not needed as of
  now
- added extra clarification about the ISET field/register
- moved #address-cells and #size-cells to the correct location
- remove leftover default-brightness in backlight nodes
- Link to v4: https://lore.kernel.org/r/20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com

Changes in v4:
- use a led node to describe the backlight
- use led-sources to enable specific channels
- also wait 2ms when there is a supply but no enable
- change dev_warn() to dev_err() in error path in max25014_check_errors()
- set backlight_properties.scale to BACKLIGHT_SCALE_LINEAR
- rebase latest next
- add address-cells and size-cells to i2c4 in av101hdt-a10.dtso
- Link to v3: https://lore.kernel.org/r/20250911-max25014-v3-0-d03f4eba375e@gocontroll.com

Changes in v3:
- fixed commit message type intgrated -> integrated
- added maximum and description to maxim,iset-property
- dropped unused labels and pinctrl in bindings example
- put the compatible first in the bindings example and dts
- removed brackets around defines
- removed the leftover pdata struct field
- removed the initial_brightness struct field
- Link to v2: https://lore.kernel.org/r/20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com

Changes in v2:
- Remove leftover unused property from the bindings example
- Complete the bindings example with all properties
- Remove some double info from the maxim,iset property
- Remove platform_data header, fold its data into the max25014 struct
- Don't force defines to be unsigned
- Remove stray struct max25014 declaration
- Remove chipname and device from the max25014 struct
- Inline the max25014_backlight_register() and strings_mask() functions
- Remove CONFIG_OF ifdef
- Link to v1: https://lore.kernel.org/r/20250725-max25014-v1-0-0e8cce92078e@gocontroll.com

---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 support
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    | 107 ++++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  30 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  25 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 409 +++++++++++++++++++++
 7 files changed, 584 insertions(+), 1 deletion(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



