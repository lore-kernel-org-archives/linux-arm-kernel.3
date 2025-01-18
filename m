Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D68C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 22:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VEHWAMvPt7izhfUf3AfgbgxD4iwL2K0nVeFBsEYoUHU=; b=3irunfZWulq05ukwMMPGpy9LEh
	76Hq/hwlxMkqVTZ9eI0JSDX9GUudKwd4fYmj77Wqwt+4TpR0qUDwWNN2Za9t5QY0XFwx/7Kth3rd8
	D5JKpwsqSB88Q9AS5l/hhBFDlvbBcrKenfrKJQezq44hIgGzA2Cu9fAt+Sb1fklTKS9HKzWGScgA8
	xk8gkUEepKsL4nR1Rzf5wZjq1pCuJ675lJG78Al55jihCw2hhuQqQbGHvnKdKKZRpQag6mhQUt30c
	sRl9kFDY5TnS/Os6NH8LbdenuIcSRk0M7xX7itelJR3f4CpIWff8J0YEFFQdx05IKi6r6Kc72zDxR
	xtT+3Wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZHZ4-0000000325O-0cWw;
	Sat, 18 Jan 2025 22:45:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZHXm-000000031o0-3csp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 22:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 746B5A416A2;
	Sat, 18 Jan 2025 22:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97BDBC4CED1;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737240232;
	bh=jtDQgJ5TMUog4z+ig7qpmfLNG/e1jX7Y27yVt6nn77Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X2+AHIqAIUl9aH/438WpvCtjvIymg4e+u2A/s8Ep7VuaUdQ3jb/a15UEVz/PoqkZW
	 L3ZstjtqVk0+Epy20X9EAyE8jJLhFKcl1q8qTUcay/oZBRX399mfvTAAGW1MHWiRk4
	 00CSGn+oWpQ39W40Lber6ONDU9/LMHUnD1vrycOx1YiZbK03eHHVucROlb3S6RAl9r
	 QKEdF5cOrQLN0zr7GwHkZGeLOm2Sy0ERRhEc2RfbBPGEzFqqRQOCKlzSqvWBMjWj6z
	 AIPQCz48HDrYAfBl7Wvb+B2oHFrWtOI2H01iJej/YhornZyCFfDLYkLQVbFQQBYLHo
	 p3gnbKcYND9Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF86C02185;
	Sat, 18 Jan 2025 22:43:52 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v5 0/4] Driver for Apple Z2 touchscreens.
Date: Sat, 18 Jan 2025 23:42:21 +0100
Message-Id: <20250118-z2-v5-0-6d38b2582169@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0ujGcC/13MwYrCMBDG8VeRnI3MTDKpetr3kD0kk1QDaqVdi
 mvpu5sGhOLxP8zvm9SQ+pwGddxMqk9jHnJ3L8HbjZKLv5+TzrG0IiCLSFa/SAsgBaZ98hBVeXz
 0qc3POnL6LX3Jw1/X/9fNEZfrh7uFj6hBizViRRwBxJ/zzefrTrqbWvhIa7KvhAppnAgfQmgRm
 29iPoShmEpMISyQmDma2OI3sWvCldhCYmMc+oAueFiTeZ7fn1i9Py0BAAA=
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737240231; l=2420;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=jtDQgJ5TMUog4z+ig7qpmfLNG/e1jX7Y27yVt6nn77Q=;
 b=p8J9xoOLyfzSthaCkOiGJsgHqONtjwG0HEvv0Z+jBE2awomYf00IkK67eejWTz5/ccu6VvySk
 cwuSBI+mlk5A9/L3mZKi8S8+oMdLFsK7ZfY8k1NJ0KdaXI4dhSp//NK
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_144355_049476_97AA8465 
X-CRM114-Status: GOOD (  12.03  )
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

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v5:
- Added missing \ns, removed 4kb-ish of wasted ram
- Link to v4: https://lore.kernel.org/r/20250115-z2-v4-0-d7361ab16ba0@gmail.com

Changes in v4:
- Dropped another allocation, other fixes.
- Link to v3: https://lore.kernel.org/r/20250112-z2-v3-0-5c0e555d3df1@gmail.com

Changes in v3:
- Tx/Rx buffers used in interrupt handler are now allocated in probe and reused
- Other various style fixes
- Link to v2: https://lore.kernel.org/r/20241128-z2-v2-0-76cc59bbf117@gmail.com

Changes in v2:
- In a separate patch, fixed an issue that prevented the SPI controller
  from using GPIO CS, and as such, moved the hardware quirk to there
- Went back to uploading the firmware in probe() instad of open()
- Other changes addressing the review feedback
- Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gmail.com

---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 453 +++++++++++++++++++++
 9 files changed, 622 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



