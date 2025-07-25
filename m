Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DD0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gyzow8E6FNq86vlhg9ANsunLTD350jZTjub192oiNFM=; b=oNG4yYAR2BQjiTHY3Qw9/H2VpA
	XrhxFFF0cSsd62IyWT0t/VcIVZVYYVFsC7ihBidw5trJ6v4llXxty/YzDtt97RHLRkCK8ZUGuX+nz
	qH8S3g2+3cneGv8rcFAO1QQhBZFnnGl03XoUbZo1OKc1m9YSva8uuK3oeXVAtXKbwA2COO8rQhqs7
	G8SHnhG6fBtVXcP5gSzd9RI8C+ofR0U2ZLD0IhdxtqhFOerPFrKzS1CkzU9ld1y5wVWq15Mi+KUAd
	ibDGI0rba2nON9c30JR8ikC9GZp5eHOk9NoAAJtQzFPWU4eIgJs308o2BIJi9aAiKVNb/HzBvk5EY
	wGTdrDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH1S-00000009lIK-3kbf;
	Fri, 25 Jul 2025 11:55:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGJJ-00000009g9b-3bZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E3F1601F0;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD64DC4CEE7;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441766;
	bh=KbANwn4NmNO7jNz4SGe7SAKLtyBDL4GI6/j143/N1/E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W9sPIwOCB5dNs2yTE7GskZjS3l63MyPbMenDtqb2FOXjCWml2zp9FjDmsmuJ+QGEn
	 6yo9aMmWsR4WinMQt4VBv2eXbOD7modh25V/zbZ7tXfAt2qiFTEK0FzRI0MPMSxtnV
	 LiHjfmIw4C2CTVY4dIKYaKs+DE6SOsEU/Rb4Mczs8Mw41I3S2Tp/JEyrgDeGNpfWMc
	 XZ3owU0So9alJvD6pMSFMKuAijgYcqRpURpLZyOUeK+g7yv4874xrgKAzwZVEwzlRb
	 mDu6wcPrA9iOkKgFydnEk7ZQJw8EPW4spzrmdY14hLh9sxQCa9fjCZ6Z5BlsiMumxL
	 QPXqWBwUEpPZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88D7C87FCD;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/4] backlight: add new max25014 backlight driver
Date: Fri, 25 Jul 2025 13:09:22 +0200
Message-Id: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJlg2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMz3dzECiDL0ETXxMjA3NTSMNUwMc1UCai8oCg1LbMCbFR0bG0tAB3
 YAxhaAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=1452;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=KbANwn4NmNO7jNz4SGe7SAKLtyBDL4GI6/j143/N1/E=;
 b=PjTusrgPlZupmtwnWn9StKXy2DkRV3eFf5M+adbF+rEkvyz1mG3L2XP9PPZrorFH+PUwg5zR7
 EKaU2GeBddlCmwwgOer6BZEklYbXnOarE4DYHFsHnMYmH89T2htQs71
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
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 bindings
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    |  78 ++++
 MAINTAINERS                                        |   7 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  21 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  19 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 449 +++++++++++++++++++++
 include/linux/platform_data/max25014.h             |  24 ++
 8 files changed, 605 insertions(+), 1 deletion(-)
---
base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



