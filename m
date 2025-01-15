Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3C2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 22:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fW2sQ9FnKtUaPARs3zfw5EDfLOPwFjjZyfSqUU4tvOI=; b=sgoFgmIzw3VySfBkKPu6Qv1s60
	waZNO1qcd5+LqEkcbssYIUuzR/7kvqOyR+gdra0rgIjaZBWyZyTTjDbYAFSQ1WmQaTSifiOcRCYdV
	UObu0tA0zvZAoTMK5L4vk63DnKFOGtL6EE+Pgox8wcFE2fWk6mu/ph6G6ohiWPWiVDpftPQ9wSHwy
	+bjY0QnF/zyYkoG5KmiLS8zyix+YDCvo+mN/9yxyHbCvLRYGOT0hJyIFedg+oThEJoMAHqftjy94a
	uvk71Q5sbGGKKHdL1+CvYqhayy64giNtnv737zNJsZDo0G7nn3dachArHlwEOWwLsYbaPLrqurbxA
	G2yvJQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCEh-0000000DIRZ-0XML;
	Wed, 15 Jan 2025 22:51:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYC9O-0000000DH1S-0g42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 22:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C44D0A4258B;
	Wed, 15 Jan 2025 22:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71CF5C4CED1;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981172;
	bh=Knr0caKO3pB1buKxJm1DtsDZu8Tt8G4u0XclRVx/eiY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hHvyptkxeJIKlykbQRTbV46izk/P5LJUMqfYZsFlHiD/JaNoE9odF9u92+ZOjJrmv
	 QnIYf56QC6hf+ib1dbb1ww5AQtStimDzhFIRgHBVaGvbL6jLMjND4nLrgdVTlu0tG1
	 8MFNGHx0h9N3uO8QzNMKKtiXnmJ1ATZfK9yS737kmlhMkYC4RTSqYB66UCkP3INTtw
	 k92c4qzo4OKnRzMEMsAbK/pGxU7FR7R80Qw0fywD0JQFmS1iTe5S5MFeUg5cey33nS
	 hb04YSqHyZtrO8s8kMo2/LJ9irOzUw6I+7MAS7IpVduE+jMTx6sZuSG/aQ9/dhdyXC
	 S5NhOJgz4jKmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63509C02180;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] Driver for Apple Z2 touchscreens.
Date: Wed, 15 Jan 2025 23:46:04 +0100
Message-Id: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKw6iGcC/13MQQ6CMBCF4auQrq3pTFtAV97DuIBpgSYipjWNS
 ri7pQkJcflP5nszC9Y7G9i5mJm30QU3PVKoQ8FoaB695c6kZihQAaDiX+QkAFuNtW2EYenx6W3
 n3nnkeks9uPCa/CdvRlivGy9XHoELTkqSIipRCHPpx8bdjzSNbOUR96TOBBOpSiJ9atsOoPonc
 iNaJJOJTESTsFprI00He7Isyw8zFY11+gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736981170; l=2269;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=Knr0caKO3pB1buKxJm1DtsDZu8Tt8G4u0XclRVx/eiY=;
 b=6zM0bJw99JTimTeE7zFuZxaj7GgP7UA/B7bfcVXNRcVFEcW8vpRFkZHU8DvH+JyEfuNnnP/QA
 yZxSuCnnfgHBrQk4A4sgXIH+x3IELa4v7W//ulON6ujaRXRUiL/cozE
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_144614_343554_51916C87 
X-CRM114-Status: GOOD (  12.32  )
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
 drivers/input/touchscreen/apple_z2.c               | 454 +++++++++++++++++++++
 9 files changed, 623 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



