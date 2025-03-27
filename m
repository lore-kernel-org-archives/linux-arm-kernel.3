Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C46AC36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0ZPvbEX5oIac0KAWj+UHOagnYaNlDgXKH6Ic5pW24Y=; b=gegA1+b6ZXSS1Z5GEeO9ztetik
	Dsf6wG2JPQM9Bk2feWAvBE4RYnl6Ae73s8c6a4sM2p3VeTKtTHSlTBFwgdhhNAXw6MLj7NzmM88Lq
	aYxO2w8HBZyMizIqMlCKIL5TkwbglRh4kuyrrjdchBScnaHqJDHk3Dq05DGFsgxJPs1PVThkq5ynA
	VkSrSJWGwd9OnxjK81JtaQ3R82YKuQrDKNFtHiOTQgPpdJgOSPT1CBsLq7M8rCUIGBD73Zkc9gUw3
	+P+xD3WkNXiEhncza4OfvL/VhW+0LLCD8EgY+ARliBMBqtZdL3fhtQ4SOVEpjYEMlYmkEcN1f3Qal
	UW2HHItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoaR-0000000BGR3-3ro7;
	Thu, 27 Mar 2025 14:52:04 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQj-0000000BEll-2aCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086521; x=1774622521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K0ZPvbEX5oIac0KAWj+UHOagnYaNlDgXKH6Ic5pW24Y=;
  b=AKRR4wRHhaVl+uDcAdrSTkduzaoOlls4MU7FYhbK4bWgmrJmsYfNFub6
   z0l3FfYXfWw+0vf70wOiX4yVOZ2Xdgl8VeAEel7+Uc9822QKq1xB26m1q
   cLLZZnCZWMVSdSt+eu/QQob6PrkZ/jWX98Uj/OBLvlE9+TKhetPj9GkTm
   Tn3TG1VQQUgaAex9NmSElW5EmKLBa87x2I7xrkO+0zErYb3MFM8ImBVfd
   Pcv2lQNu5WoAcRXoLWf2FivWORdYEF+lAE+2Vr3LTOWhsJEwQxybNST18
   Y/Lc85ajIJucBxb90GIGIkpr4+TZ1qU1YaOGBAAFkPBslpVaBGhznnX41
   g==;
X-CSE-ConnectionGUID: atJQoWbkQNSyFBHHfxh6zw==
X-CSE-MsgGUID: oHpKk3eWRmS5BgUHSst1Lw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199520"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:00 +0100
X-CheckPoint: {67E563B8-2A-DC4DC9A0-F4F29281}
X-MAIL-CPID: C949553AC5661CB4E0C7C2A4FD560C8D_0
X-Control-Analysis: str=0001.0A00639C.67E563B4.0065,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA2A716C181;
	Thu, 27 Mar 2025 15:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ZPvbEX5oIac0KAWj+UHOagnYaNlDgXKH6Ic5pW24Y=;
	b=RABhvT7jP2rpdyFNmmUNK8+a7oL0n24/QTCUZ+uyEvqHvvsb14bzt6qiPlryRpxe0Qt/lN
	23aZ0GGGcVMTgqE3KorHpSQYNU575QJsfEU/oluATb6yCJF15nAd8ulik7q6/tB09r8yWM
	qqnuiLfTjKCMEuBJHG0VRheqiJB7fihp7Kwu/SeRRMwtnlOoAKbMFzXYo5IDsFfpjEILge
	kNxgsiGfzCdml0rrtCwGPj2+mOB42494gFaPLNcOEOU3JD1O9kFIO6agDMsTtUOuXDBlil
	YrnNnve2e/DYmF1bADftSkteowbOPnTqBEisqLKuaQJ6q4Uy79llonoXkMkOUg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
Date: Thu, 27 Mar 2025 15:41:10 +0100
Message-ID: <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074201_954844_E43F0F87 
X-CRM114-Status: GOOD (  14.62  )
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

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
accordingly. Add the missing power supply as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 225a7665b8ad1..7f96de6f80224 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-twr.dtb
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..e9708f3c67403
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&lvds_encoder_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&lvds_encoder {
+	status = "okay";
+};
+
+&lvds_encoder_in {
+	remote-endpoint = <&dcu_out>;
+};
+
+&lvds_encoder_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_encoder_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 27a55fa638128..80dae0c09542d 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -147,6 +147,7 @@ hdmi_in: endpoint {
 	display: panel {
 		backlight = <&backlight_dcu>;
 		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
 		status = "disabled";
 
 		port {
-- 
2.43.0


