Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC8D609C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgBvmCkN7lwQWDFNjduHidWraSzkuS7Yxl4Xv5Gd0uc=; b=hPcjq2S04rNOLVr3RqJCml3uGO
	R0hy0c3kea2ENjMde4CzRWhMkcLa0UGWzF1fSJetvNUhKL4/hvvBiDDKIU6qBbOOS2eKqDmCj//ZK
	nstVtBJ6rr0nZy2Zy75GsFEWLFfihrAFXz8AEfKvu2MjJ7YEbtujcQzM8U1Kt3WTojBSYq1lkzFG3
	LDWQZW7HeF13qDfh7aOUlrKRdihr8jjT0VVyYGg03UYSRZaQYh9LXWLjz+jh0u2pHKioBQV9W9RgM
	ZhhOuMoNbpEYkZ0FE+0+P1N5TlL79Q+/DBpYeH3cSADVlBbasIOwarLomQQ3+Jas4cJDl/fzhMQO6
	e+s0fVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEl7-0000000CkdT-33os;
	Wed, 27 Nov 2024 09:54:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEjB-0000000CkEP-1VlZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7089AA40E61;
	Wed, 27 Nov 2024 09:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5ADEC4CED2;
	Wed, 27 Nov 2024 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732701176;
	bh=AlyikN0YqHFLUKRJr7wvyyU0Pc9nGL/KGQvMwi2DpR8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hv2HdCilkMpUWYEU783nsyE69FxvGxLzg29TL/jAjEUUj3HV5SdcX0SQTMBfvYpGX
	 +Obp40IlsfRlFN8QAhTCI4XoiHLOhnwnsIaqZO+d0l1ZCv5lC9OqU4k+CjGGc4Z+9r
	 eXu5CjWm0tGL01ugSeyFRCpMJ1n5Gz5kRQrAlgI+UmMEQh0bwNalojj5m6lozCQ5sz
	 5VYlkgJEQvwVVzrBLR+yQa3YWehQrB9rebvynLwke0TwLaYSVN//jFpUWjkNdD2c4m
	 FfbeomSmHcKXsMHWMTL8S+H6liob07uIiYjo2NaKlAxSyhyk8xPWvXXlWh8kd22Z+n
	 cKTUEJlLAhiJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9771D609C7;
	Wed, 27 Nov 2024 09:52:55 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH RESEND 0/5] Add Apple SPI controller and spi-nor dt nodes
Date: Wed, 27 Nov 2024 10:52:27 +0100
Message-Id: <20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnS311+Xf7aYfyjSyzxHbGFn/4yrqeGzt6kzbc+d4D9h1
 48+Q4v9HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACaikcjIsGKT6ONE7uldsnP8
 dOeVS0zWTntgsj5G2ve0Mf8H7Vp1e4Z/BgdUN8RyPdA7+jW8uyb+6uUFGzml5170U6k0E4isYsl
 mAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_015257_526915_81CAEEC0 
X-CRM114-Status: GOOD (  10.73  )
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



