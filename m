Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F5DCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=btNDbK48xuDBWKfwWNXMiDHC86J0cvKtwBVfd31rk2M=; b=2UC8Jw9Mr8ELqX
	OjkucKTTfZo0FRRqrP0LG7aBBGQZOJkajJ25SOcB92A/6naUtRdcM0apV4dgpbESNKc85hunbxXBa
	TACNQTPzLqPk/IMzgYCQmKyd9nBS0gBJU6KZ9gNcMnYrLmU2mNVZaQsFHk3fY/qN4OPH/caw1DwMF
	Qwk0Yr75BbDfj0DnMU/D+aJcMauCiJUcreT3ZwLw/Yx1uShDfIt+WXZGmSr9J55p4yssMHzp15+IR
	YF9lr0GA05JvlTgzIU2czf+DpBqHJPUzCT+8uLUk/3pGB82R6VUNCj8LV38mqtl6bVyIPKP0CuCgN
	AJX8hXWqCp2nF2p7vA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsy7-0000000916B-2mv1;
	Sun, 11 Oct 2026 12:47:59 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsy4-0000000914U-1FhL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:47:58 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j2gP31l6Nz8tCW;
	Sun, 11 Oct 2026 14:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1791722871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=btNDbK48xuDBWKfwWNXMiDHC86J0cvKtwBVfd31rk2M=;
	b=RQioT9p67PYKErxNhpz+kKu2Q3oSLUKo1fHwnvF4zFuyDf7q7xholJKQ90gVmGYIt+kMMw
	Pp3+TVONM9Oww1ZTTMR2pOEHBcNvpYZ+N4rlG3oXLDgxf8vnE7vybaSYEc7Q0ymgX0HA6I
	clCzsBD+BIzj46L+r4ZrIc99B95JRck9m6Q5bCUY9u1/KQBY9bjm9Aq36NbSI/MJpQZ/Z1
	Hv5xdWa080YDk5dc6YU2JlgTO6UVXCtHa6MlYXSWM5wV5NJjm07uimQBkdMkziX0/aHmnL
	X3vjdoHebYNUPYFK7bL79Gc2xn0bra3ABSFWlQpLPShXF2HbBU5gs/0za/m/+Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Subject: [PATCH 0/7] Input: s6sy761 - add SPI support for the S6SY791
Date: Sun, 11 Oct 2026 14:44:55 +0200
Message-Id: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBBA0avIrDvgpFCwVyldpHESU2wimYkI4
 t2b1uXb/L+DcIkscO92KLxGiTk10KUDN9kUGOPYDKY3N+qJcLZ6FcWQc5gZi105oebqJqyLaGH
 7QU+DdSMZ8sZBCy2Ffdz+k8fztNTXm53+ynAcXykHBiqGAAAA
X-Change-ID: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4j2gP31l6Nz8tCW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054756_794709_976DA226 
X-CRM114-Status: GOOD (  12.80  )
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

This series adds SPI support to S6SY761 touch controllers, specifically
S6SY791 devices. Also included are the necessary adjustments in the DTS
for the Google Pixel 6 Pro (raven) which uses the aforementioned SPI
version. As the mentioned board has a reset line wired, I also added that
functionality to the bindings and driver. To implement SPI versions
cleanly, the driver was split into core and bus transfer modules like
seen in other drivers.

This series was successfully tested with a Google Pixel 6 Pro. The I2C
transfer part was untested because I don't have a device with an
S6SY761 controller.

Known issue: on gs101 the touchscreen probe at boot fails with -EIO
because the very first SPI transfer is not understood by the controller
(the reply is all zeros); rebinding the driver works. This looks like
spi-s3c64xx applying CPOL/CPHA only in transfer_one(), after chip
select has been asserted, but I have not verified this further. It is
not addressed by this series.

Patches 1-4 and 7 are meant for the input tree, patches 5-6 for the
Samsung SoC tree. The DTS patches depend on the binding in patch 1.

---
Lukas Timmermann (7):
      dt-bindings: input: touchscreen: samsung,s6sy761: Add S6SY791 and reset GPIO
      Input: s6sy761 - split into core and I2C modules
      Input: s6sy761 - add reset GPIO support
      Input: s6sy761 - add SPI support for S6SY791
      arm64: dts: exynos: gs101-pixel-common: add labels for touchscreen supplies
      arm64: dts: exynos: gs101-raven: add S6SY791 touchscreen
      MAINTAINERS: add entry for Samsung S6SY761 touchscreen driver

 .../input/touchscreen/samsung,s6sy761.yaml         |  37 +++-
 MAINTAINERS                                        |   7 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  50 +++++
 drivers/input/touchscreen/Kconfig                  |  20 +-
 drivers/input/touchscreen/Makefile                 |   4 +-
 .../touchscreen/{s6sy761.c => s6sy761_core.c}      | 226 ++++++++++-----------
 drivers/input/touchscreen/s6sy761_core.h           |  34 ++++
 drivers/input/touchscreen/s6sy761_i2c.c            | 112 ++++++++++
 drivers/input/touchscreen/s6sy761_spi.c            | 172 ++++++++++++++++
 10 files changed, 534 insertions(+), 132 deletions(-)
---
base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
change-id: 20261011-lat3st-google-raven-touch-upstream-f19acd121f2c

Best regards,
--  
Lukas Timmermann <foss@timmermann.space>


