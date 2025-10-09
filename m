Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52D8CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ILrlvGDpOpLZjhBq1jhgORkUyoWEnn3pot+jZO7CnMU=; b=vxpPPxLLW5KtEpgB2AtgOdb8xj
	ubr3/orLEJPRoF//nWrBLwQ/o1zsTuPZ0KkcpF69GDkXSmZqrE33tDwhij5sUaWbHaQ3GHlMEVC0e
	S6vogNXRs1MSdFCkpvnnf6sF0SaPTuTrTGlaHHF9jQoL+Rhcbc30lINvWer9u+Uv16ZqN7nw+vBt2
	0sq1TqNputYHD437NK+CUu9+mk7uBS9JsW1Fwp2PcjBTp+zO8FG6xoBBgxxB/HT+bsdOpja4lzIny
	sPQAzcXuaCioEkjV/AvaR+c7QZmBDroISp5Bx6oOYGMQ+ff0lXC2Ggq/F24XXdsNi6S/SrMTBI6S4
	epKDnG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kS2-00000005IWM-2TQ4;
	Thu, 09 Oct 2025 06:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kRz-00000005ITZ-3uSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 06:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46C9860278;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEE04C4CEE7;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759992508;
	bh=YvCdpNxP7NaYCSCzTAxqQo43I2kRITJnvwPMfac8Qvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p6ZZ2hOkXv2b3TsJ2txsu3peoMrhDJ4cUp9EJVd9UTd5LCX1k4+pEaue94OzPTMyR
	 vYs8KRXSASV/F3VcyKFFvIqxVsvN8VhC9F3Frfr2mnytTVCykDUfBKjlwITrytRJ3C
	 +he4GWLoGxVMgam8CFKDsY7AfDvTwTf2Wn0L+/Cg496o2EYIweJ7uTF7XXQdDz2ERZ
	 BiOlaGt+EtF4zsvSqop6JsV1c60GMsBbcJhO1dF+QOVbnmecJ/ihrwVzijaK7O9xxQ
	 RdTiK85LmFgtZ/SGVgHI7dj1Y8LtdFM7aIhrNCKpIps/QIEurWVeUtPW0RP3h1Z9QR
	 YHgz8kdZ8NVGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C959ECCA472;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v4 0/4] backlight: add new max25014 backlight driver
Date: Thu, 09 Oct 2025 08:48:24 +0200
Message-Id: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALha52gC/22NQQ6DIBAAv2I4l4ZFEOmp/2h6QFyVRKVBY2yMf
 y/agybtbWezM7uQAYPDgdyShQSc3OB8H0FcEmIb09dIXRmZcMYly3hGOzPHCQQVnCmpAcFUksT
 zV8DKzXvq8YzcuGH04b2XJ9i234ji8ohMQBllmFuLOvZyvNfe+n4Mvm2v1ndkK038sHPQJ5tHW
 1alMliAADR/7fSwNcDJTqNdsrQSWJhUyd/f67p+ANmSlfshAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759992506; l=2923;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=YvCdpNxP7NaYCSCzTAxqQo43I2kRITJnvwPMfac8Qvw=;
 b=eC4PsaECsTf07ZDbdKRBsRMKmT6s+SJTW/b+N6Fx7HNp1/fJT5JOKouBKqoJ6Gk50fAUFilgk
 AKjbBdYWCuwAfayOo2hHv8NUCPBXp5nCHhLgeNCkDZOOSFc8ArxewsG
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    | 109 ++++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  32 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  27 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 409 +++++++++++++++++++++
 7 files changed, 590 insertions(+), 1 deletion(-)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



