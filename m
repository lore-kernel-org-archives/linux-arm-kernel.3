Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1CCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzmVtLet0CPDY0i2hk3TyhwOoH8TonI37WPrZMgrp8E=; b=UqJGtyeTty7zVZx79xtv0CMj9q
	MsbWbjZIB6N9ofCvZMtxOs9eGC0CQoLLQhVbEPsjHdF+3zvV2UYDOnapkWxAuWcXo3HoDFXUDMV+N
	/revqgAyWrAgienlXQRexGqnD/v8W0qfflIi/30dK/CW2RC/2DZ7bqfyvGy+a7LlmtL7C0N5EuD+5
	AuLggalof0CnKgd8nAIVbYdwUH8aa5H+b7+7ngnGpni5GVt4WunJnWrVtXxFZgt6MWNaGExmtYe7S
	Q5qWdEKZgzsqsE9qmg1I/EFvavURm8HX5oyvhkzvObZVlSgeDU8N9BXUeztMaKmguKWDnqArDMMe1
	XVrPdy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAs-00000009FGG-0CQw;
	Sun, 11 Oct 2026 17:17:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAq-00000009FFW-2RkQ;
	Sun, 11 Oct 2026 17:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40387601F1;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD499C2BCFC;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739041;
	bh=tHAjot59ik/pFMnrkyzLDoiJ7i/INHlUfN0wlrZOdMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o5eNqf12eZyJrfqNirHklANgxmOlovEDUCP+Y7DZ26W3eV8vb8n56We1lyPGDfxdz
	 w0XYWQCWkfa8MgGwx3MYLlB3OE3z/Xl+ZmtFgArtg9efSIB63WlypsqRcygEVsBACe
	 dafMNRue5T2VMpDO/apGsakpEQbqCFQU1VI0PvU43dc07hx9L+wUVemdXLxtsDuCPe
	 1WXEWaPPJXrOuo0MBQze/agUf4TGFp37TJyhiNlytVgqKtFjxiQ3kM3LsRksXPIXIQ
	 vsljKtsvBRhHh0os2R3o4nQ+5fyi98hXyNIADoQjWOp8aSB2n1PkeVEQRH00iCaMYz
	 5SLdN15EH8fVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE3FCA9EC7;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 20:17:21 +0300
Subject: [PATCH 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC
 address from eFuse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v1-1-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1170;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R7e0aTjiNftlxIP1/5F0ydA79ruy5B9DDk0CJljLEms=;
 b=iPE8SJB5MzWCe9Yh8R9RdzmL5sAZ4DtJAaiPDPSw+ODkKm1rsEkElCljy4/M8OICurkyL48Fm
 OSJvRcEW4l5Ax8wYS0r2P5Q738SAIGM+GStXrz5erHBuJ8mpjN1BnAv
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

The vendor programs a unique factory MAC address into the SoC eFuse at
offset 0x34, which is exactly the eth_mac nvmem cell that meson-gx.dtsi
already describes.  Reference the cell from the Ethernet controller so
the kernel picks up the factory address itself instead of depending on
the bootloader to populate local-mac-address, or falling back to a
random one when it does not.

Verified on an ODROID-C2 booted with a mainline U-Boot that does not
set ethaddr: the interface comes up with the factory MAC address.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810..639b97ad5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -230,6 +230,9 @@ &ethmac {
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	nvmem-cells = <&eth_mac>;
+	nvmem-cell-names = "mac-address";
+
 	amlogic,tx-delay-ns = <2>;
 
 	mdio {

-- 
2.53.0



