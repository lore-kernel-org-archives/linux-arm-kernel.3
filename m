Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E6EE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgBvmCkN7lwQWDFNjduHidWraSzkuS7Yxl4Xv5Gd0uc=; b=fCz2XkBRi6/rIVHtsza9qOeqLo
	9bGRAxn9DamQOnB4w5kbgksb6flkCwDugRxzxmcWsMhgLdcAj+wE1fzyze+DUDf/pceOnx33visPO
	aQNA5TfsATWWO+fiMD3qYYaQYcUwMfNreZkHy/YCGtVPu6OmTalWSNRsUCTGMNhAJvKGKlGu7SM9J
	LtbyNVFNNvgrolyX6euENqR16C2Ma6cHINnFXXQtenib5XvcSBEEA0UoPOVNNNV3ij1jH8zWeS+Jn
	+ZLUbnCl2xuMKfoylvpHxDzVcTMUlE9LffbZo6ZfVocBAhxgqMNnMP1t53hMLFhG6FCQk/OFG3/Ju
	od234bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CVK-00000009bG4-3LFe;
	Sat, 02 Nov 2024 11:41:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COf-00000009aA9-02WP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 679F9A407C9;
	Sat,  2 Nov 2024 11:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78259C4CEC3;
	Sat,  2 Nov 2024 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730547263;
	bh=AlyikN0YqHFLUKRJr7wvyyU0Pc9nGL/KGQvMwi2DpR8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aqcn2SvEOY8pjHxeJQvbs0T0x9E4CZ5aOvixMOvSwO6OF0V9x6NJRIFkO8TeoYw+T
	 TeOQSO2Bcu9cGPM8N24HXyS58gqXN9LneA5Kj7TJWtA5BADi+Du3M58J0SDoji8nmf
	 2GHwSc0mwZiAUdMKVxn9AC3nG3YJgRPNa82dg1e7yg6LZHzzzLwIkXxqtIrYJPMhmx
	 y/KIlo7nCJMfy5KcdOlMBHBjEbONP+2Vp9r6xXgqL3tx1ai2lWxifGyW7cK91BIRE1
	 aVah0cFrAZMRr5maXf714GB6YhPCUlxkLK80yWfPOLMbi9JAOjuiByOFUMdSSkKl9T
	 3n/wuRjdPQKtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EAFE677FA;
	Sat,  2 Nov 2024 11:34:23 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH 0/5] Add Apple SPI controller and spi-nor dt nodes
Date: Sat, 02 Nov 2024 12:34:19 +0100
Message-Id: <20241102-asahi-spi-dt-v1-0-7ac44c0a88f9@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsOJmcC/x3MMQqAMAxA0atIZgOmtiBeRRxaGzWLlkZEkN7d4
 viG/19QzsIKY/NC5ltUzqOC2gaW3R8bo8RqMJ2xRB2hV78LahKMF7rBWBcCRd8z1CRlXuX5d9N
 cygfIQSgXXgAAAA==
X-Change-ID: 20241101-asahi-spi-dt-58245bb1da3e
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=AlyikN0YqHFLUKRJr7wvyyU0Pc9nGL/KGQvMwi2DpR8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnQ1PluWEzef/NdxaGN8YLhjclhqcPQNK0uhqR81g4/Ot
 PBl3qjbUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCIbjjAyvHscZHtPhnfvJbvG
 153Wme9P3Evgl1y/YuuXwOp5rBpxcxn+B7XsFrA5OfWveJ32XBGGqNbL0ZXzl05hkLLV/p3GeS+
 EEQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_043425_265270_F2217D69 
X-CRM114-Status: GOOD (  10.52  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds SPI controller and SPI NOR flash device nodes to the
man Apple silicon SoC dts files. Only the subset of used SPI controllers
is added. Five SPI controllers exists according to pmgr ADT data but the
commits only add controllers found in use on any of the devices. The
parameters for the missing nodes are guessable but there's no point in
adding them since no further M1 or M2 devices are expected.
Together with controller nodes the first SPI device is added. All Apple
silicon devices connect a SPI NOR flash to spi1. This holds Apple's 1st
stage bootloader, firmwares, platform and machine specific config data
and a writeable key-value store (nvram). Expose only the nvram as mtd
partition since it has use beyond exploring the content. Tools from
asahi-nvram [1] can modify the (default) boot configuration
(asahi-bless), read Bluetooth sync keys (asahi-btsync) and read and
write arbitrary keys (asahi-nvram).

Devicetree bindings are included in the driver series. Last version at
https://lore.kernel.org/linux-devicetree/20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net/

This series passes `make CHECK_DTBS=1 dtbs` with the spi bindings except
for "local-mac-address" for the Bluetooth device (I need get back to
this).

[1] https://github.com/WhatAmISupposedToPutHere/asahi-nvram/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (1):
      arm64: dts: apple: t8103: Fix spi4 power domain sort order

Janne Grunau (4):
      arm64: dts: apple: t8103: Add spi controller nodes
      arm64: dts: apple: t8112: Add spi controller nodes
      arm64: dts: apple: t600x: Add spi controller nodes
      arm64: dts: apple: Add SPI NOR nvram partition to all devices

 arch/arm64/boot/dts/apple/spi1-nvram.dtsi      | 39 +++++++++++++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi    |  7 +++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      | 28 +++++++++++
 arch/arm64/boot/dts/apple/t600x-gpio-pins.dtsi | 14 ++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 +
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      |  2 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      |  2 +
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi      | 18 +++----
 arch/arm64/boot/dts/apple/t8103.dtsi           | 68 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      |  2 +
 arch/arm64/boot/dts/apple/t8112.dtsi           | 44 ++++++++++++++++-
 11 files changed, 216 insertions(+), 10 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241101-asahi-spi-dt-58245bb1da3e

Best regards,
-- 
Janne Grunau <j@jannau.net>



