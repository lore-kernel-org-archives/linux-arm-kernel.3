Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC20C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUZP2z/M3VzDncW7uMnFw7wmQ7iRJKsGQFPJwU20z+E=; b=4MUHFkWasCZqRCuyifAZc2HBz+
	hLKiYRPzl8fXlcpbRUMtaaKh6Y+lPolJvNkd8EBRJIC1wc9Bpu5tKsuLgp6zraDdeknSMNYsQD+66
	WrfUOS29f73k3Sqn4AmM+pDjUNb9O1eEpVdcDRrwUdeoN1Ji3cwckiKzVgjVA+Anqkc86DtRsutGe
	UEljlo16MpYWwXmse9RR3lb88XNzArC2MUEoNCGiG9dVeX6SwdIRVnvrw3CfVs1WBIoaIlKY38mzk
	gqddt5HveVsJjbr+I38q7hxSks8/Ge3tJ2Jw/c8GKDCPp7iVgBDuVts8zbiYuzvRkPRnojSzfbMZN
	LRl8uQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvw7-00000009IgG-2qdm;
	Wed, 05 Mar 2025 21:05:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKQ-00000009D43-1ZG3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=zUZP2z/M3VzDncW7uMnFw7wmQ7iRJKsGQFPJwU20z+E=; b=WmOSonsBpZPvjSmOCpwEhr8Qpa
	Yru+qed4J1v3ACS6d3MNSdiogfD7Og2sJvjsEZCGxovMkYLcEeeXzYOD+gJGnsOgnsoefsyCsBcye
	K/nEWdHQPKhfRytJTPNK0TL2L4cE/cVc7hoIKHRzZP07qpfMcWLlYUpQxluOk7feiUsahLeTgJYxh
	O5/BqY7TLCH9EngA6Hf8sa3GqwxuInhXBNf4ck8dLKAw6oIRZbgsKiU9qaF78OUbdcLgsQw1FoUrH
	IOK1yDQO6EBHbSzQ2PXv1TSZ+sOikgfS2QCGLDG+eytxzHdBZJUbeFSYPBlj+LLUHZlwpkKSNWuIp
	ppuPW8ZQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKL-00000006AOt-3E6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 912615C6C95;
	Wed,  5 Mar 2025 20:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96FA4C4CEEA;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741206405;
	bh=kuKRm6ObXyU/LdsbRhf//+NRMZ7w2rKpz+i8gcq330U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A6SjSP42yisLd39mKYxLB5H3Hc/VDZ/YZ6iDObr1sbWkbdBb2Dle/wWbvnZegMcJf
	 VSqqkVRFgdXw6p9CEMOO1qaKxgRV6m6s8s7HgXQtShfUYhvniudiWGpjDTb4ojA2Jq
	 CPIhgV7mKVxE9wMbFpoSbSuaa3jX6O5ynK8uQL+DjChVUyK/y0pAPU83Uc5UD3CIp+
	 mQAT30QoGvQweyArwIcDyS0MCo0wySbbfDRbPmXBQBCQRY1424DooD9gZxOCtA8P1B
	 9cQKAJsb9mKtiU01FwcVWWfOSnTq00r/KUYbGIUPt83Fsmy0E//mjuoskIgfIr7vy+
	 3rW4HNIwgRyqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB8FC19F32;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Mar 2025 21:26:41 +0100
Subject: [PATCH 3/3] arm64: dts: apple: Add SPMI controller nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-spmi-v1-3-c98f561fa99f@gmail.com>
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
In-Reply-To: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741206403; l=2612;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=Q7f2vFfLkm+JIytIUuMQHuqnolBvgEBZ+1SuUnKYc0w=;
 b=JZGv20ciLYhjLTFooeMI07jT+4fp5RYKV26v46dtFR8aRmrM57U4pr1G/H44VodOpmk1x8BPk
 iwQzu0fKtk/C4HQoPI08ZwGVnguEA/bD3jvRMe4d2dM01yu365divdD
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202650_052796_29E3C386 
X-CRM114-Status: GOOD (  11.28  )
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

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add device tree entries for the SPMI controller

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 7 +++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 8 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 8 ++++++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index b1c875e692c8fb9c0af46a23568a7b0cd720141b..d544a35c8af414c583d38b040e1aa753902f1c93 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -53,6 +53,13 @@ wdt: watchdog@2922b0000 {
 		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	nub_spmi0: spmi@2920a1300 {
+		compatible = "apple,t6000-spmi", "apple,spmi";
+		reg = <0x2 0x920a1300 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+	};
+
 	sio_dart_0: iommu@39b004000 {
 		compatible = "apple,t6000-dart";
 		reg = <0x3 0x9b004000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..0f03dc808cf7c6b7d71afc79dd29d368f957f979 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -604,6 +605,13 @@ pcie_pins: pcie-pins {
 			};
 		};
 
+		nub_spmi: spmi@23d0d9300 {
+			compatible = "apple,t8103-spmi", "apple,spmi";
+			reg = <0x2 0x3d0d9300 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@23d1f0000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3d1f0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..4b3730c46c4d14a582627f69094b458ec7481da9 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -641,6 +641,14 @@ pcie_pins: pcie-pins {
 			};
 		};
 
+
+		nub_spmi: spmi@23d714000 {
+			compatible = "apple,t8112-spmi", "apple,spmi";
+			reg = <0x2 0x3d714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@23d1f0000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3d1f0000 0x0 0x4000>;

-- 
2.48.1



