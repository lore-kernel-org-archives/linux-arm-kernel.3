Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286A4C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNt4VJxJVT0g4hOPco1XTK7GaqVW8cQrpQZinq/Ex+Y=; b=UwAxTPVlt6zZV+E0nbIRRcoBMi
	3am3iG8vgkvwg/bXEt+7oxtPREelPvJXQEGifWaGDQIsRulwZE38s4MiH5pj785H81I2Z0aJ3gXBP
	TtMrtHULogFYVjBQWBmtXCSi0aQZMHlpCPLvYxh4M/SIrAviws+L4qeg1MbZpPgcDbTHue2dvYmiU
	f9XkiqB5ZxEsf0jZA29CiAmZUwiu2Zv6EKspS2rvD0odRrnqYDpD2zKfSl+FnyksuLdqesdL9GL4R
	iWpOhYvJZL9m0WcCLqfQjHO8xmhd0vqURJUlHxoYXKErFopRhK+auiLl9QrKevhCjKmtq+iCXGV8H
	+XwyoDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAOu-00000002TQI-295m;
	Wed, 26 Feb 2025 05:56:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAHV-00000002SDK-3XvZ;
	Wed, 26 Feb 2025 05:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E7E561277;
	Wed, 26 Feb 2025 05:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74477C4CEEE;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740548893;
	bh=HknlYHJ8tz+A28RZeAUK2n0RUQjxiS7iSFIcscAs29M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tCj/fUP0SNDCSgJViW6Qy3jFiDVO8NozxqMsMDEDb/r+D6pv+kX7Baa2dsLwUwMk+
	 2w/ZKpltpcxgvq6M6B34mL5MwN3duNjnOB/4bwj9kvNbrEVGX/JQKi38CyNbO2oyx1
	 oTBgmVbiDlrTnoW8VvrS3by0fEV+fW/Z8gUXu3N4pzcuR2tej52sky1iIoEE7a8q6k
	 lN9RQBNfDExqTQ7eFTICBgzFo6KlawTXy0gBAAYDFgB99almujlWeec+eFGw0RNQsd
	 vSSjlQcAYSy0FFyeGdVDYBroxTxoAD1KpDaLUbAcuUzkj2JETHbnBo5Nbi6/QZPUD2
	 OWatR73R/JfBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668DCC021B8;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 26 Feb 2025 13:47:54 +0800
Subject: [PATCH v2 3/4] arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-irqchip-gpio-a4-a5-v2-3-c55b1050cb55@amlogic.com>
References: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
In-Reply-To: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740548891; l=1112;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Z5iS0U/t0eDJi8p3yWZRKRxB4HUB3kbspYJzuBGUEvY=;
 b=qWhlHeVp5HdIvXGNlrBtimBUO1/Uvp5eGfppGUfVjw3u3jRfq8lbOlIDWbAy8eANT2OgbqiSX
 M/3/ruD6MI+BllMEliN7maoIfv4Vw7kbPjb2Y2BNAftCp0u4cbRQzIw
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add GPIO interrupt controller device.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a06838552f21 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -48,3 +48,24 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a4-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+
+	gpio_ao_intc: interrupt-controller@8e72c {
+		compatible = "amlogic,a4-gpio-ao-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x8e72c 0x0 0x0c>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts = <140 141>;
+	};
+};

-- 
2.37.1



