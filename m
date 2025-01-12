Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16EBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/+10wZ3MgBf+cYk6Dq4f9vBqSCbY7QWXJeQblH9Xv5Y=; b=HG1wCKKmcbloeOcRUpSVSWuDAj
	DnMVXKluBXBw7DFyQBv+5gtJkiPrHmA3ALpuNsbNyeckpYq3XmjF+ZVE3j+xJqejaxLeExiCVyUcB
	UHO+TpobbcJRRKS6TEYcYnMRY5limprKU3x6kac4lYQzGdBtfSX5jCFQSgknDVNW1qNvKfjG0rr6D
	QTmxI3NM/T3zvsU9oCKrz5qSN9CfJLfIvOr6U4pua9VkjtDcyp8Ec/RtinXxn0WXzkBS/iiOK/QzZ
	8+jJjJht/+Kbn0JJhBAgX2hpxmT3PpOT+wO8d6u8Mnynusjn8IthGKgibarV4U4FXA82rvFH7qeri
	MTn0QtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4qx-00000003QKy-3Klz;
	Sun, 12 Jan 2025 20:46:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4oT-00000003Pkq-1z2s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 20:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2CFB5C439F;
	Sun, 12 Jan 2025 20:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38527C4CEDF;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736714639;
	bh=aSXypBQ4M4GEZW3R7qstW6YXcVlzlDqvGf92lCWFtXA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IoBMzj/7Vpz+Cp1AE1jX2a2UilXkfhl+9xZuWV50pwUI71yYEsRaDgMHsmJQUSe1Q
	 MLFWS8h2T5xNVdW+LwvUg7L23KpLRqLc1zZ/gGk+3tCI6LRC1Jrc6CEUalV0W3io4R
	 5Aw+dV651OaPK0xZxNJYaBePmyo/Sguag9MEfM2yEa1rVsOk1XJmICvfYP8OdgwLr0
	 +LI/VDQttHmsQXchn7+hjz8xWVs/nRkg6LRiEzjvO18XXdSSFuMqxEYDT+tXpZRk7+
	 BYpzkzsX3iDBuqzz+MA+gWQwJ5f+kmq4EPmrP+QtM6c08BKslTO8BxRZqoZcoZbq36
	 ZbkQ3q6RCyWXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22880E77188;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] Driver for pre-DCP apple display controller.
Date: Sun, 12 Jan 2025 21:43:47 +0100
Message-Id: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMphGcC/2WMywrCMBBFf6XM2kherY0r/0NchGTaDtgHiQSl5
 N9Nu5CCy3O556wQMRBGuFYrBEwUaZ4KqFMFbrBTj4x8YZBcaiGkZtYvPoxM1p1D5X1rLwLKeQn
 Y0XsP3R+FB4qvOXz2bhLb+pdIgnGmhBG+xQa1sbd+tPQ8u3mELZHkUWt+miyaM1y3tVKN4+ao5
 Zy/9YZBwtMAAAA=
X-Change-ID: 20241124-adpdrm-25fce3dd8a71
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736714637; l=2197;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=aSXypBQ4M4GEZW3R7qstW6YXcVlzlDqvGf92lCWFtXA=;
 b=0ES7EgYhRigv+ZjTrUSeVVUQfqHEAOH6+eytjDGYMLKzgXd+ysLojOO+92rvHsbNPQJBQFvqU
 MEJhK7tmE36BCmmWbRwjwyhSjAvgCUnu8CN+JMXF7Yd8ek6rf6g0PL6
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_124401_618037_25A99567 
X-CRM114-Status: GOOD (  12.15  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds support for a secondary display controller
present on Apple M1/M2 chips and used to drive the display of the
"touchbar" touch panel present on those. 

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- Fixed building as module after splitting out mipi block
- Addressing the review feedback.
- Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09@gmail.com

Changes in v2:
- Addressing the review feedback.
- Split out the mipi part of the display controller into a separate device
- Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com

---
Sasha Finkelstein (5):
      dt-bindings: display: Add Apple pre-DCP display controller
      drm: adp: Add Apple Display Pipe driver
      drm: panel: Add a panel driver for the Summit display
      arm64: dts: apple: Add touchbar screen nodes
      MAINTAINERS: Add entries for touchbar display driver

 .../display/apple,h7-display-pipe-mipi.yaml        |  79 +++
 .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
 .../bindings/display/panel/apple,summit.yaml       |  58 ++
 MAINTAINERS                                        |   5 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  60 +++
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  61 +++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  16 +
 drivers/gpu/drm/adp/Makefile                       |   5 +
 drivers/gpu/drm/adp/adp-mipi.c                     | 251 +++++++++
 drivers/gpu/drm/adp/adp_drv.c                      | 594 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
 17 files changed, 1424 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-adpdrm-25fce3dd8a71



