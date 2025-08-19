Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75CBCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3P9k7zZJjFXE0SviZa5Ak5Kb7P9KSSkDmUwcBsC6vwA=; b=c/c0viG35FQtCTwCNrtFJT6s4g
	d8uu9qT0Vgr6aH+X7ZEurstQRiuQy2jpLg6YXDwovo0CuRjFQDyjTyghDnUO8kUHBVREu6w52GqK4
	LEElit/enlu1+tTuF/Wp4Dik7cC48/vPpBt8izb0vcCrib2sgBFv0SYZvhuE175erAe0UoJIqRiwY
	362JOVlot/yW+dKPnndrmqUCCJx8ZJ+J0bUY8fwJeS4gZ6UcBAnyR2Y7vv1C5+QCkm8+lytQcy5bP
	Lbxb8nctHEhZ5g/aOENCcIALxU3qj70PqlrggkQiYpFrdYL2lN+bJyDZPVh0G8B6XIsMHHcv2Qvv1
	5+qF0p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMbh-0000000AdQn-2Qvy;
	Tue, 19 Aug 2025 13:42:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK3U-0000000ACVx-3l9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CD505C5E54;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF08C4CEF1;
	Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601144;
	bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ds8mIUsCQgGlE0xRvlVe6y6bgAdwSbA7Zno8tIxEpv50dUGNL5DE+V/7PsXPnCih3
	 FnMJY8Q6bsZ7H/j5mNqMLtWgELkoslnXhQIvlZOyzJ9pWez8R6KG4h4TKQcazzsyXI
	 EbDubeXebPPEca2HZk5D1pbQaCiUVU2xmK4AAeO8aNxO4xiDyfXNdEpw7g3PBqj711
	 Q2dxfUIq70GD2oV2E3744NsWcJphF6/qC+y0xpp5Rloc7Lf7rEkjbBhSpw8YC1JHes
	 3G4pPvazugxRY14+wOR6bbgR7Boa2Dxc0PPi8fKfcQ/4jUb0IaY0TVVIx0TR+qMwdR
	 zE1oAOpo2lppw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE59FCA0EE6;
	Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/4] backlight: add new max25014 backlight driver
Date: Tue, 19 Aug 2025 12:58:58 +0200
Message-Id: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJYpGgC/0XMTQrDIBCG4auEWdeiQ8xPV71HyULsJBESp2iQl
 ODda9NFd/MOH88BkYKjCLfqgEDJRce+BF4qsLPxEwn3LA0oUcsGG7GavVyqFjXKVveKlBk1lPk
 r0Oj2k3oMpWcXNw7vU07q+/0hLeo/kpSQQlJnLfXF6+g+sWW/BV6Wq+UVhpzzB8licAOlAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=1984;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=dqQAaSK5TLp2OGYn22cxx8W1zu8wpnCnRgOi6eRYTh0=;
 b=tg5vLaPXsGCQxjf7wI8AaH2Njrai8idSmUxnlS+4gXs03tlqp5zKmNQ244mZ5Q/rRknUynI+6
 VBoeyS3B4V8BW7W09dDMRELXD/LJyG0isydsmFlzv4EHKl325Mc8Pl9
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_035905_019784_A93AC710 
X-CRM114-Status: GOOD (  11.49  )
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

 .../bindings/leds/backlight/maxim,max25014.yaml    |  79 +++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 395 +++++++++++++++++++++
 7 files changed, 527 insertions(+), 1 deletion(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



