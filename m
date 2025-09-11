Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D7ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8fl47MJXSDQZsTT1g61Dfaeqd8p9W3qqVNzE5EIc3k=; b=tU9T6EVNHfP+4jRh8/71LJ+vwV
	yI9mJDZN6RtWJyJtDBxqFEhF3Lo7pVI1liHAGDrfysgyrW4O9Dfdb45R5e/ngUTD8vNe1qaWMHoSl
	+2SH19YWLbHfQLhJx7hoc6p0kNDEQqY1gFToruoH90XbiUaH6VNcCDHn9N4IY8ghxZXoiZxUW9ZJX
	/pFZqBe2kUw7H6zrtk6QuPqxAtZdBmlVs2odf58xo6x4mDvkypSfe/C3AHdTQIk4WBFoIdfn/2FbJ
	5BioXZOo4HXzP2RkjHGzgfdkYHgVW07yH08qBqkf1i7My3fE8SyTUJauUjjnbuwVIXlEFcC8UOo+Z
	b0Sfzh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc7Z-00000001cTR-3doq;
	Thu, 11 Sep 2025 07:53:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwc7V-00000001cNI-0buT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 525AB403EC;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24796C4CEF1;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=JYHCDp0OgkgiBtsdNk57zUPJNY+sgFdo5atkZ1PTj6I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DF89uASQ0pKbGOBT8kGdB5OHx1KXoX/LanwnwlK3O26IGXKZI1kyDtdKIQiie8rTT
	 9rIAHOdZv0YFKVbds816H2tqdSWQc6NCcuQz1opxa68TGZQZG0fGG+YFMGzZ7WXa4F
	 ZkRdg1IeblKqO402CJ4lepYUYPMAfasC5ts1WiWjHMcFdOA476t+HZZYiTTifp61cL
	 XZSr0n+t0K5UkEvufIIHu370FlfGezZM2JH4ZJKdt5C6pLq5VFOSJYQkhmWxW6X54O
	 NY2x0g2TOyAh/0/ngWY6EIpk0smtt7LGTjZCoY44Toza8I/MMzXNJlhwLUYJtHiP6a
	 2qTI+w+5RthRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11297CAC58D;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v3 0/4] backlight: add new max25014 backlight driver
Date: Thu, 11 Sep 2025 09:53:17 +0200
Message-Id: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1/wmgC/2WMzQ6CMBAGX4X0bE13bfnx5HsYD7Us0ASoaUmDI
 by7BQ+YeNvZfDMLC+QtBXbNFuYp2mDdmOByypjp9NgSt3VihgKVyDHng57TBZJLFIWqgEA3iqX
 5y1Nj5z11fyTubJicf+/lCNv3GylQHZEIXHBBpTFUpV5Jt9YZN07e9f3ZuIFtpYiHXUL1Y2OyV
 VMXmp4ggfSfva7rB/TziWHjAAAA
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 "Maud Spierings maudspierings"@gocontroll.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=2445;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=JYHCDp0OgkgiBtsdNk57zUPJNY+sgFdo5atkZ1PTj6I=;
 b=ER/Kzm7DoOgVkXKYX+MdqwQXjjQApV1kMMRqwkbh8CLpSBQhucsjA4Basgm9YI9yzsW9EKfhk
 RmKTiMQfrHjCeUGX6NPAD3DJMSpDS4Nz7yEr9Ttu6NV1Zrp+einXBLA
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005329_238796_E268E86A 
X-CRM114-Status: GOOD (  11.68  )
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

 .../bindings/leds/backlight/maxim,max25014.yaml    |  81 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 394 +++++++++++++++++++++
 7 files changed, 528 insertions(+), 1 deletion(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



